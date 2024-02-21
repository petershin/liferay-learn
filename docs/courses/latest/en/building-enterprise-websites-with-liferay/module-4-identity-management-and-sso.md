---
toc:
- ./module-4-identity-management-and-sso/setting-up-sso.md
- ./module-4-identity-management-and-sso/liferay-security-features.md
uuid: 57aef6ee-03e9-4056-abf1-ebdbdb4984e4
---
# Module 4: Identity Management & SSO

Using the URL that was received from the Liferay SaaS provisioning email, visitors that come to Clarity's website are considered guest users and are not authenticated. In order to begin using Liferay's features and begin building its site, Clarity must implement a way for its team members to login and authenticate with Liferay. 

Liferay comes with a variety of out-of-the-box features, as well as support for integrating with third-party identity management services. For its employees, Clarity plans to use Okta for Single Sign-On (SSO) authentication and for its user directory. For other site visitors such as B2B customers, Clarity can use the security and identity management tools that are available within Liferay.

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
