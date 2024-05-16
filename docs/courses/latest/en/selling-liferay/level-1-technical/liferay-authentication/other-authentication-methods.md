---
uuid: b7761bee-7211-41c7-ac27-c4d8d5166b96
visibility: 
- Employee
- Partner
---

# Standards-Based Approaches to Authentication

**At a Glance**

* Liferay Authentication is supported by standards-based authentication approaches like OpenID Connect, SAML, etc.
* External identity management systems are often used in conjunction with single-sign on to allow a single authenticated login to be used with multiple applications
* Multi-factor authentication extends on basic password-based authentication by adding additional factors to improve security

## OpenID Connect

When moving beyond using Liferay’s native identity management capabilities, a very common approach is to use OpenID Connect (OIDC), a standards-based, decentralized authentication protocol.

OpenID Connect is typically used in B2C types of applications where users are allowed to connect to Liferay using an existing set of credentials from a well-known provider like Google, Facebook, Microsoft, Apple, or GitHub. 

It is important to note that the potential list of providers is almost endless. If the provider supports OpenID Connect it can be configured to be used in Liferay DXP. 

Highlight the benefits for OpenID Connect like Scalability and Flexibility because OpenID Connect can be used with simple configuration - no development work is required. With OpenID Connect, Liferay automatically creates user accounts when the user first authenticates using their OpenID Connect credentials.

Most demos will not typically use an authentication mechanism like OpenID Connect because usually native Liferay Authentication is sufficient to explain the authentication story. 

Certainly for the objectives for this learning path - to prepare to deliver a 30 minute demo using a pre-existing demo - there is no expectation that a capability like OpenID Connect is demonstrated, or that login is customized in any way at all.

_If_ the prospect wants to see authentication to Liferay using an external ID it is straightforward to configure Liferay to use OpenID Connect. Note however that the OOTB implementation of OpenID Connect requires the user to click on a link and then manually select their provider.

In many real-world use cases this is perfectly relevant - where the user selects from a list of providers, but if the prospect’s requirements are for all users to authenticate using a _single_ provider, the out-of-the-box UI might not set the right expectations.

One of Liferay’s Sales Engineers created a simple custom Fragment to provide a button which makes the process seamless. The source-code for this fragment is available in GitHub [here](https://github.com/lgdd/openid-connect-single-button).

## SAML, SSO, IDMS

Another authentication mechanism supported by Liferay out-of-the-box is SAML, which stands for Security Assertion Markup Language. SAML is an open-standard used for authentication.

SAML works using two separate but tightly linked concepts:

* One system acts as the Identity Provider (IdP) and contains user records and credentials.
* A second system acts as the Service Provider (SP) and is the application that is being authenticated to.

Liferay’s implementation of SAML allows Liferay to be used as either an Identity Provider or a Service Provider, but most often it is used as the Service Provider.

SAML is the method most used in single sign-on scenarios (SSO) where there is a known set of users and they need an easy way to log into Liferay, along with others within the organization. Example use cases are internal systems like Intranets.

With Single Sign-on (whether implemented using SAML or other capabilities) users have a single User ID and Password to remember, and can be automatically authenticated on all systems once they have logged in to one system.

Generally when SAML is used there is an external system that manages credentials - a dedicated Identity Management System (IDMS). In this configuration passwords are not maintained in Liferay, but user accounts are still created so that permissions can be assigned. This is a good example of the separation between Authentication and Authorization:

* Users are Authenticated against their credentials in the identity management system 
* Users are Authorized by their permissions which are defined in Liferay.

Continuing with the lock analogy, SAML is a different type of Lock to the one used for Liferay Authentication. There are many other ways to log into Liferay - many other locks - for example:

* LDAP (Lightweight Directory Access Protocol) can be configured
* Token-based systems can be used
* Custom authentication mechanisms can be developed.

## Multi-Factor Authentication

Password-based security is something everyone is familiar with. The limitations of passwords are also well known, they can be:

* Shared
* Easy to guess unless a strong password policy is in place
* Even if a strong password is used they may be written down because the user can forget them

Multi-factor authentication (MFA) adds additional authentication factors that are harder, if not impossible to circumvent. Most people are familiar with techniques like time-based one-time PINs - where a code is sent by email or SMS. These expire after a short period of time, and so cannot easily be shared.

Even more secure is to use a Fast Identity Online 2 - or FIDO2 - device or application - like Google Authenticator - which ties the PIN to a specific device.

Liferay provides support for multi-factor authentication out-of-the-box, with support for the following factors included:

* One-Time PIN (OTP)
* Time-based OTP (TOTP)
* Email-based OTP
* FIDO2 devices and applications.
* IP Address range restriction

This last option isn’t really Multi-Factor Authentication - it’s more restricting who can even attempt to authenticate - and indeed similar capabilities can be implemented via a Web Application Firewall, or using a Web-tier in front of Liferay - but it’s useful to have available in the product - and to talk about when doing a demo.

Most demos will not include a live demonstration of multi-factor authentication, but it is important to talk about the capabilities that are provided out-of-the-box because doing so builds a high degree of confidence with prospects that any Liferay application will be secure. 

Finally in this module learn about how authentication is complemented with [authorization](./authorization.md) to control what users see and can interact with once authenticated.
