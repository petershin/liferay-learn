---
uuid: c8bad60f-49bf-4002-ae2f-39991aaa5980
---
# Authenticating with SAML

When authenticating with SAML, Liferay can serve as either the service provider (SP) or the identity provider (IdP). See [authenticating with SAML](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml) to learn more.

Clarity Vision Solutions has grown by acquiring Fabulous Frames. As they look to the possibility of acquiring another company, the IT team decides to utilize SAML to centralize the storing and managing of user credentials. Follow the steps below to see this in action.

## Setting Up an Identity Provider

1. Start a Liferay container to be the identity provider.

   ```bash
   docker run -it -m 8g -p 7080:8080 \
      --env LIFERAY_SETUP_PERIOD_WIZARD_PERIOD_ENABLED=true \
      --name liferayidp liferay/dxp:latest
   ```

1. Set up the administrator account.

   * Navigate to `localhost:7080`.
   * Enter `Support` as the first name.
   * Enter `Support` as the last name.
   * Enter `support@clarityvisionsolutions.com` as the email.
   * Click `Finish Configuration`.
   * On the next page, set the password to `learn`.
   * Click `Save`.

1. Configure a new identity provider.

   * Navigate to _Global Menu_ (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _SAML Admin_. 
   * Under the general tab, select _Identity Provider_ as the SAML role. 
   * Enter the entity ID as `liferayidp`. 
   * Click _Save_.
   * Click _Create Certificate_ under the certificate and private key section.
   * Enter the common name as `foo`.
   * Scroll down to the bottom. Input the key password as `learn`.
   * Click _Save_.
   * Finally, tick the _Enabled_ checkbox under the general tab and click _Save_.

## Setting Up a Service Provider

1. Start a Liferay container to be the service provider.

   ```bash
   docker run -it -m 8g -p 8080:8080 --name liferaysp liferay/dxp:latest
   ```

1. Navigate to `localhost:8080` and log in as the administrator (i.e. `test@liferay.com:test`). Note, you may need to access each container in a different browser.

1. Navigate to _Global Menu_ (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _SAML Admin_. 

1. Configure a new service provider.

   * Under the general tab, select _Service Provider_ as the SAML role. 
   * Enter the entity ID as `liferaysp`. 
   * Click _Save_.
   * Click _Create Certificate_ under the certificate and private key section..
   * Enter the common name as `foo`.
   * Scroll down to the bottom. Input the key password as `learn`.
   * Click _Save_.
   * Finally, tick the _Enabled_ checkbox under the general tab and click Save.

## Linking the SP and IdP

In the `liferaysp` container (`localhost:8080`), navigate to _Global Menu_ (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _SAML Admin_. Click the _Identity Provider Connections_ tab.

1. Create an IdP connection.

   * Click _Add Identity Provider_.
   * Enter the name as `liferayidp`.
   * Enter the entity ID as `liferayidp`.
   * Tick the _Enabled_ checkbox.
   * Enter the metadata URL as `http://[IP Address]:7080/c/portal/saml/metadata`. Note, replace `[IP address]` with your machine's local IP address.
   * Under attribute mapping, use the drop-down list and select `emailAddress`. Set the SAML attribute as `emailAddress`.
   * Click the (![Add icon](../../../images/icon-add.png)) for another entry. Use the drop-down list and select `firstName`. Set the SAML attribute as `firstName`.
   * Click the (![Add icon](../../../images/icon-add.png)) for another entry. Use the drop-down list and select `lastName`. Set the SAML attribute as `lastName`.
   * Click the (![Add icon](../../../images/icon-add.png)) for another entry. Use the drop-down list and select `screenName`. Set the SAML attribute as `screenName`.
   * Click the (![Add icon](../../../images/icon-add.png)) for another entry. Use the drop-down list and select `UUID`. Set the SAML attribute as `UUID`.
   * Click _Save_ at the bottom of the page.

1. Next, in the `liferayidp` container (`localhost:7080`), navigate to _Global Menu_ (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _SAML Admin_. Click the _Service Provider Connections_ tab.

   * Click _Add Service Provider_.
   * Enter the name as `liferaysp`.
   * Enter the entity ID as `liferaysp`.
   * Tick the _Enabled_ checkbox.
   * Enter the metadata URL as `http://[IP Address]:8080/c/portal/saml/metadata`. Note, replace `[IP address]` with your machine's local IP address.
   * Enter the name identifier attribute name as `emailAddress`.
   * Tick the _Attributes Enabled_ checkbox.
   * In the attributes text box, enter the following attributes:

      ```
      firstName
      lastName
      emailAddress
      screenName
      uuid
      ```

   * Click _Save_ at the bottom of the page.

## Testing the SAML connection

1. In the `liferaysp` container (i.e. `localhost:8080`), navigate to _Global Menu_ (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Users and Organizations_. Note that the Test Test administrator is the only user listed.

1. Click the user profile image in the top right and click _Sign Out_. Sign in with the credentials `support@clarityvisionsolutions.com:learn`. Note the `liferayidp` container verified the user and provided successful login.

```{warning}
To make working with the rest of the course easier, disable SAML after completing this exercise. 
```

Next: [Authorizing with OAuth2](./authorizing-with-oauth2.md)

## Relevant Concepts

- [Authenticating with SAML](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml)
- [SAML Authentication Process Overview](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml/saml-authentication-process-overview)
- [SAML Admin](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml/saml-admin)
