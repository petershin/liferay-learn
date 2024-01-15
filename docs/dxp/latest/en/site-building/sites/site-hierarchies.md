---
taxonomy-category-names:
- Sites
- Site Administration
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 96446801-dfc7-4c57-a007-4e6ea5c98c7b
---
# Site Hierarchies

Sites can be organized hierarchically, just like organizations, with child sites. Organizing sites hierarchically lets you share content between them easily. The difference between sites and organizations is that sites organize pages, content, application data, and users (via site memberships), whereas organizations only group users. Site hierarchy is discussed in more detail below.

## Content Sharing Between Sites

Content sharing is available for sites within the same hierarchy. For instance, if a parent site has a document type called Devcon Presentation and all its child sites should have a copy, the parent site's administrator can enable content sharing to share the document type automatically with its child sites. Also, content sharing privileges can be set to let every site administrator share content across sites they manage. You can share these content types across sites:

* Web Content Structures
* Web Content Templates
* Document Types
* Vocabularies and Categories
* Widget Templates
* Data Definitions (Dynamic Data Lists)

See the [Sites Admin Portlet](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Sites%20Admin%20Portlet) section of Liferay's `portal.properties` file for a list of relevant configurable properties. For example, the `Sites.content.sharing.with.children.enabled` property can disable/enable content sharing between sites and child sites, while letting site administrators configure it per site.

## Site Hierarchy Roles and Permissions

These rules apply to site hierarchy:

* Each child site in the hierarchy has its own administrator
* The site administrator role permissions don't flow down to child sites in the hierarchy
* If a site administrator creates a child site, he or she has the same permissions in that child site. This is because creating a site makes you the owner of that site (not inheritance).
* A site administrator has no default role in any child sites created by other site administrators.

```{note}
If you want a user to have administrative access to all sites in a site/child site hierarchy, you must create a role based on the site administrator role that has the permission Manage Subsites.
```

## Navigating Site Hierarchy with the Sites Directory Application

The sites directory application is a configurable app that shows a hierarchy of sites and child sites. It enables users to navigate to any of the displayed sites. To use this app to display site hierarchies, follow these steps:

1. Add the *Sites Directory* application to a page.
1. Open its *Configuration* window.
1. Select *List Hierarchy* under Display Style.
