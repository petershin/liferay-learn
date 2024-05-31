---
toc:
- ./module-4-identity-management-and-sso/claritys-authentication-and-sso-requirements.md
- ./module-4-identity-management-and-sso/liferay-authentication.md
- ./module-4-identity-management-and-sso/managing-clarity-employees.md
- ./module-4-identity-management-and-sso/using-okta-for-authentication-and-sso.md
- ./module-4-identity-management-and-sso/managing-clarity-business-partners-and-guests.md
uuid: 57aef6ee-03e9-4056-abf1-ebdbdb4984e4
---
# Module 4: Identity Management & SSO

!!! important "Webinar Note"
    This module was presented using slides for a live webinar audience. The formatting, presentation, and examples may differ from what is presented here as part of the course.

    * View the [recording](https://learn.liferay.com/web/guest/d/lp1-4-identity-management-sso) from the live webinar of this module.
    * Download the [PDF](https://learn.liferay.com/documents/d/guest/lp1-4-identity-management-sso-pdf) of the presentation used in the live workshop.

Before we can get started with building Clarity’s website, we’ll first need to get logged in and ensure that other content contributors can also get logged in. *Identity Management* (IdM), plays an important role in any enterprise software project, even when building an enterprise website such as Clarity. This may seem counterintuitive, because the main audience of the site will initially be anonymous users browsing public pages. However, there is still a team of Clarity employees that need to log in to the system to create and maintain the content. Additionally, Clarity has some B2B partners with existing user accounts from their previous platform and aims to enable new distributors to create accounts for a more personalized experience.

When we talk about identity management in the context of Liferay, we’re talking about providing the ability to manage users and provide those users with the ability to authenticate to the portal to access protected resources. *Single Sign-On*, or SSO, is a complementary topic in which users who are authenticated can access multiple systems or resources with the same set of credentials.

For the scope of this course, we will not be covering every possible identity management scenario. Instead, this module focuses on the key decision points for Clarity and will provide references to supplemental content that might be applicable to other solutions or scenarios.

In this module, you will learn:

* The specific identity management and SSO requirements Clarity has
* The basics of Liferay authentication and identity management
* How to configure an integration using Okta as SSO and IdM
* How to distinguish the authentication experience for Clarity's employees, business partners, and guest users

Up First: [Clarity's Authentication and SSO Requirements](./module-4-identity-management-and-sso/claritys-authentication-and-sso-requirements.md)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  Clarity's Authentication and SSO Requirements
:link: ./module-4-identity-management-and-sso/claritys-authentication-and-sso-requirements.md

Read about the specific authentication and SSO requirements Clarity has.
:::

:::{grid-item-card}  Liferay Authentication
:link: ./module-4-identity-management-and-sso/liferay-authentication.md

Learn the basics of Liferay authentication and identity management.
:::

:::{grid-item-card}  Managing Clarity Employees
:link: ./module-4-identity-management-and-sso/managing-clarity-employees.md

Learn more about the business problems Clarity is seeking to solve for its employees.
:::

:::{grid-item-card}  Using Okta for Authentication and SSO
:link: ./module-4-identity-management-and-sso/using-okta-for-authentication-and-sso.md

Learn about SAML authentication and how to configure Okta single sign-on service with Liferay.
:::

:::{grid-item-card}  Managing Clarity Business Partners and Guests
:link: ./module-4-identity-management-and-sso/managing-clarity-business-partners-and-guests.md

Finally, learn about different authentication options Clarity could use for its business partners and other users.
:::
