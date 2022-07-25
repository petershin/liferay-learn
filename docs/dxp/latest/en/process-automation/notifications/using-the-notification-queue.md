# Using the Notification Queue

{bdg-secondary}`Available Liferay 7.4 U34+ and GA34+`

Liferay provides the Notification Queue application for reviewing email notifications triggered by an Object action. You can verify the status of notifications and resend them if needed. 

![Review email notifications in the Notification Queue application.](./using-the-notification-queue/images/01.png)

The application lists the following details for each notification: 

| Column | Description |
| :--- | :--- |
| Subject | The notification's subject, which is set in the notification's [template](). |
| Trigger By | The Object responsible for triggering the [notification action](). |
| From | The notification's sender, which is set in the notification's [template](). |
| To | The notification's recipients, which is set in the notification's [template](). |
| Status | Indicates the status of the notification, whether it was sent (*Sent*) or is in the process of sending (*Unsent*) <!-- 'Unsent' could be confusing in this context. --> |

Click the *Actions* button (![Actions Button]()) for an entry to *delete* it or *resend* the notification. 

![Delete entries or resend notifications.](./using-the-notification-queue/images/02.png)
