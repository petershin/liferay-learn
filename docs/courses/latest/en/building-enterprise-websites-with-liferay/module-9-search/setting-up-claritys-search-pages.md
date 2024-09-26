---
uuid: 40f88570-abf4-44ab-af8c-1374bde0e20d
---
# Setting Up Clarity's Search Pages

Clarity wants site visitors to be able to search for and find content quickly and easily. This is accomplished by creating good navigation and leveraging Liferay's search features. For example, a customer looking for a pair of eyeglasses or sunglasses should be able to navigate the site to find the type of product they are looking for. The user might search by keyword or use search categories to filter through the list of products. Navigating Clarity's site should match the visitor's expectation for good user experience.

At the same time, configuring the look and layout of search results pages should be quick and easy. Fortunately, no development background is required. Liferay provides various out-of-the-box components and search widgets to empower Liferay users to easily design pages and search experiences right from the UI.

Typically, a search results page will contain at a minimum:

* **Search Bar:** Where users can enter a search term
* **Search Facets:** The various criteria in which results can be filtered (e.g. asset type, categories, tags, etc.)
* **Search Results:** The actual results returned by the search query

Follow the exercises below to see how the different search components are set up and used in Clarity's website.

## Exercise: Adding Search Capabilities to the Job Listings Page

<!-- ## Exercise 17a: Adding Search Capabilities to the Job Listings Page -->

As part of improving their recruitment efforts, Clarity wants to implement a search page for open positions. Currently, Clarity's website includes a wireframed page for this purpose, but it is missing the necessary search widgets to make it functional.

Here you'll add and configure these widgets as Walter Douglas.

To do this,

1. Sign in as Walter Douglas.

   * Email: `walter.douglas@clarityvisionsolutions.com`
   * Password: `learn`

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), click *Page Tree*, expand *Careers*, and click *Open Positions*

1. Click *Edit* (![Edit Button](../../images/icon-edit.png)).

1. Open the *Fragments and Widgets* panel (![Fragments and Widgets](../../images/icon-plus.png)).

1. Go to the *Widgets* tab.

1. Drag and drop a *Search Bar* widget into the Banner container, placing it under the Heading fragment.

1. Select the widget and configure this setting:

   | Tab             | Setting   | Value |
   |:----------------|:----------|:------|
   | General > Frame | Min Width | 500px |

   Next, you'll add widgets for displaying and filtering search results, as well as defining additional search options.

1. From the *Fragments and Widgets* panel, drag and drop a *Type Facet* widget into the grid's left dropzone.

1. Hover over the widget, click *Actions* (![Actions Button](../../images/icon-actions.png)) in the top right corner of the widget, and select *Configuration*.

1. Use the right arrow button (![Right Arrow Button](../../images/icon-angle-right.png)) to remove all asset types except for Web Content Article.

   ![Configure the asset type to only include web content articles.](./setting-up-claritys-search-pages/images/01.png)

   This ensures that only web content articles appear in search results.

1. Click *Save* and close the configuration window.

1. From the *Fragments and Widgets* panel, drag and drop three *Category Facet* widgets into the left dropzone of the grid fragment, under the type facet widget.

1. Hover over the first Category Facet widget, click the *Actions* button (![Actions Button](../../images/icon-actions.png)) in the top right corner of the widget, and select *Configuration*.

1. For Display Template, select the *Clarity Search Category* template.

   ![You can select a display template for the category facet.](./setting-up-claritys-search-pages/images/02.png)

1. For Category Parameter Name, enter a unique value (e.g., `category-region`). 

   **Note**: Each Category Facet widget must have a unique parameter name to function as expected.

1. Scroll down and choose *Select Vocabularies*.

1. Expand the *Clarity Enterprise Website* vocabularies and select the *Region* vocabulary.

   ![The widget will only show the categories from the Region vocabulary.](./setting-up-claritys-search-pages/images/03.png)

1. Click *Save* and close the configuration window.

1. Repeat steps 12-17 for the other category facet widgets, though select different vocabularies for each one:

   * For the second widget, select the *Location* vocabulary.

   * For the third widget, select the *Job Positions* vocabulary.

1. From the *Fragments and Widgets* panel, drag and drop a *Search Results* widget into the right dropzone of the grid fragment.

   **Important**: Ensure you're using the widget from the Search widget section. Do not use the Commerce Search Results widget.

1. From the *Fragments and Widgets* panel, drag and drop a *Search Options* widget below the grid fragment in the Search Results and Options container.

1. Hover over the Search Options widget, click *Actions* (![Actions Button](../../images/icon-actions.png)) in the top right corner of the widget, and select *Configuration*.

1. Check *Allow Empty Searches*.

1. Click *Save* and close the window.

1. Click *Publish*.

   ![You can now search for open job positions.](./setting-up-claritys-search-pages/images/04.png)

   Finally, let's update the *Explore Open Positions* button in the Careers page to link to the Open Positions page.

1. Go to the *Careers* page and begin editing it (![Edit Button](../../images/icon-edit.png)).

1. Double click the banner's *Explore Open Positions* button to open the configuration side panel for the button's link element.

1. In the configuration side panel, go to the *Link* tab and configure these settings:

   | Setting | Value          |
   |:--------|:---------------|
   | Link    | Page           |
   | Page    | Open Positions |

1. Click *Publish*.

