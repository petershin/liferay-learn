---
toc:
- ./module-4-identity-management-and-sso/setting-up-sso.md
- ./module-4-identity-management-and-sso/liferay-security-features.md
uuid: 57aef6ee-03e9-4056-abf1-ebdbdb4984e4
---
# Module 4: Identity Management & SSO

Now that Clarity has a Liferay SaaS instance provisioned, the Liferay DXP instance is now available to access via the URL that was sent in the provisioning email. The next step is to integrate Clarity's already existing set of users into Liferay and enable them to authenticate to the system.

To ensure secure access for Clarity's employees and leverage existing Identity Management and Single Sign-On Solutions, Liferay comes with a variety of out-of-the-box features, as well as support for integrating with third-party identity management services. For employee authentication and user directory management, Clarity plans to utilize Okta for Single Sign-On (SSO). For other site visitors such as B2B customers, Clarity can use the security and identity management tools that are available within Liferay.

<!-- [Maybe add an image like the one under the "Saving the Metadata" section](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso/authenticating-with-saml/importing-user-groups-memberships-from-an-external-idp-through-saml#saving-the-metadata) -->

In this module, you will:

* Walk through an example of integrating Okta SSO with Liferay
* Learn about the different security features for users to log in to Liferay

Next: [Setting Up SSO](./module-4-identity-management-sso/setting-up-sso.md)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  Setting up SSO
:link: ./module-4-identity-management-sso/setting-up-sso.md

See how to implement Okta single sign-on service with Liferay.
:::

:::{grid-item-card}  Liferay Security Features
:link: ./module-4-identity-management-sso/liferay-security-features.md

Learn about the different security features that are available to protect and control user login.
:::
