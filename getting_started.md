---
title: Getting Started
---
## What is Bundler?

Bundler provides a consistent environment for Ruby projects by tracking
and installing the exact gems and versions that are needed.

Bundler is an exit from dependency hell, and ensures that the gems
you need are present in development, staging, and production.
Starting work on a project is as simple as `bundle install`.

<a href="../whats_new.html" class="btn btn-primary">What's new in Bundler</a>
<a href="./rationale.html" class="btn btn-primary">Why Bundler exists</a>

## Getting Started
<a name="getting-started"></a>

This guide assumes that you have [Ruby](https://www.ruby-lang.org/en/downloads/)
installed. If you do not have Ruby installed, do that first and then check back here!
Any modern distribution of Ruby comes with Bundler preinstalled by default.

Getting started with bundler is easy!
Specify your dependencies in a Gemfile in your project's root:

~~~ruby
source 'https://rubygems.org'
gem 'nokogiri'
gem 'rack', '~> 2.2.4'
gem 'rspec'
~~~

<a href="./gemfile.html" class="btn btn-primary">Learn More: Gemfiles</a>

Install all of the required gems from your specified sources:

~~~
$ bundle install
$ git add Gemfile Gemfile.lock
~~~

<a href="../man/bundle-install.1.html" class="btn btn-primary">Learn More: bundle install</a>

The second command adds the Gemfile and Gemfile.lock to your repository. This ensures
that other developers on your app, as well as your deployment environment, will all use
the same third-party code that you are using now.

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

<a href="../man/bundle-exec.1.html" class="btn btn-primary">Learn More: Executables</a>

## Create a rubygem with Bundler
<a name="create-gem"></a>

Bundler is also an easy way to create new gems. Just like you might create a standard Rails project using `rails new`, you can create a standard gem project with `bundle gem`.

Create a new gem with a README, .gemspec, Rakefile, directory structure, and all the basic boilerplate you need to describe, test, and publish a gem:

~~~
$ bundle gem my_gem
Creating gem 'my_gem'...
      create  my_gem/Gemfile
      create  my_gem/.gitignore
      create  my_gem/lib/my_gem.rb
      create  my_gem/lib/my_gem/version.rb
      create  my_gem/my_gem.gemspec
      create  my_gem/Rakefile
      create  my_gem/README.md
      create  my_gem/bin/console
      create  my_gem/bin/setup
      create  my_gem/CODE_OF_CONDUCT.md
      create  my_gem/LICENSE.txt
      create  my_gem/.travis.yml
      create  my_gem/test/test_helper.rb
      create  my_gem/test/my_gem_test.rb
Initializing git repo in ./my_gem
~~~

<a href="../man/bundle-gem.1.html" class="btn btn-primary">Learn More: bundle gem</a>

## Use Bundler with
<a name="use-bundler"></a>

<a href="./rails.html" class="btn btn-primary">Rails</a>
<a href="./sinatra.html" class="btn btn-primary">Sinatra</a>
<a href="./rubygems.html" class="btn btn-primary">RubyGems</a>
<a href="./rubymotion.html" class="btn btn-primary">RubyMotion</a>

## Get involved
<a name="get-involved"></a>

Bundler has a lot of contributors and users, and they all talk to each other quite a bit.
If you have questions, try [the IRC channel](http://webchat.freenode.net/?channels=bundler)
or [mailing list](http://groups.google.com/group/ruby-bundler).
If you're interested in contributing to the project (no programming skills needed),
read [the contributing guide](https://guides.rubygems.org/contributing)
or [the development guide](https://github.com/rubygems/rubygems/blob/master/bundler/doc/development/README.md).
While participating in the Bundler project, please keep the [code of conduct](/conduct.html)
in mind, and be inclusive and friendly towards everyone. If you have sponsorship or security questions, please contact the core team directly.

<a href="/conduct.html" class="btn btn-primary">Code of Conduct</a>
<a href="http://webchat.freenode.net/?channels=bundler" class="btn btn-primary">#bundler on IRC</a>
<a href="http://groups.google.com/group/ruby-bundler" class="btn btn-primary">Mailing list</a>
<a href="https://guides.rubygems.org/contributing" class="btn btn-primary">Contributing</a>
<a href="mailto:team@bundler.io" class="btn btn-primary">Email core team</a>
