---
layout: default
title: Setting up OTP (auth app) multi-factor authentication
url: /setting-up-otp-mfa
previous: /setting-up-webauthn-mfa
next: /using-mfa-in-command-line
---

<em class="t-gray">Setting up one-time password (OTP) multi-factor authentication</em>

## Prerequisite

You should have an authenticator app (like [Google Authenticator](https://support.google.com/accounts/answer/1066447),
[Authy](https://authy.com/download/), or [Authenticator Plus](https://www.authenticatorplus.com)) which
supports time-based one-time password (TOTP) to scan the QR code and generate
an access code. SMS-based authentication or recovery is **not** supported.

## Enabling OTP multi-factor authentication

1. Login to rubygems.org using your existing account and go to the [edit settings](https://rubygems.org/settings/edit) page.
Click **register a new device** in the "Multi-factor Authentication" section.
    ![Multi-factor authentication section on the edit settings page](/images/enabling_mfa_step1.png){:class="t-img"}
2. You will be redirected to a page with a QR code and a text box for verifying OTP
code. Please use your authenticator to scan the QR code. A new account for rubygems.org will be
added to your authenticator app as soon as the scan completes.
You can also add a new account manually using "Account" and "Key" shown next to the QR code.
Please make sure you choose the option "time based" as MFA type.
On successful registration, you will see a 6-digit access code (30
seconds expiry) in your authenticator app for your rubygems.org account.
Enter the shown access code in the "OTP Code" text field and click **Enable**.
    ![Registering a new device](/images/enabling_mfa_step2.png){:class="t-img"}
3. If the code is correct and the QR code has not expired, on next page you will see a list of recovery
codes. Please copy and store these codes in a safe place. You can use these recovery
codes to access your account, should you ever lose your phone or accidentally delete the
rubygems.org account from your authenticator app. Note that each recovery code can be used
only once. Please reregister your authenticator app after using recovery code to
login to rubygems.org (see [Using recovery codes and re-setup a previously enabled MFA](#using-recovery-codes-and-re-setup-a-previously-enabled-mfa)).
    ![Recovery codes](/images/enabling_mfa_step3.png){:class="t-img"}
4. Sign out and sign in again. Signing in will now ask for an OTP code.
    ![OTP prompt at login page](/images/mfa_login.png){:class="t-img"}

Note: The Google Authenticator app only allows an MFA account to be installed on one device
and there is no backup or cloud sync of the data. So if you lose or upgrade your phone, you'll
have to set up MFA again on the new phone. On the other hand, the Authy and Authenticator Plus
apps allow you to use multiple devices by providing cloud backups and cross-device sync
capabilities.
