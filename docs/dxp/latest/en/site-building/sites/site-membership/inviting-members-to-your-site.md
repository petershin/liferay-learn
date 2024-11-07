---
taxonomy-category-names:
- Sites
- User Invitations
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 25943f05-707d-4b45-ba84-2f55d60d8a79
---

# Inviting Members to Your Site

!!! note
    The Invite Members widget is [deprecated](../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md) as of Liferay 2024.Q4+ and is scheduled for removal in a future release.

You can use the Invite Members widget to invite users to join a site.

1. Navigate to the site page where you want to add the Invite Members widget (for example, the DXP Guest site's Wiki page) and start editing it.

1. In the Fragments and Widgets sidebar, look for the *Invite Members* widget. Drag and drop it into the page and publish the page.

1. On the published page, click *Invite Members* to bring up a new form.

   ![Select users to invite in the new window.](./inviting-members-to-your-site/images/02.png)

1. Click *Add* (![Add icon](../../../images/icon-add.png)) next to a user who should receive an invitation. Those who have already been invited but have not yet responded appear with a check mark next to their names. Users that have already accepted an invitation no longer appear on the list.

   For others not on the list, you can enter an email address under Invite by Email and click *Add Email Address*.

1. Select a role for the user by using the drop-down menu under Invite to Role. Select between *Site Owner*, *Site Content Reviewer*, or *Site Administrator*.

   Once you've added all the users you want to invite and have selected their roles, click the *Send Invitations* button to invite them. For more information on roles, see [Roles and Permissions](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md).

1. The site invitation shows up under the Requests List tab on the user's notifications page. The user can then choose to confirm or ignore the invitation.

   ![The invited users have an invitation request in their notifications page.](./inviting-members-to-your-site/images/03.png)

   When users confirm an invitation, they become site members assigned with the roles you defined.

## Related Topics

- [Adding Members to a Site](./adding-members-to-sites.md)
