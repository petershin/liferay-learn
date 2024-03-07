---
uuid: b283ea94-6a1c-497b-8bfd-e9fd5aade789
---
# Implementing Business Logic

Business logic comprises the rules and processes that determine how an application behaves within a system to meet business needs. Implementing business logic effectively can streamline operations, improve efficiency, and promote consistency across your organization.

This article discusses the types of business logic you can implement with Liferay in the context of Clarity's distributor application solution. Now that you understand how Clarity has modeled the Distributor Application object, you can learn about how they use business logic to define application behavior. Implementing business logic allows Clarity to onboard distributors quickly and safely.

## Validations

So far, Clarity has no way to ensure applicants provide valid, consistent data in their distributor applications. Validations set rules to ensure user input meets your criteria. By preventing data errors and reducing the need for manual cleanup, validations improve the integrity of gathered data. 

Liferay provides built-in validation functions for email addresses, phone numbers, and website URLs. You can add validation rules directly to object definition fields, have them trigger on submission of an object entry, and display an error message for invalid input.

<!--IMAGE: Screenshot example of adding a validation in Liferay UI -->

## Permissions

In addition to validating input fields, Clarity wants to ensure that all authorized users (and only authorized users) can submit distributor applications. To do this, they have modified the *User* role with permissions to create, read, update, and delete Distributor Application object entries. 

Clarity also wants to allow only members of the business development team to view submitted applications and fill out evaluations. To achieve this, they have created two roles, Business Development Specialist and Business Development Manager. Both roles have read permissions for Distributor Application object entries and create, read, update, and delete permissions for Application Evaluation object entries. A user must be assigned one of these roles to view applications and submit evaluations.

<!--IMAGE: Screenshot(s) of Roles UI with Business Development Specialist and Business Development Manager Roles and corresponding permissions-->

Managing access to data with account membership and role permissions is critical for data privacy and security. You can manage permissions at the application and entry levels. 

## States

After configuring user permissions for accessing object data, Clarity now needs a way to track the progress of a distributor application and trigger additional business logic when application entries reach certain statuses. To do this, they leveraged Liferay's custom state field capability through the following steps:

1. Create a picklist of *Application States*: `Open`, `Under Review`, `Approved`, `Denied`, `Withdrawn`, and `On Hold`.

1. Add a new picklist field called *Application State* to the Distributor Application object definition. This field uses the *Application States* picklist from step 1 as its set of valid input. Make sure to toggle the *Mark as State* option for the new field.

1. Use the *State Manager* tab in the UI for Distributor Application to define the state flow as follows:

    | Current State | Next State                            |
    | ------------- | ------------------------------------- |
    | Open          | Under Review, Withdrawn               |
    | Under Review  | Approved, Denied, Withdrawn, On Hold  |
    | Approved      | Under Review                          |
    | Denied        | Under Review                          |
    | Withdrawn     | Open                                  |
    | On Hold       | Open, Under Review                    |


<!--IMAGE: State diagram to better visualize how the application states are related to one another -->

When users update the *Application State* field of a Distributor Application object entry, their picklist options are determined by the state flow table. 

## Workflows

Currently, all updates to the *Application State* field are approved automatically, regardless of the current state value. Clarity wants to require final approval from a Business Development Manager whenever *Application State* changes to `Approved` or `Denied`. You can define additional custom business logic around states by implementing an approval workflow with Liferay's Client Extension functionality.

<!--IMAGE: Diagram of the approval workflow client extension. Show components described in courses/application-development/implementing-business-logic/adding-an-approval-workflow -->

Workflows can improve task visibility, eliminate bottlenecks in business processes, and reduce the time and resources required to complete tasks. 

## Notifications

While Clarity has defined workflows around state changes, they have no automated notifications for when such events occur. As of now, members of the business development team can only learn of new application submissions by checking the Distributor Application object manually. Similarly, applicants can only learn about their application status if they are informed directly by a business development specialist or manager. This strategy doesn't scale and leaves room for human error, resulting in missed opportunities or poor user experience.

To address these issues, you can implement notifications by first creating notification templates and then applying those templates to object entry events (entry creation, entry update, etc.). The template provides the notification content and design, while the object entry event determines the condition to trigger the notification. Notifications can improve visibility in your application by providing real-time updates to users and administrators for object entry events.

<!--IMAGE: Diagram of different types of notifications needed for different recipients (see /courses/application-development/implementing-business-logic/adding-notification-templates), along with screenshot of template creation. -->

Now that you've learned about implementing business logic in low code applications, let's move on to [Designing User Interfaces](./designing-user-interfaces.md)

## Additional Resources

[Client Extensions](https://learn.liferay.com/web/guest/w/dxp/building-applications/client-extensions)