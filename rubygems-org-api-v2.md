---
layout: default
title: RubyGems.org API V2
url: /rubygems-org-api-v2
previous: /rubygems-org-api
next: /rubygems-org-rate-limits
---
<em class="t-gray">Get twice more info with API v2</em>

Gem Version Methods
-------------------

### GET - `/api/v2/rubygems/[GEM NAME]/versions/[VERSION NUMBER].(json|yaml)`

Returns a dictionary with versions details for a specific gem version. Example:

    $ curl https://rubygems.org/api/v2/rubygems/coulda/versions/0.7.1.json

    {
      "authors":"Evan David Light",
      "built_at":"2011-08-08T04:00:00.000Z",
      "created_at":"2011-08-08T21:23:40.254Z",
      "description":"Behaviour Driven Development derived from Cucumber but as an internal DSL with methods for reuse",
      "downloads_count":2469,
      "metadata":{},
      "number":"0.7.1",
      "summary":"Test::Unit-based acceptance testing DSL",
      "platform":"ruby",
      "ruby_version":null,
      "prerelease":false,
      "licenses":null,
      "requirements":null,
      "sha":"777c3a7ed83e44198b0a624976ec99822eb6f4a44bf1513eafbc7c13997cd86c"
    }
