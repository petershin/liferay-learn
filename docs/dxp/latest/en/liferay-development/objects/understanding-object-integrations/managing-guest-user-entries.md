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

When you create an object and its application UI, unauthenticated guest users cannot add object entries, even if you add an object-backed application to a page and grant the guest user view permissions in the application.

![Guests cannot add entries even if they can view the application.](./managing-guest-user-entries/images/01.png)

You must explicitly grant [Resource Permissions](./permissions-framework-integration.md#resource-permissions) on your object if you want guest users to create object entries.

## Allowing Guest Submissions

To allow guest users permission to submit object entries, 

1. 1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png) &rarr; *Control Panel* &rarr; *Roles*.

1. In the Regular Roles tab, click *Guest* &rarr; *Define Permissions*.

1. Search for your object and click it to begin defining the guest user's permissions.

1. Under Resource Permissions, you must at least grant the Add Object Entry permissions to enable guests to add entries.

![Enable guests to add object entries.](./managing-guest-user-entries/images/04.png)

## Limiting Object Entry Submissions

To deter distributed denial-of-service (DDoS) attacks and spam submissions, you can limit how many guest object entry submissions are permitted. Go to *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Instance Settings* &rarr; *Object*.

![Set the allowed number of guest entry submissions in a period of time.](./managing-guest-user-entries/images/03.png)

**Maximum Number of Guest Object Entries per Object Definition:** Set the maximum number of object entries guest users can create for each object definition. After reaching this limit, guest-created object entries are not accepted. The default value is `100`.

![After the maximum entries allowed in the configured time period are added, more submissions are not allowed until the set period of time elapses.](./managing-guest-user-entries/images/02.png)

The below settings appear in the Instance Settings UI in 2024.Q1/GA112, but they are behind a [dev feature flag](../../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags) and should not be used in production environments. They set a time period for the maximum number of allowed guest submissions, so that after the configured duration guest submission are allowed again. With this you can ensure that you limit the _rate_ of guest entry submissions.

**Duration:** Set the time period for which the configured maximum number of guest entries cannot be exceeded.

**Time Scale:** Set whether the duration is measured in weeks or days.


To try using these settings in your testing environment, enable the LPS-192957 feature flag using a [portal property](../../../installation-and-upgrades/reference/portal-properties.md) or Docker environment variable:

Using a `portal-ext.properties` file:

```properties
feature.flag.LPS-192957=true
```

Using a Docker environment variable:

```shell
docker run --env LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEL__UPPERCASEP__UPPERCASES__MINUS__NUMBER1__NUMBER9__NUMBER2__NUMBER9__NUMBER5__NUMBER7_=true -it -m 9g -p 8080:8080 [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
```

## Limiting the Attachment Field File Size

You can also limit the file size that guest users can upload in object attachment fields:

**Maximum File Size for Guest Users:** Set the maximum file size (in megabytes) that a guest user can upload through attachment fields in an object entry. The default value is `25`.

## Related Topics

* [Permissions Framework Integration](./permissions-framework-integration.md)
* [Creating and Managing Objects](../creating-and-managing-objects.md)
* [Roles and Permissions](../../../users-and-permissions/roles-and-permissions.md)
