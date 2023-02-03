# Configuring the MuleSoft Connector

Liferay's connector to MuleSoft uses OpenAPI 3.0 documents that describe Liferay's APIs. Each OpenAPI document is deployed dynamically in your Liferay instance under the following schema:

```bash
http://[host]:[port]/o/[headless-api-app-name]/[version]/openapi.json
```

These documents are generated based on your deployed RESTful web services, so they are the most current and accurate descriptions of your APIs. You can learn more about Liferay APIs [here](https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis.html).

Once you specify an OpenAPI document endpoint, the connector automatically configures the paths, path/query parameters, and entity metadata defined in the OpenAPI document. The connector works with any OpenAPI 3.0 document that follows Liferay standards and supports all Liferay APIs.

## Connector Configuration

To add the connector to your Mule project, click on *Search in Exchange* in the Mule Palette and search for *Liferay*. Click on the connector and click *Add*. Then, click *Finish*. The connector is now available in your Mule Palette.

![Set the Client Profile as Headless Server in the OAuth2 configuration.](./configuring-the-mulesoft-connector/images/01.gif)

To configure the connector,

* Select an authentication method and enter the required authentication parameters.

* Specify an OpenAPI document endpoint.

### Authentication

You can choose between *Basic* and *OAuth2* authentication methods. See [Using OAuth2](https://learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2.html) for more information.

* **Basic Authentication**: Enter a user name and password.

* **OAuth2**: Enter a client key and client secret.

If you're using OAuth2, you must set up OAuth2 authorization in your Liferay instance first by following the instructions [here](https://learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2/creating-oauth2-applications.html).

![Set the Client Profile as Headless Server in the OAuth2 configuration.](./configuring-the-mulesoft-connector/images/02.png)

Liferay supports the OAuth 2.0 Client Credentials grant type. Select *Headless Server* from the Client Profile dropdown. Liferay generates a client ID (consumer key) and client secret (consumer secret) to use while configuring the connector. Before you can start using endpoints with OAuth2 authorization you must also enable [scopes](https://learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2/oauth2-scopes.html). Select the desired scope and check the authorization options you need, such as *everything*, *everything.write* or *everything.read*.

```{note}
Basic authentication must used only for demonstration purposes. For production, you should authorize users via [OAuth2](https://learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2.html). See [Using OAuth2 to Authorize Users](https://learn.liferay.com/dxp/latest/en/headless-delivery/using-oauth2/using-oauth2-to-authorize-users.html) for a sample React application that utilizes OAuth2.
```

### Specify OpenAPI Document

Once authorized, set an OpenAPI document endpoint to specify the Liferay API you want to use. For example, this document is for the Commerce Admin Catalog API:

```bash
http://[host]:[port]/o/headless-commerce-admin-catalog/v1.0/openapi.json
```

To set this value, enter the document endpoint into the *OpenAPI Spec URL* field of the `Liferay_Config` global element.

![Enter the OpenAPI document endpoint in the Open API Spec URL field.](./configuring-the-mulesoft-connector/images/02.png)

You can also do this using XML configuration. Navigate to the *Global Elements* section, right click *Liferay Config* and select *Go to XML*.

* Configuration example using Basic authentication

```xml
 <liferay:config name="Liferay_Config_Catalog">
 <liferay:basic-connection username=${username} password=${password} openApiSpecPath="http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/openapi.json" />
 </liferay:config>
```

* Configuration example using OAuth 2.0

```xml
 <liferay:config name="Liferay_Config_Catalog">
 <liferay:oauth2-connection consumerKey="${consumerKey}" consumerSecret=${consumerSecret} openApiSpecPath="http://localhost:8080/o/headless-commerce-admin-catalog/v1.0/openapi.json" />
 </liferay:config>
```

Click *Test Connection*. If it is successful, you can start building flows using the connector.

## Additional Information

* [Designing Mule Flows](./designing-mule-flows.md)