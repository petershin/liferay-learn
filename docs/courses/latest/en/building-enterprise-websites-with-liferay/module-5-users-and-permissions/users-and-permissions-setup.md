---
uuid: cbe102f7-9428-4d96-8d2f-eb9ac8007dfa
---
# Users and Permissions Setup

In the last module, we saw how Clarity team members can be provisioned through Okta. For companies like Clarity, this method works best. However, for training purposes, you'll create users, roles, and user groups manually.

As explained previously, we'll be following these five Clarity personas throughout our course exercises:

![We'll be following these five Clarity personas in the subsequent exercises.](./users-and-permissions-setup/images/01.png)

## Exercise One: Creating Clarity Users

Let's start by setting up user accounts for each of Clarity's personas. You'll use these personas to explore Liferay's core capabilities throughout this course.

Each persona has these details:

| Screen Name     | Email                                         | First Name | Last Name | Job Title                  |
|:----------------|:----------------------------------------------|:-----------|:----------|:---------------------------|
| christiancarter | `christian.carter@clarityvisionsolutions.com` | Christian  | Carter    | Marketing Specialist       |
| claramurphy     | `clara.murphy@clarityvisionsolutions.com`     | Clara      | Murphy    | Marketing Manager          |
| harperroberts   | `harper.roberts@clarityvisionsolutions.com`   | Harper     | Roberts   | Human Resources Specialist |
| ianmiller       | `ian.miller@clarityvisionsolutions.com`       | Ian        | Miller    | IT Manager                 |
| walterdouglas   | `walter.douglas@clarityvisionsolutions.com`   | Walter     | Douglas   | Web Developer              |

<!--TASK: Revisit list; what about module 10's users? -->

Follow these steps to create each user account:

<!--TASK: Add images to the exercise -->

1. Open the _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)), go to the _Control Panel_ tab, and click _Users and Organizations_.

1. Click _New_.

1. Input the user's screen name (e.g. `christiancarter`).

1. Input the user's email address (e.g. `christian.carter@clarityvisionsolutions.com`).

1. Input the user's first name (e.g. `Christian`).

1. Input the user's last name (e.g. `Carter`).

1. Input the user's job title (e.g. `Marketing Specialist`).

1. Click _Save_ and return to the _Users and Organizations_ overview page.

1. Repeat this process until you have created all five users.

!!! note
    The users do not yet have passwords assigned to them.

<!--TASK: Revisit note; add more information-->

## Exercise Two: Creating Clarity Roles

In addition to Liferay's out-of-the-box roles, Clarity needs some custom roles for their team members. Here is a summary of those roles:

| Type    | Title                    | Description                                                                  |
|:--------|:-------------------------|:-----------------------------------------------------------------------------|
| Regular | Marketing Specialist     | Organizational title for a member within the marketing department            |
| Regular | Content Manager          | Organizational role for those managing content on Liferay                    |
| Regular | IT Manager               | Organizational title for a manager within the IT department                  |
| Regular | Web Developer            | Organizational title for a front end developer role within the IT Department |
| Regular | Marketing Coordinator    | Organizational title for an individual contributor from the Marketing Team   |
| Site    | Site Content Contributor | Site based role for an individual who will be contributing                   |

<!--TASK: Revisit list; what about module 10's role? -->

<!--TASK: Add images to the exercise -->

Follow these steps to create each role:

1. Open the _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)), go to the _Control Panel_ tab, and click _Roles_.

1. Click _New_.

1. Select the role type (e.g. `Regular`).

1. Input the role title (e.g. `Marketing Specialist`).

1. Input the role description (e.g. `Organizational title for a member within the marketing department`).

1. Click _Save_ and return to the _Roles_ overview page.

1. Repeat this process until you have created all six roles.

!!! note
   The roles above do not yet have any permissions assigned to them. The following lessons will cover assigning permissions to roles.

## Exercise Three: Creating Clarity User Groups

Now let's make a Liferay user group for the marketing department.

| Group Name | Description                                    |
|:-----------|:-----------------------------------------------|
| Marketing  | Members of the Marketing department at Clarity |
| IT         | Members of the IT department at Clarity        |

Follow these steps to create each user group:

1. Open the _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)), go to the _Control Panel_ tab, and click _Users Groups_.

1. Click _New_.

1. Input the user group name (e.g. `Marketing`).

1. Input the user group description (e.g. `Members of the Marketing department at Clarity`).

1. Click _Save_.

1. Repeat this process until you have created both user groups.

## Conclusion

Now that we have these users, roles, and user groups set up, let's move on to how the different user management tools can be used in Clarity's use case.

Next Up: [Managing and Organizing Clarity Users](./managing-and-organizing-clarity-users.md)
