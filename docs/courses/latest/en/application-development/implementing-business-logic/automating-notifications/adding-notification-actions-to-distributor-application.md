# Adding Notification Actions to Distributor Application

Delectable Bonsai wants to improve visibility for the applications they receive. The first two actions trigger when an entry is created. The other two depend on status updates. <!--FINISH-->

![Add notifications actions to Distributor Application.](./adding-notification-actions-to-distributor-application/images/01.png)

## Action for Application Submitted

1. Open the *Global Menu* ( ![Global Menu](../../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Objects*.

1. Begin editing the *Distributer Application* object.

1. Go to the *Actions* tab and click *Add* ( ![Add Button](../../../images/icon-add.png) ).

1. Enter these values in the Basic Info tab:

   | Field        | Value                                                     |
   |:-------------|:----------------------------------------------------------|
   | Action Label | Application Submitted                                     |
   | Action Name  | applicationSubmitted                                      |
   | Description  | On After Add, send notifications to administrative users. |
   | Active       | True                                                      |

   ![Enter these values in the Basic Info tab.](./adding-notification-actions-to-distributor-application/images/02.png)

1. Go to the *Action Builder* tab and set these values:

   | Field                 | Value                              |
   |:----------------------|:-----------------------------------|
   | Trigger               | On After Add                       |
   | Condition             | N/A                                |
   | Action                | Notification                       |
   | Notification Template | Application Submitted, Admin, User |

   ![Enter these values in the Action Builder tab.](./adding-notification-actions-to-distributor-application/images/03.png)

1. Click *Save*.

## Action for Application Received

1. In the *Actions* tab, click *Add* ( ![Add Button](../../../images/icon-add.png) ).

1. Enter these values for Basic Info:

   | Field        | Value                                           |
   |:-------------|:------------------------------------------------|
   | Action Label | Application Received                            |
   | Action Name  | applicationReceived                             |
   | Description  | On After Add, send notifications to applicants. |
   | Active       | True                                            |

1. Go to the *Action Builder* tab and set these values:

   | Field                 | Value                                  |
   |:----------------------|:---------------------------------------|
   | Trigger               | On After Add                           |
   | Condition             | N/A                                    |
   | Action                | Notification                           |
   | Notification Template | Application Received, Applicant, Email |

1. Click *Save*.

## Action for Application Approved

1. In the *Actions* tab, click *Add* ( ![Add Button](../../../images/icon-add.png) ).

1. Enter these values for Basic Info:

   | Field        | Value                                                                       |
   |:-------------|:----------------------------------------------------------------------------|
   | Action Label | Application Approved                                                        |
   | Action Name  | applicationApproved                                                         |
   | Description  | On After Update, send notifications to applicants when state is 'Approved'. |
   | Active       | True                                                                        |

1. Go to the *Action Builder* tab and set these values:

   | Field                 | Value                                            |
   |:----------------------|:-------------------------------------------------|
   | Trigger               | On After Update                                  |
   | Condition             | `applicationState == "approved" AND status == 0` |
   | Action                | Notification                                     |
   | Notification Template | Application Approved, Applicant, Email           |

1. Click *Save*.

## Action for Application Denied

1. In the *Actions* tab, click *Add* ( ![Add Button](../../../images/icon-add.png) ).

1. Enter these values for Basic Info:

   | Field        | Value                                                                     |
   |:-------------|:--------------------------------------------------------------------------|
   | Action Label | Application Denied                                                        |
   | Action Name  | applicationDenied                                                         |
   | Description  | On After Update, send notifications to applicants when state is 'Denied'. |
   | Active       | True                                                                      |

1. Go to the *Action Builder* tab and set these values:

   | Field                 | Value                                          |
   |:----------------------|:-----------------------------------------------|
   | Trigger               | On After Update                                |
   | Condition             | `applicationState == "denied" AND status == 0` |
   | Action                | Notification                                   |
   | Notification Template | Application Denied, Applicant, Email           |

1. Click *Save*.

## Triggering the Notification Actions

Now that you've added and activated the notification actions, you can trigger them by adding and updating object entries:

1. Go to the Distributor Application page and create an new entry.

1. Verify the Application Submitted and Application Received actions run.

   ![Verify the Application Submitted and Application Received actions run.](./adding-notification-actions-to-distributor-application/images/04.png)

1. Update the application's state to *Approved*.

1. Verify the Application Approved action runs.

   ![Verify the Application Approved action runs.](./adding-notification-actions-to-distributor-application/images/05.png)

1. Update the application's state to *Denied*.

1. Verify the Application Denied action runs.

   ![Verify the Application Denied action runs.](./adding-notification-actions-to-distributor-application/images/06.png)

Congratulations! You've successfully added the business logic necessary for the Distributor Application object. Now you can design a user interface using Liferay's page builder features.

Module Three: [Designing User Interfaces](../../designing-user-interfaces.md)

## Relevant Concepts

* [Defining Object Actions](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/actions/defining-object-actions)
* [Notification Actions](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/actions/understanding-action-types#notification)
