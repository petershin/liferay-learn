---
uuid: c8bad60f-49bf-4002-ae2f-39991aaa5980
---
# Authenticating with SAML

When authenticating with SAML, Liferay can serve as either the service provider (SP) or the identity provider (IdP). See [authenticating with SAML](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml) to learn more.

## Setting Up an Identity Provider

1. Start a Liferay container to be the identity provider

   ```bash
   docker run -it -m 8g -p 7080:8080 --name liferayidp liferay/dxp:latest
   ```

1. Login as the administrator.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _SAML Admin_. 

1. Configure a new identity provider.
   
   * Under the general tab, select _Identity Provider_ as the SAML role. 
   * Input the entity ID as `liferayidp`. 
   * Click _Save_.
   * Click _Create Certificate_ under the certificate and private key section.
   * Input the common name as `foo`.
   * Scroll down to the bottom. Input the key password as `learn`.
   * Click _Save_.
   * Finally, tick the _Enabled_ checkbox under the general tab.

## Setting Up a Service Provider

1. Start a Liferay container to be the service provider

   ```bash
   docker run -it -m 8g -p 8080:8080 --name liferaysp liferay/dxp:latest
   ```

1. Login as the administrator.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _SAML Admin_. 

1. Configure a new service provider.
   
   * Under the general tab, select _Service Provider_ as the SAML role. 
   * Input the entity ID as `liferaysp`. 
   * Click _Save_.
   * Click _Create Certificate_ under the certificate and private key section..
   * 
   * Input the common name as `foo`.
   * Scroll down to the bottom. Input the key password as `learn`.
   * Click _Save_.
   * Finally, tick the _Enabled_ checkbox under the general tab.

## Linking the SP and IdP

In the `liferaysp` container, navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _SAML Admin_. Click the _Identity Provider Connections_ tab.

1. Create an IdP connection.

   * Click _Add Identity Provider_.
   * Input the name as `liferayidp`.
   * Input the entity ID as `liferayidp`.
   * Tick the _Enabled_ checkbox.
   * Input the metadata URL as `http://[IP Address]:7080/c/portal/saml/metadata`. Note, replace `[IP address]` with your machine's local IP address.
   * Under attribute mapping, use the drop-down list and select `emailAddress`. Set the SAML attribute as `emailAddress`.
   * Click the (![add icon](../../images/icon-add.png)) for another entry. Use the drop-down list and select `firstName`. Set the SAML attribute as `firstName`.
   * Click the (![add icon](../../images/icon-add.png)) for another entry. Use the drop-down list and select `lastName`. Set the SAML attribute as `lastName`.
   * Click the (![add icon](../../images/icon-add.png)) for another entry. Use the drop-down list and select `screenName`. Set the SAML attribute as `screenName`.
   * Click the (![add icon](../../images/icon-add.png)) for another entry. Use the drop-down list and select `UUID`. Set the SAML attribute as `UUID`.
   * Click _Save_ at the bottom of the page.

Next, in the `liferayidp` container, navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _SAML Admin_. Click the _Service Provider Connections_ tab.

   * Click _Add Service Provider_.
   * Input the name as `liferaysp`.
   * Input the entity ID as `liferaysp`.
   * Tick the _Enabled_ checkbox.
   * Input the metadata URL as `http://[IP Address]:8080/c/portal/saml/metadata`. Note, replace `[IP address]` with your machine's local IP address.
   * Input the name identifier attribute name as `emailAddress`.
   * Tick the _Attributes Enabled_ checkbox.
   * In the attributes text box, input the following:
      firstName
      lastName
      emailAddress
      screenName
      uuid
   * Click _Save_ at the bottom of the page.

## Testing the SAML connection


  
## Relevant Concepts

- [Authenticating with SAML](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml)
- 