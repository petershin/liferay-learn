---
uuid: 9fdd050d-28b6-46a5-af49-e864e4a35553
---
# Working with Accounts

Accounts in Liferay can represent individual customers in a business to consumer (B2C) context. Or they can represent a business to business (B2B) context. As a B2B manufacturer, Clarity sells to various businesses and retailers. See how Liferay accounts and its various features can help Clarity work efficiently with their various B2B customers.

## Creating Accounts

To create an account or manage existing accounts, navigate to _Control Panel_ &rarr; _Accounts_. The page will show a list of all existing accounts. Click the add icon to create a new account.

![Click the add icon to create a new account.](./working-with-accounts/images/01.png)

Select the type of account you wish to create. For example, select `business` type for a B2B type account. Select `Person` for a B2C type account. `guest` type accounts are also available if you need an unregistered user to interact with your site for commerce. For Clarity, most of the accounts they need will be `business` type. 

## Adding Account Users and Assigning Account Roles

Unlike the `Person` type account and the `Guest` type account, the `Business` type account can be associated with multiple users. For example, Clarity has many B2B customers that represent large retailers. Each retailer might have multiple people who interact with Clarity such as an account administrator, an account buyer, or an account order manager. These are all different roles, with different permissions, that can be assigned to users under an account. To add users to an account,

1. Navigate to _Control Panel_ &rarr; _Accounts_ and select the account you wish to work with.

1. Click on the _Users_ tab and click the add button. If the user already has a Liferay account, click _Assign Users_ and select from the list of existing users. If the user does not have a Liferay account, click _Invite Users_ to send an email invite to join.

To assign account roles, 

1. Select the account you wish to work with and click on the _Roles_ tab.

1. Click the options icon of a role and click _Assign Users_. On the next page, click the add button and select a user.

   ![Click the options icon of a role and assign users.](./working-with-accounts/images/02.png)

   You can also create custom account roles for your business needs. To learn more, see our documentation about [account roles](https://learn.liferay.com/w/dxp/users-and-permissions/accounts/account-roles).

## Creating Account Groups

As you create different accounts, use account groups to keep accounts organized. For example, Clarity works with a franchise that has many eyewear shops around the country. Sometimes Clarity promotes certain products to these franchises and having account groups makes it easier to promote to multiple accounts. To create an account group,

1. Navigate to _Control Panel_ &rarr; _Account Groups_ and click the add button.

1. In the next page, input an account group name and click Save.

1. Click on the _Accounts_ tab and click the add button. Add all the accounts you wish to add to the account group.

   To learn more, see our documentation about [account groups](https://learn.liferay.com/w/dxp/users-and-permissions/accounts/account-groups).

Congratulations! You've completed Module 5 - Users and Permissions.

Back to [Building Enterprise Websites with Liferay](../../building-enterprise-websites-with-liferay.md)
