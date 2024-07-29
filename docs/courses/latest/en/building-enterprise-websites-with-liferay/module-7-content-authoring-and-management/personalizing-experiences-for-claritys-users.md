---
uuid: 625dac83-df1c-4da9-93ba-49fba8fd955d
---
# Personalizing Experiences for Clarity’s Users

A great website experience can help keep Clarity's visitors engaged and ultimately lead to more sales. Liferay provides different tools to help you understand who your customers are and optimize your site to increase engagement. Clarity can use these tools in combination with Analytics Cloud to personalize the user experience.

This article will dive further into the suite of features that Clarity can use to develop focused experiences for their users. We will cover the following topics:

- Segmentation management
- Personalized experiences
- A/B testing

## Segmentation Management

The first thing you need to do to provide personalization is identify your user segments. Clarity already understands their segments, so now they just need to tell Liferay about them using the Segmentation Management feature. Liferay has a powerful visual rule builder that you can use to create audience segments based on user and organization attributes, as well as session properties and custom fields.

<!--IMAGE: screenshots of rule builder UI-->

The rule builder uses semantic building blocks, which means you can define segments by constructing a "sentence" that describes the criteria. There are several predefined segmentation rules that you can use, and Liferay also supports the creation of custom fields that you can build rules around. You can also build new segments by combining existing segments, enabling more specific, focused user experiences.

Segmentation integrates with Liferay Analytics Cloud, which adds support for long-time behavior and third party data (such as Salesforce). In addition to the visual user interface, you can also use headless APIs to create custom properties for segmentation.

Once your segments are defined, they are available for use alongside Liferay's site and content management features.

## Personalized Experiences

You can personalize pages for different user segments by creating a Liferay Experience for each segment. This allows you to only show elements and content that are relevant to that segment. You can personalize almost any element of a page, from images and text to fragments and navigation. Additionally, you can create rules that cater to specific breakpoints, such as screen size.

Creating experiences out of segments is an intuitive, non-intrusive part of the site building and content management interfaces that Liferay provides.

Sometimes, we have more than one idea on how to serve a certain audience, but we aren't sure which option is best. This is where A/B testing comes into play.

## A/B Testing

With A/B testing, you can make two variants of a site page and compare the click rate or bounce rate of the two pages. Some visitors will see one variant, while another group will see an alternative. You can test the performance of the two variants and determine which is better for your customers.

The tight integration between Liferay DXP and Analytics Cloud means setting up A/B tests, tracking results, and publishing variants is simple. Liferay provides a UI for non-technical users to administer A/B tests with granular control over the test configuration and criteria. The tests are automatically synchronized with Liferay Analytics Cloud, which will provide you with test history, statistics, variant performance benchmarks, and more.

In the short term, Clarity can use this feature to determine the best content and click-through path for driving distributors to complete the application process. In the long term, considering their plans for B2C, they can use A/B tests to determine the best promotions or product discovery routes to help customers go from interest to purchase as efficiently as possible. These are a few ways in which A/B testing can help you optimize your business.

<!--Exercise 21a-->
## Exercise: Tailoring Experiences by User Group and Role

Segmentation involves grouping website visitors and users into categories based on shared characteristics or behaviors. Segmenting your audience allows you to tailor the website experience, delivering more relevant content and ultimately boosting engagement.

Here, you'll create a segment specifically for Distributor users as the Clarity Admin user.

To do this,

1. Sign in as the Clarity Admin user.

   * Email: `admin@clarityvisionsolutions.com`
   * Password: `learn`

1. Add a new user with the following attributes.

   | Field         | Value                               |
   |:--------------|:------------------------------------|
   | Screen Name   | `terrencewheatley`                  |
   | Email Address | `terrence.wheatley@distributor.com` |
   | Job Title     | `Distributor`                       |
   | First Name    | `Terrence`                          |
   | Last Name     | `Wheatley`                          |
   | Password      | `learn`                             |

   <!--TASK: mail's reference needs to be changed -->

1. Create a new user group called *Distributors*.

1. Add Terrence Wheatley to the group.

1. Create a new regular role called *Distributor*.

1. Assign the role of Distributor to the Distributors User Group.

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *People*, and select *Segments*.

1. Click *New* to create a segment.

1. For title, enter `Distributors`.

1. From the Properties menu, use the User section and drag the *Regular Role* into the main part of the screen.

1. Leave the condition as `equals` and use the Select button to choose the Distributor role.

1. From the Properties menu, use the User section and drag the *User Group* into the main part of the screen.

1. Leave the condition as `equals` and use the Select button to choose the Distributors user group.

1. Change the conjunction to `Or`.

   We cover both scenarios here: users in the user group and those with the directly assigned Distributor role.

   ![Set the regular role to Distributor and the user group to Distributors.](./personalizing-experiences-for-claritys-users/images/01.png)

1. Click *View Members* to validate Terrence Wheatley meets the segment condition.

1. Click *Save*.

1. Go to the home page and click *Edit* (![Edit](../../images/icon-edit.png)).

1. Click the *Experience* drop down at the top of the page and choose *New Experience*.

1. For the Experience Name enter *Distributor*.

1. For the Audience, choose the *Distributors* option.

1. Click *Save*.

1. Use the up arrow on the Distributor row to position the segment above the Default item so that the Distributor entry shows first.

   **Note:** The experience order determines their priority. Internally, Liferay checks the segments a user belongs to and uses the match with the highest priority.

   Once the Distributor role is re-positioned, the label on the record should now read Active.

1. Modify the title text in the Banner to say `Welcome Back! Elevate Your Inventory with Premium Eyewear`.

1. Hide the `Distributor Promo` container, since distributors don't need to apply.

1. Click *Publish*.

1. You can test the different experiences using the Simulation (![Simulation](../../../../../dxp/latest/en/images/icon-simulation.png)) menu.

1. Choose to Preview By Segments. Then, use the Segment dropdown menu to toggle between `Anyone` and `Distributor` and view the corresponding changes in the main window.

1. Impersonate Terrence Wheatley to see the changes.

## Conclusion

Congratulations! You have now completed *Module 7: Content Authoring and Management*.

[Back to Building Enterprise Websites with Liferay](../../building-enterprise-websites-with-liferay.md)

<!-- TODO: Add Additional Resources section. -->