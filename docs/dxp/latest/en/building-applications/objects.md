---
toc:
  - ./objects/creating-and-managing-objects.md
  - ./objects/using-forms-with-objects.md
  - ./objects/using-fragments-to-build-forms.md
  - ./objects/deploying-object-widgets-to-sites.md
  - ./objects/displaying-object-entries.md
  - ./objects/displaying-object-entries-with-collection-providers.md
  - ./objects/enabling-workflows-for-objects.md
  - ./objects/picklists.md
  - ./objects/understanding-object-integrations.md
  - ./objects/objects-application-permissions.md
  - ./objects/integrating-objects-with-third-party-services.md
uuid: 58767c90-dc9b-4aad-b650-b6beb9dcce77
---
# Objects

{bdg-secondary}`Liferay 7.4+`

With Liferay Objects, you can build and deliver applications without having to write code or deploy modules. Each application built with Objects is integrated with Liferay's core frameworks, so you can quickly develop and manage flexible solutions that adapt Liferay DXP to your business needs while maintaining a seamless user experience.

When creating an Object, you can define its data [fields](./objects/creating-and-managing-objects/fields.md), add [relationships](./objects/creating-and-managing-objects/relationships.md) to other Object entries, and trigger [actions](./objects/creating-and-managing-objects/actions.md) under specified conditions. You can also design [layouts](./objects/creating-and-managing-objects/layouts.md) and [views](./objects/creating-and-managing-objects/views.md) to determine how fields and relationships are displayed during entry creation and in the Object's application page.

Before publishing, you can scope each Object's data to Company or Site and determine where it's displayed in the Liferay UI.

From the time of creation, all Objects are fully integrated with Liferay's [core frameworks](./core-frameworks.md) to provide a unified experience across the platform and leverage all of Liferay's capabilities. This includes automatically generating [Headless REST APIs](./objects/understanding-object-integrations/using-custom-object-apis.md) for every Object, so you can interact with your Objects through defined endpoints. These APIs can also be used with the [Job Scheduler](./core-frameworks/job-scheduler-framework/using-job-scheduler.md) integration to configure Talend jobs to sync Object data dynamically with external systems.

Every Object is integrated with [Workflows](./objects/enabling-workflows-for-objects.md), so you can guide Object entry creation through a defined review and approval process. Objects are also integrated with [Forms](objects/using-forms-with-objects.md), so you can design forms that map to Object fields and receive user input for creating Object entries.

Once entries are created, you can leverage Liferay's Info framework to create dynamic user experiences, [displaying Object entries](./objects/displaying-object-entries.md) with Page Fragments and Display Page Templates. As of Liferay DXP 7.4 U1 and Liferay Portal 7.4 GA5, you can also [deploy an Object to Site Pages](./objects/deploying-object-widgets-to-sites.md) as a widget.

All Objects are integrated with Liferay's [Permissions framework](./objects/understanding-object-integrations/permissions-framework-integration.md), so you can assign application and resource permissions to manage access to Objects and their entries. Together with scoping, role-based access control can help you secure your data and ensure it can only be accessed by the appropriate users.

With Objects, you can also extend and configure [system services](./objects/creating-and-managing-objects/extending-system-objects.md) registered with the Objects framework. This includes adding custom relationships and actions. <!--TASK: Add fields when ready.-->

See [Creating Objects](./objects/creating-and-managing-objects/creating-objects.md) to get started building custom applications or [Understanding Object Integrations](./objects/understanding-object-integrations.md) to learn more about how Objects leverages Liferay's core frameworks.

```{raw} html
:file: ../landingpage_template.html
```

```{raw} html
:file: objects/landing.html
```
