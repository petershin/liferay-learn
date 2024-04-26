---
uuid: ef4c404d-f1a4-4864-9827-88ba7845c127
taxonomy-category-names:
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
- Security
- User, Organization, and Account Management
---

# Managing Guest User Entries

When you create an object and its application UI, unauthenticated users cannot add object entries, even if you add an object-backed application to a page and grant the guest user view permission in the application.

![Guests cannot add entries even if they can view the application.](./managing-guest-user-entries/images/01.png)

You must explicitly grant [Resource Permissions](./permissions-framework-integration.md#resource-permissions) on your object if you want guest users to create object entries.

## Allowing Guest Submissions

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Roles*.

1. In the Regular Roles tab, click *Guest* &rarr; *Define Permissions*.

1. Search for your object and select it to begin defining the guest user's permissions.

1. Under Resource Permissions, grant at least the *Add Object Entry* permission.

1. Click *Save*.

![Enable guests to add object entries.](./managing-guest-user-entries/images/04.png)

## Limiting Object Entry Submissions

To deter distributed denial-of-service (DDoS) attacks and spam submissions, you can limit guest object entry submissions. Go to *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Instance Settings* &rarr; *Object*.

![Set the allowed number of guest entry submissions in a period of time.](./managing-guest-user-entries/images/03.png)

**Maximum Number of Guest Object Entries per Object Definition:** Set the maximum number of object entries guest users can create for each object definition. After reaching this limit, guest-created object entries are not accepted. The default value is `100`.

![After the maximum entries allowed in the configured time period are added, more submissions are not allowed until the set period of time elapses.](./managing-guest-user-entries/images/02.png)

In DXP 2024.Q2+/GA120+, you can also set a time period for the maximum number of allowed guest submissions, so that after the configured duration guest submissions are allowed again. With this you can ensure that you limit the _rate_ of guest entry submissions.

**Duration:** Set the time period for which the configured maximum number of guest entries cannot be exceeded.

**Time Scale:** Choose whether the duration is measured in days or weeks.

## Limiting the Attachment Field File Size

You can also limit the file size that guest users can upload in object attachment fields:

**Maximum File Size for Guest Users:** Set the maximum file size (in megabytes) that a guest user can upload through attachment fields in an object entry. The default value is `25`.

## Related Topics

* [Permissions Framework Integration](./permissions-framework-integration.md)
* [Creating and Managing Objects](../creating-and-managing-objects.md)
* [Roles and Permissions](../../../users-and-permissions/roles-and-permissions.md)
