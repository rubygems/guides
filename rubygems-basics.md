---
layout: default
title: RubyGems Basics
url: /rubygems-basics
previous: /
next: /what-is-a-gem
---

<em class="t-gray">Use of common RubyGems commands</em>

The `gem` command allows you to interact with RubyGems.

Ruby 1.9 and newer ships with RubyGems built-in but you may need to upgrade for
bug fixes or new features.  To upgrade RubyGems, visit the
[download](https://rubygems.org/pages/download) page.

If you want to see how to require files from a gem, skip ahead to [What is a
gem](/what-is-a-gem)

* [Finding Gems](#finding-gems)
* [Installing Gems](#installing-gems)
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

    rails (7.0.3)
    rails-3-settings (0.1.1)
    rails-acm (0.1.0)
    rails-action-args (0.1.1)
    rails-action-authorization (1.1.2)
    [...]

If you see a gem you want more information on you can add the details option.
You'll want to do this with a small number of gems, though, as listing gems
with details requires downloading more files:

    $ gem search ^rails$ -d

    *** REMOTE GEMS ***

    rails (7.0.3)
        Author: David Heinemeier Hansson
        Homepage: https://rubyonrails.org

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

Here the drip command depends upon the rbtree gem which has an extension.  Ruby
installs the dependency rbtree and builds its extension, installs the drip gem,
then builds documentation for the installed gems.

You can disable documentation generation using the `--no-document` argument when
installing gems.

Requiring code
--------------

RubyGems modifies your Ruby load path, which controls how your Ruby code is
found by the `require` statement. When you `require` a gem, really you're just
placing that gem's `lib` directory onto your `$LOAD_PATH`. Let's try this out
in `irb`.

    % irb
    irb(main):001:0> pp $LOAD_PATH
    [".../lib/ruby/site_ruby/3.1.0",
     ".../lib/ruby/site_ruby/3.1.0/x86_64-linux",
     ".../lib/ruby/site_ruby",
     ".../lib/ruby/vendor_ruby/3.1.0",
     ".../lib/ruby/vendor_ruby/3.1.0/x86_64-linux",
     ".../lib/ruby/vendor_ruby",
     ".../lib/ruby/3.1.0",
     ".../lib/ruby/3.1.0/x86_64-linux"]

By default you have just a few system directories on the load path and the Ruby
standard libraries.  To add the awesome_print directories to the load path,
you can require one of its files:

    $ gem install awesome_print
    [...]
    $ irb
    irb(main):001:0> require "ap"
    => true
    irb(main):002:0> pp $LOAD_PATH.first
    ".../gems/awesome_print-1.9.2/lib"

*Tip: Passing `-r` to `irb` will automatically require a library when irb is
loaded.*

    $ irb -rap
    irb(main):001:0> ap $LOAD_PATH
    [
        [0] ".../bundle/gems/awesome_print-1.9.2/lib",
        [1] ".../lib/ruby/site_ruby/3.1.0",
        [2] ".../lib/ruby/site_ruby/3.1.0/x86_64-linux",
        [3] ".../lib/ruby/site_ruby",
        [4] ".../lib/ruby/vendor_ruby/3.1.0",
        [5] ".../lib/ruby/vendor_ruby/3.1.0/x86_64-linux",
        [6] ".../lib/ruby/vendor_ruby",
        [7] ".../lib/ruby/3.1.0",
        [8] ".../lib/ruby/3.1.0/x86_64-linux"
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

    abbrev (default: 0.1.0)
    awesome_print (1.9.2)
    base64 (default: 0.1.1)
    benchmark (default: 0.2.0)
    bigdecimal (default: 3.1.1)
    bundler (default: 2.3.7)
    cgi (default: 0.3.1)
    csv (default: 3.2.2)
    date (default: 3.2.2)
    debug (1.4.0)
    delegate (default: 0.2.0)
    did_you_mean (default: 1.6.1)
    digest (default: 3.1.0)
    drb (default: 2.1.0)
    drip (0.1.1)
    english (default: 0.7.1)
    [...]

The list includes defaults gems and bundled gems both of which were shipped
with Ruby by default. In Ruby 3.1, the default gems are 70 gems in total
including bigdecimal, bundler, csv, did_you_mean etc. and the bundled gems are
debug, rake etc.

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
    Unpacked gem: '.../13.0.6'
    $ vim 13.0.6/lib/rake/...
    $ ruby -I 13.0.6/lib -S rake some_rake_task
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
