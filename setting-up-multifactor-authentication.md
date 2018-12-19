---
layout: default
title: Setting up multi-factor authentication
url: /setting-up-multifactor-authentication
previous: /run-your-own-gem-server
next: /using-mfa-in-command-line
---

<em class="t-gray">Want to better protect your RubyGems account?</em>

Your rubygems.org account is important! Unauthorized access of your account
can lead to irrevocable damage to your gem's reputation. We highly recommend
that you enable MFA for both UI and API. When enabled, we will ask you to provide an
one time password for operations like login, gem push etc to verify your
identity.

## Prerequisite

You should have an authenticator app (like [Google Authenticator](https://support.google.com/accounts/answer/1066447) or [Authy](https://authy.com/download/)) which
supports time-based one-time password (TOTP) to scan the QR-code and generate
access code. SMS-based authentication or recovery is **not** supported.

## Enabling multi-factor authentication

1. Login to rubygems.org using your existing account and go to [edit profile](https://rubygems.org/profile/edit) page.
Click _register a new device_ under _multifactor authentication_ section.
    ![Multifactor authentication section at profile edit page](/images/enabling_mfa_step1.png){:class="t-img"}
2. You will be redirected to a page with QR-code and an text box for verifying OTP
code. Please use your authenticator to scan the QR-code. A new account for rubygems.org will be
added to your authenticator app as soon as the scan completes.
You can also add a new account manully using _Account_ and _Key_ shown next to QR code.
Please make sure you choose _time based_ option as MFA type.

On successful registration, you will see a 6-digit access code (30
seconds expiry) in your authenticator app for your rubygems.org account.
Enter the shown access code in OTP Code text field and click _enable_.
    ![Registering a new device](/images/enabling_mfa_step2.png){:class="t-img"}
3. If the code is correct and QR-code has not expired, on next page you will see a list of recovery
codes. Please copy and store these codes in a safe place. You can use these recovery
code to access your account should you ever lose your phone or accidentally deleted
rubygems.org account from your authenticator app. Note that, each recovery code can be used
only once. Please reregister your authenticator app after using recovery code to
login to rubygems.org.
    ![Recovery codes](/images/enabling_mfa_step3.png){:class="t-img"}
4. Sign out and sign in again. Sign in page will now ask for OTP code.
    ![OTP prompt at login page](/images/mfa_login.png){:class="t-img"}

## Authentication levels

When you register a new device or enable MFA for the first time, we will enable
MFA only for UI. If you go to _profile edit_ page again, in _multifactor authentication_ section, you
will see a dropdown menu with three options:

- **Disabled**: disables MFA. Please delete rubygems.org account from you authenticator app after disabling.
- **UI only**: sign in from browser and disabling MFA will require OTP code.
- **UI and API**: gem signin, push and owner --add/remove will require OTP code.

Steps to change your MFA level:

1. Sign in and go to _edit profile_ page. If you have enabled MFA for your account,
under _multifactor authentication_ section, you will see a dropdown menu.
    ![Multifactor section at profile edit page](/images/changing_mfa_step1.png){:class="t-img"}
2. Select your intended option, enter OTP access code from your authenticator app and click _Update_
    ![Options of authentication level](/images/changing_mfa_step2.png){:class="t-img"}
