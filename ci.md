---
layout: default
title: How to use Bundler in CI
url: /ci
previous: /bundler_docker_guide
next: /run-your-own-gem-server
---

<em class="text-neutral-600">How to install gems quickly and reproducibly on GitHub Actions, GitLab CI, and other CI systems.</em>

A CI job needs the same gems as your development machine, installed from scratch on every run. The recipe is the same everywhere. Cache installed gems, keyed on the `Gemfile.lock` when the repository has one, and configure Bundler through `BUNDLE_*` environment variables instead of running `bundle config` in each job.

GitHub Actions
--------------

Use the [ruby/setup-ruby](https://github.com/ruby/setup-ruby) action. With `bundler-cache: true` it runs `bundle install` for you and caches the installed gems, so you do not need a separate `gem install bundler` or `bundle install` step. When a `Gemfile.lock` is present, it installs in deployment mode, so the job fails if the lockfile is out of date instead of silently resolving new versions.

    jobs:
      test:
        runs-on: ubuntu-latest
        steps:
          - uses: actions/checkout@v7
          - uses: ruby/setup-ruby@v1
            with:
              bundler-cache: true
          - run: bundle exec rake

The `ruby-version` input can be omitted if the repository has a `.ruby-version`, `.tool-versions`, or `mise.toml` file. To test against several Ruby versions, use a matrix:

    jobs:
      test:
        strategy:
          matrix:
            ruby: ["3.3", "3.4", "4.0"]
        runs-on: ubuntu-latest
        steps:
          - uses: actions/checkout@v7
          - uses: ruby/setup-ruby@v1
            with:
              ruby-version: ${{ matrix.ruby }}
              bundler-cache: true
          - run: bundle exec rake

To test against multiple Gemfiles, set `BUNDLE_GEMFILE` in a job-level `env` block (for example from a matrix value) so that both `setup-ruby` and later steps use the same Gemfile.

GitLab CI
---------

On GitLab, install gems into the project directory and cache that path, keyed on `Gemfile.lock` so the cache is invalidated when dependencies change:

    test:
      image: ruby:4.0
      cache:
        key:
          files:
            - Gemfile.lock
        paths:
          - vendor/ruby
      script:
        - bundle config set --local path 'vendor/ruby'
        - bundle install
        - bundle exec rake

Setting `BUNDLE_PATH: vendor/ruby` and `BUNDLE_FROZEN: "true"` in the `variables` block is an equivalent alternative to the `bundle config` line, and keeps the configuration visible in one place.

Dependency bots and cooldown
----------------------------

If CI runs against pull requests opened by a dependency bot, align the bot's update delay with the [cooldown](/cooldown) configured in Bundler. Otherwise the bot proposes versions that `bundle install` refuses to resolve, or bypasses the waiting period that cooldown is meant to enforce.

On GitHub, Dependabot supports a `cooldown` block for version updates in `dependabot.yml`:

    version: 2
    updates:
      - package-ecosystem: "bundler"
        directory: "/"
        schedule:
          interval: "weekly"
        cooldown:
          default-days: 7

The `cooldown` block also accepts `semver-major-days`, `semver-minor-days`, and `semver-patch-days` to set different delays per update type, and `include` and `exclude` lists to scope which dependencies it applies to.

Renovate, which runs on both GitHub and GitLab, offers the same control through `minimumReleaseAge`, a duration string such as `"7 days"`. Set it in `renovate.json`, either at the top level or scoped to Bundler:

    {
      "packageRules": [
        {
          "matchManagers": ["bundler"],
          "minimumReleaseAge": "7 days"
        }
      ]
    }

In both cases, use the same number of days as your Bundler cooldown. See [the cooldown guide](/cooldown) for how the Bundler side works.

Publishing from CI
------------------

To release gems from a CI pipeline without long-lived API keys, see [Trusted Publishing](/trusted-publishing).
