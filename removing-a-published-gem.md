---
layout: default
title: Removing a published gem
url: /removing-a-published-gem
previous: /security
next: /ssl-certificate-update
---

<em class="t-gray">Published a gem before it was ready for release? Published a gem with the wrong name?</em>

Here's how you can fix it.

You can use the gem yank command to remove versions from RubyGems.org's index using the command:

```ruby
gem yank GEM -v VERSION
```

Running gem yank will remove your gem from being available with gem install and the other gem commands. This also removes the gem file, as of April 20, 2015.

Note: Our webhook and mirror system means that several hundred services get pinged when new gems are pushed, so it's prudent to immediately reset any passwords/sensitive data you accidentally pushed even if you yank a gem right away.
