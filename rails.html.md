---
title: How to use Bundler with Rails
---

Rails comes with baked in support with bundler.

## How to use Bundler with Rails

Install Rails as you normally would. Use sudo
if you would normally use sudo to install gems.

~~~
$ gem install rails
~~~

We recommend using rvm for dependable Ruby
installations, especially if you are switching
between different versions of Ruby

Generate a Rails app as usual

~~~
$ rails new myapp
$ cd myapp
~~~

Run the server. Bundler is transparently managing
your dependencies!

~~~
$ rails server
~~~

Add new dependencies to your Gemfile as you
need them.

~~~ruby
gem 'nokogiri'
gem 'geokit'
~~~

If you want a dependency to be loaded only in
a certain Rails environment, place it in a group
named after that Rails environment

~~~ruby
group :test do
  gem 'rspec'
  gem 'faker'
end
~~~

You can place a dependency in multiple groups
at once as well

~~~ruby
group :development, :test do
  gem 'wirble'
  gem 'ruby-debug'
end
~~~

<a href="./groups.html" class="btn btn-primary">Learn More: Groups</a>

After adding a dependency, if it is not yet
installed, install it

~~~
$ bundle install
~~~

This will update all dependencies in your
Gemfile to the latest versions that do not
conflict with other dependencies
