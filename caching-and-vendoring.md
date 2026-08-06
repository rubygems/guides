---
layout: default
title: Caching and vendoring
url: /caching-and-vendoring
previous: /platforms
next: /default-gems-and-bundled-gems
---

<em class="text-neutral-600">The caches RubyGems and Bundler keep on your machine, and how to vendor an application's gems for installs that need no network.</em>

Every gem you install is downloaded once and remembered. RubyGems keeps the downloaded `.gem` files next to the installed gems, Bundler adds a per-user cache of its own, and `bundle cache` copies an application's whole dependency set into the repository so it can be shipped with the code. This page maps out where these caches live, how to install from them without network access, and how to clean them up.

The gem download cache
----------------------

When `gem install` or `bundle install` downloads a gem, the original `.gem` file is kept after its contents are unpacked. It sits in the `cache/` directory of the gem repository described in [Where gems are installed and how they load](/gem-installation-and-loading):

    $ ls "$(gem env gemdir)/cache"
    ...
    rack-3.2.2.gem
    rake-13.4.2.gem
    ...

Each gem repository has its own `cache/` directory. When Bundler installs into an application-local path such as `vendor/bundle`, the cache is inside that path, at `vendor/bundle/ruby/3.4.0/cache` for example. Installing a version that is already in the cache reuses the cached file instead of downloading it again.

These files exist purely to save a download. Deleting one costs nothing except a re-download the next time that exact version is installed.

Bundler's user-level cache
--------------------------

Bundler also keeps a cache that belongs to you rather than to any application. It defaults to `~/.bundle/cache` and can be moved with the `BUNDLE_USER_CACHE` environment variable. Bundler always stores [compact index](/rubygems-org-compact-index-api) data there, the catalog of gem names and versions it fetches from RubyGems.org during [dependency resolution](/dependency-resolution). The catalog updates incrementally, which is why resolving against RubyGems.org is fast after the first run.

Downloaded gems can be cached at the user level too, but only if you opt in:

    bundle config set global_gem_cache true

With this setting, Bundler saves every downloaded `.gem` file and every compiled native extension in the user-level cache, keyed by the source it came from. This pays off when you keep many applications with separate install paths. Each application still gets its own copy of the installed gems, but a gem version is downloaded and compiled only once per user. See `global_gem_cache` in [bundle config](/command-reference/bundle-config/).

Vendoring gems with bundle cache
--------------------------------

The caches above are machine-local conveniences. `bundle cache` is different in kind. It copies every `.gem` file the application needs into `vendor/cache`, inside the application itself:

    $ bundle cache
    Updating files in vendor/cache
      * rack-3.2.2.gem
      * rake-13.4.2.gem

From then on, `bundle install` prefers the files in `vendor/cache` over downloading from RubyGems.org. Since Bundler 4, [git and path dependencies](/git) are cached as well, so the directory covers the whole `Gemfile`. Setting `cache_all` to `false` restricts it to ordinary gems again.

By default the command caches gems for your current platform only. If the [lockfile covers several platforms](/platforms), pass `--all-platforms` to cache the gems for all of them, which is what you want when the cache is built on macOS and consumed on Linux. `bundle cache` also installs the gems as a side effect, and `--no-install` skips that. The full option list is in [bundle cache](/command-reference/bundle-cache/).

Should you commit vendor/cache?
-------------------------------

Committing `vendor/cache` means a checkout of your repository contains everything needed to run `bundle install` with no network at all. Deploys stop depending on RubyGems.org being reachable, and the exact bytes of every dependency are recorded alongside the code that uses them.

The cost is repository size. Every cached gem, and every updated version of it, stays in your version control history forever. For most applications a committed `Gemfile.lock` already makes installs reproducible, as described in [How Gemfile.lock works](/gemfile-lock), so committing the cache is optional and most teams skip it. It earns its place when deploy targets have no network access or when you must be able to rebuild the application without any external service.

Installing offline
------------------

With a populated `vendor/cache`, or with the needed versions already in the gem download cache, Bundler can install without touching the network:

    bundle install --local

There is one caveat. During a normal install Bundler checks RubyGems.org for a [precompiled variant](/platforms) matching your platform even when every gem is cached. `--local` skips that check, so it only picks from the gems the cache actually contains. Building the cache with `--all-platforms` on a machine of the deployment platform avoids surprises here.

Plain RubyGems can install from a local `.gem` file directly, either by path or by name with `--local` in a directory containing the file:

    $ gem install --local ./rake-13.4.2.gem
    Successfully installed rake-13.4.2

Cleaning up
-----------

Caches and gem repositories only grow, and two commands prune them. `gem cleanup` uninstalls old versions of installed gems that no other installed gem depends on, and removes their cached `.gem` files along the way. `gem cleanup -n` shows what would be removed without doing it, and the exact rules are in `gem help cleanup`.

For an application's bundle, `bundle clean` removes gems in the application's install path that the current `Gemfile.lock` no longer references. It refuses to run against gems installed to the shared system location unless you pass `--force`, because those gems may be used by other applications. `--dry-run` previews the removals. See [bundle clean](/command-reference/bundle-clean/).
