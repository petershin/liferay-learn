---
taxonomy-category-names:
- Content Management System
- Content Configurations
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 1f79bd0e-9ebd-4f66-9044-334c220a9be7
---

# Configuring the Asset Recycle Bin for Sites

The recycle bin stores content and assets that have been flagged for deletion, before they are permanently removed from the system. This functionality can be enabled globally by default and can be configured on a per-site basis. See the [Recycle Bin](../../../content-authoring-and-management/recycle-bin/recycle-bin-overview.md) section for more information on the recycle bin.

!!! warning
    If you disable the recycle bin for a Site, the content and assets deleted in the site are permanently deleted.

## Configuring the Recycle Bin for Sites

1. Access the Recycle Bin option:

   -  In Liferay DXP 7.4+

      1. From the Site Menu, go to *Configuration* &rarr; *Site Settings*.

      1. In the Content and Data section, click *Recycle Bin*.

         ![In Liferay DXP 7.4+, change the Recycle Bin options from the Site Settings section.](./configuring-the-asset-recycle-bin-for-sites/images/02.png)

   -  In previous Liferay DXP versions

      1. From the Site Menu, go to *Configuration* &rarr; *Settings*.
      1. Under the Advanced area, expand the *Recycle Bin* section.

         ![In previous Liferay DXP versions, change the Recycle Bin options from the Settings section.](./configuring-the-asset-recycle-bin-for-sites/images/01.png)

1. Toggle the *Enable Recycle Bin* to enable or disable the recycle bin for the site.

1. Optionally, provide a value (in minutes) in the *Trash Entries Max Age* input to specify how long the recycled assets should remain in the recycle bin before permanent deletion.

1. Click *Save*.

## Related Information

- [Recycle Bin Overview](../../../content-authoring-and-management/recycle-bin/recycle-bin-overview.md)
- [Configuring the Recycle Bin](../../../content-authoring-and-management/recycle-bin/configuring-the-recycle-bin.md)
- [Site Settings UI Reference](../../site-settings/site-settings-ui-reference.md)
