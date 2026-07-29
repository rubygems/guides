---
layout: default
title: Security
url: /security
previous: /removing-a-published-gem
next: /cooldown
---

<em class="text-neutral-600">How to protect your account as a gem author, harden the gems you install, and report vulnerabilities.</em>

Installing a gem runs someone else's code on your machine, with your privileges. RubyGems and Bundler provide several layers of defense against compromised accounts and malicious releases. This page is an index to those layers.

* [Securing your account](#securing-your-account)
* [Securing your dependencies](#securing-your-dependencies)
* [Gem signing](#gem-signing)
* [Reporting security vulnerabilities](#reporting-security-vulnerabilities)

Securing your account
---------------------

If you publish gems, your RubyGems.org account is part of your users' supply chain. Protecting it protects everyone who installs your gems.

Enable multi-factor authentication. It is the most effective defense against account takeover. Prefer [WebAuthn](/setting-up-multifactor-authentication#setting-up-webauthn-recommended) with a security key or passkey, which resists the phishing attacks behind recent account takeovers in other packaging ecosystems. See [Setting up multi-factor authentication](/setting-up-multifactor-authentication) to enable it and [Using MFA in the command line](/using-mfa-in-command-line) for how it affects `gem` commands. You can also [require MFA from all owners of your gems](/setting-up-multifactor-authentication#requiring-mfa-for-your-gems).

Limit what your API keys can do. Instead of one all-powerful key, create keys scoped to the specific actions they need, such as a push-only key for a release pipeline, and set an expiration date so a forgotten key cannot be abused indefinitely. See [API key scopes](/api-key-scopes).

Publish from CI without long-lived credentials. [Trusted Publishing](/trusted-publishing) lets a configured CI workflow push your gem using short-lived tokens, so there is no API key to leak or rotate.

Only add people you trust as owners of your gems. Every owner has the same permissions you have, including pushing new versions, yanking existing ones, and adding or removing other owners. See [Managing gem owners](/managing-owners-using-ui), or use [Organizations](/organizations) for finer-grained roles.

Keep credentials out of the gems you publish. A pushed gem is public and widely mirrored, so a leaked API key or password cannot be recalled by yanking the version. Build the `files` list in your gemspec from an explicit allowlist such as `git ls-files` instead of a broad glob that can pick up local configuration, and review the packaged files with `gem unpack` before pushing. If a secret does ship, revoke it first, then yank the version.

If you suspect your account has been compromised or a malicious version of your gem has been published, [yank the affected versions](/removing-a-published-gem) immediately and report the incident to <security@rubygems.org>.

Securing your dependencies
--------------------------

Bundler records the exact version of every dependency in `Gemfile.lock`, so later installs from the same lockfile use the same code that you tested. The protections below build on it.

### Lockfile checksums

Bundler records a `CHECKSUMS` section in newly generated lockfiles and verifies each gem against its checksum during installation. A gem that has been tampered with after the lockfile was created fails to install. Existing lockfiles are not rewritten automatically. Add checksums to one with:

    bundle lock --add-checksums

### Cooldown

Most malicious releases are detected and yanked within days of publication. A cooldown excludes gem versions newer than a given number of days from dependency resolution, so your application never installs a release before the ecosystem has had time to vet it. Enable it for a project with:

    bundle config set cooldown 7

You can also pass `--cooldown N` to `bundle install`, `bundle update`, `bundle add`, and `bundle outdated`, or set a per-source value in the Gemfile with `source "https://rubygems.org", cooldown: 7`. The CLI flag takes precedence over the config setting, which takes precedence over the per-source value. To exempt a trusted internal source, declare it with `cooldown: 0`. Cooldown relies on the gem server publishing a creation time for each version through the v2 compact index. Versions from servers that do not provide it are treated as outside the cooldown window. See [How to delay new gem versions with cooldown](/cooldown) for details.

### Pinning gem sources

If you install gems from more than one source, such as an internal gem server alongside rubygems.org, a public gem published under the same name as an internal one could be substituted for it. Assign every internal gem to its server with a `source` block, so Bundler installs it only from there. A source declared in a block still remains a candidate for gems without an explicit source, so give every gem in the Gemfile an explicit source. See the [Gemfile manual](/gemfile) for the block form of `source`.

### Auditing for known vulnerabilities

[bundler-audit](https://github.com/rubysec/bundler-audit) checks your `Gemfile.lock` against [ruby-advisory-db](https://github.com/rubysec/ruby-advisory-db), the community database of known vulnerabilities in Ruby gems. Run it in CI so newly disclosed advisories surface quickly. Vulnerabilities in RubyGems itself are listed on the [CVE page](/cve).

Gem signing
-----------

RubyGems can cryptographically sign gems. Authors create a certificate with `gem cert`, and users opt into verification with a trust policy, using `gem install -P MediumSecurity` or `bundle install --trust-policy MediumSecurity`. In practice signing is rarely used because there is no established chain of trust for signing certificates, and each certificate must be trusted manually. Prefer the protections above. If you still want to sign your gems, see the [Gem::Security documentation](https://docs.ruby-lang.org/en/master/Gem/Security.html).

Reporting security vulnerabilities
----------------------------------

### In RubyGems, Bundler, or RubyGems.org

Report vulnerabilities in RubyGems, Bundler, or the RubyGems.org service, as well as malicious gems published on RubyGems.org, to <security@rubygems.org> or through [HackerOne](https://hackerone.com/rubygems). Do not open a public issue.

### In Ruby itself

Vulnerabilities in the Ruby language belong to a separate program. Report them to the Ruby security team through [HackerOne](https://hackerone.com/ruby) or <security@ruby-lang.org>. See the [Ruby security page](https://www.ruby-lang.org/en/security/) for the scope of that program.

### In someone else's gem

First check whether the vulnerability is already known by searching [RubySec](https://rubysec.com). If it appears to be new, contact the authors privately rather than through a public issue or pull request. Explain the issue, how it can be exploited, and ideally how it might be fixed. If the gem is developed on GitHub, the repository may accept [private vulnerability reports](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/privately-reporting-a-security-vulnerability).

### In your own gem

Request a CVE identifier by creating a [GitHub Security Advisory](https://docs.github.com/en/code-security/security-advisories/working-with-repository-security-advisories/about-repository-security-advisories), then release a patched version and tell your users which versions are affected and what to do. Announce the fix on <ruby-security-ann@googlegroups.com> and submit the advisory to [ruby-advisory-db](https://github.com/rubysec/ruby-advisory-db) so that audit tools pick it up.
