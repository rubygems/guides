---
layout: default
title: Name your gem
previous: /make-your-own-gem
next: /publishing
---

Here are some examples of our recommendations for naming gems:

Gem name               | Require statement                | Main class or module
---------------------- | -------------------------------- | -----------------------
`fancy_require`        | `require 'fancy_require'`        | `FancyRequire`
`ruby_parser`          | `require 'ruby_parser'`          | `RubyParser`
`net-http-persistent`  | `require 'net/http/persistent'`  | `Net::HTTP::Persistent`
`rdoc-data`            | `require 'rdoc/data'`            | `RDoc::Data`
`autotest-growl`       | `require 'autotest/growl'`       | `Autotest::Growl`
`net-http-digest_auth` | `require 'net/http/digest_auth'` | `Net::HTTP::DigestAuth`

The main goal of these recommendations is to give the user some clue about
how to require the files in your gem. Following these conventions also lets
Bundler require your gem with no extra configuration.

Use underscores for multiple words
----------------------------------

If a class or module has multiple words, use underscores to separate them. This
matches the file the user will require, making it easier for the user to start
using your gem.

Use dashes for extensions
-------------------------

If you're adding functionality to another gem, use a dash. This usually
corresponds to a `/` in the require statement (and therefore your gem's
directory structure) and a `::` in the name of your main class or module.

Mix underscores and dashes appropriately
----------------------------------------

If your class or module has multiple words and you're also adding functionality
to another gem, follow both of the rules above. For example,
[`net-http-digest_auth`](https://rubygems.org/gems/net-http-digest_auth) adds
[HTTP digest authentication](http://tools.ietf.org/html/rfc2617) to `net/http`.
The user will `require 'net/http/digest_auth'` to use the extension
(in class `Net::HTTP::DigestAuth`).

Don't use UPPERCASE letters
---------------------------

OS X and Windows have case-insensitive filesystems by default.  Users may
mistakenly require files from a gem using uppercase letters which will be
non-portable if they move it to a non-windows or OS X system.  While this will
mostly be a newbie mistake we don't need to be confusing them more than
necessary.

Credits
-------

This guide was expanded from [How to Name
Gems](http://blog.segment7.net/2010/11/15/how-to-name-gems) by Eric Hodel.

