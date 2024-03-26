---
uuid: f548210b-6113-4205-ac28-23451ed61e43
---
# Managing and Organizing Clarity Users

Clarity team members were provisioned through Okta and have already logged into Liferay, but their roles and permissions have not been set yet. Liferay's out-of-the-box features are designed to help manage and grant permissions to these users based on their company role and responsibilities on the new site.

User management is the primary means of customizing a diverse user experience. Common use cases includes giving users privileges to access parts of the platform or specific resources, as well as restricting user access from unauthorized resources or actions. Basically, when user management is done right, everyone is granted access only to the resources and functionalities necessary for their roles. Fortunately, Liferay’s user and permission management takes care of the underlying dirty work, to simplify user management so you don’t have to deal with employee complaints.

## Revisiting Clarity’s Critical Success Factors

All six [critical success factors](../module-1-getting-started-with-clarity/the-clarity-story.md#critical-success-factors) identified by Clarity's business team can be mapped to user and permission requirements. However, three of these factors hold particular relevance.

**Non-Technical Participation**: Manage the user experience with ease, even for non-developers. While Clarity's initial setup might require technical expertise, Liferay's user-friendly UI allows them to train its own personnel to take control of user management and tailor the experience.

**Increased Engagement through Personalization**: Personalization is the key to user engagement, after all, that's what user management is ultimately about: creating a more engaging experience for users. By enabling customization and personalization, Liferay's user-friendly UI empowers administrators to achieve this goal quickly and easily.

**Risk Mitigation with Better Governance**: Role-based permissions within Clarity ensure data security. Users can only access and edit site sections relevant to their role, minimizing the risk of data leaks and protecting your brand reputation.

At Clarity, each person has different responsibilities in developing the new enterprise website. Let's take a closer look at the different types of users involved, their roles, the groups they belong to, and the responsibilities they have for the site.

| Name | Role | User Group | Responsibility|
|:---|:---|:---|:---|
| Ian Miller | IT Manager | IT | Ensures efficient operation of IT infrastructure by aligning technology strategy with organizational objectives. |
| Walter Douglas | Web Developer | IT | Ensures functionality, security, and performance of Clarity's website by designing, building, and maintaining it. |
| Clara Murphy | Marketing Content Manager | Content Creation and Site Management | Creates and implements content strategies to attract and engage visitors, driving brand awareness and conversions. |
| Christian Carter | Marketing Content Contributor | Content Creation | Supports marketing initiatives by creating high-quality content like blog posts and product descriptions. |
| Harper Roberts | HR Content Contributor | Content Creation | Develops and maintains career page content and job descriptions with the aim of attracting and informing potential candidates. |

## Defining Roles and Permissions

In Liferay, permissions are assigned to roles, as opposed to being assigned to individuals. We can consider roles as collections of permissions and Liferay provides [out-of-the-box roles](https://learn.liferay.com/en/w/dxp/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions) that come by default. Custom roles can also be created with your choice of permissions to fit your business. These roles can then be assigned to Liferay users.

Permissions are individual checks that determine whether a user can access a specific resource or perform a certain activity. In contrast, roles are made of many permissions together. Creating roles promotes reuse within the permission structure and discourages directly assigning permissions to individual users. Based on a user's role you should know what they are, and what they can do.

The different kinds of roles are created by Liferay for scoping purposes. Sometimes, you don’t want a certain permission to carry across the whole site. Other times, you might want the permission to be valid only in a certain site, or set of pages. The different kinds of roles will allow you to scope permissions differently, and Liferay offers 5 kinds of permissions.

|Role type | Scope |
|:--- |:--- |
|Regular Role | This is the most extensive permission scope, and it spans across the whole portal. |
|Site Role | Permissions that are scoped to a particular site. |
|Organization Role | Permissions that are scoped to particular users of an organization. |
|Asset Library Role | Permissions attached specifically to shared resources, particularly related to asset libraries and asset management. |
|Account Role | Permissions that are given to users who are a part of an account. |

## Structuring Your Organization through User Groups

!!! important **Key Decision**
    Deciding how to group and assign permissions to users is a key decision point as you build out your enterprise website. Using Liferay's user groups feature to model your organization’s structure and responsibilities on the new site is the recommended approach in this situation.

To increase efficiency, roles can also be assigned to entire user groups. The purpose behind this is to promote reuse and simplify the user management experience. One of Clarity's goals is to improve their user experience and apply personalized experiences for its users. Therefore, Clarity can leverage their existing groupings from Okta and assign custom roles to different user groups in Liferay. Here is a visual representation of Clarity's set of user groups where users get certain accesses based on their roles.

![Visual representation of Clarity's set of user groups, and Liferay’s permission framework.](./managing-and-organizing-clarity-users/images/01.png)

The image above illustrates three user groups used by Clarity, represented by dotted lines. Each user group is assigned the necessary roles and permissions required to perform their daily tasks. Marketing content manager, Clara Murphy, belongs to two of these teams. Consequently, she inherits all the roles associated with both user groups. Italicized roles in the image indicate those assigned to specific users, while non-italicized roles are assigned to user groups.

Let’s walk through an example of custom role creation for user groups.

!!! note
    The Clarity users that came with the sample Clarity site are already assigned to user groups. If you do not have the sample Clarity site, create the user groups above and assign the users to them. See our documentation about [user groups](https://learn.liferay.com/w/dxp/users-and-permissions/user-groups).

### Exercise 1 - Creating Custom Roles for User Groups

The content creation user group requires permissions to edit site pages as well as add blog posts. Let's create a custom role and assign it to the user group.

1. Navigate to _Control Panel_ &rarr; _Roles_. Under the _Regular Roles_ tab, click the add icon.

1. Input `Content Creator` as the title of the new role. Click _Save_.

1. Click the _Define Permissions_ tab. In the left navigation, expand _Site and Asset Library Administration_ and click _Site Builder_ &rarr; _Pages_. Scroll down to the _Page_ section and check the _Update_ checkbox. Scroll down to the bottom and click _Save_.

1. Still under the _Site and Asset Library Administration_ menu, click _Content & Data_ &rarr; _Blogs_. Under _Blog Entries_, check the _Add Entry_ checkbox. Under the _Blogs Entry_, check the _Update_ checkbox. Scroll down to the bottom and click _Save_.

1. The summary of the permissions under the _Define Permissions_ tab should look as follows.

    ![Set the permissions for the content creator role.](./managing-and-organizing-clarity-users/images/02.png)

1. Next, click the _Assignees_ tab. Click the _User Groups_ tab. Click the add icon.

1. In the pop-up window, select the content creation user group and click _Add_.

1. To verify the permissions, navigate to _Control Panel_ &rarr; _Users and Organizations_. Click the options icon for Christian Carter and click _Impersonate User_. Navigate to Clarity's blog page and verify that the user can add a blog entry. Also, navigate to a site page and verify that the user can edit the page.

Well done! Now every team member that is part of the content creation user group has the correct permissions.

To learn more about user management in general, see our [documentation](https://learn.liferay.com/w/dxp/users-and-permissions).

### Bonus Exercise

You've learned how to create a custom role for the content creator user group.

Next, try to create custom roles for Clarity's other roles and assign them to the other user groups.

!!! tip
    To establish an effective permission system, begin by identifying individual responsibilities or general user roles. Next, group similar responsibilities and permissions as demonstrated in exercise 1. Then, assign these scoped role-responsibilities to user groups based on their needs. Finally, review your design to ensure it covers all necessary permissions.

## Organizations

Clarity relies on user groups and roles for a significant portion of their user and permission management. However, Liferay offers Organizations as an additional user management tool.

Organizations can be used to model the hierarchy of a company. It is also an important part of managing groups of accounts. In the next article, you'll be adding Lily Lewis, an account manager that oversees the Opportune Optics organization.

As their business grows and site requirements evolve, Clarity can consider leveraging Liferay organizations in the future.

Learn more about Liferay organizations [here](https://learn.liferay.com/w/dxp/users-and-permissions/organizations/understanding-organizations).

Next Up: [Modeling B2B Relationships with Liferay Accounts](./modeling-b2b-relationships-with-liferay-accounts.md)
