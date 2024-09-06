---
uuid: f548210b-6113-4205-ac28-23451ed61e43
---
# Creating and Assigning Roles to Clarity's Users

Liferay employs a role-based access control (RBAC) model to manage user permissions. Roles and permissions are fundamental to Liferay's security architecture. Roles are collections of permissions granted to users or groups. Permissions are granular checks that determine how a user can interact with Liferay's applications and resources. This article guides you through creating roles, defining their permissions, and assigning these roles to Clarity's users.

## Exercise: Creating and Assigning User Roles

<!-- Exercise 3c -->

Each Clarity persona belongs to different teams with different responsibilities. You can use Liferay roles to model this structure. A role is a list of permissions that empower users to perform specific actions within the Liferay instance.

While Clarity can leverage many of Liferay's out-of-the-box roles, they also want these custom roles:

| Type    | Title                    | Description                                                         |
|:--------|:-------------------------|:--------------------------------------------------------------------|
| Regular | Content Manager          | Clarity role for those managing content on Liferay.                 |
| Regular | IT Manager               | Clarity role for a manager within the IT department.                |
| Regular | Web Developer            | Clarity role for a front end developer within the IT Department.    |
| Regular | Marketing Coordinator    | Clarity role for an individual contributor from the marketing team. |
| Site    | Site Content Contributor | Site based role for those contributing to the Clarity site.         |

The training workspace includes all of these roles except for Marketing Coordinator. Here you'll create and assign the Marketing Coordinator role as the Clarity Admin user.

To begin,

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Roles*.

1. Click *New*.

1. Enter these details for the role:

   | Field       | Value                                                                 |
   |:------------|:----------------------------------------------------------------------|
   | Type        | `Regular`                                                             |
   | Title       | `Marketing Coordinator`                                               |
   | Description | `Clarity role for an individual contributor from the marketing team.` |
   | Key         | `Marketing Coordinator`                                               |

   ![Create the Marketing Coordinator role.](./creating-and-assigning-roles-to-claritys-users/images/01.png)

1. Click *Save*.

   This creates the role, so you can add permissions and assign it to users. Since this role should apply to all marketing team members, you can assign it to the Marketing user group.

1. Go to the *Assignees* tab and click *User Groups*

   ![Go to the User Groups tab under Assignees.](./creating-and-assigning-roles-to-claritys-users/images/02.png)

1. Click *New*.

1. Select *Marketing*.

   ![Select the Marketing user group.](./creating-and-assigning-roles-to-claritys-users/images/03.png)

1. Click *Add*.

Great! You've created and assigned a role to Clarity's marketing users. However, the role doesn't have any permissions yet. Next, you'll add permissions to the role. This enables anyone with the role to fulfill their responsibilities in the Clarity website.

## Exercise: Defining Role Permissions

<!-- Exercise 3d -->

Permissions grant the ability to access data and perform specific actions in a Liferay instance. Now that you've created the Marketing Coordinator role, you'll start adding specific permissions associated with the role as the Clarity Admin user.

Throughout this process, you'll impersonate Christian Carter to see the practical effect of granting the Marketing Coordinator role additional permissions.

To do this,

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Users and Organizations*.

