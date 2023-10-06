---
uuid: 9c853de5-3865-4ea6-9f69-7b6cac71a275
---
# Working with Accounts

Accounts in Liferay can represent individual customers in a B2C (i.e. business to consumer) context. Or they can represent a B2B (i.e. business to business) context with multiple users. See [Accounts](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts) to learn more. 

Opportune Optics operate eyewear stores across the country. Each store purchases eyewear from Clarity Vision Solutions. The example below shows how to set up and account for one of the markets and assign an account user.

## Adding Accounts

Create a business type account:

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Accounts_. Click _Add Account_ (![Add icon](../../images/icon-add.png)).

1. In the new window, enter `Opportune Optics NYC` for account name. Click _Save_.

1. Click the _Addresses_ tab. Click _Add_ (![Add icon](../../images/icon-add.png)). Enter the following information:

   * Name: `Opportune Optics NYC`
   * Country: `United States`
   * Street 1: `123 Anywhere St`
   * City: `New York`
   * Region: `New York`
   * Postal Code: `10027`

1. Click back to the _Details_ tab. 

   - Scroll down to the default account address section. 
   - Click _Set Default Address_ under the billing heading. 
   - Select the address you just created. 
   - Click _Save_. 
   - In the same way, set the default address for the shipping address.

## Adding Account Users

Create a new user for the account you just made. Note, you can create new users for accounts or associate exiting users with  an account.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Account Users_. 

   - Click _Add User_ (![Add icon](../../images/icon-add.png)). 
   - Click _Choose_ next to Opportune Optics NYC.

1. Create the following store manager:

   * Screen Name: `Noah`
   * Email Address: `noah@opportuneoptics.com`
   * First Name: `Noah`
   * Last Name: `Norman`
   * Job Title: `Store Manager`

   Click _Save_. 

## Assigning Account Roles

Each business account can have multiple users and multiple roles. For example, the account buyer may handle creating orders, but the order manager may handle approving the orders. 

Assign Noah Norman the order manager role. In this way, Noah's employees can add items to the account's shopping cart, while Noah gives the final approval.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Accounts_. 

   - Click _Opportune Optics NYC_. 
   - Click the _Roles_ tab. 
   - Click _Order Manager_.

2. In the next window, click _Assign User_ (![Add icon](../../images/icon-add.png)). Select Noah Norman and click _Assign_.

   As Noah's employees add orders to the account, Noah is able to approve and manage orders. See [Commerce Roles Reference](https://learn.liferay.com/en/w/commerce/users-and-accounts/roles-and-permissions/commerce-roles-reference) to learn more about these roles.

## Managing Accounts

Use account groups to help organize and manage multiple accounts. For example, Clarity Vision Solutions can choose to apply lower pricing for any market that is part of the Opportune Optics account group.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Account Groups_. Click _Add Account Group_ (![Add icon](../../images/icon-add.png)). 

2. Give the name `Opportune Optics` for the account group name. Click _Save_.

3. Click the _Accounts_ tab. 

   - Click _Assign Account_ (![Add icon](../../images/icon-add.png)). 
   - In the new window, select _Opportune Optics NYC_ and click _Assign_. 

   In this way, different Opportune Optics in other locations can be added to the group.

In a larger B2B context with multiple accounts under the same entity, it may make sense to create a dedicated organization. Then you can assign an account manager role over the whole organization. For example, with many locations, all Opportune Optics accounts can be placed under an organization. Then someone from Clarity Vision Solutions can be assigned an account manager role to oversee all the accounts.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Users and Organizations_. 

   * Click the _Organizations_ tab. 
   * Click _Add_ (![Add icon](../../images/icon-add.png)). 
   * Enter `Opportune Optics` in the _Name_ field. 
   * Click _Save_.

1. Navigate to _Control Panel_ &rarr; _Accounts_. Click _Opportune Optics NYC_. 

   * Click the _Organizations_ tab. 
   * Click _Assign Organizations_ (![Add icon](../../images/icon-add.png)). 

1. In the new window, select _Opportune Optics_ and click _Assign_. The Opportune Optics NYC account is now part of the Opportune Optics organization.

   ![Opportune Optics NYC is now part of the Opportune Optics organization.](./working-with-accounts/images/01.png)

1. Now make Lily Lewis an account manager. Navigate to _Control Panel_ &rarr; _Users and Organizations_. 

   * Click on _Lily Lewis_. 
   * Click _Organizations_ in the left navigation. 
   * Click _Select_. 
   * Click _Choose_ next to Opportune Optics. 
   * Click _Save_. 

   Lily Lewis is now also part of the Opportune Optics organization.

5. Click _Roles_ in the left navigation. 

   * Click _Select_ next to organization roles. 
   * Click _Choose_ next to Account Manager. 
   * Click _Save_. 

   ![Lily Lewis is now an account manager for Opportune Optics.](./working-with-accounts/images/02.png)

   Lily Lewis is now an account manager for all accounts in the Opportune Optics organization. The account manager can take actions, such as placing orders on behalf of account users. 

Congratulations! You have completed this module on users, accounts, organizations, and permissions. 

## Relevant Concepts

- [Accounts](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts)
- [Account Users](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts/account-users)
- [Account Groups](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts/account-groups)
- [Account Roles](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts/account-roles)
- [Commerce Roles Reference](https://learn.liferay.com/en/w/commerce/users-and-accounts/roles-and-permissions/commerce-roles-reference)
