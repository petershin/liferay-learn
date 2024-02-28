---
uuid: 9fdd050d-28b6-46a5-af49-e864e4a35553
---
# Modeling B2B Relationships with Liferay Accounts

We've set up Clarity's internal users with the right roles and permissions. Now we turn our attention to Clarity's business to business (B2B) customers. The Liferay Accounts feature can be used to represent external entities. For example, Liferay accounts can model a business to consumer (B2C) context in which a user is a customer. Accounts can also model a B2B context where an external company is a customer that is used by multiple users.

Clarity wants to provide login access to their different B2B partners. They can use Liferay account to do this. In our demonstration, Clarity has a B2B customer called Opportune Optics that has stores across the country. Clarity also has an account manager that is associated with the Opportune Optics account group. See a summary in the table below:

| Name | Account | Account Group | Role | Organization |
|:--- |:--- |:--- |:--- |:--- |
| Noah Norman | Opportune Optics NY | Opportune Optics | Order Manager | Opportune Optics |
| Sarah Stanley | Opportune Optics NY | Opportune Optics | Buyer |
| Preston Palmer | Opportune Optics SF | Opportune Optics | Order Manager |
| Robert Reed | Opportune Optics SF | Opportune Optics | Buyer |
| Lily Lewis | N/A | Opportune Optics | Account Manager |

For our next exercise we will create accounts for Opportune Optics and associate users with the accounts.

!!! note
   These users are already created together with the Clarity sample site. If you do not have the Clarity sample site, create these users from within the Liferay UI.

## Exercise 2

### Creating Opportune Optics NY Account

1. Navigate to _Control Panel_ &rarr; _Accounts_. Click the add icon to add a new account.

1. Input `Opportune Optics NY` as the account name. Select `Business` as the account type. Click _Save_.

1. Click the _Users_ tab and click the add icon to add new users. Click _Assign Users_ and select Noah Norman and Sarah Stanley from the list of users. Click _Assign.

   ![Select the users to assign to the account.](./modeling-b2b-relationships-with-liferay-accounts/images/01.png)

1. Noah and Sarah should now appear under the list of users associated with the account. Click the options icon next to Noah Norman and click _Assign Roles_. Select _Order Manager_ and click _Done_. In the same way, assign the _Buyer_ role to Sarah.

   ![Select the role to assign to an account user.](./modeling-b2b-relationships-with-liferay-accounts/images/02.png)

### Creating Opportune Optics SF Account

1. Navigate back to the accounts page. Click the add icon and create a new account for `Opportune Optics SF`.

1. Assign Preston Palmer and Robert Reed to the account. Then, assign order manager role to Preston and the buyer role to Robert. 

### Creating an Opportune Optics Account Group

Use account groups to keep accounts organized. For example, since Opportune Optics has different stores, group them together in one account group. This also gives the possibility of customizing price lists, offering discounts, and changing product visibility for the accounts in the group.

1. Navigate to _Control Panel_ &rarr; _Account Groups_. Click the add icon to create a new account group.

1. Input `Opportune Optics` as the account group name. Click _Save_.

1. Click on the _Accounts_ tab. Click the add icon to assign accounts.

1. In the pop up window, select `Opportune Optics NY` and `Opportune Optics SF` and click _Assign_.

   ![Select the accounts to assign to the account group.](./modeling-b2b-relationships-with-liferay-accounts/images/03.png)

### Associating an Organization

As Opportune Optics represents a large number of accounts, it makes sense for Clarity to assign a dedicated B2B account manager to all the accounts. The account manager role has permissions such ass adding itmes to an account's shopping cart or submitting an order on behalf of an account. This role is available through Liferay organizations. 

1. Navigate to _Control Panel_ &rarr; _Accounts_. Click on _Opportune Optics NY_ and click the _Organizations_ tab. Click the add icon.

1. Assign the account to the _Opportune Optics_ organization. Note, this organization was already created with the sample Clarity site. If you do not have this organization, create it from within the Liferay UI.

   ![Assign the account to the organization.](./modeling-b2b-relationships-with-liferay-accounts/images/04.png)

1. In the same way, assign _Opportune Optics SF_ to the _Opportune Optics_ organization.

1. Next, navigate to _Control Panel_ &rarr; _Users and Organizations_. Click on _Lily Lewis_ and click on _Organizations_. 

1. Click _Select_ and select the _Opportune Optics_ organization. Click _Add_.

1. Finally, click on _Roles_. Click _Select_ next to organization roles. Click _Choose_ next to account manager. Scroll to the bottom and click _Save_. Lily is now the account manager for the Opportune Optics organization.

To learn more about Liferay accounts and modeling B2B relationships, see our official documentation about [accounts](https://learn.liferay.com/w/dxp/users-and-permissions/accounts)

Congratulations! You've completed Module 5 - Users and Permissions.

Back to [Building Enterprise Websites with Liferay](../../building-enterprise-websites-with-liferay.md)
