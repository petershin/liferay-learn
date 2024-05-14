---
uuid: bd7bafb9-bd0b-411b-9458-0cb507842c87
---
#  Organizing Clarity’s Content

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

## Exercise One: Creating a Vocabulary

In this exercise, you will define a vocabulary for the FAQ web content you created earlier.

1. Navigate to _Site Menu_ &rarr; _Categorization_ &rarr; _Categories_.

1. Click the + sign next to _Vocabularies_ to create a new vocabulary.

1. Enter “FAQ” as the name for the vocabulary.

1. Ensure that _Allow Multiple Categories_ is toggled on and _Visibility_ is public.

1. In the _Asset Types_ dropdown menu, select “Web Content Article.” 

1. A second dropdown menu will appear with all of Clarity’s defined web content types. Select “FAQ”.

1. Click _Save_ to create the vocabulary.

## Exercise Two: Adding Categories to a Vocabulary

In this exercise, you will add categories to the FAQ vocabulary you created in the previous exercise.

1. Navigate to _Site Menu_ &rarr; _Categorization_ &rarr; _Categories_.

1. Select the FAQ vocabulary in the _Vocabularies_ sidebar.

1. Click _New_ to add a category.

1. In the _Add New Category_ page, enter “Retail Partners” as the name.

1. Click _Save_ to add the category.

1. Repeat steps 3-5 to add three more categories to the FAQ vocabulary:
    - “Products & Services”
    - “Pricing & Ordering”
    - “Returns & Exchanges”

1. Challenge: Go back to the FAQs you created earlier and assign the appropriate category to each one. Hint: Look in the Properties sidebar for each FAQ.

## Exercise Three: Adding Content to a Collection

If you were able to categorize your FAQ web content articles successfully, you can now use those categories to build dynamic FAQ collections.

1. Navigate to _Site Menu_ &rarr; _Site Builder_ &rarr; _Collections_.

1. Click _New_ and select _Dynamic Collection_.

1. In the pop-up window, enter the title “FAQ - Retail Partners”. You will be taken to the configuration page for the new collection.

1. Under _Item Type_, select “Web Content Article.”

1. Under _Item Subtype_, select “FAQ.”

1. Move down and expand the _Filter_ section. Here, you will define the rules that determine which content is added to this collection.

1. Make selections so that your rule reads “ _Contains_ _All_ of the following _Categories_”.

1. Under _Categories_, click _Select_ to pop up a list of available vocabularies.

1. Find the FAQ vocabulary and expand it. Select the _Retail Partners_ category.

1. Click _Save_ to create the collection.

1. Repeat steps 1-10 to create three more collections. Be sure to select the appropriate category for each collection, which should be named as follows:
    - “FAQ - Products & Services”
    - “FAQ - Pricing & Ordering”
    - “FAQ - Returns & Exchanges”




This concludes *Organizing Clarity’s Content*.

Next Up: [Displaying Content on Clarity’s Pages](./displaying-content-on-claritys-pages.md)

<!-- TODO: Add Additional Resources section. -->
