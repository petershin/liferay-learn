---
taxonomy-category-names:
- Cloud
- Cloud Platform Administration
- Cloud Platform Security
- Liferay PaaS
uuid: d229293d-6125-4a3e-a1a0-c07d4cc406ad
---
# Using SSO with Liferay Cloud

Customers may use their SAML 2.0 compliant single sign-on Identity Providers to authenticate users with the Liferay Cloud platform. Here is the process to enable this integration.

Enabling SSO with SAML requires three agents: the Client, the Service Provider (SP), and the Identity Provider (IdP). When the client tries to connect to the Service Provider, the Service Provider redirects the client to the Identity Provider. After the Identity Provider authenticates the client, the Identity Provider grants the Service Provider access to the client's credentials.

In this scenario, Liferay Cloud functions as the Service Provider, the customer trying to log into Liferay Cloud is the client, and the Identity Provider is an enterprise directory solution managed by the customer.

## Enabling SSO for a Liferay Cloud Project

1. [Verify Your IdP Has the Correct User Profile Data Mapping](#configure-the-correct-user-profile-data-mapping-with-your-identity-provider)
1. [Provide IdP Metadata to the Liferay Cloud Team](#provide-identity-provider-metadata-to-the-liferay-cloud-team)
1. [Liferay Cloud Team Imports Provided IdP Data and Provides Service Provider (SP) Metadata](#liferay-cloud-team-imports-provided-idp-data-and-provides-service-provider-metadata)
1. [Import SP Metadata Provided by the Liferay Cloud Team](#import-sp-metadata-provided-by-the-liferay-cloud-team)

### Configure the Correct User Profile Data Mapping with Your Identity Provider

When a customer tries to log in via SSO, Liferay Cloud sends a request to your IdP system and attempts to match its own user profile data with the response it gets. You must configure your IdP so that the user profile data in the response is mapped to fields that match what Liferay Cloud expects.

These fields are required:

* **email**: the user's email address
* **firstName**: the user's first name
* **lastName**: the user's last name

### Provide Identity Provider Metadata to the Liferay Cloud Team

To enable SSO, you must provide your IdP system's metadata to the Liferay Cloud team, including these details:

| Field | Description |
| :--- | :--- |
| IdP Issuer | The name of the identity issuer, usually the `EntityID` attribute of the `EntityDescriptor` Metadata |
| IdP Single Sign-On URL | Request endpoint that receives the SAML Authentication Request (example: `<http://adfs.customer.com/saml/sso)>` |
| IdP Signature Certificate | Public Key Certificate of the IdP to the SAML message and assertion signatures |
| IdP Single Sign-On HTTP Method (Request Binding) | The HTTP method supported by the customer’s Identity Provider to receive the Authentication Requests. The only valid answers are `POST` (the default) and `GET` |
| Sign Requests | Set to `TRUE` if the SAML requests sent to the customer’s Identity Provider should be signed; otherwise set to `FALSE` |
| Request Signature Algorithm (RSA) | If the `Sign Requests` is set to `TRUE`, provide the algorithm used to sign the requests. At the moment we support SHA-1 (not recommended) and SHA-256. If the request signing is disabled, this configuration is unnecessary. |

#### ADFS-Specific Information

Clients using Microsoft ADFS should pay attention to these settings (which are required to set up SSO using SAML):

| Field | Description |
| :--- | :--- |
| IdP Issuer URI |Located in the General tab's _Federation Service identifier_ and has a default value of `http://domain/adfs/services/trust` |
| IdP Single Sign-On URL | Default setting is `/adfs/ls`. Example: `http://adfs.example.com/adfs/ls/` |
| IdP Signing Certificate | A DER encoded binary X.509 certificate file |

Once the IdP metadata is generated, [open a ticket with the Liferay Cloud team](https://help.liferay.com/hc/). IdP metadata can be transmitted with either an XML file or a URL endpoint (for example, `https://[hostname]:[port]/c/saml/metadata`).

### Liferay Cloud Team Imports Provided IdP Data and Provides Service Provider Metadata

The Liferay Cloud team then provides the following SP metadata values to the client:

| Field | Description |
| :--- | :--- |
| Assertion Consumer Service (ACS) URL | The SAML response received by Liferay Cloud. This is always an address server from <https://auth.liferay.cloud> |
| Audience URL | The URL Liferay Cloud used to access the customer’s Identity Provider |

### Import SP Metadata Provided by the Liferay Cloud Team

When you receive the SP metadata, enter the SP metadata values into your IdP.

## Using SSO

Once SSO is enabled, users with the appropriate identity provider(s) may use it to authenticate.

```{warning}
The first time  users authenticate with SSO, their user accounts are permanently changed, and they must authenticate using SSO from then on.
```

To log into Liferay Cloud using SSO,

1. Navigate to <https://console.liferay.cloud/login>.
1. Click _Login via SSO_.

   ![Use the Login via SSO button on the login page.](./using-sso-with-liferay-cloud/images/01.png)

1. Enter the **Company Name** in the _Organization ID_ field.
1. Click _Continue_.

    ```{note}
    If you have already authenticated using your organization's SSO, you may not need the remaining steps.
    ```

1. Enter the **Email Address** in the _Email Address_ field. This must be the same email address stored in the company's database or directory service (such as an LDAP or ADFS).
1. Enter the **Password** in the _Password_ field. This must be the same password associated with the email address stored in the company's database or directory service.
1. Click _Log in_.

Once logged in, you should see all your projects and environments.

![All projects and environments are visible.](./using-sso-with-liferay-cloud/images/02.png)
