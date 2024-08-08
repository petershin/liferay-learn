---
uuid: bd7bafb9-bd0b-411b-9458-0cb507842c87
---
# Organizing Clarity’s Content

<!--TASK: Reasset article organization; currently it combines 'Organizing' and 'Displaying' content-->

In the previous section, you learned about the different types of content that Clarity wants to employ for their enterprise marketing website. This section covers some of the key Liferay features you can use to organize content once created:

- Categories
- Tags
- Collections

## Categories

You can use categories to group assets with similar content or information. Categories support hierarchical organization of your content with nesting and subcategories so that you can classify your content in as much or as little detail as you wish. This makes it easier for users to find relevant information through search or navigation.

Categories themselves are grouped into vocabularies, which can be public or private. A vocabulary defines the type of asset for the categories it contains. For example, Clarity's Blog Posts vocabulary contains four categories: Innovation, Fashion, Technology, and Health. Content creators can only apply these categories to blog posts. Liferay includes some basic vocabularies out of the box, but you can create your own.

Together, categories and vocabularies form a taxonomy, a structured classification system for content. Implementing a robust taxonomy is critical for effectively managing content in Liferay.

<!--TASK: See following comment-->

## Tags

Tags are keywords for organizing your assets. While categories provide broader classification based on theme or topic, tags describe more specific information about individual content items. Tags are not hierarchical and cannot be nested within one another. However, because they are not constrained by a vocabulary, tags make it possible to find related assets even if they are different types. Both administrators and regular users can create tags for content.

<!--TASK: Add a section that clearly differentiates Categories and Tags while noting the use cases they're designed to solve. The above notes that tags are flat and unstructured, while categories are hierarchical and structured. It also hints that tags are typically applied by users, while categories are defined and managed by administrators. But we need to articulate the purpose as well: Tags facilitate flexible, user-driven organization, while categories provide a formal, top-down structure.

As I understand it:
* Use tags when you need flexible, user-driven organization for highlighting general keywords in content for search purposes.
* Use categories when you need a formal, top-down structure that you can use as part of your site's structure (e.g., navigation, display pages, etc.) and to better enforce content governance.
-->

## Collections

<!--TODO: Consider moving Collections content into its own article-->

While categories and tags make your content more accessible to users, you can also leverage them as site building tools. Collections bridge the gap between categorization and page design, enabling you to

- **Group Diverse Content**: You can create collections to bring together different content types, like blog posts, documents, web content articles, and custom object entries, under a single theme or category. Grouping can be done manually or dynamically: hand pick individual items or define selection criteria to choose items on the fly.

- **Filter and Personalize Content**: You can define specific criteria, such as tags, categories, or publication dates, to filter and display only relevant items within a collection. This enables you to personalize the content experience for different user groups.

- **Simplify Content Presentation**: You can easily embed collections into your Liferay pages using dedicated out-of-the-box fragments like *Collection Display*. This streamlines the process of showcasing curated content within website layouts.

<!--TASK: Add section to this or another article that compares collections and asset publishers.

Asset Publishers have been part of the product for many years and is arguably one of the most widely used out of the box widgets. Asset Publishers combine the three concepts of selection criteria, display, and user interactive functionality in the widget’s configuration screen. Collections Collections decouple the logic for display and function from the selection criteria and provide integration with many of the richer content creator capabilities that are part of more recent versions of the product. With collections, display and user interactive functionality is handled by fragments and widgets.

Asset Publishers are self-contained, meaning everything to do with them from the selection criteria to the way the results should be rendered is stored with the instance itself. Asset Publishers support Freemarker driven Widget Templates, which offer a tremendous amount of flexibility and control. For these complex templating scenarios, the Asset Publisher is best. With that said, Asset Publishers can be configured to use collections, so even if you have the complex templating needs, you should still use a Collection to feed the data into the Asset Publisher.

Collections provide a centralized way to manage groups of content for rendering in site pages, while asset publishers are instance based. Since collections only focus on providing the criteria for selecting assets, they support the “separation of concerns.” You can take a single collection and use it multiple times as a “data source” for separate rendering components. Furthermore, changes to the collection are propagated to everywhere the collection is used. Also, while you can manually configure the selection criteria for collections, there are also Liferay features that auto-generate collection providers. For example, both Objects and Search Blueprints can generate collection providers so you can use lists of results from these features to select which content is rendered. Perhaps most importantly, collections support personalization. You can create variations on a collection, making it possible for you to create a single collection and a single page for rendering that collection, but have the content shift based on the user’s segment.

Use Collections for asset selection, even if you still need an Asset Publisher for complex templating.
-->

## Exercise: Auto-Tagging Content
<!--Exercise 11b-->

