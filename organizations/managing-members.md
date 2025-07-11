---
title: Managing Organization Members
layout: default
url: /organizations/managing-members
previous: /organizations/getting-started
next: /organizations/roles-and-permissions
---

# Managing Organization Members

<div class="beta-banner">
  <span class="beta-banner__icon">⚠️</span>
  <strong class="beta-banner__title">Private Beta:</strong>
  <span class="beta-banner__text">Organizations are currently in limited private beta testing. If you're interested in joining the beta program, please contact <a href="mailto:support@rubygems.org">support@rubygems.org</a>.</span>
</div>

This guide covers inviting new members, managing existing ones, and handling common membership scenarios.

## Viewing Members

Access your member list from your organization page:

1. Navigate to `rubygems.org/organizations/your-handle`
2. Click **Members** in the navigation
3. View all current members with their roles and join dates

The member list shows:
- Member username
- Current role (Owner, Admin, or Maintainer)

## Inviting New Members

### Who Can Invite?
- **Owners** can invite members at any level
- **Admins** can invite new Admins and Maintainers
- **Maintainers** cannot send invitations

### Sending Invitations

1. Click **Invite** from the members page
2. Enter the invitee's username
3. Select their role
5. Click **Invite**

### Invitation Process

**What happens next:**
- Invitee receives an email with a link to join the Organization
- MFA must be enabled before joining
- Invitation expires after 7 days
- You'll see pending invitations in your member list

**Tracking invitations:**
- Pending invitations appear with a "Pending" status
- See when invitations were sent
- Resend or cancel pending invitations

## Managing Existing Members

### Changing Roles

Adjust member permissions as responsibilities evolve:

1. Find the member in your list
3. Select the new role from the dropdown
4. Confirm the change

**Important considerations:**
- Only Owners can change Owner roles
- Admins cannot modify Owner permissions
- Changes take effect immediately

### Removing Members

When team members leave or no longer need access:

1. Locate the member to remove
2. Click **Delete**
3. Confirm the removal

**Removal rules:**
- Owners can remove anyone except themselves
- Admins can remove Maintainers and other Admins
- Members cannot remove themselves
- Removed members lose all organization access immediately

### API and Automation

Currently, managing Organization Members must be done through the web interface. API support may be added in future.

## Troubleshooting

### Invitation Not Received
- Check spam/junk folders
- Resend invitation if needed
- Confirm recipient has email access

### Cannot Change Roles
- Verify you have appropriate permissions
- Owners cannot be modified by Admins
- Contact an Owner for help

### Member Cannot Access Gems
- Confirm MFA is enabled
- Verify membership is active (not pending)
- Check organization gem list
- Review member's role permissions

### Accidental Removal
- Removed members must be re-invited
- Previous role not automatically restored
- Act quickly to minimize disruption

## Getting Help

- Review our [Roles and Permissions](/organizations/roles-and-permissions) guide
- Contact [support@rubygems.org](mailto:support@rubygems.org) for complex issues

---

Keep your team organized and secure with proper member management.
