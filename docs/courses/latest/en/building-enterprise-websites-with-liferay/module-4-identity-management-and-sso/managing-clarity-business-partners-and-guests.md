---
uuid: 9bf15d62-c0a2-48af-9cb6-9197fca3b82c
---

# Managing Clarity Business Partners and Guests

Now that we have employees taken care of, we turn our attention to Clarity's business partners that will need to access the Web Site and unauthenticated guest visitors.

## Business Partner Requirements

In most cases, enabling business partner log-in to a new Enterprise Website may not be the highest priority use case. Business partner log-in is much more common when building a commerce solution, customer portal, distributor portal, or supplier portal. However, this use case is important enough and common enough that we will discuss its requirements and solutions in this lesson.

Clarity's business partner requirements:

* Provide business partners with secure access
* Segment business partners based on type and industry
* Maintain system performance

Clarity works with a variety of business partners, including their distributors and suppliers, and eventually those business partners will need to log in to access special sections of the website. With this future need in mind, Clarity has asked that we provide this capability right from the beginning of the project. Additionally, they would like the ability to group or segment those business partners by their industry or type.

And of course, they want to ensure that having additional users logging into the site doesn’t impact the overall site performance.

There a couple possible approaches to meeting these requirements with Liferay, each with their pros and cons.

## Liferay Authentication vs. External Authentication

As we’ve already seen, Liferay provides a wide variety of options for authenticating users, both internal and external. And, with Liferay, you aren’t locked into only having a single authentication and SSO mechanism for all users. In fact, it’s very common for Liferay solutions to leverage a combination of authentication mechanisms.

One pattern that we often see is that employees are managed through an existing enterprise wide identity management system, but external users are not, so Liferay’s built-in identity management and authentication capabilities are leveraged for those external users. This is a great way to start small, if you don’t have a lot of external users and performance isn’t yet a concern. As the size of your external user base grows you can always evolve to an external solution.

And, while authenticating external users, such as customers or distributors isn’t as common for enterprise web sites, there are definitely some advantages.  By encouraging your trusted business partners to authenticate to your website, you can deliver a more personalized experience to those users, driving customer satisfaction and loyalty.

However, as was noted earlier, using Liferay as your authentication mechanism does have some drawbacks, the most critical is performance. And considering that one of Clarity’s requirements was to maintain the performance of the website, it’s best that we leverage an external authentication mechanism.

## Using External Authentication for Business Partners

Clarity has decided that they will leverage their existing Okta solution for managing their business partners. They've decided to create a separate Okta group that will house their business partners.

!!! note
    If you are working with a trainer and/or using the Clarity site initializer your site will already have some user groups pre-configured for these business partner users.

In the next module, [Module 5 - Users and Permissions](../module-5.md), we’ll learn more about how these external users will be grouped together and managed.

## Addressing Anonymous Site Visitors

Ok, now that we have Clarity's employees and business partners taken care of, let’s turn our attention to the other third of the equation, web site visitors. Now it’s important to note that these visitors won’t be logging in, so identity management in the traditional sense doesn’t apply to these users. However, we still want to consider what their user experience will look like.

Since there is no need to authenticate anonymous site visitors, or guest users - there is no specific configuration we need to make for these users with regards to authentication. However, in latter modules we will be working to ensure that we can tailor personalized site experiences, even for this type of users.

## Conclusion

Congratulations! You've completed Module 4 - Identity Management and SSO.

[Back to Building Enterprise Websites with Liferay](../../building-enterprise-websites-with-liferay.md)

## Additional Resources

Although Clarity is not using Liferay's authentication features for it's employees or business partners, there are still a wealth of valuable features available to consider if you determine that using Liferay authentication is the best approach for your solution. See our documentation to learn more.

* [Securing Liferay](https://learn.liferay.com/web/guest/w/dxp/installation-and-upgrades/securing-liferay)
