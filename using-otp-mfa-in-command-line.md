---
layout: default
title: Using OTP multi-factor authentication in command line
url: /using-otp-mfa-in-command-line
previous: /using-webauthn-mfa-in-command-line
next: /mfa-requirement-opt-in
---
<em class="t-gray">How to use OTP MFA with gem CLI.</em>

Multi-factor authentication (MFA) using OTP works by using an authenticator app on your phone
to generate a one-time password (OTP) that you then enter at the command line. This
documentation explains how to use OTP multi-factor authentication (MFA) if you have configured
it. For WebAuthn instructions, see "[Using WebAuthn multi-factor authentication in command line](/using-webauthn-mfa-in-command-line)".

When you have only enabled OTP MFA, and your MFA level is _UI and API_, we will ask to you
to provide an OTP for `gem signin`, `gem push`, `gem owner --add` and `gem owner --remove`.
Check [setting up multi-factor authentication](/setting-up-multifactor-authentication)
for enabling MFA.

This level requires a recent enough `gem` command as shipped with Ruby 2.6+,
or [RubyGems 3.0+](https://rubygems.org/pages/download).

You can preemptively pass an OTP code using `--otp` flag or else we will prompt
for the OTP code when required:

    $ gem signin
    Enter your RubyGems.org credentials.
    Don't have an account yet? Create one at https://rubygems.org/sign_up
    Email:   gem_author@example
    Password:

    You have enabled multi-factor authentication. Please enter OTP code.
    Code:   111111
    Signed in.

Passing OTP as flag:

    $ gem signin --otp 111111
    Enter your RubyGems.org credentials.
    Don't have an account yet? Create one at https://rubygems.org/sign_up
    Email:   gem_author@example
    Password:

    Signed in.

Note that `gem signin` only fetches and stores your rubygems.org api key. `gem signin`
is not equivalent to creating a user session. We will check for OTP code every time you
use any of the commands mentioned above.

Publishing a gem after signing in from cli:

    $ gem push hello-0.0.1.gem
    Pushing gem to https://rubygems.org...
    You have enabled multi-factor authentication. Please enter OTP code.
    Code:   111111
    Successfully registered gem: hello (0.0.1)
