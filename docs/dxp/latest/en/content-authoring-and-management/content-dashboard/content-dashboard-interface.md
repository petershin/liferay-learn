# Content Dashboard Interface

{bdg-secondary}`Available 7.3+`

The Content Dashboard interface has the following areas:

* [Content Audit Tool](#content-audit-tool) (1)
* [Contents list](#contents-list) (2)
* [Content Info sidebar](#content-info-sidebar) (3)

![The content dashboard user interface contains three areas of information.](./content-dashboard-interface/images/05.png)

When you [open the content dashboard](#accessing-the-content-dashboard), you see the [content audit tool](#content-audit-tool) (1) at the top of the page and the [contents list](#contents-list) (2) at the bottom. From the contents list, you can access the [content info sidebar](#content-info-sidebar) (3) and the [content performance panel](../page-performance-and-accessibility/about-the-content-performance-tool.md). The content info sidebar and the Content Performance panel can collapse. They show additional details for each item in the contents List.

To access the content info sidebar, click the *Actions Menu* (![Action Menu](../../images/icon-actions.png)) for the content and select the *Info* option. Alternatively, hover over the article and click *Info* (![Info](../../images/icon-information.png)). For information on the *View Metrics* (![Metrics](../../images/icon-analytics.png)) option, read [About the content Performance Panel](../page-performance-and-accessibility/about-the-content-performance-tool.md).

```{note}
Starting from Liferay DXP 7.4 U42+/GA42+, the following improvements have been made to the info panel.

* Blogs and web content have a preview image in addition to images and PDFs. But you cannot click on the preview image to redirect to the blog or web content. 

* In the *Details* section, you can now view the *WebDAV* URL for documents along with the *Latest Version URL* below it. 

* You can subscribe to a web content by clicking on the bell icon at the top right of the info panel. This notifies you of any changes that occurs with the web content. 

* You can share blogs and documents from the info panel by clicking on the *Share* button and entering the email address of the person(s) you want to share it with. Once added, you can view and manage the collaborators from the info panel itself. 
```

## Accessing the Content Dashboard

1. Click on the Global Menu and, under the *Content* area, click *Content Dashboard*.

1. If the Global Menu is disabled, open the Product Menu and, under the *Site* Menu, go to *Content* &rarr; *Content Dashboard*.

    ![Open the content dashboard from the Global Menu.](./content-dashboard-interface/images/03.png)

## Content Audit Tool

This tool is the graphical area at the top of the content dashboard page. The chart represents the total number of assets for a given combination of vocabularies and categories,  including the *Global* scope and all *Sites & Asset Libraries* in the instance. This chart takes into account:

* [Web content articles](../web-content/web-content-articles/adding-a-basic-web-content-article.md), [documents and media](../documents-and-media.md) and [blog entries](../blogs/adding-blog-entries.md) across all sites and asset libraries.

    ```{note}
    Documents and media are available in the content dashboard starting with Liferay CE/DXP 7.4+. 
    
    Blog entries are available in the content dashboard starting from Liferay DXP 7.4 U23+/GA23+.
    ```

* Content you can access.

* The existing [filters](#filtering-and-sorting-content-in-the-contents-list) in the [contents list](#contents-list).

* A maximum of two vocabularies (for the *x* and *y* axes.)

![Overview of the content audit tool in the content dashboard](./content-dashboard-interface/images/10.png)

```{tip}
If the content audit tool doesn't show the expected chart, [verify your categories](../tags-and-categories/defining-categories-and-vocabularies-for-content.md) for the global vocabularies and ensure that [your content is categorized](../tags-and-categories/organizing-content-with-categories-and-tags.md).
```

In the content audit tool interface you can find:

* Chart legend (1)

* *X*-axis categories for the first vocabulary (2)

* *Y*-axis categories for the second vocabulary (3)

* Bar chart (4)

![Overview of the content performance user interface](./content-dashboard-interface/images/04.png)

### Customizing the Vocabularies and Categories in the Content Audit Tool

By default, the bar chart shows the total number of assets for each category in the selected vocabularies, but you can filter this information in different ways:

* Use the [filters](#filtering-and-sorting-content-in-the-contents-list) in the [contents list](#contents-list).

* Filter categories in the chart by checking or unchecking the category name in the chart legend.

* Click one of the bars to zoom-in on a specific category's results.

* Change which vocabularies are displayed in the graph.

To change these Vocabularies:

1. Click the *Configure Chart* icon (![gear icon](../../images/icon-settings.png)) in the content audit area.

1. In the dual listbox, click the vocabulary in the *Available* or *In Use* lists and click the selection buttons (![Angle Left](../../images/icon-angle-left.png) ![Angle right](../../images/icon-angle-right.png)) to add or remove the vocabularies you want to show.

1. Click the *Up* (![Up](../../images/icon-angle-up.png)) and *Down* (![Down](../../images/icon-angle-down.png)) buttons to order of the vocabularies in the chart axis.

1. Click *Save*.

1. Click the *Flip Axes* (![Flip Axes](../../images/icon-change.png)) icon in the content audit area if you must switch the axis assigned to the selected vocabularies.

    ![Select the vocabularies in the Content Audit Tool](./content-dashboard-interface/images/12.png)

```{note}
You can select a maximum of two vocabularies. Only vocabularies from the same site can be combined. Global vocabularies can be combined with vocabularies from any site.
```

A gray bar denotes content without any categories in one of the selected Vocabularies. Chart labels for this content are distinctive. For instance, when you choose the Audience Vocabulary, the content that is not categorized under Audience shows the *No Audience Specified* label.

## Contents List

By default, this area shows all the content you have access to, across all sites and Asset Libraries. From here, you can sort and filter this content using built-in or custom filters. The Content Audit Tool chart changes dynamically based on the filters that you set.

In the Contents list you can find the following elements:

* Filter and Sort selector (1)

* Filter editor (2)

* Search field (3)

* List of contents (4)

![The Contents list contains several elements to help you find content.](./content-dashboard-interface/images/06.png)

In the list of contents, you can find the following columns:

| Column | Description |
| :--- | :--- |
| Title | Article title(*). |
| Author | Author's name. |
| Type | Specifies a [Web Content Article](../web-content/web-content-articles/adding-a-basic-web-content-article.md), [Documents](../documents-and-media.md) asset type (available in Liferay DXP 7.4+.) or [Blog Entry](../blogs/adding-blog-entries.md) asset type (available in Liferay DXP 7.4 U23+/GA23+) |
| Subtype | Content [Subcategory](../tags-and-categories/defining-categories-and-vocabularies-for-content.md#creating-subcategories). Includes Basic Documents and External Video Shortcuts |
| Site or Asset Library | Location of the article in the Liferay DXP instance. |
| Status | Article workflow status. Articles with more than one version in different statuses show all than statuses. |
| *First Vocabulary* | This is the first Vocabulary in the Content Audit Tool. |
| *Second Vocabulary* | The optional second Vocabulary in the Content Audit Tool. |
| Modified Date | Date or time of the last article update. |

(*) The*Page* (![Page](../../images/icon-page.png)) icon denotes content based on a [Display Page Template](../../site-building/displaying-content/using-display-page-templates.md).

```{note}
The *First Vocabulary* and *Second Vocabulary* columns depend on the Vocabularies you select.
```

For each entry in the Contents list, you can access the following options using the *Actions* menu (![Actions Menu](../../images/icon-actions.png)) or hovering over the article and clicking the corresponding option:

* *View* (![View](../../images/icon-preview.png)): Opens the content based on a Display Page Template in view mode.

* *Edit* (![Edit](../../images/icon-edit.png)): Opens the content in edit mode.

* *Info* (![Information](../../images/icon-information.png)): Opens the [Content info](#content-info-sidebar) sidebar.

* *View Metrics* (![View Metrics](../../images/icon-analytics.png)): Opens the [Content Performance panel](../page-performance-and-accessibility/about-the-content-performance-tool.md).

    ![Access the Content info sidebar and Content Performance panel from the Actions menu or the icons on each content row.](./content-dashboard-interface/images/11.png)

```{note}
Use the *View*, *Info*, and *View Metrics* options for content based on a Display Page Template. Use the *Edit* option when you have Edit permission for the content.
```

### Filtering and Sorting Content in the Contents List

1. Click the *Filter and Order* drop-down menu.

1. Select one of the predefined filters or a custom filter (denoted by three dots) to create your own filter criteria.

1. Select the content you want to filter.

The Filter Editor area shows your filters and the total results. To remove one or more filters, click the *Close* (![Close](../../images/icon-times.png)) button next to the filter's name, or click *Clear* to remove all filters and reset the Contents list. In addition to the predefined and custom filters, you can search and filter the assets in the Content View using keywords in the Search field. To understand how the combination of different filters works, read [Understanding How Filtering Works in the Contents List](#understanding-how-filtering-works-in-the-contents-list).

![Use the filter editor to remove a specific filter or all of them from the filter area.](./content-dashboard-interface/images/01.png)

You can also filter the content by clicking one of the bars in the [Content Audit Tool](#content-audit-tool) area and zoom-in on a specific Category's results.

![Click on one of the bars in the Content Audit Tool to filter by the bar's Category.](./content-dashboard-interface/images/08.png)

To sort the content,

1. Click the *Filter and Order* drop-down menu.

1. Under the *Order By* section, select the order for the items.

```{note}
When you close the Content Dashboard page, the default filter and sorting option are set again.
```

### Filter Options Reference

> Some filter options are only available starting with Liferay 7.4+

From the *Filter and Order* drop-down menu, you can choose these options:

| Filter | Description |
| :--- | :--- |
| Categories | Filters using one or more [Categories](../tags-and-categories/organizing-content-with-categories-and-tags.md) from your Vocabularies. |
| Site or Asset Library | Selects the assets' Site or Asset Library.  |
| Type | Choose the Web Content Articles, Documents, or Blog Entries to include. From here, you can select</br><ul><li>**Web Content Articles**: Includes all the [Basic Web Content Articles](../web-content/web-content-articles/adding-a-basic-web-content-article.md) and the custom [Structures](../web-content/web-content-structures/understanding-web-content-structures.md) from all the Sites.</li><li>**Documents**: Includes the out of the box Document types and all the [custom Document types](../documents-and-media/uploading-and-managing/managing-metadata/defining-document-types.md).</li><li>**Blog Entries**: Includes all the Blog Entries from all the Sites.</li></ul> |
| Extension | Provides a way to filter by the Document or Media type. You can choose from the following types:</br><ul><li>`audio`</li><li>`code`</li><li>`compressed`</li><li>`image`</li><li>`presentation`</li><li>`spreadsheet`</li><li>`text`</li><li>`vectorial`</li><li>`video`</li><li>`other`</li></ul> |
| Tags | Selects from the list of [keywords](../tags-and-categories/tagging-content-and-managing-tags.md) you use to organize your assets. |
| Filter by Author | Filters by the author of the Web Content, Document, or Blog Entry. |
| Filter by Status | Filters by the [workflow status](../../process-automation/workflow/introduction-to-workflow.md) of the Web Content, Document, or Blog Entry. |

When using the Type or Extension filter, you can define your search criteria from a new Filter dialog. Consider this information:

* Selecting a top-level node selects all the elements inside.

* The top-level nodes show the total number of elements inside.

* Search is case insensitive.

* You can add, remove, or edit the available extensions from the Global menu (![Global menu](../../images/icon-applications-menu.png)) &rarr; *Control Panel* &rarr; *System Settings* &rarr; *Content and Data* &rarr; *Documents and Media* &rarr; *Service*.

* The filter in the Content lists reflects the filter criteria you choose in the Filter dialog.

![The search criteria you use in the Type or Extension filters is included in the Content List.](./content-dashboard-interface/images/13.png)

### Understanding How Filtering Works in the Contents List

* When you use the Categories or Tags filters with more than one criteria, the results correspond to content that meets all the criteria (see example A.)

* When you choose multiple options for the same filter criteria, the Contents list shows assets matching at least one option (see example B.)

* The criteria from different filters is combined using the `and` operator (see example C.)

| Example| Filter By | Filter Example | Contents List Results |
| :--- | :--- | :--- | :--- |
| A | Categories | Categories: *Entrepreneur* and *Family* | Only assets that belong to both the *Entrepreneur* `and` Family Categories. |
| B | Authors | Authors: *Peter* and *Linda* | Assets authored by *Peter* `or` *Linda* `or` both. |
| C | Categories, Authors | Category is *Entrepreneur* and Author is *Linda* | Only assets under the *Entrepreneur* Category `and` authored by Linda. |

## Content Info Sidebar

This sidebar provides access to different metadata for the asset selected in the Contents list, including the asset owner, available languages for the content, tags and categories for the asset, or review date.

![Access the Information sidebar from the assets in the Contents list.](./content-dashboard-interface/images/07.png)

To open the Information sidebar,

1. Click the Actions Menu (![Actions Menu](../../images/icon-actions.png)) next to the asset and select *Info*.

1. Alternatively, hover over the asset and click the *Info* (![Information icon](../../images/icon-information.png)) icon.

    ![The Information sidebar provides different metadata for your content.](./content-dashboard-interface/images/09.png)

```{note}
Starting from Liferay DXP 7.4 U44+/GA44+, the following improvements have been made to the content dashboard.

* The content type and subtype are now present in the info panel of the content dashboard.

* The MIME type of a basic document (image, vectorial, etc) is present in the info panel and in the subtype column of the content list.

* The *Categorization* and *Detail* sections in the info panel are collapsible. 

* The info panel remains open after page reload so that you can keep viewing the content that was previously open. 
```

## Related Information

* [About the Content Dashboard](./about-the-content-dashboard.md)
* [About the Content Performance Tool](../page-performance-and-accessibility/about-the-content-performance-tool.md)
* [Defining Categories and Vocabularies for Content](../tags-and-categories/defining-categories-and-vocabularies-for-content.md)
