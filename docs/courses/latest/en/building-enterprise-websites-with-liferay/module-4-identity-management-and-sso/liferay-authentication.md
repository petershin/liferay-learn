---
uuid: 54ae8380-e390-4280-86fc-3e19f7d79889
---

# Understanding Liferay Authentication

<!--TASK: Rename file -->

Liferay DXP offers flexibility when it comes to user authentication. You can leverage built-in capabilities, integrate with external IdM systems, or even implement a hybrid approach. So, when you're setting up an authentication method, the first step is deciding whether to use a single authentication method for all users or a combination based on user types. Multiple factors can contribute to selecting the best strategy. Before exploring these factors, let's take a quick look at Liferay's authentication capabilities.

## Liferay Authentication Features

Liferay DXP offers a range of authentication options. By default, Liferay's login uses basic authentication while providing extensive configuration options for user authentication and management features, like [configurable password policies](https://learn.liferay.com/web/guest/w/dxp/users-and-permissions/roles-and-permissions/configuring-a-password-policy) and [multi-factor authentication](https://learn.liferay.com/web/guest/w/dxp/installation-and-upgrades/securing-liferay/multi-factor-authentication). Liferay also seamlessly integrates with several popular identity management and SSO providers right out of the box, supporting standards such as LDAP, SAML, and more.

![Third party identity management and single sign-on solutions supported by Liferay](./understanding-liferay-authentication/images/02.png)

For example, Liferay can easily be configured to integrate with popular LDAP directories such as Microsoft Active Directory or OpenLDAP. While for SSO, you can configure a connection to popular SSO providers such as Okta, PingFederate, Siteminder. With these possibilities in mind, let's consider which strategy is best for companies like Clarity Vision Solutions.

<!--TASK: Add diagrams and explanations for each authentication model, highlighting where Liferay fits in. -->

## Choosing an Authentication Strategy <!--wc-->

Liferay DXP offers a flexible approach to identity management and user authentication. When implementing authentication, we need to ask whether we're planning to use external authentication, Liferay's internal authentication, or some combination. The optimal choice primarily depends on your user base.

For organizations with a manageable internal user group, Liferay's internal authentication could satisfy the organization's security requirements. However, companies with diverse user groups like employees, partners, and customers can benefit from a hybrid approach. Since Liferay can seamlessly integrate with various third-party IdM and Single Sign-On (SSO) services, companies can implement a combination of authentication mechanisms to manage different user types effectively. One common pattern is to manage employees with an existing enterprise wide Identity Management system, while authenticating external users with Liferay’s built-in identity management and authentication capabilities. This way organizations can start small and evolve to an entirely external solution if the size of their external user base grows.

This raises a second factor when choosing an authentication strategy: performance. Depending on the number and type of users expected to authenticate to Liferay, using a dedicated IdM and SSO solution can have performance benefits for your Liferay project. While Liferay DXP has the capability to serve as a primary identity management system and to handle user authentication, Liferay's authentication is more suitable to low-traffic scenarios. High-traffic websites should consider leveraging external IdM solutions optimized for performance.

Beyond user base and performance, a company's existing infrastructure can significantly impact their authentication strategy. Cost and speed are crucial factors for any organization, and leveraging existing IdM and SSO implementations can offer substantial advantages. Many enterprises already manage user identities and authentication through established systems. If they do, they can integrate it with Liferay to leverage their technical investments, reduce development time, and streamline access control. This can improve user experience by ensuring a smooth and efficient login process for all existing users.

By carefully considering user base, performance needs, and existing infrastructure, organizations can leverage Liferay DXP's flexible authentication options to create a secure and user-friendly login experience. Now let's apply these considerations to Clarity Vision Solutions.  

Visitors to Clarity's website can be broadly categorized into three groups: Clarity employees, B2B partners, and anonymous guests. So far, Clarity has been using Okta as their identity management system for managing their employee’s identity and also as their SSO solution. Additionally, they have established processes with their HR department for onboarding new employees and adding their data to the system which requires integrations with their identity management provider. So it is critical to leverage these systems and processes. They also want to leverage Okta for their business partners. However, they will use Liferay authentication for general visitors who sign up to make inquiries or apply to become distributors. <!--TASK: Verify this is okay; otherwise stick to a completely Okta focused approach.-->

Before exploring how Clarity can set up Okta, let's cover Liferay DXP's default authentication experience.

## Liferay DXP's Default Authentication

By default, all new Liferay DXP environments begin with a single admin user. This is true for all deployment options, including SaaS, PaaS, and Self-Hosted. However, the credentials for this user depend on your deployment. For Liferay SaaS, login credentials are emailed to the project's initial administrator(s) during the provisioning process. However, for Liferay PaaS and Self-Hosted deployments, the default administrator email address is `test@liferay.com` and the default password is `test`.

!!! note 
    Liferay PaaS and Self-Hosted administrators can modify this default behavior using [portal properties](https://learn.liferay.com/w/dxp/installation-and-upgrades/reference/portal-properties).

So when you start up a new Liferay DXP environment, your first order of business should be to change the admin user's credentials. The default administrator credentials for the training workspace have already been updated: 

* **Email**: `admin@clarityvisionsolutions.com`
* **Password**: `learn`

Liferay DXP's default login method relies on the Sign In widget. This widget uses the database to authenticate users. After logging in, you can begin setting up an alternative authentication method.

## Conclusion

Liferay's flexible features empower organizations to tailor their identity management strategy to their specific needs. They can also start with a simple setup using Liferay's built-in features and seamlessly scale up by integrating external IdM and SSO solutions as their user base grows. 

Now that you have general understanding of Liferay's flexible authentication features, let's explore a concrete example of how Clarity can implement a custom authentication method.

Next Up: [Using Okta for Authentication and SSO](./using-okta-for-authentication-and-sso.md)
