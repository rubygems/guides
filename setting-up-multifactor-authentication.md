---
layout: default
title: Setting up multi-factor authentication
url: /setting-up-multifactor-authentication
previous: /run-your-own-gem-server
next: /setting-up-webauthn-mfa
---

<em class="t-gray">Want to better protect your RubyGems.org account?</em>

Your RubyGems.org account is important! Unauthorized access of your account
can lead to irrevocable damage to your gem's reputation. We highly recommend
that you enable MFA for both UI and API. When enabled, this will mean that
you need to use MFA for signing into RubyGems.org and when running `gem signin`,
`push`, `owner --add`, `owner --remove` and `yank`.

You may enable MFA using [WebAuthn](/setting-up-webauthn-mfa) or by
using [one-time passwords (OTP)](/setting-up-otp-mfa).

## Authentication levels

When you register a new device or enable MFA for the first time, we will enable
MFA for both the UI and the API. If you go to the "Edit Settings" page again, in the "Multifactor Authentication" section, you
will see a dropdown menu with these options:

- **UI only (Deprecated)**: sign in from browser, updating MFA levels and resetting password will require OTP code. These are referred to as UI operations.
- **UI and gem signin**: UI operations and `gem signin` will require OTP code.
- **UI and API**: UI operations, `gem signin`, `push`, `owner --add` and `owner --remove` will require OTP code.

Note: If you are on the "UI only" or "UI and gem signin" authentication level,
you can selectively enable MFA on specific API keys (see [API key scopes](http://guides.rubygems.org/api-key-scopes/#enable-mfa-on-specific-api-keys)).
This is different from the "UI and API" level as MFA is enabled on all API keys by default and cannot be selectively enabled.

Steps to change your MFA level:

1. Sign in and go to the _edit settings_ page. If you have enabled MFA for your account, in the "Multi-factor Authentication" section, you will see a dropdown menu. Select your intended option, and click **Update**.
    ![Multi-factor section on the edit settings page](/images/changing_mfa_step1.png){:class="t-img"}
2. You will be prompted to use your MFA device to authorize the MFA level change.
    ![Multi-factor authentication prompt to update MFA level](/images/changing_mfa_step2.png){:class="t-img"}

## Using recovery codes and re-setup a previously enabled MFA

You might be in a situation where you no longer have access to your MFA device.

In this situation, you'll need your recovery codes to gain access to your RubyGems.org account.
Each recovery code can *only be used once* and you may need up to *2 recovery codes* to re-setup
a previously enabled MFA RubyGems.org account on a new device.

1. To login into your account, enter an unused recovery code as the OTP code when prompted.
2. To re-setup an [authenticator app](https://rubygems.org/settings/edit#authenticator-app), you'll need to use a recovery code to remove the current authenticator app. Then, you are able to enable and re-configure your authenticator app. For security devices, you are able to associate a new security device to your account in the [security devices section](https://rubygems.org/settings/edit#security-device).
