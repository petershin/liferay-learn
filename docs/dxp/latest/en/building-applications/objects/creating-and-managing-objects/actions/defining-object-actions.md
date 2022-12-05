# Defining Object Actions

{bdg-secondary}`Available Liferay 7.4 U33+/GA33+`

Actions define custom operations triggered by object entry events. While an action is active, Liferay listens for when an object's data is added, deleted, or updated and then performs the set action.

Follow these steps to add an action:

1. Open the *Global Menu* ( ![Global Menu](../../../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Objects*.

1. Begin editing an object definition.

   ```{note}
   For DXP 7.4 U22, you can add actions to system objects.
   ```

1. Go to the *Actions* tab and click the *Add* button ( ![Add Button](../../../../images/icon-add.png) ).

1. In the Basic Info tab, enter a *name* and *description* for the action.

   ![Enter an action name and description in the Basic Info tab.](./defining-object-actions/images/01.png)

1. Go to the *Action Builder* tab to define the custom trigger, conditions, and action.

   ![Go to the Action Builder tab to define a custom trigger, conditions, and action.](./defining-object-actions/images/02.png)

1. For Trigger, determine *when* the action is performed.

   | Trigger | Description |
   | :--- | :--- |
   | On After Add| When an entry is added |
   | On After Delete | When an entry is deleted |
   | On After Update | When an entry is updated |

   ![Determine when the action is performed.](./defining-object-actions/images/03.png)

1. (Optional) Use expressions to set additional conditions for the trigger. Click the *Code* button ( ![Code](../../../../images/icon-code.png) ) to view available expressions.

   For Liferay 7.4 U33+ and GA33+, Liferay checks your expression for valid syntax when you click *Done*. If the expression is invalid, Liferay displays an error message.

   ![Use expressions to set additional conditions for the trigger.](./defining-object-actions/images/04.png)

1. For Action, select the type of action performed and fill out all additional fields. See [Understanding Action Types](./understanding-action-types.md#understanding-action-types) for more information.

1. Click *Save*.

Once created, the action is active and triggered according to your configuration.

If desired, you can deactivate an action by going to its *Basic Info* tab, toggling the *Active* switch, and clicking *Save*.

![Toggle the Active switch to deactivate the action.](./defining-object-actions/images/05.png)

## Additional Information

* [Creating Objects](../creating-objects.md)
* [Understanding Action Types](./understanding-action-types.md)
