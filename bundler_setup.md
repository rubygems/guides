---
title: How to use Bundler with Ruby
---
## How to use Bundler with Ruby

Configure the load path so all dependencies in
your Gemfile can be required

~~~ruby
require 'bundler/setup'
require 'nokogiri'
~~~

Only add gems from specified groups to the
load path. If you want the gems in the
default group, make sure to include it

~~~ruby
require 'bundler'
Bundler.setup(:default, :ci)
require 'nokogiri'
~~~

<a href="./groups.html" class="btn btn-primary">Learn More: Groups</a>

## Compatibility

Ruby 2.0 and RubyGems 2.0 both require Bundler 1.3 or later. If you have questions about compatibility between Bundler and your system, please check the compatibility list.

<a href="/compatibility.html" class="btn btn-primary">Learn More: Compatibility</a>

## Setting Up Your Application to Use Bundler
<a name="setting-up-your-application-to-use-bundler"></a>

Bundler makes sure that Ruby can find all of the gems in the `Gemfile`
(and all of their dependencies). If your app is a Rails app, your default application
already has the code necessary to invoke bundler.
For another kind of application (such as a Sinatra application), you will need to set up
bundler before trying to require any gems. At the top of the first file that your
application loads (for Sinatra, the file that calls `require 'sinatra'`), put
the following code:

~~~ruby
require 'bundler/setup'
~~~

This will automatically discover your `Gemfile` and make all of the gems in
your `Gemfile` available to Ruby (in technical terms, it puts the gems "on the
load path").

Now that your code is available to Ruby, you can require the gems that you need. For
instance, you can `require 'sinatra'`. If you have a lot of dependencies, you
might want to say "require all of the gems in my `Gemfile`". To do this, put
the following code immediately following `require 'bundler/setup'`:

~~~ruby
Bundler.require(:default)
~~~

For our example Gemfile, this line is exactly equivalent to:

~~~ruby
require 'rails'
require 'rack-cache'
require 'nokogiri'
~~~

Astute readers will notice that the correct way to require the `rack-cache`
gem is `require 'rack/cache'`, not `require 'rack-cache'`. To tell
bundler to use `require 'rack/cache'`, update your Gemfile:

~~~ruby
source 'https://rubygems.org'

gem 'rails', '5.0.0'
gem 'rack-cache', require: 'rack/cache'
gem 'nokogiri', '~> 1.4.2'
~~~

For such a small `Gemfile`, we'd advise you to skip
`Bundler.require` and just require the gems by hand (especially given the
need to put in a `:require` directive in the `Gemfile`). For much
larger `Gemfile`s, using `Bundler.require` allows you to skip
repeating a large stack of requirements.
