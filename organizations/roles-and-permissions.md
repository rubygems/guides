---
url: /organizations/roles-and-permissions
title: Organization Roles and Permissions
layout: default
previous: /organizations/managing-members
next: /organizations/transferring-gems
---

# Organization Roles and Permissions

<div class="beta-banner">
  <span class="beta-banner__icon">⚠️</span>
  <strong class="beta-banner__title">Private Beta:</strong>
  <span class="beta-banner__text">Organizations are currently in limited private beta testing. If you're interested in joining the beta program, please contact <a href="mailto:support@rubygems.org">support@rubygems.org</a>.</span>
</div>

Organizations use role-based access control to ensure team members have appropriate permissions. Understanding these roles helps you build an effective collaboration structure.

## Available Roles

### Owner
The highest level of access. Owners have complete control over the organization.

**Best for:** Organization founders, CTOs, or team leads who need full control.

### Admin
Administrators handle day-to-day organization management.

**Best for:** Senior developers, team managers, or trusted contributors who manage gems and team members.

### Maintainer
The base level of organization membership with essential access.

**Best for:** Developers who need to work with organization gems but don't require administrative privileges.

## Permission Comparison

| Action | Owner | Admin | Maintainer |
|--------|--------|--------|--------|
| View organization info | ✓ | ✓ | ✓ |
| Push gem versions | ✓ | ✓ | ✓ |
| Yank gem versions | ✓ | ✓ | ✓ |
| View member list | ✓ | ✓ | ✓ |
| Invite members | ✓ | ✓ | ✗ |
| Remove members | ✓ | ✓¹ | ✗ |
| Change member roles | ✓ | ✓¹ | ✗ |
| Add gems | ✓ | ✓ | ✗ |
| Remove gems | ✓ | ✗ | ✗ |
| Update organization | ✓ | ✗ | ✗ |
| Delete organization | ✓ | ✗ | ✗ |

¹ *Admins cannot modify or remove Owners*

## Next Steps

- Learn about [Managing Organization Members](/organizations/managing-members)
- Understand [Transferring Gems](/organizations/transferring-gems) to organizations

---

Questions about roles? Contact [support@rubygems.org](mailto:support@rubygems.org) for assistance.