1. Click *Actions* (![Actions Button](../../images/icon-actions.png)) for Christian Carter and select *Impersonate User*.

   ![Impersonate Christian Carter.](./creating-and-assigning-roles-to-claritys-users/images/04.png)

   This opens a new tab where you can view the Liferay instance using Christian Carter's permissions.

   Notice how he doesn't have access to any of the applications or resources he needs as a marketing coordinator.

   ![Christian Carter doesn't have access to any of the applications or resources he needs as a marketing coordinator.](./creating-and-assigning-roles-to-claritys-users/images/05.png)

   Clarity needs all Marketing Coordinators to have access to assets in the team's asset library.

1. Return to the Clarity Admin tab, go to the *Roles* application, and click the *Marketing Coordinator* role to begin editing it.

1. Go to the *Define Permissions* tab.

1. In the left menu, go to *Applications Menu* &rarr; *Content* &rarr; *Asset Libraries*.

   **Tip**: Enter "Asset Libraries" into the search bar to quickly locate this section.

   ![Assign Asset Library permissions to the Marketing Coordinator role.](./creating-and-assigning-roles-to-claritys-users/images/06.png)

1. Select these permissions:

   | Section                                    | Permission                                      |
   |:-------------------------------------------|:------------------------------------------------|
   | Application Permissions                    | Access in Control Panel                         |
   | Application Permissions                    | View                                            |
   | Resource Permissions > Asset Library Entry | View Site and Asset Library Administration Menu |

1. Click *Save*.

   This updates the Marketing Coordinator role's permissions.

   **Note**: Liferay automatically assigns the `Portal: View Control Panel Menu` permission when you grant the `Access in Control Panel` permission.

1. Refresh the tab where you're impersonating Christian Carter.

   Now he can access the Asset Libraries application in the Global Menu (![Global Menu](../../images/icon-applications-menu.png)).

   ![Christian Carter can now access the Asset Libraries application in the Global Menu.](./creating-and-assigning-roles-to-claritys-users/images/07.png)

1. Go to the *Asset Libraries* application.

   Although Christian Carter can access the application, he cannot view or access any libraries included in the bootcamp workspace: 
   
   * Error Pages
   * HR
   * Leadership
   * Legal
   * Marketing Assets
   * Product Images
   
   Since Christian Carter and other marketing team members need access to the Marketing Assets library, let's grant grant them membership using the Marketing user group.

1. Return to the Clarity Admin tab.

1. In the Global Menu, go to *Asset Libraries* and click *Marketing Assets*.

1. Click *Memberships* and go to the *User Groups* tab.

1. Click *New*.

1. Select *Marketing* and click *Done*.

   ![Select the Marketing user group in the Marketing Assets's membership application](./creating-and-assigning-roles-to-claritys-users/images/08.png)

1. Refresh the tab where you're impersonating Christian Carter.

   Now he can access the Marketing Assets library, but he still cannot access the library's applications or data.

   To solve this, let's assign the default Asset Library Administrator role to the Marketing user group.

1. Return to the Clarity Admin tab.

1. Click *Actions* (![Actions Button](../../images/icon-actions.png)) for the Marketing user group and select *Assign Roles*.

   ![Click Actions for the Marketing user group and select Assign Roles.](./creating-and-assigning-roles-to-claritys-users/images/09.png)

   Here you can select from available asset library roles. These roles grant permissions for individual libraries.

1. Select the *Asset Library Administrator* role and click *Done*.

1. Refresh the tab where you're impersonating Christian Carter.

   Now he can access the library's applications.

   ![Now Christian Carter can access the library's applications.](./creating-and-assigning-roles-to-claritys-users/images/10.png)

   Although Christian Carter can access the library's applications, he doesn't have the application permissions necessary for fulfilling his responsibilities (e.g., uploading documents, editing articles).

   Let's add these permissions to the Marketing Coordinator role.

1. Return to the Clarity Admin tab, go to the *Roles* application, and click the *Marketing Coordinator* role to begin editing it.

1. Go to the *Define Permissions* tab.

1. In the left menu, go to *Site and Asset Library Administration* &rarr; *Content & Data* &rarr; *Documents and Media*.
 
   **Note**: If you search "Documents and Media," two options appear with the same name. Select the option under Content & Data.

1. Select these permissions:

   | Section                                 | Permission                                      |
   |:----------------------------------------|:------------------------------------------------|
   | General Permissions                     | Access in Site and Asset Library Administration |
   | General Permissions                     | View                                            |
   | Resource Permissions > Documents        | Add Document                                    |
   | Resource Permissions > Documents        | Add Folder                                      |
   | Resource Permissions > Documents        | Update                                          |
   | Resource Permissions > Documents        | View                                            |
   | Resource Permissions > Documents Folder | View                                            |

1. Click *Save*.

1. In the left menu, go to *Site and Asset Library Administration* &rarr; *Content & Data* &rarr; *Web Content*.

   **Note**: If you search "Web Content," two options appear with the same name. Select the option under Content & Data.

1. Select these permissions:

   | Section                                      | Permission                                      |
   |:---------------------------------------------|:------------------------------------------------|
   | General Permissions                          | Access in Site and Asset Library Administration |
   | General Permissions                          | View                                            |
   | Resource Permissions > Web Content           | Add Folder                                      |
   | Resource Permissions > Web Content           | Add Structure                                   |
   | Resource Permissions > Web Content           | Add Template                                    |
   | Resource Permissions > Web Content           | Add Web Content                                 |
   | Resource Permissions > Web Content           | Update                                          |
   | Resource Permissions > Web Content           | View                                            |
   | Resource Permissions > Web Content Article   | Update                                          |
   | Resource Permissions > Web Content Structure | View                                            |
   | Resource Permissions > Web Content Template  | View                                            |

1. Click *Save*.

1. In the left menu, go to *Site and Asset Library Administration* &rarr;  *Categorization* &rarr; *Categories*.

1. Select these permissions:

   | Section                                 | Permission     |
   |:----------------------------------------|:---------------|
   | Resource Permissions > Asset Categories | Add Category   |
   | Resource Permissions > Asset Categories | Add Vocabulary |

1. Refresh the tab where you're impersonating Christian Carter.

   He can now perform all content actions necessary for his responsibilities (e.g., create and edit web content). Next, marketing coordinators need the ability to update site pages.

1. Return to the Clarity Admin tab.

1. In the left menu, go to *Site and Asset Library Administration* &rarr; *Site Builder* &rarr; *Pages*. 

   ![Assign Page permissions to the Marketing Coordinator role.](./creating-and-assigning-roles-to-claritys-users/images/11.png)

1. Select this permission.

   | Section                     | Permission |
   |:----------------------------|:-----------|
   | Resource Permissions > Page | Update     |

1. Click *Save*.

1. Refresh the tab where you're impersonating Christian Carter.

   Notice that he can now access edit tools for site pages.

   ![Christian Carter can now access edit tools for site pages.](./creating-and-assigning-roles-to-claritys-users/images/12.png)

Well done! Now all members of the Marketing user group have the correct base permissions. By assigning additional roles, Clarity can ensure they have access to the applications and data they need.

Next, you can opt to learn more about roles and user permissions by creating a manager role. Otherwise, you can move to Lesson 4 and explore how to create and configure sites.

## Exercise: Fine Tuning Manager Permissions (Bonus)

<!-- Exercise 3e -->

So far you've been using the Clarity Admin user to make changes. This user is the omni-administator and has all Liferay permissions. In real world scenarios, companies should strictly guard access to this user and greatly restrict which users have full admin privileges. Companies like Clarity should set up manager roles that only have the permissions necessary for their responsibilities.

Here you'll set up a management group that has authority to configure permissions for their team members, without granting them full admin privileges as the Clarity Admin user.

To do this,

1. Go to the *User Groups* application in the Global Menu.

1. Create a `Marketing Managers` user group.

1. Add Clara Murphy to the group.

1. Go to the *Roles* application in the Global Menu.

1. Create a `Marketing Manager` role.

1. While editing the *Marketing Manager* role, go to the *Define Permissions* tab.

1. In the left menu, go to *Control Panel* &rarr; *Users* &rarr; *User Groups*.

1. Select this permission:

   | Section                 | Permission              |
   |:------------------------|:------------------------|
   | Application Permissions | Access in Control Panel |

1. Click *Save*.

1. In the left menu, go to *Control Panel* &rarr; *Users* &rarr; *Users and Organizations*.

1. Select this permission:

   | Section         | Permission |
   |:----------------|:-----------|
   | Resource > User | View       |

1. Click *Save*.

1. Go to the *Assignees* tab and assign this role to the *Marketing Managers* user group.

   These permissions grant the ability to view the User Groups application and view users. Next, you'll give the Marketing Manager role permission to view and add members for the Marketing user group.

1. Go to the *User Groups* application in the Global Menu.

1. Click *Actions* (![Actions Button](../../images/icon-actions.png)) for the Marketing user group and select *Permissions*.

   ![Select Permissions in the Actions menu for the Marketing user group.](./creating-and-assigning-roles-to-claritys-users/images/13.png)          

1. For the Marketing Manager role, select these permissions and click *Save*:

   | Role              | Permission     |
   |:------------------|:---------------|
   | Marketing Manager | Assign Members |
   | Marketing Manager | View Members   |
   | Marketing Manager | View           |

   ![Give view and add members permissions to the marketing manager role.](./creating-and-assigning-roles-to-claritys-users/images/14.png)

1. Go to the *Users and Organizations* application in the Global Menu.

1. Impersonate Clara Murphy to verify the Marketing Manager role permissions.

   Clara should see the Marketing user group. She should also be able to view members of the user group and add new members to the group.

   ![Clara can add other Clarity users to the marketing user group.](./creating-and-assigning-roles-to-claritys-users/images/15.png)

   **Note**: This is just an example of the types of permissions you can assign to manager roles.

<!-- Great! For now, you've finished setting up Clarity's users, user groups, and roles. Next, we'll turn our attention to Clarity's website. -->

## Conclusion

Congratulation! You've completed Module 4: Security and Identity Management. Throughout this module, you've learned best practices for authenticating and authorizing users in Liferay DXP. You also finished setting up Clarity's users, user groups, and roles for their public enterprise website. 

In the next module, you'll learn about building sites with Liferay.

Next Up: [Module 5: Site Building](../module-5-site-building.md)

### Additional Resources

See official documentation to learn more about managing roles and permissions:

* [Understanding Roles and Permissions](https://learn.liferay.com/w/dxp/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions)
* [Creating and Managing User Groups](https://learn.liferay.com/w/dxp/users-and-permissions/user-groups/creating-and-managing-user-groups)
