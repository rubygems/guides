# Upgrading to Bundler 4

We introduced breaking changes in Bundler 4 in order to improve usability, security, and maintainability of the tool. This document describes the changes that you will find when upgrading to Bundler 4, and how to prepare for them while still using Bundler 2.7.

## Bundler 4 simulation mode

In order to prepare for Bundler 4, you can easily configure Bundler 2.7 to behave exactly like Bundler 4 will behave.  To do so, you have three options:

* Set the environment variable `BUNDLE_SIMULATE_VERSION` to `4`.
* Run `bundle config set --global simulate_version 4`.
* Run `bundle config set --local simulate_version 4`.

From now on in this document we will assume that all three of these configuration options are available, but will only mention `bundle config set <option> <value>`.

The following is a summary of the changes that we introduced in Bundler 4, and why we made those changes. Some of them should be well known already by existing users, because we have been printing deprecation messages for years, but some of them are defaults that were switched in Bundler 4.

## CLI behavior changes

### Running just `bundle` to mean `bundle install` is not recommended anymore

We changed this default to make Bundler more friendly for new users. We do understand that long time users already know how Bundler works and found it useful that just `bundle` defaulted to `bundle install`.

Currently, Bundler uses `install_or_cli_help` by default for backward compatibility. This automatically uses `bundle install` or shows help depending on the context.

If you want to keep the current behavior (defaulting to `bundle install`), you can explicitly configure:

```sh
bundle config set default_cli_command install_or_cli_help --global
```

However, if you want to adopt the new behavior immediately where `bundle` only shows help, you can configure:

```sh
bundle config set default_cli_command cli_help --global
```

Please use `bundle install` explicitly in your scripts and documentation, so that everyone is clear about what is happening.

### Flags passed to `bundle install` that relied on being remembered across invocations have been removed

In particular, the `--clean`, `--deployment`, `--frozen`, `--no-prune`, `--path`, `--shebang`, `--system`, `--without`, and `--with` options to `bundle install`.

Remembering CLI options has been a source of historical confusion and bug reports, not only for beginners but also for experienced users.

A CLI tool should not behave differently across exactly the same invocations _unless_ explicitly configured to do so. This is what configuration is about after all, and things should never be silently configured without the user knowing about it.

The problem with this behavior was that very common workflows were relying on it. For example, when you ran `bundle install --without development:test` in production, those flags were persisted in the app's configuration file and further `bundle` invocations would happily ignore development and test gems.

This magic has been removed from Bundler 4, and you now explicitly need to configure it, either through environment variables, application configuration, or machine configuration. For example, with `bundle config set --local without development test`.

### `bundle viz` has been removed and extracted to a plugin.

This was the only bundler command requiring external dependencies, both an OS dependency (the `graphviz` package) and a gem dependency (the `ruby-graphviz` gem). Removing these dependencies made development easier and it was also seen by the bundler team as an opportunity to develop a bundler plugin that is officially maintained by the RubyGems team, and that users can take as a reference to develop their own plugins.

The new plugin is called `bundler-graph` and it is available at https://github.com/rubygems/bundler-grap now.

The plugin contains the same code as the old core command, the only difference being that the command is now implemented as `bundle graph` which is much easier to understand.

### The `bundle install` command no longer accepts a `--binstubs` flag.

The `--binstubs` option has been removed from `bundle install` and replaced with the `bundle binstubs` command.

The `--binstubs` flag would create binstubs for all executables present inside the gems in the project. This was hardly useful since most users only use a subset of all the binstubs available to them. Also, it would force the introduction of a bunch of most likely unused files into source control. Because of this, binstubs now must be created and checked into version control individually.

If you still want to create binstubs for all gems, you can run:

```sh
bundle binstubs --all
```

### The `bundle inject` command has been replaced with `bundle add`

We believe the new command fits the user's mental model better and it supports a wider set of use cases.

The interface supported by `bundle inject` works exactly the same in `bundle add`, so it should be easy to migrate to the new command.

## Gemfile and lockfile behavior changes

### Bundler includes checksums in new lockfiles by default

We shipped this security feature and turned it on by default, so that everyone benefits from the extra security assurances. So whenever you create a new lockfile, Bundler now includes a CHECKSUMS section.

