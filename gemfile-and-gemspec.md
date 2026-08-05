---
layout: default
title: Gemfile and gemspec
url: /gemfile-and-gemspec
previous: /what-is-a-gem
next: /gem-installation-and-loading
---

<em class="text-neutral-600">Which file your dependencies belong in, and why Ruby projects have two of them.</em>

Ruby projects declare dependencies in two different files, a `.gemspec` and a `Gemfile`. Newcomers often ask which one to use. The answer depends on what you are building. A gemspec describes a gem. A Gemfile describes an application's environment.

Two files, two jobs
-------------------

A gemspec is the manifest of a gem. It declares the gem's name, version, summary, files, and the other gems it needs, and it is packaged into the `.gem` file that `gem build` produces. When someone installs your gem, RubyGems reads the gemspec to decide what else to install. Every gem has one. The [Specification Reference](/specification-reference) covers all of its fields.

A Gemfile is the input to [Bundler](/getting_started). It declares the set of gems an application uses, and `bundle install` resolves that set into an exact snapshot recorded in `Gemfile.lock`. The Gemfile exists so the same versions can be reproduced on every machine that runs the application. See [How to manage dependencies with Bundler](/dependency_management) and the [Gemfile Reference](/gemfile).

Declaring dependencies
----------------------

A gemspec declares dependencies with `add_dependency` for gems needed at runtime and `add_development_dependency` for gems needed only to work on the gem itself:

~~~ruby
Gem::Specification.new do |s|
  # ...
  s.add_dependency "activesupport", ">= 7.0"
  s.add_development_dependency "rspec", ">= 3.0"
end
~~~

A Gemfile declares dependencies with the `gem` method:

~~~ruby
source "https://rubygems.org"

gem "rails", "8.1.3.1"
gem "nokogiri", "~> 1.19"
~~~

The version constraints look alike but pull in opposite directions. A gem's constraints should stay wide, because your gem must coexist with every other gem an application installs alongside it, and strict constraints cause resolution conflicts for your users. See [Optimistic vs. pessimistic constraints](/semver#optimistic-vs-pessimistic-constraints). An application can afford loose constraints in its Gemfile, because exactness comes from `Gemfile.lock` rather than from the requirements themselves.

Using both while developing a gem
---------------------------------

While developing a gem you still want Bundler to set up a working environment, so a gem's repository usually contains both files. The convention is to declare runtime dependencies in the gemspec, pull them into the bundle with the `gemspec` method, and declare development dependencies directly in the Gemfile:

~~~ruby
source "https://rubygems.org"

gemspec

gem "rspec", "~> 3.13"
gem "rubocop"
~~~

The `gemspec` method treats the gemspec's runtime dependencies as Gemfile entries in the default group, puts any `add_development_dependency` entries in the `:development` group, and adds the gem itself as a `path` dependency so your tests can require it. Declaring development dependencies only in the gemspec works fine on its own, but once both files are in play, prefer the Gemfile for them. A gemspec can only name a gem and a version requirement, while the Gemfile lets you adjust each dependency to the needs of the library you are developing, with groups, git or path sources, and platform conditions. This is the layout `bundle gem` generates. See [Bundler in gems](/rubygems) for the `gemspec` method's options and [Make your own gem](/make-your-own-gem) for the full workflow.

Building a library vs. building an application
----------------------------------------------

The deeper difference is who resolves the versions. An application is the end of the dependency chain, so it locks: `Gemfile.lock` is committed and every deployment installs exactly those versions. A library is a link in someone else's chain, so it cannot lock. When an application depends on your gem, Bundler ignores any `Gemfile` and `Gemfile.lock` shipped inside it and resolves your gemspec's runtime dependencies together with everything else in the application's Gemfile. Your gem will run with whatever versions that resolution picks, which is why wide constraints and testing against a range of versions matter for libraries. Whether to commit the lockfile of a gem's own repository is a separate tradeoff, discussed in the [FAQs](/faqs#using-gemfiles-inside-gems).

Which file gets what
--------------------

| What you are declaring | Where it goes |
|------------------------|---------------|
| The gem's name, version, and metadata | gemspec |
| Gems your gem needs at runtime | gemspec, `add_dependency` |
| Gems needed only to develop your gem | gemspec, `add_development_dependency`, or the Gemfile when you use both files |
| Gems your application uses | Gemfile |
| Exact versions for reproducible installs | `Gemfile.lock`, written by Bundler |
