---
layout: default
title: Bundler compatibility with Ruby
description: Ruby and RubyGems requirements needed for Bundler compatibility
url: /bundler-compatibility
previous: /api-key-scopes
next: /bundler_known_plugins
---
## Bundler compatibility with Ruby & RubyGems

Bundler and RubyGems are developed in the same repository, [ruby/rubygems](https://github.com/ruby/rubygems), and every release ships them as a matching pair. Starting with the 4.0 series they share the same version number. Each Ruby release also bundles a matching pair, for example Ruby 4.0 ships RubyGems 4.0 and Bundler 4.0.

The latest Bundler release supports, at the very least, all Ruby versions that have not yet reached their End of Life date. Its minimum RubyGems version is the RubyGems that shipped with the oldest supported Ruby. RubyGems cannot be downgraded below the version a Ruby shipped with, so any supported Ruby satisfies both requirements out of the box.

The currently supported and recent Bundler series require:

| Bundler | Ruby | RubyGems |
| ------- | ---- | -------- |
| 4.0 | >= 3.2.0 | >= 3.4.1 |
| 2.7 | >= 3.2.0 | >= 3.4.1 |
| 2.6 | >= 3.1.0 | >= 3.3.3 |
| 2.5 | >= 3.0.0 | >= 3.2.3 |

Older series have reached their End of Life. If you need the exact requirements of an old release, check its version page on [rubygems.org](https://rubygems.org/gems/bundler), which lists the required Ruby and RubyGems versions.

In practice you rarely choose a Bundler version by hand. A project's `Gemfile.lock` records the version that created it under `BUNDLED WITH`, and Bundler automatically switches to that version when you run it. See [Installing Bundler](/installation) for details.
