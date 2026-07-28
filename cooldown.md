---
layout: default
title: How to delay new gem versions with cooldown
url: /cooldown
previous: /security
next: /rails
---

<em class="text-neutral-600">How to keep Bundler from resolving to gem versions published in the last few days.</em>

Most malicious gem releases are detected and yanked within days of publication. A cooldown excludes gem versions newer than a given number of days from dependency resolution, so your application never installs a release before the ecosystem has had time to vet it.

Enabling cooldown
-----------------

To enable a cooldown for every Bundler run in a project, set the number of days in Bundler's configuration:

    bundle config set cooldown 7

The setting can also come from the `BUNDLE_COOLDOWN` environment variable. For a single run, pass `--cooldown N` to `bundle install`, `bundle update`, or `bundle add`. Passing `--cooldown 0` disables cooldown for that run.

`bundle outdated` also accepts `--cooldown N`. Instead of hiding versions still inside the window, it annotates them, appending "in cooldown for Nd more days" in the prose output and "(cooldown Nd)" in the Latest column of the table form.

Per-source cooldown
-------------------

A cooldown can also be declared for an individual source in the Gemfile:

    source "https://rubygems.org", cooldown: 7

The effective cooldown for any given gem is resolved from three layers. The CLI flag takes precedence over the config setting, which takes precedence over the per-source value. The CLI flag and the config setting apply uniformly to every source, including sources declared with their own `cooldown:` value.

To keep a trusted private gem server permanently exempt while still cooling down public gems, declare it with `cooldown: 0` in the Gemfile. Note that `--cooldown N` on the command line still overrides that exemption for the run.

Trade-offs
----------

A cooldown delays every new version, including releases that fix security vulnerabilities. When you need an urgent fix before the window has elapsed, bypass the cooldown for that run with `bundle update <gem> --cooldown 0`, combined with `--conservative` to minimize changes to other gems.

Server support
--------------

Cooldown filtering depends on the gem server providing a per-version `created_at` timestamp in the v2 compact-index format. Versions without that metadata are treated as outside the cooldown window and remain resolvable. That includes older gem servers, private registries that still emit the v1 format, and historical entries that predate the v2 cutover on rubygems.org. If you rely on cooldown for supply-chain protection, confirm that your gem server emits `created_at` in its `/info/<gem>` responses.

For the full description of the setting, see the `cooldown` entry in [bundle config](/command-reference/bundle-config/).
