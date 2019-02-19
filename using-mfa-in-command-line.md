---
layout: default
title: Using multifactor authentication in command line
url: /using-mfa-in-command-line
previous: /setting-up-multifactor-authentication
next: /using-s3-source
---
<em class="t-gray">How to use MFA with gem CLI.</em>

When your MFA level is _UI and API_, we will ask to you provide an OTP
for `gem signin`, `gem push`, `gem owner --add` and `gem owner --remove`.
Check [setting up multifactor authentication](/setting-up-multifactor-authentication)
for enabling MFA.

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
