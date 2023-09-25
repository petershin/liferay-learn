---
uuid: b834cea1-1a95-4b8d-8379-73715fefc897
---
# Creating Site Templates

Reference Docs at https://learn.liferay.com/en/w/dxp/site-building/sites/site-templates

Create site templates to speed up site creation. You can provide reusable data to any site created with the template. Template creation uses the same tools used to create sites.

In the [Liferay Administrator course](../../liferay-administrator/configuration/configuring-virtual-instances.md), you set up an additional virtual instance for the intranet website, called `breakfast.delectablebonsai.com`, along with the default instance that's used for the public customer-facing website and the business-to-business site for distributors of Delectable Bonsai's products.

Since the default instance will hold two sites, you can create a site template for shared pages and content between the sites. 
NOTE: Starting point: we have 2 instances, probably in reality running two separate docker containers to mock it. We need to get this populated for all the following work to be based on 

The two sites are both for selling Delectable Bonsai's products. One will be a B2C, or business-to-consumer site, and the other a B2B, or business-to-business site. In the B2B site,  vendors like Marvelous Markets purchase their Delectable Bonsai products to sell at their retail locations. With an administrative user (e.g., Kyle Klein), <!--link to the host:port, e.g., http://localhost:9080 -->

1. Go to the Global Menu (![Global Menu](../../images/icon-applications-menu.png)) &rarr; Control Panel &rarr; Site Templates. 

1. Click the Add button (![Add](../../images/icon-add.png)) to add a site template. Configure it:

   * **Name:** Delectable Bonsai Sites Template
   * **Active:** Toggle this off so that sites aren't created while the template is still being worked on.
   * **Allow site administrators to modify pages associated with this site template, even when propagation of changes is enabled**: <!--Decide-->
   * **Ready for Propagation:** <!--Decide -->

1. Click _Save_.

1. In the Site Templates screen, click _Delectable Bonsai Sites Template_. You're taken to the site editor.

1. The sites don't need a detailed template. They'll simply define NOTE: What's in the template? A navigation menu? A search page? Certain Users with Site Roles? Collections? How about Utility Pages? Search Page?

At this point, you're designing the sites that will be based on this template.

Next, add a navigation menu to the template.

