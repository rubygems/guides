---
layout: default
title: What is a gem?
url: /what-is-a-gem/
previous: /rubygems-basics/
next: /make-your-own-gem/
---

<em class="t-gray">Unpack the mystery behind what's in a RubyGem.</em>

Structure of a Gem
------------------

Each gem has a name, version, and platform. For example, the
[rake](https://rubygems.org/gems/rake) gem has a `13.0.6` version (from Jul
2021).  Rake's platform is `ruby`, which means it works on any platform Ruby
runs on.

Platforms are based on the CPU architecture, operating system type and
sometimes the operating system version.  Examples include "x86-mingw32" or
"java".  The platform indicates the gem only works with a ruby built for the
same platform.  RubyGems will automatically download the correct version for
your platform.  See `gem help platform` for full details.

Inside gems are the following components:

* Code (including tests and supporting utilities)
* Documentation
* gemspec

Each gem follows the same standard structure of code organization:

    % tree freewill
    freewill/
    ├── bin/
    │   └── freewill
    ├── lib/
    │   └── freewill.rb
    ├── test/
    │   └── test_freewill.rb
    ├── README
    ├── Rakefile
    └── freewill.gemspec

Here, you can see the major components of a gem:

* The `lib` directory contains the code for the gem
* The `test` or `spec` directory contains tests, depending on which test
  framework the developer uses
* A gem usually has a `Rakefile`, which the
  [rake](https://rubygems.org/gems/rake) program uses to automate tests,
  generate code, and perform other tasks.
* This gem also includes an executable file in the
  `bin` directory, which will be loaded into the user's `PATH` when the gem is
  installed.
* Documentation is usually included in the `README` and inline with the code.
  When you install a gem, documentation is generated automatically for you.
  Most gems include [RDoc](https://ruby.github.io/rdoc/) documentation,
  but some use [YARD](https://yardoc.org/) docs instead.
* The final piece is the gemspec, which contains information about the gem.
  The gem's files, test information, platform, version number and more are all
  laid out here along with the author's email and name.

[More information on the gemspec file](/specification-reference/)

[Building your own gem](/make-your-own-gem/)

The Gemspec
-----------

The gemspec specifies the information about a gem such as its name, version,
description, authors and homepage.

Here's an example of a gemspec file. You can learn more in [how to make a
gem](/make-your-own-gem/).

    % cat freewill.gemspec
    Gem::Specification.new do |s|
      s.name        = 'freewill'
      s.version     = '1.0.0'
      s.summary     = "Freewill!"
      s.description = "I will choose Freewill!"
      s.authors     = ["Nick Quaranto"]
      s.email       = 'nick@quaran.to'
      s.homepage    = 'http://example.com/freewill'
      s.files       = ["lib/freewill.rb", ...]
    end

For more information on the gemspec, please check out the full [Specification
Reference](/specification-reference/) which goes over each metadata field in
detail.

Credits
-------

This guide was adapted from [Gonçalo
Silva](https://twitter.com/goncalossilva)'s original tutorial on
docs.rubygems.org and from Gem Sawyer, Modern Day Ruby Warrior.
