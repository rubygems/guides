---
layout: default
title: Setting up multi-factor authentication
url: /setting-up-multifactor-authentication
previous: /run-your-own-gem-server
next: /using-mfa-in-command-line
---

<em class="t-gray">Want to better protect your RubyGems account?</em>

Your account of RubyGems is important, just like your other accounts. Many
websites now has been using an extra phase of user authentication (MFA), to
protect data of users better. Now, you can also have a taste of multi-factor
authentication on RubyGems.org.

## Prerequisite

You should have an authenticator app (like Google Authenticator or Authy) which
supports time-based one-time password (TOTP) to scan the QR-code and generate
digit code. SMS-based authentication or recovery is not supported.

## Enabling multi-factor authentication

1. Login at the site using your account and enter _edit profile_ page. You can see
a section named _multifactor authentication_. Click _register a new device_
button to continue.
    ![Multifactor authentication section at profile edit page](/images/enabling_mfa_step1.png){:class="t-img"}
2. You are directed to a page with QR-code and an text box for verifying digit
code. Use your authenticator to scan the QR-code. A new item will be shown as
soon as the scan succeeds. If your authenticator cannot scan from camera, you
can choose to manually add a new item. Fill information listed after the
QR-code. Be cautious to type the _key_ correctly and choose _time based_
option, and click _save_.Now you can see a 6-digit code changing with time (30
seconds) in your app. Type the code and click _enable_.
    ![Registering a new device](/images/enabling_mfa_step2.png){:class="t-img"}
3. If the code is correct and QR-code not expired, you can see a list of recovery
codes. Please keep them safe. Any of these codes can be used in place of digit
code generated from authenticator, but every one can only be used once. So if
your phone is missing or you unexpectedly deleted the account in the
authenticator, you can use recovery code to disable multi-factor authentication
first and re-generate a new key.
    ![Recovery codes](/images/enabling_mfa_step3.png){:class="t-img"}
4. Now if you log out and sign in again, an extra OTP code will be required.
    ![OTP prompt at login page](/images/mfa_login.png){:class="t-img"}

## Authentication levels

Back to _profile edit_ page, in _multifactor authentication_ section, you
should see a dropdown menu with three items, about level of your
authentication.

- _Disabled_, setting to this level is equivalent to disable your MFA.
- _UI only_, only login from browser or command line requires digit code.
- _UI and API_, login, pushing gems or changing gem ownership requires digit
code.

If you want to change your authentication level, take the following steps:

1. Login and go to _edit profile_ page. See _multifactor authentication_
section. If you have enabled it, a selection box will be here.
    ![Multifactor section at profile edit page](/images/changing_mfa_step1.png){:class="t-img"}
2. If you want to disable it, select the box to _disabled_. Otherwise, choose
your preferred one according to our description of each level above. Type digit
code from your authenticator app or one of your unused recovery code.
    ![Options of authentication level](/images/changing_mfa_step2.png){:class="t-img"}
3. If your code is correct, your authentication level will be changed.
