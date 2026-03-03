---
title: Recommended Workflow with Version Control
---

## Recommended Workflow with Version Control

In general, when working with an application managed with bundler, you
should use the following workflow:

After you create your `Gemfile` for the first time, run

~~~
$ bundle install
~~~

Check the resulting `Gemfile.lock` into version control

~~~
$ git add Gemfile.lock
~~~

When checking out this repository on another development machine, run

~~~
$ bundle install
~~~

When checking out this repository on a deployment machine, run

~~~
$ bundle install --deployment
~~~

After changing the `Gemfile` to reflect a new or update
dependency, run

~~~
$ bundle install
~~~

Make sure to check the updated `Gemfile.lock` into version
control

~~~
$ git add Gemfile.lock
~~~

If `bundle install` reports a conflict, manually update the
specific gems that you changed in the `Gemfile`

~~~
$ bundle update rails thin
~~~

If you want to update all the gems to the latest possible versions that
still match the gems listed in the `Gemfile`, run

~~~
$ bundle update
~~~

## A Thorough Bundler Workflow

Getting started with bundler is easy! Open a terminal window and run this command:

~~~
$ gem install bundler
~~~

- When you first create a Rails application, it already comes with a
  `Gemfile`.  For another kind of application (such as Sinatra), run:

~~~
$ bundle init
~~~

- The `bundle init` command creates a simple `Gemfile` which you
  can edit.

Specify your dependencies in the root of your application, called the `Gemfile`.
It looks something like this:

~~~ruby
source 'https://rubygems.org'
gem 'nokogiri'
gem 'rack', '~> 2.2.4'
gem 'rspec'
~~~

This `Gemfile` says a few things. First, it says that bundler should
look for gems declared in the `Gemfile` at `https://rubygems.org` by default.

<a href="./gemfile.html" class="btn btn-primary">Learn More: Gemfiles</a>

After declaring your first set of dependencies, you tell bundler to go get them:

~~~
$ bundle install
~~~

Bundler will connect to `rubygems.org` (and any other sources that you declared),
and find a list of all of the required gems that meet the requirements you specified.
Because all of the gems in your `Gemfile` have dependencies of their own
(and some of those have their own dependencies), running `bundle install` on the
`Gemfile` above will install quite a few gems.

~~~
$ bundle install
Fetching gem metadata from https://rubygems.org/..........
Fetching version metadata from https://rubygems.org/..
Fetching dependency metadata from https://rubygems.org/.
Resolving dependencies...
Installing rake 11.3.0
Using concurrent-ruby 1.0.2
Using i18n 0.7.0
Installing minitest 5.9.1
Using thread_safe 0.3.5
Using builder 3.2.2
Using erubis 2.7.0
Using mini_portile2 2.1.0
Using rack 2.2.4
Using nio4r 1.2.1
Using websocket-extensions 0.1.2
Installing mime-types-data 3.2016.0521
Installing arel 7.1.4
Using bundler 1.13.1
Using method_source 0.8.2
Using thor 0.19.1
Using tzinfo 1.2.2
Installing nokogiri 1.6.8.1 with native extensions
Using rack-test 0.6.3
Using sprockets 3.7.0
Installing websocket-driver 0.6.4 with native extensions
Installing mime-types 3.1
Using activesupport 5.0.0.1
Using loofah 2.0.3
Using mail 2.6.4
Using rails-dom-testing 2.0.1
Using globalid 0.3.7
Using activemodel 5.0.0.1
Using rails-html-sanitizer 1.0.3
Using activejob 5.0.0.1
Using activerecord 5.0.0.1
Using actionview 5.0.0.1
Using actionpack 5.0.0.1
Using actioncable 5.0.0.1
Using actionmailer 5.0.0.1
Using railties 5.0.0.1
Installing sprockets-rails 3.2.0
Using rails 5.0.0.1
Bundle complete! 1 Gemfile dependency, 38 gems now installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.
~~~

If any of the needed gems are already installed, Bundler will use them. After installing
any needed gems to your system, bundler writes a snapshot of all of the gems and
versions that it installed to `Gemfile.lock`.

- If `bundle install` reports a conflict between your `Gemfile` and
  `Gemfile.lock`, run:

~~~
$ bundle update sinatra
~~~

- This will update just the Sinatra gem, as well as any of its dependencies.

- To update all of the gems in your `Gemfile` to the latest possible versions, run:

~~~
$ bundle update
~~~

- Whenever your `Gemfile.lock` changes, always check it in to version control.
  It keeps a history of the exact versions of all third-party code that you used to successfully
  run your application.

- The `git add Gemfile*` command adds the Gemfile and Gemfile.lock to your repository. This ensures that
  other developers on your app, as well as your deployment environment, will all use the same
  third-party code that you are using now.

<div class="buttons">
  <a href="./bundle_install.html" class="btn btn-primary">Learn More: bundle install</a>
  <a href="./bundle_update.html" class="btn btn-primary">Learn More: bundle update</a>
</div>

Inside your app, load up the bundled environment:

~~~ruby
require 'bundler/setup'

# require your gems as usual
require 'nokogiri'
~~~

<a href="./bundler_setup.html" class="btn btn-primary">Learn More: Bundler.setup</a>

Run an executable that comes with a gem in your bundle:

~~~
$ bundle exec rspec spec/models
~~~

In some cases, running executables without `bundle exec`
may work, if the executable happens to be installed in your system
and does not pull in any gems that conflict with your bundle.

However, this is unreliable and is the source of considerable pain.
Even if it looks like it works, it may not work in the future or
on another machine.

Finally, if you want a way to get a shortcut to gems in your bundle:

~~~
$ bundle install --binstubs
$ bin/rspec spec/models
~~~

The executables installed into `bin` are scoped to the
bundle, and will always work.

<a href="/man/bundle-exec.1.html" class="btn btn-primary">Learn More: Executables</a>
