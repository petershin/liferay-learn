---
uuid: 76d9acad-74ab-4f1e-bde1-80b1d6979344
---
# Creating Teams for Sites

If you have an *ad hoc* group of users who perform the same set of tasks in a site (moderating a site's wiki content, managing message boards threads, writing blogs, editing a specific page in the site, etc.), you can organize them into site teams, and then assign the team permissions for various site-specific functions. Site teams are the preferred method for administering permissions within a single site. The permissions assigned to a site team only apply to that site.

```{note}
To create and apply permissions for a group of users to use across multiple sites or organizations in your Liferay portal instance, consider aggregating the users into a [user group](../../../users-and-permissions/user-groups/creating-and-managing-user-groups.md) and assigning the user group permissions via [roles](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md).
```

The steps below cover these topics:

* [Adding a Team to a Site](#adding-a-team-to-a-site)
* [Adding Members to a Team](#adding-members-to-a-team)
* [Managing Team Permissions](#managing-team-permissions)
* [Managing Team App Permissions](#managing-team-app-permissions)

## Adding a Team to a Site

1. Open the *Product Menu* (![Product Menu](../../../images/icon-product-menu.png)), then click the compass icon (![Compass Icon](../../../images/icon-compass.png)) &rarr; Select a site.
   
1. Select *People* &rarr; *Teams*.

    ![Create teams through the People menu under the Product Menu.](./creating-teams-for-sites/images/01.png)

    ```{note}
    You can configure other site membership groupings, such as Users, Organizations, and User Groups in the Memberships app, which is also under People. See [Changing Site Membership Type](../../site-settings/site-users/changing-site-membership-type.md) for more information on how site memberships work.
    ```

1. Click the *Add* button (![Add Button](../../../images/icon-add.png)).

1. Enter a name and a description and click *Save*. Your new team is displayed in the list.

![Creating teams within your site can foster teamwork and collaboration, as team permissions enable team members to access the same resources and perform the same types of tasks.](./creating-teams-for-sites/images/02.png)

## Adding Members to a Team

1. Click on the team name link.

1. Click the *Add* button (![Add Button](../../../images/icon-add.png)).

1. Select the users to add to the team and click *Add*.

## Managing Team Permissions

1. Click the *Actions* icon (![Actions](../../../images/icon-actions.png)) next to the team and select *Permissions*.

    ```{note}
    Setting permissions for the team assigns those permissions to all the team's members. Only administrators who can edit/manage the team can manage team permissions.
    ```

1. Check/uncheck the permissions and click *Save*.

## Managing Team App Permissions

You can also manage team permissions from an app.

1. Open the *Product Menu* (![Product Menu](../../../images/icon-product-menu.png)) and select the app under the site's menu (message boards for example).

1. Open the *Options* (![Options](../../../images/icon-options.png)) menu in the top right of the screen and select the permissions-related option.

1. Find the team in the role column and select the appropriate permissions.

![The Lunar Resort message board moderators site team has unlimited permissions on the message boards application.](./creating-teams-for-sites/images/03.png)
