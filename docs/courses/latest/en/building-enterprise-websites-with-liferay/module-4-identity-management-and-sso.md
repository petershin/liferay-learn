---
toc:
- ./module-4-identity-management-and-sso/liferay-authentication.md
- ./module-4-identity-management-and-sso/managing-clarity-employees.md
- ./module-4-identity-management-and-sso/using-okta-for-authentication-and-sso.md
- ./module-4-identity-management-and-sso/managing-clarity-business-partners-and-guests.md
uuid: 57aef6ee-03e9-4056-abf1-ebdbdb4984e4
---
# Module 4: Identity Management & SSO

Before we can get started with building Clarity’s website, we’ll first need to get logged in and ensure that other content contributors can also get logged in. *Identity Management* plays an important role in any enterprise software project, even when building an Enterprise Website such as Clarity. This may seem counterintuitive, because the main audience of the site will initially be anonymous users browsing public pages. However, there will be a small team of Clarity employees that will be logging into the system to create and maintain the content. Additionally, Clarity has some B2B partners with existing user accounts from their previous platform and aims to enable new distributors to create accounts for a more personalized experience.

When we talk about identity management in the context of Liferay, we’re talking about providing the ability to manage users and provide those users with the ability to authenticate to the portal to access protected resources. *Single Sign-On*, or SSO, is a complementary topic in which users who are authenticated can access multiple systems or resources with the same set of credentials.

In many enterprises today, there are already systems managing both identity and authentication. The good news is that not only does Liferay provides very robust identity management and single sign-on capabilities but also supports integration with many leading IdM and SSO services and protocols.

<!-- ![Logos of IdMs and SSOs Liferay is compatible with](https://) -->

Additionally, Liferay also supports scenarios where different types of users are managed by different identity management systems and authentication mechanisms.

Identity management and single sign-on can be a pretty big topics, so before we get into the details, let’s examine the scope of this module and understand Clarity’s business needs.

## Clarity's Requirements

!!! important "Key Decision"
    Identity management and single sign on requirements will vary greatly depending on the type of solution you are building and the organization that you are building it for. For example, the needs of a public facing, marketing website are going to be very different from the needs of a B2B Supplier portal, and similarly the needs of a financial services organization whose employees are based in offices and have their own workstation to access multiple systems and applications might be very different from the needs of a services organization with a mobile workforce who only have access to a single mobile app on a company issued tablet. Finally, how, where, and how many users you have and expect to authenticate can also be a significant design and implementation factor when thinking about how to optimize site performance and scalability.

Let's summarize Clarity's requirements related to identity management & single sign-on:

* There will be three different sets of users for their enterprise website:
  * Clarity employees who will be building and managing the new site
  * Clarity B2B business partners
  * And anonymous guest users, who will make up the majority of the site's visitors
* Authenticated users should seamlessly integrate from Clarity's existing user directory
* Clarity's employees and B2B users must be able to log in using Clarity's existing SSO solution

<!-- ![Diagram of Clarity's users](https://) -->

Fortunately, Liferay excels at powering a wide variety of solutions and can meet the needs of just about any type of organization. However, for the purposes of this training, we are going to be focusing on the needs of Clarity and, for now, Clarity is focused on implementing their public facing website where the vast majority of site visitors will be anonymous users browsing the site to learn more about Clarity’s products and services. We need to consider the type of identity management solution Clarity may already be using and how the users, specifically the ones managing content and requiring access to the website, will be interacting with the solution.

For the scope of this course, we will not be covering every possible identity management scenario. Instead, this module focuses on the key decision points for Clarity and will provide references to supplemental content that might be applicable to other solutions or scenarios.

In this module, you will learn:

* The basics of Liferay authentication and identity management
* How to configure an integration using Okta as SSO and IdM
* How to distinguish the authentication experience for Clarity's employees, business partners, and guest users

Up First: [Liferay Authentication](./module-4-identity-management-and-sso/liferay-authentication.md)

::::{grid} 2
:gutter: 3 3 3 3

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
