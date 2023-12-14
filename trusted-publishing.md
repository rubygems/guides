---
layout: default
title: Trusted Publishing
url: /trusted-publishing
---

Trusted Publishing is a term for using OpenID Connect (OIDC) to exchange short-lived identity tokens between a trusted third-party service and RubyGems.org.
This allows obtaining short-lived API tokens in an automated environment (such as CI) without having to store long-lived API tokens or username/password credentials.

For a quickstart guide, see:

- [Adding a trusted publisher to an existing gem](/trusted-publishing/adding-a-publisher)
- [Pushing a new gem with a trusted publisher](/trusted-publishing/pushing-a-new-gem)

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

We highly reccomend checking out the excellent docs written by our friends over at PyPI for some more in-depth information on how Trusted Publishing works:

- [PyPI: Security model and considerations](https://docs.pypi.org/trusted-publishers/security-model/)
