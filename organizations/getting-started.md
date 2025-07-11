---
layout: default
title: Getting Started with Organizations
url: /organizations/getting-started
previous: /organizations
next: /organizations/managing-members
---

<div class="beta-banner">
  <span class="beta-banner__icon">⚠️</span>
  <strong class="beta-banner__title">Private Beta:</strong>
  <span class="beta-banner__text">Organizations are currently in limited private beta testing. If you're interested in joining the beta program, please contact <a href="mailto:support@rubygems.org">support@rubygems.org</a>.</span>
</div>

# Getting Started with Organizations

Create your first Organization and start collaborating on RubyGems.org in minutes.

## Before You Begin

To create an organization, you'll need:

- A RubyGems.org account with **multi-factor authentication (MFA)** enabled
- At least one gem where you're listed as an owner

## Creating Your Organization

Navigate to your [dashboard](https://rubygems.org/dashboard) and click **Create Organization**.

### Step 1: Set Organization Details

Provide your Organization's information:

- **Handle**: Your unique identifier (selected from a list of gems the current user is listed as an owner of)
- **Display Name**: How your Organization appears publicly (2-255 characters)

The handle becomes part of your organization URL: `rubygems.org/organizations/your-handle`

### Step 2: Select Gems to Transfer

If you own multiple gems, choose which ones to transfer to the Organization:

- Only gems where you're an owner appear in the list
- Gems already belonging to other organizations are excluded
- You can transfer additional gems later

**Important:** Once transferred, gems belong to the Organization. Individual ownership is replaced by organization membership.

### Step 3: Invite Team Members

Add your collaborators to the Organization:

**Automatic Suggestions:** We'll suggest users who co-own your selected gems. This makes it easy to maintain existing collaborations.

**Assign Roles:** Choose the appropriate role for each member:

- **Owner**: Full organization control
- **Admin**: Gem and member management
- **Maintainer**: Basic access and gem operations
- **Outside Collaborator**: Limited access, retains personal ownership of gems and is not a member of the orgnization

### Step 4: Confirm and Create

Review your organization setup:

- Organization name and handle
- Selected gems for transfer
- Invited members and their roles

Click **Create Organization** to finalize your Organization. You'll see:

- Your Organization is created
- Selected gems are transferred
- Members receive an email to join your Organization.
- You're redirected to your organization page

## After Creation

### Immediate Next Steps

1. **Wait for Invitations**: Members must accept their invitations to join the Organization
2. **Configure Settings**: Visit organization settings to customize further
3. **Transfer More Gems**: Add additional gems as needed

### Managing Your Organization

Access your Organization at `rubygems.org/organizations/your-handle` to:

- View organization gems
- Manage members
- Update settings
- Monitor activity

### API and Automation

Currently, onboarding an Organization must be done through the web interface. API support may be added in future.

## Troubleshooting

### Can't Create Organization?
- Verify MFA is enabled on your account
- Ensure you own at least one gem (for gem-based organizations)
- Check that your desired handle isn't already taken

### Invitation Issues?
- Invitations expire after a set period
- Members must have RubyGems.org accounts
- Check spam folders for invitation emails

### Need More Help?

- Review our [Roles and Permissions](/organizations/roles-and-permissions) guide
- Learn about [Managing Members](/organizations/managing-members)
- Contact [support@rubygems.org](mailto:support@rubygems.org) for assistance

---

Ready to collaborate? [Create your Organization](https://rubygems.org/organizations/new) now.
