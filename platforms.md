---
layout: default
title: Platforms and native gems
url: /platforms
previous: /versioning
next: /default-gems-and-bundled-gems
---

<em class="text-neutral-600">How RubyGems names the system a gem was built for, and how precompiled native gems skip compilation at install time.</em>

Most gems are pure Ruby and install identically everywhere. Gems that include native extensions compile C or Rust code during installation, and many of them also publish precompiled binaries so that on common systems nothing is compiled at all. This page explains what a gem platform is, how the matching variant is chosen at install time, how platforms interact with `Gemfile.lock`, and how to force the source build when a binary does not suit you.

What a gem platform is
----------------------

Every published gem carries a platform. The platform `ruby` means the gem is delivered as source and installs on any system. Gems whose extensions are compiled on your machine at install time are `ruby` platform gems too. A concrete platform names the CPU architecture and operating system a prebuilt binary targets, such as `x86_64-linux-gnu`, `arm64-darwin`, or `x64-mingw-ucrt`, and the platform `java` marks builds for JRuby.

Your machine has a local platform, derived from your Ruby's build configuration:

    $ gem env platform
    ruby:arm64-darwin-27

The output lists the platforms RubyGems will install on this machine, `ruby` plus the local platform. The local platform is also available in code as `Gem::Platform.local`. A gem is only considered for installation when its platform matches one of these. The full matching rules are described in `gem help platform`.

Precompiled native gems
-----------------------

A gem that ships precompiled binaries publishes the same version number several times, once per platform. For example, [nokogiri](https://rubygems.org/gems/nokogiri) 1.19.4 exists on RubyGems.org as the source `ruby` gem, a `java` build, `arm64-darwin` and `x86_64-darwin` builds for macOS, an `x64-mingw-ucrt` build for Windows, and Linux builds for three CPU architectures in both `-gnu` and `-musl` variants.

You do not choose among them. `gem install` and `bundle install` pick the variant matching your local platform automatically, and fall back to the `ruby` gem when no binary matches. You can watch the choice with `gem fetch`, which downloads a gem without installing it:

    $ gem fetch nokogiri
    Downloaded nokogiri-1.19.4-arm64-darwin

When a binary matches, installation is fast and needs no compiler. When only the `ruby` gem matches, the extension is compiled on your machine, which requires a working toolchain and the libraries the gem wraps. If that build fails, see [Troubleshooting](/troubleshooting#native-extension-build-failures). If you maintain a gem with an extension and want to publish your own precompiled binaries, see [Gems with Extensions](/gems-with-extensions).

Linux and musl
--------------

Linux platform names end with the C library the binary was linked against. `x86_64-linux-gnu` targets glibc systems, which covers most distributions, and `x86_64-linux-musl` targets musl systems such as Alpine. A `-gnu` binary is never selected on a musl system. If a gem publishes no `-musl` build, a musl system falls back to the `ruby` gem and compiles the extension.

Older gem releases used the bare name `x86_64-linux` instead. A bare Linux platform matches both glibc and musl systems, so such a binary installs on Alpine whether or not it can actually run there. If a precompiled gem installs but fails to load, force the source build as described [below](#forcing-the-source-build).

Platforms in Gemfile.lock
-------------------------

Bundler records the platforms a resolution covers in the `PLATFORMS` section of `Gemfile.lock` and locks the platform-specific gem versions for each. A fresh Bundler 4 lockfile for an application depending on nokogiri covers every platform the precompiled builds support:

    PLATFORMS
      aarch64-linux-gnu
      aarch64-linux-musl
      arm-linux-gnu
      arm-linux-musl
      arm64-darwin
      x86_64-darwin
      x86_64-linux-gnu
      x86_64-linux-musl

Installing on a platform the lockfile does not cover normally just works. Bundler adds the local platform, re-resolves, and updates the lockfile. In CI and production the lockfile is typically frozen, so the same situation fails instead. This is the classic error when an application is developed on macOS with an older lockfile and deployed to Linux:

    Your bundle only supports platforms ["arm64-darwin-27"] but your local platform
    is x86_64-linux. Add the current platform to the lockfile with
    `bundle lock --add-platform x86_64-linux` and try again.

The fix is what the message says. Run `bundle lock --add-platform x86_64-linux` on your development machine, commit the updated lockfile, and deploy again. The error only occurs when the `PLATFORMS` section contains neither your platform nor `ruby`, which is why it usually involves precompiled native gems. Rather than adding platforms one by one, run `bundle lock --normalize-platforms` before committing. One run adds every platform your locked gems are precompiled for, and it also strips the OS version from entries like `arm64-darwin-27` so that lockfiles generated on different machines agree. [How Gemfile.lock works](/gemfile-lock#when-to-commit-it) covers when to run it, and [bundle lock](/command-reference/bundle-lock/) documents the command.

Despite the name, the `platforms` block in a Gemfile is a different concept. Its values, such as `ruby`, `windows`, and `jruby`, group dependencies by Ruby implementation rather than naming lockfile platforms. See [the Gemfile reference](/gemfile/#PLATFORMS).

Forcing the source build
------------------------

Sometimes the precompiled binary is the wrong choice. It may misbehave on your system, or its `required_ruby_version` may exclude a Ruby that the source gem still supports. The `force_ruby_platform` setting tells Bundler to ignore your machine's platform, install only `ruby` platform gems, and compile native extensions from source:

    bundle config set --local force_ruby_platform true

To force the source build for a single gem, set the option in the Gemfile:

    gem "ffi", force_ruby_platform: true

With plain `gem install`, pick the platform explicitly instead:

    gem install nokogiri --platform ruby

See the `force_ruby_platform` entries in [bundle config](/command-reference/bundle-config/) and [the Gemfile reference](/gemfile/#FORCE_RUBY_PLATFORM).
