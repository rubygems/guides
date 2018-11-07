---
layout: default
title: Using multifactor authentication in command line
url: /using-mfa-in-command-line
previous: /setting-up-multifactor-authentication
next: /resources
---

Many operations of rubygems are taken using the command line tool. So its
security is important. Multifactor authentication (MFA) is a good way to
protect your account and data.

## Prerequisite

You should have an authenticator app (like Google Authenticator or Authy) which
supports time-based one-time password (TOTP) to scan the QR-code and generate
digit code. SMS-based authentication or recovery is not supported.

To see how to turn this setting on, see [setting up multifactor authentication](/setting-up-multifactor-authentication).

## How to use it

<em class="t-gray">Support for MFA has not been in release version of RubyGems
yet. Content below may be not suitable for your RubyGems installation.</em>

Currently, the `gem` command line tool will check digit code in `gem signin`.
`gem push` and `gem owner --add` or `gem owner --remove` would also require
verification if your authentication level is set to _login and write_.

If multi-factor authentication is enabled, `gem signin` will show a prompt
asking digit code.

    $ gem signin
    Enter your RubyGems.org credentials.
    Don't have an account yet? Create one at https://rubygems.org/sign_up
    Email:   gem_author@example
    Password:
    
    This command needs digit code for multifactor authentication.
    Code:   111111
    Signed in.

There's a command line option for providing the digit code before execution.

    $ gem signin --otp 111111
    Enter your RubyGems.org credentials.
    Don't have an account yet? Create one at https://rubygems.org/sign_up
    Email:   gem_author@example
    Password:
    
    Signed in.

Likewise, `gem push` and `gem owner` requires the code if your authentication
level is set to _login and write_.

    $ gem push hello-0.0.1.gem
    Pushing gem to https://rubygems.org...
    This command needs digit code for multifactor authentication.
    Code:   111111
    Successfully registered gem: hello (0.0.1)

Please note that OTP expires every 30 seconds. If your OTP is incorrect, the
operation would fail.
