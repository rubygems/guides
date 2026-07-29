---
layout: default
title: How to troubleshoot RubyGems and Bundler TLS/SSL Issues
url: /rubygems_tls_ssl_troubleshooting_guide
previous: /troubleshooting
next: /git_bisect
redirect_from: /ssl-certificate-update/
---

<em class="text-neutral-600">What `certificate verify failed` means and how to fix it.</em>

What the error means
--------------------

When RubyGems or Bundler connects to https://rubygems.org, it verifies the server's TLS certificate against the CA certificate bundle on your machine. When that verification fails, `gem` and `bundle` commands stop with an error like:

    OpenSSL::SSL::SSLError: SSL_connect returned=1 errno=0 state=error: certificate verify failed

Two causes account for almost all of these errors:

1. **Missing or outdated CA certificates.** Ruby uses the CA bundle provided by your operating system or your Ruby installation. If that bundle is too old to contain the root certificate that RubyGems.org's certificate chains to, verification fails.
2. **A wrong system clock.** Certificates are only valid within a time window. If your system clock is set in the past or future, an otherwise valid certificate appears expired or not yet valid.

Diagnosing the problem
----------------------

Run `bundle doctor ssl`. It verifies the Ruby OpenSSL version on your system, checks that CA certificates are set up correctly, then opens a test TLS connection to https://rubygems.org and reports the outcome. Use `--host` to diagnose a different gem server, and `--tls-version` and `--verify-mode` to narrow down which protocol version or verification mode fails.

See [Troubleshooting common issues](/troubleshooting) for general diagnosis and [bundle doctor](/command-reference/bundle-doctor/) for all options.

Fixing the problem
------------------

Work through these steps in order:

1. **Update RubyGems and Bundler.** Recent versions ship a current CA bundle for RubyGems.org, so updating fixes most certificate errors. See [Installing RubyGems and Bundler](/installation) for `gem update --system` and `bundle update --bundler`.
2. **Check your system clock.** If it is off by more than a few minutes, correct it and enable automatic time synchronization.
3. **Update your OS CA certificates.** Install pending OS updates or update the CA certificate package with your system's package manager.

If none of these steps fixes the problem, open an issue in the [RubyGems issue tracker](https://github.com/rubygems/rubygems/issues) and include the output of `bundle doctor ssl`, `gem env`, and `bundle env`.
