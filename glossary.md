---
layout: default
title: Glossary
url: /glossary
previous: /faqs
next: /contributing
redirect_from:
  - /resources/
---

<em class="text-neutral-600">Definitions of the terms used throughout these guides.</em>

binstub
-------

A small wrapper script that Bundler generates into an application's `bin/` directory with `bundle binstubs GEM`. Running a binstub loads the bundle first, so the command runs against the exact gem versions in `Gemfile.lock` without needing a `bundle exec` prefix. See the [bundle binstubs reference](/command-reference/bundle-binstubs).

bundled gem
-----------

A gem that is installed automatically when you install Ruby but is not part of Ruby itself. Unlike a default gem it can be uninstalled, and when using Bundler it must be declared in the Gemfile. See [Default Gems and Bundled Gems](/default-gems-and-bundled-gems).

cooldown
--------

A Bundler setting that excludes gem versions published within the last N days from dependency resolution. Most malicious releases are detected and yanked within days of publication, so a cooldown keeps an application from installing a release before the ecosystem has had time to vet it. See [How to delay new gem versions with cooldown](/cooldown).

default gem
-----------

A gem that ships as part of every Ruby installation. It can be required without appearing in a Gemfile and cannot be uninstalled, but it can be updated independently of Ruby. See [Default Gems and Bundled Gems](/default-gems-and-bundled-gems).

dependency
----------

A gem that another gem or an application needs in order to work. Gems declare their dependencies in the gemspec and applications declare theirs in the Gemfile, and each dependency can bring dependencies of its own, forming the graph that resolution works on. See [Gemfile and gemspec](/gemfile-and-gemspec).

gem
---

A packaged Ruby library or program. Each gem has a name, a version, and a platform, and contains code, documentation, and a gemspec. See [What is a gem?](/what-is-a-gem/).

Gemfile
-------

The file that describes an application's gem environment for Bundler. It lists the gems the application uses directly, along with the sources to fetch them from. See [Gemfile and gemspec](/gemfile-and-gemspec) and the [Gemfile reference](/gemfile).

Gemfile.lock
------------

The file Bundler writes after dependency resolution, recording the exact version of every gem, direct or transitive. Later installs reuse those versions instead of resolving again, so every machine and every deploy runs the same code. Bundler maintains the file, and you never edit it by hand. See [How Gemfile.lock works](/gemfile-lock).

gemspec
-------

The manifest of a gem. It declares the gem's name, version, summary, files, and dependencies, and it is packaged into the `.gem` file that `gem build` produces. See the [Specification Reference](/specification-reference).

lockfile checksums
------------------

The `CHECKSUMS` section of `Gemfile.lock`, recording the SHA-256 digest of each packaged `.gem` file. Bundler verifies every gem against its checksum during installation, so a gem that was tampered with after the lockfile was written fails to install. See [Lockfile checksums](/security#lockfile-checksums).

native extension
----------------

Code, typically C, that is part of a gem and is compiled on the user's machine at install time, often to wrap an existing system library. Building one requires a compiler toolchain and the library's development headers. See [Gems with Extensions](/gems-with-extensions).

platform
--------

The CPU architecture, operating system type, and sometimes operating system version a gem is built for. The generic `ruby` platform means pure Ruby code that works on any platform Ruby runs on. See [What is a gem?](/what-is-a-gem/).

precompiled gem
---------------

A gem published in platform-specific variants with its native extension already compiled, so installation skips the compile step and needs no toolchain. The platforms a lockfile covers for such gems are recorded in its `PLATFORMS` section. See [How Gemfile.lock works](/gemfile-lock#platforms).

prerelease
----------

A version containing a letter, like `1.0.0.pre` or `2.0.0.rc1`, published for testing before the real release. Installers and the resolver ignore prereleases unless a requirement explicitly names one. See [Versioning and compatibility](/versioning#prerelease-versions).

requirement
-----------

One or more comparisons against a version, like `>= 1.0` or `~> 2.2`, stating which versions of a dependency are acceptable. Also called a version constraint. See [How dependency resolution works](/dependency-resolution#what-version-constraints-mean) and [Versioning and compatibility](/versioning).

resolution
----------

The process of choosing exactly one version of every gem in the dependency graph so that all requirements hold at the same time. Bundler runs it on the first `bundle install` and writes the result to `Gemfile.lock`. See [How dependency resolution works](/dependency-resolution).

source
------

A place gems are fetched from: a gem server such as RubyGems.org, a git repository, or a local directory. Sources are declared in the Gemfile, and each one gets its own block in `Gemfile.lock`. See [How Gemfile.lock works](/gemfile-lock).

trusted publishing
------------------

A way to publish gems from CI without long-lived credentials. A configured workflow authenticates with RubyGems.org using short-lived OpenID Connect tokens, so there is no API key to create, rotate, or leak. See [Trusted Publishing](/trusted-publishing).

vendoring
---------

Storing copies of an application's dependencies inside its own repository, so installs do not need to reach a remote source. `bundle cache` puts the packaged `.gem` files of the bundle into `vendor/cache`. See the [bundle cache reference](/command-reference/bundle-cache).

yank
----

Removing a published version from RubyGems.org with `gem yank`. A yanked version can no longer be installed, but the name and version number stay taken and cannot be reused. See [Removing a published gem](/removing-a-published-gem).
