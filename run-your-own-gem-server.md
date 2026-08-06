---
layout: default
title: Run your own gem server
url: /run-your-own-gem-server
previous: /ci
next: /using-s3-source
---

<em class="text-neutral-600">Need to serve gems locally or for your organization?</em>

There are times you would like to run your own gem server.  You may want to
share gems with colleagues when you are both without internet connectivity. You
may have private code, internal to your organization, that you'd like to
distribute and manage as gems without making the source publicly available.

There are a few options to set up a server to host gems from within your organization. This guide covers the [Gemstash](https://github.com/rubygems/gemstash) and [Gem in a Box](https://github.com/geminabox/geminabox) projects. It also discusses how to use these servers as gem sources during development. If you would rather not run a server at all, you can [serve gems from an S3 bucket](/using-s3-source) instead.

## Running Gemstash

Gemstash is both a cache for remote servers (such as <https://rubygems.org>), and a private gem source.

To get started, install `gemstash`:

    $ gem install gemstash

After it is installed, start the Gemstash server with the following command:

    $ gemstash start

By default, the server runs on port 9292.

If you want to use it as a cache, you can tell Bundler to use Gemstash to find gems from RubyGems.org:

    $ bundle config set mirror.https://rubygems.org http://localhost:9292

With this configuration, all gems fetched from RubyGems.org via bundler are cached by Gemstash.

You can also push your own gems and use the gemstash server as a private gem source. For more information about gemstash features and commands, read the [Gemstash](https://github.com/rubygems/gemstash) documentation.

## Running Gem in a Box

For a standalone private gem server with a web interface, try out the [Gem in a Box](https://github.com/geminabox/geminabox) project.

Gem in a Box is a Rack application, so it needs a web server to run. To get started, install `geminabox` along with a server:

    $ gem install geminabox puma rackup

Make a data directory for storing gems:

    $ mkdir data

Include the following in a `config.ru` file:

    require "geminabox"

    Geminabox.data = "./data"
    run Geminabox::Server

And run the server:

    $ rackup
    Puma starting in single mode...
    * Listening on http://127.0.0.1:9292

Now you can push gems using the `gem inabox` command.  The first time you do this, you'll be prompted for the location of your gem server.

    $ gem build secretgem.gemspec
      Successfully built RubyGem
      Name: secretgem
      Version: 0.0.1
      File: secretgem-0.0.1.gem
    $ gem inabox ./secretgem-0.0.1.gem
    Enter the root url for your personal geminabox instance (e.g. http://gems/).
    Host:  http://localhost:9292
    Pushing secretgem-0.0.1.gem to http://localhost:9292/...
    Gem secretgem-0.0.1.gem received and indexed.

There is a web interface available on [http://localhost:9292](http://localhost:9292) as well.  For more information, read the [Gem in a Box](https://github.com/geminabox/geminabox) README.

## Using gems from your server

Whether you use Gemstash, Gem in a Box, or another gem server, you can configure RubyGems to use your local or internal source alongside other sources such as [https://rubygems.org](https://rubygems.org).

Use the `gem sources` command to add the gem server to your system-wide gem sources:

    $ gem sources --add http://localhost:9292

Then install gems as usual:

    $ gem install secretgem
    Successfully installed secretgem-0.0.1
    1 gem installed

If you're using [Bundler](/getting_started) then you can add the server to your `Gemfile`. Use a source block so that only your private gems are looked up there:

    source "https://rubygems.org"

    source "http://localhost:9292" do
      gem "secretgem"
    end

If your server requires a username and password, configure the credentials with `bundle config` instead of writing them into the `Gemfile`. See [credentials for gem sources](/command-reference/bundle-config/#CREDENTIALS-FOR-GEM-SOURCES) for details.
