---
toc:
- ./actions/defining-object-actions.md
- ./actions/understanding-action-types.md
---
# Actions

```{toctree}
:maxdepth: 3

actions/defining-object-actions.md
actions/understanding-action-types.md
```

Actions define custom operations triggered by object entry events. While an action is active, Liferay listens for when users add, delete, or update entries and then performs the set action.

![Add actions to object definitions.](./actions/images/01.png)

Liferay provides these action types:

| Action Type | Description |
| :--- | :--- |
| [Webhook](./actions/understanding-action-types.md#webhook-actions) | Deliver a payload to a URL. |
| [Groovy Script](./actions/understanding-action-types.md#groovy-script-actions) | Execute custom [Groovy](https://groovy-lang.org/) scripts. |
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
