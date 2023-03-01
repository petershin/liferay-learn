---
uuid: 4214e7cf-2624-4d50-98ca-d3a02791742d
---
# Managing Users

Use Liferay to create and manage users for Delectable Bonsai. See [Create and Manage Users](https://learn.liferay.com/dxp/latest/en/users-and-permissions/users/adding-and-managing-users.html) to learn more.

## Creating Users

Instead of continuing to use the default Liferay admin account, create a new Delectable Bonsai administrator account that will go on to create the other users, organizations, and accounts.

```{warning}
In a production environment, you should not use the default admin account. Instead, create admin accounts specific to your business.
```

1. Change the user authentication setting. Note, this is only for our learning and testing purposes.

   * Navigate to _Global Menu_ (![Global Menu](../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Instance Settings_.
   * Under Platform, click _User Authentication_.
   * Uncheck the box next to require strangers to verify their email address.
   * Click _Save_.

1. Navigate to _Global Menu_ (![Global Menu](../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Users and Organizations_. Click _Add User_ (![Add icon](../images/icon-add.png)).

1. Enter the following account information:

   * Screen Name: `kyle`
   * Email Address: `kyle@delectablebonsai.com`
   * First Name: `Kyle`
   * Last Name: `Klein`
   * Job Title: `IT Staff`

   Click _Save_. 

1. Give Kyle the administrator role.

   * In the left navigation, click _Roles_.
   * Next to Regular Roles, click _Select_.
   * In the new window, click _Choose_ next to Administrator.
   * Scroll down to the bottom and click _Save_.

1. Set Kyle's password.

   * In the left navigation, click _Password_.
   * Input `test` in the two fields.
   * Click _Save_.

1. Logout of the default admin account and Login as Kyle Klein.

   * Click the user profile image in the top right and click _Sign Out_.
   * Click _Sign In_ at the top right.
   * Sign in with `kyle@delectablebonsai.com` as the email address and `test` as the password.
   * In the next page to reset password, set the new password as `learn`.

Create an account for the IT manager.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Users and Organizations_. Click _Add User_ (![Add icon](../../images/icon-add.png)).

1. Create a user account for Kyle's manager:

   * Screen Name: `marcus`
   * Email Address: `marcus@delectablebonsai.com`
   * First Name: `Marcus`
   * Last Name: `Morgan`
   * Job Title: `IT Manager`

   The list of users should look like this:

   ![The list of users includes Kyle, Marcus, and the default Test account.](./managing-users/images/01.png)

## Assigning Existing Users to Organizations

The IT manager and IT staff are not part of any organization. Edit their user accounts to assign them to an organization.

1. From the list of user accounts, click on _Kyle Klein_. Click _Organizations_ in the left navigation.

1. Click _Select_ and a new window pops up. Click _Choose_ for the IT organization. Click _Save_.

1. Follow the same steps to add Marcus Morgan to the IT organization.

## Adding New Users to Organizations

New users can also be added within organizations.

1. Navigate to the list of organizations. 

   * Click _Delectable Bonsai_. 
   * Click _Options_ (![Options icon](../../images/icon-actions.png)) for the Sales & Marketing child organization. 
   * Click _Add User_.

1. Add the following user:

   * Screen Name: `lily`
   * Email Address: `lily@delectablebonsai.com`
   * First Name: `Lily`
   * Last Name: `Lewis`
   * Job Title: `Account Manager`

   Click _Save_ at the bottom of the page.

The next step is creating [organizations](./users-accounts-organizations/creating-organizations.md). 

## Relevant Concepts
- [Understanding Users](https://learn.liferay.com/dxp/latest/en/users-and-permissions/users/understanding-users.html)
- [Adding and Managing Users](https://learn.liferay.com/dxp/latest/en/users-and-permissions/users/adding-and-managing-users.html)
- [Adding Users to Organizations](https://learn.liferay.com/dxp/latest/en/users-and-permissions/organizations/adding-users-to-organizations.html)
