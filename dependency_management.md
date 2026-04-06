---
layout: default
title: How to manage dependencies with Bundler
url: /dependency_management
previous: /groups
next: /rubygems_tls_ssl_troubleshooting_guide
---

## How to manage dependencies with Bundler

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

<a href="./gemfile.html" class="btn btn-primary">Learn More: Gemfiles</a>

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

If you have run `bundle pack`, the gems (although not the git gems) required
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

### Summary: A Simple Bundler Workflow
<a name="summary"></a>

- When you first create a Rails application, it already comes with a
`Gemfile`.  For another kind of application (such as Sinatra), run:

  ~~~
  $ bundle init
  ~~~

  The `bundle init` command creates a simple `Gemfile` which you
can edit.

- Next, add any gems that your application depends on. If you care which version of a
particular gem that you need, be sure to include an appropriate version restriction:

  ~~~ruby
  source 'https://rubygems.org'
  gem 'sinatra', '~> 1.3.6'
  gem 'rack-cache'
  gem 'rack-bug'
  ~~~

- If you don't have the gems installed in your system yet, run:

  ~~~
  $ bundle install
  ~~~

- To update a gem's version requirements, first modify the Gemfile:

  ~~~ruby
  source 'https://rubygems.org'
  gem 'sinatra', '~> 1.4.5'
  gem 'rack-cache'
  gem 'rack-bug'
  ~~~

  and then run:

  ~~~
  $ bundle install
  ~~~

- If `bundle install` reports a conflict between your `Gemfile`
and `Gemfile.lock`, run:

  ~~~
  $ bundle update sinatra
  ~~~

  This will update just the Sinatra gem, as well as any of its dependencies.

- To update all of the gems in your `Gemfile` to the latest possible
versions, run:

  ~~~
  $ bundle update
  ~~~

- Whenever your `Gemfile.lock` changes, always check it in to version
control. It keeps a history of the exact versions of all third-party code that you
used to successfully run your application.
- When deploying your code to a staging or production server, first run your tests (or
boot your local development server), make sure you have checked in your
`Gemfile.lock` to version control. On the remote server, run:

  ~~~
  $ bundle install --deployment
  ~~~

<div class="buttons">
  <a href="./bundler_setup.html" class="btn btn-primary">Learn More: Bundler.setup</a>
  <a href="./updating_gems.html" class="btn btn-primary">Learn More: Updating gems</a>
  <a href="./deploying.html" class="btn btn-primary">Learn More: Deploying</a>
</div>
