# Tag and Category Facet

The Tag Facet narrows search results for any assets with tags that match the search keyword. Likewise, the Category Facet narrows search results for any categorized assets that match the search keyword. Each match appears as a facet term.

![Example of tag facet results.](tag-and-category-facet/images/01.png)

![Example of category facet results.](tag-and-category-facet/images/02.png)

<!-- Change the example to show vocabularies? -->

## Configuring the Tag Facet and the Category Facet

The Tag Facet and the Category Facet contain identical configuration options. To configure either, open the Options menu (![Click on the options icon of the search bar.](../../../images/icon-app-options.png)) of the facet and click *Configuration*.

![Click on the Configuration option.](tag-and-category-facet/images/03.png)

**Display Settings:** Choose between *Default*, *Compact Layout*, and *Label Layout*. The Default layout shows checkboxes next to each term but the Compact layout does not. The Label layout shows small clickable labels for each term.

The Advanced Configuration section contains additional options: 

**Tag or Category Parameter Name:** Change the parameter name in the URL for the Facet. The default is *tag* or *category*. 

**Max Terms:** Set the maximum number of facet terms to display, regardless of how many matching terms are found for the facet.

**Frequency Threshold:** Set the minimum frequency required for terms to appear in the list of facet terms. For example, if the frequency threshold of a facet is set to 3, a term with two matching results doesn't appear in the term result list.

**Display Frequencies:** Choose whether or not to display the term frequencies.

Once finished, click the *Save* button.

## Vocabularies in the Category Facet

{bdg-secondary}`7.4 U45+ and GA45+`

By default the Category Facet widget collects and displays results from all categories in every vocabulary in the site, and displays them in a flat list. In this paradigm vocabularies are not considered in the display or configuration of the widget. With the enhancements made in Update 45, you gain these behaviors:

1. Display the categories under their vocabulary. This is accomplished by selecting the new Vocabulary Layout in the Category Facet's configuration screen. 

   <!--screenshot-->

1. Decide which vocabularies and categories to include in the facet. This capability requires that a new field is indexed for each categorized asset: the `assetVocabularyCategoryIds` must be present alongside the usual `assetCategoryIds` field. Using this field activates the vocabulary settings within the Category Facet's configuration screen. 

   <!--screenshot-->

   See more detailed instructions for the use case below.

<!-- doesn't make sense to use multiple widget but keep the OR behavior, does it? you'd just use one widget -->
With this new behavior you can provide a powerful search facet experience: users select multiple categories (facet terms) within one vocabulary in one widget to expand the search results, but select categories from another vocabulary in a second widget to narrow the results. You might think of this in terms of boolean operators: use OR selection behavior inside a facet, but AND selection between facets.

Consider a commerce portal for buying seedling trees and shrubs. The trees are commerce products that are categorized in distinct vocabularies:

- Vocabulary: Tree Type

   Categories: 
   - Evergreen Trees
   - Deciduous Trees
   - Evergreen Shrubs
   - Deciduous Shrubs

- Vocabulary: Climate Type

   Categories:
   - Cold
   - Warm
   - Dry
   - Wet

When your site users select Evergreen Trees and Evergreen Shrubs, they expect to see products matching either category. If they then select the Cold category from the Climate Type vocabulary, they expect the results to be narrowed to just the evergreen trees and shrubs that can survive in a cold environment. This can be accomplished out-of-the-box using the new Category Facet widget enhancements.

To configure the use case above,

1. Configure the field to aggregate data by in the Category Facet widget: go to System Settings &rarr; Search &rarr; Category Facet Field. Select the `assetVocabularyCategoryIds` field. By default the `assetCategoryIds` field is used, but you need the `assetVocabularyCageoryIds` field. 

   Click _Update_ to save the configuration.

1. If you're coming from an earlier update and you already have categorized assets in the system, perform a full re-index.

1. In the Site Administration Menu &rarr; Categorization &rarr; Categories application, create the public vocabularies and their categories with this structure:

   - Vocabulary: Tree Type

      Categories: 
      - Evergreen Trees
      - Deciduous Trees
      - Evergreen Shrubs
      - Deciduous Shrubs

   - Vocabulary: Climate Type

      Categories:
      - Cold
      - Warm
      - Dry
      - Wet

