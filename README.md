RubyGems Guides
===============

An effort to provide awesome documentation for the RubyGems ecosystem.

Goals
-----

* Be the definitive place for RubyGems knowledge
* Help out those new to RubyGems get started and get things done
* Make it easy to contribute more guides

Want to help?
-------------

If a guide is empty, start filling it out! Or, make a new one! Pull requests
are gladly accepted!

* Pick one from [the repo issues](https://github.com/rubygems/guides/issues)
* Port content from help.rubygems.org knowledge base
* Find lots of StackOverflow/ruby-talk questions and get their common answers in here
* Fill out more guides!

Setup
-----

First, run `bundle install` and `bundle exec rake`. This will launch both Jekyll and
Sass in "watch" mode.

The pages will be available at http://localhost:4000/

Every guide except for the Command and Specification Reference is just a
straight up markdown page, so just go edit it!

For the Command Guide (`command-reference.md`), edit `command-reference.erb`
and run:

    $ bundle exec rake command_guide

For the Specification Guide, the documentation comes directly from the
`Gem::Specification` class in RubyGems. Edit it, set your `RUBYGEMS_DIR` to
where your code directory is, and run:

    $ RUBYGEMS_DIR=~/Dev/ruby/rubygems bundle exec rake spec_guide --trace

Thanks
------

Huge thanks to [thoughtbot](https://thoughtbot.com) whose [playbook](https://thoughtbot.com/playbook) this is based off of.

Legal
-----

The actual content of the articles is licensed under Creative Commons. The code that this project consists of is licensed under MIT.
