---
layout: default
title: Using multi-factor authentication
url: /using-multifactor-authentication
previous: /run-your-own-gem-server
next: /resources
---

<em class="t-gray">Want to better protect your RubyGems account?</em>

Your account of RubyGems is important, just like your other accounts. Many
websites now has been using an extra phase of user authentication (MFA), to
protect data of users better. Now, you can also have a taste of multi-factor
authentication on RubyGems.org.

Since this feature is still in preview process, it's deployed but hidden by
default. You can visit [RubyGems.org](https://rubygems.org), open JavaScript
console in your browser, and type following command.

    document.cookie = 'mfa_feature=true;path=/'

This cookie entry will make the server aware of your request to try this
feature.

## Prerequisite

You should have an authenticator app (like Google Authenticator or Authy) which
supports time-based one-time password (TOTP) to scan the QR-code and generate
digit code. SMS-based authentication or recovery is not supported.

## Enabling multi-factor authentication

Login at the site using your account and enter _edit profile_ page. You can see
a section named _multifactor authentication_. Click _register a new device_
button to continue.

Now you are directed to a page with QR-code and an text box for verifying digit
code. Use your authenticator to scan the QR-code. A new item will be shown as
soon as the scan succeeds. If your authenticator cannot scan from camera, you
can choose to manually add a new item. Fill information listed after the
QR-code. Be cautious to type the _key_ correctly and choose _time based_
option, and click _save_. You can see a 6-digit code changing with time (30
seconds) in your app. Type the code and click _enable_.

If the code is correct and QR-code not expired, you can see a list of recovery
codes. Please keep them safe. Any of these codes can be used in place of digit
code generated from authenticator, but every one can only be used once. So if
your phone is missing or you unexpectedly deleted the account in the
authenticator, you can use recovery code to disable multi-factor authentication
first and re-generate a new key.

## Authentication levels

Back to _profile edit_ page, in _multifactor authentication_ section, you
should see a dropdown menu with three items, about level of your
authentication.

- _disabled_, setting to this level is equivalent to disable your MFA.
- _login only_, only login from browser or command line requires digit code.
- _login and write_, login, pushing gems or changing gem ownership requires
digit code.

All level change requires authentication from digit code, or recovery code.
To clear your multifactor authentication settings, choose _disabled_ and
continue.

## Using multi-factor authentication in command line

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

    $ gem signin --mfa 111111
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

If your input is incorrect, the operation would fail.

    $ gem owner hello --add gem_author2@example
    This command needs digit code for multifactor authentication.
    Code:   222222
    Adding gem_author2@example: You have enabled multifactor authentication but your request doesn't have the correct OTP code. Please check it and retry.

One thing should be noted out is that signing in will not keep mfa stored. So
if you are not logged in, some operations may ask you twice for MFA code.

    $ gem owner hello --add gem_author2@example
    Enter your RubyGems.org credentials.
    Don't have an account yet? Create one at https://rubygems.org/sign_up
    Email:   gem_author@example
    Password:
    
    This command needs digit code for multifactor authentication.
    Code:   111111
    Signed in.
    This command needs digit code for multifactor authentication.
    Code:   222222
    Owner added successfully.
    Owners for gem: hello
    - gem_author@example
    - gem_author2@example

Even if you used `--mfa` option, the second phase will also require you to
input it. This is to prevent your code from expired.
