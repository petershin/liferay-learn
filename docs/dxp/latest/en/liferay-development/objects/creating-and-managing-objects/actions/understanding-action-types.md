---
uuid: 4eea6cd8-f95c-428d-9b9f-ee2292b0e675
taxonomy-category-names:
- Development and Tooling
- Objects
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Understanding Action Types

{bdg-secondary}`Liferay 7.4 U60+/GA60+`

Actions define custom operations triggered by object entry events. Liferay provides these action types:

| Type                                              | Description                                                   |
| :------------------------------------------------ | :------------------------------------------------------------ |
| [Notification](#notification)                     | Send email or user notifications using a predefined template. |
| [Add an Object Entry](#add-an-object-entry)       | Create entries in an active object.                           |
| [Update an Object Entry](#update-an-object-entry) | Update fields in the current object entry.                    |
| [Webhook](#webhook)                               | Deliver a payload to a URL.                                   |
| [Groovy Script](#groovy-script)                   | Execute [Groovy](https://groovy-lang.org/) scripts.           |

!!! important
    * Groovy script actions are only available for Liferay PaaS and Liferay DXP Self-Hosted.
    * As of DXP 2024.Q2/Portal 7.4 GA120, scripting is disabled by default. You can enable it in System Settings &rarr; Script Management (under the Security category).

<!--TASK: When Client Extensions documentation is ready, note that you can create custom object actions. -->

## Notification

Use a notification action to send user or email notifications for object entries. Example use cases include

* Automatically sending email notifications for new orders
* Automatically sending user notifications for ticket updates within a custom ticketing system
* Manually sending email notifications to remind users of tasks and events

You must select a [notification template](../../../../process-automation/notifications/creating-notification-templates.md) to determine the sender, recipient, and content for each message. For email notifications, your instance also requires a [configured mail server](../../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md).

![Select a notification template.](./understanding-action-types/images/01.png)

If the out-of-the-box notification types don't meet your needs, you can create custom notification types using client extensions. See [Microservice Client Extensions](../../../integrating-microservices.md) for more information.

## Add an Object Entry

Create an entry in a specified object. Example use cases include

* Automatically adding entries in a custom Shipments object when orders are paid
* Automatically adding a default user for new accounts
* Manually adding a child ticket to the current ticket within a custom ticketing system

You must select an active object. You can then set predefined values for the entry's fields. Enter these values directly or click *Code* ( ![Code](../../../../images/icon-code.png) ) to use expressions that set values dynamically. If the object includes required fields, you must set predefined values for them.

![Select an active object and enter predefined values for the created entries.](./understanding-action-types/images/02.png)

## Update an Object Entry

Update one or more fields in the current object entry. Example use cases include

* Automatically updating an entry's boolean field to `true` after users download its attached file
* Manually updating a ticket's assignee to the current user when clicking a button
* Automatically updating an entry's boolean field to `true` after users favorite it

You must select the field(s) to update in the current entry and enter new values. You can enter these values directly or click *Code* ( ![Code](../../../../images/icon-code.png) ) to use expressions that set values dynamically.

![Select the fields from the current object entry that you want to edit and enter default values.](./understanding-action-types/images/03.png)

## Webhook

Webhook actions deliver a data payload to a set URL. You must enter a target URL. If applicable, enter a secret.

![Enter a webhook URL and secret.](./understanding-action-types/images/04.png)

<!--TASK: When Client Extensions documentation is ready, recommend using client extensions instead, since it can include OAuth. -->

## Groovy Script

!!! important
    As of DXP 2024.Q2/Portal 7.4 GA120, scripting is disabled by default. You can enable it in System Settings &rarr; Script Management (under the Security category).

Groovy Script actions execute Groovy scripts. Enter your script into the provided code window. For Liferay 7.4 U33+/GA33+, Liferay uses the [GroovyShell class](https://docs.groovy-lang.org/latest/html/api/groovy/lang/GroovyShell.html) to validate Groovy script syntax when you click Save. If the script is invalid, Liferay displays a general error message.

![Enter your Groovy script.](./understanding-action-types/images/05.png)

<!--TASK: When Client Extensions documentation is ready, recommend custom object actions instead of groovy scripts due to limitations. -->

## Related Topics

* [Creating Objects](../creating-objects.md)
* [Defining Object Actions](./defining-object-actions.md)
