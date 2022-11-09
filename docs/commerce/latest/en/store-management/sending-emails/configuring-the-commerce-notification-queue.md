# Configuring the Commerce Notification Queue

When an event triggers a notification (for instance, when an order is placed), it is logged in the channel's *Notification Queue* tab with the `Unsent` status. The Liferay instance checks for notifications in the queue every 15 minutes and sends them if they are in the `Unsent` status. If a notification is in the `Unsent` status after 43200 minutes (30 days), it is deleted.

You can change these intervals in the system settings of your instance.

1. Open the Global Menu and navigate to *Control Panel* &rarr; *Configuration* &rarr; *System Settings*.

1. Click *Orders* and then select *Commerce Notification Queue*. The default values are in minutes. You can change the values for the *Notification Queue Entry Check Interval* and the *Notification Queue Entry Delete Interval* here.

   ![Change the default values for the Notification Queue Entry Check and Delete Intervals](./configuring-the-commerce-notification-queue/images/01.png)

1. Click *Save*.

## Additional Information

* [Using Notification Templates](./using-notification-templates.md)
