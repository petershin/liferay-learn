---
uuid: f84e7f9c-bbb1-4d3f-b20b-032c82c978ed
---
# Managing Clarity Employees

As we’ve mentioned earlier, visitors to Clarity's site can be broadly categorized into three groups, Clarity employees, B2B partners, and anonymous guests. Since we need to get employees logged into the system to begin creating the site structure and the content, we are going to focus first on them.

Clarity is already using Okta as their identity management system for managing their employee’s identity and also as their SSO solution. Additionally, they have established processes with their HR department for onboarding new employees and adding their data to the system which requires integrations with their identity management provider. Therefore, it is critical that we leverage these systems and processes and don’t force Clarity to duplicate the work that is being done elsewhere. Fortunately, as we covered in our last lesson, Liferay can work with a wide variety of IdM and SSO providers and protocols.

## Revisiting Clarity's Critical Success Factors

In an earlier course, Clarity established several [critical success factors](../module-1-getting-started-with-clarity/the-clarity-story.md#critical-success-factors) for their new project with Liferay. Let's revisit those factors in the context of Liferay's Identity Management and SSO features.

### Non-Technical Participation

With Liferay, many of these factors are being supported with regards to Identity Management and SSO. One key benefit with Clarity's decision to go with Liferay is that integrating IdM and SSO with Liferay is a *configuration activity*, not a development task. When tasks like integration with IdMs and SSOs can be achieved without development time and effort, we contribute to several of Clarity's critical success factors simultaneously.

Liferay’s extensive support for multiple identity management and single sign-on vendors and protocols ensure that even a non-technical user can easily integrate Liferay with existing identity management systems through configuration and with minimal IT involvement. We’ll be focusing on integration with a single vendor in this training, but the process for other vendors will be very similar and we have extensive documentation for all of the configuration options.

### Unified Platform and Simplified Maintenance

By leveraging Clarity’s existing Identity Management solution, we are going to be simplifying the maintenance of employee identity within the platform, and we’ll be ensuring that as employee information is updated by HR, those updates are going to be reflected in Liferay as well.

### Increased Engagement through Personalization

Another advantage is that, beyond basic identity management data like name and email address, we can also synchronize a wide range of employee information. This additional information could also be used to segment employees in order to deliver a more personalized experience on the website. This might not be critical for this first phase of building an enterprise website, but for future projects, this will be very important.

### Risk Mitigation with Better Governance

Additionally, identity management solutions help to mitigate risks and to ensure better governance by making sure the right employees have the right roles and can access the right information. We’ll be covering more about roles in the next module, but rest assured that Liferay makes it easy to leverage information in an organization’s identity management solution to organize users and simplify the management of their permissions. And of course, when an employee’s time with Clarity is over, it’s important that access to critical systems, such as the website is revoked in a timely manner.

### Lower Total Cost of Ownership

And lastly, by offloading the majority of identity management to a dedicated identity management system, that is managed by the right people, we’re lowering the cost of managing the Liferay solution by reducing the duplication of effort of managing identity in multiple systems. Also, by relying on integration, we are improving data accuracy. Instead of adding and maintaining users in an additional system, we can focus our efforts on building a great website experience for our customers!

## Clarity Requirements

For the remaining lessons in this module, we will be working to satisfy the following requirements for Clarity:

1. Providing secure access for Clarity's Content Managers and System Administrators
1. Keeping employee information up-to-date

Let's look into each of these requirements in further detail.

### Providing Secure Access

Clarity has provided us with their business requirements for this project and there are several that are related to identity management and single sign-on. The first that we are going to be tackling is to provide secure access for Content Managers and System Administrators. For some organizations, adding a new corporate system invariably comes with adding another username/password combination to a long list of usernames and passwords. Clarity has made it very clear that they don’t want this to be the case for adopting a new enterprise website. Thankfully, Liferay provides support for a wide variety of identity management and single sign-on solutions to be able to leverage Clarity’s existing solution to satisfy this requirement.

### Keeping Employee Information Up-to-Date

Another requirement that Clarity has, is to keep employee information up-to-date. With their previous solution, it was necessary to get IT involved in user management and there was usually a significant amount of lag time between when a new employee was on-boarded to the company and when he or she could securely access the website. Similarly, when employees left the company, access might not be revoked for days or even weeks. Since HR already has processes in place to ensure that the corporate identity management solution stays up-to-date, Clarity wants to ensure that the new enterprise website is able to take advantage of this information to ensure access to the system is also up-to-date.

Next Up: [Using Okta for Authentication and SSO](./using-okta-for-authentication-and-sso.md)
