---
taxonomy-category-names:
- Search
- Search Pages and Widgets
- Categories and Tags
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: a0d991e3-b1bc-4295-9ea9-ea975e420b46
---
# Tag Facet

The Tag Facet narrows search results for any assets with tags that match the search keyword. Each match appears as a facet term.

![Example of tag facet results.](./tag-facet/images/01.png)

## Configuring the Tag Facet

To configure the Tag Facet, open the facet's Options menu (![Options](../../../images/icon-app-options.png)) and click *Configuration*.

![Click on the Configuration option.](./tag-facet/images/03.png)

**Display Settings:** Choose between *Default*, *Compact Layout*, and *Label Layout*. The Default layout shows checkboxes next to each term but the Compact layout does not. The Label layout shows small clickable labels for each term.

The Advanced Configuration section contains additional options: 

**Tag Parameter Name:** Change the parameter name in the URL for the Facet. The default is *tag*. 

**Max Terms:** Set the maximum number of facet terms to display, regardless of how many matching terms are found for the facet.

**Frequency Threshold:** Set the minimum frequency required for terms to appear in the list of facet terms. For example, if the frequency threshold of a facet is set to 3, a term with two matching results doesn't appear in the term result list.

**Display Frequencies:** Choose whether or not to display the term frequencies.

**Order Terms By:** For Liferay 7.4 U53+/GA53+, you can choose the facet term sorting strategy: Term Frequency Descending (default), Term Frequency Ascending, Term Value Ascending, or Term Value Descending. The default sorting orders facet terms from most matches to least. Term value options order facet terms alphabetically.
