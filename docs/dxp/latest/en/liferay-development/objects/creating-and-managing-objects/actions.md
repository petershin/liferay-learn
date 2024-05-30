---
toc:
  - ./actions/defining-object-actions.md
  - ./actions/understanding-action-types.md
  - ./actions/using-manual-actions.md
uuid: 22678165-9c15-45ec-9f59-73eb9e2769b8
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Actions

Object actions define custom business logic that you can run manually or automatically for object entry events. Examples include delivering entry event data to a webhook URL, sending email notifications after entry updates, and executing custom Groovy scripts after entry creation.

When using automatic triggers, Liferay listens for the event and executes the operation automatically according to predefined conditions. 

When using the standalone trigger, Liferay adds the action to the Actions menu ( ![Actions Button](../../../images/icon-actions.png) ) for object entries and generates a headless API to trigger it. The action must be run manually, but you can map the action to a button fragment. See [Using Manual Actions](./actions/using-manual-actions.md) to learn more about manual actions.

![Add actions to object definitions.](./actions/images/01.png)

Liferay Objects provides these action types:

| Type | Description |
| :--- | :--- |
| Notification | Send email or user notifications using a predefined template. |
| Add an Object Entry | Create entries in an active object. |
| Update an Object Entry | Update fields in the current object entry. |
| Webhook | Deliver a payload to a URL. |
| Groovy Script | Execute [Groovy](https://groovy-lang.org/) scripts. |

!!! important
    * Groovy script actions are only available for Liferay PaaS and Liferay DXP Self-Hosted.
    * As of DXP 2024.Q3, scripting is disabled by default. You can enable it in System Settings &rarr; Script Management (under the Security category).

<!--TASK: When client extensions docs are ready, mention being able to add Action Types and Notification Types.-->


::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Defining Object Actions
:link: ./actions/defining-object-actions.md
:::

:::{grid-item-card} Understanding Action Types
:link: ./actions/understanding-action-types.md
:::

:::{grid-item-card} Using Manual Actions
:link: ./actions/using-manual-actions.md
:::
::::
