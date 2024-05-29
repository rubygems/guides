---
layout: default
title: SSL Certificate Update
url: /ssl-certificate-update
previous: /removing-a-published-gem
next: /patterns
---

# SSL Certificate Updates

If you’ve seen the following SSL error when trying to pull updates from RubyGems:

```OpenSSL::SSL::SSLError: SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed```

This error happens when your computer is missing a file that it needs to verify that the server behind RubyGems.org is the correct one.

Follow the steps outlined in [the RubyGems and Bundler OpenSSL/TLS guide](https://bundler.io/v2.0/guides/rubygems_tls_ssl_troubleshooting_guide.html#troubleshooting-certificate-errors) to troubleshoot the problem.

If you're still encountering issues, you can open an
[issue on GitHub](https://github.com/rubygems/rubygems).
