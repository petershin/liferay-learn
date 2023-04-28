---
uuid: d717105d-bf1d-4b82-88ea-61798efeb7a5
---
# Securing Web Services

Use the different web service tools Liferay offers to protect your system as different applications and clients interact with Liferay. See [securing Liferay web services](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services) to learn more.

Fans of Delectable Bonsai have been asking for a way to be able to customize and download their user profiles to use on other platforms. See how the IT department might configure a public web service to enable this.

## Understanding Service Access Policies

Use the service access policy tool to set which web services have public access. You can view a list of the default policies. Follow the steps below to add a new policy. See [setting service access policies](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies) to learn more.

```{warning}
The example below is for demonstration purposes only. Granting access to these services make them public facing and typically should be paired with authentication.
```

1. Make an API request without passing any credentials. 

   ```bash
   curl "localhost:8080/o/headless-admin-user/v1.0/my-user-account"
   ```

   Note, that a forbidden error response is returned.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Service Access Policy_.

1.  Click _Add_ (![Add icon](../../images/icon-add.png)).

1. Configure the new policy as follows:

   * Enter `MY_USER_ACCOUNT_GUEST_ACCESS` as the name.
   * Toggle the enabled switch on.
   * Toggle the default switch on.
   * Enter `My User Account Guest Access` as the title.
   * Enter `com.liferay.headless.admin.user.internal.resource.v1_0.UserAccountResourceImpl` as the service class.
   * Enter `getMyUserAccount` as the method name.
   * Click _Save_.

1. Make the same API request.

   ```bash
   curl "localhost:8080/o/headless-admin-user/v1.0/my-user-account"
   ```

   Liferay now returns the user account info of the guest user. Allow or deny access in this way for other services.

## Enabling Cross-Origin Resource Sharing

When a server from a different domain tries to access Liferay web services, the cross-origin resource sharing (CORS) policy allows or denies each request. Follow the steps below to see an example of this with a React application running locally. See [setting up CORS](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-up-cors) to learn more.

1. Create a Liferay object.

   * Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Objects_.
   * Click _Add_ (![Add icon](../../images/icon-add.png)).
   * Enter the following object:
     * Label: `J4X7-Object`
     * Plural Label: `J4X7-Objects`
     * Name: `J4X7Object`
   * Click _Save_.
   * Select the J4X7-Object you just created. Click the _Fields_ tab.
   * Click _Add_ (![Add icon](../../images/icon-add.png)) and add the following field:
     * Label: `name`
     * Field Name: `name`
     * Type: `Text`
   * Click _Save_.
   * Click _Add_ (![Add icon](../../images/icon-add.png)) and add the following field:
     * Label: `description`
     * Field Name: `description`
     * Type: `Text`
   * Click _Save_.
   * Click back to the _Details_ tab and click _Publish_.

1. Download and unzip the React application.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/developing-a-javascript-application/using-react/liferay-j4x7.zip -O
   ```

   ```bash
   unzip liferay-j4x7.zip
   ```

   ```bash
   cd liferay-j4x7
   ```

1. Navigate to the application's folder and start the React server.

   ```bash
   cd j4x7-custom-element
   ```

   ```bash
   yarn start
   ```

1. Try to add a J4X7 object entry. Input `foo` as the name and description and click _Add_.

   ![Try to add a J4X7 object entry.](./securing-web-services/images/01.png)

   See that the entry was prevented from being added.

1. In Liferay, navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Instance Settings_.

1. Add a CORS policy for the object.

   * Click _Security Tools_.
   * Click _Portal Cross-Origin Resource Sharing (CORS)_ in the left navigation.
   * Click _Add_.
   * Input _Foo_ as the name.
   * Add a *URL Pattern* with the value `/o/c/j4x7objects/*` and click *Update*.

1. Back in the React app, add a J4X7 object entry. Input `foo` as the name and description and click _Add_.

   ![A J4X7 object entry is successfully added.](./securing-web-services/images/02.png)

   With the CORS policy updated, a J4X7 object entry is now successfully added.

Next: [Authorizing with OAuth2](./authorizing-with-oauth2.md)]

## Relevant Concepts

- [Setting Service Access Policies](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies)
- [Setting Up CORS](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-up-cors)
