---
toc:
  - ./actions/defining-object-actions.md
  - ./actions/understanding-action-types.md
  - ./action/using-manual-actions.md
uuid: 22678165-9c15-45ec-9f59-73eb9e2769b8
---
# Actions

```{toctree}
:maxdepth: 3

actions/defining-object-actions.md
actions/understanding-action-types.md
actions/using-manual-actions.md
```

Object actions define custom business logic that you can run manually or automatically for object entry events. Examples include delivering entry event data to a webhook URL, sending email notifications after entry updates, and executing custom Groovy scripts after entry creation.

When using automatic triggers, Liferay listens for the event and then executes the operation according to predefined conditions. When using a manual trigger, Liferay adds the custom action to the Actions menu (![Actions Button](../../../images/icon-actions.png)) for object entries and generates a headless API for triggering it.

Liferay Objects provides these action types:

| Type | Description |
| :--- | :--- |
| [Add an Object Entry](./actions/understanding-action-types.md#add-an-object-entry) | Create entries in an active object. |
| [Groovy Script](./actions/understanding-action-types.md#groovy-script) | Execute [Groovy](https://groovy-lang.org/) scripts. |
| [Notification](./actions/understanding-action-types.md#notification) | Send email notifications using a predefined template. |
| [Update an Object Entry](./actions/understanding-action-types.md#update-an-object-entry) | Update fields in the current object entry. |
| [Webhook](./actions/understanding-action-types.md#webhook) | Deliver a payload to a URL. |

![Add actions to object definitions.](./actions/images/01.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Defining Object Actions
:link: ./actions/defining-object-actions.md
:::

:::{grid-item-card} Understanding Action Types
:link: ./actions/understanding-action-types.md
:::

:::{grid-item-card} Using Manual Actions
:link: ./actions/actions/using-manual-actions.md
:::
::::
