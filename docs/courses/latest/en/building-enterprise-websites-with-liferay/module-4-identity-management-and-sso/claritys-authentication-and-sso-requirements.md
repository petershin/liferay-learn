---
uuid: 439f9636-f431-4d6a-ad6c-3cad78e92803
---
# Clarity's Authentication and SSO Requirements

Identity management (IdM) and single sign-on (SSO) requirements vary significantly based on your solution type and target organization. For example, public-facing marketing websites have very different needs compared to B2B supplier portals. Similarly, financial services organizations with office-based employees accessing multiple systems and applications differ from organizations with a mobile workforce using a single app on company issued tablets. Overall factors like user base size, access methods (e.g., web, mobile app), and anticipated authentication frequency impact design and implementation for optimal performance and scalability.

## Requirements

Let's take a look at the specific requirements Clarity has around identity management and SSO.

### Seamlessly integrate Liferay with their existing SSO solution (i.e. Okta)

Like many organizations, Clarity is already using an SSO solution to grant access to organization applications and services. To reduce cost and improve user experience, Clarity want to continue using their existing solutions. With support for leading IdM and SSO services and protocols, Liferay can facilitate this integration and remove the need for additional login credentials.

![Liferay supports these IdM and SSO services.](./claritys-authentication-and-sso-requirements/images/01.png)

### Provide alternative forms of identity management and authentication for different sets of users

In addition to supporting integration with external systems, Liferay also provides its own robust identity management and SSO capabilities. This empowers Clarity to implement alternative identification and authentication methods for different user groups (e.g., employees, B2B partners). They have the flexibility to choose Liferay's out-of-the-box solution, integrate with one of many external solutions, or even implement a hybrid approach combining both.

### Leverage user groups in their existing user directory

Liferay can seamlessly integrate with various user directories. This means Clarity can sync user groups from their existing solutions to streamline user management and permissions in Liferay. We'll explore this in a later module.

## Conclusion

With these requirements in mind, let's explore Liferay's different identity management tools and features.

Next Up: [Liferay Authentication](./liferay-authentication.md)
