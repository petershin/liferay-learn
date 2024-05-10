---
uuid: f548210b-6113-4205-ac28-23451ed61e43
---
# Managing and Organizing Clarity Users

The primary concern of user management is controlling access to content and platform features. When done right, users are granted access only to the resources and applications necessary for their responsibilities.So far, Clarity's team members have been created, but their roles and permissions need to be set.

At Clarity, each user has different responsibilities in developing the enterprise website. Here, we'll take a closer look at the different types of users involved, their roles, the groups they belong to, and the responsibilities they have for the site. But first, let's review how roles and permissions work.

## Understanding Roles and Permissions

In Liferay, permissions are assigned to roles instead of individuals. Each permission grants the ability to perform a specific action and falls into one of two categories: application permissions or resource permissions. Application permissions pertain to different parts of Liferay's UI (e.g. visibility to certain sections of the applications menu or control panel). <!--Alt: "Application permissions grant access to an application itself and do not include resource-related permissions."--> On the other hand, resource permissions pertain to the data itself (e.g. read or write privileges for Liferay blogs). <!--Alt: "Resource permissions grant access to view, create, and act on application data. Some of these permissions relate to creating data entries, while others are for performing actions on existing data entries."-->

Roles are collections of permissions that you can assign to multiple users. Each role has a specific scope that's determined by its type: regular, site, organization, asset library, or account. This is because sometimes you don’t want certain permissions to carry across multiple contexts in a Liferay instance.

| Role type          | Scope                                                                              |
|:-------------------|:-----------------------------------------------------------------------------------|
| Regular Role       | This is the most extensive permission scope, and it spans across the whole portal. |
| Site Role          | Permissions are scoped to a particular site.                                       |
| Organization Role  | Permissions are scoped to particular organization's users.                         |
| Asset Library Role | Permissions are scoped to an asset library for sharing resources                   |
| Account Role       | Permissions are given to users who are a part of an account.                       |

Liferay provides [out-of-the-box roles](https://learn.liferay.com/en/w/dxp/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions), but you can create custom roles with your choice of permissions to fit your business needs. Then, multiple roles can be assigned to multiple users.

To learn more about user management in general, see official [documentation](https://learn.liferay.com/w/dxp/users-and-permissions).

## Organizations

Clarity relies on user groups and roles for a significant portion of their user and permission management. However, Liferay offers Organizations as an additional user management tool. Organizations can be used to model the hierarchy of a company. It is also an important part of managing groups of accounts.

As their business grows and site requirements evolve, Clarity can consider leveraging Liferay organizations in the future.

See official documentation to learn more about [organizations](https://learn.liferay.com/w/dxp/users-and-permissions/organizations/understanding-organizations).

## Accounts

Liferay also offer additional tools around accounts. These can be used to model business relationships to help manage external parties. For example, Liferay accounts can model a business to consumer (B2C) context in which a customer is a single user. Accounts can also model a business to business (B2B) context where a customer represents an external company with multiple users. See official documentation to learn more about [accounts](https://learn.liferay.com/w/dxp/users-and-permissions/accounts).

## Structuring Organizations with User Groups

!!! important **Key Decision**
    Deciding how to group and assign permissions to users is a key decision point as you build out your enterprise website. In this situation, it's recommended to use Liferay user groups to model your organization’s structure on the new site.

To increase efficiency, roles can also be assigned to entire user groups. The purpose behind this is to promote reuse and simplify the user management experience.

Let’s take a look at how we could create user groups, roles and permissions for Christian Carter, the marketing specialist, to be able to access and edit relevant content for marketing.

## Exercise One: Assigning Permissions to Roles

Throughout this exercise, let's impersonate Christian Carter to see what the Liferay instance looks like from his point of view as we assign him permissions.

To begin,

1. Open the _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)), go to the _Control Panel_ tab, and click _Users and Organizations_.

1. Click the _Actions_ button (![Actions Button](../../images/icon-actions.png)) for Christian Carter and select _Impersonate User_.

   Notice how he does not have access to any applications or resources he needs to access as a marketing specialist (e.g. site menu, asset library, etc.).

   Next, let's assign him some permissions.

1. Open the _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)), go to the _Control Panel_ tab, and click _Roles_.

1. Click the _Marketing Specialist_ role and go to the _Define Permissions_ tab.

   ![Assign permissions to the marketing specialist role.](./managing-and-organizing-clarity-users/images/01.png)

1. In the left menu, go to _Applications Menu_ &rarr; _Content_ &rarr; _Asset Libraries_.

1. Select these permissions and click _Save_:

   | Section                        | Permission                                      |
   |:-------------------------------|:------------------------------------------------|
   | Application                    | Access in Control Panel                         |
   | Application                    | View                                            |
   | Resource > Asset Library Entry | View Site and Asset Library Administration Menu |

1. In the left menu, go to _Site and Asset Library Administration_ &rarr; _Content & Data_ &rarr; _Documents and Media_.

1. Select these permissions and click _Save_:

   | Section                    | Permission                                      |
   |:---------------------------|:------------------------------------------------|
   | General                    | Access in Site and Asset Library Administration |
   | General                    | View                                            |
   | Resource > Documents       | View                                            |
   | Resource > Document Folder | View                                            |

1. In the left menu, go to _Site and Asset Library Administration_ &rarr; _Site Builder_ &rarr; _Pages_.

1. Select this permission and click _Save_

   | Section         | Permission |
   |:----------------|:-----------|
   | Resource > Page | Update     |

Now the marketing specialist role has permissions related to asset libraries and site pages. This is because marketing specialists need access to asset libraries and pages.

## Exercise Two: Assigning a User Group to the Role

After setting the permissions for the role, let's assign a user group to the role. Note that Liferay roles can also be assigned to individual users, but assigning it to user groups promotes reusability and ease of future maintenance.

1. While editing the Marketing Specialist role, go to the _Assignees_ tab.

1. Click the _User Groups_ tab.

   ![Assign the role to the Marketing user group.](./managing-and-organizing-clarity-users/images/02.png)

1. Click _New_, select the Marketing user group, and click _Add_.

   Now the role is assigned to the user group. Next, let's add Christian Carter to the marketing user group.

1. Open the _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)), go to the _Control Panel_ tab, and click _User Groups_.

1. Click the _Actions_ button (![Actions Button](../../images/icon-actions.png)) for the Marketing user group and select _Assign Members_.

1. Click _New_, select _Christian Carter_, and click _Add_.

   Now that Christian Carter is part of the Marketing user group, he has the Marketing Specialist role's permissions.

1. Return to the _Users and Organizations_ and impersonate Christian Carter

   Notice he now has access to the Site Menu (![Site Menu](../../images/icon-product-menu.png)) to add and edit site pages. He also has access to the Global Menu (![Global Menu](../../images/icon-applications-menu.png)) and the Asset Libraries in the Applications tab.

Well done! Now everyone in the marketing user group has the correct permissions on the platform. Any new users who are added to the user group in the future will also inherit the same set of permissions.

## Conclusion

Congratulations! You've defined role permissions and assigned that role to all users in the Marketing user group. Next, you'll learn more about permissions and content.

Next Up: [Securing Clarity Content](./securing-clarity-content.md)
