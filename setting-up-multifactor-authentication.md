---
layout: default
title: Setting up multi-factor authentication
url: /setting-up-multifactor-authentication
previous: /run-your-own-gem-server
next: /using-mfa-in-command-line
---

<em class="t-gray">Want to better protect your rubygems.org account?</em>

Your rubygems.org account is important! Unauthorized access of your account
can lead to irrevocable damage to your gem's reputation. We highly recommend
that you enable MFA for both UI and API. When enabled, we will ask you to provide a
one-time password for operations like login, gem push etc to verify your
identity.

## Prerequisite

You should have an authenticator app (like [Google Authenticator](https://support.google.com/accounts/answer/1066447),
[Authy](https://authy.com/download/), or [Authenticator Plus](https://www.authenticatorplus.com)) which
supports time-based one-time password (TOTP) to scan the QR code and generate
an access code. SMS-based authentication or recovery is **not** supported.

## Enabling multi-factor authentication

1. Login to rubygems.org using your existing account and go to the [edit settings](https://rubygems.org/settings/edit) page.
Click **register a new device** in the _multifactor authentication_ section.
    ![Multifactor authentication section on the edit settings page](/images/enabling_mfa_step1.png){:class="t-img"}
2. You will be redirected to a page with a QR code and a text box for verifying OTP
code. Please use your authenticator to scan the QR code. A new account for rubygems.org will be
added to your authenticator app as soon as the scan completes.
You can also add a new account manually using _Account_ and _Key_ shown next to the QR code.
Please make sure you choose the option _time based_ as MFA type.
On successful registration, you will see a 6-digit access code (30
seconds expiry) in your authenticator app for your rubygems.org account.
Enter the shown access code in the _OTP Code_ text field and click **Enable**.
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

## Authentication levels

When you register a new device or enable MFA for the first time, we will enable
MFA for both the UI and the API. If you go to the _edit settings_ page again, in the _multifactor authentication_ section, you
will see a dropdown menu with three options:

- **Disabled**: disables MFA. Please delete rubygems.org account from your authenticator app after disabling.
- **UI only (Deprecated)**: sign in from browser, updating MFA levels and resetting password will require OTP code. These are referred to as UI operations.
- **UI and gem signin**: UI operations and `gem signin` will require OTP code.
- **UI and API**: UI operations, `gem signin`, `push`, `owner --add` and `owner --remove` will require OTP code.

Note: If you are on the **UI only** or **UI and gem signin** authentication level,
you can selectively enable MFA on specific API keys (see [API key scopes](http://guides.rubygems.org/api-key-scopes/#/#enable-mfa-on-specific-api-keys)).
This is different from the **UI and API** level as MFA is enabled on all API keys by default and cannot be selectively enabled.

Steps to change your MFA level:

1. Sign in and go to the _edit settings_ page. If you have enabled MFA for your account,
in the _multifactor authentication_ section, you will see a dropdown menu.
    ![Multifactor section on the edit settings page](/images/changing_mfa_step1.png){:class="t-img"}
2. Select your intended option, enter OTP access code from your authenticator app and click **Update**

## Using recovery codes and re-setup a previously enabled MFA

You might be in a situation where you no longer have access to your rubygems.org account in an
authenticator app. This can happen if you lose/upgrade your phone or accidentally deleted
the rubygems.org account in the authenticator app.

In this situation, you'll need your recovery codes to gain access to your rubygems.org account.
Each recovery code can *only be used once* and you'll need *2 recovery codes* to re-setup
a previously enabled MFA rubygems.org account on a new device or add it to an authenticator app.

1. To login into your account, enter an unused recovery code as the OTP code when prompted.

2. To setup the new device for multi-factor authentication on a previously MFA enabled account,
you'll need to disable MFA and use a recovery code as the OTP code. Then follow the steps in
the enable multi-factor authentication section above to enable MFA using your new device or
add rubygems back to the authenticator app.

Note: The Google Authenticator app only allows an MFA account to be installed on one device
and there is no backup or cloud sync of the data. So if you lose or upgrade your phone, you'll
have to set up MFA again on the new phone. On the other hand, the Authy and Authenticator Plus
apps allow you to use multiple devices by providing cloud backups and cross-device sync
capabilities.
