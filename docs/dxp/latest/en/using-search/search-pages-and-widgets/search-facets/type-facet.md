---
taxonomy-category-names:
- Search
- Search Pages and Widgets
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 8c466215-f3d5-4dd0-840d-e685e0965869
---
# Type Facet

The Type Facet narrows search results down to those associated with a certain Asset Type. Each Type with content matching the searched keyword appears as a facet term.

![Example of type facet results.](type-facet/images/01.png)

By default, all available Asset Types are displayed as facet terms:

* Blogs Entry
* Calendar Event
* Document
* Documents Folder
* Dynamic Data Lists Record
* Form Record
* Knowledge Base Article
* Message Boards Message
* Page
* User
* Web Content Article
* Web Content Folder
* Wiki Page

## Configuring the Type Facet

To configure the Type Facet, open the Options menu (![options icon](../../../images/icon-app-options.png)) of the facet and click *Configuration*.

![Click on the Configuration option.](type-facet/images/02.png)

**Display Settings:** Choose between *Default*, *Compact Layout*, and *Label Layout*. The Default layout shows checkboxes next to each term but the Compact layout does not. The Label layout shows small clickable labels for each term.

The Advanced Configuration section contains additional options: 

**Type Parameter Name:** Change the parameter name in the URL for the Facet. The default is *type*. 

**Frequency Threshold:** Set the minimum frequency required for terms to appear in the list of facet terms. For example, if the frequency threshold of a facet is set to 3, a term with two matching results doesn't appear in the term result list.

**Display Frequencies:** Choose whether or not to display the term frequencies.

**Order Terms By:** For Liferay 7.4 U60+/GA60+, you can choose the facet term sorting strategy: Term Frequency Descending (default), Term Frequency Ascending, Term Value Ascending, or Term Value Descending. The default sorting orders facet terms from most matches to least. Term value options order facet terms alphabetically.

**Current and Available:** Choose which asset types are visible in the facet. To remove types, select from the Current section by clicking and highlighting. Click the right arrow and move the Asset Type from *Current* to *Available*. Add Asset Types by moving them to the Current section.

![Use the right and left arrows to add or remove asset types.](type-facet/images/03.png)

Once finished, click the *Save* button.
