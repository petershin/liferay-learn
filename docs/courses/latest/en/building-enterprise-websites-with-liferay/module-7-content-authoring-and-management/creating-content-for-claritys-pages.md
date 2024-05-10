---
uuid: d304bf82-c70f-4470-ac61-8d41bf737851
---
# Creating Content for Clarity’s Pages

As we mentioned in the module introduction, *Content Management* is a broad term that can apply to a range of feature sets in the data lifecycle. We're going to focus specifically on the bread-and-butter features used to create *page content* with Liferay, along with some of the commerce-specific features that Clarity is interested in implementing. These include the following:

- Web Content: Articles, Structures, and Templates
- Forms
- Catalogs, Products, and Channels

## Web Content

Liferay’s web content interface is a core part of the platform’s functionality. Using structures and templates, you can build and display articles of web content through content pages, display pages, widgets, or fragments, which you learned about in the previous module. Web content articles are dynamic, versatile assets, in large part because they are made up of web content structures. 

### Structures

Web content structures are the building blocks of Liferay content. They determine what kinds of information you need to provide for a given web content article. Structures allow you to enforce a format for your content using a straightforward drag-and-drop interface with several types of fields. A single structure can be reused in multiple places, reducing effort for writers, editors, and designers alike. Liferay includes a Basic Web Content structure out of the box, but you can tailor your own structures to your specific needs.

### Templates

Web content templates provide an extra layer of configuration and customization to web content. Templates use the FreeMarker Template Language (FTL) to determine how content is rendered on a page. A template can be linked to a web content structure or even embedded in other templates.

## Forms

Enterprises can use forms to gather data directly from users. Like web content structures, forms are built from a set of fields with a drag-and-drop interface. In this case, however, the fields determine the type of input the user must provide to the form. Once you’ve built the form, you can display it on a page using one of Liferay’s out-of-the-box widgets.

Liferay collects form responses and displays them in the *Entries* tab for that form. These responses can provide valuable insights into users’ behavior and thoughts, which is critical in guiding content development. You can also define rules that will modify forms if certain responses are given or other conditions are met. This is a powerful feature that makes more complex, dynamic forms easy to produce.

## Commerce

Although they are not yet a B2C enterprise, Clarity wants to leverage some of the capabilities available through Liferay Commerce to create product-specific content. Because the Commerce and DXP codebases have been merged, using these features is easier than ever. While it is feasible to build Clarity's product material using web content structures, Liferay’s commerce features may provide an additional layer of future-proofing to the website. In this section, we'll cover the following commerce features:

- Catalogs
- Products
- Channels

### Catalogs

A catalog is a group of related products. Liferay catalogs provide a highly flexible way to organize your product offerings in the most sensible way for your business. There is no limit to the number of catalogs you can create, although maintenance effort should be a factor in how many you choose to have. Catalogs also allow you to define permissions for the products they contain, so that different product teams can manage different product groupings.

In addition, catalogs capture important commerce attributes like language, currency, and price lists, along with a placeholder image for products without an associated image. As useful as catalogs are, they are just empty containers without the products to populate them. Let's take a look at products next.

### Products

Like any manufacturer, Clarity has variants of their products designed to achieve different goals and target different customer profiles. Liferay Commerce supports four product types out of the box:

- Simple Product

    Any physical product for which inventory is tracked.

- Virtual Product

    Any non-tangible product, such as music files, electronic publications, services, and warranties.

- Grouped Product

    Two or more products from a Catalog that are packaged together and sold as a single item. Grouped products are tracked in your inventory and can contain simple products, virtual products, or other grouped products.

- Shop by Diagram

    Component parts belonging to a Bill of Materials (BOM) diagram that references products in the store.

 Products offer more than just a predefined type of content--they offer many additional features that together create a first-class commerce experience with minimal effort:

- Product details
- Product options
- Units of measure
- Configurable products
- Product media (images, videos, etc.)
- Related products
- Downloadable product documents
- Product availability
- Product variants

While Clarity could model all of these product types and attributes with web content structures, Liferay commerce provides an intuitive solution that you can implement with ease.

### Channels

Once their products and catalogs are configured, Clarity needs to think about how they will display their products to customer and website visitors. Channels are the storefront where products are displayed and sold to customers. They come with several useful features:

- Store administrators can create multiple channels, each representing a different customer experience (B2B, B2C, B2X)

