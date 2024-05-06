---
uuid: cbe102f7-9428-4d96-8d2f-eb9ac8007dfa
---
# Users and Permissions Setup

Before we begin, we need to create some users, roles, and user groups. These will be used in this module and the succeeding modules.

## Creating Clarity Users

Here are some of the Clarity team members:

| Screen Name | Email | First Name | Last Name | Job Title |
|:---|:---|:---|:---|:---|
| ianmiller | ian.miller@clarityvisionsolutions.com | Ian | Miller | IT Manager |
| janenewton | jane.newton@clarityvisionsolutions.com | Jane | Newton | Marketing Specialist |

<!---
| walterdouglas | walter.douglas@clarityvisionsolutions.com | Walter | Douglas | Web Developer |
| claramurphy | clara.murphy@clarityvisionsolutions.com | Clara | Murphy | Marketing Manager |
| christiancarter | christian.carter@clarityvisionsolutions.com | Christian | Carter | Marketing Coordinator |
| harperroberts | harper.roberts@clarityvisionsolutions.com | Harper | Roberts | Director of Human Resources |
--->

Follow the steps below to create these user accounts:

1. Open the applications menu and navigate to _Control Panel_ &rarr; _Users and Organizations_.

1. Click _New_ to create a new user.

1. Input the user's screen name (e.g. `ianmiller`).

1. Input the user's email address (e.g. `ian.miller@clarityvisionsoltions.com`).

1. Input the user's first name (e.g. `Ian`).

1. Input the user's last name (e.g. `Miller`).

1. Input the user's job title (e.g. `IT Manager`).

1. Click _Save_ and navigate back out to the list of users. Continue making each of the users listed in the table.

!!! note
   The users above do not have passwords assigned to them.

## Creating Clarity Roles

In addition to the default roles that ship with Liferay, Clarity needs some custom roles for their team members. Here is a summary of some of the roles:

| Type | Title | Description |
|:---|:---|:---|
| Regular | IT Manager | Organizational title for a manager within the IT department |
| Regular | Marketing Specialist | Organizational title for a marketing specialist on the marketing team |

<!---
| Regular | Web Developer | Organizational title for a front end developer role within the IT Department |
| Regular | Marketing Coordinator | Organizational title for an individual contributor from the Marketing Team |
| Regular | Director of Human Resources | Organizational title for a Director of Human Resources |
| Site | Site Content Contributor | Site based role for an individual who will be contributing |
--->

Follow the steps below to create these roles:

1. Open the applications menu and navigate to _Control Panel_ &rarr; _Roles_.

2. Click _New_ to create a new role.

3. Select the role type (e.g. `Regular`).

4. Input the role title (e.g. `IT Manager`).

5. Input the role description (e.g. `Organizational title for a manager within the IT department`).

6. Click _Save_ and navigate back out to the list of roles. Continue making each of the roles listed in the table.

!!! note
   The roles above do not yet have any permissions assigned to them. The succeeding lessons will cover assigning permissions to roles.

## Creating Clarity User Groups

Here are some of Clarity's user groups:

| Name | Description |
|:---|:---|
| IT | Members of the IT department at Clarity |
| Marketing | Members of the marketing department at Clarity |

Follow the steps below to create these user groups:

1. Open the applications menu and navigate to _Control Panel_ &rarr; _Users Groups_.

1. Click _New_ to create a new user group.

1. Input the user group name (e.g. `IT`).

1. Input the user group description (e.g. `Members of the IT department at Clarity`).

1. Click _Save_. Continue making each user group listed in the table.

Now that we have these users, roles, and user groups set up, let's move on to how the different user management tools can be used in Clarity's use case.

Next Up: [Managing and Organizing Clarity Users](./managing-and-organizing-clarity-users.md)
