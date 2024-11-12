---
toc:
  - ./securing-liferay/authentication-basics.md
  - ./securing-liferay/configuring-sso.md
  - ./securing-liferay/multi-factor-authentication.md
  - ./securing-liferay/using-antisamy.md
  - ./securing-liferay/securing-web-services.md
  - ./securing-liferay/system-for-cross-domain-identity-management-scim.md
  - ./securing-liferay/developer-guide.md
uuid: 8d84b144-9aba-4076-abc5-0043ac3ff72c
taxonomy-category-names:
- Platform
- DXP Configuration
- Identity Management and Authentication
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Securing Liferay

Liferay is built with security in mind. This includes mitigation of common security vulnerabilities and exploits like those described by the [OWASP Top 10](https://www.owasp.org/index.php/Top_10_2013-Top_10) and the [CWE/SANS Top 25](https://www.sans.org/top25-software-errors/).

There are several aspects of securing a Liferay installation---including, but not limited to, following the best security practices for your hosting environment, database, search provider, application server, and Liferay itself.

!!! note
    Liferay relies on the application server for sanitizing CRLF in HTTP headers. You must ensure this is configured properly on the application server.

Here you'll learn the basic elements to secure Liferay. This includes configuring how users authenticate to your Liferay installation, authorizing users with permissions, configuring secure access to Liferay web services, and fine-tuning security features on an as-needed basis.

!!! important
    Customers are advised to deploy security patches as they are released. For community and CE installations, we recommend always using the latest community release, which contains all previous security patches.

## Authentication

Liferay authentication is flexible. By default, users log into Liferay by using the _Sign In_ widget, which uses the database to authenticate the user. By default, guests can use the Sign In widget to create accounts with default permissions. Nearly every element of the default authentication experience can be changed by an administrator. For example,

* You can configure [Multi-Factor authentication](./securing-liferay/multi-factor-authentication/using-multi-factor-authentication.md).
* You can [use an SSO to manage](./securing-liferay/configuring-sso.md) authentication.
* Liferay can also be [integrated with LDAP](../users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory.md) to validate users instead of using the portal database.
* Guest account creation can be [turned off](./securing-liferay/authentication-basics.md#disabling-guest-account-creation).

To learn more, see [Authentication Basics](./securing-liferay/authentication-basics.md).

## Permissions

Liferay has a robust role-based access control (RBAC) system. Users can be assigned to sites, teams, user groups, or organizations. Custom Roles can be created, permissions can be assigned to these roles, and those roles can be assigned to users. Roles are scoped to apply only in a specific context, such as a site, organization, or globally. See [Roles and Permissions](../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) for more information.

## Securing Web Services

Liferay web services have a multi-layered and configurable approach to security and authorization:

* [Service Access Policies](./securing-liferay/securing-web-services/setting-service-access-policies.md) control access to remote APIs.
* [Authentication Verifiers](./securing-liferay/securing-web-services/using-authentication-verifiers.md) verify provided credentials.
* [Cross-Origin Resource Sharing](./securing-liferay/securing-web-services/setting-up-cors.md) configuration can enable retrieving resources from trusted sources only.

See [Introduction to Securing Web Services](./securing-liferay/securing-web-services.md) to learn more.

### Security Headers not Added by Liferay

Liferay does not add certain security headers in the HTTP request and response.

* `X-XSS-Protection` header: This header has been deprecated starting from Liferay DXP 7.4 and above. See the recommendations from [OWASP](https://owasp.org/www-project-secure-headers/#x-xss-protection) and [Mozilla](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-XSS-Protection).
* `Strict-Transport-Security` header: You must configure this in your application server and not on Liferay.
* `Cross-origin resource sharing (CORS)` header: Starting from Liferay 7.2 and above, you can set up CORS within Liferay. See [Setting up CORS](./securing-liferay/securing-web-services/setting-up-cors.md) for more information.
* `Public-Key-Pins` header: You must configure this in your web server.
* `Content-Security-Policy` header: This is available as a beta feature and appears in the request if configured. See [Configuring Content Security Policy Headers](./securing-liferay/securing-web-services/configuring-content-security-policy-headers.md) for more information.

## Fine-Tuning Security

There are many ways to fine-tune or disable additional security features:

* Configure Liferay's HTTPS [web server](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Web%20Server) address.
* Configure the list of allowed servers to which users can be [redirected](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Redirect).
* Configure the list of [portlets](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Portlet) that can be accessed from any page.
* Configure the file types allowed to be uploaded and downloaded.

These features can be configured using [portal properties](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html).

!!! warning
    Liferay's philosophy is "secure by default." Please exercise significant caution when modifying security-specific defaults or white-lists. Such actions may lead to security misconfiguration and an insecure deployment.

## Related Topics

For more information about securing a Liferay installation, please see [our security statement](https://www.liferay.com/security), [the community security team](https://portal.liferay.dev/people/community-security-team), and the resources listed on those pages.

There are additional security plugins available from [Liferay Marketplace](https://www.liferay.com/marketplace).

## Next Steps

* [Authentication Basics](./securing-liferay/authentication-basics.md)
* [Introduction to Securing Web Services](./securing-liferay/securing-web-services.md)
