---
layout: default
title: RubyGems Basics
url: /rubygems-basics
previous: /installation
next: /getting_started
---

<em class="text-neutral-600">Use of common RubyGems commands</em>

The `gem` command allows you to interact with RubyGems.

RubyGems ships with Ruby, so the `gem` command is available as soon as Ruby is installed. See the [Installation guide](/installation) to check your setup or to upgrade RubyGems itself.

If you want to see how to require files from a gem, skip ahead to [What is a
gem](/what-is-a-gem)

* [Finding Gems](#finding-gems)
* [Installing Gems](#installing-gems)
* [Running Executables Without Installing](#running-executables-without-installing)
* [Requiring Code](#requiring-code)
* [Listing Installed Gems](#listing-installed-gems)
* [Uninstalling Gems](#uninstalling-gems)
* [Viewing Documentation](#viewing-documentation)
* [Fetching and Unpacking Gems](#fetching-and-unpacking-gems)
* [Further Reading](#further-reading)

Finding Gems
------------

The `search` command lets you find remote gems by name.  You can use regular
expression characters in your query:

    $ gem search ^rails

    *** REMOTE GEMS ***

    rails (8.1.3)
    rails-3-settings (0.1.1)
    rails-access-control (0.0.3)
    rails-acm (0.1.0)
    rails-action-args (0.1.1)
    [...]

If you see a gem you want more information on you can add the details option.
You'll want to do this with a small number of gems, though, as listing gems
with details requires downloading more files:

    $ gem search ^rails$ -d

    *** REMOTE GEMS ***

    rails (8.1.3)
        Author: David Heinemeier Hansson
        Homepage: https://rubyonrails.org
        License: MIT

        Full-stack web application framework.

You can also search for gems on rubygems.org such as [this search for
rake](https://rubygems.org/search?query=rake)

Installing Gems
---------------

The `install` command downloads and installs the gem and any necessary
dependencies then builds documentation for the installed gems.

    $ gem install drip
    Fetching drip-0.1.1.gem
    Fetching rbtree-0.4.5.gem
    Building native extensions. This could take a while...
    Successfully installed rbtree-0.4.5
    Successfully installed drip-0.1.1
    Parsing documentation for rbtree-0.4.5
    Installing ri documentation for rbtree-0.4.5
    Parsing documentation for drip-0.1.1
    Installing ri documentation for drip-0.1.1
    Done installing documentation for rbtree, drip after 0 seconds
    2 gems installed

Here the drip command depends upon the rbtree gem which has an extension.
RubyGems installs the dependency rbtree and builds its extension, installs the
drip gem, then builds documentation for the installed gems.

You can disable documentation generation using the `--no-document` argument when
installing gems.

Running Executables Without Installing
--------------------------------------

The `exec` command runs an executable from a gem, installing the gem first if necessary. It is a shortcut for running `gem install` and then the command itself:

    $ gem exec rails new my_app

RubyGems uses the most recent version of the gem unless you specify one with `--version` or allow prereleases with `--prerelease`. Pass `--conservative` to prefer the most recent version that is already installed. If the executable name differs from the gem name, name the gem with `--gem`. Gems installed this way are kept separate from your user-installed gems.

See [gem exec](/command-reference#gem-exec) in the Command Reference for details.

Requiring code
--------------

RubyGems modifies your Ruby load path, which controls how your Ruby code is
found by the `require` statement. When you `require` a gem, really you're just
placing that gem's `lib` directory onto your `$LOAD_PATH`. Let's try this out
in `irb`.

    % irb
    irb(main):001> pp $LOAD_PATH
    [".../lib/ruby/site_ruby/4.0.0",
     ".../lib/ruby/site_ruby/4.0.0/arm64-darwin27",
     ".../lib/ruby/site_ruby",
     ".../lib/ruby/vendor_ruby/4.0.0",
     ".../lib/ruby/vendor_ruby/4.0.0/arm64-darwin27",
     ".../lib/ruby/vendor_ruby",
     ".../lib/ruby/4.0.0",
     ".../lib/ruby/4.0.0/arm64-darwin27"]

By default you have just a few system directories on the load path and the Ruby
standard libraries.  To add the awesome_print directories to the load path,
you can require one of its files:

    $ gem install awesome_print
    [...]
    $ irb
    irb(main):001> require "ap"
    => true
    irb(main):002> pp $LOAD_PATH.first
    ".../gems/awesome_print-1.9.2/lib"

*Tip: Passing `-r` to `irb` will automatically require a library when irb is
loaded.*

    $ irb -rap
    irb(main):001> ap $LOAD_PATH
    [
        [0] ".../gems/awesome_print-1.9.2/lib",
        [1] ".../lib/ruby/site_ruby/4.0.0",
        [2] ".../lib/ruby/site_ruby/4.0.0/arm64-darwin27",
        [3] ".../lib/ruby/site_ruby",
        [4] ".../lib/ruby/vendor_ruby/4.0.0",
        [5] ".../lib/ruby/vendor_ruby/4.0.0/arm64-darwin27",
        [6] ".../lib/ruby/vendor_ruby",
        [7] ".../lib/ruby/4.0.0",
        [8] ".../lib/ruby/4.0.0/arm64-darwin27"
    ]

Once you've required `ap`, RubyGems automatically places its
`lib` directory on the `$LOAD_PATH`.

That's basically it for what's in a gem.  Drop Ruby code into `lib`, name a
Ruby file the same as your gem (for the gem "freewill" the file should be
`freewill.rb`, see also [name your gem](/name-your-gem)) and it's loadable by
RubyGems.

The `lib` directory itself normally contains only one `.rb` file and a
directory with the same name as the gem which contains the rest of the files.

For example:

    % tree freewill/
    freewill/
    └── lib/
        ├── freewill/
        │   ├── user.rb
        │   ├── widget.rb
        │   └── ...
        └── freewill.rb

Listing Installed Gems
----------------------

The `list` command shows your locally installed gems:

    $ gem list

    *** LOCAL GEMS ***

    abbrev (0.1.2)
    awesome_print (1.9.2)
    base64 (0.3.0)
    benchmark (0.5.0)
    bigdecimal (4.0.1)
    bundler (default: 4.0.16)
    csv (3.3.5)
    date (default: 3.5.1)
    debug (1.11.1)
    delegate (default: 0.6.1)
    did_you_mean (default: 2.0.0)
    digest (default: 3.2.1)
    drb (2.2.3)
    drip (0.1.1)
    english (default: 0.8.1)
    [...]

The list includes default gems and bundled gems both of which were shipped
with Ruby by default. In Ruby 4.0, the default gems are 46 gems in total
including bundler, erb, json, psych etc. and the bundled gems are csv, debug,
rake etc.

Uninstalling Gems
-----------------

The `uninstall` command removes the gems you have installed.

    $ gem uninstall drip
    Successfully uninstalled drip-0.1.1

If you uninstall a dependency of a gem RubyGems will ask you for confirmation.

    $ gem uninstall rbtree

    You have requested to uninstall the gem:
            rbtree-0.4.5

    drip-0.1.1 depends on rbtree (>= 0)
    If you remove this gem, these dependencies will not be met.
    Continue with Uninstall? [yN]  n
    ERROR:  While executing gem ... (Gem::DependencyRemovalException)
        Uninstallation aborted due to dependent gem(s)

Viewing Documentation
---------------------

You can view the documentation for your installed gems with `ri`:

    $ ri RBTree
    = RBTree < MultiRBTree

    (from gem rbtree-0.4.5)
    ------------------------------------------------------------------------
    A sorted associative collection that cannot contain duplicate keys.
    RBTree is a subclass of MultiRBTree.
    ------------------------------------------------------------------------


Fetching and Unpacking Gems
---------------------------

If you wish to audit a gem's contents without installing it you can use the
`fetch` command to download the .gem file then extract its contents with the
`unpack` command.

    $ gem fetch malice
    Fetching malice-13.gem
    Downloaded malice-13
    $ gem unpack malice-13.gem
    Unpacked gem: '.../malice-13'
    $ more malice-13/README

    Malice v. 13

    DESCRIPTION

    A small, malicious library.

    [...]
    $ rm -r malice-13*

You can also unpack a gem you have installed, modify a few files, then use the
modified gem in place of the installed one:

    $ gem unpack rake
    Unpacked gem: '.../rake-13.4.2'
    $ vim rake-13.4.2/lib/rake/...
    $ ruby -I rake-13.4.2/lib -S rake some_rake_task
    [...]

The `-I` argument adds your unpacked rake to the ruby `$LOAD_PATH` which
prevents RubyGems from loading the gem version (or the default version).  The
`-S` argument finds `rake` in the shell's `$PATH` so you don't have to type out
the full path.

Further Reading
---------------

This guide only shows the basics of using the `gem` command.  For information
on what's inside a gem and how to use one you've installed see the next
section, [What is a gem](/what-is-a-gem).  For a complete reference of gem
commands see the [Command Reference](/command-reference).
