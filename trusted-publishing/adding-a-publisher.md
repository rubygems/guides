---
layout: default
title: Adding a trusted publisher to an existing gem
url: /trusted-publishing/adding-a-publisher
previous: /trusted-publishing
next: /trusted-publishing/pushing-a-new-gem
---

Adding a trusted publisher to a gem only requires a single setup step.

On [your profile page](https://rubygems.org/profile/me), click the link to any gem you'd like to configure.

![List of gems on a RubyGems.org profile](/images/trusted-publishing/profile-gem-list.png){:class="t-img"}

If you're a gem owner, you'll see a link to "Trusted publishers" on the right side of the page. Click that link.

![Links shown on the sidebar of a gem page when the user is an owner](/images/trusted-publishing/gem-owner-sidebar-links.png){:class="t-img t-img--small"}

This will take you to the gem's trusted publishers page.

![Gem's trusted publisher page with a create button](/images/trusted-publishing/rubygem-trusted-publisher-create.png){:class="t-img"}

Click the "Create" button, which will take you to the publisher configuration page.

![Gem trusted publisher creation form](/images/trusted-publishing/rubygem-trusted-publisher-form.png){:class="t-img"}

Providing the owner name, repository name, and GitHub Actions workflow name allows RubyGems to securely accept uploaded gems from the GitHub Actions infrastructure. If you have multiple workflows that push gems, you can create one Trusted Publisher for each workflow.

Once you click "Create Rubygem trusted publisher", your publisher will be registered and will appear in the list of trusted publishers for this gem.

![List of configured gem trusted publishers](/images/trusted-publishing/rubygem-trusted-publishers-index.png){:class="t-img"}

Now, the `push.yml` workflow on `indirect/indirect-trusted-publishing` will be able to generate short-lived API tokens from RubyGems.org that are able to push to this gem.

A repo and workflow can be registered to multiple gems. For example, the `release.yml` workflow from the  `rails/rails` repo can be registered for both the `rails` and `activerecord` gems. Each gem can likewise allow multiple publishers, for example a single gem could allow both workflows `release-linux.yml` and `release-mac.yml`.

Now that you've created a Trusted Publisher, [create a GitHub Actions workflow](/trusted-publishing/releasing-gems) to publish your gem.
You can use [rubygem-await's release workflow](https://github.com/segiddins/rubygems-await/blob/main/.github/workflows/push_gem.yml) as a starting point.
