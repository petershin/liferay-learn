---
uuid: f548210b-6113-4205-ac28-23451ed61e43
---
# Managing and Organizing Clarity Users

Clarity Vision Solutions currently has five users already assigned to groups in Okta, along with several B2B partners who distribute their products. Liferay's out-of-the-box features are designed to help us manage and grant permissions to all of these users based on their relationship to Clarity and the responsibilities they have on the new site. Let’s start by looking at Clarity’s internal users.

At Clarity, each group has different responsibilities in developing the new enterprise website. Let’s look at Clarity's users, their respective role and group memberships, and their assigned responsibilities for the new site.

| Name             | Role                          | Group                                 | Responsibility                                                                                                                 |
|:-----------------|:------------------------------|:--------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------|
| Ian Miller       | IT Manager                    | Info Tech                             | Ensures efficient operation of IT infrastructure by aligning technology strategy with organizational objectives.               |
| Walter Douglas   | Web Developer                 | Info Tech                             | Ensures functionality, security, and performance of Clarity's website by designing, building, and maintaining it.              |
| Clara Murphy     | Marketing Content Manager     | Marketing Manager/Content Contributor | Creates and implements content strategies to attract and engage visitors, driving brand awareness and conversions.             |
| Christian Carter | Marketing Content Contributor | Content Contributor                   | Supports marketing initiatives by creating high-quality content like blog posts and product descriptions.                      |
| Harper Roberts   | HR Content Contributor        | Content Contributor                   | Develops and maintains career page content and job descriptions with the aim of attracting and informing potential candidates. |

## Structuring Your Organization through User Groups

!!! important
    Deciding how to group and assign permissions to users is a key decision point as you build out your enterprise website. Using Liferay's user groups feature to model your organization’s structure and responsibilities on the new site is the recommended approach in this situation.

One of Clarity's goals is to improve their user experience, and apply personalized experiences for its users. In this case, user groups can be leveraged alongside permissions to customize experiences for different users in Liferay. A user group is a collection of users created for a specific purpose. To effectively manage and assign permissions to users in Liferay, it's recommended to assign roles to user groups.

As Clarity brings their team members into Liferay, they need to assign roles to each person so that they have the proper permissions. Liferay manages permissions and access to the system, features, and content by assigning permissions to roles. Roles refer to the responsibilities, and expectations associated with a particular job in Clarity. The roles that are relevant to this exercise are the five mentioned on the previous table. You can learn more about the out-of-the-box roles [here](https://learn.liferay.com/en/w/dxp/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions).

Let’s walk through an example of this.

### Exercise

Clara Murphy is Clarity’s marketing content manager. Clara needs access to all of Clarity’s public facing pages as well as Clarity’s blog. As the manager, she also needs the ability to grant access to new marketing team members. Let’s walk through giving Clara and her user group the permissions they need.

1. Navigate to _Control Panel_ &rarr; _Users & Organizations_, and click on Clara's name.

1. In the left navigation, click on _Memberships_.

1. Click _Select_ on the User Groups section.

1. Choose the _Marketing Manager_ and the _Content Contributor_ user groups.

Great job! Clara is now part of the Marketing Manager and Content Contributor user groups. Let's give the right permissions to the user groups.

1. Navigate to _Control Panel_ &rarr; _Roles_.

1. Click on the options button for _Marketing Manager_ role, and select _Edit_.

1. Go to the Assignee tab, choose _User Groups_ and add the Marketing Manager user group.

      From now on, all users assigned to the marketing manager user group will have marketing manager role. You can check this by going to _Control Panel_ &rarr; _Users & Organizations_ &rarr; Clara's user  &rarr; Roles, and check the roles under _Inherited Regular Roles_.

1. Impersonate Clara by navigating to _Control Panel_ &rarr; _Users & Organizations_, and selecting _Impersonate User_ on her options button.

Well done! Clara and her user group, Content Contributor, have now access to the pages and blogs.

!!! note
    The other users are already part of a user group with the Clarity sample site. If you do not have the Clarity sample site, assign them as you did with Clara.

## Organizations

Clarity relies on user groups and roles for a significant portion of their user and permission management. However, Liferay offers additional features that can handle more complex use cases, such as organizations and accounts features.

While Clarity is not yet using Liferay's organization features, they will likely need to adopt this powerful feature as their business grows and their site requirements evolve.

Organizations are used to model the hierarchy of your company, and it is also an important part of managing groups of accounts. In the next article, you'll be adding Lily Lewis, Opportune Optics' Account Manager, to the Opportune Optics organization.

Learn more about organizations [here](https://learn.liferay.com/w/dxp/users-and-permissions/organizations/understanding-organizations).

Next Up: [Modeling B2B Relationships with Liferay Accounts]()
