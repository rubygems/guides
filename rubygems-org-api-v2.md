---
layout: default
title: RubyGems.org API V2
url: /rubygems-org-api-v2
previous: /rubygems-org-api
next: /rubygems-org-compact-index-api
---
<em class="t-gray">Get twice more info with API v2</em>

Gem Version Methods
-------------------

### GET - `/api/v2/rubygems/[GEM NAME]/versions/[VERSION NUMBER].(json|yaml)`

Returns a dictionary with versions details for a specific gem version.

To return the version for a specific platform (e.g. "ruby", "java", "x86_64-linux"), use the `platform` query parameter. 


    $ curl https://rubygems.org/api/v2/rubygems/coulda/versions/0.7.1.json

    {
      "name": "coulda",
      "downloads": 86573,
      "version": "0.7.1",
      "version_created_at": "2011-08-08T21:23:40.254Z",
      "version_downloads": 5754,
      "platform": "ruby",
      "authors": "Evan David Light",
      "info": "Behaviour Driven Development derived from Cucumber but as an internal DSL with methods for reuse",
      "licenses": null,
      "metadata": {
        "homepage_uri": "http://coulda.tiggerpalace.com"
      },
      "yanked": false,
      "sha": "777c3a7ed83e44198b0a624976ec99822eb6f4a44bf1513eafbc7c13997cd86c",
      "spec_sha": "57b863cff56029a0085eaf1b3416b701ed4fa75418d062358b45753e270c9ffa",
      "project_uri": "https://rubygems.org/gems/coulda",
      "gem_uri": "https://rubygems.org/gems/coulda-0.7.1.gem",
      "homepage_uri": "http://coulda.tiggerpalace.com",
      "wiki_uri": null,
      "documentation_uri": null,
      "mailing_list_uri": null,
      "source_code_uri": null,
      "bug_tracker_uri": null,
      "changelog_uri": null,
      "funding_uri": null,
      "dependencies": {
        "development": [],
        "runtime": [
          {
            "name": "yourdsl",
            "requirements": "~> 0.7"
          }
        ]
      },
      "built_at": "2011-08-08T04:00:00.000Z",
      "created_at": "2011-08-08T21:23:40.254Z",
      "description": "Behaviour Driven Development derived from Cucumber but as an internal DSL with methods for reuse",
      "downloads_count": 5754,
      "number": "0.7.1",
      "summary": "Test::Unit-based acceptance testing DSL",
      "rubygems_version": ">= 0",
      "ruby_version": null,
      "prerelease": false,
      "requirements": null
    }
