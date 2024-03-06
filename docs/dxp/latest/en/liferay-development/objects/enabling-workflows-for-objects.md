---
uuid: ca5013e4-22f9-4579-a747-9608f04748ec
taxonomy-category-names:
- Platform
- Workflow
- Liferay Self-Hosted
- Liferay PaaS
---
# Enabling Workflow for Objects

{bdg-secondary}`Liferay 7.4+`

Every published object is integrated automatically with the Workflow framework, so you can direct object entry creation through a defined review and approval process. How you enable a Workflow for an object depends on the object's scope: [Company](#company-scoped-objects) or [Site](#site-scoped-objects).

See [Workflow](../../process-automation/workflow.md) documentation to learn more about general workflow features.

## Company-Scoped Objects

Follow these steps to enable a custom Workflow for a company-scoped object:

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Applications* tab, and click *Process Builder*.

1. Click the *Configuration* tab.

   ![Go to Process Builder and click the Configuration tab.](./enabling-workflows-for-objects/images/01.png)

1. Click *Edit* for the desired object.

1. Select the desired *Workflow*.

1. Click *Save*.

## Site-Scoped Objects

Follow these steps to enable a custom Workflow for a site-scoped object:

1. Open the *Site Menu* (![Site Menu](../../images/icon-menu.png)) &rarr; *Configuration* &rarr; *Workflow*.

   ![Open the Workflow application in the desired Site.](./enabling-workflows-for-objects/images/02.png)

1. Click *Edit* for the desired object.

1. Select the desired *Workflow*.

1. Click *Save*.

## Related Topics

* [Objects](../objects.md)
* [Creating Objects](./creating-and-managing-objects/creating-objects.md)
* [Adding and Managing Custom States](./creating-and-managing-objects/fields/adding-and-managing-custom-states.md)
