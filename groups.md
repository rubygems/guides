---
title: How to manage groups of gems
---

## How to manage groups of gems

Grouping your dependencies allows you
to perform operations on the entire
group.

~~~ruby
# These gems are in the :default group
gem 'nokogiri'
gem 'sinatra'

gem 'wirble', group: :development

group :test do
  gem 'faker'
  gem 'rspec'
end

group :test, :development do
  gem 'capybara'
  gem 'rspec-rails'
end

gem 'cucumber', group: [:cucumber, :test]
~~~

Configure bundler so that subsequent
`bundle install` invocations will install
all gems, except those in the listed
groups. Gems in at least one non-excluded
group will still be installed.

~~~
$ bundle config set --local without test development
~~~

Require the gems in particular groups,
noting that gems outside of a named group
are in the :default group

~~~ruby
Bundler.require(:default, :development)
~~~

Require the default gems, plus the gems
in a group named the same as the current
Rails environment

~~~ruby
Bundler.require(:default, Rails.env)
~~~

Restrict the groups of gems that you
want to add to the load path. Only gems
in these groups will be require'able.
Note though that `Bundler.setup` can be
called only once, all subsequent calls are
no-op. In particular, since running a
script through `bundle exec` already calls
`Bundler.setup`, any later calls inside
your user code will be ignored. In order to
control the groups that are loaded by
`bundle exec` you can use the `BUNDLE_WITH`
and `BUNDLE_WITHOUT` configurations.

~~~ruby
require 'bundler'
Bundler.setup(:default, :ci)
require 'nokogiri'
~~~

<a href="./bundler_setup.html" class="btn btn-primary">Learn More: Bundler.setup</a>

## Optional groups and `BUNDLE_WITH`
<a name="optional-groups"></a>

Mark a group as optional using `group :name, optional: true do` and then opt
into installing an optional group with `bundle config set --local with name`.

## Grouping your dependencies
<a name="grouping-your-dependencies"></a>

You'll sometimes have groups of gems that only make sense in particular environments.
For instance, you might develop your app (at an early stage) using SQLite but deploy it
using `mysql2` or `pg`. In this example, you might not have MySQL
or Postgres installed on your development machine and want bundler to skip it.

To do this, you can group your dependencies:

~~~ruby
source 'https://rubygems.org'

gem 'rails', '3.2.2'
gem 'rack-cache', require: 'rack/cache'
gem 'nokogiri', '~> 1.4.2'

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
~~~

Now, in development, you can instruct bundler to skip the `production` group:

~~~
$ bundle config set --local without production
~~~

Bundler stores the flag in `APP_ROOT/.bundle/config` and the
next time you run `bundle install`, it will skip production gems.
Similarly, when you require `bundler/setup`, Bundler will ignore gems in
these groups. You can see all of the settings that Bundler saved there
by running `bundle config`, which will also print out global
settings (stored in `~/.bundle/config`) and settings set via
environment variables.  For more information on configuring Bundler,
please see: [bundle_config](/man/bundle-config.1.html)

You can also specify which groups to automatically require through the parameters to
`Bundler.require`. The `:default` group includes all gems not
listed under any group. If you call `Bundler.require(:default, :development)`,
bundler will `require` all the gems in the `:default` group as
well as the gems in the `:development` group.

By default, a Rails generated app calls `Bundler.require(:default,
Rails.env)` in your `application.rb`, which links the groups in your
`Gemfile` to the Rails environment. If you use other groups (not linked to a
Rails environment), you can add them to the call to `Bundler.require` if you
want them to be automatically required.

Remember that you can always leave groups of gems out of `Bundler.require`
and then require them manually using Ruby's `require` at the appropriate
place in your app. You might do this because requiring a certain gem takes some time
and you don't need it every time you boot your application.
