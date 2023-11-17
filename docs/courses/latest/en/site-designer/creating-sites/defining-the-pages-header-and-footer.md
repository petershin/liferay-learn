---
uuid: 2300c294-4b2c-480a-8a99-a230ace39c5f
---
# Defining the Pages' Header and Footer

With Liferay's Master Pages, Delectable Bonsai can define common elements for their pages' headers and footers. The site has just one page currently, the Home page. Since no master page was added, . At first the master page will define the header and footer for just the one page, but Delectable Bonsai will re-use it across the entire site, as more pages are added.

Because there's one site in the instance, Grow Delectable Bonsai, creating the Master Page in the site itself is sufficient. To share a Master Page among multiple sites, use a Site Template.



1. 

Copied from master-page-templates.md:
Master Page Templates provide a way to define elements common to every page (e.g. │
Headers and Footers previously provided by Themes) using Fragments, so you can easily maintain and manage them in Portal without having to deploy a plugin. You can use the same Master Page Template across an entire Site or have a unique one for each page. Each Page and Page Template must have an associated Master Page Template. By default, this is the "Blank" Master, which doesn't provide any common elements.
