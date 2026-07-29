---
layout: default
title: Troubleshooting common issues
url: /troubleshooting
previous: /bundler_plugins
next: /rubygems_tls_ssl_troubleshooting_guide
---

<em class="text-neutral-600">What to do when a gem fails to build, dependencies will not resolve, or you are not sure what is broken.</em>

Native extension build failures
-------------------------------

Some gems compile C code during installation. When that compilation fails, `gem install` and `bundle install` stop with an error like "Failed to build gem native extension". The error output includes the path to a `mkmf.log` file. Read it first. It records every check the build ran and shows which compiler or header was missing.

The most common cause is a missing compiler toolchain. Install it with your system's package manager:

    # macOS
    xcode-select --install

    # Debian, Ubuntu
    apt-get install build-essential ruby-dev

    # Fedora
    dnf install ruby-devel gcc make

    # Alpine
    apk add build-base ruby-dev

The next most common cause is a missing library header. A gem that wraps a system library needs that library's development package, not just the runtime package. For example, the `pg` gem needs the libpq development package, such as `libpq-dev` on Debian and Ubuntu.

If the library is installed in a location the build cannot find, pass build flags to the gem installer after a `--` separator:

    gem install pg -- --with-pg-config=/path/to/pg_config

To make Bundler pass the same flags every time it installs a particular gem, store them in its configuration:

    bundle config set --global build.mysql --with-mysql-config=/usr/local/mysql/bin/mysql_config

Many popular gems ship precompiled platform gems, so on common platforms no compilation happens at all. If you hit a build failure, check whether a newer version of the gem provides a precompiled binary for your platform. If you are a gem author who wants to ship extensions, see [Gems with Extensions](/gems-with-extensions).

Dependency resolution conflicts
-------------------------------

When no set of gem versions satisfies every requirement in your Gemfile and lockfile, Bundler fails with an error reporting that it could not find compatible versions. The error lists the conflicting requirement chains. Each chain shows which gem in your Gemfile pulled in which dependency, with the version constraint it declared. Follow the chains to find the two constraints that cannot both hold.

Work through fixes in this order:

1. Update just the gem you were changing with `bundle update <gem>`. This keeps the rest of the lockfile untouched.
2. If that updates more than you want, add `--conservative` so indirect dependencies stay at their locked versions.
3. If the conflict remains, loosen the version constraint in your Gemfile for one of the gems named in the error, then run `bundle update <gem>` again.
4. Run `bundle outdated` to see which gems have newer versions available and how far behind your lockfile is.

If your project uses a [cooldown](/cooldown), recently published versions are excluded from resolution until the window elapses, which can cause a conflict even though a compatible version exists. Pass `--cooldown 0` to bypass it for a single run.

bundle doctor
-------------

When you are not sure what is wrong, run `bundle doctor`. It checks your Gemfile and gem environment for common problems, including invalid Bundler settings, mismatched Ruby versions, mismatched platforms, uninstalled gems, and missing dependencies. If it finds issues, it prints them and exits with status 1.

For connection problems with https://rubygems.org, run `bundle doctor ssl`. It verifies your Ruby OpenSSL setup and CA certificates, then opens a test TLS connection. The `--host`, `--tls-version`, and `--verify-mode` options narrow the diagnosis. For certificate errors and how to fix them, see the [TLS/SSL troubleshooting guide](/rubygems_tls_ssl_troubleshooting_guide).

See [bundle doctor](/command-reference/bundle-doctor/) for all options.
