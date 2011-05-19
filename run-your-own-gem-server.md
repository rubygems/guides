---
layout: default
title: Run your own gem server
previous: /rubygems-org-api
next: /c-extensions
---

{% include big.html %}

There are times you would like to run your own gem server.  You may want to share gems with colleagues when you are both without internet connectivity.  You may have private code, internal to your organization, that you'd like to distribute and manage as gems without making the source publicly available.

There are a few options to set up a server to host gems from within your organization.  Here, we'll cover the `gem server` command and the [Gem in a box](https://github.com/cwninja/geminabox) project.  Then, we'll discuss how to use these servers as gem sources during development.

## Running the built-in gem server

There is a `gem server` command available to any machine running RubyGems, and this is the fastest way to start hosting gems.  Just run the command:

    gem server

This will serve all your installed gems from your local machine at [http://localhost:8808](http://localhost:8808).  Visiting this in your browser, you'll find that the `gem server` command provides an HTML documentation index.

When new gems are added, they are automatically available.

For a complete list of options, run:

    gem server --help

## Running Gem in a box

If you'd like something more featureful, including the ability to push gems, try out the [Gem in a box](https://github.com/cwninja/geminabox) project.

To get started, install `geminabox`:

    [~/dev/geminabox] gem install geminabox
    Fetching: geminabox-0.2.15.gem (100%)
    Successfully installed geminabox-0.2.15
    1 gem installed

Make a data directory for storing gems:

    [~/dev/geminabox] mkdir data

Include the following in a `config.ru` file:

    [~/dev/geminabox] cat config.ru
    require "rubygems"
    require "geminabox"

    Geminabox.data = "./data"
    run Geminabox

And run the server:

    [~/dev/geminabox] rackup
    [2011-05-19 12:09:40] INFO  WEBrick 1.3.1
    [2011-05-19 12:09:40] INFO  ruby 1.9.2 (2011-02-18) [x86_64-darwin10.5.0]
    [2011-05-19 12:09:40] INFO  WEBrick::HTTPServer#start: pid=60941 port=9292

Now you can push gems using the `gem inabox` command.  The first time you do this, you'll be prompted for the location of your gem server.

    [~/dev/secretgem] gem build secretgem.gemspec  
      Successfully built RubyGem
      Name: secretgem
      Version: 0.0.1
      File: secretgem-0.0.1.gem
    [~/dev/secretgem] gem inabox ./secretgem-0.0.1.gem 
    Enter the root url for your personal geminabox instance. (E.g. http://gems/)
    Host:  http://localhost:9292
    Pushing secretgem-0.0.1.gem to http://localhost:9292/...

There is a web interface available on [http://localhost:9292](http://localhost:9292) as well.  For more information, read the [Gem in a box](https://github.com/cwninja/geminabox) README.

## Using gems from your server

Whether you use `gem server`, Gem in a box, or another gem server, you can configure RubyGems to use your local or internal source alongside other sources such as [http://rubygems.org](http://rubygems.org).

Use the `gem sources` command to add the gem server to your system-wide gem sources.  The following URL is the default for running Gem in a box via `rackup`:

    gem sources --add http://localhost:9292

Then install gems as usual:

    [~] gem install secretgem
    Successfully installed secretgem-0.0.1
    1 gem installed

If you're using [Bundler](http://gembundler.com) then you can specify this server as a gem source in your `Gemfile`:

    [~/dev/myapp] cat Gemfile
    source "http://localhost:9292"
    gem "secretgem"

    [~/dev/myapp] bundle
    Using secretgem (0.0.1)
    Using bundler (1.0.13)
    Your bundle is complete! Use `bundle show [gemname]` to see where a bundled gem is installed.
