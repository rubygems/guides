---
title: How to update gems with Bundler
---
## How to update gems with Bundler

### Updating a Dependency
<a name="updating-a-dependency"></a>

Of course, at some point, you might want to update the version of a particular
dependency your application relies on. For instance, you might want to update
`rails` to `3.0.0` final. Importantly, just because you're
updating one dependency, it doesn't mean you want to re-resolve all of your dependencies
and use the latest version of everything. In our example, you only have three
dependencies, but even in this case, updating everything can cause complications.

To illustrate, the `rails 3.0.0.rc` gem depends on `actionpack
3.0.0.rc` gem, which depends on `rack ~> 1.2.1` (which means `>=
1.2.1` and `< 1.3.0`). The `rack-cache` gem depends on
`rack >= 0.4`. Let's assume that the `rails 3.0.0` final gem also
depends on `rack ~> 1.2.1`, and that since the release of `rails
3.0.0`, the Rack team released `rack 1.2.2`.

If we naïvely update all of our gems in order to update Rails, we'll get `rack
1.2.2`, which satisfies the requirements of both `rails 3.0.0` and
`rack-cache`. However, we didn't specifically ask to update
`rack-cache`, which may not be compatible with `rack 1.2.2` (for
whatever reason). And while an update from `rack 1.2.1` to `rack
1.2.2` probably won't break anything, similar scenarios can happen that involve
much larger jumps. (see [1] below for a larger discussion)

In order to avoid this problem, when you update a gem, bundler will not update a
dependency of that gem if another gem still depends on it. In this example, since
`rack-cache` still depends on `rack`, bundler will not update the
`rack` gem. This ensures that updating `rails` doesn't
inadvertently break `rack-cache`. Since `rails 3.0.0`'s dependency
`actionpack 3.0.0` remains compatible with `rack 1.2.1`, bundler
leaves it alone, and `rack-cache` continues to work even in the face of an
incompatibility with `rack 1.2.2`.

Since you originally declared a dependency on `rails 3.0.0.rc`, if you want
to update to `rails 3.0.0`, simply update your `Gemfile` to
`gem 'rails', '3.0.0'` and run:

~~~
$ bundle install
~~~

As described above, the `bundle install` command always does a conservative
update, refusing to update gems (or their dependencies) that you have not explicitly
changed in the `Gemfile`. This means that if you do not modify
`rack-cache` in your `Gemfile`, bundler will treat it **and its
dependencies** (`rack`) as a single, unmodifiable unit. If `rails
3.0.0` was incompatible with `rack-cache`, bundler will report a
conflict between your snapshotted dependencies (`Gemfile.lock`) and your
updated `Gemfile`.

If you update your `Gemfile`, and your system already has all of the needed
dependencies, bundler will transparently update the `Gemfile.lock` when you
boot your application. For instance, if you add `mysql` to your
`Gemfile`, and have already installed it in your system, you can boot your
application without running `bundle install`, and bundler will persist the
"last known good" configuration to the `Gemfile.lock` snapshot.

This can come in handy when adding or updating gems with minimal dependencies (database
drivers, `wirble`, `ruby-debug`). It will probably fail if you
update gems with significant dependencies (`rails`), or that a lot of gems
depend on (`rack`). If a transparent update fails, your application will fail
to boot, and bundler will print out an error instructing you to run `bundle
install`.

### Updating a Gem Without Modifying the Gemfile
<a name="updating-a-gem-without-modifying-the-gemfile"></a>

Sometimes, you want to update a dependency without modifying the Gemfile. For example,
you might want to update to the latest version of `rack-cache`. Because you
did not declare a specific version of `rack-cache` in the
`Gemfile`, you might want to periodically get the latest version of
`rack-cache`. To do this, you want to use the `bundle update`
command:

~~~
$ bundle update rack-cache
~~~

This command will update `rack-cache` and its dependencies to the latest
version allowed by the `Gemfile` (in this case, the latest version
available). It will not modify any other dependencies.

It will, however, update dependencies of other gems if necessary. For instance, if the
latest version of `rack-cache` specifies a dependency on `rack >=
1.2.2`, bundler will update `rack` to `1.2.2` even though
you have not asked bundler to update `rack`. If bundler needs to update a
gem that another gem depends on, it will let you know after the update has completed.

If you want to update every gem in the Gemfile to the latest possible versions, run:

~~~
$ bundle update
~~~

This will resolve dependencies from scratch, ignoring the `Gemfile.lock`. If
you do this, keep `git reset --hard` and your test suite in your back pocket.
Resolving all dependencies from scratch can have surprising results, especially if a
number of the third-party packages you depend on have released new versions since you
last did a full update.
