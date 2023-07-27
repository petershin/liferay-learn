---
uuid: 29b299d7-f4aa-4ce7-b016-a16414b6dc83
---
# Using Manual Actions

{bdg-secondary}`Available Liferay 7.4 U60+/GA60+`

When you use the standalone trigger for object actions, the actions become manual instead of automatic. Trigger these actions using either

* [the object's UI](#trigger-actions-via-ui)
* [dedicated action APIs](#trigger-actions-via-apis)
* [buttons in pages](#trigger-actions-via-pages)

This example creates a standalone action for sending notifications.

![You can use the standalone trigger to run any type of object action manually.](./using-manual-actions/images/01.png)

See [Defining Object Actions](./defining-object-actions.md) for how to add standalone actions to object definitions.

## Trigger Actions via UI

Active standalone actions appear in the Actions menu for object entries. To trigger these actions via the UI,

1. Navigate to the object definition's application page.

1. Click the *Actions* button (![Action Button](../../../../images/icon-actions.png)) for the desired entry and select the standalone action.

   In this example, the action is Send Reminder.

   ![Click the Actions button for the desired entry and select the standalone action.](./using-manual-actions/images/02.png)

## Trigger Actions via APIs

Liferay automatically generates REST APIs for published object definitions. These include APIs for active standalone actions.

To view these APIs,

1. Open Liferay's API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`).

1. Click *REST Applications* and select the desired object definition. Custom objects use the `c/[pluralobjectlabel]` naming pattern (e.g., `c/tickets`).

For each standalone action, Liferay generates two PUT APIs: one that uses the entry's ID and another that uses the entry's external reference code (ERC).

![Liferay generates two PUT APIs: one that uses the entry's ID and another that uses the entry's ERC.](./using-manual-actions/images/03.png)

Calling either API triggers the action for the specified entry.

![Calling the API triggers the action for the specified entry.](./using-manual-actions/images/04.png)

## Trigger Actions via Pages
You can map an action to a button component in a page (e.g. content pages, forms, collection display fragments, or display page templates). 

To enable buttons to use actions, add the tags `data-lfr-editable-id="action"`  and `data-lfr-editable-type="action"` to the button fragment. 

<!-- 
editing-fragment-elements.md should also be added.
(Once I update this section, I can add this pointer)
To learn more about mapping actions to buttons in fragments, see [Fragment Specific Tags and Attributes Reference](../../../developer-guide/reference/fragments/fragment-specific-tags-reference.md) -->

Here is an example of an action-ready button:

```HTML
<button class="btn btn-${configuration.buttonSize} btn-${configuration.buttonType}" 
    data-lfr-editable-id="action" data-lfr-editable-type="action">
  Go Somewhere
</button>
```

### Mapping Buttons to Object Actions

* [Create a Page](../../../../site-building/creating-pages.md).

* Add a *Button* to your layout. See [Adding Elements to Content Pages](../../using-content-pages/adding-elements-to-content-pages.md) to learn how to edit a content page.

* Click on the *Button* once. In the Parent Configuration menu, under Button Options, select *Action* as the type. This configuration allows you to map actions to the button.

  ![In the parent configuration menu, select Action as the type of button.](./using-manual-actions/images/05.png)

* Click on the *Button* a second time. An action menu opens on the right.

  ![You can configure the mapping process using the Mapping and Action tabs.](./using-manual-actions/images/06.png)

* Under the Mapping tab, 

  1. Click on the *Item* field or the *Select Item* icon (![Select Item](../../../../images/icon-add-app.png)) right next to the field. 

      If you are editing a display page template, choose your object as the content type when you create the page. This makes your object the default source when mapping the button or the action. To learn more about creating display page templates, see [Creating and Managing Display Page Templates](../../../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)

      ![Chose your object as the content type when creating a display page template.](./using-manual-actions/images/07.png)

      When you need to choose specific content, go to the *Mapping* or *Action* tabs, click on the *Source* field, select *Specific Content*, and choose the specific *Item*.

        ![You can use the default object or select a specific content](./using-manual-actions/images/08.png)

  1. Select your object name from the list at the top. The available object entries appear at the bottom.

      ![Select a specific object entry](./using-manual-actions/images/09.png)

  1. Choose a specific object entry.

  1. Select the field to be mapped to the button label.

* Under the Action tab, 

  1. Select a specific object entry.

  1. Choose an action. This action is triggered once the user clicks on the button.

      ```tip
      You can use collection display fragments or form fragments with buttons mapped to actions. See [Displaying Collections](../../../../site-building/displaying-content/additional-content-display-options/displaying-collections.md) and [Using Fragments to Build Forms](../../using-fragments-to-build-forms.md) to learn more about using collection displays and form fragments.
      ```

  1. Choose what happens with a successful interaction and a failed interaction. See [Managing Success and Error Interactions](#managing-success-and-error-interactions) for more information.

### Managing Success and Error Interactions
With Liferay, you can choose what happens if an action succeeds or fails after the user clicks on a button mapped to an action.

Under the Action tab, you can configure the *Success* and *Error* interactions.

![You can choose what happens after an action is performed when the user clicks on a button mapped to an action: nothing, the user receives a notification, the user is redirected to a page, or the user is redirected to an external URL.](./using-manual-actions/images/10.png)

There are four options available for both interactions:
1. **None**: Nothing happens after the action is performed.
1. **Show Notification**: Shows the user a notification with a custom Success or Error Text message. 

    Write your custom success/error message.

    You can preview your notification by toggling *Preview Success Notification*.

    Check the Reload Page After Success/Error to reload the page after the action is performed. Reloading the page is useful if you want to update states and values in your page.

    ![Show the user a custom notification.](./using-manual-actions/images/11.png)

1. **Go to Page**: Navigates to a Success/Error Page in your Site.

    Select the Success/Error Page by clicking on the field or the + sign and selecting your page.

    ![Redirect the user to a page in your site.](./using-manual-actions/images/12.png)

1. **Go to External URL**: Navigates to an external URL.

    Add the external URL to the Success/Error External URL field.

    ![Redirect the user to an external URL.](./using-manual-actions/images/13.png)

## Action Permissions

Liferay automatically generates permissions for managing which roles can trigger standalone actions. Each permission follows the `action.[actionName]` naming pattern (e.g., `action.sendReminder`). See [Permissions Framework Integration](../../understanding-object-integrations/permissions-framework-integration.md) for more information on object permissions.

![Standalone permissions use the action.[actionName] naming pattern.](./using-manual-actions/images/14.png)

## Related Topics

* [Defining Object Actions](./defining-object-actions.md)
* [Understanding Action Types](./understanding-action-types.md)
* [Headless Framework Integration](../../understanding-object-integrations/headless-framework-integration.md)
