---
toc:
  - ./organizations/understanding-organizations.md
  - ./organizations/creating-and-managing-organizations.md
  - ./organizations/adding-users-to-organizations.md
  - ./organizations/organization-roles.md
  - ./organizations/organization-sites.md
  - ./organizations/adding-a-new-organization-type.md
uuid: df9deaa0-6c5c-4e14-b5e0-e8f7be03a21e
taxonomy-category-names:
- Security
- User, Organization, and Account Management
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---

# Organizations

Organizations in Liferay can enable distributed user and site management that reflects real world organizational hierarchies. Organizations can nest to an unlimited number of hierarchical levels. Consider a typical organization chart:

![An organization chart shows how a typical grouping of company, governmental department, non profit, or any other collection of people is organized. Liferay's Organizations can model these.](./organizations/images/01.png)

This structure can be modeled in Liferay DXP, empowering you to delegate administrative responsibility and organize users in a way that reflects your organization. If you apply permissions to those users through organization roles, users who move from one organization to another in a defined hierarchy automatically receive appropriate permissions. 

## Organization Roles and Permissions

Organizations can have roles scoped only to them. An organization role's permissions affect only applications and content within that organization hierarchy. For example, the difference between a portal-scoped role versus an organization-scoped role that define access to message boards is twofold:

1. The organization role affects only message boards in that organization (or its children).

1. The portal role affects all message boards installation-wide.

![Organization roles take effect only within the organization.](./organizations/images/02.png)

This has great benefits. If, for example, a large company has modeled its organization chart in Liferay DXP as organizations, administration becomes an easy task. An IT User who has permission to use IT's provisioning application can transfer to HR, and by moving that user from IT to HR, permissions to the provisioning tool are removed automatically, while permissions to HR's compensation tool are granted automatically.

## Organization Administrators

Organization administrators are *delegated* administrators. This means they get a piece of your portal---a piece you define---to take some of the load of administration off of your shoulders. Organization administrators can do these things:

- Manage all the users in their organization and in any child organization.
- Optionally, assign users to their organization (see the `Organizations` [section of the portal-ext.properties](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Organizations)).
- Manage an organization's site, like a site administrator.

Organization administrators can't access the Control Panel by default. Instead, they can click the *My Organizations* link to gain access to any organizations they manage.

![Organization administrators can access their Organizations from their profile.](./organizations/images/03.png)

## Organization Sites

An organization can have its own site. Organization sites are owned by organization administrators, who have permissions similar to the site administrators: they can manage the site's pages, widgets, content, and users. Members of an organization with an attached site are members of the organization's site. This means that they can access pages in the organization's site, along with any portlets or content there.

## Next Steps

- [Creating and Managing Organizations](./organizations/creating-and-managing-organizations.md)