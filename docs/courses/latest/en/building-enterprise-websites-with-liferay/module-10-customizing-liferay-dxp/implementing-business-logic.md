---
uuid: 2eb00722-fae9-46ca-b482-1f13dd40d34f
---
# Implementing Business Logic

<!--TASK: improve intro-->

Business logic refers to the rules and processes that determine how a solution behaves within Liferay DXP. Implementing business logic effectively can streamline operations, improve efficiency, and promote consistency across your organization. Here we'll explore how Clarity can leverage Liferay's features to add business logic to their distributor onboarding solution.

## Validating Fields

Data integrity is crucial for effective business operations. With Liferay, you can set object validations to enforce rules on user input to prevent errors and ensure your application is collecting the data you want. This minimizes the need for manual corrections and makes your data more consistent and reliable (e.g., valid email formats and phone number patterns).

When using validations, you can select from out-of-the-box options or define your own through the UI. For advanced use cases, you can also use the Object Validation Rule client extension. Once defined, Liferay checks field values on entry submission and displays an error message for invalid input.

![Liferay uses validation rules to check field values upon entry submission.](./implementing-business-logic/images/01.png)

Clarity’s Distributor Application object already includes the validations they need. To view them, open the Objects application, begin editing the Distributor Application object, and go to the Validations tab.

## Defining Workflows

<!-- TASK: Mention the workflow action client extensions here. -->

Workflows are approval processes for data entities in your solution. You can create custom workflows to improve task visibility, eliminate bottlenecks in business processes, and reduce the time and resources required to complete tasks.

![Workflows are used to organize business processes.](./implementing-business-logic/images/02.png)

In addition to workflows, you can use picklists to define custom state fields with their own flow. This is helpful when you need to assign multiple states to an object entry at the same time. For example, Clarity wants to track the evaluation state of applications independently from their workflow status. To implement this, Clarity leveraged Liferay picklists with objects to define custom states for entries. They then defined a flow for valid state field transitions in the *State Manager* tab.

| Current State | Next State                           |
|---------------|--------------------------------------|
| Open          | Under Review, Withdrawn              |
| Under Review  | Approved, Denied, Withdrawn, On Hold |
| Approved      | Under Review                         |
| Denied        | Under Review                         |
| Withdrawn     | Open                                 |
| On Hold       | Open, Under Review                   |

![The application states are related to one another.](./implementing-business-logic/images/03.png)

After setting this up, Clarity can use the field with validations and actions to add business logic for different states. They also can use the field alongside workflow statuses to define more complex review and approval processes. In a later exercise, you'll finish setting up Clarity's workflow for Distributor Applications.

## Automating Notifications

<!-- TASK: Mention the notification client extension here. -->

Notifications improve visibility in your application by providing real-time updates to users and system administrators for object events. This involves creating notification templates and then using those templates with object actions. The template provides the notification content and design, while the object action determines the trigger and conditions for sending the notification (e.g., at object creation, at object update).

<!--TASK: ![]()-->

Currently, Clarity's onboarding solution includes three automated notifications that inform applicants when their applications are received, approved, or rejected. In a later exercise, you'll add another notification for informing Clarity's business development team of new submissions.

<!--TASK: Add section that encompasses other advanced types of business logic (e.g., automating account creation using the object action client extension)-->

## Conclusion

Congratulations! You've learned about the types of business logic you can implement for custom solutions in Liferay and how this implementation can improve the platform experience. Next, you'll apply what you've learned to add business logic to Clarity's distributor solution. 

Up Next: [Adding Business Logic to Clarity's Solution](./adding-business-logic-to-claritys-solution.md)