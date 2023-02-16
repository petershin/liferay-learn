---
toc:
  - ./sites/adding-a-site.md
  - ./sites/site-templates.md
  - ./sites/site-hierarchies.md
  - ./sites/site-membership.md
  - ./sites/personal-sites.md
  - ./sites/exporting-importing-site-pages-and-content.md
  - ./sites/default-site-applications.md
uuid: 0a0ae4c3-008d-4a10-a8a8-03769e8bb589
---

# Sites

```{toctree}
:maxdepth: 4

sites/adding-a-site.md
sites/site-templates.md
sites/site-hierarchies.md
sites/site-membership.md
sites/personal-sites.md
sites/exporting-importing-site-pages-and-content.md
sites/default-site-applications.md
```

Sites are customizable spaces for building personalized digital experiences. Each Site includes [out-of-the-box applications](./sites/default-site-applications.md) for building custom solutions, such as portals, intranets, e-commerce storefronts, and more. When creating a Site, you can create a Blank Site or use custom and default Site Templates to populate the Site with predefined structures and content. If you're using [Organizations](../users-and-permissions/organizations/understanding-organizations.md), you can also enable dedicated [Organization Sites](../users-and-permissions/organizations/organization-sites.md) to develop and manage Sites that meet the needs of each Organization.

By default, Liferay also generates personal Sites for authenticated users. Each user is the sole member of their personal Site and can use it to display and manage their content. If you're using [User Groups](../users-and-permissions/user-groups/creating-and-managing-user-groups.md), you can create [User Group Sites](../users-and-permissions/user-groups/user-group-sites.md) to add predefined Pages to the personal Site of every group member.

```{note}
Pages, content, and other application data created on the Site-level is scoped to that Site and generally cannot be shared between Sites. However, some data can be shared between [Sites in a hierarchy](./sites/site-hierarchies.md). 

Also, configurations at the Site level override configurations at the System and Instance levels. See [Understanding Configuration Scope](../system-administration/configuring-liferay/understanding-configuration-scope.md) for more information.
```

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Adding a Site
:link: ./sites/adding-a-site.md
:::

:::{grid-item-card} Site Templates
:link: ./sites/site-templates.md
:::

:::{grid-item-card} Site Hierarchies
:link: ./sites/site-hierarchies.md
:::

:::{grid-item-card} Site Membership
:link: ./sites/site-membership.md
:::

:::{grid-item-card} Personal Sites
:link: ./sites/personal-sites.md
:::

:::{grid-item-card} Exporting/Importing Site Pages and Content
:link: ./sites/exporting-importing-site-pages-and-content.md
:::

:::{grid-item-card} Default Site Applications
:link: ./sites/default-site-applications.md
:::
::::

## Using Sites with Commerce

Liferay Sites are used with [Channels](https://learn.liferay.com/commerce/latest/en/store-management/channels.html) to create e-commerce storefronts. Each Channel's Site Type (i.e., B2B, B2C, or B2X) determines how the Site works with Accounts. See [Commerce Site Types](https://learn.liferay.com/commerce/latest/en/starting-a-store/sites-and-site-types.html) for more information.
