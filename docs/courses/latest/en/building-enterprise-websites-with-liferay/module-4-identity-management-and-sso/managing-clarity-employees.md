---
uuid: f84e7f9c-bbb1-4d3f-b20b-032c82c978ed
---

# Managing Clarity Employees

As we’ve mentioned earlier, Clarity's site visitors can be broadly categorized into three groups, Clarity Employees, Clarity's B2B Partners, and anonymous guest users.  We are going to focus first on the employees, since we are going to need to get employees logged into the system to begin creating the site structure and the content.

Clarity is already using Okta as their identity management system for managing their employee’s identity and also as their SSO solution. Additionally, they already have processes established with their HR department for onboarding new employees and adding their data to the system, and they already have several other integrations with their identity management provider, so it’s critical that we leverage those systems and processes and don’t force Clarity to duplicate the work that is being done elsewhere. Fortunately, as we covered in our last lesson, Liferay can work with a wide variety of IdM and SSO providers and protocols.

## Revisiting Clarity's Critical Success Factors

Outlined in an earlier course, Clarity identified several critical success factors. One key benefit with Clarity's decision to go with Liferay is that integrating idm and SSO with Liferay is a configuration activity, not a development task. When tasks like integration with IdMs and SSOs can be achieved without development time and effort, we contribute to several of Clarity's critical success factors simultaneously.

1. Non-technical participation &#x2705;
1. Simplified maintenance (and evolution) &#x2705;
1. Future proofed and flexible
1. Increase engagement and user experience through personalization &#x2705;
1. Risk mitigation with better governance &#x2705;
1. Lower investment / total cost of ownership &#x2705;



==

# Module 4

* Introduction: Clarity has users and we need to get them logged in.
  * what is IdM and how does it relate to Liferay
  * How does SSO relate
  * most companies already are using these
  * Liferay plays nice with them
* Why is this important?
  * What are the overall clarity requirements?
  * What are we going to learn?

* Managing Clarity Users
  * Clarity has users in okta
  * One key benefit with Clarity's decision to go with Liferay is that integrating idm and SSO with Liferay is a configuration activity, not a development task.
  * This keeps us aligned with some of Clarity's CSF's - non-technical participation; simplified maintenance; risk mitigation; lower tco
    * How?
      * First - maintenance is simplified b/c Clarity's employee info continues to be maintained in one location (their IdM solution) - but it's all updated and synced to liferay and reflected there as well
      * second - we open the possibility for syncing additional employee information to liferay that can be used for experience personalization
      * third - idm solutions help mitigate risks and ensure better governance by ensuring users are grouped correctly, have the right roles, and the right access. Roles and permissions will be covered in the following module. Liferay makes it easy to leverage
      * ...
