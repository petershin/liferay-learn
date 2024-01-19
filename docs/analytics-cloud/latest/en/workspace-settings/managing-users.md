---
uuid: 8ec528c8-06fc-423d-b55b-8bf1a6ae3c53
taxonomy-category-names:
- Cloud
- Analytics Cloud Administration
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---
# Managing Users

If you are the workspace Owner or have been assigned the Admin permission, you can invite and manage users. Here’s how to bring up the User Management page:

1. Click on Settings in the navigation panel. The default Settings page appears.

1. Click on User Management in the navigation area. The User Management page appears, listing all the workspace’s users.

From the User Management page, an Admin user (or Owner) can invite users, edit their permissions, and delete them.

If your workspace is new, you’ll want to invite your teammates to the workspace.

## Inviting Users

To invite new users to your Analytics Cloud workspace, perform these steps:

1. In the User Management page, click on the Invite Users button. The Invite Users dialog appears.

1. Enter the email addresses (separated by a space or comma) of the people to invite to the workspace.

1. Click the Send button. The invitation is sent to your teammate.

![The invitation email provides the workspace number.](managing-users/images/01.png)

You can set the user’s permissions when their invitation acceptance is pending.

```{note}
Invited users must have Liferay accounts to use Analytics Cloud. If they don't have Liferay accounts, direct them to [create one](https://login.liferay.com/signin/register).
```

## Managing Permissions

Analytics Cloud workspaces have the following Roles:

**Owner:** Can do all things, but cannot be deleted.

**Admin:** Can do all things, including manage other Admin users. Admin users can be deleted.

**Member:** Can view all profiles and analytics, but cannot edit anything under Settings. They cannot manage users, or add or remove data sources.

### Changing a User's Role

Here’s how to change a user’s permission Role:

1. Click the Edit button in the user’s list entry.

1. In the Permission column, select the user’s current permission. A permission Role selector appears.

1. Select the permission Role for the user.

The user is assigned the selected Role.
