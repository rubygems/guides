---
title: How to package and share code using a Gemfile
---
## How to package and share code using a Gemfile
<a name="sharing"></a>

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
