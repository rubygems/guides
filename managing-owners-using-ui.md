---
layout: default
title: Managing Owners via UI
url: /managing-owners-using-ui
previous: /security
next: /removing-a-published-gem
---

<em class="t-gray">How to add or remove owners to your gem using the web UI?</em>

If you have multiple maintainers for your gem, it is important to know all the users
who have access to your gem. Similar to `gem owner --add` and `gem owner --remove` in gem CLI,
you can view, add and remove the owners of the gem you own along with additional information about the owners.

View owners of your gem
-----------------------

### Step: 1
If you are an owner of a gem,
a link to *Ownership* will be visible in Links section as show in the image below.
![Rubygem page](/images/managing-owners-using-ui/rubygem-page.png){:class="t-img"}

### Step: 2
You will be asked to enter your account's password before performing any action
related to owners. You won't be prompted for the password confirmation for
next 10 minutes. This is a precautionary measure to ensure that no one abuses your unattended logged in session.
![Confirm Password](/images/managing-owners-using-ui/confirm-password.png){:class="t-img"}

### Step: 3
The owners of the gem will be listed along with ownership confirmation and MFA status. Confirmed owners will have the time they confirmed their ownership.
![Owners Index](/images/managing-owners-using-ui/owners-index.png){:class="t-img"}

Adding user as owner to your gem
--------------------------------
Step: 1
Enter email or handle of the user to be added as owner in the text field labels *Email/Handle* and click *Add Owner*.

Step: 2
The user added as an owner will be sent an email with a link to confirm the ownership.
The ownership of the user will be confirmed if user clicks the link within `48 hours`.
On confirmation, all the existing owners will be notified about the owner addition.

`Note that` the user won't have access to the gem until they confirm the ownership addition.

Resend ownership confirmation link
----------------------------------
In case you weren't able to confirm the ownership within 48 hours,
you can resend the confirmation link by visiting the gem page.
`https://rubygems.org/gems/<gem-name>`

![Owners Index](/images/managing-owners-using-ui/rubygem-resend-confirmation.png){:class="t-img"}

Clicking on *Resend Confirmation* will send an email with confirmation link
to your email address.

Removing owner from your gem
----------------------------
To remove an owner from your gem, visit `https://rubygems.org/gems/<gem-name>/owners`
and click on *Remove Owner* button of corresponding user.
The user being removed will be notified by an email about the removal.
