# Adding and Managing Custom States

{bdg-secondary}`Available Liferay 7.4 U41+ and GA41+`

Some use cases may require assigning multiple states to an object entry at the same time. For example, when building an Order application, you may need to assign and manage order, payment, and delivery statuses for the same entry, each with its own flow and associated business logic. Using Liferay picklists with custom objects, you can achieve this functionality.

With [picklists](../picklists.md), you can define lists of strings and use them with object fields to define custom states for entries. Once added to an object definition, you can design the flow for each state and use [validations](./adding-custom-validations.md) and [actions](./defining-object-actions.md) to add custom business logic for different states. These custom states can also be used alongside [workflow statuses](../enabling-workflows-for-objects.md) to define more complex review and approval processes.

![Use picklists to add custom states to object definitions.](./adding-and-managing-custom-states/images/01.png)

## Adding a State Field to Object Definitions

Follow these steps to use a picklist to add custom states for an object's entries:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), click the *Control Panel* tab, and go to *Picklists*.

1. Create a picklist with the desired items. These items define object entry states. See [Creating a Picklist](../picklists/using-picklists.md#creating-a-picklist) for more detailed steps.

   ```{note}
   You can add, remove, or edit picklist items for both draft and published object definitions at any time.
   ```

   ![Create a picklist with the desired items.](./adding-and-managing-custom-states/images/02.png)

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), click the *Control Panel* tab, and go to *Objects*.

1. Begin editing the desired custom object.

1. Go to the *Fields* tab and click the *Add* button (![Add Button](../../../images/icon-add.png)).

   ![Begin adding a field to the object definition.](./adding-and-managing-custom-states/images/03.png)

1. Enter a *Label* and *Field Name*.

1. Select the *Picklist* type and choose the desired list.

1. Toggle *Mark as State*.

   ```{note}
   State fields are automatically set to *mandatory*, and you cannot change them to optional.
   ```

1. Select a *Default Value* for the state field.

   ![Select a picklist, toggle Mark as State, and set a default value for the field.](./adding-and-managing-custom-states/images/04.png)

1. Click *Save*.

After adding the field to a definition, you can [set up a flow](#setting-up-a-flow-for-state-fields) to determine which transitions are available for each state.

## Setting Up a Flow for State Fields

By default, each state can transition to all other states. However, you can __. Ensures the entry goes through the desires process.

Follow these steps to set up a custom flow for state fields:

1. While editing a custom object, go to the *State Manager* tab and select the desired *state field*.

   ![Go to the State Manager tab to set up a flow for state fields.](./adding-and-managing-custom-states/images/05.png)

1. Under Next Status, click the dropdown menus and check the boxes to determines available transitions for each state.

   You can select any number of transitions for a state.

   ![Determine the available transitions between states.](./adding-and-managing-custom-states/images/06.png)

1. Click *Save*.

Once saved, users can only transition an entry's state according to your defined flow.

![Set up a custom flow determines available transitions for each state.](./adding-and-managing-custom-states/images/07.png)

## Additional Information

* [Picklists](../picklists.md)
* [Adding Fields to Objects](./adding-fields-to-objects.md)
* [Understanding Object Field Types](../understanding-object-field-types.md)
