---
layout: default
title: Installation
url: /installation
previous: /
next: /rubygems-basics
---

<em class="text-neutral-600">How to get RubyGems and Bundler and keep them up to date.</em>

RubyGems and Bundler ship with Ruby, so installing Ruby gives you both tools. To check that they are available:

    gem --version
    bundle --version

If you do not have Ruby yet, see the [official installation guide](https://www.ruby-lang.org/en/documentation/installation/) for the options available on your platform.

Updating RubyGems
-----------------

Ruby comes with the RubyGems version that was current when that Ruby was released. To upgrade to the latest version:

    gem update --system

To upgrade to a specific version instead, pass the version number:

    gem update --system <version>

Both forms download the `rubygems-update` gem and run its `setup.rb`, so they need network access. On a machine without it, fetch the release archive from the [download page](https://rubygems.org/pages/download) elsewhere, copy it over, then unpack it and install from the unpacked directory:

    ruby setup.rb

Run `ruby setup.rb --help` for the available options.

Updating Bundler
----------------

To install the latest Bundler:

    gem install bundler

Bundler is a [default gem](/default-gems-and-bundled-gems), so every Ruby installation always contains a version of it that cannot be uninstalled. Installing a newer version does not replace the default one. Both stay available.

Which Bundler version runs
--------------------------

A project's `Gemfile.lock` records the Bundler version that created it under `BUNDLED WITH`. When you run `bundle` commands in that project, Bundler automatically switches to the recorded version if it is installed, even when a newer version is present. See [Bundler compatibility](/bundler-compatibility) for the Ruby and RubyGems versions each Bundler release supports.
