---
uuid: 87c9589b-586d-4c50-984b-5c3cd1b0d32d
---
# Displaying Clarity's Content

In the previous lesson, you learned how to organize Clarity's content to make it more accessible to users. Here you'll learn how to display that content with Asset Publishers and Collections.

## Asset Publishers

Asset Publishers have been part of the product for many years and are among the most widely used out-of-the-box widgets. They are self-contained, which means that you configure the selection criteria, display settings, and user interactive functionality all within a single widget instance. Asset Publishers support FreeMarker driven Widget Templates, which offer highly granular control and a tremendous amount of flexibility. This makes Asset Publishers best suited for use cases with complex templating needs.

## Collections

Collections focus only on defining the criteria for selecting assets, leaving display settings and user interactive functionality to be handled by fragments and widgets. This decoupling makes Collections a much more centralized feature for managing groups of content than instance-based Asset Publishers. You can use a single collection multiple times as a data source for separate rendering components, and changes to a collection are propagated to everywhere the collection is used. Collections bridge the gap between categorization and page design because they integrate with many of the richer content capabilities available in newer version of Liferay DXP. With Collections, you can:

* **Group Diverse Content**: You can create collections to bring together different content types, like blog posts, documents, web content articles, and custom object entries, under a single theme or category. Grouping can be done manually or dynamically: hand pick individual items or define selection criteria to choose items on the fly. Other Liferay features like Objects and Search Blueprints can generate collection providers, which you can use to render lists of results.

* **Filter and Personalize Content**: You can define specific criteria, such as tags, categories, or publication dates, to filter and display only relevant items within a collection. This enables you to personalize the content experience for different user groups.

* **Simplify Content Presentation**: You can easily embed collections into your Liferay pages using dedicated out-of-the-box fragments like *Collection Display*. This streamlines the process of showcasing curated content within website layouts. 

For all these reasons, Collections are the recommended feature for selecting assets for display in Liferay. You should always use Collections for asset selection, even if you need an Asset Publisher for complex templating. Doing so will future-proof your solution and lay the groundwork for you to leverage newer capabilities like segmented data.

## Exercise: Creating a Manual Collection
<!--Exercise 13a-->

Liferay Collections are lists of content items that you can showcase in your site pages. You can group different content types together, making it easier to find and display related items. Each list can be defined manually or dynamically.

Here you'll add web content articles to a manual collection and map them to Clarity's home page as Walter Douglas.

To do this,

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Site Builder*, and select *Collections*.

1. Click *New* and select *Manual Collection*.

1. For Title, enter `Helpful Articles` and click *Save*.

1. For Item Type, select *Web Content Article*.

1. For Item Subtype, select *Article*.

1. Click *Save*.

1. In the Collection Items section, click *Select* and select *Article*.

1. Go to the *Articles* folder, select these three articles:

   * *Embracing Innovation: Key Trends Shaping Eyewear Manufacturing*
   * *Revolutionizing the Eyewear Industry: How Innovative Materials Make a Difference*
   * *Enhancing Efficiency in Eyewear Manufacturing: A Comprehensive Approach*

1. Click *Add*.

   The manual collection is now populated with content and is ready to use in site pages.

1. Open the page editor for Clarity's *Home* page.

1. Select the *Collection Display* fragment in the Helpful Articles container.

1. In the configuration side panel, click the *Plus* button (![Plus Button](../../images/icon-plus.png)) for Collection and select the *Helpful Articles* collection.

   The fragment now sources its content from the Helpful Articles collection. The provided composition already applies the Clarity Card fragment to the collection display, so that it can be used to render each item. To display article content from the collection, you'll need to map this card's sub-elements to fields in the articles. But before mapping the card's sub-elements to content fields, let's change the collection display's pagination.

1. For Pagination, select *None*.

   Now let's map the card's sub-elements to their corresponding fields in the articles.

1. Select the Clarity Card fragment and note the sub-elements included:

   * card-image
   * category
   * card-title
   * summary
   * card-link

1. Select each of the following elements, set its Source Selection to *Mapping*, and select the corresponding field:

   * card-image: *Image* under Content (Article)
   * category: *Articles* under Categorization
   * card-title: *Title* under Basic Information
   * summary: *Headline* under Content (Article)

1. Select the card-link sub-element, go to the *Link* tab.

1. For Link, select *Mapped URL*.

1. For Field, select *Default*.

1. Click *Publish* to save your changes to the home page.

   The *Helpful Articles* section of the home page should now display web content from the collection you created. However, two elements aren't working as expected: category and card-link. This is because the articles do not have categories assigned to them and because the articles do not have a default DPT. Let's fix those issues.

1. Go to the *Web Content* application and assign one category to each article.

1. Go to the *Page Templates* application and set the Article display page template as default.

1. Return to the Home page and verify all mappings work.

Great! You created a manual collection and displayed it in Clarity's Home page. Next, you'll learn how to create a dynamic collection.

## Exercise: Creating a Dynamic Collection
<!--Exercise 13b-->

Having categorized your FAQ web content articles earlier, here you'll use those categories to build dynamic FAQ collections as Walter Douglas.

To do this,

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Site Builder*, and select *Collections*.

1. Click *New* and select *Dynamic Collection*.

1. For Title, enter `FAQ - Retail Partners` and click *Save*.