1. Add categorized content to test the search: <!-- We need at least 8 assets: one for each category categorized as Evergreen Tree, one as Evergreen shrub,  -->

1. Place two Category Facet widgets on a search page, one above the other. If you're using the default search page, place one Category Facet directly above the existing one.

1. Configure the first Category Facet widget:
   - Set the widget to use the _Tree Type_ vocabulary.
   - Set the parameter _treeType_.

1. Configure the second Category Facet widget:
   - Set the widget to use the _Climate Type_ vocabulary. 
   - Set the parameter _climateType_.

1. Search for _trees_ in the search bar.

1. Select _Evergreen Trees_ and _Evergreen Shrubs_ in the first Category Facet. Notice that when you select the first facet term, the results are narrowed, then expanded again with the second selection. This is the OR selection behavior that occurs with intra-widget facet selections.

1. Select _Cold_ in the second Category Facet. Notice that the results now only include the content that is either an evergreen tree or shrub, AND is suitable for cold climates.

<!-- GIF? -->


The Category Parameter Name controls whether to use AND or OR selection behavior when selecting categories in separate Category Facet widgets. Within a single Category Facet the selection behavior operates and OR clause: the search results are expanded by the selection, matching the categories _Foo OR Bar_. Configuring a second Category Facet widget with the same Category Parameter Name cause the OR selection behavior to apply also to selections made between facets. 

When you configure a unique Category Parameter Name for two facets, selection behavior changes to AND: the search results are narrowed when selections are made in different facets, matching the categories _Foo AND Bar_. 
<!-- This AND behavior between facets existed before, right? So we should document it generally in the facets intro? Like you can configure Site Parameter Name, Folder Parameter Name, etc. What is new is the ability to select a different vocabulary for each cat facet OOTB, so -->


If an asset is categorized with one or more categories, we index each category's ID in that asset's search engine document
In the past we only indexed category IDs into the assetCategoryIds field
Now we have an additional field, assetVocabularyCategoryIds, which indexes the category IDs and their corresponding vocabulary ID (vocabularyId-categoryId)

Configuration

The field that the Category Facet widget uses can be configured in System Settings > Search > Category Facet Field
The assetVocabularyCategoryIds field needs to be used in order to Select Vocabularies in the Category Facet widget configuration. It is not required to use the "Vocabulary Layout" display template (aka the "Vocabulary Layout" display IS compatible with the assetCategoryIds field)
Selecting vocabularies is compatible with any display template (aka you do not need to use the "Vocabulary Layout" to filter by a given vocabulary)
For environments with data existing prior to 7.4 Update #(the number that this feature is released in), this new data in the assetVocabularyCategoryIds field needs to be indexed, so a full reindex is required after updating to 7.4 Update #?. For environments starting on 7.4 Update #? or later, no reindex is necessary, just switch to the new field in System Settings
Side note - There is potential for a "partial reindex" to be executed for environments upgrading from an earlier 7.4 Update, but we wont advertise this unless a customer comes to us stating that a full reindex is not possible for them.

Customization

Selecting vocabularies is compatible with any display template (aka you do not need to use the "Vocabulary Layout" to filter by a given vocabulary)
Selecting one or more vocabularies in the Category Facet widget configuration will cause that widget to only display categories that are contained in the selected vocabularies
Multiple Category Facet widgets can be added to a page and configured to display any vocabulary(ies) desired. To create AND behavior between the selections in the separate widgets, each widget needs their own unique Category Parameter Name

Permissions

When selecting vocabularies in the widget configuration, it is possible that the current user wouldn't have permission to see all vocabularies. If there were vocabularies previously selected by another user that the current user doesn't have permission to see, the previously selected vocabularies will continue to be applied to the configuration.
Side note - I think if the user with limited permissions checked the "All Vocabularies" radio button and saved the config, it would reset the Vocabularies configured by the previous user, so if the second user came back and then selected their own vocabularies, only the vocabularies they selected would be applied. Bug or feature? 
