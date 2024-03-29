---
layout: default
title: Setting up WebAuthn / Passkey multi-factor authentication
url: /setting-up-webauthn-mfa
previous: /setting-up-multifactor-authentication
next: /setting-up-otp-mfa
---

<em class="t-gray">Setting up WebAuthn multi-factor authentication</em>

Using WebAuthn for multi-factor authentication (MFA) is the best way to
protect your account from takeover. It's stronger and easier to use than
[OTP codes](/setting-up-otp-mfa).

## Prerequisite

To use WebAuthn, you will need at least _one_ of the following:

* A hardware security token (sometimes called a security key), such as a
  YubiKey or Google Titan Key.
* A built-in hardware device, such as TouchID, FaceID or Windows Hello.
* A browser that supports the "Passkey" standard. Up-to-date versions of
  Chrome, Safari, Firefox and Edge all support this standard.

Unfortunately implementations of these experiences vary, so we can't show
the exact details, but we will point out the steps that are specific to
using RubyGems.org.

## Enabling WebAuthn multi-factor authentication

1. Login to rubygems.org using your existing account and go to the
[edit settings](https://rubygems.org/settings/edit) page.
2. In the "Multi-factor Authentication" section you will see two options:
"Authentication App" and "Security Device". Under "Security Device" you
will see a field for "Nickname".
  ![Nickname for security device on the edit settings page](/images/enabling_webauthn_nickname.png){:class="t-img"}
3. Choose a name for your device. Use something that helps you remember
which device you used. For example, you might use nicknames like "Mary's
YubiKey" or "Naveen's iPhone".
4. Below the Nickname field, click **Register device**.
5. Your browser will prompt you to set up a device or a Passkey. This
experience varies according to browser. Chrome tries to set up a Passkey
that it manages, though you can select "Try another way" to use a USB
hardware token. Safari asks you to enable iCloud Keychain, but you can
click "Other Options" to use a hardware token. Other browsers may vary.
6. You will now see your security device on the screen above the Nickname
field.
