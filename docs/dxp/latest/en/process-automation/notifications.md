---
toc:
  - ./notifications/configuring-personal-notifications.md
  - ./notifications/creating-notification-templates.md
  - ./notifications/using-the-notification-queue.md
taxonomy-category-names:
- Platform
- Notifications and Notification Templates
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 40b42b3f-1d9b-4dd8-882d-a490ae43d603
---
# Notifications

Liferay provides integrated notification tools, so you can ensure users are alerted to platform events. For Liferay DXP, this includes email and website notifications for the following default applications:

| Application          | Email    | Website  |
| :------------------- | :------- | :------- |
| Blogs                | &#10004; | &#10004; |
| Comments             | &#10004; | &#10004; |
| Contact Center       |          | &#10004; |
| Documents and Media  | &#10004; | &#10004; |
| Import/Export Center |          | &#10004; |
| Invite Members       |          | &#10004; |
| Mentions             | &#10004; | &#10004; |
| Message Boards       | &#10004; | &#10004; |
| My Workflow Tasks    | &#10004; | &#10004; |
| Publications         |          | &#10004; |
| Segments Experiment  | &#10004; | &#10004; |
| Sharing              | &#10004; | &#10004; |
| Web Content          | &#10004; | &#10004; |
| Wiki                 | &#10004; | &#10004; |

To use email notifications, you must [configure a mail server](../installation-and-upgrades/setting-up-liferay/configuring-mail.md) for your instance. Once configured, you can access additional [email notification settings](../system-administration/configuring-liferay/virtual-instances/email-settings.md) at the instance level. Beginning with Liferay 7.4 U33+/GA33+, you can also create [notification templates](./notifications/creating-notification-templates.md) to design and dynamically populate email notifications for Objects. See [Notification Actions](../liferay-development/objects/creating-and-managing-objects/actions/defining-object-actions.md#notification-actions) for more information.

In the Commerce context, notifications are supported for Channel events. See [Sending Emails](https://learn.liferay.com/w/commerce/store-management/sending-emails) to learn more.


