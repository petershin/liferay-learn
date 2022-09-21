# Defining Object Actions

{bdg-secondary}`Available Liferay 7.4 U33+ and GA33+`

With Liferay Objects, you can define actions that are triggered under specified conditions. While an action is active, Liferay listens for when an Object's data is added, deleted, or updated and then performs the set action.

Currently, Liferay supports four action types:

* [Webhook actions](#webhook-actions) deliver a payload to a URL.

* [Groovy Script actions](#groovy-script-actions) execute custom [Groovy](https://groovy-lang.org/) scripts.

* [Notification actions](#notification-actions) send email notifications using a predefined template.

* [Add an Object Entry actions](#add-an-object-entry-actions) create entries in an active Object.

```{important}
Groovy script actions are not currently available on LXC.
```

Follow these steps to define actions for an Object:

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)), click on the *Control Panel* tab, and go to *Objects*.

1. Select an existing Object or [create a new one](./creating-objects.md).

   ```{note}
   Beginning with Liferay DXP 7.4 U22, you can add actions to system Objects.
   ```

1. While viewing the Object, select the *Actions* tab and click the *Add* button (![Add Button](../../../images/icon-add.png)).

1. In the Basic Info tab, enter a *name* and *description* for the action.

   ![Enter an action name and description in the Basic Info tab.](./defining-object-actions/images/01.png)

1. Go to the *Action Builder* tab to define a custom trigger, conditions, and action.

   ![Go to the Action Builder tab to define a custom trigger, conditions, and action.](./defining-object-actions/images/02.png)

1. For Trigger, determine *when* the action is performed.

   | Trigger | Description |
   | :--- | :--- |
   | On After Add| When an Object entry is added |
   | On After Delete | When an Object entry is deleted |
   | On After Update | When an Object entry is updated |

   ![Determine when the action is performed.](./defining-object-actions/images/03.png)

1. (Optional) After selecting a trigger, you can use expressions to set additional conditions for the trigger. Click the *Code* button ( ![Code](../../../images/icon-code.png) ) to view available expressions. <!--U30+/GA30+-->

   ![Use expressions to set additional conditions for the trigger.](./defining-object-actions/images/04.png)

   For Liferay 7.4 U33+ and GA33+, Liferay checks your expression for valid syntax when you click *Done*. If the expression is invalid, Liferay displays an error message.

1. For Action, select the type of action performed and fill out all additional fields. See [Understanding Action Types](#understanding-action-types) for more information.

1. Click *Save*.

Once created, the action is active and triggered according to your configuration.

If desired, you can deactivate an action by going to its *Basic Info* tab, toggling the *Active* switch, and clicking *Save*.

![Toggle the Active switch to deactivate the action.](./defining-object-actions/images/05.png)

## Understanding Action Types

### Webhook Actions

{bdg-secondary}`Available Liferay 7.4+`

*Webhook* actions deliver a data payload to a set URL. When you select this action type, you must enter the target URL. If applicable, you can also enter a secret.

![Enter a webhook URL and secret.](./defining-object-actions/images/06.png)

### Groovy Script Actions

{bdg-secondary}`Available Liferay 7.4 U27+ and GA27+`

*Groovy Script* actions execute custom Groovy scripts. When you select this action type, enter your script into the provided code window. For Liferay 7.4 U33+ and GA33+, Liferay uses the [GroovyShell class](https://docs.groovy-lang.org/latest/html/api/groovy/lang/GroovyShell.html) to check your Groovy scripts for valid syntax when you click *Save*. If the script is invalid, Liferay displays an error message.

![Enter your Groovy script.](./defining-object-actions/images/07.png)

### Notification Actions

{bdg-secondary}`Available Liferay 7.4 U32+ and GA32+`

Use *Notification* actions to automate email notifications for Object events. To use this action type, your instance must have a [configured mail server](../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md) and at least one [notification template](../../../process-automation/notifications/creating-notification-templates.md).

When you select this action type, you must select a notification template. This template determines the sender, recipient, and content for each email.

![Select a notification template.](./defining-object-actions/images/08.png)

### Add an Object Entry Actions

{bdg-secondary}`Available Liferay 7.4 U33+ and GA33+`

*Add an Object Entry* actions create entries in a specified Object. When you select this action type, you must choose an active Object. If the Object includes any required fields, you must also set predefined values for the new entries. You can enter these values directly or use expression builder to set values dynamically. If desired, you can also set values for non-mandatory fields.

![Select an active Object and enter predefined values for the created entries.](./defining-object-actions/images/09.png)

## Additional Information

* [Creating Objects](./creating-objects.md)
* [Adding Fields to Objects](../creating-and-managing-objects/adding-fields-to-objects.md)
* [Defining Object Relationships](../creating-and-managing-objects/defining-object-relationships.md)
