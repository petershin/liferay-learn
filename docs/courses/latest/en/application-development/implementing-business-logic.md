---
toc: 
  - ./implementing-business-logic/validating-fields.md
  - ./implementing-business-logic/managing-access-to-data.md
  - ./implementing-business-logic/defining-a-state-field.md
  - ./implementing-business-logic/adding-an-approval-workflow.md
  - ./implementing-business-logic/adding-notification-templates.md
  - ./implementing-business-logic/adding-notification-actions.md
  - ./implementing-business-logic/automating-account-creation.md
uuid: f13a53c0-dc4b-4a84-b606-fe156705756f
---
# Implementing Business Logic

Business logic refers to the rules and processes that determine how an application behaves within a system to meet business needs. Implementing business logic effectively can streamline operations, improve efficiency, and promote consistency across your organization.

Examples include,

* [Validating Fields](#validations)
* [Managing Data Access](#permissions)
* [Defining Workflows](#workflows)
* [Automating Notifications](#notifications)

<!--TASK:
* Integrating with External Systems
* Calculations
* Data Transformation
* Localization
* Logging

Use cron...
-->

## Validations

Validations set rules for ensuring user input meets your criteria. By validating data at the point of entry, applications can ensure the data meets the required format, type, and constraints, preventing data errors and reducing the need for manual data cleanup. In this way, validations can improve the integrity and consistency of gathered data (e.g., email addresses, phone numbers). Here, you'll add validation rules directly to your object definition. Liferay uses these rules to check field values upon entry submission. If the value is invalid, Liferay displays an error message.

![Liferay uses validation rules to check field values upon entry submission.](./implementing-business-logic/images/01.png)

## Permissions

Managing access to data is essential to data privacy and security. You can restrict access to sensitive object data using role permissions and account membership. These permission can be managed at the application and entry levels.

![Use permissions and account membership to manage access to object data.](./implementing-business-logic/images/02.png)

## Workflows

Workflows define approval processes for application entities and can improve task visibility, eliminate bottlenecks in business processes, and reduce the time and resources required to complete tasks. You can build and enable custom approval processes for custom objects. Additionally, you can use picklists to define custom state fields with their own flow.

![Add state fields to your object.](./implementing-business-logic/images/03.png)

## Notifications

Notifications can improve visibility in your application by providing real-time updates to users and system administrators for object entry events. This involves creating notification templates and then using those templates with object actions. The template provides the notification content and design, while the object action determines the trigger and conditions for sending the notification (e.g., at entry creation, at entry update).

![Use notification templates with object actions to automate notifications for entry events.](./implementing-business-logic/images/04.png)

## Implementing Business Logic for the Distributor Application Flow

Having modeled the Distributor Application object, you can begin incorporating this logic to ensure your solution meets Delectable Bonsai's business requirements. Once implemented, they can onboard distributors quickly and safely.

Ready?

[Let's Go!](./implementing-business-logic/validating-fields.md)
