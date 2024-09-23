---
toc:
- ./module-4-security-and-identity-management/claritys-identity-management-requirements.md
- ./module-4-security-and-identity-management/understanding-liferay-authentication.md
- ./module-4-security-and-identity-management/using-third-party-services-for-authentication-and-sso.md
- ./module-4-security-and-identity-management/understanding-liferay-authorization-and-user-management.md
- ./module-4-security-and-identity-management/adding-claritys-users-and-groups.md
- ./module-4-security-and-identity-management/defining-and-assigning-roles-to-claritys-users.md
uuid: 57aef6ee-03e9-4056-abf1-ebdbdb4984e4
---
# Module 4: Security and Identity Management

<!-- TASK: RENAME FILE, FOLDERS, AND LINKS -->

!!! important "Webinar Note"
    This module was presented using slides for a live webinar audience. The formatting, presentation, and examples may differ from what is presented here as part of the course.

    **Identity Management & SSO**:
    * View the [recording](https://learn.liferay.com/web/guest/d/lp1-4-identity-management-sso) from the live webinar of this module.
    * Download the [PDF](https://learn.liferay.com/documents/d/guest/lp1-4-identity-management-sso-pdf) of the presentation used in the live workshop.

    **Users and Permissions**:
    * View the [recording](https://learn.liferay.com/web/guest/d/lp1-5-users-permissions) from the live webinar of this module.
    * Download the [PDF](https://learn.liferay.com/documents/d/guest/lp1-5-users-permissions-pdf) of the presentation used in the live workshop.

Security is critical to any enterprise solution, but unfortunately it's often implemented as an afterthought. By contrast, security is built into Liferay's features from the start with a "secure by design" approach. Furthermore, Liferay's extensive configuration options empower you to fine-tune security features to fit your needs. While security is a broad concept, here we'll focus on how best practices around identity management can improve security and user experience.

Identity Management (IdM) involves processes and technologies for ensuring only the intended people have access to the right systems and resources. It encompasses the creation, maintenance, and control of user identities across various systems and applications. By verifying who users are (authentication) and determining what they're allowed to access (authorization), IdM safeguards sensitive information and ensures only authorized individuals can perform specific actions. A comprehensive IdM strategy strengthens security, simplifies user access management, and helps organizations comply with data privacy regulations.

!!! note "Authentication and Authorization"
    Authentication determines whether and how a user can log into a system, while authorization is about granting access to applications and assets (e.g., sites, pages, content, images, documents).

As such, identity management plays an important role in any enterprise solution, even Clarity's enterprise website. This may seem counterintuitive because the site's main audience primarily consists of anonymous users browsing public pages. However, Clarity needs a small team of employees who can log into the system to create and maintain their content. Also, since the website is intended to convert visitors to distributors, they'll need a way to manage interested visitors who create user accounts.

<!--TASK: Add Diagram-->

With Liferay, identity management is about providing users with the ability to authenticate to the portal and access protected systems and resources. Single Sign-On (SSO) is a complementary topic in which users who are authenticated can access multiple systems or resources with the same set of credentials.

For the scope of this course, we won't cover every possible identity management scenario. Instead, this module focuses on key decision points relevant to enterprise websites, though many of these points are relevant to other solutions and scenarios.

After completing this module, you will know how to

* Decide which authentication approach is best for your Liferay projects.
* Leverage Liferay with third-party authentication and SSO services.
* Manually create users, user groups, and roles in Liferay DXP.
* Assign granular permissions to roles to ensure appropriate access to Liferay applications and resources.
* Streamline role management with user groups.

Up First: [Clarity's Identity Management Requirements](./module-4-security-and-identity-management/claritys-identity-management-requirements.md)
