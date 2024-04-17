---
uuid: 439f9636-f431-4d6a-ad6c-3cad78e92803
---
# Clarity's Authentication and SSO Requirements

Identity management and single sign-on requirements can vary greatly depending on the type of solution you are building and the organization that you are building it for. For example, the needs of a public facing, marketing website are going to be very different from the needs of a B2B supplier portal, and similarly the needs of a financial services organization whose employees are based in offices and have their own workstation to access multiple systems and applications might be very different from the needs of a services organization with a mobile workforce who only have access to a single mobile app on a company issued tablet. Finally, how, where, and how many users you have and expect to authenticate can also be a significant design and implementation factor when thinking about how to optimize site performance and scalability.

Let's take a look at the specific requirements Clarity has around identity management and SSO.

### Clarity needs Liferay to be able to seamlessly integrate with their existing SSO solution (i.e. Okta).

In many enterprises today, there are already systems managing both identity and authentication. Therefore Liferay supports integration with many leading IdM and SSO services and protocols to help minimize the need for additional login credentials.

![Logos of IdMs and SSOs Liferay is compatible with](./claritys-authentication-and-sso-requirements/images/01.png)

### Clarity has different sets of users (i.e. employees and B2B partners) that need alternative forms of identity management and authentication.

Liferay not only provides external integration support, but also its own robust identity management and single sign-on capabilities. You are free to choose one option for one set of users and another option for another set of users. Therefore, Clarity is free to choose Liferay's out-of-the-box solution, one of many external solutions, or a combination of solutions.

### Clarity wants to leverage user groups in their existing user directory.

Liferay supports integration with various active directories and user directories. User groups can also be synced from these external solutions to streamline user management and permissions in Liferay, as we will see in a later module.

Now let's move on to the different identity management tools and features Liferay offers.

Next Up: [Liferay Authentication](./module-4-identity-management-and-sso/liferay-authentication.md)
