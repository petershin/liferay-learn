---
uuid: 1cdf71b3-f287-41aa-b007-cc2c8bee13e7
---
# Adding Notification Templates for Distributor Application

To this point, Delectable Bonsai's Distributor Application has no automated notifications for entry events. This means administrators must check the object to learn of new submissions and inform applicants on the status of their applications manually. This strategy doesn't scale and leaves room for human error, resulting in missed opportunities or poor user experience.

Here you'll create these notification templates for use with the Distributor Application object:

| Event                 | Recipient | Type  |
|:----------------------|:----------|:------|
| Application Submitted | Admin     | User  |
| Application Received  | Applicant | Email |
| Application Approved  | Applicant | Email |
| Application Denied    | Applicant | Email |

![Create four notification templates for the Distributor Application Object.](./adding-notification-templates/images/01.png)

## Application Submitted Template

1. Open the *Global Menu* ( ![Global Menu](../../images/icon-applications-menu.png) ), go to the *Control Panel* tab, and click *Templates*.

1. Click *Add* ( ![Add Button](../../images/icon-add.png) ) and select *User Notification*.

1. Scroll down to Definition of Terms and use the Entity drop-down menu to select the *Distributor Application* object.

   ![Scroll down to Definition of Terms and select Distributor Application.](./adding-notification-templates/images/02.png)

   You can use these field references in the template to populate notifications dynamically with entry data. In the General Terms section are terms for referencing fields for the user that triggers the notification action.

1. Enter these values for Basic Info:

   | Field       | Value                                                                                               |
   |:------------|:----------------------------------------------------------------------------------------------------|
   | Name        | Application Submitted, Admin, User                                                                  |
   | Description | Sends user notifications to an administrative role whenever a distributor application is submitted. |

   ![Enter these values for Basic Info.](./adding-notification-templates/images/03.png)

1. Enter these values for Settings:

   | Field      | Value                        |
   |:-----------|:-----------------------------|
   | Recipients | Role                         |
   | Role       | Business Development Manager |

   ![Enter these values for Settings.](./adding-notification-templates/images/04.png)

1. Enter this value for Content:

   | Field   | Value                                                                                                                                                        |
   |:--------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------|
   | Subject | APP-[%DISTRIBUTORAPPLICATION_ID%]: [%DISTRIBUTORAPPLICATION_APPLICANTNAME%] submitted a distributor application for [%DISTRIBUTORAPPLICATION_BUSINESSNAME%]. |

   ![Enter this value for Content.](./adding-notification-templates/images/05.png)

1. Click *Save*.

   ```{tip}
   Notification template ERCs use a randomly generated UUID, but you can change a template's ERC after creation. Using consistent and human-readable ERCs can help when moving your templates and objects between environments (e.g., `APPLICATION_SUBMITTED_ADMIN_USER`).
   ```

## Application Received Template

1. Click *Add* ( ![Add Button](../../images/icon-add.png) ) and select *Email*.

1. Enter these values for Basic Info:

   | Field       | Value                                                                                      |
   |:------------|:-------------------------------------------------------------------------------------------|
   | Name        | Application Received, Applicant, Email                                                     |
   | Description | Sends email notifications to applicants to indicate their applications have been received. |

   ![Enter these values for Basic Info.](./adding-notification-templates/images/06.png)

1. Enter these values for Settings:

   | Field        | Value                                     |
   |:-------------|:------------------------------------------|
   | To           | [%DISTRIBUTORAPPLICATION_APPLICANTEMAIL%] |
   | CC           | N/A                                       |
   | BCC          | N/A                                       |
   | From Address | `sales@delectable-bonsai.com`             |
   | From Name    | Delectable Bonsai                         |

   ![Enter these values for Settings.](./adding-notification-templates/images/07.png)

