---
uuid: 82f49b9c-27f7-461f-be8c-5acc6c693694
---
# Headless Security

Whether you're importing or exporting data, security is critical when working with Liferay's APIs. Liferay provides industry standard methods of authorization such as HTTPS and OAuth 2.0 out of the box to secure any transfer of sensitive data with external systems.

!!! note
    Although Liferay APIs support basic authorization, you should only use this method for testing and never in a production environment. Use OAuth 2.0 to transfer data securely.

## Enabling OAuth 2.0 in Liferay

OAuth 2.0 provides a secure way to control who can access your data. With it, you can grant specific permissions to web services without needing to share passwords. This helps protect user information and ensure that only authorized users can interact with the API.

At a high level, there are three steps to configure and connect with OAuth 2.0 in Liferay:

First, you define an OAuth 2.0 application in Liferay. When setting up this application, you determine how you plan to connect and authorize to Liferay. Different authorization flows are available for selection including the authorization code flow. See [Authorizing Account Access with OAuth2](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2/authorizing-account-access-with-oauth2) to learn more.

   ![Create an OAuth2 application from the UI.](./headless-security/images/01.png)

Second, you define the scopes for the application. These are the permissions granted for specific headless API endpoints and determine which operations the application can perform. For example, a remote application may need read and write access to blog posts.

Third, you need to configure your remote application to leverage OAuth 2.0 to connect to Liferay. Make sure that your client application is set up to work with the authorization flow you selected. For example, if you select the authorization code flow, Liferay exchanges an authorization code for a token that's used for future API calls.

## Guest API Access

By default, Liferay requires authentication for all APIs and does not grant public access to them. However, you can use the Service Access Policy tool to make specific endpoints publicly accessible. You can configure which service signatures to allow within each service access policy.

!!! important
    Proceed with caution when setting guest access and making API endpoints public facing. Provide this type of access only when necessary.

   ![Create a service access policy for guest access.](./headless-security/images/02.png)

See [Setting Service Access Policies](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies) to learn more.

## Conclusion

Security is paramount when using APIs to move data in or out of Liferay. Now that we've explored how Liferay's headless APIs are secured and authorized, let's take a look at how Clarity can use them to import content.

Up Next: [Using Headless APIs](./using-headless-apis.md)

## Additional Resources

See our documentation to learn more about ensuring robust headless security with Liferay's APIs:

* [Using OAuth 2.0](https://learn.liferay.com/w/dxp/headless-delivery/using-oauth2)
* [Making Unauthenticated Requests](https://learn.liferay.com/w/dxp/headless-delivery/consuming-apis/making-unauthenticated-requests)