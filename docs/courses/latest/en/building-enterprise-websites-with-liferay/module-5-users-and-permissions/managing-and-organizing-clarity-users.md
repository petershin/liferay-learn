---
uuid: f548210b-6113-4205-ac28-23451ed61e43
---
# Managing and Organizing Clarity Users

Clarity team members were provisioned through Okta and have already logged into Liferay, but their roles and permissions have not been set yet. Liferay's out-of-the-box features are designed to help manage and grant permissions to these users based on their company role and responsibilities on the new site.

The primary concern in user management is managing user access to content and platform features. Common use cases includes giving privileges to access parts of the platform or specific resources, as well as restricting user access from unauthorized resources or actions. Basically, when user management is done right, everyone is granted access only to the resources and functionalities necessary for their roles.

At Clarity, each person has different responsibilities in developing the new enterprise website. Let's take a closer look at the different types of users involved, their roles, the groups they belong to, and the responsibilities they have for the site.

## Defining Roles and Permissions

Permissions are individual checks that determine whether a user can access a specific resource or perform a certain activity. For example, creating or editing a blog post. In Liferay, permissions are assigned to roles, as opposed to being assigned to individuals. Roles then serve as a collection of permissions. Using roles promotes reuse within the permissions structures and discourages directly assigning permissions to individual users.

In Liferay, permissions are generally divided into two categories: application permissions and resource permissions. Application permissions pertain to access to different parts of Liferay UI (e.g. visibility to certain certain sections of the applications menu or control panel). Resource permissions, on the other hand, pertain to access to the Liferay data itself (e.g. read or write privileges for Liferay blogs).

Liferay provides [out-of-the-box roles](https://learn.liferay.com/en/w/dxp/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions). Custom roles can also be created with your choice of permissions to fit your business. Then, these roles can then be assigned to Liferay users.

The different default roles also fall under different scoping. Sometimes, you don’t want a certain permission to carry across a whole Liferay instance or even across a whole site. For example, you may want to assign the role of site administrator to two different people; a different administrator per site. Use scoped roles to limit what users can and cannot access. 

| Role type | Scope |
|:--- |:--- |
| Regular Role | This is the most extensive permission scope, and it spans across the whole portal. |
| Site Role | Permissions that are scoped to a particular site. |
| Organization Role | Permissions that are scoped to particular users of an organization. |
| Asset Library Role | Permissions attached specifically to shared resources, particularly related to asset libraries and asset management. |
| Account Role | Permissions that are given to users who are a part of an account. |

## Structuring Your Organization through User Groups

!!! important **Key Decision**
    Deciding how to group and assign permissions to users is a key decision point as you build out your enterprise website. Using Liferay's user groups feature to model your organization’s structure and responsibilities on the new site is the recommended approach in this situation.

To increase efficiency, roles can also be assigned to entire user groups. The purpose behind this is to promote reuse and simplify the user management experience. 

Let’s take a look at how we could create user groups, roles and permissions for Jane Newton, the marketing specialist, to be able to access and edit relevant content for marketing. 

### Exercise 1 - Assigning the Permissions and Roles for Members of the Marketing User Group

1. Let's impersonate Jane Newton to see what the application looks like from her point of view. 
   1. Navigate to _Control Panel_ &rarr; _Users and Organizations_. 
   1. Click on the options icon next to Jane Newton and click _Impersonate User_. Notice how she does not have access to any of the resources she needs (e.g. site menu, asset library, etc.).

1. Assign the correct permissions for the marketing specialist role.

    ![Assign permissions to the marketing specialist role.](./managing-and-organizing-clarity-users/images/01.png)

    1. Navigate to _Control Panel_ &rarr; _Roles_. Click on the _Marketing Specialist_ role.
    1. Click on the _Define Permissions_ tab. 
    1. In the left menu, navigate to _Applications Menu_ &rarr; _Content_ &rarr; _Asset Libraries_. Under the applications permissions section, select _Access in Control Panel_ and _View_. Under the asset library entry section, select _View Site and Asset Library Administration Menu_. Click _Save_.
    1. Still in the left menu, navigate to _Site and Asset Library Administration_ &rarr; _Content & Data_ &rarr; _Documents and Media_. Under the general permissions, select _Access in Site and Asset Library Administration_ and _View_. Under documents, select _View_. Under document folder, select _View_. Click _Save_.
    1. Still in the left menu, navigate to _Site and Asset Library Administration_ &rarr; _Site Builder_ &rarr; _Pages_. Under the page section, select _Update_. Click _Save_.

    Now the marketing specialist role has permissions around asset libraries and site pages. This is because marketing specialists need access to asset libraries and pages.

1. Now that the permissions for the role have been set, let's assign a user group to the role. Note that Liferay roles can also be assigned to individual users, but assigning it to user groups promotes reusability and ease of future maintenance as discussed above. 

    ![Assign a user group to the role.](./managing-and-organizing-clarity-users/images/02.png)

    1. Still within the edit page for the marketing specialist role, click on the _Assignees_ tab. 
    1. Click the _User Groups_ tab. 
    1. Click the add button and assign the marketing user group to role. 

1. Let's make sure that Jane Newton is part of the marketing user group. 
    1. Navigate to _Control Panel_ &rarr; _User Groups_.
    1. Click the options icon next to the marketing user group and click _Assign Members_. 
    1. Click the add button and assign Jane Newton to the user group.

1. Marketing specialists also need access to Clarity's marketing asset library, so let's associate the correct asset library to this asset library role. 
    1. Navigate to _Applications_ &rarr; _Asset Libraries_ and click on the marketing asset library. 
    1. Scroll down and click _Memberships_. 
    1. Click the user groups tab and click the add icon. 
    1. Assign the marketing user group to the membership. 

        ![Assign a role to the user group.](./managing-and-organizing-clarity-users/images/03.png)

1. Let's impersonate Jane Newton again to verify what she can access. 
    1. Navigate to _Control Panel_ &rarr; _Users and Organizations_. 
    1. Click on the options icon next to Jane Newton and click _Impersonate User_. 
    1. Notice that she now has access to the product menu to add and edit site pages. She also has access to the asset library under the applications menu.

Well done! Now everyone in the marketing user group has the correct permissions on the platform. Any new users who are added to the user group in the future will also inherit the same set of permissions.

To learn more about user management in general, see our [documentation](https://learn.liferay.com/w/dxp/users-and-permissions).

## Organizations

Clarity relies on user groups and roles for a significant portion of their user and permission management. However, Liferay offers Organizations as an additional user management tool. Organizations can be used to model the hierarchy of a company. It is also an important part of managing groups of accounts.

As their business grows and site requirements evolve, Clarity can consider leveraging Liferay organizations in the future.

See our official documentation to learn more about [organizations](https://learn.liferay.com/w/dxp/users-and-permissions/organizations/understanding-organizations).

## Accounts

Liferay also offer additional tools around accounts. These can be used to model business relationships to help manage external parties. For example, Liferay accounts can model a business to consumer (B2C) context in which a customer is a single user. Accounts can also model a business to business (B2B) context where a customer represents an external company with multiple users. See our official documentation to learn more about [accounts](https://learn.liferay.com/w/dxp/users-and-permissions/accounts).

Next Up: [Securing Clarity Content](./modeling-b2b-relationships-with-liferay-accounts.md)
