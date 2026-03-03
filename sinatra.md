---
title: How to use Bundler with Sinatra
---

## How to use Bundler with Sinatra

To use bundler with a Sinatra application, you only need to do two things. First, create a Gemfile.

~~~ruby
gem 'sinatra'
~~~

Then, set up your config.ru file to load the bundle before it loads your Sinatra app.

~~~ruby
require 'bundler'

Bundler.require

require './my_sinatra_app'
run MySinatraApp
~~~

Start your development server with rackup, and Sinatra will be loaded via Bundler.

~~~
$ bundle exec rackup
~~~
