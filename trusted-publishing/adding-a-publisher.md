---
layout: default
title: Adding a trusted publisher to an existing gem
url: /trusted-publishing/adding-a-publisher
---

Adding a trusted publisher to a gem only requires a single setup step.

On [your profile page](https://rubygems.org/), click the link to any gem you'd like to configure.

![List of gems on a RubyGems.org profile](/images/trusted-publishing/profile-gem-list.png){:class="t-img"}

If you're a gem owner, you'll see a link to "Trusted publishers" on the right side of the page. Click that link.

![Links shown on the sidebar of a gem page when the user is an owner](/images/trusted-publishing/gem-owner-sidebar-links.png){:class="t-img t-img--small"}

This will take you to the gem's trusted publishers page.

![Gem's trusted publisher page with a create button](/images/trusted-publishing/rubygem-trusted-publisher-create.png){:class="t-img"}

Click the "Create" button, which will take you to the publisher configuration page.

![Gem trusted publisher creation form](/images/trusted-publishing/rubygem-trusted-publisher-form.png){:class="t-img"}

To enable trusted publishing for this gem, you'll need to tell RubyGems.org how to trust it.
GitHub Actions (the only currently supported trusted publisher) requires the repository owner's name, repository name, and the name of the workflow that will be pushing the gem.

Once you click "Create Rubygem trusted publisher", your publisher will be registered and will appear in the list of trusted publishers for this gem.

![List of configured gem trusted publishers](/images/trusted-publishing/rubygem-trusted-publishers-index.png){:class="t-img"}

Now, the `push.yml` workflow on `indirect/indirect-trusted-publishing` will be able to generate short-lived API tokens from RubyGems.org that are able to push to this gem.

A publisher can be registered for multiple gems, and a gem can have multiple publishers.
