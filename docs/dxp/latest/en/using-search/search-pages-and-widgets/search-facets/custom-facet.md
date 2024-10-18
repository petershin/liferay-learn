---
taxonomy-category-names:
- Search
- Search Pages and Widgets
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: bfc953a5-54eb-4324-bce7-30c888cdf1e9
---
# Custom Facet

The Custom Facet is unique among the out-of-the-box search facets. Rather than group results by a single static field (like the modified date or the asset type), you can choose which field to group results by, creating an entirely new facet in the process.

!!! important
    Finding non-analyzed keyword fields in the index is important when using the Custom Facet. See [Exploring Indexed Fields](../exploring-indexed-fields.md) for more details.

## Configuring the Custom Facet

1. Click *Add* (![Add icon](../../../images/icon-add-app.png)) at the top of the page.

1. Locate the Custom Facet and drag it to the collection of facets on the left. The Custom Facet is found under the Search section of widgets.

   ![Find the custom facet under the search widgets.](custom-facet/images/01.png)

1. Click *Options* (![Options icon](../../../images/icon-app-options.png)) &rarr; *Configuration*.

   ![Click on the Configuration option.](custom-facet/images/02.png)

   The Custom Facet has several configuration options which are described below.

1. When finished, click *Save*.

**Display Settings:** Choose between *Default*, *Compact Layout*, and *Label Layout*. The Default layout shows checkboxes next to each term but the Compact layout does not. The Label layout shows small clickable labels for each term.

Advanced Configuration contains additional options: 

**Aggregation Field:** Enter the name of the indexed field to aggregate results by. This must be a non-analyzed keyword field. See [Exploring Indexed Fields](../exploring-indexed-fields.md) for more information.

**Custom Heading:** Enter the heading to display for this facet. If not set, the aggregated field name is displayed.

**Custom Parameter Name:** Specify a URL parameter name for selected values. If not set, the aggregated field name is used.

**Max Terms:** Set the maximum number of facet terms to display, regardless of how many matching terms are found for the facet.

**Frequency Threshold:** Set the minimum frequency required for terms to appear in the list of facet terms. For example, if the frequency threshold of a facet is set to 3, terms with two matching results don't appear in the term result list.

**Order Terms By:** For Liferay 7.4 U60+/GA60+, you can choose the facet term sorting strategy: Term Frequency Descending (default) or Term Frequency Ascending. The default sorting orders facet terms from most matches to least.

**Display Frequencies:** Choose whether to display the term frequencies.

**Federated Search Key:** Enter the key of an alternate Search this widget is participating on. If not set, this widget participates on the default search. This value is typically the name of an application-defined index.

## Related Topics

- [Searching for Content](../../getting-started/searching-for-content.md)
- [Search Administration](../../search-administration-and-tuning/search-administration.md)
- [Using the Custom Filter Widget](../search-results/using-the-custom-filter-widget.md)