Now that you've added search functionality to Clarity's open positions page, site visitors can search and filter openings by different categories. You'll revisit this page in a later exercise to further restrict which web content articles appear in the search results.

Next, you'll apply these search concepts to Clarity's product pages.

## Exercise: Adding Search Capabilities to Product Pages

<!-- ## Exercise 17b: Adding Search Capabilities to Product Pages -->

<!-- Feedback from Russ: "One important thing to cover with product search pages: I think products are global/instance scoped and so you need to set the search bar widget to search the Everything scope to see products in a site's search page.

If you do mention that perhaps you could also sneak in a mention that instance scoped objects need to be searched this way too." https://github.com/JamesAGarcia/liferay-learn/pull/212#discussion_r1718547047 -->

Here you'll take a closer look at the product list page to understand the different Liferay search widgets and how to configure them as Walter Douglas.

To do this,

1. Go to Clarity's *Product List* page. Most of the page is already built with different search widgets.

   ![The product list page is made up of different widgets.](./setting-up-claritys-search-pages/images/05.png)

   The left side module is made up of a search bar widget, a specification facet widget, and an option facet widget. The right side module is made up of a sort widget and a search results widget. Note that the search results widget under the commerce category of widgets is different from the search results widget under the search category of widgets. Only the commerce-related widget returns products.

   Below these two modules, there is a search options widget. If you inspect the configuration of this widget, you will see that *Allow Empty Searches* is enabled. This setting is enabled so that all available assets are shown without any search queries.

1. Click *Edit* (![Edit Button](../../images/icon-edit.png)) in the Application Bar.

   The page is still missing a category facet widget that would allow visitors to filter by the different types of Clarity products. Let's go ahead and add that widget.

1. From the *Fragments and Widgets* panel, drag and drop a *Category Facet* widget below the Search Bar in the left dropzone of the grid fragment.

1. Hover over the new Category Facet widget, click the *Actions* button (![Actions Button](../../images/icon-actions.png)) in the top right corner of the widget, and select *Configuration*.

1. For Display Template, select the *Clarity Search Category* template.

1. Click *Save* and close the configuration window.

1. Click *Publish*.

   ![Use the category facet widget to filter by product category.](./setting-up-claritys-search-pages/images/06.png)

Great! You've included a category facet widget on the Product List page, allowing customers to filter their search results by product category.

Next, let's finish configuring the Open Positions page to only display Job Listings in the search results.

## Exercise: Filtering Results with Custom Filters

<!-- ## Exercise 17c: Filtering Results with Custom Filters -->

<!-- Feedback from Russ: "Results aren't sorted by filters. I know it's not wordsmithed yet but let's make sure we're clear about facets, filters, and sorts, and the widgets that contribute them." https://github.com/JamesAGarcia/liferay-learn/pull/212#discussion_r1718582792 -->

So far you've seen how to filter search results by content type (e.g. blogs, web content, etc.), categories, and specifications. You can also apply custom filters using almost any indexed attribute in your content, such as a web content structure.

In a previous exercise, we limited the search results on the Open Positions page to only display Web Content Articles. However, search results still includes types articles that are not job listings.

Here you'll use custom filters to search results to job listings as Clarity Admin.

To do this,

1. Sign in as the Clarity Admin user.

   * Username: `admin@clarityvisionsolutions.com`
   * Password: `learn`

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Applications* tab, and click *Asset Libraries*.

1. Select the *HR* library and click *Web Content*

1. Go to the *Structures* tab and copy down the structure's ID.

   You'll use this with the Custom Filter widget to limit search results in the Open Positions page.

1. Go to the *Open Positions* page and click *Edit* (![Edit Button](../../images/icon-edit.png)).

1. From the *Fragments and Widgets* panel, drag and drop a *Custom Filter* widget below the grid fragment in the Search Results and Options container.

1. Hover over the Custom Filter widget, click *Actions* (![Actions Button](../../images/icon-actions.png)) in the top right corner of the widget, and select *Configuration*.

1. For Filter Field, enter these values:

   | Setting      | Value              |
   |:-------------|:-------------------|
   | Filter Field | `classTypeId`      |
   | Filter Value | The Structure's ID |
   | Invisible    | *Yes*              |

1. Click *Save* and close the window.

1. Click *Publish*.

   Only job listings should appear in the Search Results.

   ![The Custom Filter widget limits search results to job listings.](./setting-up-claritys-search-pages/images/07.png)

Great! You've set a custom filter widget that limits the search results to only display Job Listings web content in the Open Positions page.

## Conclusion

Great job! Visitors to Clarity's site now have a clear and simple way to search for and filter through different products and content. Next, we'll turn our attention to Liferay blueprints to bring personalization and further customization to the search experience.

Next Up: [Personalizing Clarity's Search Experiences](./personalizing-claritys-search-experiences.md)

## Additional Resources

See official documentation to learn more about creating effective search pages:

* [Working with Search Pages](https://learn.liferay.com/w/dxp/using-search/search-pages-and-widgets/working-with-search-pages)
* [Search Results](https://learn.liferay.com/w/dxp/using-search/search-pages-and-widgets/search-results)
* [Search Facets](https://learn.liferay.com/w/dxp/using-search/search-pages-and-widgets/search-facets)
* [Search Blueprints](https://learn.liferay.com/w/dxp/using-search/liferay-enterprise-search/search-experiences/search-blueprints)
