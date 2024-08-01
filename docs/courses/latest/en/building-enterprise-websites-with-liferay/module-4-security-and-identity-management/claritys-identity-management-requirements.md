---
uuid: 439f9636-f431-4d6a-ad6c-3cad78e92803
---
# Clarity's Identity Management Requirements

As Clarity's business grows, so does the complexity of managing user access and security. A robust Identity Management (IdM) solution with Single Sign-On (SSO) capabilities is crucial to ensure secure access for various user groups while maintaining a smooth user experience. Here we'll review Clarity's specific IdM requirements for strengthening security, simplifying user access management, and complying with data privacy regulations.

## Authentication and SSO Requirements

Identity management (IdM) and single sign-on (SSO) requirements vary significantly based on your solution type and target organization. For example, public-facing marketing websites have very different needs compared to B2B supplier portals. Similarly, financial services organizations with office-based employees accessing multiple systems and applications differ from organizations with a mobile workforce using a single app on company issued tablets. Overall factors like user base size, access methods (e.g., web, mobile app), and anticipated authentication frequency impact design and implementation for optimal performance and scalability.

Let's take a look at Clarity's authentication and SSO requirements.

### Seamlessly integrate Liferay with their existing SSO solution

Like many organizations, Clarity is already using an SSO solution to grant access to organization applications and services. To reduce cost and improve user experience, Clarity wants to continue using their existing solutions. With support for leading IdM and SSO services and protocols, Liferay can facilitate this integration and remove the need for additional login credentials.

![Liferay supports these IdM and SSO services.](./claritys-identity-management-requirements/images/01.png)

### Provide alternative forms of identity management and authentication for different sets of users

In addition to supporting integration with external systems, Liferay also provides its own robust identity management and SSO capabilities. This empowers Clarity to implement alternative identification and authentication methods for different user groups (e.g., employees, B2B partners). They have the flexibility to choose Liferay's out-of-the-box solution, integrate with one of many external solutions, or even implement a hybrid approach combining both.

### Leverage user groups in their existing user directory

Liferay can seamlessly integrate with various user directories. This means Clarity can sync user groups from their existing solutions to streamline user management and permissions in Liferay. We'll explore this in a later module.

## Authorization and User Management Requirements

User management is an important part of any organization's IT procedures and policies. A robust user management system goes beyond just assigning roles. It empowers you to define granular permissions for platform actions, including application functionalities, content creation, and access to sensitive information. This ensures only authorized users can perform specific tasks, safeguarding data throughout the employee lifecycle, especially during crucial stages like onboarding and offboarding.

Let's take a closer look at Clarity's specific user management requirements.

### Enable non-technical users to manage users and permissions

Liferay provides robust user management tools for performing key tasks through the UI. Examples include creating and managing users, assigning roles and permissions, managing organizations and user groups, and leveraging accounts. You can even add custom fields and roles through the UI. This means Clarity's non-technical team members can cover all aspects of managing users without the need for IT staff.

### Use granular permissions to assign users necessary platform privileges

Liferay provides granular control over user permissions. Its multi-level system enables users to define permissions not just for the entire platform, but also for specific sites, organizations, libraries, and assets. Also, Liferay permissions are additive instead of subtractive, so users only have the permissions you explicitly assign them. With these features, Clarity can ensure users only have access to the resources and applications necessary to their responsibilities.

### Reduce management time and costs through reusable user segments

In Liferay, permissions are not only assignable to roles but also to user groups. If users in a specific group should have the same access and permissions on the platform, it makes sense for them to be grouped together with one set of permissions. Furthermore, user groups can be assigned automatically from user directories, as demonstrated in the previous module. This saves time and energy because new users who authenticate to Liferay don't need roles or permissions assigned to them individually, but automatically receive the permissions of their user group.

## Conclusion

With these requirements in mind, let's explore Liferay's authentication features.

Next Up: [Understanding Liferay Authentication](./understanding-liferay-authentication.md)
