---
layout: default
title: API key scopes
previous: /rubygems-org-rate-limits
next: /run-your-own-gem-server
---

<em class="t-gray">RubyGems.org API keys, their scopes, and CLI usage</em>

You can create multiple API keys based on your requirements. API keys have varying scopes that grant specific privileges. Using API keys with the least amount of privilege makes your RubyGems.org account more secure by limiting the impact a compromised key may have.

Create a new API key
-----------------------

Visit your RubyGems.org account [settings page](https://rubygems.org/settings/edit) and click on **API KEYS**. You will be prompted for your account password to confirm your identity.

![Settings API key](/images/settings-api-key.png){:class="t-img"}

If you have never visited this page before, you should see at least one key with the name *legacy-key*. The *legacy-key* is relic of the time when RubyGems.org used to have a single API key per account with full access. We recommend that you [migrate away from *legacy-key*](#migration-from-legacy-api-key) as soon as possible.

Click on **New API Key** to create a new API key for your account.

![Settings API key](/images/api-keys-index.png){:class="t-img"}

Enter a name to help you identify the environment the API key may be used in (eg: ci-push-key, mirror-webhook-key, etc.). Check all the scopes you may want to enable and click on create.

**Note:** *Show dashboard* is an exclusive scope, and it can't be enabled in combination with any other scope.

![New API key](/images/new-api-key.png){:class="t-img"}

On the following page, you should see the new API key.

![API key created](/images/api-key-created.png){:class="t-img"}

The *Age* column shows how old is the key. The *Last access* column shows the last time (in UTC) the key was used in a successful authentication. You can use the **Edit** button to update the scopes of the key. You can use the **Reset** button in the last row to delete *all* the API keys associated with your account.

Usage with gem CLI
------------------

**Note:** You need rubygems 3.2.0 or newer if you like to create API keys with scopes from the gem CLI.

Running `gem signin` will prompt you for your RubyGems.org credentials, key name, and scopes to enable for the key. The default choice for all scopes is not to enable them.

    $ gem signin
    Enter your RubyGems.org credentials.
    Don't have an account yet? Create one at https://rubygems.org/sign_up
       Email:   john@doe.com
    Password:

    API Key name [4458ffe32b0c-unknown-user-20201231104303]:   docker-push-key
    Please select scopes you want to enable for the API key (y/n)
    index_rubygems [y/N]:
    push_rubygem [y/N]:   Y
    yank_rubygem [y/N]:
    add_owner [y/N]:
    remove_owner [y/N]:
    access_webhooks [y/N]:
    show_dashboard [y/N]:

    Signed in with API key: docker-push-key.

An API key will automatically be created (default key name: *hostname-whoami-timestamp*) with the required scope when we couldn't find any API key on your host. Similarly, the scope of the existing API key on the host will be updated with the required scope if the key didn't have the correct scope.

    $ gem yank begone -v 4.1.48
    Yanking gem from https://rubygems.org...
    The existing key doesn't have access of yank_rubygem on https://rubygems.org. Please sign in to update access.
       Email:   john@doe.com
    Password:
    Added yank_rubygem scope to the existing API key
    Successfully deleted gem: begone (4.1.48)

API key scopes
--------------

* [Index rubygems](https://guides.rubygems.org/rubygems-org-api/#get---apiv1gemsjsonyaml): List all RubyGems of your account
* [Push rubygems](https://guides.rubygems.org/rubygems-org-api/#post---apiv1gems): Create a new RubyGem or publish a new version of any RubyGem you own
* [Yank rubygems](https://guides.rubygems.org/rubygems-org-api/#delete---apiv1gemsyank): Remove a published version of any RubyGem you own
* [Add owner](https://guides.rubygems.org/rubygems-org-api/#post---apiv1gemsgem-nameowners): Add a user to owners of any RubyGem you own
* [Remove owner](https://guides.rubygems.org/rubygems-org-api/#delete---apiv1gemsgem-nameowners): Remove a user from owners of any RubyGem you own
* [Access webhooks](https://guides.rubygems.org/rubygems-org-api/#webhook-methods): List, create, delete or fire webhooks associated with your account
* [Show dashboard](https://rubygems.org/dashboard): Access to atom feed of your RubyGems.org dashboard. It is an exclusive scope and can't be enabled with any other scope.

Enable MFA on specific API keys
-----------------------------

If your account has MFA enabled on the **UI and gem signin** [authentication level](https://guides.rubygems.org/setting-up-multifactor-authentication/#authentication-levels), you have the option to enable MFA on a specific API key. This will require an OTP code for `gem push`, `yank`, `owner --add/--remove` commands.

You can toggle this option when creating or editing an API key on the UI.
![New API key with MFA enabled](/images/new-mfa-api-key.png){:class="t-img"}

Migration from legacy-api key
-----------------------------

The legacy API key of your account has been migrated to one with all scopes enabled. We strongly recommend that you delete this key and replace it with a new API key with minimum scopes enabled.

* Visit [API keys page](https://rubygems.org/profile/api_keys) of your account and click on **delete** button for the key named *legacy-key*.
* Run `gem signout` on all hosts where you have used the legacy API key
* Make sure you have rubygems 3.2.0 or newer installed. Run `gem update --system` to update your rubygem to the latest release.
* Run `gem signin` to create a new API key.

If it is not possible for you to update your rubygems, you can still use the new API key by creating a new key using the web UI and replacing the key in `~/.gem/credentials` or `~/.local/share/gem/credentials` file.

    $ cat ~/.local/share/gem/credentials
    :rubygems_api_key: rubygems_cec9db9373ea171daaaa0bf2337edce187f09558cb19c1b2

**Note:** The legacy endpoint to fetch API keys, `GET /api/v1/keys` has been updated to create a new API key on each request. As a security precaution, the new API keys are stored in our database after one-way encryption. It is no longer possible for us to fetch the same API key in plain text.
