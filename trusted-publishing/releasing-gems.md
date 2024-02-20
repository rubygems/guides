---
layout: default
title: Releasing gems with a trusted publisher
url: /trusted-publishing/releasing-gems
---

Once you have a trusted publisher configured, you can use RubyGems' [`release-gem`](https://github.com/rubygems/release-gem) GitHub Action to set up your workflow to push gems to RubyGems.org.

This looks almost exactly the same as normal, except that you don't need any explicit usernames, passwords, or API tokens: GitHub's OIDC identity provider will take care of everything for you:

```yaml
jobs:
  push:
    runs-on: ubuntu-latest

    permissions:
      contents: write
      id-token: write

    # If you configured a GitHub environment on RubyGems, you must use it here.
    environment: release

    steps:
      # Set up
      - uses: actions/checkout@v4
      - name: Set up Ruby
        uses: ruby/setup-ruby@v1
        with:
          bundler-cache: true
          ruby-version: ruby

      # Release
      - uses: rubygems/release-gem@v1
```

Note the `id-token: write` permission: you **must** provide this permission at either the job level (strongly recommended) or workflow level (discouraged). Without it, the publishing action won't have sufficient permissions to identify itself to RubyGems.org.
