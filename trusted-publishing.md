---
layout: default
title: Trusted Publishing
url: /trusted-publishing
previous: /cve
next: /organizations
redirect_from:
  - /trusted-publishing/adding-a-publisher/
  - /trusted-publishing/pushing-a-new-gem/
  - /trusted-publishing/releasing-gems/
---

With Trusted Publishing, releasing a new version of your gem is as simple as pushing a git tag to GitHub. There are no API tokens to create, rotate, or store as secrets — GitHub Actions securely authenticates with RubyGems.org on your behalf using short-lived tokens.

Under the hood, Trusted Publishing uses OpenID Connect (OIDC) to exchange short-lived identity tokens between GitHub Actions and RubyGems.org. Once configured, you never need to touch credentials again.

* [Adding a trusted publisher to an existing gem](#adding-a-trusted-publisher-to-an-existing-gem)
* [Releasing gems with a trusted publisher](#releasing-gems-with-a-trusted-publisher)
* [Pushing a new gem with a trusted publisher](#pushing-a-new-gem-with-a-trusted-publisher)
* [Using reusable workflows](#using-reusable-workflows)
* [How it works](#how-it-works)
* [Further reading](#further-reading)

## Adding a trusted publisher to an existing gem

Adding a trusted publisher to a gem only requires a single setup step.

On [your profile page](https://rubygems.org/profile/me), click the link to any gem you'd like to configure.

![List of gems on a RubyGems.org profile](/images/trusted-publishing/profile-gem-list.png){:class="t-img"}

If you're a gem owner, you'll see a link to "Trusted publishers" on the right side of the page. Click that link.

![Links shown on the sidebar of a gem page when the user is an owner](/images/trusted-publishing/gem-owner-sidebar-links.png){:class="t-img t-img--small"}

This will take you to the gem's trusted publishers page.

![Gem's trusted publisher page with a create button](/images/trusted-publishing/rubygem-trusted-publisher-create.png){:class="t-img"}

Click the "Create" button, which will take you to the publisher configuration page.

![Gem trusted publisher creation form](/images/trusted-publishing/rubygem-trusted-publisher-form.png){:class="t-img"}

Providing the owner name, repository name, and GitHub Actions workflow name allows RubyGems to securely accept uploaded gems from the GitHub Actions infrastructure.
If you have multiple workflows that push gems, you can create one Trusted Publisher for each workflow.

The environment allows GitHub to constrain who can publish your gem if many people have access to the repository.
We suggest using the [GitHub Action Environment](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/using-environments-for-deployment) name "release", which we will use in our workflow examples below.

Once you click "Create Rubygem trusted publisher", your publisher will be registered and will appear in the list of trusted publishers for this gem.

![List of configured gem trusted publishers](/images/trusted-publishing/rubygem-trusted-publishers-index.png){:class="t-img"}

Once registered, the `release.yml` workflow on `rubygems/sample-gem` will be able to generate short-lived API tokens from RubyGems.org that are scoped to push only to this gem.

A repo and workflow can be registered to multiple gems. For example, the `release.yml` workflow from the `rails/rails` repo can be registered for both the `rails` and `activerecord` gems. Each gem can likewise allow multiple publishers, for example a single gem could allow both workflows `release-linux.yml` and `release-mac.yml`.

## Releasing gems with a trusted publisher

Once you have a trusted publisher configured, you can use RubyGems' [`release-gem`](https://github.com/rubygems/release-gem) GitHub Action to set up your workflow to push gems to RubyGems.org.

This looks almost exactly the same as normal, except that you don't need any explicit usernames, passwords, or API tokens: GitHub's OIDC identity provider will take care of everything for you:

```yaml
name: Push gem

on:
  push:
    tags:
      - "v*"

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
      - uses: actions/checkout@v5
        with:
          persist-credentials: false
      - name: Set up Ruby
        uses: ruby/setup-ruby@v1
        with:
          bundler-cache: true
          ruby-version: ruby

      # Release
      - uses: rubygems/release-gem@v1
```

Note the `id-token: write` permission: you **must** provide this permission at either the job level (strongly recommended) or workflow level (discouraged). Without it, the publishing action won't have sufficient permissions to identify itself to RubyGems.org.

For more about `environment` setting, see: [Using Environment for your deployment (GitHub.com)](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/using-environments-for-deployment)

That's it! With the trusted publisher configured and this workflow in your repository, you can release a new version of your gem by simply pushing a git tag. No API tokens, no manual `gem push` — just tag and push.

---

The sections below cover additional topics: publishing a brand-new gem, using reusable workflows, and the underlying OIDC mechanism. If you've already set up trusted publishing for an existing gem, you're all set.

## Pushing a new gem with a trusted publisher

Trusted publishers are not just for existing gems, they can also be used to push new gems!

This helps reduce the friction for setting up fully automated publishing workflows for new gems,
since the same workflow will work for the first released version of a gem as well as all future versions.

To set up a trusted publisher for a new gem, you'll need to set up a "pending" trusted publisher
under your RubyGems.org profile.

The process is the same as for [adding a trusted publisher to an existing gem](#adding-a-trusted-publisher-to-an-existing-gem),
except that you'll also need to specify a gem name.

To configure a pending trusted publisher, go to your [pending trusted publisher page](https://rubygems.org/profile/oidc/pending_trusted_publishers)

![User's pending trusted publisher page with a create button](/images/trusted-publishing/pending-trusted-publisher-create.png){:class="t-img"}

Click the "Create" button, which will take you to the publisher configuration page.

![Pending trusted publisher creation form](/images/trusted-publishing/pending-trusted-publisher-form.png){:class="t-img"}

For example, if you have a repository at `https://github.com/rubygems/sample-gem` with a release workflow at `push_gem.yml` and an environment named `release` that you would like to push to RubyGems.org as the `sample-gem` gem, you would enter the following values:

![Pending trusted publisher creation form with values filled in](/images/trusted-publishing/pending-trusted-publisher-form-filled.png){:class="t-img"}

If your workflow uses a reusable workflow from another repository, you'll also need to fill in the optional "Workflow Repository Owner" and "Workflow Repository Name" fields. See [Using reusable workflows](#using-reusable-workflows) for details.

Once you click "Create Pending trusted publisher", your publisher will be registered and will appear in the list of pending publishers for your account.

![List of configured pending trusted publishers](/images/trusted-publishing/pending-trusted-publishers-index.png){:class="t-img"}

From this point, the "pending" publisher will act like a "normal" publisher.
After its first successful push, it will be converted to a "normal" trusted publisher for the new gem,
and you will be added as the owner of the gem.

## Using reusable workflows

If your release workflow uses a [reusable workflow](https://docs.github.com/en/actions/sharing-automations/reusing-workflows) from a different repository, you'll need to configure the optional "Workflow Repository" fields.

When a workflow calls a reusable workflow from another repository, the OIDC token's `job_workflow_ref` claim points to the reusable workflow's location, not the calling repository's workflow. The "Workflow Repository Owner" and "Workflow Repository Name" fields tell RubyGems.org where the actual workflow file lives.

For example, if your gem's repository (`my-org/my-gem`) calls a shared release workflow from `shared-org/shared-workflows`:

```yaml
# In my-org/my-gem/.github/workflows/release.yml
jobs:
  release:
    uses: shared-org/shared-workflows/.github/workflows/ruby-gem-release.yml@main
```

You would configure the trusted publisher with:
- **Repository owner**: `my-org`
- **Repository name**: `my-gem`
- **Workflow filename**: `ruby-gem-release.yml`
- **Workflow Repository Owner**: `shared-org`
- **Workflow Repository Name**: `shared-workflows`

Leave the Workflow Repository fields blank if your workflow file is in the same repository as your gem.

## How it works

Trusted publishing is a mechanism for uploading gems to RubyGems.org without using long-lived secret credentials.

You don't need to be an OIDC expert to use trusted publishing, but it's helpful to understand the basics of how it works.

1. Certain platforms, such as GitHub Actions, are OIDC _identity providers_, meaning they can issue short-lived identity tokens that third parties can **strongly** verify came from the CI service (as well as the repository, workflow, and commit that triggered the build).
1. Gems on RubyGems.org can be configured to trust particular configurations from particular providers, making that configuration a trusted publisher for that gem.
1. Release automation (such as GitHub Actions) can exchange the identity token for a short-lived API token from RubyGems.org, provided the token matches any trusted publishers that have been configured on RubyGems.org.
1. The API token can be used only to push to the gems that are configured to trust the publisher, and only for a short period of time.

This mechanism has significant security & usability advantages compared to traditional authentication mechanisms:

- **Usability**: trusted publishing does not require manually creating & storing API tokens from RubyGems.org. The only manual step is configuring the trusted publisher on RubyGems.org.
- **Security**: RubyGems.org's normal API tokens are long-lived, meaning an attacker who obtains one can use it indefinitely. Trusted publishing tokens are short-lived, meaning they can only be used for a short period of time.

## Further reading

We highly recommend checking out the excellent docs written by our friends over at PyPI for some more in-depth information on how Trusted Publishing works:

- [PyPI: Security model and considerations](https://docs.pypi.org/trusted-publishers/security-model/)
