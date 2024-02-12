---
uuid: 281e89fe-1a37-4223-a37e-6d1c7f5e478e
---

# Understanding Users, Organizations and User Groups

Clarity values every one that access their website, and wants to ensure that the right users can access their data, tools, and relevant content. Every person who access Clarity's website is considered a user. Even unauthenticated users are considered users, they are called guest users.

Users can be organized into organizations and user groups. Structuring your users into organizations and user groups empowers you to delegate administrative responsibility and organize them in a way that reflects your organization.

Users break down into three general categories:

| User          | Default Access                                                                                                           |
|:--------------|:-------------------------------------------------------------------------------------------------------------------------|
| Administrator | Liferay admin with full system access.                                                                                   |
| User          | Authenticated users are able to view restricted pages and create content, under the permissions assigned to them.        |
| Guest         | Unauthenticated user with view access to publicly accessible pages as well as limited ability to create and add content. |

<!-- ## Importing Users through Client Extension

We'll have here the steps to download, unzip and deploy the client extension. -->

## Adding and Managing Users

Liferay allows administrators to create users within Liferay, or import them. Since Clarity chose to use Okta, a single sign-on solution, once the users log in, their accounts will be created automatically. Let's create an account for Clarity's Web Developer.

1. Navigate to *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Users and Organizations*. Click *New* to add user.

1. Create a user account for Walter Douglas, the Web Developer:

   * Screen Name: `walter`
   * Email Address: `walter@clarityvisionsolutions.com`
   * First Name: `Walter`
   * Last Name: `Douglas`
   * Job Title: `Web Developer`

<!-- We could add a screenshot of the users tab, showing all users on the table, the ones that were deployed and the one created manually, Walter Douglas-->

As an administrator, you can add additional information after creating the user, as well as editing it. See [Adding and Managing Users](https://learn.liferay.com/en/w/dxp/users-and-permissions/users/adding-and-managing-users) to learn more.

## Organizations

Enhance your user management by using organizations, and use Liferay to model Clarity Vision Solutions' organizational hierarchy. You can also apply permissions to your users through organization roles, and it will affect only applications and content within that organization hierarchy.

<!-- We could add a screenshot of the organization tab (Global Menu > Control Panel > Users and Organizations > Organizations tab), showing all three organizations that the user deployed using client extensions -->

Now, since we created Walter's user manually, let's edit his user account to assign him to the IT organization.

1. Navigate to *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Users and Organizations*.

1. From the list of user accounts, click on *Walter Douglas*. Click *Organizations* in the left navigation.

1. Click *Select* and a new window pops up. Click on the checkbox for the IT organization. Click *Add*.

As an organization administrator, you can manage all users in your organization and in any child organization. See [Organizations](https://learn.liferay.com/web/guest/w/dxp/users-and-permissions/organizations) to learn more.

## User Groups

A user group is a list of users created for a specific purpose, and they can be created across the hierarchical boundaries of organizations. There are some common use cases for user groups, three of them are:

- **Manage Site membership**: Grant site membership to all users in a user group.
- **Manage Users’ personal pages**: Provide predefined pages to those in the user group.
- **Collect permissions**: Assign roles and permissions to a group of users that don’t share an organization.

Navigate to *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Users* &rarr; *Users Groups*, and you'll see that Clarity created the *Content* user group.

As an user group administrator, this will help you assign roles and permissions to the content team, considering they are under different organizations. See [User Groups](https://learn.liferay.com/web/guest/w/dxp/users-and-permissions/user-groups) to learn more.
