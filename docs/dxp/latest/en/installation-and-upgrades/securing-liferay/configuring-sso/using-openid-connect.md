---
uuid: af832712-a9a1-46aa-ac8d-754cbd7656af
taxonomy-category-names:
- Platform
- DXP Configuration
- Identity Management and Authentication
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Using OpenID Connect

OpenID Connect is a lightweight authentication layer that enables users to authenticate using accounts they have on other systems. It's built on top of the [OAuth 2.0](../../../headless-delivery/using-oauth2.md) authorization protocol. By using OpenID Connect, you *delegate* user authentication to other providers, making it easy for users with existing accounts to authenticate to your Liferay installation.

!!! note
    You can add multiple providers to your installation, but Liferay DXP can't be an OpenID Connect provider.

OpenID Connect's token flow is similar to OAuth 2.0, because it's built on top of its functionality. OAuth 2.0 is only an authorization protocol, so it sends an *access token* that grants access to particular APIs. OpenID Connect adds to this an *identity token* that passes user information like *name* and *email*, provided the user has authenticated and granted permission.

## Creating a Client in OpenID Connect Provider

To use OpenID Connect, you must first register it as a client in your provider. This is an OAuth 2.0 client. The process varies by provider:

1. Navigate to the provider's website and create a client.

1. During the creation process, you must supply an *authorized redirect URL* that can process the tokens sent from the provider. Liferay DXP's URL is

   `https://[server.domain]/c/portal/login/openidconnect`

1. The provider sends several pieces of information. Some of these, like the Discovery Endpoint, Authorization Endpoint, or Issuer URL are the same regardless of the client. The two pieces of information unique to your request are the `client_id` and the `client_secret`.

Collect the information from the provider. You'll need it create the provider connection.

## Configuring an OpenID Connect Provider Connection

Liferay seeks feedback on a new interface for a provider connection. For this reason, there are two ways to create the connection: the standard way and the new way.

!!! important
    To provide a smooth transition to the new provider as it is developed, Liferay converts and syncs the OpenID Connect configuration between the two interfaces.

### New OpenID Connect Provider Connection for OAuth 2.0**

This interface is for those who want granular control over their client connection. All configuration is done through the provider's Well-Known Configuration Endpoint, as defined in the [OpenID Connect configuration specification](https://openid.net/specs/openid-connect-discovery-1_0.html#ProviderConfigurationRequest).

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *Security* &rarr; *OAuth Client Administration*.

1. There are two tabs. The first creates a client for an authorization server. The second is for authorization servers without a Well Known URI. You'll always use the first tab; you'll only use the second tab to create a "pseudo" well-known URI for a server that doesn't have one.

**If you do not have a well-known URI,**

1. Go to the second tab and click *Add* (![Add Button](../../../images/icon-add.png)).

1. Enter the authorization server metadata from your provider. Be sure that the `issuer` field has a value in the JSON. This generates a "local" well-known URI when click Save.

1. Click *Save*. You're returned to the OAuth Client Administration page, where you can see the URI that was generated. Copy this URI to your clipboard; you'll use this URI in the next step.

**If you have a well-known URI,**

1. On the first tab, click *Add* (![Add Button](../../../images/icon-add.png)).

1. Paste the authorization server's Well Known URI into the Well Known URI field. For example, Google's is `https://accounts.google.com/.well-known/openid-configuration`. If you generated one as above, paste it here.

1. Most of the time, this is all you need to do. If you don't have a Well Known URI, use the fields below to configure the connection. When finished, click *Save*.

The other fields on the form are for specific configuration generated with the provider.

