---
toc:
- ./module-4-identity-management-and-security/claritys-authentication-and-sso-requirements.md
- ./module-4-identity-management-and-security/understanding-liferay-authentication.md
- ./module-4-identity-management-and-security/managing-clarity-employees.md
- ./module-4-identity-management-and-security/using-okta-for-authentication-and-sso.md
- ./module-4-identity-management-and-security/managing-clarity-business-partners-and-guests.md
uuid: 57aef6ee-03e9-4056-abf1-ebdbdb4984e4
---
# Module 4: Identity Management and Security

!!! important "Webinar Note"
    This module was presented using slides for a live webinar audience. The formatting, presentation, and examples may differ from what is presented here as part of the course.

    **Identity Management & SSO**:
    * View the [recording](https://learn.liferay.com/web/guest/d/lp1-4-identity-management-sso) from the live webinar of this module.
    * Download the [PDF](https://learn.liferay.com/documents/d/guest/lp1-4-identity-management-sso-pdf) of the presentation used in the live workshop.

    **Users and Permissions**:
    * View the [recording](https://learn.liferay.com/web/guest/d/lp1-5-users-permissions) from the live webinar of this module.
    * Download the [PDF](https://learn.liferay.com/documents/d/guest/lp1-5-users-permissions-pdf) of the presentation used in the live workshop.

Identity Management (IdM) involves processes and technologies for ensuring only the right people have access to the right systems and resources. It encompasses the creation, maintenance, and control of user identities across various systems and applications. By verifying who users are (authentication) and determining what they're allowed to access (authorization), IdM safeguards sensitive information and ensures only authorized individuals can perform specific actions. A comprehensive IdM strategy strengthens security, simplifies user access management, and helps organizations comply with data privacy regulations.

As such, identity management plays an important role in any enterprise solution, even Clarity's enterprise website. This may seem counterintuitive because the site's main audience primarily consists of anonymous users browsing public pages. However, Clarity needs a small team of employees who can log into the system to create and maintain their content. Also, since the website is intended to convert visitors to distributors, they'll need a way for interested visitors to create accounts so that they can have a more personalized experience.

!!! note "Authentication and Authorization"
    Authentication determines whether and how a user can log into a system, while authorization is more about how to limit access to assets like sites, pages, content, images, documents, and so on.

When we talk about identity management with Liferay, we’re talking about providing users with the ability to authenticate to the portal and access protected systems and resources. Single Sign-On (SSO) is a complementary topic in which users who are authenticated can access multiple systems or resources with the same set of credentials.

For the scope of this course, we won't cover every possible identity management scenario. Instead, this module focuses on key decision points that are applicable to other solutions and scenarios.

After completing this module, you will know how to

* Configure an integration using Okta as SSO and IdM.
* Distinguish the authentication experience for Clarity's employees, business partners, and guest users.
* Manually create users, user groups, and roles in Liferay DXP.
* Streamline role management with user groups.
* Assign granular permissions to roles to ensure appropriate access to Liferay applications and resources.

Up First: [Clarity's Authentication and SSO Requirements](./module-4-identity-management-and-security/claritys-authentication-and-sso-requirements.md)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card}  Clarity's Identity Management Requirements
:link: ./module-4-identity-management-and-security/claritys-identity-management-requirements.md

Learn about Clarity's requirement for user authentication and authorization.
:::

:::{grid-item-card}  Understanding Liferay Authentication
:link: ./module-4-identity-management-and-security/understanding-liferay-authentication.md

Learn the basics of Liferay authentication and identity management.
:::

:::{grid-item-card}  Managing Clarity Employees
:link: ./module-4-identity-management-and-security/managing-clarity-employees.md

Learn more about the business problems Clarity is seeking to solve for its employees.
:::

:::{grid-item-card}  Using Okta for Authentication and SSO
:link: ./module-4-identity-management-and-security/using-okta-for-authentication-and-sso.md

Learn about SAML authentication and how to configure Okta single sign-on service with Liferay.
:::

:::{grid-item-card}  Managing Clarity Business Partners and Guests
:link: ./module-4-identity-management-and-security/managing-clarity-business-partners-and-guests.md

Finally, learn about different authentication options Clarity could use for its business partners and other users.
:::

:::{grid-item-card} Creating Users, User Groups, and Roles
:link: ./module-4-identity-management-and-security/creating-users-user-groups-and-roles.md

Learn how to manually create users, user groups and roles for Clarity's team members.
:::

:::{grid-item-card} Setting Permissions and Securing Clarity Content
:link: ./module-4-identity-management-and-security/setting-permissions-and-securing-clarity-content.md

Learn the fundamentals of assigning permissions to roles to secure Liferay applications and resources.
:::
::::