Bundler will not automatically add a CHECKSUMS section to existing lockfiles, though, unless explicitly requested through `bundle lock --add-checksums`.

### Strict source pinning in Gemfile is enforced by default

In Bundler 4, the source for every dependency is now unambiguously defined, and Bundler refuses to run otherwise.

#### Multiple global Gemfile sources are no longer supported.

Instead of something like this:

```ruby
source "https://main_source"
source "https://another_source"

gem "dependency1"
gem "dependency2"
```

do something like this:

```ruby
source "https://main_source"

gem "dependency1"

source "https://another_source" do
  gem "dependency2"
end
```

#### Global `path` and `git` sources are no longer supported.

Instead of something like this:

```ruby
path "/my/path/with/gems"
git "https://my_git_repo_with_gems"

gem "dependency1"
gem "dependency2"
```

do something like this:

```ruby
gem "dependency1", path: "/my/path/with/gems"
gem "dependency2", git: "https://my_git_repo_with_gems"
```

or use the block forms if you have multiple gems for each source and you want to be a bit DRYer:

```ruby
path "/my/path/with/gems" do
  # gem "dependency1"
  # ...
  # gem "dependencyn"
end

git "https://my_git_repo_with_gems" do
  # gem "dependency1"
  # ...
  # gem "dependencyn"
end
```

## Cache behavior changes

### Git and Path gems are included in `vendor/cache` by default

If you have a `vendor/cache` directory (to support offline scenarios, for example), Bundler now includes gems from `path` and `git` sources in there.

We're unsure why these gems were treated specially so we'll start caching them normally.

### Bundler uses cached local data if available when network issues are found during resolution

Just trying to provide a more resilient behavior here.

## API behavior changes

### `Bundler.clean_env`, `Bundler.with_clean_env`, `Bundler.clean_system`, and `Bundler.clean_exec` have been removed

All of these helpers ultimately used `Bundler.clean_env` under the hood, which made sure all bundler-related environment variables were removed inside the block it yields.

After quite a lot of user reports, we noticed that users don't usually want this but instead want the bundler environment as it was before the current process was started. Thus, `Bundler.with_original_env`, `Bundler.original_system`, and `Bundler.original_exec` were born. They all use the new `Bundler.original_env` under the hood.

There are however some specific cases where the good old `Bundler.clean_env` behavior can be useful. For example, when testing Rails generators, you really want an environment where `bundler` is out of the picture. This is why we decided to keep the old behavior under a new more clear name, because we figured the word "clean" was too ambiguous. So we introduced `Bundler.unbundled_env`, `Bundler.with_unbundled_env`, `Bundler.unbundled_system`, and `Bundler.unbundled_exec`.

### `Bundler.environment` has been deprecated in favor of `Bundler.load`.

We're not sure how people might be using this directly but we removed the `Bundler::Environment` class which was instantiated by `Bundler.environment` since we realized the `Bundler::Runtime` class was the same thing. `Bundler.environment` now delegates to `Bundler.load`, which holds the reference to the `Bundler::Runtime`.

### Removed public methods of `Bundler::SpecSet`

The following public methods of `Bundler::SpecSet` have been removed with no replacement:

* `SpecSet#-`
* `SpecSet#<<`

### `SpecSet#for` always implicitly performs validation

`SpecSet#for` received a `check` parameter, but that's no longer used and deprecated. Please remove this parameter.

### `CurrentRuby#maglev?` was removed with no replacement.

Please use the built-in Ruby `RUBY_ENGINE` constant to check the Ruby implementation you are running on.

### `Bundler.rubygems.all_specs` has been removed

Please use `Bundler.rubygems.installed_specs` instead.

## Other notable changes

### Deployment helpers for `vlad` and `capistrano` have been removed.

These were natural deprecations since the `vlad` tool has had no activity for years whereas `capistrano` 3 has built-in Bundler integration in the form of the `capistrano-bundler` gem, and everyone using Capistrano 3 should already be using that instead. If for some reason, you are still using Capistrano 2, feel free to copy the Capistrano tasks out of the Bundler 2 file `lib/bundler/deployment.rb` and put them into your app.

In general, we don't want to maintain integrations for every deployment system out there, so that's why we removed these.
