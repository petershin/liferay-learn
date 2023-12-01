---
uuid: 1027ea78-102b-444b-8a99-cc54d7290a8a
---
# Assigning Roles to User Segments

> Available: Liferay DXP 7.2 SP2+, Liferay CE 7.3.1 GA2

User segments are dynamically assigned user collections. If a [segment can be well-defined with the available criteria](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md), the administrative overhead of user management can be greatly reduced. On top of this, you can define [personalized experiences](../../site-building/personalizing-site-experience.md) for user segments created at the site scope, ensuring that users see the most relevant content in your site.

| Where do I create user segments?                                            | What are they for?                                              | Where do I assign roles to a segment?                   |
|:----------------------------------------------------------------------------|:--------------------------------------------------------------- |:--------------------------------------------------------|
| Site Segments (Site Menu &rarr; People &rarr; Segments)                     | Create personalized experiences for a site's users.             | Site Menu &rarr; People &rarr; Segments (Actions)       |
| Instance Segments (Control Panel &rarr; Users &rarr; Roles (Regular Roles)) | Efficiently and dynamically manage users and their permissions. | Control Panel &rarr; Users &rarr; Roles (Regular Roles) |

## Assigning a Regular Role to a User Segment

> Available: Liferay DXP 7.2 SP2+

Regular roles can be assigned to user segments created at the Global scope. To assign regular roles to a user segment,

1. Open the *Product Menu* (![Product Menu](../../images/icon-product-menu.png)) and navigate to *Control Panel* &rarr; *Users* &rarr; *Roles*.

1. Click Actions (![Actions](../../images/icon-actions.png)) next to the regular role and select *Edit*.

    ![Edit a role to assign the user segment to it.](./assigning-roles-to-user-segments/images/01.png)

1. Select *Assignees* &rarr; *Segments* tab, and click (![Add button](../../images/icon-add.png)) to select a user segment.

    ![Go to the Segments tab under Assignees to assign the role.](./assigning-roles-to-user-segments/images/02.png)

1. Check the box next to an existing user segment and click *Add* to assign the role to it. If the user segment doesn't exist, click (![Add button](../../images/icon-add.png)) to create a new user segment.

    ![Check the box next to the user segment you want to assign the role to.](./assigning-roles-to-user-segments/images/03.png)

The selected user segment(s) appear(s) in the list of assignees for the role.

![The user segment appears under the list of assignees for the role.](./assigning-roles-to-user-segments/images/04.png)

## Assigning a Site Role to a User Segment

> Available: Liferay DXP 7.2 SP3+

[Site roles](./understanding-roles-and-permissions.md) can be assigned to segments, with two exceptions: Site Administrator and Site Owner.

1. Open the Product Menu (![Product Menu](../../images/icon-product-menu.png)) and navigate to *People* &rarr; *Segments*.

1. Open the segment's actions (![Actions](../../images/icon-actions.png)) and click *Assign Site Roles*.

1. Assign site roles to the segment, then click *Add*.

   ![Site roles can be assigned to segments.](./assigning-roles-to-user-segments/images/05.png)

## Related Information

* [Creating User Segments](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)
