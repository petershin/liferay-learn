---
uuid: 4eea6cd8-f95c-428d-9b9f-ee2292b0e675
---
# Understanding Action Types

Actions define custom operations triggered by object entry events. Liferay provides these action types:

| Type | Description |
| :--- | :--- |
| [Add an Object Entry](#add-an-object-entry) | Create entries in an active object. |
| [Groovy Script](#groovy-script) | Execute custom [Groovy](https://groovy-lang.org/) scripts. |
| [Notification](#notification) | Send email notifications using a predefined template. |
| [Update an Object Entry](#update-an-object-entry) | Update fields in the current object entry. |
| [Webhook](#webhook) | Deliver a payload to a URL. |

```{important}
Groovy script actions are only available for Liferay Experience Cloud Self-Managed and Liferay DXP Self-Hosted.
```

## Add an Object Entry

{bdg-secondary}`Available Liferay 7.4 U33+/GA33+`

*Add an Object Entry* creates an entry in a specified object. Example use cases include

* <!---->
* <!---->
* <!---->

When using this type, you must select an active object. You can then set predefined values for the entry's fields. Enter these values directly or click the *Code* button ( ![Code](../../../../images/icon-code.png) ) to use expressions that set values dynamically. If the object includes required fields, you must set predefined values for them.

![Select an active object and enter predefined values for the created entries.](./understanding-action-types/images/01.png)

## Groovy Script

{bdg-secondary}`Available Liferay 7.4 U27+/GA27+`

*Groovy Script* actions execute Groovy scripts. Example use cases include

* <!---->
* <!---->
* <!---->

When using this type, enter your script into the provided code window. For Liferay 7.4 U33+/GA33+, Liferay uses the [GroovyShell class](https://docs.groovy-lang.org/latest/html/api/groovy/lang/GroovyShell.html) to validate Groovy script syntax when you click Save. If the script is invalid, Liferay displays a general error message.

![Enter your Groovy script.](./understanding-action-types/images/02.png)

## Notification

{bdg-secondary}`Available Liferay 7.4 U60+/GA60+`

Use *Notification* actions to automate user and email notifications for object events. Example use cases include

* <!---->
* <!---->
* <!---->

When using this type, you must select a notification template to determine the sender, recipient, and content for each message.

Using notifications requires at least one [notification template](../../../../process-automation/notifications/creating-notification-templates.md). For email notifications, your instance also requires a [configured mail server](../../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md).

![Select a notification template.](./understanding-action-types/images/03.png)

## Update an Object Entry

{bdg-secondary}`Available Liferay 7.4 U60+/GA60+`

Update one or more fields in the current object entry. Example use cases include

* <!--Setting a boolean field to `true` after users download a file-->
* <!--Updating assignee field based on status-->
* <!---->

When using this type, you must select the field(s) you want to update in the current entry and enter new values. You can enter these values directly or click the *Code* button ( ![Code](../../../../images/icon-code.png) ) to use expressions that set values dynamically.

![Select the fields from the current object entry that you want to edit and enter default values.](./understanding-action-types/images/04.png)

## Webhook

{bdg-secondary}`Available Liferay 7.4+`

*Webhook* actions deliver a data payload to a set URL. Example use cases include

* <!---->
* <!---->
* <!---->

When using this type, you must enter a target URL. If applicable, enter a secret.

![Enter a webhook URL and secret.](./understanding-action-types/images/05.png)

## Additional Information

* [Creating Objects](../creating-objects.md)
* [Defining Object Actions](./defining-object-actions.md)
