# Automating Notifications

Notifications can improve visibility in your application by providing real-time updates to users and system administrators for object entry events. With Liferay, this involves creating notification templates and then using those templates with object actions. The template provides the notification content and design, while the object action determines the trigger and conditions for when the notification is sent<!--ALT: for sending the notification--> (e.g., at entry creation, at entry update). <!--REFINE-->

<!-- Diagram? -->

To this point, Delectable Bonsai's Distributor Application has no automated notifications for entry events. This means administrators must regularly check the application table to learn of new submissions, as well as manually inform applicants on the status of their applications. Relying on _ does not scale and leaves room for human error, resulting in missed opportunities or poor user experience.

Delectable Bonsai needs to automate notifications for administrators and applicants. To do this, first create the desired email or user notification template. Then add a notification action to your object definition that uses the notification template.

Next: [Adding Notification Templates for Distributor Application](./automating-notifications/adding-notification-templates-for-distributor-application.md)

## Relevant Concepts

* [Creating Notification Templates](https://learn.liferay.com/w/dxp/process-automation/notifications/creating-notification-templates)
* [Defining Object Actions](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/actions/defining-object-actions)
* [Notification Actions](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/actions/understanding-action-types#notification)
