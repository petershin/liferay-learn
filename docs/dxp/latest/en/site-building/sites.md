---
toc:
  - ./sites/adding-a-site.md
  - ./sites/site-templates.md
  - ./sites/site-hierarchies.md
  - ./sites/site-membership.md
  - ./sites/personal-sites.md
  - ./sites/exporting-importing-site-pages-and-content.md
  - ./sites/default-site-applications.md
taxonomy-category-names:
- Sites
- Site Administration
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 0a0ae4c3-008d-4a10-a8a8-03769e8bb589
---

# Sites

Sites are customizable spaces for building personalized digital experiences. Each site includes [out-of-the-box applications](./sites/default-site-applications.md) for building custom solutions, such as portals, intranets, e-commerce storefronts, and more. When creating a site, you can create a blank site or use custom and default site templates to populate the site with predefined structures and content. If you're using [organizations](../users-and-permissions/organizations/understanding-organizations.md), you can also enable dedicated [organization sites](../users-and-permissions/organizations/organization-sites.md) to develop and manage sites that meet the needs of each organization.

By default, Liferay also generates personal sites for authenticated users. Each user is the sole member of their personal site and can use it to display and manage their content. If you're using [user groups](../users-and-permissions/user-groups/creating-and-managing-user-groups.md), you can create [user group sites](../users-and-permissions/user-groups/user-group-sites.md) to add predefined pages to the personal site of every group member.

```{note}
Pages, content, and other application data created on the site-level is scoped to that site and generally cannot be shared between sites. However, some data can be shared between [sites in a hierarchy](./sites/site-hierarchies.md). 

Also, configurations at the site level override configurations at the system and instance levels. See [Understanding Configuration Scope](../system-administration/configuring-liferay/understanding-configuration-scope.md) for more information.
```



## Using Sites with Commerce

Liferay sites are used with [channels](https://learn.liferay.com/w/commerce/store-management/channels) to create e-commerce storefronts. Each channel's site type (i.e., B2B, B2C, or B2X) determines how the site works with accounts. See [Commerce Site Types](https://learn.liferay.com/w/commerce/starting-a-store/sites-and-site-types) for more information.