You can manually tag most Liferay assets, but manually tagging content can be time consuming. Liferay provides auto tagging features and integrations to simplify this process. By default, auto tagging is disabled.

Here you'll enable text and image auto-tagging as the Clarity Admin user.

To do this,

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Instance Settings*.

1. Under Content and Data, click *Assets*.

1. Click *Asset Auto Tagging* in the left menu.

1. Check *Enable Auto Tagging of Assets*.

1. Set the max number of tags to `3`.

   !!! note
       Leaving the field blank disables auto-tagging. Setting the value to `0` removes any auto limit.

1. Click *Update*.

   Now that it's enabled, we need to set up our tagging providers for web content articles and images.

1. Click *OpenNLP Text Auto Tagging* in the left menu.

1. Select *Web Content Article* in the drop-down menu.

   If the drop-down menu does not appear, enter `com.liferay.journal.model.JournalArticle`.

   !!! note
       You can also click the plus button to enable OpenNLP auto tagging for additional types of text content (i.e., blog entries = `com.liferay.blogs.model.BlogsEntry`; documents = `com.liferay.document.library.kernel.model.DLFileEntry`).

1. Click *Update*.

1. Click *TensorFlow Image Auto Tagging* in the left menu.

1. Check *Enable TensorFlow Image Auto Tagging*.

1. Click *Update*.

   !!! tip
       You can double check that all the settings are correct for the Clarity site by going to *Site Menu* &rarr; *Configuration* &rarr; *Site Settings* &rarr; *Assets* and validating that auto tagging is enabled.

1. Go to Clarity's enterprise website, open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Content & Data*, and select *Web Content*.

1. Go to the *Articles* folder, click *New*, and select *Article*.

1. Enter some data. This data should be something real and not "Lorem Ipsum" because Open NLP needs to interpret it and provide some tags.

1. Click *Publish*.

1. Begin editing the article. In the right side menu, you should see tags set for the content.

## Exercise: Creating a Vocabulary
<!--Exercise 12a-->

Liferay provides vocabularies for categorizing content, making it easier to find and display the content you need.

Here you'll define a vocabulary with categories for the FAQ web content as Walter Douglas.

To do this,

1. Sign in as Walter Douglas.

   * Email: `walter.douglas@clarityvisionsolutions.com`
   * Password: `learn`

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Categorization*, and select *Categories*.

1. Click *Add* (![Add](../../images/icon-plus.png)) next to *Vocabularies* to create a new vocabulary.

1. Enter these details:

   | Field                     | Value                        |
   |:--------------------------|:-----------------------------|
   | Name                      | FAQ                          |
   | Description               | Categories for FAQ articles. |
   | Allow Multiple Categories | Yes                          |
   | Visibility                | Public                       |
   | Asset Types               | Web Content Article          |
   | Subtype                   | FAQ                          |
   | Required                  | No                           |

   ![Choose which asset types the vocabulary will be associated with.](./organizing-claritys-content/images/01.png)

1. Click *Save* to create the vocabulary.

You now have a vocabulary to contain FAQ categories.

## Exercise: Adding Categories to a Vocabulary
<!--Exercise 12b-->

After creating a vocabulary, you can add categories and subcategories to establish the desired organizational schema for your content.

Here you'll add categories to the FAQ vocabulary you created in the previous exercise as Walter Douglas.

To do this,

1. In the Categories application, select the *FAQ* vocabulary in the Vocabularies sidebar.

1. Click *New* to add a category.

1. In the *Add New Category* page, enter `Retail Partners` as the name.

1. Click *Save* to add the category.

1. Repeat the above steps to add three more categories to the FAQ vocabulary:

   * `Products & Services`
   * `Pricing & Ordering`
   * `Returns & Exchanges`

   ![Create and use categories according to your content.](./organizing-claritys-content/images/02.png)

1. Challenge: Assign the correct category to each FAQ web content article. The FAQs are sorted into folders corresponding to their categories.

   **Hint:** Look in the Properties sidebar for each FAQ.

   <!--TASK: Reassess how the challenge is incorporated. -->

You have now defined and assigned categories to your FAQ web content.

## Exercise: Creating a Manual Collection
<!--Exercise 13a-->

ILiferay Collections are lists of content items that you can showcase in your site pages. You can group different content types together, making it easier to find and display related items. Each list can be defined manually or dynamically.

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

Great! You've used categories and collections to help organize and display Clarity's content. Next, let's explore how Clarity can leverage Liferay's Commerce features to create content for their products catalog.

Next Up: [Creating Clarity’s Commerce Content](./creating-claritys-commerce-content.md)

<!-- TODO: Add Additional Resources section. -->
