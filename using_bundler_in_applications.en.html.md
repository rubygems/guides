---
title: How to manage application dependencies with Bundler
---

# How to manage application dependencies with Bundler

This guide is originally written for Bundler v1.12. If you are using different version keep in mind that output can differ.
To check Bundler version simply run `bundle -v`.

## What's Inside?

1. [Getting Started - Installing Bundler and **bundle init**](#getting-started---installing-bundler-and-bundle-init)
1. [Editing Gemfile](#editing-gemfile)
    1. [Sources](#sources)
    1. [Adding Gems](#adding-gems)
    1. [Gemfile Syntax](#gemfile-syntax)
1. [Installing Gems - **bundle install**](#installing-gems---bundle-install)
    1. [Development](#development)
    1. [Deployment](#deployment)
1. [Gemfile.lock](#gemfilelock)
1. [Executing Commands - **bundle exec**](#executing-commands---bundle-exec)
1. [Updating Gems - **bundle outdated** and **bundle update**](#updating-gems---bundle-outdated-and-bundle-update)
1. [Recommended Workflow](#recommended-workflow)
1. [Troubleshooting](#troubleshooting)
    1. [Running `git bisect` in projects using Bundler](#running-git-bisect-in-projects-using-bundler)
    
## Getting Started - Installing Bundler and **bundle init**

**Some of the frameworks have builtin support for Bundler, e.g. when you run `rails new app` it
will automatically init Bundler.**

Firstly, we need to install Bundler.
 
    $ gem install bundler
    
This command will also update already installed bundler. You should get something similar as output:

~~~ bash
$ gem install bundler
Successfully installed bundler-1.12.5
1 gem installed
~~~

To init Bundler manually, let's do this (`bundler_example` will be folder with our app):

    $ mkdir bundler_example && cd bundler_example
    $ bundle init
    
This will create `Gemfile` inside `bundler_example` folder:

~~~ ruby
# frozen_string_literal: true
# A sample Gemfile
source "https://rubygems.org"

# gem "rails"
~~~

## Editing Gemfile

### Sources

Auto-generated Gemfile consists of `source "https://rubygems.org"`. It means that
Bundler will search for gems in `https://rubygems.org`. If you want to use your own
RubyGems server or different one, just change it:

~~~ ruby
source "https://your_ruby_gem_server.url"
~~~

***

If you have more gem sources, you can use block or `:source`:

~~~ ruby
source "https://your_ruby_gem_server.url" do
  # gems
end

gem "my_gem", source: "https://your_2_ruby_gem_server.url"
~~~

Gems inside block will be retrieved from given source.

***

Learn more about `source` [here](/man/gemfile.5.html#GLOBAL-SOURCES). 

### Adding Gems

Let's now add some dependencies to project:

~~~ ruby
# frozen_string_literal: true
# A sample Gemfile
source "https://rubygems.org"

gem "rails"
~~~

Using above Gemfile, `bundler install` will install latest version
of `rails` gem.

***

What to do when we want to install specified version? Just specify it
after comma:

~~~ ruby
gem "rails", "3.0.0"
~~~

or use this syntax:

~~~ ruby
gem "rails", "~> 4.0.0" # which is same as gem "rails", ">= 4.0.0", "< 4.1.0" 
gem "nokogiri", ">= 1.4.2"
~~~

***

Learn more about gems in Gemfile [here](/man/gemfile.5.html#GEMS).

### Gemfile Syntax

Learn more about Gemfile syntax from the [gemfile manpage](/man/gemfile.5.html#SYNTAX).

## Installing Gems - **bundle install**

### Development

To install gems for development, simply run `bundle install`.

This should give you similar output:

    Fetching gem metadata from https://rubygems.org/
    Fetching version metadata from https://rubygems.org/
    Fetching dependency metadata from https://rubygems.org/
    Resolving dependencies...
    Using mini_portile2 2.1.0
    Using pkg-config 1.1.7
    Using bundler 1.12.5
    Using nokogiri 1.6.8
    Bundle complete! 1 Gemfile dependency, 4 gems now installed.
    Use `bundle show [gemname]` to see where a bundled gem is installed.

It should also create [`Gemfile.lock` file](/man/bundle-install.1.html#THE-GEMFILE-LOCK):

    GEM
      remote: https://rubygems.org/
      specs:
        mini_portile2 (2.1.0)
        nokogiri (1.6.8)
          mini_portile2 (~> 2.1.0)
          pkg-config (~> 1.1.7)
        pkg-config (1.1.7)
    
    PLATFORMS
      ruby
    
    DEPENDENCIES
      nokogiri (>= 1.4.0)
    
    BUNDLED WITH
       1.12.5

This Gemfile.lock is described in [next chapter](#gemfilelock).

### Deployment

For deployment you should use
[`--deployment` option](/man/bundle-install.1.html#DEPLOYMENT-MODE):

    $ bundle install --deployment
    
This will install all dependencies to `./vendor/bundle`.

To run this command, there are some requirements:

1. `Gemfile.lock` file is required.
1. `Gemfile.lock` must be up to date.

***

To learn more about `bundle install` command click [here](/man/bundle-install.1.html).

## Gemfile.lock

Bundler uses this file to save names and versions of all gems.
It guarantees that you always use the same exact code, even as your application moves across machines.
After specified gem is installed for the first time, Bundler will lock its version.
To update it, you must use: [`bundler update`](#updating-gems---bundle-outdated-and-bundle-update)
or/and modify its version in `Gemfile`.

This file is created/updated automatically when you use some of Bundler's commands
(e.g. `bundle install` or `bundle update`) and you should check it into version control.

We will use Gemfile.lock from previous chapter as an example. 

    GEM
      remote: https://rubygems.org/
      specs:
        mini_portile2 (2.1.0)
        nokogiri (1.6.8)
          mini_portile2 (~> 2.1.0)
          pkg-config (~> 1.1.7)
        pkg-config (1.1.7)
    
    PLATFORMS
      ruby
    
    DEPENDENCIES
      nokogiri (>= 1.4.0)
    
    BUNDLED WITH
       1.12.5

Let's break it down: 

* `GEM`
  * `remote` - source of gems
  * `specs` - installed gems (with versions). We can see here that `mini_portile2` is
  dependency of `nokogiri` because it's beneath and indented
* `PLATFORMS` - platform that is used in your application ([see more here](/man/gemfile.5.html#PLATFORMS)).
* `DEPENDENCIES` - gems defined in our Gemfile.
* `BUNDLED WITH` - version of Bundler which was last used to change `Gemfile.lock`

## Executing Commands - **bundle exec**

Let's see examples first:

    $ bundle exec rspec
    
    $ bundle exec rails s

This will allow you to run command (`rspec` and `rails s` here) in current bundle context,
making all gems in Gemfile available to `require` and use.

***

To learn more about `bundle exec` command click [here](/man/bundle-exec.1.html).

## Updating Gems - **bundle outdated** and **bundle update**

Now let's update some gems. With `bundle outdated` we can list installed gems with newer versions available:

    $ bundle outdated
    Fetching gem metadata from https://rubygems.org/
    Fetching version metadata from https://rubygems.org/
    Fetching dependency metadata from https://rubygems.org/
    Resolving dependencies.......
    
    Outdated gems included in the bundle:
      * nokogiri (newest 1.6.8, installed 1.6.7.2) in group "default"

You can also specify gems (`bundle outdated *gems`).

We've got `nokogiri` locked on version 1.6.7.2. How can we update it?
`bundle install` won't install newer version because it's locked in `Gemfile.lock` file.
We must use `bundle update`.

    $ bundle update
    Fetching git://github.com/middleman/middleman-syntax.git
    Fetching gem metadata from https://rubygems.org/
    Fetching version metadata from https://rubygems.org/
    Fetching dependency metadata from https://rubygems.org/
    Resolving dependencies.....
    Installing nokogiri 1.6.8 (was 1.6.7.2) with native extensions
    Using i18n 0.7.0
    
    ... (and more)
    
    Bundle updated!
    
Using `bundle update` without any argument will try to update every gem to newest available version
(restrained by `Gemfile`).

To update specific gems, use `bundle update *gems`

***

To learn more about `bundle outdated` command click [here](/bundle_outdated.html).

To learn more about `bundle update` command click [here](/man/bundle-update.1.html).

## Recommended Workflow

In general, when working with an application managed with bundler, you should use the following workflow:

* To init Bundler, run

~~~
$ bundle init
~~~

* After you create your `Gemfile` for the first time, run

~~~
$ bundle install
~~~

* Check the resulting `Gemfile.lock` into version control

~~~
$ git add Gemfile.lock
~~~
 
* When checking out this repository on another development machine, run
 
~~~
$ bundle install
~~~

* When checking out this repository on a deployment machine, run

~~~
$ bundle install --deployment
~~~

* After changing the `Gemfile` to reflect a new or update dependency, run

~~~
$ bundle install
~~~

* Make sure to check the updated Gemfile.lock into version control

~~~
$ git add Gemfile.lock
~~~

* If `bundle install` reports a conflict, manually update the specific gems that you changed in the `Gemfile`

~~~
$ bundle update rails thin
~~~

* If you want to update all the gems to the latest possible versions that still match the gems listed in the Gemfile(5), run

~~~
$ bundle update
~~~

## Troubleshooting

### Running `git bisect` in projects using Bundler

See [Git Bisect Guide](./git_bisect.html).
