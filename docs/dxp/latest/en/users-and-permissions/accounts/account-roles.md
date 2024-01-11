---
uuid: e951d3e7-bb17-46e0-8244-1131bff58dbc
taxonomy-category-names:
- Security
- User, Organization, and Account Management
- Liferay Self Hosted
- Liferay SaaS
- Liferay PaaS
---
# Account Roles

{bdg-secondary}`Available 7.4+`

You can create different Account Roles and define specific permissions for each one. Then assign these Roles to different [Account Users](./account-users.md) to grant appropriate access to their [Accounts](../accounts.md). 

Note that account roles are assigned to a user for each specific account. This offers great flexibility in managing users. For example, a user might have a "Buyer" role for account "A" but not have that role for account "B". To learn more more about permissions and how roles inherit permissions, see [Defining Role Permissions](../roles-and-permissions/defining-role-permissions.md).

## View Account Roles

There are two types of Account Roles: Shared and Owned. Shared type Account Roles are available across all Accounts in a DXP Instance. Owned type Account Roles are created and managed within a specific Account.

### View Shared Account Roles

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Roles*.

1. Click the *Account Roles* tab and view the list of available Roles.

### View Owned Account Roles

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Accounts*.

1. Click on the specific Account you wish to view. Click the *Roles* tab and view the list of available Roles.

## Creating a New Account Role

Make a choice to create an Shared Account Role or an Owned Account Role.

### Creating and Assigning a Shared Account Role

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Roles*.

1. Click the *Account Roles* tab. Click the _Add_ icon (![Add icon](../../images/icon-add.png)).

1. Give the new Role a title and description. Click *Save* to create the Role. 

   ![Give the role a new title and description.](./account-roles/images/01.png)

1. Click the *Define Permissions* tab at the top of the page. Select what permissions the Role has to act upon the resources owned by the Account, including the Account itself. For example, selecting Update permissions enables the Role to change the Account's description. Click *Save* to save the permissions.

1. Click the *Define Group Scope Permissions* tab. Select what permissions the Role has to act on resources owned by other groups (i.e. Sites, channels, asset libraries, etc.). Note that the permissions apply for the Account that is [selected as the current account](./account-management-widget.md#using-the-account-management-widget). 

1. To assign an Account User to this Role, navigate to *Control Panel* &rarr; *Accounts*. Select a specific account. 

1. Click the *Roles* tab and click the _Options_ icon (![Options icon](../../images/icon-actions.png)) of the Role you just created. Click *Assign Users*.

   ![Click the options icon of the account and click Assign Users.](./account-roles/images/02.png)

1. Click the _Add_ icon (![Add icon](../../images/icon-add.png)) and assign a User to this Role.

### Creating and Assigning an Owned Account Role

1. Open the Global Menu (![Global Menu](../../images/icon-applications-menu.png)). Navigate to *Control Panel* &rarr; *Accounts*.

1. Select the specific account in which to create the new Role. Click the *Roles* tab and click the _Add_ icon (![Add icon](../../images/icon-add.png)).

1. Give the new Role a title and description. Click *Save* to create the Role.

1. Click the *Define Permissions* tab at the top of the page. Select what permissions the Role has to act upon the resources owned by the Account, including the Account itself. For example, selecting the Update permissions enables the Role to change the Account's description. Click *Save* to save the permissions.

   ![Select the permissions to assign to this role.](./account-roles/images/03.png)

1. Click the *Define Group Scope Permissions* tab. Select what permissions the Role has to act on resources owned by other groups (i.e. Sites, channels, asset libraries, etc.). Note that the permissions apply for the Account that is [selected as the current account](./account-management-widget.md#using-the-account-management-widget).

1. To assign an Account User, click the *Assignees* tab. Click the _Add_ icon (![Add icon](../../images/icon-add.png)) and assign a User to this Role.
