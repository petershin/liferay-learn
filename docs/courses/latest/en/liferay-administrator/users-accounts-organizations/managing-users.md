# Managing Users

Use Liferay to create and manage users for Delectable Bonsai. See [Create and Manage Users](https://learn.liferay.com/dxp/latest/en/users-and-permissions/users/adding-and-managing-users.html) to learn more.

## Instance Email Configuration

Change the default email configuration before creating users.

1. Click on the _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Instance Settings_. Under _Platform_, click _Email_. Click _Email Sender_.

1. Change the name to _IT Department_ and address to _it@delectablebonsai.com_. Click _Save_.

See [Configuring Mail](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/setting-up-liferay/configuring-mail.html) to use an external mail server.

## Creating Users

Up to this point, Kyle has been using the default Liferay admin account. Create some user accounts for Kyle and some of his coworkers. 

1. Click on the _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Users and Organizations_. Click _Add User_ (![Add icon](../../images/icon-add.png)).

1. Input the following:

   * Screen Name: `kyle`
   * Email Address: `kyle@delectablebonsai.com`
   * First Name: `Kyle`
   * Last Name: `Klein`
   * Job Title: `IT Staff`

   Click _Save_. Kyle's account has been created.

1. Create one more user account for Kyle's manager:

   * Screen Name: `marcus`
   * Email Address: `marcus@delectablebonsai.com`
   * First Name: `Marcus`
   * Last Name: `Morgan`
   * Job Title: `IT Manager`

   The list of users should look like this:

   ![The list of users includes Kyle, Marcus, and the default Test account.](./managing-users/images/01.png)

## Assigning Existing Users to Organizations

The users created above do not belong to any organization. Edit their user accounts to assign them to an organization.

1. From the list of user accounts, click on _Kyle Klein_. Click _Organizations_ in the left navigation.

1. Click _Select_ and a new window pops up. Click _Choose_ for the IT organization. Click _Save_.

1. Follow the same steps to add Marcus Morgan to the IT organization.

## Adding New Users to Organizations

New users can also be added within organizations.

1. Navigate to the list of organizations. Click _Delectable Bonsai_. Click the _Options_ icon (![Options icon](../../images/icon-actions.png)) for the Sales & Marketing child organization and click _Add User_.

1. Add the following user:

   * Screen Name: `lily`
   * Email Address: `lily@delectablebonsai.com`
   * First Name: `Lily`
   * Last Name: `Lewis`
   * Job Title: `Account Rep`

   Click _Save_ at the bottom of the page.

   The next step is to assigns different roles and permissions to users. See [Setting Roles and Permissions](./setting-roles-and-permissions.md).

   ## Relevant Documentation
   - [Understanding Users](https://learn.liferay.com/dxp/latest/en/users-and-permissions/users/understanding-users.html)
   - [Adding and Managing Users](https://learn.liferay.com/dxp/latest/en/users-and-permissions/users/adding-and-managing-users.html)
   - [Adding Users to Organizations](https://learn.liferay.com/dxp/latest/en/users-and-permissions/organizations/adding-users-to-organizations.html)