1. For Item Type, select *Web Content Article*.

1. For Item Subtype, select *FAQ*.

   This limits the collection to FAQ web content articles. Next, you'll define a filter to limit which FAQs are included in the collection.

1. Under Filter, set the rule to `Contains *All* of the following Categories`.

1. In the Categories field, search for `Retail Partners` and select it.

1. Click *Save* to create the collection.

1. Repeat the above steps to create these collections:

   * `FAQ - Products & Services`
   * `FAQ - Pricing & Ordering`
   * `FAQ - Returns & Exchanges`

   For each collection, filter results using its corresponding category.

You now have four FAQ collections. Next, you'll use them to display content in Clarity's FAQ page.

## Exercise: Displaying Content on the FAQ Page
<!--Exercise 13c-->

Using what you have learned in the previous exercises, let’s map content to the FAQ page as Walter Douglas.

To do this,

1. Begin editing the FAQ page.

1. Double click the *Image* fragment to configure its image-square sub-element.

1. Set the image to `glasses-vertical-banner-with-text-lg` from the Marketing Assets library.

1. The block on the right contains a page title and four FAQ Section compositions. Each FAQ Section contains a heading and a Collection Display fragment. Each Collection Display contains a custom fragment called FAQ Question and Answer Pair. First map the collection displays to the FAQ collections you built earlier. Make sure each collection corresponds to the heading for that section.

1. For Pagination, select *None*.

1. Check *Display All Collection Items*.

1. Map the correct fields for each FAQ Question and Answer Pair so that the content renders properly in the collection displays.

1. Map the collection display in Promoted Articles to the Helpful Articles collection.

1. Click *Publish* to save your changes to the FAQ page.

Using collection displays and custom fragments, you have rendered FAQ web content onto Clarity's FAQ page. Next, let's add content to the header announcement bar.

## Exercise: Adding Announcements to the Header
<!--Exercise 13d-->

Here you'll apply what you've learned about web content, collections, and page templates to add an announcement to Clarity's header bar as Walter Douglas.

To do this,

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Site Builder*, and select *Collections*.

1. Create a new dynamic collection titled `Announcements`.

1. In the collection configuration menu, set item type to *Web Content Article* and item subtype to *Announcements*.

1. Click *Save* to publish the collection.

   Now that you've created the collection, let's add it to the Primary Master Page template.

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Design*, and select *Page Templates*.

1. Begin editing the *Primary Master Page* template.

   !!! note
       You may notice the styles applied to the master page are different from those applied in site pages. This is because you've applied the theme and theme CSS client extension to site pages and not to master pages. If desired, you can apply the theme and client extension to the master page directly. Make sure you uncheck all theme properties (i.e. Show Footer, Show Header, etc.).

1. Toggle the *visibility* (![Visibility](../../images/icon-preview.png)) of the *Header Announcement Bar* container.

1. Select the *Header Announcement Bar* container and configure this setting:

   | Tab    | Field              | Value                 |
   |:-------|:-------------------|:----------------------|
   | Styles | Background > Color | *Color Brand Primary* |

1. Add a *Collection Display* fragment to the container, select it, and configure these settings:

   | Tab     | Field                              | Value           |
   |:--------|:-----------------------------------|:----------------|
   | General | Collection                         | *Announcements* |
   | General | Pagination                         | *None*          |
   | General | Maximum Number of Items to Display | *1*             |

1. Add a *Container* fragment to the collection display, rename it `Announcement` and configure these settings:

   | Tab     | Field           | Value      |
   |:--------|:----------------|:-----------|
   | General | Content Display | *Flex Row* |
   | General | Align Items     | *Center*   |
   | General | Justify Content | *Center*   |

1. Add a *Paragraph* fragment to the container, select it, and configure these settings:

   | Tab    | Field        | Value             |
   |:-------|:-------------|:------------------|
   | Styles | Text > Color | *Color Neutral 0* |

   !!! note
       Choosing *Color Neutral 0* selects a color value defined in the theme's style book.

1. Select the paragraph's *element-text* sub-element and configure this setting:

   | Tab     | Field | Value     |
   |:--------|:------|:----------|
   | Mapping | Field | *Message* |

1. Add a *Clarity Button* fragment to Announcement container after the paragraph, select it, and configure these settings:

   | Tab     | Field    | Value        |
   |:--------|:---------|:-------------|
   | General | Type     | *Borderless* |
   | General | Style    | *Primary*    |
   | General | Size     | *Small*      |
   | General | Inverted | *Yes*        |

1. Select the button's *link* sub-element and configure these settings:

   | Tab     | Field | Value          |
   |:--------|:------|:---------------|
   | Mapping | Field | *Link Text*    |
   | Link    | Link  | *Mapped URL*   |
   | Link    | Field | *Link to Page* |

1. Adjust the margins and padding for the announcement bar elements until you are satisfied with it.

1. Click *Publish Master* to save your changes.

The Header Announcement Bar is now visible on all pages that use the Primary Master Page template.

## Conclusion

Great! You've used both manual and dynamic collections to display content on Clarity's website. Next, let's explore how Clarity can leverage Liferay's Commerce features to create content for their products catalog.

Next Up: [Creating Clarity’s Commerce Content](./creating-claritys-commerce-content.md)

<!-- TODO: Add Additional Resources section. -->
