# Segments Admin Settings

You can configure *Segments* at the system level in *System Settings* or at the instance level in *Instance settings*.

To configure segments at the system level,

1. Open the *Global Menu* ![Global Menu](../../../images/icon-applications-menu.png) and click on *Control Panel* &rarr; *System Settings*.

1. Scroll down to the *Content and Data section* and click *Segments*.

To configure segments at the instance level, follow the same steps as above and select *Instance Settings* from the *Global Menu*.

```{note}
These settings are available under Instance Settings starting from Liferay DXP 7.4 U38+/GA38+.
```

## Analytics Cloud Segments

![View and configure Analytics Cloud Segments settings under System and Instance settings.](./segments-admin-settings/images/01.png)

**Anonymous User Segments Cache Expiration Time** – You can add anonymous users to segments based on their behavior. This field defines the time (in seconds) after which the segment cache for these users expires.

**Interest Terms Cache Expiration Time** – This defines the time (in seconds) after which the Interests cache expires. Read [Understanding Interests](https://learn.liferay.com/analytics-cloud/latest/en/workspace-data/definitions/managing-interest-topics.html#understanding-interests)   for more information.

**Update Interval** – This defines the interval (in minutes) at which you get updates from segments in Analytics Cloud.

## Session Property Vocabularies

Read [Session Property Vocabularies](../../../content-authoring-and-management/tags-and-categories/session-property-vocabularies.md) for more information.

## Segments Service

![View and configure Segments Service settings under System and Instance settings.](./segments-admin-settings/images/02.png)

**Enable Segmentation** - Use this checkbox to enable or disable segmentation. If unchecked, it disables user segmentation on every request. As a result, personalized variations of collections and experiences are not displayed to the end user.

**Enable Assign Roles by Segment** - If you enable this setting, you can assign users to a role using a global segment. Instead of manually updating a role, you can assign groups of dynamically changing individuals to a role automatically.

To do this,

1. Open the *Global Menu* ![Global Menu](../../../images/icon-applications-menu.png) and navigate to *Control Panel* &rarr; *Users*.

1. Click on *Roles*, and select a role of your choice.

1. Click the *Assignees* tab and click *Segments*.

1. Select a global segment of your choice. Users from that segment get assigned to the selected role dynamically.

   ![Select a global segment of your choice to assign users from that segment to the selected role dynamically.](./segments-admin-settings/images/03.png)

**Compound Segments Interval** -  This defines the time interval (in minutes) for checking and refreshing compound segments based on its rules.

```{important}
You can also configure these settings per instance. Go to Control Panel &rarr; Instance Settings &rarr; Segments to change the defaults. You cannot, however, configure the *Update Interval* and *Compound Segments Interval* per instance under *Instance Settings*. 
```
