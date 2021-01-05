---
layout: default
title: RubyGems.org rate limits
url: /rubygems-org-rate-limits
previous: /rubygems-org-api-v2
next: /api-key-scopes
---

<em class="t-gray">Why are you seeing 429 responses?</em>

Load balancer rate limits
----

To protect the RubyGems.org service from abuse, both intentionally and unintentionally, we have rate limits in place for some of our endpoints. Some endpoints may be cached by our CDN at times and therefore, _may_ allow higher request rates. The following is a general guideline for the rate limit rules.

* API and website: 10 requests per second
* Dependency API: 15 requests per second

Application rate limits
----

We use [rack-attack](https://github.com/kickstarter/rack-attack) for throttling clients attempting brute force on login, signup, and MFA endpoints. Additionally, we rate limit endpoints which send email to prevent abuse of our paid email service. When you have hit one of the application rate limits, you will see `Retry-After` header in the response with seconds until the rate limit resets. Unless mentioned, all rate limits are on client IP.

## Endpoints with 100 requests/10 minutes rate limit

* User sign in - `POST /session`
* User sign up - `POST /users`
* Password reset request - `POST /passwords`
* Profile update - `PATCH /profile`
* Profile delete - `DELETE /profile`
* Email confirmation request - `POST /email_confirmations`

## Rate limits with exponential backoff

It is not possible to brute force your MFA code in a single time window. However, an attacker's chance of successfully guessing the code at least once increases when the brute force is attempted over an extended period. You can read more about this [here](https://security.stackexchange.com/a/185917) and check our calculation of the backoff period [here](https://github.com/rubygems/rubygems.org/pull/2330#issuecomment-643931531).
Following endpoints have rate limits of **300 requests/5 minutes** and **600 requests/25 hours**:

* OTP verification on sign in - `POST /session/mfa_create`
* OTP verification on password reset - `POST /users/:user_id/password/mfa_edit`
* Registering a new MFA device - `POST /multifactor_auth`
* Updating or disabling MFA level - `PUT /multifactor_auth`
* Yanking a gem - `DELETE /api/v1/gems/yank`
* Adding an owner - `POST /api/v1/gems/:rubygem_id/owners`
* Removing owner - `DELETE /api/v1/gems/:rubygem_id/owners`
* Show API key (`gem signin`) - `GET /api/v1/api_key`

## Gem push rate limit

`POST /api/v1/gems` has following two rate limits:

* 400 requests/1 hour
* 300 requests/5 minutes and 600 requests/25 hours on *failed requests* (response status not equal to 200).

## Miscellaneous rate limits

* 10 request/10 minutes on gem yank - `DELETE /api/v1/gems/yank`
* 100 request/10 minutes/email or username on sign in - `POST /session`
* 100 request/10 minutes/email or username on API key show - `GET /api/v1/api_key`
* 10 request/10 minutes/email on password reset request - `POST /passwords`
* 10 request/10 minutes/email on email confirmation request - `POST /email_confirmations`

The RubyGems.org team may occasionally blackhole user IP addresses for extreme cases to protect the platform. If you think this has happened to you, please [submit a help ticket](https://help.rubygems.org/discussion/new), and we'll be happy to look at it.
