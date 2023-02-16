---
toc:
  - ./actions/defining-object-actions.md
  - ./actions/understanding-action-types.md
uuid: 22678165-9c15-45ec-9f59-73eb9e2769b8
---
# Actions

```{toctree}
:maxdepth: 3

actions/defining-object-actions.md
actions/understanding-action-types.md
```

Actions define operations triggered by object entry events. Liferay listens for the event---add, delete, or update---and executes the operation.

![Add actions to object definitions.](./actions/images/01.png)

Liferay provides these action types:

| Action Type | Description |
| :--- | :--- |
| [Webhook](./actions/understanding-action-types.md#webhook-actions) | Deliver a payload to a URL. |
| [Groovy Script](./actions/understanding-action-types.md#groovy-script-actions) | Execute [Groovy](https://groovy-lang.org/) scripts. |
| [Notification](./actions/understanding-action-types.md#notification-actions) | Send email notifications using a predefined template. |
| [Add an Object Entry](./actions/understanding-action-types.md#add-an-object-entry-actions) | Create entries in an active object. |

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Defining Object Actions
:link: ./actions/defining-object-actions.md
:::

:::{grid-item-card} Understanding Action Types
:link: ./actions/understanding-action-types.md
:::
::::
