---
uuid: 49804344-72f6-4e92-aa84-5b99e2bfd982
---
# Configuring Microsoft Office 365 with OAuth

{bdg-secondary}`Available Liferay DXP 7.4 U79/Liferay Portal 7.4 GA79 and above`

OAuth 2.0 authorization is required to connect your Microsoft email service with Liferay. Follow the configuration steps below.

## App Registration in Microsoft

```{note}
For additional support or troubleshooting with this process, contact Microsoft.
```

1. [Create a new application in Microsoft Azure](https://learn.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app). 

1. [Add a client secret for your application](https://learn.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app#add-a-client-secret).

    Take note of your application's `client ID` (A.K.A `application ID`), `client secret`, and `tenant ID` (A.K.A. `directory ID`). These values will be used in the steps below.

1. [Add POP and IMAP API permissions for the application](https://learn.microsoft.com/en-us/exchange/client-developer/legacy-protocols/how-to-authenticate-an-imap-pop-smtp-application-by-using-oauth#add-the-pop-and-imap-permissions-to-your-aad-application).

## Mail Configuration in Liferay

1. Navigate to _Global Menu_ (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Instance Settings_. 

1. Click _Email_.

1. In the left navigation, click _Mail Settings_. Set the following configuration.

   * Incoming POP Server: `outlook.office365.com`
   * Incoming Port: `995`
   * Use a Secure Network Connection: checked
   * User Name: Your username associated with the Microsoft application
   * Password: Your password
   * Outgoing SMTP Server: `smtp.office365.com`
   * Outgoing Port: `587`
   * Use a Secure Network Connection: checked
   * User Name: Your username associated with the Microsoft application
   * Password: Your password

    Click _Save_.

1. In the left navigation, click _Outlook Auth Connector_. Paste in the tenant ID, client ID, and client secret values into each input box.

    ![Paste in the tenant ID, client ID, and client secret values into each input box.](./configuring-office-365-with-oauth/images/01.png)

    Click _Save_.

Liferay is now configured with your Microsoft email service.


