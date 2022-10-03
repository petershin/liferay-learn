# Tag and Category Facet

The Tag Facet narrows search results for any assets with tags that match the search keyword. Likewise, the Category Facet narrows search results for any categorized assets that match the search keyword. Each match appears as a facet term.

![Example of tag facet results.](tag-and-category-facet/images/01.png)

![Example of category facet results.](tag-and-category-facet/images/02.png)

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

## New Category Facet Behavior

<!--Heading WIP-->

how to build the endor thing

2 cat facets, diff scope (vocab) for each, use a diff parameter

slack thread in cat channel with recording

The summary

The use case(s)

The how-to

Behavior explanation

Under the Hood

If an asset is categorized with one or more categories, we index each category's ID in that asset's search engine document
In the past we only indexed category IDs into the assetCategoryIds field
Now we have an additional field, assetVocabularyCategoryIds, which indexes the category IDs and their corresponding vocabulary ID (vocabularyId-categoryId)
Configuration

The field that the Category Facet widget uses can be configured in System Settings > Search > Category Facet Field
The assetVocabularyCategoryIds field needs to be used in order to Select Vocabularies in the Category Facet widget configuration. It is not required to use the "Vocabulary Layout" display template (aka the "Vocabulary Layout" display IS compatible with the assetCategoryIds field)
For environments with data existing prior to 7.4 Update #(the number that this feature is released in), this new data in the assetVocabularyCategoryIds field needs to be indexed, so a full reindex is required after updating to 7.4 Update #?. For environments starting on 7.4 Update #? or later, no reindex is necessary, just switch to the new field in System Settings
Side note - There is potential for a "partial reindex" to be executed for environments upgrading from an earlier 7.4 Update, but we wont advertise this unless a customer comes to us stating that a full reindex is not possible for them.
Customization

Selecting vocabularies is compatible with any display template (aka you do not need to use the "Vocabulary Layout" to filter by a given vocabulary)
Selecting one or more vocabularies in the Category Facet widget configuration will cause that widget to only display categories that are contained in the selected vocabularies
Multiple Category Facet widgets can be added to a page and configured to display any vocabulary(ies) desired. To create AND behavior between the selections in the separate widgets, each widget needs their own unique Category Parameter Name
Permissions

When selecting vocabularies in the widget configuration, it is possible that the current user wouldn't have permission to see all vocabularies. If there were vocabularies previously selected by another user that the current user doesn't have permission to see, the previously selected vocabularies will continue to be applied to the configuration.
Side note - I think if the user with limited permissions checked the "All Vocabularies" radio button and saved the config, it would reset the Vocabularies configured by the previous user, so if the second user came back and then selected their own vocabularies, only the vocabularies they selected would be applied. Bug or feature? 
