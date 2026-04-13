---
layout: default
title: Frequently Asked Questions
url: /faqs
previous: /contributing
next: /plugins
redirect_from: /faq/
---

<em class="t-gray">More of the "why" and "wtf" than "how".</em>

* [RubyGems FAQ](#rubygems-faq)
* [Bundler FAQ](#bundler-faq)

RubyGems FAQ
============

The RubyGems development team has gotten a lot of support requests over the
years, and this is a list of the questions users both new and old that
frequently pop up.

* [I installed gems with `--user-install` and their commands are not available](#i-installed-gems-with---user-install-and-their-commands-are-not-available)
* [How can I trust Gem code that's automatically downloaded?](#how-can-i-trust-gem-code-thats-automatically-downloaded)
* [Why does `require 'some-gem'` fail?](#why-does-require-some-gem-fail)
* [Why does require return false when loading a file from a gem?](#why-does-require-return-false-when-loading-a-file-from-a-gem)
* [How can I use a different gem version on the command line?](#how-can-i-use-a-different-gem-version-on-the-command-line)

Some of the information you can find on the support site includes:

* [Installing gems with no network](https://help.rubygems.org/kb/rubygems/installing-gems-with-no-network)
* [Why do I get HTTP Response 302 or 301 when installing a gem?](https://help.rubygems.org/kb/rubygems/why-do-i-get-http-response-302-or-301-when-installing-a-gem)
* [RubyGems Upgrade Issues](https://help.rubygems.org/kb/rubygems/rubygems-upgrade-issues)

I installed gems with `--user-install` and their commands are not available
---------------------------------------------------------------------------

When you use the `--user-install` option, RubyGems will install the gems to a
directory inside your home directory, something like `~/.gem/ruby/1.9.1`. The
commands provided by the gems you installed will end up in
`~/.gem/ruby/1.9.1/bin`. For the programs installed there to be available for
you, you need to add `~/.gem/ruby/1.9.1/bin` to your `PATH` environment
variable.

For example, if you use bash you can add that directory to your `PATH` by
adding code like this to your `~/.bashrc` file:

    if which ruby >/dev/null && which gem >/dev/null; then
        PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
    fi

After adding this code to your `~/.bashrc`, you need to restart your shell for
the changes to take effect. You can do this by opening a new terminal window or
by running `exec $SHELL` in the window you already have open.

How can I trust Gem code that's automatically downloaded?
---------------------------------------------------------

The same way you can trust any other code you install from the net: ultimately,
you can't. You are responsible for knowing the source of the gems that you are
using. In a setting where security is critical, you should only use known-good
gems, and possibly perform your own security audit on the gem code.

The Ruby community is discussing ways to make gem code more secure in the future,
using some public-key infrastructure. To see the progress of this discussion, visit the
[rubygems-trust](https://github.com/rubygems-trust) organization on GitHub.

Why does `require 'some-gem'` fail?
-----------------------------------

Not every library has a strict mapping between the name of the gem and the name of
the file you need to require. First you should check to see if the files match correctly:

    $ gem list RedCloth

    *** LOCAL GEMS ***

    RedCloth (4.1.1)
    $ ruby -e 'require "RedCloth"'
    /Library/Ruby/Site/1.8/rubygems/custom_require.rb:31:in `gem_original_require': no such file to load -- RedCloth (LoadError)
      from /Library/Ruby/Site/1.8/rubygems/custom_require.rb:31:in `require'
      from -e:1
    $ gem contents --no-prefix RedCloth | grep lib
    lib/case_sensitive_require/RedCloth.rb
    lib/redcloth/erb_extension.rb
    lib/redcloth/formatters/base.rb
    lib/redcloth/formatters/html.rb
    lib/redcloth/formatters/latex.rb
    lib/redcloth/formatters/latex_entities.yml
    lib/redcloth/textile_doc.rb
    lib/redcloth/version.rb
    lib/redcloth.rb
    $ ruby -e 'require "redcloth"'
    $ # success!

If you're requiring the correct file, maybe `gem` is using a different ruby than `ruby`:

    $ which ruby
    /usr/local/bin/ruby
    $ gem env | grep 'RUBY EXECUTABLE'
       - RUBY EXECUTABLE: /usr/local/bin/ruby1.9

In this instance we've got two ruby installations so that `gem` uses a different version than `ruby`. You can probably fix this by adjusting a symlink:

    $ ls -l /usr/local/bin/ruby*
    lrwxr-xr-x  1 root  wheel       76 Jan 20  2010 /usr/local/bin/ruby@ -> /usr/local/bin/ruby1.8
    -rwxr-xr-x  1 root  wheel  1213160 Jul 15 16:36 /usr/local/bin/ruby1.8*
    -rwxr-xr-x  1 root  wheel  2698624 Jul  6 19:30 /usr/local/bin/ruby1.9*
    $ ls -l /usr/local/bin/gem*
    lrwxr-xr-x  1 root  wheel   76 Jan 20  2010 /usr/local/bin/gem@ -> /usr/local/bin/gem1.9
    -rwxr-xr-x  1 root  wheel  550 Jul 15 16:36 /usr/local/bin/gem1.8*
    -rwxr-xr-x  1 root  wheel  550 Jul  6 19:30 /usr/local/bin/gem1.9*

You may also need to give `irb` the same treatment.

Why does require return false when loading a file from a gem?
-------------------------------------------------------------

Require returns false when loading a file from a gem. Usually require will return
true when it has loaded correctly. What's wrong?

Nothing's wrong. Well, something. But nothing you need to worry about.

A false return from the require method does not indicate an error. It just
means that the file has already been loaded.

RubyGems has a feature that allows a file to be automatically loaded
when a gem is activated (i.e. selected). When you require a file that is
in an inactive gem, the RubyGems software will activate that gem for you.
During that activation, any autoloaded files will be loaded for you.

So, by the time your require statement actually does the work of loading
the file, it has already been autoloaded via the gem activation, and
therefore the statement returns false.

How can I use a different gem version on the command line?
----------------------------------------------------------

If you have multiple versions of a gem installed, you can specify which version
to use on the command line by using an underscore syntax. For example, if you
have both Rails 3.2.17 and 4.0.4 installed, you can run:

    $ rails _3.2.17_ new app

The underscore syntax lets you specify the exact version of the gem's command you want
to run. This is useful when you need to use an older version of a gem while having
newer versions also installed on your system.

Bundler FAQ
===========

### Why Can't I Just Specify Only `=` Dependencies?

**Q:** I understand the value of locking my gems down
to specific versions, but why can't I just specify `=` versions
for all my dependencies in the `Gemfile` and forget about
the `Gemfile.lock`?

**A:** Many of your gems will have their own
dependencies, and they are unlikely to specify `=` dependencies.
Moreover, it is probably unwise for gems to lock down all of *their*
dependencies so strictly. The `Gemfile.lock` allows you to
specify the versions of the dependencies that your application needs in
the `Gemfile`, while remembering all of the exact versions of
third-party code that your application used when it last worked correctly.

By specifying looser dependencies in your `Gemfile`
(such as `nokogiri ~> 1.4.2`), you gain the ability to run
`bundle update nokogiri`, and let bundler handle updating **only**
`nokogiri` and its dependencies to the latest version that still
satisfied the `~> 1.4.2` version requirement. This also allows you
to say "I want to use the current version of nokogiri" (`gem 'nokogiri'`
in your `Gemfile`) without having to look up the exact version number,
while still getting the benefits of ensuring that your application always runs with
exactly the same versions of all third-party code.

### Why Can't I Just Submodule Everything?

**Q:** I don't understand why I need bundler to manage
my gems in this manner. Why can't I just get the gems I need and stick them
in submodules, then put each of the submodules on the load path?

**A:** Unfortunately, that solution requires that you
manually resolve all of the dependencies in your application, including dependencies
of dependencies. And even once you do that successfully, you would need to redo that
work if you wanted to update a particular gem. For instance, if you wanted to update
the `rails` gem, you would need to find all of the gems that depended on
dependencies of Rails (`rack`, `erubis`, `i18n`,
`tzinfo`, etc.), and find new versions that satisfy the new versions of
Rails' requirements.

Frankly, this is the sort of problem that computers are good at, and which you,
a developer, should not need to spend time doing.

More concerningly, if you made a mistake in the manual dependency resolution
process, you would not get any feedback about conflicts between different dependencies,
resulting in subtle runtime errors. For instance, if you accidentally stuck the wrong
version of `rack` in a submodule, it would likely break at runtime, when
Rails or another dependency tried to rely on a method that was not present.

**Bottom line:**
even though it might seem simpler at first glance, it is decidedly significantly
more complex.

### Why Is Bundler Downloading Gems From `--without` Groups?

**Q:** I ran `bundle install --without production` and
bundler is still downloading the gems in the `:production` group. Why?

**A:** Bundler's `Gemfile.lock` has to contain exact
versions of all dependencies in your `Gemfile`, regardless of any options
you pass in. If it did not, deploying your application to production might change all
your dependencies, eliminating the benefit of Bundler. You could no longer be sure that
your application uses the same gems in production that you used to develop and test with.
Additionally, adding a dependency in production might result in an application that is
impossible to deploy.

For instance, imagine you have a production-only gem (let's call it
`rack-debugging`) that depends on `rack =1.1`. If we did not evaluate
the production group when you ran `bundle install --without production`, you
would deploy your application, only to receive an error that `rack-debugging`
conflicted with `rails ` (which depends on `actionpack`, which depends
on `rack ~> 1.2.1`).

Another example: imagine a simple Rack application that has `gem 'rack'`
in the `Gemfile`. Again, imagine that you put `rack-debugging` in the
`:production` group. If we did not evaluate the `:production` group when
you installed via `bundle install --without production`, your app would use
`rack 1.2.1` in development, and you would learn, at deployment time, that
`rack-debugging` conflicts with the version of Rack that you tested with.

In contrast, by evaluating the gems in **all** groups when you call `bundle install`,
regardless of the groups you actually want to use in that environment, we will discover the
`rack-debugger` requirement, and install `rack 1.1`, which is also compatible
with the `gem 'rack'` requirement in your `Gemfile`.

**In short, by always evaluating all of the dependencies in your Gemfile, regardless of the dependencies**
you intend to use in a particular environment, you avoid nasty surprises when switching to a different
set of groups in a different environment. And because we just download (but do not install) the gems,
you won't have to worry about the possibility of a difficult **installation** process for a gem that
you only use in production (or in development).

### I Have a C Extension That Requires Special Flags to Install

**Q**: I have a C extension gem, such as `mysql`, which requires
special flags in order to compile and install. How can I pass these flags into the installation
process for those gems?

**A**: First of all, this problem does not exist for the `mysql2`
gem, which is a drop-in replacement for the `mysql` gem. In general, modern C extensions
properly discover the needed headers.

If you really need to pass flags to a C extension, you can use the `bundle config`
command:

~~~
$ bundle config build.mysql --with-mysql-config=/usr/local/mysql/bin/mysql_config
~~~

Bundler will store this configuration in `~/.bundle/config`, and bundler will use
the configuration for any `bundle install` performed by the same user. As a result, once
you specify the necessary build flags for a gem, you can successfully install that gem as many times
as necessary.

### I Do Not Have an Internet Connection and Bundler Keeps Trying to Connect to the Gem Server

**Q**:  I do not have an internet connection but I have installed the gem before.
How do I get bundler to use my local gem cache and not connect to the gem server?

**A**: Use the `--local` flag with bundle install. The `--local` flag tells bundler
to use the local gem cache instead of reaching out to the remote gem server.

~~~
$ bundle install --local
~~~

### Bundling From RubyGems is Really Slow

**Q**: When I bundle from RubyGems.org, it is really slow. Is there anything I can do
to make it faster?

**A**: First, update to the latest version of Bundler by running `gem install bundler`.
We have added many, many improvements that make installing gems faster over the years.
If you have an extremely high-latency connection, you might also see an improvement by using the
`--full-index` flag. This downloads gem information all at once, instead of making many small HTTP
requests.

~~~
$ bundle install --full-index
~~~

### Using Gemfiles inside gems

**Q**: What happens if I put a `Gemfile` in my gem?

**A**: When someone installs your gem, the `Gemfile` and
`Gemfile.lock` files are completely ignored, even if you include them
inside the `.gem` file you upload to rubygems.org.
The `Gemfile` inside your gem is only to make it easy for developers
(like you) to install the dependencies needed to do development work
on your gem. The `Gemfile` also provides an easy way to track and
install development-only or test-only gems.
Read about Gemfiles in gems from the [Bundler in gems](/rubygems)
page and the [Make your own gem](/make-your-own-gem/)
guide.

**Q**: Should I commit my `Gemfile.lock` when writing a gem?

**A**: Yes, you should commit it. The presence of a
`Gemfile.lock` in a gem's repository ensures that a fresh checkout of
the repository uses the exact same set of dependencies every time. We
believe this makes repositories more friendly towards new and
existing contributors.
Ideally, anyone should be able to clone the repo, run `bundle
install`, and have passing tests. If you don't check in your
`Gemfile.lock`, new contributors can get different versions of your
dependencies, and run into failing tests that they don't know how to
fix.

**Q**: But I have read that gems should not check in the
Gemfile.lock!

**A**: The main advantage of not checking in your
Gemfile.lock is that new checkouts (including CI) will immediately
have failing tests if one of your dependencies changes in a breaking
way.
Instead of forcing every fresh checkout (and possible new
contributor) to encounter broken builds, the Bundler team recommends
either using a tool like [Dependabot](https://dependabot.com)
to automatically create a PR and run the test suite any time
your dependencies release new versions.
If you don't want to use a dependency monitoring bot, we suggest
creating an additional daily CI build that deletes the Gemfile.lock
before running `bundle install`. That way you, and others monitoring
your CI status, will be the first to know about any failures from
dependency changes.
Finally, when publishing your gem, consider deleting and regenerating your Gemfile.lock with the latest
dependencies just before running your tests.

### Why Don't Git Gems Show Up in `gem list`?

**Q**: I added a gem with a `:git` source in my `Gemfile`, but it doesn't
appear in `gem list` and its executables are not in my PATH. Where did it go?

**A**: Bundler installs git gems into a separate internal directory, not into
the same location as gems installed from RubyGems.org. This means they will
not appear in `gem list` output, and their executables will not be available
in the shell PATH directly.

To run executables from git gems, use `bundle exec`. To check which git gems
are installed in your bundle, run `bundle list`.

### Why Can't I Use Different Versions of a Gem in Different Groups?

**Q**: I want to use one version of a gem in development and a different
version in production. Can I specify different versions in different groups?

**A**: No. Bundler resolves a single version for each gem across all groups
and all platforms. This is by design — `Gemfile.lock` must contain one
resolved version per gem so that every environment uses the same dependency
set. If Bundler allowed different versions per group, installing in one
environment could silently change which version of a gem you get in another,
defeating the purpose of the lockfile.
