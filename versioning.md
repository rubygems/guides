---
layout: default
title: Versioning and compatibility
url: /versioning
previous: /gemfile-lock
next: /default-gems-and-bundled-gems
---

<em class="text-neutral-600">What a version number can and cannot promise, and how RubyGems compares and constrains versions.</em>

Every gem carries a version number, and dependency resolution runs on what those numbers mean. A version number is a message from the gem's author about how much changed. It is not a contract, and RubyGems does not enforce one. This page covers versioning schemes and their limits, how to version your own gem, how RubyGems actually compares versions, and how to write constraints without trusting numbers more than they deserve.

Versioning schemes
------------------

RubyGems accepts any version number and attaches no meaning to its parts. What a bump signifies is decided by each gem's author.

The best known scheme is [semantic versioning](https://semver.org), or SemVer, which gives the three parts of `MAJOR.MINOR.PATCH` defined roles:

* **PATCH** `0.0.x` changes fix bugs without changing any documented behavior.
* **MINOR** `0.x.0` changes add functionality in a backwards compatible way.
* **MAJOR** `x.0.0` changes are backwards *incompatible*.

Much of the ecosystem loosely assumes this vocabulary, and the `~>` constraint operator is built around the idea that a change further to the left carries more risk. But SemVer is a communication convention, not a rule of RubyGems, and this guide does not tell you to adopt it. Read as a contract, it would require a maintainer to decide for every change whether any user's code could break, and almost every observable change breaks somebody. Nobody owes that guarantee, least of all volunteers. Well-known projects define their own schemes instead. Ruby itself releases a new minor version every Christmas and allows incompatible changes in it, and Rails documents its own scheme in which minor releases may add features and remove deprecated behavior. The variety only grows outside Ruby. Ubuntu numbers releases by date, with 24.04 meaning April 2024, a scheme known as [calendar versioning](https://calver.org). Python cuts a new 3.x every year and removes deprecated features in those releases, so its minor number carries what SemVer would call major changes. A version number tells you what a project's own policy says it tells you, nothing more.

What helps your users is not which scheme you pick but that you say what you do. Document your policy, keep a changelog, and make disruptive releases easy to spot. In the other direction, whatever scheme a dependency claims to follow, the only reliable compatibility check is running your own test suite against the new version. [Gemfile.lock](/gemfile-lock) exists so that upgrades happen when you choose to take them, not when a number changes.

Versioning your gem
-------------------

In the layout `bundle gem` generates, the version is a single constant in `lib/<name>/version.rb` and the gemspec reads it from there. Changing that constant and releasing is the whole mechanism. A new gem conventionally starts at `0.1.0`, which is what `bundle gem` generates, and `1.0.0` is widely read as a signal that the API has settled.

If you have no strong preference for a scheme, the SemVer vocabulary is what most of your users will assume by default: bump the last part for fixes, the middle part for additions, the first part for changes that can break existing code. A gentle way to deliver breaking changes, when you can afford the effort, is to deprecate with a warning in one release and remove in a later one, so users see the warning before anything breaks. How far you go in guaranteeing any of this is your call as the author.

When judging how loudly to signal a change, remember that compatibility is wider than the method list. Changing a return value or a default, raising `required_ruby_version`, and tightening a dependency constraint can all stop an application that resolved and ran before, so they deserve the same visibility as a removed API.

One hard rule does exist: a version number on [RubyGems.org](https://rubygems.org) can never be reused, and yanking a release does not free its number. A broken release is fixed by pushing a new version, not by replacing the old one.

Prerelease versions
-------------------

Any version containing a letter, like `1.0.0.pre`, `2.0.0.rc1`, or `1.5.0.beta.3`, is a prerelease version. Use one to ship a release candidate for testing before the real release:

    Gem::Specification.new do |s|
      s.name = "hola"
      s.version = "1.0.0.rc1"

Push it like any other release. It stays out of everyone's way because installers ignore prereleases unless asked. `gem install hola` installs the newest stable version, and only `gem install hola --pre` picks the release candidate. The same rule applies during dependency resolution. Bundler considers a prerelease only when a requirement explicitly names one, such as `gem "hola", ">= 1.0.0.rc1"`. See [How dependency resolution works](/dependency-resolution) for the details.

How RubyGems compares versions
------------------------------

Constraints are evaluated with `Gem::Version`, which you can probe directly:

    $ ruby -e 'puts %w[2.0.0 1.0.0 1.0.1 1.0.0.rc1 1.0.0.beta2 1.1.0.beta 1.0.0.alpha].map { |v| Gem::Version.new(v) }.sort'
    1.0.0.alpha
    1.0.0.beta2
    1.0.0.rc1
    1.0.0
    1.0.1
    1.1.0.beta
    2.0.0

A version string is split into segments at dots and at letter/digit boundaries, so `1.0.0.beta10` becomes `1, 0, 0, "beta", 10`. Numeric segments compare numerically, which is why `beta10` sorts after `beta9`. String segments compare alphabetically and always sort before numeric ones, which is why every prerelease sorts before the release it leads up to. The common identifiers happen to be alphabetical in the right order, `alpha` before `beta` before `pre` before `rc`, so sticking to them keeps a sequence of prereleases sorted as intended.

Trailing zeros are ignored, so `1.0` and `1.0.0` are the same version. A hyphen is read as `.pre.`, so SemVer-style `1.0.0-rc1` is accepted but normalized to `1.0.0.pre.rc1`. SemVer build metadata like `1.0.0+001` is not valid in a gem version.

Constraining your dependencies
------------------------------

A version constraint states how much change you accept from a dependency. The operators and their exact semantics are covered in [How dependency resolution works](/dependency-resolution#what-version-constraints-mean). Keep in mind what a constraint can actually rely on. A constraint written against version numbers encodes trust in the author's numbering, and that numbering is a courtesy, not a contract. Check a project's own policy and changelog before leaning on it, and let your lockfile and test suite do the real protecting.

In an application's Gemfile, constraints only bound what `bundle update` may do, because the exact versions installed come from `Gemfile.lock`. See [How Gemfile.lock works](/gemfile-lock). A pessimistic constraint like `~> 8.1` is a reasonable way to say that major upgrades should be a deliberate act rather than a side effect of an update.

### Optimistic vs. pessimistic constraints

In a gemspec the stakes are different, because your constraints combine with every other gem's in your users' applications. An optimistic constraint sets only a lower bound:

    spec.add_dependency "library", ">= 2.2"

A pessimistic constraint adds an upper bound at the next release the numbering scheme calls incompatible. `~> 2.2` means `>= 2.2` and `< 3.0`:

    spec.add_dependency "library", "~> 2.2"

Prefer optimistic constraints in a gemspec. You cannot predict the future, and a new major version of the dependency often leaves the parts your gem uses untouched. A pessimistic constraint in a published gem also locks the whole graph. If your gem pins `~> 2.2`, no application using your gem can move to the dependency's 3.x, even when everything would have worked. This transitive lock-in is a common problem in practice, while breakage from an optimistic constraint can be fixed in the affected application by pinning the dependency there.

Reserve `~>` in a gemspec for cases where it is genuinely warranted, such as a dependency that has already announced an incompatible change you know will break your gem.

Two details worth knowing. With only two digits given, `~> 2` allows the 2.x series and stops before 3.0, it does not mean "2 or anything newer". And requirements compose as a list, so you can combine bounds or exclude a single broken release:

    spec.add_dependency "library", ">= 2.2", "< 4.0"
    spec.add_dependency "library", ">= 2.0", "!= 2.2.1"
