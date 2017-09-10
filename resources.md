---
layout: default
title: Resources
url: /resources
previous: /run-your-own-gem-server
next: /contributing
---

<em class="t-gray">Great blog posts, tutorials, and other sites to help you out.</em>

A collection of helpful material about RubyGems. Feel free to
[fork](https://github.com/rubygems/guides) and add your own!

Tutorials
---------

* [Making Ruby Gems](http://timelessrepo.com/making-ruby-gems)
* [Gemcutter & Jeweler](http://railscasts.com/episodes/183-gemcutter-jeweler)
* [MicroGems: five minute RubyGems](http://jeffkreeftmeijer.com/2011/microgems-five-minute-rubygems/) - Gems so small that you can store them in a gist.
* [Let's Write a Gem: Part 1](http://rakeroutes.com/blog/lets-write-a-gem-part-one/) and [Part 2](http://rakeroutes.com/blog/lets-write-a-gem-part-two/)
* [Polishing Rubies](https://wayback.archive.org/web/20151009055337/https://www.intridea.com/blog/tag/polishing%20rubies)
* [A Practical Guide to Using Signed Ruby Gems - Part 1: Bundler](http://blog.meldium.com/home/2013/3/3/signed-rubygems-part)
* [Basic RubyGem Development](http://tech.pro/tutorial/1226/basic-rubygem-development) and [Intermediate RubyGem Development](http://tech.pro/tutorial/1277/intermediate-rubygem-development)
* [How to make a Rubygem](http://www.alexedwards.net/blog/how-to-make-a-rubygem) and [How to make a Rubygem: Part Two](http://www.alexedwards.net/blog/how-to-make-a-rubygem-part-two)
* [Crafting Gems](http://railsconftutorials.com/2013/sessions/crafting_gems.html) - A tutorial from RailsConf 2013.
* [How to cryptographically sign your RubyGem](http://www.benjaminfleischer.com/2013/11/08/how-to-sign-your-rubygem-cert/) - Step-by-step guide

Presentations
-------------

* [History of RDoc and RubyGems](http://blog.segment7.net/2011/01/17/history-of-rdoc-and-rubygems)
* [Building a Gem](http://www.slideshare.net/sarah.allen/building-a-ruby-gem)
* [Gemology](http://www.slideshare.net/copiousfreetime/gemology)

Philosophy
----------

* [Semantic Versioning](http://semver.org/)
* [Ruby Packaging Standard](http://chneukirchen.github.com/rps/)
* [Why `require 'rubygems'` Is Wrong](http://tomayko.com/writings/require-rubygems-antipattern)
* [How to Name Gems](http://blog.segment7.net/2010/11/15/how-to-name-gems)
* [Make the world a better place; put a license in your gemspec](http://www.benjaminfleischer.com/2013/07/12/make-the-world-a-better-place-put-a-license-in-your-gemspec/)

Patterns
--------

* [Gem Packaging: Best Practices](http://weblog.rubyonrails.org/2009/9/1/gem-packaging-best-practices)
* [Rubygems Good Practice](http://yehudakatz.com/2009/07/24/rubygems-good-practice/)
* [Gem Development Best Practices](http://blog.carbonfive.com/2011/01/22/gem-development-best-practices/)

Creating
--------

Tools to help build gems.

* [hoe](https://github.com/seattlerb/hoe) - Rake/RubyGems helper.
* [Jeweler](https://github.com/technicalpickles/jeweler) - Opinionated tool for managing RubyGems projects.
* [RStack](https://github.com/jrun/rstack) - Generator intended for use on private gems.
* [rubygems-tasks](https://github.com/postmodern/rubygems-tasks) - Rake tasks for building, installing, and releasing Ruby Gems.
* [ore](https://github.com/ruby-ore/ore) - Project generator with a variety of templates.
* [Omnibus](https://github.com/opscode/omnibus-ruby) - Generate full-stack installers for ruby code (see this [Omnibus tutorial](http://blog.scoutapp.com/articles/2013/06/21/omnibus-tutorial-package-a-standalone-ruby-gem) for instructions on using it to package a standalone RubyGem.)
* [Gemsmith](https://github.com/bkuhlmann/gemsmith) - Smith (generate) gem skeletons with best practices, autogenerate change logs, build/publish gems (including signed versions/tags), and much more!

Monitoring
----------

Tools to watch gems for changes.

* [Gemnasium](https://gemnasium.com/) - Parses your GitHub projects to learn what to notify you about. Free for public repos only.
* [Gemnasium gem](https://github.com/gemnasium/gemnasium-gem) - Allows you to use Gemnasium without granting it access to private repos.
* [gemwhisperer](https://github.com/rubygems/gemwhisperer)
* [Libraries.io](https://libraries.io/) - Get alerts for new versions of the gems you depend upon.

Hosting and Serving
-------------------

* [Geminabox](https://github.com/cwninja/geminabox) - Host your own gems, with a rubygems-compatible API.
* [Gem Mirror](https://github.com/YorickPeterse/gem-mirror) - Run an internal mirror of external gem sources.
* [Gemfury](http://www.gemfury.com/) - Private cloud-based RubyGems servers. Priced by number of collaborators.

Utilities
---------

* [gemnasium-parser](https://github.com/laserlemon/gemnasium-parser) - Determine dependencies without evaluating the ruby in gemfiles or gemspecs
* [Gemrat](https://github.com/DruRly/gemrat) - Add the latest version of a gem to your Gemfile from the command line.
