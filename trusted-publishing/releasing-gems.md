---
layout: default
title: Releasing gems with a trusted publisher
url: /trusted-publishing/releasing-gems
---

Once you have a trusted publisher configured, you can use RubyGems' [`configure-rubygems-credentials`](https://github.com/rubygems/configure-rubygems-credentials) GitHub Action to set up your workflow to push gems to RubyGems.org.

This looks almost exactly the same as normal, except that you don't need any explicit usernames, passwords, or API tokens: GitHub's OIDC identity provider will take care of everything for you:

```yaml
jobs:
  push:
    runs-on: ubuntu-latest
    permissions:
      contents: write
      id-token: write
    steps:
      - name: Checkout repo
        uses: actions/checkout@v4
      - name: Set up Ruby
        uses: ruby/setup-ruby@v1
        with:
          bundler-cache: true
          ruby-version: 3.2.2
      - name: Configure RubyGems credentials
        uses: rubygems/configure-rubygems-credentials@segiddins/support-trusted-publishers
      - name: Set remote URL
        run: |
          git config --global user.email "$(git log -1 --pretty=format:'%ae')"
          git config --global user.name "$(git log -1 --pretty=format:'%an')"
          git remote set-url origin "https://x-access-token:${{ secrets.GITHUB_TOKEN }}@github.com/$GITHUB_REPOSITORY"
      - name: Release
        run: bundle exec rake release
```

Note the `id-token: write`` permission: you **must** provide this permission at either the job level (strongly recommended) or workflow level (discouraged). Without it, the publishing action won't have sufficient permissions to identify itself to RubyGems.org.
