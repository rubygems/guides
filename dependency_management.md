---
layout: default
title: How to manage dependencies with Bundler
url: /dependency_management
previous: /using_bundler_in_applications
next: /updating_gems
redirect_from:
  - /bundler_sharing/
  - /rationale/
  - /bundler_workflow/
---

This guide explains how Bundler manages your application's dependencies, why
`Gemfile.lock` matters, and how to share a consistent environment with other
developers and deployment targets.

### Declaring dependencies

You declare your dependencies in a file at the root of your application called
`Gemfile`. It looks something like this:

~~~ruby
source 'https://rubygems.org'
gem 'rails', '4.1.0.rc2'
gem 'rack-cache'
gem 'nokogiri', '~> 1.6.1'
~~~

This `Gemfile` says a few things. First, it says that bundler should look for gems
declared in the `Gemfile` at `https://rubygems.org` by default. If some
of your gems need to be fetched from a private gem server, this default source can be overridden
for those gems.

Next, you declare a few dependencies:

- on version `4.1.0.rc2` of `rails`
- on any version of `rack-cache`
- on a version of `nokogiri` that is `>= 1.6.1` but `< 1.7.0`

<a href="/gemfile" class="btn btn-primary">Learn More: Gemfiles</a>

### Installing dependencies

After declaring your first set of dependencies, you tell bundler to go get them:

~~~
$ bundle install
~~~

Bundler will connect to `rubygems.org` (and any other sources that you declared)
and find a list of all of the required gems that meet the requirements you specified.
Because all of the gems in your `Gemfile` have dependencies of their own
(and some of those have their own dependencies), running `bundle install` on the
`Gemfile` above will install quite a few gems.

If any of the needed gems are already installed, Bundler will use them. After installing
any needed gems to your system, bundler writes a snapshot of all of the gems and
versions that it installed to `Gemfile.lock`.

### Checking Your Code into Version Control
<a name="checking-your-code-into-version-control"></a>

After developing your application for a while, check in the application together with the
`Gemfile` and `Gemfile.lock` snapshot. Now, your repository has a
record of the exact versions of all of the gems that you used the last time you know for
sure that the application worked. Keep in mind that while your `Gemfile`
lists only three gems (with varying degrees of version strictness), your application
depends on dozens of gems, once you take into consideration all of the implicit
requirements of the gems you depend on.

This is important: **the `Gemfile.lock` makes your application a single
package of both your own code and the third-party code it ran the last time you know for
sure that everything worked**. Specifying exact versions of the third-party code
you depend on in your `Gemfile` would not provide the same guarantee, because
gems usually declare a range of versions for their dependencies.

The next time you run `bundle install` on the same machine, bundler will see
that it already has all of the dependencies you need and skip the installation process.

Do not check in the `.bundle` directory or any of the files inside it. Those
files are specific to each particular machine and are used to persist installation options
between runs of the `bundle install` command.

If you have run `bundle cache`, the gems required
by your bundle will be downloaded into `vendor/cache`. Bundler can run without
connecting to the internet (or the RubyGems server) if all the gems you need are present
in that folder and checked in to your source control. This is an **optional**
step and not recommended due to the increase in size of your source control repository.

### Sharing Your Application With Other Developers
<a name="sharing-your-application-with-other-developers"></a>

When your co-developers (or you on another machine) check out your code, it will come
with the exact versions of all the third-party code your application used on the machine
that you last developed on (in the `Gemfile.lock`). When **they** run
`bundle install`, bundler will find the `Gemfile.lock` and skip
the dependency resolution step. Instead, it will install all of the same gems that you
used on the original machine.

In other words, you don't have to guess which versions of the dependencies you should
install. In the example we've been using, even though `rack-cache` declares a
dependency on `rack >= 0.4`, we know for sure it works with `rack
1.5.2`. Even if the Rack team releases `rack 1.5.3`, bundler will
always install `1.5.2`, the exact version of the gem that we know works. This
relieves a large maintenance burden from application developers because all machines
always run the exact same third-party code.

### The Day-to-day Workflow

Once the `Gemfile` and `Gemfile.lock` are in version control, the routine is short:

- Add or change a dependency in the `Gemfile`, then run `bundle install`.
- Commit the updated `Gemfile.lock` together with the `Gemfile`, so that everyone
  else installs the same versions. For a gem rather than an application, see the
  [FAQs](/faqs) for the tradeoffs of committing `Gemfile.lock`.
- If `bundle install` reports a conflict between the `Gemfile` and the
  `Gemfile.lock`, update only the gems you changed:

~~~
$ bundle update rails thin
~~~

- Run `bundle update` with no arguments only when you intend to move every gem
  to the newest version your `Gemfile` allows.
- On a deployment machine or in CI, enable deployment mode before installing:

~~~
$ bundle config set --local deployment true
$ bundle install
~~~

  Deployment mode requires an up-to-date `Gemfile.lock` and installs gems into
  `vendor/bundle` inside the application. Do not enable it on a development
  machine, where editing the `Gemfile` would then raise an error.

### Loading and Running Your Bundle

Inside your application, load the bundled environment before requiring anything:

~~~ruby
require 'bundler/setup'

# require your gems as usual
require 'nokogiri'
~~~

To run an executable that comes with a gem in your bundle, prefix it with
`bundle exec`:

~~~
$ bundle exec rspec spec/models
~~~

Running the executable without `bundle exec` sometimes works, if it also happens
to be installed on your system and pulls in no gems that conflict with your
bundle. That is unreliable. It may stop working later, or on another machine.

If you want a shortcut for a gem you run often, generate binstubs for it:

~~~
$ bundle binstubs rspec-core
$ bin/rspec spec/models
~~~

The executables in `bin` are scoped to the bundle, and will always work.

<div class="buttons">
  <a href="/command-reference/bundle-exec/" class="btn btn-primary">Learn More: Executables</a>
  <a href="/bundler_setup" class="btn btn-primary">Learn More: Bundler.setup</a>
  <a href="/updating_gems" class="btn btn-primary">Learn More: Updating gems</a>
  <a href="/deploying" class="btn btn-primary">Learn More: Deploying</a>
</div>
