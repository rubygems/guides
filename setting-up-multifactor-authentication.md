---
layout: default
title: Setting up multi-factor authentication
url: /setting-up-multifactor-authentication
previous: /run-your-own-gem-server
next: /setting-up-webauthn-mfa
---

<em class="t-gray">Want to better protect your rubygems.org account?</em>

Your rubygems.org account is important! Unauthorized access of your account
can lead to irrevocable damage to your gem's reputation. We highly recommend
that you enable MFA for both UI and API. When enabled, this will mean that
you need to use MFA for signing into rubygems.org and when running `gem signin`,
`push`, `owner --add`, `owner --remove` and `yank`.

You may enable MFA using [WebAuthn](/setting-up-webauthn-mfa) or by
using [one-time passwords (OTP)](/setting-up-otp-mfa).
