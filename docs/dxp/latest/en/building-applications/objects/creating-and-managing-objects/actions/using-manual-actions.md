---
uuid: 29b299d7-f4aa-4ce7-b016-a16414b6dc83
---
# Using Manual Actions

When you use a standalone trigger in an object action, the action becomes manual, meaning it must be explicitly run in one of two ways:

* by a user via the object definition's UI
* with a call to the headless API

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

For each standalone action, Liferay generates two PUT APIs, one that uses the entry's ID and another that uses the entry's External Reference Code (ERC).

![Liferay generates two PUT APIs, one that uses the entry's ID and another that uses the entry's ERC.](./using-manual-actions/images/03.png)

Calling either API triggers the action for the specified entry.

![Calling the API triggers the action for the specified entry.](./using-manual-actions/images/04.png)

## Additional Information

* [Defining Object Actions](./defining-object-actions.md)
* [Understanding Action Types](./understanding-action-types.md)
* [Headless Framework Integration](../../understanding-object-integrations/headless-framework-integration.md)
