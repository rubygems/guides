---
title: How to deploy bundled applications
---

## How to deploy bundled applications

Before deploying an app that uses Bundler, Add your `Gemfile`
and `Gemfile.lock` to source control, but ignore the
`.bundle` folder, which is specific to each machine.

~~~
$ echo ".bundle" >> .gitignore
$ git add Gemfile Gemfile.lock .gitignore
$ git commit -m "Add Bundler support"
~~~

Once you have done that, there are two ways to deploy using Bundler:
manually or automatically.

### Manual deployment

In your deploy script, after updating to the latest
code, install your bundle to the `vendor/bundle`
directory, ensuring all your dependencies are met.

~~~
$ bundle install --deployment
~~~

Start your application servers as usual, and your
application will use your bundled environment
with the exact same gems you use in development.

If you have run `bundle package`, the cached
gems will be used automatically.

<a href="/man/bundle-cache.1.html" class="btn btn-primary">Learn More: Packing</a>

### Automatic deployment with Capistrano

To pull in the Bundler Cap task, just add this to your
`deploy.rb` file:

~~~ruby
require 'bundler/capistrano'
~~~

That's it! Running `cap deploy` will now automatically run
`bundle install` on the remote server with deployment-friendly
options. A list of options that can be changed is available in the help
for the cap task. To see it, run `cap -e bundle:install`.

### Automatic deployment with Vlad

There is a default Vlad task available. To make it available, add this line
to the Vlad `deploy.rb`.

~~~ruby
require 'bundler/vlad'
~~~

Once you have done that, the `vlad:bundle:install` task will be
available for use. Make sure it is run as part of your deploy. For example:

~~~ruby
task "vlad:deploy" => %w[
  vlad:update vlad:bundle:install vlad:start_app vlad:cleanup
]
~~~

### After deploying

Make sure to use `bundle exec` to run any executables
from gems in the bundle

~~~
$ bundle exec rake db:setup
~~~

Alternatively, you can use the `--binstubs` option on the
install command to generate executable binaries that can be used instead of
`bundle exec`.

<a href="/man/bundle-exec.1.html" class="btn btn-primary">Learn More: Executables</a>

### Heroku

When you deploy to Heroku, Bundler will be run automatically as long as a Gemfile is present.
If you check in your Gemfile.lock, Heroku will run `bundle install --deployment`.
If you want to exclude certain groups using the `--without` option, you need to use `heroku config`.

~~~
$ heroku config:set BUNDLE_WITHOUT="test development" --app app_name
~~~

<a href="http://docs.heroku.com/bundler" class="btn btn-primary">Heroku Bundler Documentation</a>

## Deploying Your Application
<a name="deploying-your-application"></a>

When you run `bundle install`, bundler will (by default), install your gems
to your system repository of gems. This means that they will show up in `gem
list`. Additionally, if you are developing a number of applications, you will not
need to download and install gems in common for each application. This is nice for
development, but somewhat problematic for deployment.

In a deployment scenario, the Unix user you deploy with may not have access to install
gems to a system location. Even if the user does (or you use `sudo`), the
user that boots the application may not have access to them. For instance, Passenger
runs its Ruby subprocesses with the user `nobody`, a somewhat restricted
user. The tradeoffs in a deployment environment lean more heavily in favor of isolation
(even at the cost of a somewhat slower deploy-time `bundle install` when some
third-party dependencies have changed).

As a result, bundler comes with a `--deployment` flag that encapsulates the
best practices for using bundler in a deployment environment. These practices are based
on significant feedback we have received during the development of bundler, as well as a
number of bug reports that mostly reflected a misunderstanding of how to best configure
bundler for deployment. The `--deployment` flag adds the following defaults:

- Instead of installing gems to the system location, bundler will install gems to
`vendor/bundle` inside your application. Bundler will transparently remember
this location when you invoke it inside your application (with
`Bundler.setup` and `Bundler.require`).
- Bundler will not use gems already installed to your system, even if they exist.
- If you have run `bundle pack`, checked in the `vendor/cache`
directory, and do not have any git gems, Bundler will not contact the internet while
installing your bundle.
- Bundler will require a `Gemfile.lock` snapshot, and fail if you did not
provide one.
- Bundler will not transparently update your `Gemfile.lock` if it is out of
date with your `Gemfile`

If you use Capistrano, you should symlink `vendor/bundle` to
`shared/vendor_bundle` so that bundler will share your installed gems between
deployments (making things zippy if you didn't make any changes), but still give you the
benefits of isolation from other applications.

By defaulting the bundle directory to `vendor/bundle`, and installing your
bundle as part of your deployment process, you can be sure that the same Unix user that
checked out your application also installed the third-party code your application needs.
This means that if Passenger (or Unicorn) can see your application, it can also see its
dependencies.

The `--deployment` flag requires an up-to-date `Gemfile.lock` to
ensure that the testing you have done (in development and staging) actually reflects the
code you put into production. You can run `bundle check` before deploying
your application to make sure that your `Gemfile.lock` is up-to-date. Note
that it will always be up-to-date if you have run `bundle install`,
successfully booted your application (or run your tests) since the last time you changed
your `Gemfile`.
