# Using Publication Templates

If you need to create multiple publications with the same details and contributors, use publication templates to simplify setup. With templates, you can use token to dynamically set publication names and descriptions. Also, you can set a list of default users to invite to the publication and assign them roles.

To create a publication template,

1. Open the *Global Menu* ( ![Global Menu](../../../images/icon-applications-menu.png) ), go to the *Applications* tab, and click *Publications*.

1. Click the *Actions* button ( ![Actions Button](../../../images/icon-actions.png) ) in the Application Bar and select *Templates*.

   ![Open the Publications application, click the Actions button in the Application Bar, and select Templates.](./using-publication-templates/images/01.png)

1. Click the *Add* button ( ![Add button](../../../images/icon-add.png) )

1. Enter a name and description for the template.

   ![Enter a name and description for the template.](./using-publication-templates/images/02.png)

1. Enter a name and description to use for publications created with the template.

   When defining these fields, you can use string template tokens to dynamically generate values:

   * `${RANDOM_HASH}`

   * `${TODAY_DATE}`

   * `${CURRENT_USERNAME}`

   ![Enter a name and description to use for publications created with the template.](./using-publication-templates/images/03.png)

1. Click *Invite Users* to determine the default users and role assignments for publications created with the template.

   ![Click Invite Users to determine the default users and role assignments for publications created with the template.](./using-publication-templates/images/04.png)

   To add contributors, search for users and select a role. See [Collaborating on Publications](./collaborating-on-publications.md) for more information on these options.

   ![Search for users and select a role.](./using-publication-templates/images/05.png)

   ```{note}
   If you invite users without access to the Publications application, Liferay automatically assigns them the Publications User role.
   ```

1. Click *Save*.

The new template appears in the Publication Templates page.

![Templates appear in the Publication Templates page](./using-publication-templates/images/06.png)

Users can select the template when [creating a publication](./creating-and-managing-publications.md#creating-a-new-publication). Selecting the template automatically populates the name and description fields and invites the default contributors.

![Users can select the template when creating a publication.](./using-publication-templates/images/07.png)

## Additional Information

* [Creating and Managing Publications](./creating-and-managing-publications.md)
* [Collaborating on Publications](./collaborating-on-publications.md)
* [Publications Permissions](./publications-permissions.md)
