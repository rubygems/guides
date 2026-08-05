---
layout: default
title: Semantic versioning and compatibility
url: /semver
previous: /gemfile-lock
next: /default-gems-and-bundled-gems
---

<em class="text-neutral-600">What a version number promises, and how RubyGems compares versions and constrains them.</em>

Every gem carries a version number, and dependency resolution runs on what those numbers mean. This page covers the semantic versioning convention, how to apply it when releasing a gem, and how to write version constraints that rely on it.

Semantic versioning
-------------------

[Semantic versioning](https://semver.org), or SemVer, gives a version number's three parts `MAJOR.MINOR.PATCH` a defined meaning:

* **PATCH** `0.0.x` changes fix bugs without changing any documented behavior.
* **MINOR** `0.x.0` changes add functionality in a backwards compatible way.
* **MAJOR** `x.0.0` changes are backwards *incompatible*. Code written against the previous major version may break.

RubyGems does not enforce any versioning policy, but SemVer is the convention the Ruby ecosystem assumes. The `~>` constraint operator only makes sense against it, and the RubyGems team urges gem authors to follow it. Not every gem does follow it strictly, so before relying on a dependency's version number, check whether its changelog matches the promise.

Two practical caveats. SemVer declares that anything may change while a project is on `0.x`, and many gems spend years there while being widely depended on. And unlike some other ecosystems, RubyGems does not special-case `0.x` in constraints, so `~> 0.4` still allows every `0.x` release from 0.4 on.

Versioning your gem
-------------------

In the layout `bundle gem` generates, the version is a single constant in `lib/<name>/version.rb` and the gemspec reads it from there. Changing that constant and releasing is the whole mechanism. The judgment is in picking which part to bump.

Bump **PATCH** for bug fixes. Bump **MINOR** for new features, and also when deprecating existing behavior with a warning. Bump **MAJOR** when removing or changing documented behavior. The friendliest cycle for your users is to deprecate in a minor release and remove in the next major, so they see warnings before anything breaks.

Breaking changes are not limited to removed methods. Changing a return value or a default, raising `required_ruby_version`, and tightening a dependency constraint all break somebody, because they can make an application that resolved and ran before stop doing so. When in doubt, treat a change as major.

A new gem conventionally starts at `0.1.0`, which is what `bundle gem` generates. Releasing `1.0.0` is the signal that the public API is stable and SemVer applies in full. One more constraint to know: a version number on [RubyGems.org](https://rubygems.org) can never be reused, and yanking a release does not free its number. A broken release is fixed by pushing a new patch version, not by replacing the old one.

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

Trailing zeros are ignored, so `1.0` and `1.0.0` are the same version. SemVer's hyphen notation is accepted but normalized, with the hyphen read as `.pre.`, so `1.0.0-rc1` becomes `1.0.0.pre.rc1`. SemVer build metadata like `1.0.0+001` is not valid in a gem version.

Constraining your dependencies
------------------------------

A version constraint states how much change you accept from a dependency. The operators and their exact semantics are covered in [How dependency resolution works](/dependency-resolution#what-version-constraints-mean). Which constraint to write depends on whether you are declaring it for an application or for a gem, a distinction covered in [Gemfile and gemspec](/gemfile-and-gemspec).

In an application's Gemfile, constraints only bound what `bundle update` may do, because the exact versions installed come from `Gemfile.lock`. See [How Gemfile.lock works](/gemfile-lock). A pessimistic constraint like `~> 8.1` is a reasonable way to say that major upgrades should be a deliberate act rather than a side effect of an update.

### Optimistic vs. pessimistic constraints

In a gemspec the stakes are different, because your constraints combine with every other gem's in your users' applications. An optimistic constraint sets only a lower bound:

    spec.add_dependency "library", ">= 2.2"

A pessimistic constraint adds an upper bound at the next incompatible release. `~> 2.2` means `>= 2.2` and `< 3.0`:

    spec.add_dependency "library", "~> 2.2"

Prefer optimistic constraints in a gemspec. You cannot predict the future, and a new major version of the dependency often leaves the parts your gem uses untouched. A pessimistic constraint in a published gem also locks the whole graph. If your gem pins `~> 2.2`, no application using your gem can move to the dependency's 3.x, even when everything would have worked. This transitive lock-in is a common problem in practice, while breakage from an optimistic constraint can be fixed in the affected application by pinning the dependency there.

Reserve `~>` in a gemspec for cases where it is genuinely warranted, such as a dependency that has already announced an incompatible change you know will break your gem.

Two details worth knowing. With only two digits given, `~> 2` allows the 2.x series and stops before 3.0, it does not mean "2 or anything newer". And requirements compose as a list, so you can combine bounds or exclude a single broken release:

    spec.add_dependency "library", ">= 2.2", "< 4.0"
    spec.add_dependency "library", ">= 2.0", "!= 2.2.1"