1. Enter this values for Content:

   | Field       | Value                                                                                                                                                                                                                                                                                                                                                                                             |
   |:------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
   | Subject     | Thank you for submitting your application!                                                                                                                                                                                                                                                                                                                                                        |
   | Editor Type | Rich Text                                                                                                                                                                                                                                                                                                                                                                                         |
   | Template    | Click the *Source* button ( ![Source button](../../images/icon-code.png) ). Then, copy and paste the contents of [`ApplicationReceived_Applicant_Email.html`](https://resources.learn.liferay.com/w/courses/application-development/implementing-business-logic/automating-notifications/adding-notification-templates/ApplicationReceived_Applicant_Email) into the Template field. |

<!-- Not sure the above will work; we'll have to see. -Rich --> 

   ![Enter these values for Content.](./adding-notification-templates/images/08.png)

   When rendered, the body of the message should look like this:

   ![Enter these values for Content.](./adding-notification-templates/images/09.png)

1. Click *Save*.

## Application Approved Template

1. Click *Add* ( ![Add Button](../../images/icon-add.png) ) and select *Email*.

1. Enter these values for Basic Info:

   | Field       | Value                                                                                              |
   |:------------|:---------------------------------------------------------------------------------------------------|
   | Name        | Application Approved, Applicant, Email                                                             |
   | Description | Sends email notifications to applicants to inform them that their applications have been approved. |

1. Enter these values for Settings:

   | Field        | Value                                     |
   |:-------------|:------------------------------------------|
   | To           | [%DISTRIBUTORAPPLICATION_APPLICANTEMAIL%] |
   | CC           | N/A                                       |
   | BCC          | N/A                                       |
   | From Address | `sales@delectable-bonsai.com`             |
   | From Name    | Delectable Bonsai                         |

1. Enter this values for Content:

   | Field       | Value                                                                                                                                                                                                                                                                                                                                                                                             |
   |:------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
   | Subject     | Sweet things are in store for you!                                                                                                                                                                                                                                                                                                                                                                |
   | Editor Type | Rich Text                                                                                                                                                                                                                                                                                                                                                                                         |
   | Template    | Click the *Source* button ( ![Source button](../../images/icon-code.png) ). Then, copy and paste the contents of [`ApplicationApproved_Applicant_Email.html`](https://resources.learn.liferay.com/w/courses/application-development/implementing-business-logic/automating-notifications/adding-notification-templates/ApplicationApproved_Applicant_Email) into the Template field. |

   When rendered, the body of the message should look like this:

   ![Enter these values for Content.](./adding-notification-templates/images/10.png)

1. Click *Save*.

## Application Denied Template

1. Click *Add* ( ![Add Button](../../images/icon-add.png) ) and select *Email*.

1. Enter these values for Basic Info:

   | Field       | Value                                                                                            |
   |:------------|:-------------------------------------------------------------------------------------------------|
   | Name        | Application Denied, Applicant, Email                                                             |
   | Description | Sends email notifications to applicants to inform them that their applications have been denied. |

1. Enter these values for Settings:

   | Field        | Value                                     |
   |:-------------|:------------------------------------------|
   | To           | [%DISTRIBUTORAPPLICATION_APPLICANTEMAIL%] |
   | CC           | N/A                                       |
   | BCC          | N/A                                       |
   | From Address | `sales@delectable-bonsai.com`             |
   | From Name    | Delectable Bonsai                         |

1. Enter this values for Content:

   | Field       | Value                                                                                                                                                                                                                                                                                                                                                                                          |
   |:------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
   | Subject     | Application Decision Update                                                                                                                                                                                                                                                                                                                                                                    |
   | Editor Type | Rich Text                                                                                                                                                                                                                                                                                                                                                                                      |
   | Template    | Click the *Source* button ( ![Source button](../../images/icon-code.png) ). Then, copy and paste the contents of [`ApplicationDenied_Applicant_Email.html`](https://resources.learn.liferay.com/w/courses/application-development/implementing-business-logic/automating-notificiations/adding-notification-templates/ApplicationDenied_Applicant_Email) into the Template field. |

   When rendered, the body of the message should look like this:

   ![Enter these values for Content.](./adding-notification-templates/images/11.png)

1. Click *Save*.

Great! Now that you've added these templates, you can use them to define notification actions in the Distributor Application object.

Next: [Adding Notification Actions](./adding-notification-actions.md)

## Relevant Concepts

* [Creating Notification Templates](https://learn.liferay.com/w/dxp/process-automation/notifications/creating-notification-templates)
