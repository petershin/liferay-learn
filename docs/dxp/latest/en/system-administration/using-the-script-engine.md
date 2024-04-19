---
toc:
  - ./using-the-script-engine/invoking-liferay-services-from-scripts.md
  - ./using-the-script-engine/running-scripts-from-the-script-console.md
  - ./using-the-script-engine/script-examples.md
uuid: 756d2941-d124-4471-b89c-a4ff6d38a5ff
taxonomy-category-names:
- Development and Tooling
- Developer Tools
- Liferay Self-Hosted
- Liferay PaaS
---
# Using the Script Engine

Liferay provides a robust script engine for executing [Groovy](http://groovy-lang.org/) scripts to maintain your Liferay DXP instance. You can execute scripts to perform maintenance tasks involving data cleanup, user maintenance operations, bulk Liferay API invocations, or even system level operations.

In self-hosted or PaaS instances, you can leverage scripts in multiple applications:

- [Object actions](../../liferay-development/objects/creating-and-managing-objects/actions.md)
- [Object validations](../../liferay-development/objects/creating-and-managing-objects/validations.md)
- [Workflow](../../process-automation/workflow/developer-guide/using-the-script-engine-in-workflow.md)
- [The script console](./using-the-script-engine/running-scripts-from-the-script-console.md)

![The Script Console executes Groovy scripts and provides context variables, such as the current actionRequest. The Script Console was designed for invoking Liferay Services.](./using-the-script-engine/images/01.png)

Beginning in DXP 2024.Q2/Portal 7.4 GA120, scripting is disabled by default in workflow and objects (validations and actions). Administrators won't even see the option for creating or executing scripts unless permission is granted explicitly by a system-level administrator.

## Enabling Scripting

To enable scripting for administrative users of workflow and objects,

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *System Settings* (in the Configuration section).

1. From the Security category click _Script Management_.

1. Check the box to enable scripting.

1. Click _Save_.

Once enabled, administrative applications that can leverage scripting will display the option to users:

![You can enable scripting in supported applications.](./scripting/images/03.png)

## Navigating to the Script Engine

The Script Console is available in the Control Panel. To use it, follow these steps:

1. Log in as an administrator.
1. Open the [Product Menu](../getting-started/navigating-dxp.md) and navigate to the Control Panel and select *Configuration* &rarr; *Server Administration* &rarr; *Script*.

    ![The Script Console is a tab within the System Administration menu.](./using-the-script-engine/images/02.png)

## Related Topics

* [Invoking Liferay Services](./using-the-script-engine/invoking-liferay-services-from-scripts.md)
* [Running Scripts from the Script Console](./using-the-script-engine/running-scripts-from-the-script-console.md)
* [Script Console Examples](./using-the-script-engine/script-examples.md)
* [Using the Script Engine with Workflow](../process-automation/workflow/developer-guide/using-the-script-engine-in-workflow.md)
* [Object Actions](../liferay-development/objects/creating-and-managing-objects/actions.md)
* [Object Validations](../liferay-development/objects/creating-and-managing-objects/validations.md)
