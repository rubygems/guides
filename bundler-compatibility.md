---
layout: default
title: Bundler compatibility with Ruby
description: Ruby and RubyGems requirements needed for Bundler compatibility
url: /bundler-compatibility
previous: /credits
next: /rubygems
---
## Bundler compatibility with Ruby & RubyGems

The latest Bundler release should always support, at the very least, all
rubies that have not yet reached their End of Life date.

The latest Bundler release should always support all RubyGems versions higher
than or equal to the one shipped with the oldest Ruby version supported.
RubyGems is not allowed to be downgraded further than that, so upgrading or
downgrading RubyGems should not affect Bundler.

That effectively comes down to the following:

* Bundler **2.6** or higher
  * requires a minimum ruby version of **3.1.0**, and a minimum RubyGems version of **3.3.3** (version of RubyGems shipped with ruby **3.1.0**).
* Bundler **2.5**
  * requires a minimum ruby version of **3.0.0**, and a minimum RubyGems version of **3.2.3** (version of RubyGems shipped with ruby **3.0.0**).
* Bundler **2.4**
  * requires a minimum ruby version of **2.6.0**, and a minimum RubyGems version of **3.0.1** (version of RubyGems shipped with ruby **2.6.0**).
* Bundler **2.0** through **2.3**
  * requires a minimum ruby version of **2.3.0**, and a minimum RubyGems version of **2.5** (version of RubyGems shipped with ruby **2.3.0**).
* Bundler **1**
  * requires a minimum Ruby version of **1.8.7**, and a minimum RubyGems version of **1.3.6** (version of RubyGems shipped with ruby **1.8.7**).
