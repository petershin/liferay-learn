---
uuid: 47760f84-2f4a-4afc-8bdd-23328302795f
taxonomy-category-names:
- Security
- DXP Configuration
- Identity Management and Authentication
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# System for Cross-domain Identity Management (SCIM)

{bdg-secondary}`Liferay DXP 2024.Q1+`
{bdg-link-primary}`[Beta Feature](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

System for Cross-domain Identity Management or SCIM, is an open standard that automates user provisioning. In other words, it's a standard way to create, update, and deactivate user identities. SCIM provides a unified, RFC-compliant way to keep user/group data in sync between different applications. It consists of

* A defined schema for representing users and groups. See [User Resource Schema](https://datatracker.ietf.org/doc/html/rfc7643#section-4.1) and [Group Resource Schema](https://datatracker.ietf.org/doc/html/rfc7643#section-4.2) for more information.
* A RESTful API to run CRUD operations on those users and groups to keep them in sync. See [SCIM User API Basics](./developer-guide/scim-user-api-basics.md) and [SCIM Group API Basics](./developer-guide/scim-group-api-basics.md) for more information.

!!! important
    This feature is currently behind a [beta feature flag](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags).

Using SCIM, you can automate the exchange of user identity information between your company's applications and service providers like Liferay securely. This is useful if your company uses multiple applications and wants to keep user data in sync without custom implementations.

## Registering a SCIM Client

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Security* &rarr; *SCIM*.

1. Enter a name in the OAuth 2 Application Name field.

   The name entered here is used to generate the SCIM client ID. This ID links users and groups with the SCIM client. If your SCIM client name is `Test SCIM Client`, the generated SCIM client ID is `SCIM_test-scim-client`.

1. Set the Matcher Field to `userName` or `email`.

   The SCIM client uses this field to match the user data in the service provider and the connected application. This avoids issues with provisioning and prevents data duplication.

   ![Enter a name and set the matcher field for the new SCIM client.](./system-for-cross-domain-identity-management-scim/images/01.png)

1. The Access Token field is empty at first. Click *Generate* and click *OK* to populate the field with an access token. An access token expires after 1 year unless revoked. If this is not the first time you're generating an access token, it overwrites the existing token, but it remains valid for 10 more days. You can use this grace period to configure the new token in the client application.

   You can invoke the SCIM APIs by setting the access token in the `Authorization` request header. To revoke all access tokens, click *Revoke* and click *OK*.

1. Click *Save*.

!!! note
    A scheduler runs daily to retrieve all OAuth 2 applications that start with the `SCIM_` prefix. If the access token's expiry is 30 days, 7 days, or 1 day, all administrators are notified in Liferay and by email.

## Resetting a SCIM Client

{bdg-secondary}`Liferay DXP 2024.Q4+`
{bdg-link-primary}`[Beta Feature](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

To register a new SCIM client, you must reset the existing one to remove the SCIM client data and generated OAuth 2 token.

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Security* &rarr; *SCIM*.

1. Click *Reset* and then click *OK*.

This clears the following fields: Access Token, Matcher Field, and OAuth 2 Application Name. It also deletes the OAuth 2 application associated with the SCIM client.

## Related Topics

* [SCIM User API Basics](./developer-guide/scim-user-api-basics.md)
* [SCIM Group API Basics](./developer-guide/scim-group-api-basics.md)
