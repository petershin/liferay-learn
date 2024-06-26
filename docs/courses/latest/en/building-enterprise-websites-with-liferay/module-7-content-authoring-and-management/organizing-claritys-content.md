---
uuid: bd7bafb9-bd0b-411b-9458-0cb507842c87
---
# Organizing Clarity’s Content

In the previous section, you learned about the different types of content that Clarity may want to employ for their enterprise marketing website. This section will cover some of the key Liferay features you can use to organize content once it has been created:

- Categories
- Tags
- Collections

## Categories

You can use categories to group assets with similar content or information. Categories support hierarchical organization of your content with nesting and subcategories so that you can classify your content in as much or as little detail as you wish. This makes it easier for users to find relevant information through search or navigation.

Categories themselves are grouped using vocabularies, which can be made public or private. A vocabulary defines the type of asset for the categories it contains. For example, the Blog Posts vocabulary contains four categories: Innovation, Fashion, Technology, and Health. These categories can only be applied to blog posts. Liferay includes some basic vocabularies out of the box and allows you to create your own.

## Tags

Tags are keywords for organizing your assets. While categories provide broader classification based on theme or topic, tags describe more specific information about individual content items. Tags are not hierarchical and cannot be nested within one another. However, because they are not constrained by a vocabulary, tags make it possible to find related assets even if they are different types.

## Collections

While categories and tags make your content more accessible to users, you can also leverage them as site building tools. Collections bridge the gap between categorization and page design, allowing you to

- Group diverse content

    You can create collections to bring together different content types, like blog posts, documents, web content articles, and custom object entries, under a single theme or category. Grouping can be done manually or dynamically: hand pick individual items or define selection criteria to choose items on the fly.

- Filter and personalize content

    You can define specific criteria, such as tags, categories, or publication dates, to filter and display only relevant items within a collection. This allows you to personalize the content experience for different user groups.

- Simplify content presentation

    You can easily embed collections into your Liferay pages using dedicated out-of-the-box fragments like *Collection Display*. This streamlines the process of showcasing curated content within your website layout.

## Exercise One: Auto-Tagging Content

You can manually tag most Liferay assets, but manually tagging content can be time consuming. Liferay provides auto tagging features and integrations to simplify this process. By default, auto tagging is disabled.

Here you'll enable text and image auto-tagging as the Clarity Admin user.

To do this,

1. Open the *Global Menu* (![Global Menu](../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Instance Settings*.

1. Under Content and Data, click *Assets*.

1. Click *Asset Auto Tagging* in the left menu.

1. Check *Enable Auto Tagging of Assets*.

1. Set the max number of tags to `3`.

   **Note**: Leaving the field blank disables auto-tagging. Setting the value to 0 removes any auto limit.

1. Click *Update*.

   Now that it's enabled, we need to set up our tagging providers for web content articles and images.

1. Click *OpenNLP Text Auto Tagging* in the left menu.

1. Select *Web Content Article* in the drop-down menu.

   If the drop-down menu does not appear, enter `com.liferay.journal.model.JournalArticle`.

   **Note**: You can also click the plus button to enable OpenNLP auto tagging for additional types of text content (i.e., blog entries = `com.liferay.blogs.model.BlogsEntry`; documents = `com.liferay.document.library.kernel.model.DLFileEntry`).

1. Click *Update*.

1. Click *TensorFlow Image Auto Tagging* in the left menu.

1. Check *Enable TensorFlow Image Auto Tagging*.

1. Click *Update*.

   **Tip**: You can double check that all the settings are correct for the Clarity site by going to *Site Menu* &rarr; *Configuration* &rarr; *Site Settings* &rarr; *Assets* and validating that auto tagging is enabled.

1. Go to Clarity's enterprise website, open the *Site Menu* (![Site Menu](../images/icon-product-menu.png)), expand *Content & Data*, and select *Web Content*.

1. Go to the *Articles* folder, click *New*, and select *Article*.

1. Enter some data. This data should be something real and not "Lorem Ipsum" because Open NLP needs to interpret it and provide some tags.

1. Click *Publish*.

1. Begin editing the article. In the right side menu, you should see tags set for the content.

## Exercise Two: Creating a Vocabulary

Liferay provides vocabularies for categorizing content, making it easier to find and display the content you need.

Here you'll define a vocabulary with categories for the FAQ web content as Walter Douglas.

To do this,

1. Sign in as Walter Douglas.

   * Email: `walter.douglas@clarityvisionsolutions.com`
   * Password: `learn`

1. Open the *Site Menu* (![Site Menu](../images/icon-product-menu.png)), expand *Categorization*, and select *Categories*.

1. Click *Add* (![Add](../images/icon-plus.png)) next to *Vocabularies* to create a new vocabulary.

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

   ![Choose which asset types the vocabulary will be associated with.](./pdf-images/day2/lesson12/01.png)

1. Click *Save* to create the vocabulary.

You now have a vocabulary to contain FAQ categories.

## Exercise Three: Adding Categories to a Vocabulary

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

   ![Create and use categories according to your content.](./pdf-images/day2/lesson12/02.png)

1. Challenge: Assign the correct category to each FAQ web content article. The FAQs are sorted into folders corresponding to their categories.

   **Hint:** Look in the Properties sidebar for each FAQ.

You have now defined and assigned categories to your FAQ web content.

## Exercise Four: Creating a Manual Collection

ILiferay Collections are lists of content items that you can showcase in your site pages. You can group different content types together, making it easier to find and display related items. Each list can be defined manually or dynamically.

Here you'll add web content articles to a manual collection and map them to Clarity's home page as Walter Douglas.

To do this,

1. Open the *Site Menu* (![Site Menu](../images/icon-product-menu.png)), expand *Site Builder*, and select *Collections*.

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

1. In the configuration side panel, click the *Plus* button (![Plus Button](../images/icon-plus.png)) for Collection and select the *Helpful Articles* collection.

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

## Exercise Five: Creating a Dynamic Collection

Having categorized your FAQ web content articles earlier, here you'll use those categories to build dynamic FAQ collections as Walter Douglas.

To do this,

1. Open the *Site Menu* (![Site Menu](../images/icon-product-menu.png)), expand *Site Builder*, and select *Collections*.

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

You now have four FAQ collections. Later, you'll use them to display content in Clarity's FAQ page.

## Conclusion

This concludes *Organizing Clarity’s Content*.

Next Up: [Displaying Content on Clarity’s Pages](./displaying-content-on-claritys-pages.md)

<!-- TODO: Add Additional Resources section. -->