**OAuth Client Information:** Add client configuration information according to the [RFC-7591](https://www.rfc-editor.org/rfc/rfc7591.html) JSON format. Note that you may not need to add anything here if you used the Well Known URI.

**OAuth Client Default Authorization Request Parameters:** If you have Liferay applications that do not specify [authorization request parameters](https://www.iana.org/assignments/oauth-parameters) themselves, specify the default parameters in JSON format for using this OAuth client here. Custom parameter values must be a JSON array of strings.

**OAuth Client Default Token Request Parameters:** If you have Liferay applications that do not specify [token request parameters](https://www.iana.org/assignments/oauth-parameters) themselves, specify the default parameters in JSON format for using this OAuth client here. Custom parameter values must be a JSON array of strings.

### Standard OpenID Connect Provider Connection

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Security* &rarr; *SSO*.

1. Select ***OpenID Connect Provider*** under Virtual Instance Scope.

   ![Locating OpenID configurations in the System Settings menu.](using-openid-connect/images/01.png)

1. Add the provider by clicking *Add*.

1. Use the information you received from the provider to fill out the form.

   | Field                                        | Description                                                                                                                                                                                                                                                                                       |
   | :------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
   | **Provider Name**                            | This name appears in the Sign-In portlet when users use OpenID Connect to log in.                                                                                                                                                                                                                 |
   | **Scopes**                                   | Leave the default, which requests the user name and the email. Your provider may offer other scopes of user information.                                                                                                                                                                          |
   | **Discovery Endpoint**                       | Other URLs may be obtained from this URL, and they vary by provider.                                                                                                                                                                                                                              |
   | **Discovery Endpoint Cache in Milliseconds** | Cache the endpoints (URLs) discovered for this amount of time.                                                                                                                                                                                                                                    |
   | **Authorization Endpoint**                   | This URL points to the provider's URL for authorizing the user (i.e., signing the user in).                                                                                                                                                                                                       |
   | **Issuer URL**                               | The provider's URL that points to information about the provider who is issuing the user information.                                                                                                                                                                                             |
   | **JWKS URI**                                 | A URL that points to the provider's JSON Web Key Set that contains the public keys that can verify the provider's tokens.                                                                                                                                                                         |
   | **ID Token Signing Algorithms**              | Set the supported ID token algorithms manually. Normally, this is "discovered" at the discovery endpoint. You can add as many of these as you need.                                                                                                                                               |
   | **Subject Types**                            | A Subject Identifier is a unique and never reassigned identifier the provider uses to establish who the user is, and is consumed by the client (i.e., Liferay DXP). There are two types: public (provides the same value to all clients) and private (provides a different value to each client). |
   | **Token Endpoint**                           | The provider's URL where tokens can be requested.                                                                                                                                                                                                                                                 |
   | **Token Connection Timeout in Milliseconds** | Wait this long when requesting a token for validation before timing out. A value of `0` means wait forever and is not recommended.                                                                                                                                                                |
   | **User Information Endpoint**                | The OAuth 2.0 protected URL from which user information can be obtained.                                                                                                                                                                                                                          |
   | **OpenID Connect Client ID**                 | Provide the OAuth 2.0 Client ID you received from your provider.                                                                                                                                                                                                                                  |
   | **OpenID Connect Client Secret**             | Provide the OAuth 2.0 Client Secret you received from your provider.                                                                                                                                                                                                                              |

   !!! important
       Liferay doesn't support encrypted ID tokens (JWE) for OpenID Connect as it's optional according to the [OpenID Specification](https://openid.net/specs/openid-connect-core-1_0.html#IDToken). However, it does support the mandatory signed ID tokens (JWS).

1. Click *Save*. Now you're ready to enable OpenID Connect authentication.

This configuration can be exported by clicking the connection's *Actions* (![Actions](../../../images/icon-actions.png)) button and clicking *Export*. An exported configuration results in a System Settings configuration file with a unique `[name]` field.

```bash
com.liferay.portal.security.sso.openid.connect.internal.configuration.OpenIdConnectProviderConfiguration-[name].config
```

## Enabling OpenID Connect Authentication

1. Open the *Global Menu* (![Global Menu](../../../images/icon-applications-menu.png)) and navigate to *Control Panel* &rarr; *Instance Settings* &rarr; *Security* &rarr; *SSO*.

1. Select ***OpenID Connect*** under Virtual Instance Scope.

   ![Enabling OpenID Connect authentication in Instance Settings.](using-openid-connect/images/02.png)

1. Click the *Enabled* check box and click *Save*.

Your users can now sign in with OpenID Connect.

## Signing In With OpenID Connect

A new link appears in the Sign-In portlet for signing in with OpenID Connect:

1. From the Sign-In portlet, click *OpenID Connect* at the bottom.

1. Choose a provider and click *Sign In*.

1. This takes you to your provider's sign in page. Enter your credentials and log in.

1. Upon successful authentication, you're redirected back to Liferay DXP in an authenticated state.

!!! note
    As a client, Liferay supports PKCE (Proof Key for Code Exchange) when using OpenID Connect. For more details, please refer to the [PKCE specification](https://www.rfc-editor.org/rfc/rfc7636). It is up to the provider to check the values and approve or reject requests appropriately.
