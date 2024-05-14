---
uuid: d304bf82-c70f-4470-ac61-8d41bf737851
---
# Creating Clarity's Web Content

As we mentioned in the module introduction, *Content Management* is a broad term that can apply to a range of feature sets in the data lifecycle. We're going to focus specifically on the bread-and-butter Liferay features used to create content for web pages.

## Web Content

Liferay’s web content interface is a core part of the platform’s functionality. Using structures and templates, you can build and display articles of web content through content pages, display pages, widgets, or fragments, which you learned about in the previous module. Web content articles are dynamic, versatile assets, in large part because they are made up of web content structures. 

### Structures

Web content structures are the building blocks of Liferay content. They determine what kinds of information you need to provide for a given web content article. Structures allow you to enforce a format for your content using a straightforward drag-and-drop interface with several types of fields. A single structure can be reused in multiple places, reducing effort for writers, editors, and designers alike. Liferay includes a Basic Web Content structure out of the box, but you can tailor your own structures to your specific needs.

### Templates

Web content templates provide an extra layer of configuration and customization to web content. Templates use the FreeMarker Template Language (FTL) to determine how content is rendered on a page. A template can be linked to a web content structure or even embedded in other templates.

## Exercise One: Creating Web Content Structures

In this exercise, you’ll build several structures for specific types of web content that Clarity wants to publish. Later in the module, you’ll learn how to display these articles on Clarity’s FAQ page. 

First, let’s create the web content structure for Announcements.

1. Navigate to _Site Menu_ &rarr; _Content & Data_ &rarr; _Web Content_. 

1. Go to the _Structures_ tab and click the _New_ button to enter the structure builder.

1. Edit the title of the structure to “Announcements”.

1. From the _Builder_ sidebar, drag and drop a _Text_ field into the structure. 

1. With the _Text_ field selected, the sidebar displays configuration options for the field. In the _Basic_ tab, update the _Label_ to “Message”. Make sure _Field Type_ is “Single Line” and _Required Field_ is toggled on.

1. Navigate to the _Advanced Tab_ and update _Field Reference_ to “message”. With the configuration for the _Message_ field complete, click the back arrow to return to the _Builder_ sidebar menu.

1. Drag and drop another _Text_ field just below the first one, following the visual indicators in the structure building interface. Update the _Label_ to “Link Text” and the _Field Reference_ to “linkText”. Click the back arrow to return to the _Builder_ menu.

1. Drag and drop a _Link to Page_ field on top of the _Link Text_ field, following the visual indicators in the interface. This action should create a _Fields Group_ that contains _Link Text_ and _Link to Page_.

1. Update the _Field Reference_ of _Link to Page_ to “linkPage”. Click _Save_ to publish the _Announcements_ web content structure.

1. Repeat steps 2-9 to create the following web content structures with their respective fields:

Job Listing:
| Field Type 	| Field Name 	|
| :--- 		| :--- 		|
| Rich Text 	| Role Overview 	|
| Rich Text 	| Key Responsibilities 	|
| Rich Text 	| Qualifications and Skills	|

Leadership Profile:
| Field Type 	| Field Name 	|
| :--- 		| :--- 		|
| Image	| Image 	|
| Text 		| Name 	|
| Text 		| Title 		|
| Rich Text 	| Bio		|

Article:
| Field Type 	| Field Name 	|
| :--- 		| :--- 		|
| Image	| Image 	|
| Rich Text	| Headline 	|
| Rich Text 	| Content	|

FAQ:
| Field Type 	| Field Name 	|
| :--- 		| :--- 		|
| Rich Text	| Answer 	|

You now have five web content structures implemented in Clarity’s website.

## Exercise Two: Creating Web Content Articles

1. Navigate to the _Web Content_ tab. Navigate into the _FAQs_ folder. Select _New_ &rarr; _FAQ_ to enter the _New Web Content_ editor.

1. Update the title of the FAQ to “What is your return policy?”. Select the Answer field and add the following text: “We offer a 30-day return policy from the date of delivery. Items must be unused and in the same condition that you received them, including all original packaging.”

1. Click _Publish_ to create the new FAQ web content article in the _FAQs_ folder. 

1. Repeat Steps 7-9 to add more FAQs with the following question/answer pairs. Note that the title of an FAQ web content article is the question itself.

    - “Can I become a retail partner?” / “Yes, we are always looking to expand our network of retail partners. If you are interested in stocking our eyewear, please contact our sales team for more information.”

    - “What payment methods do you accept?” / “We accept various payment methods including credit cards (Visa, Mastercard, American Express), PayPal, and bank transfers.”

    - “Do you offer eye exams?” / “Yes, we do. We have qualified optometrists who can conduct comprehensive eye exams to determine your prescription and check for any eye health issues.”

    - “Do I have to pay for return shipping?” / “Return shipping costs are the responsibility of the customer unless the item is defective or an error was made on our end.”

    - “How can I place an order?” / “You can place an order through our website. Simply choose the glasses you like, select your prescription and lens type, add the item to your cart, and proceed to checkout.”

    - “What types of eyewear do you offer?” / “We offer a wide range of eyewear including prescription glasses, sunglasses, and contact lenses. We also have a collection of designer frames to suit different styles and preferences.”

    - “Do you have retail partners where I can try on your eyewear?” / “Yes, we have partnered with various optical shops where you can try on our eyewear. Please visit our website to find the nearest location.”

You now have eight FAQ web content articles created from the FAQ web content structure.

## Conclusion

This concludes *Creating Clarity’s Web Content*. Now let’s take a look at some of Liferay’s commerce-specific content features.

Next Up: [Creating Clarity’s Commerce Content](./creating-claritys-commerce-content.md)

<!-- TODO: Add Additional Resources section. -->
