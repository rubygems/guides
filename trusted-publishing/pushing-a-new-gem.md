---
layout: default
title: Pushing a new gem with a trusted publisher
url: /trusted-publishing/pushing-a-new-gem
---

Trusted publishers are not just for existing gems, they can also be used to push new gems!

This helps reduce the friction for setting up fully automated publishing workflows for new gems,
since the same workflow will work for the first released version of a gem as well as all future versions.

To set up a trusted publisher for a new gem, you'll need to set up a "pending" trusted publisher
under your RubyGems.org profile.

The process is the same as for [adding a trusted publisher to an existing gem](/trusted-publishing/adding-a-publisher),
except that you'll also need to specify a gem name.

To configure a pending trusted publisher, go to your [pending trusted publisher page](https://rubygems.org/profile/oidc/pending_trusted_publishers)

![User's pending trusted publisher page with a create button](/images/trusted-publishing/pending-trusted-publisher-create.png){:class="t-img"}

Click the "Create" button, which will take you to the publisher configuration page.

![Pending trusted publisher creation form](/images/trusted-publishing/pending-trusted-publisher-form.png){:class="t-img"}

For example, if you have a repository at `https://github.com/rubygems/sample-gem` with a release workflow at `push_gem.yml` and an environment named `release` that you would like to push to RubyGems.org as the `sample-gem` gem, you would enter the following values:

![Pending trusted publisher creation form with values filled in](/images/trusted-publishing/pending-trusted-publisher-form-filled.png){:class="t-img"}

Once you click "Create Pending trusted publisher", your publisher will be registered and will appear in the list of pending publishers for your account.

![List of configured pending trusted publishers](/images/trusted-publishing/pending-trusted-publishers-index.png){:class="t-img"}

From this point, the "pending" publisher will act like a "normal" publisher.
After its first successful push, it will be converted to a "normal" trusted publisher for the new gem,
and you will be added as the owner of the gem.
