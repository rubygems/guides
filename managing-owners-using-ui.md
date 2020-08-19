---
layout: default
title: Managing Owners via UI
url: /managing-owners-using-ui
previous: /security
next: /removing-a-published-gem
---

<em class="t-gray">How to add, remove and view owners of your gem.</em>

If you have multiple maintainers for your gem, it is important to know all the users
who have access to your gem. Similar to `gem owner --add` and `gem owner --remove` in gem CLI,
you can view, add and remove the owners of the gem you own along with additional information about the owners.

View owners of your gem
-----------------------
To view all the owners of your gem, visit your gem page `https://rubygems.org/gems/<gem-name>`. Consider a gem 
[activesupport](http://rubygems.org/gems/activesupport). 

### Step: 1 
If you are an owner of the gem,
a link to *Ownership* will be visible in Links section as show in the image below.
![Rubygem page](/images/managing-owners-using-ui/rubygem-page.png){:class="t-img"}

### Step: 2
To provide better security, you will be asked to confirm the password before performing any action
related to owners. After confirming, you won't be prompted for the password confirmation for
next 10 minutes.
![Confirm Password](/images/managing-owners-using-ui/confirm-password.png){:class="t-img"}

### Step: 3
The owners of the gem will be listed along with information to audit ownership changes and MFA status.
![Owners Index](/images/managing-owners-using-ui/owners-index.png){:class="t-img"}

Adding user as owner to your gem
--------------------------------
Step: 1
Add email or handle of the user of rubygems.org to be added as owner and click *Add Owner*.

Step: 2
The user added as an owner will be sent an email with a link to confirm the ownership.
The ownership of the user will be confirmed if user clicks the link within `48 hours`.
On confirmation, all the existing owners will be notified about the owner addition.

Resend ownership confirmation link
----------------------------------
In case you weren't able to confirm the ownership within 48 hours,
you can resend the confirmation link by visiting the gem page. 
`https://rubygems.org/gems/<gem-name>`

You will find a link *Resend Confirmation* in the Links section.
Clicking on resend confirmation will send an email with confirmation link
to your email address which will be valid for next 48 hours.
 
Removing owner from your gem
----------------------------
To remove an owner from your gem, visit `https://rubygems.org/gems/<gem-name>/owners`
and click on *Remove Owner* button of corresponding user.
The removed user will be notified by email about the removal.
