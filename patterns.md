---
layout: default
title: Patterns
url: /patterns
previous: /name-your-gem
next: /gems-with-extensions
---

<em class="text-neutral-600">Common practices to make your gem users' and other developers' lives easier.</em>

This page covers conventions for naming and structuring a gem and for loading its code. Guidance that used to live here has moved: for version numbering, prerelease versions, and dependency constraints see [Versioning and compatibility](/versioning), and for where to declare runtime and development dependencies see [Gemfile and gemspec](/gemfile-and-gemspec).

* [Consistent naming](#consistent-naming)
* [Loading code](#loading-code)

Consistent naming
-----------------

> There are only two hard things in Computer Science: cache invalidation and naming things.
> -[Phil Karlton](https://martinfowler.com/bliki/TwoHardThings.html)

### File names

Be consistent with how the files of your gem are named. This is the layout `bundle gem hola --exe` generates, with the support files trimmed:

    % tree hola
    hola
    ├── Gemfile
    ├── Rakefile
    ├── exe
    │   └── hola
    ├── hola.gemspec
    ├── lib
    │   ├── hola
    │   │   └── version.rb
    │   └── hola.rb
    └── test
        ├── test_helper.rb
        └── test_hola.rb

The executable in `exe` and the primary file in `lib` are named after the gem. A developer can easily jump in and call `require 'hola'` with no problems. Everything beyond the primary file lives in a directory with the gem's name, like `lib/hola/version.rb`, for reasons covered in the [Loading code](#loading-code) section below.

### Naming your gem

Naming your gem is important.  Before you pick a name for your gem, do a
quick search on [RubyGems.org](https://rubygems.org) and
[GitHub](https://github.com/search) to see if someone else has taken it.  Every
published gem must have a unique name.  Be sure to read our [naming
recommendations](/name-your-gem) when you've found a name you like.

Loading code
------------

At its core, RubyGems exists to help you manage Ruby's `$LOAD_PATH`, which is
how the `require` statement picks up new code. There's several things you can
do to make sure you're loading code the right way.

### Respect the global load path

When packaging your gem files, you need to be careful of what is in your `lib`
directory. Every gem you have installed gets its `lib` directory appended onto
your `$LOAD_PATH`. This means any file on the top level of the `lib` directory
could get required.

For example, let's say we have a `foo` gem with the following structure:

    .
    └── lib
        ├── foo
        │   └── cgi.rb
        ├── erb.rb
        ├── foo.rb
        └── set.rb

This might seem harmless since your custom `erb` and `set` files are within
your gem.  However, this is not harmless, anyone who requires this gem will not
be able to bring in the
[ERB](https://docs.ruby-lang.org/en/master/ERB.html) or
[Set](https://docs.ruby-lang.org/en/master/Set.html) classes
provided by Ruby's standard library.

The best way to get around this is to keep files in a different directory
under `lib`. The usual convention is to be consistent and put them in the same
folder name as your gem's name, for example `lib/foo/cgi.rb`.

### Requiring files relative to each other

Gems should not have to use `__FILE__` to bring in other Ruby files in your
gem. Code like this is surprisingly common in gems:

    require File.join(
              File.dirname(__FILE__),
              "foo", "bar")

Or:

    require File.expand_path(File.join(
              File.dirname(__FILE__),
              "foo", "bar"))

The fix is simple, just require the file relative to the load path:

    require 'foo/bar'

Or use require_relative:

    require_relative 'foo/bar'

The [make your own gem](/make-your-own-gem) guide has a great example of this
behavior in practice, including a working test suite. The code for that gem is
[on GitHub](https://github.com/qrush/hola) as well.

### Mangling the load path

Gems should not change the `$LOAD_PATH` variable.  RubyGems manages this for
you.  Code like this should not be necessary:

    lp = File.expand_path(File.dirname(__FILE__))
    unless $LOAD_PATH.include?(lp)
      $LOAD_PATH.unshift(lp)
    end

Or:

    __DIR__ = File.dirname(__FILE__)

    $LOAD_PATH.unshift __DIR__ unless
      $LOAD_PATH.include?(__DIR__) ||
      $LOAD_PATH.include?(File.expand_path(__DIR__))

When RubyGems activates a gem, it adds your package's `lib` folder to the
`$LOAD_PATH` ready to be required normally by another lib or application.  It
is safe to assume you can then `require` any file in your `lib` folder.

### Don't use `gem` from within your gem

You may have seen some code like this around to make sure a specific version
of a gem is activated before requiring it:

    gem "extlib", ">= 1.0.8"
    require "extlib"

Gems **should not** do this. Declare the requirement in the gemspec instead,
so the resolver can weigh it together with every other gem's requirements, and
let RubyGems handle activating the right version. Applications control their
dependency versions with [Bundler](/getting_started) rather than `gem` calls.

Credits
-------

Several sources were used for content for this guide:

* [Rubygems Good Practice](https://yehudakatz.com/2009/07/24/rubygems-good-practice/)
* [Gem Packaging: Best Practices](https://weblog.rubyonrails.org/2009/9/1/gem-packaging-best-practices)
