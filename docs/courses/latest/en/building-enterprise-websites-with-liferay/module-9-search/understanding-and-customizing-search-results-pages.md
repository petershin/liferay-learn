---
uuid: 40f88570-abf4-44ab-af8c-1374bde0e20d
---
# Understanding and Customizing Search Results Pages

Clarity wants to have site visitors be able to search for content and find content quickly and easily. This can be accomplished by creating good navigation and leveraging Liferay's search features. For example, a customer looking for a pair of eyeglasses or sunglasses should be able to navigate the site to find the type of product they are looking for. The user might search by keyword or they might use search facets to filter through the list of products. Navigating Clarity's site should match the visitor's expectation to result in good user experience.

## Exercise 1: Understanding and Configuring a Product Page

We saw in [Module 7 - Content Authoring and Management](../module-7-content-authoring-and-management.md) how the Clarity team added different products (e.g. eyeglasses, sunglasses, etc.) onto the site. Let's take a closer look at the product list page to understand the different Liferay search widgets and how to configure them.

1. Navigate to `[server]:[port]/web/clarity/product-list` page (e.g. http://localhost:8080/web/clarity/product-list). See how most of the page is already built with different search widgets. 

   ![The product list page is made up of different widgets.](./understanding-and-customizing-search-results-pages/images/01.png)
   
   The left side module is made up of a search bar widget, a specification facet widget, and an option facet widget. The right side module is made up of a sort widget and a search results widget. Note that the search results widget under the commerce category of widgets is different from the search results widget under the search category of widgets. Only the commerce-related widget returns products.

   Below these two modules, there is a search options widget. If you inspect the configuration of this widget, you will see that _Allow Empty Searches_ is enabled. This setting is enabled so that all available assets are shown without any search queries.

1. In the top menubar, click the edit page icon. The page is still missing a category facet widget that would allow visitors to filter by the different types of Clarity products. Let's go ahead and add that widget.

1. Select _Fragments and Widgets_ in the left menu and select the _Widgets_ tab. Scroll down to the search widget section and locate the category facet widget. Drag the widget onto the left module below the search bar. Click _Publish_. 

   ![Add the category facet widget to the page.](./understanding-and-customizing-search-results-pages/images/02.png)

   The page can now be used by customers to filter by product category. 

## Exercise 2: Filtering Results with Custom Facets

As previously discussed, search results can be filtered across things such as content type (e.g. blogs, web content, etc.) or keyword categories (e.g. different categories found in the FAQ section.). But search results can also be filtered by custom facets with custom fields that you define. For example, as Clarity expands to other markets, they may need FAQs that are region specific. FAQ content can be tagged with a custom region and then filtered across them. Let's see this in action:

1. From the applications menu, navigate to _Control Panel_ &rarr; _Custom Fields_. Scroll down the list and click _Web Content Article_. Click _New_ to create a new field.

1. Select the _Dropdown_ field type. Input `Region` as the field name. Then for values, input `EMEA, NA, LATAM, APAC`. Click _Save_.

1. From the product menu, navigate to _Content and Data_ &rarr; _Web Content_. Open the _FAQs_ folder.

1. Click into the first article. Scroll down in the properties tab in the right menu. Select a region for the custom field (e.g. `APAC`). Click _Publish_. 

1. Click into the other FAQ articles and set different regions at random.

1. Navigate to the search results page `[server]:[port]/web/clarity/search` (e.g. http://localhost:8080/web/clarity/search). 

1. In the top menubar, click the edit page icon. Select _Fragments and Widgets_ in the left menu and select the _Widgets_ tab. Scroll down to the search widget section and locate the custom facet widget. Drag the widget onto the left module below the type facet widget.

   ![Drag the custom facet widget onto the search results page.](./understanding-and-customizing-search-results-pages/images/03.png)

1. Click the options icon for the custom facet widget and click _Configuration_. For the aggregation field, input `expando__keyword__custom_fields__Region.raw`. For the custom heading, input `Region`. Click _Save_. Then publish the page. The ability to filter by the custom region field is now available with the use of the custom facet widget.

   ![The custom facet widget can now filter by region.](./understanding-and-customizing-search-results-pages/images/04.png)

## Conclusion

Great job! Visitor's to Clarity's site have a clear and simple way to search for content and filter through different Clarity products and content. Next, we'll turn our attention to Liferay blueprints to bring personalization and further customization to the search experience.

Next Up: [Personalizing search experiences with blueprints](./personalizing-search-experiences-with-blueprints.md)
