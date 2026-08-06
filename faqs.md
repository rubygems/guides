---
layout: default
title: Frequently Asked Questions
url: /faqs
previous: /bundler_known_plugins
next: /glossary
redirect_from:
  - /faq/
  - /bundler_2_upgrade/
---

<em class="text-neutral-600">More of the "why" and "wtf" than "how".</em>

* [RubyGems FAQ](#rubygems-faq)
* [Bundler FAQ](#bundler-faq)

RubyGems FAQ
============

Short answers to questions that come up repeatedly. Most topics are covered in
more depth elsewhere in these guides:

* Where gems are installed, and how `require` finds them:
  [Where gems are installed and how they load](/gem-installation-and-loading)
* Failed installations and native extension build errors:
  [Troubleshooting common issues](/troubleshooting)
* Updating RubyGems and Bundler: [Installation](/installation)
* SSL certificate errors:
  [TLS/SSL troubleshooting](/rubygems_tls_ssl_troubleshooting_guide)

Questions answered on this page:

* [I installed gems with `--user-install` and their commands are not available](#i-installed-gems-with---user-install-and-their-commands-are-not-available)
* [How can I trust Gem code that's automatically downloaded?](#how-can-i-trust-gem-code-thats-automatically-downloaded)
* [Why does `require 'some-gem'` fail?](#why-does-require-some-gem-fail)
* [Why does require return false when loading a file from a gem?](#why-does-require-return-false-when-loading-a-file-from-a-gem)
* [How can I use a different gem version on the command line?](#how-can-i-use-a-different-gem-version-on-the-command-line)

I installed gems with `--user-install` and their commands are not available
---------------------------------------------------------------------------

`--user-install` puts gems in a directory under your home directory, such as
`~/.gem/ruby/3.4.0`, and their executables in the `bin` directory below it.
That `bin` directory is not on your `PATH` by default. Add it, for example in
`~/.bashrc`:

    if which ruby >/dev/null && which gem >/dev/null; then
        PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
    fi

Then restart your shell. See [Executables and
PATH](/gem-installation-and-loading#executables-and-path) for how RubyGems
installs executables.

How can I trust Gem code that's automatically downloaded?
---------------------------------------------------------

The same way you can trust any other code you install from the net: ultimately,
you can't. You are responsible for knowing the source of the gems that you are
using. In a setting where security is critical, you should only use known-good
gems, and possibly perform your own security audit on the gem code.

The [Security](/security) guide covers the protections rubygems.org provides,
including checksums, multi-factor authentication for publishers, and gem
signing.

Why does `require 'some-gem'` fail?
-----------------------------------

The name of a gem and the name of the file you require are not always the
same. Check which files the gem actually ships:

    $ ruby -e 'require "RedCloth"'
    -e:1:in 'Kernel#require': cannot load such file -- RedCloth (LoadError)
    $ gem contents --no-prefix RedCloth | grep lib
    lib/redcloth/version.rb
    lib/redcloth.rb
    $ ruby -e 'require "redcloth"'
    $ # success!

If you are requiring the correct file and it still fails, `gem` and `ruby` may
belong to different Ruby installations. Compare `which ruby` with the `RUBY
EXECUTABLE` line in `gem env`, and check that your version manager selects the
Ruby you expect. See [How require finds a
gem](/gem-installation-and-loading#how-require-finds-a-gem) for the loading
mechanism, and [Troubleshooting](/troubleshooting) if the gem failed to
install in the first place.

Why does require return false when loading a file from a gem?
-------------------------------------------------------------

A false return from `require` is not an error. It means the file was already
loaded, so `require` had nothing to do. This commonly happens when another
file, or RubyGems itself while activating the gem, loaded it first.

How can I use a different gem version on the command line?
----------------------------------------------------------

If you have multiple versions of a gem installed, you can pick the version of
its executable with an underscore argument. For example, with two versions of
Rails installed:

    $ rails _7.1.5_ new app

This runs the `rails` command from exactly that version instead of the newest
installed one.

Bundler FAQ
===========

### Why Can't I Just Specify Only `=` Dependencies?

**Q:** I understand the value of locking my gems down to specific versions,
but why can't I just specify `=` versions for all my dependencies in the
`Gemfile` and forget about the `Gemfile.lock`?

**A:** Your dependencies have dependencies of their own, and those are not
declared with `=`, so `=` requirements in your `Gemfile` alone cannot pin the
whole dependency graph. The `Gemfile.lock` records the exact version of every
gem in the graph, while loose requirements in the `Gemfile` (such as
`nokogiri ~> 1.4.2`) let you run `bundle update nokogiri` to update just one
gem when you choose to. See [How dependency resolution
works](/dependency-resolution) and [Gemfile.lock](/gemfile-lock).

### Why Can't I Just Submodule Everything?

**Q:** Why can't I just get the gems I need, stick them in submodules, and put
each submodule on the load path?

**A:** You would be resolving the dependency graph by hand, including
dependencies of dependencies, and redoing that work for every update. Worse,
you would get no feedback about version conflicts, only subtle runtime errors
when a gem calls a method that does not exist in the version you picked.
Dependency resolution is exactly the problem Bundler automates. See [How
dependency resolution works](/dependency-resolution).

### Why Is Bundler Downloading Gems From `--without` Groups?

**Q:** I excluded the `:production` group, for example with
`bundle config set --local without production`, and Bundler still downloads
the gems in it. Why?

**A:** `Gemfile.lock` must contain exact versions of every dependency in your
`Gemfile`, regardless of groups. If excluded groups were left out of
resolution, deploying to production could change your whole dependency set,
and a conflict between a production-only gem and the rest of your bundle
would only surface at deployment time. Bundler therefore resolves and
downloads all groups, but only installs the ones you asked for. See
[Groups](/groups).

### I Have a C Extension That Requires Special Flags to Install

**Q**: I have a gem with a C extension that needs special flags to compile.
How can I pass these flags into the installation process?

**A**: Use `bundle config` to store build flags for that gem:

~~~
$ bundle config set --global build.mysql2 --with-mysql-config=/usr/local/mysql/bin/mysql_config
~~~

Bundler stores this in `~/.bundle/config` and applies it to every following
`bundle install`. See [Gems with extensions](/gems-with-extensions) for how
extensions are built, and [Troubleshooting](/troubleshooting) for diagnosing
build failures.

### I Do Not Have an Internet Connection and Bundler Keeps Trying to Connect to the Gem Server

**Q**: I do not have an internet connection but I have installed the gem before.
How do I get bundler to use my local gem cache and not connect to the gem server?

**A**: Use the `--local` flag, which tells Bundler to use the local gem cache
instead of reaching out to the remote gem server:

~~~
$ bundle install --local
~~~

You can populate that cache ahead of time with `bundle cache`.

### Bundling From RubyGems is Really Slow

**Q**: When I bundle from RubyGems.org, it is really slow. Is there anything I
can do to make it faster?

**A**: First, make sure you are on a recent version of Bundler, which
downloads gem metadata incrementally and installs gems in parallel. See
[Updating Bundler](/installation#updating-bundler). If it is still slow, the
bottleneck is usually the network or native extension compilation, not
Bundler itself.

### Using Gemfiles inside gems

**Q**: What happens if I put a `Gemfile` in my gem?

**A**: When someone installs your gem, the `Gemfile` and `Gemfile.lock` are
completely ignored, even if you include them in the `.gem` file you upload to
rubygems.org. A `Gemfile` inside a gem only serves the developers of that
gem, to install development and test dependencies. Read more in [Bundler in
gems](/rubygems) and [Make your own gem](/make-your-own-gem/).

**Q**: Should I commit my `Gemfile.lock` when writing a gem?

**A**: No. Applications should always commit their lockfile, but for a gem
the tradeoff points the other way. Bundler ignores the lockfile when your
gem is installed as a dependency, and locking your own development
environment narrows the range of dependency versions your tests actually
exercise. Add `lockfile false` to the `Gemfile` (or pass `--no-lock` to
`bundle install`) so no lockfile is generated. See [Dependency
management](/dependency_management) for the reasoning.

**Q**: Doesn't that expose contributors to breakage from new dependency
releases?

**A**: Yes, and that early signal is the point. Fresh checkouts, including
CI, resolve to the latest versions your constraints allow, so an
incompatible release surfaces immediately, before your users hit the same
resolution. When a bad release blocks work, add a temporary pin to the
`Gemfile` until the incompatibility is fixed.

### Why Don't Git Gems Show Up in `gem list`?

**Q**: I added a gem with a `:git` source in my `Gemfile`, but it doesn't
appear in `gem list` and its executables are not in my PATH. Where did it go?

**A**: Bundler installs git gems into a separate internal directory, not into
the same location as gems installed from RubyGems.org. This means they will
not appear in `gem list` output, and their executables will not be available
in the shell PATH directly.

To run executables from git gems, use `bundle exec`. To check which git gems
are installed in your bundle, run `bundle list`.

### Why Can't I Use Different Versions of a Gem in Different Groups?

**Q**: I want to use one version of a gem in development and a different
version in production. Can I specify different versions in different groups?

**A**: No. Bundler resolves a single version for each gem across all groups
and all platforms. This is by design. `Gemfile.lock` must contain one
resolved version per gem so that every environment uses the same dependency
set. If Bundler allowed different versions per group, installing in one
environment could silently change which version of a gem you get in another,
defeating the purpose of the lockfile.
