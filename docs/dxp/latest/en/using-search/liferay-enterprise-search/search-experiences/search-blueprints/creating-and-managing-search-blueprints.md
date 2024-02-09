---
taxonomy-category-names:
- Search
- Liferay Enterprise Search
- Search Experiences and Blueprints
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 75d0f713-0c4c-46ae-8761-21a0878077cf
---
# Creating and Managing Search Blueprints

You can create [Search Blueprints](./understanding-search-blueprints.md) from the Global menu's Applications section &rarr; Search Experiences. If you already have a Blueprint and want to apply it's functionality in a Liferay [Search Page](../../../search-pages-and-widgets/working-with-search-pages.md), see [Using a Search Blueprint on a Search Page](./using-a-search-blueprint-on-a-search-page.md).

To create Search Blueprints,

1. Open the Blueprints application by clicking _Blueprints_ from Global Menu &rarr; Applications (Search Experiences).

1. Add a Blueprint by clicking _Add_ (![Add](../../../../images/icon-add.png)).

   ![Start creating a Blueprint from the Add Blueprint modal window.](./creating-and-managing-search-blueprints/images/01.png)

1. In the New Search Blueprint window, give the Blueprint a name (required) and a description (optional).

   As of Liferay DXP 2023.Q4+, the title and description fields are localizable. To provide translations, use one of these approaches:

   1. After the blueprint is created, re-open the title and description modal, select the language and begin translating.

      ![You can translate the blueprint title and description.](./creating-and-managing-search-blueprints/images/16.png)

   1. Use the [Language Override](../../../../system-administration/configuring-liferay/changing-language-translations.md#adding-a-language-key-and-translation) application to provide a language key (e.g., `search-for-new-content`) and its translated values (e.g., _Search for New Content_ in the English translation).

1. Depending on your Blueprint plan, next you'll use these menus to continue building the [Blueprint](./understanding-search-blueprints.md#what-is-a-blueprint):

   - [Query Builder](#using-the-query-builder): in the Query Elements section, add new query clauses to the search by choosing or composing Elements for the Blueprint. In the Query Settings section, configure additional settings for the query (like which asset and object types to search).

   - [Configuration](#adding-configurations): Configure advanced settings (e.g., Sorts or Aggregations) in the search.

1. Test the Blueprint as you build and configure it. Click _Preview_ and enter a search keyword.

   ![Preview a Blueprint before putting it in action.](./creating-and-managing-search-blueprints/images/02.png)

   See [Testing a Blueprint](#testing-a-blueprint-with-the-preview-sidebar) for more details.

1. Once you're finished with the initial Blueprint creation, Click _Save_.

The Blueprint creation process can be fast and simple, but sometimes involves iterating and testing. Make sure you save the Blueprint often to ensure your work is preserved.

Edit or delete a Blueprint from its Actions menu (![Actions](../../../../images/icon-actions.png)).

You can also [import and export](#importing-and-exporting-blueprints) Search Blueprints.

![Edit, delete, or export a Blueprint from its Actions menu.](./creating-and-managing-search-blueprints/images/03.png)

## Using the Query Builder

Use the Query Builder to

1. [Add Elements to the Blueprint](#adding-elements-to-the-blueprint).

1. [Choose which Liferay assets to search](#choosing-which-liferay-assets-to-search).

### Adding Elements to the Blueprint

Add Elements to begin adding query clauses to the Blueprint:

1. Open the Add Query Elements sidebar by clicking _Add_ (![Add](../../../../images/icon-add.png)) on the Query Elements screen. 

   ![Add Elements to the Blueprint.](./creating-and-managing-search-blueprints/images/04.png)

1. Expand the Element category you want to explore.

1. Hover over the Element, then click _Add_.

1. The Element is added to the Query Builder, ready to configure:

   ![This Element gives a boost of 10 to content found on sites the searching user is a member of.](./creating-and-managing-search-blueprints/images/05.png)

1. Add as many Elements as needed to configure the search query as desired.

   See [Search Blueprints Elements Reference](./search-blueprints-elements-reference.md) for a description of each out of the box Element.

1. If any custom Elements are required, add the Custom JSON Element to the Query Builder and write the query clause you need.

   See [Creating Elements](./creating-and-managing-elements/creating-elements.md) to learn about building Custom JSON Elements.

```{important}
Some Elements require more action than adding them to the Blueprint in the Query Builder. For example, to use the Boost Longer Contents element or the Boost Contents with More Versions element, you must re-index the following entries in Control Panel &rarr; Search &rarr; Index Actions:


* `com.liferay.blogs.model.BlogsEntry`
* `com.liferay.document.library.kernel.model.DLFileEntry`
* `com.liferay.journal.model.JournalArticle`
* `com.liferay.knowledge.base.model.KBArticle`
* `com.liferay.wiki.model.WikiPage`

Other Elements require additional setup, like the Elements that provide geolocation features  (e.g., Boost Proximity). For details, see the [Elements Reference](./search-blueprints-elements-reference.md).
```

After adding Elements, make sure you save the Blueprint.

### Choosing which Liferay Assets to Search

Decide which Liferay Asset Types to include in the Blueprint's query. Use Query Settings &rarr; Searchable Types:

![Expand the Searchable Types drop-down to begin removing assets from the Search Blueprint.](./creating-and-managing-search-blueprints/images/06.png)

- All asset and object types are selected by default.
- To remove specific types, click *Select Asset Types* to open the Select Types, then de-select the corresponding checkboxes.

![The Select Types modal is used for bulk management of the assets to be searched.](./creating-and-managing-search-blueprints/images/07.png)

```{note}
De-selecting all assets in the Searchble Types modal is identical to selecting all types: all asset and object types are searched. See [Configuring Query Clause Contributors](#advanced-configuring-query-clause-contributors) to learn about disabling most of Liferay's search clauses.
```

Always save the Blueprint after editing its Searchable Types configuration.

Disabling an asset type in the Searchable Types configuration means that the query clauses usually contributed by its indexing code are excluded. The type isn't searchable, and end users will not see results of the excluded type when the Blueprint is applied to a search.

More information appears below, as the Searchable Types configuration has important implications for the other clause contributors configuration options.

### Advanced: Configuring Query Clause Contributors

Liferay's back-end code (and potentially any custom applications deployed in your Liferay instance) contributes query clauses to the ongoing search.

These clauses contributed by the back-end can be configured via Search Blueprints. However, most users should never touch two settings: 

- Search Framework Indexer Clauses 
- Search Framework Query Contributors 

The default settings are usually enough. If you're sure you must tweak this behavior beyond using the [Searchable Types](#choosing-which-liferay-assets-to-search), you must understand the way these back-end contributors work:

1. Use **Searchable Types** to disable individual indexers from participating in the search. If you disable a type's indexer, no clauses for the type are added to the search query, even if its Query Contributors are selected. Results for these types do not appear for users. 

1. Use **Search Framework Indexer Clauses** to disable all Liferay's indexers from contributing clauses to the search. The only reason to disable all indexers is to build a search query from scratch, disabling all Query Contributors and Searchable Assets as well.

1. Use the **Search Framework Query Contributors** section to remove certain contributors from participating in the search. Disable certain clause contributors if you want to override them using your own Blueprints configuration, or disable all clauses to completely override Liferay's search behavior, disabling Liferay's Indexers and Searchable Types as well.

```{important}
* Even when you disable all Indexers and Query Contributors, certain mandatory clauses are always added by Liferay's search framework. Therefore, you're never truly building a query from scratch with Blueprints.

* Liferay's Indexer framework was refactored in Liferay 7.2. Some of Liferay's core assets, like Web Content Articles and Folders, have not been updated to the new pattern. This has an impact on Search Blueprints because there are no Query Contributors for these assets. Therefore, the standard clauses for the assets are always added to the search query when Liferay Indexer Clauses is enabled. Therefore, a complete override of the Web Content Article's clauses is not possible. You can, however, tweak the search behavior of these assets by layering more clauses on top (boosting certain clause matches, for example).

* Due to internal limitations, you must choose to enable or disable all of Liferay's `Indexer`s. The other clause contributors can be managed more flexibly: choose to include all, none, or any subset of contributors you wish.

![Disable certain clause contributors or all indexers from contributing clauses to the search query.](./creating-and-managing-search-blueprints/images/08.png)
```

When you edit the clause contributors or indexer behavior, make sure to save the Blueprint.

## Adding Configurations

In addition to micromanaging the search query, add Search Blueprint settings add JSON configurations for

- Aggregations
- Highlights
- Sorts
- Parameters
- Advanced Configurations

![Additional settings can be configured using JSON.](./creating-and-managing-search-blueprints/images/09.png)

To add these, click the _Configuration_ tab, then find the text entry box for the desired configuration. Enter your JSON, then save the Blueprint.

Here's an example Sort that sorts the search results by the `name` field, in descending (reverse alphabetical--Z-A) order:

```json
{
	"sorts": [
		{
			"title_sortable": "desc"
		}
	]
}
```

For more details see [Search Blueprints Configuration Reference](./search-blueprints-configuration-reference.md).

## Importing and Exporting Blueprints

A Blueprint is a JSON object. Export the JSON of a Blueprint from one environment and import it into another. This can be useful when bringing the Blueprint from a staging and testing environment to production.

To export the Blueprint JSON,

1. Open the Blueprints application from the Global Menu &rarr; Applications &rarr; Blueprints (in the Search Experiences section).

1. From the list of Blueprints, open a Blueprint's _Actions_ (![Actions](../../../../images/icon-actions.png)) menu and click _Export_.

To import a Blueprint's JSON definition,

1. Open the Blueprints application from the Global Menu &rarr; Applications &rarr; Blueprints (in the Search Experiences section).

1. Open the main Blueprints _Actions_ (![Actions](../../../../images/icon-actions.png)) menu and click _Import_.

1. Choose a valid Blueprint JSON file. Valid Element JSON files can also be imported from this screen.

   ![Import Blueprints and Elements.](./creating-and-managing-search-blueprints/images/10.png)

1. Click _Import_.

## Testing a Blueprint with the Preview Sidebar

There's a preview sidebar that's handy for examining the results of a search backed by the Blueprint in progress. Access the preview by clicking the _Preview_ button from the Edit Blueprint screen.

![Preview a Blueprint before putting it in action.](./creating-and-managing-search-blueprints/images/14.png)

Here you can access these features:

- For 7.4 U52+, click _View Raw Request_ to see the entire search request string. From the Raw Request modal, you can copy the request to the clipboard or download it as a JSON file. This is the same request seen in the [Search Insights](../../../search-pages-and-widgets/search-insights.md) widget on the search page.

- Click _View Raw Response_ to see the entire search response string. Here you can copy the response to the clipboard or download it as a JSON file. This is the same string you see in the [Search Insights](../../../search-pages-and-widgets/search-insights.md) widget on the search page.

   ![View the raw response string returned from Elasticsearch.](./creating-and-managing-search-blueprints/images/11.png)

- The score of each result appears to the left of the result title. Click the score to see the Score Explanation.

   ![View the score explanation for a result.](./creating-and-managing-search-blueprints/images/12.png)

- To expand a result and see all the fields of its returned document, click the right facing angle bracket to the right of the result title.

   ![Inspect the document's fields.](./creating-and-managing-search-blueprints/images/13.png)

[Some elements](./search-blueprints-elements-reference.md) read search context attributes that you can provide or override manually. To test Blueprints with these elements, click the gear icon (![Gear](../../../../images/icon-cog3.png)) to add search context attributes to the Blueprint preview search. Enter the key/value pair for the attribute, then click _Done_. Note that this attribute is only set for the Blueprint preview and isn't saved with the Blueprint itself. You can configure these attributes on a Search Page. See [Using a Search Blueprint on a Search Page](./using-a-search-blueprint-on-a-search-page.md) for more information.

For example,

1. Add a new [Vocabulary with a Category](../../../../content-authoring-and-management/tags-and-categories.md) called _administrative_.

1. Add two new [Web Content Articles](../../../../content-authoring-and-management/web-content/web-content-articles.md); make sure both have _test_ in the title field. Associate one of them to the category you created.

1. Create a new Blueprint and add the Conditional Element _Hide Contents in a Category for Guest Users_. You need the Asset Category ID for the Category you created, but you can find that in the Preview window.

1. Search for _administrative_ in the preview. Expand the document of the Web Content Article with the category, then find the `assetCategoryId` (e.g., 43013).

1. Use the ID in the Element's configuration.

1. Open the Preview sidebar's _Attributes_ and enter

   Key: `user.is_signed_in`

   Value: `false`

1. Click _Done_, then enter a search for _test_.

Now only the uncategorized Web Content Article is returned. The other one has been hidden because of the search context attribute that causes the search to behave as if the search User is a Guest.

This example uses an Element that reads the context variable `user.is_signed_in`. By setting a value manually, you override the existing value so the Blueprint can demonstrate a certain behavior. Because a value already exists in the search context, setting it manually is optional. Other Elements have required custom parameters that do not exist within a normal search request's context. These must be passed manually into the search context for the Element/Blueprint to function properly, whether testing the Blueprint from the preview sidebar or setting the Blueprint for use on a search page.

## Setting the External Reference Code (ERC)

{bdg-secondary}`Liferay 2023.Q4+/GA102+`

You can refer to the blueprint by its editable ERC, and this is recommended whenever possible. For convenience you can set the ERC to something memorable and human readable. From the blueprint editor, click _Edit_ ![Edit](../../../../images/icon-edit-pencil.png) next to the ERC:

![Edit the ERC to be memorable and readable.](./creating-and-managing-search-blueprints/images/15.png)

This human readable ERC comes in handy when setting the blueprint [on a search page](./using-a-search-blueprint-on-a-search-page.md) or in a [headless search request](../../../developer-guide/search-headless-apis.md).

## What's Next

- [Using a Search Blueprint on a Search Page](./using-a-search-blueprint-on-a-search-page.md)