- Channels can be linked to Liferay sites

- You can use Liferay's headless APIs to creative native mobile applications with channels or integrate channels with external marketplaces

- Channels define default display languages and currencies, as well as default product display pages and category pages

- For transactional sites, channels offer payment, shipping, and tax information

While e-commerce isn’t Clarity’s main focus right now, setting up these features will set them up for success in the future.

## Exercise One: Creating Web Content Structures and Articles

In this exercise, you’ll build an FAQ web content structure and then generate several FAQ web content articles with it. Later in the module, you’ll learn how to display these articles on Clarity’s FAQ page.

1. Navigate to _Site Menu_ &rarr; _Content & Data_ &rarr; _Web Content_. 

1. Go to the _Structures_ tab and click the _New_ button to enter the structure builder.

1. Edit the title of the structure to “FAQ”. Each article of web content you create from this structure will correspond to a single frequently asked question.

1. In the _Builder_ sidebar, find the _Rich Text_ field in the Fields tab. Drag and drop this field into your structure.

1. With the _Rich Text_ field selected, the sidebar will contain two tabs, _Basic_ and _Advanced_. In the _Basic_ tab, update _Label_ to “Answer”. Then select the _Advanced_ tab and update _Field Reference_ to “Answer” as well. This field will contain the answer to the frequently asked question.

1. Click _Save_ to create the FAQ web content structure. This action will return you to the _Structures_ tab on the _Web Content_ page.

1. Navigate to the _Web Content_ tab. Navigate into the _FAQs_ folder. Select _New_ &rarr; _FAQ_ to enter the _New Web Content_ editor.

1. Update the title of the FAQ to “What is your return policy?”. Select the Answer field and add the following text: “We offer a 30-day return policy from the date of delivery. Items must be unused and in the same condition that you received them, including all original packaging.”

1. Click _Publish_ to create the new FAQ web content article in the _FAQs_ folder. 

1. Repeat Steps 7-9 to add more FAQs with the following question/answer pairs:

    - “Can I become a retail partner?” / “Yes, we are always looking to expand our network of retail partners. If you are interested in stocking our eyewear, please contact our sales team for more information.”
    “What payment methods do you accept?” / “We accept various payment methods including credit cards (Visa, Mastercard, American Express), PayPal, and bank transfers.”

    - “Do you offer eye exams?” / “Yes, we do. We have qualified optometrists who can conduct comprehensive eye exams to determine your prescription and check for any eye health issues.”

    - “Do I have to pay for return shipping?” / “Return shipping costs are the responsibility of the customer unless the item is defective or an error was made on our end.”

    - “How can I place an order?” / “You can place an order through our website. Simply choose the glasses you like, select your prescription and lens type, add the item to your cart, and proceed to checkout.”

    - “What types of eyewear do you offer?” / “We offer a wide range of eyewear including prescription glasses, sunglasses, and contact lenses. We also have a collection of designer frames to suit different styles and preferences.”

    - “Do you have retail partners where I can try on your eyewear?” / “Yes, we have partnered with various optical shops where you can try on our eyewear. Please visit our website to find the nearest location.”

You should now have three FAQ web content articles created from the FAQ web content structure.

## Exercise Two: Creating a Web Content Template (BONUS)

<!--TODO-->
Coming Soon!

## Exercise Three: Creating a Form for User Feedback

Clarity wants to include a _Contact Us_ form on their website that would allow users to submit feedback, requests, and other comments. 

1. Navigate to _Site Menu_ &rarr; _Content & Data_ &rarr; _Forms_. 

1. Select _New_ to enter the form builder.

1. Update the form title to “Contact Us”.

1. On the first page of the form, update the page title to “Let us know what you’re thinking!”

1. Drag and drop a _Rich Text_ field into the page. In the sidebar, delete the text in the _Label_ field.

1. (Optional) Modify the Success Page with a message of your choosing.

1. Click _Publish_ to create the _Contact Us_ form.

## Exercise Four: Creating a Catalog and Product

<!--TODO-->
Coming Soon!

## Exercise Five: Creating a Channel (BONUS)

<!--TODO-->
Coming Soon!

This concludes *Creating Content for Clarity’s Pages*.

Next Up: [Organizing Clarity’s Content](./organizing-claritys-content.md)

<!-- TODO: Add Additional Resources section. -->
