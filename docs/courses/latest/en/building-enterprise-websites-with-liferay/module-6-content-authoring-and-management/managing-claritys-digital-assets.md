---
uuid: 52ff56f2-e984-4800-b390-5abb125c6a5d
---
# Managing Clarity’s Digital Assets

In the context of content management, digital assets are any files or media you can use to enrich your content. As a general requirement, enterprise websites need a comprehensive plan that outlines how the organization's staff users will store, manage, and use its digital assets. Without an asset management infrastructure, Clarity's web developers and content creators will struggle to maintain and leverage their digital assets effectively. This article focuses on Asset Libraries, a Liferay feature that Clarity can use to manage their digital assets with low technical effort.

<!--TASK: Draft an overview article that explains the different types of content creation and management features provided by Liferay. Address questions about storing assets (e.g., database options, storing content in sites vs asset libraries).-->

## Asset Libraries

Asset libraries simplify digital asset management by providing a collaborative hub for adding, editing, and sharing assets among multiple sites and users. Permissions and version control ensure that assets are accessible by the right people and kept up to date with the latest changes, all while maintaining security and transparency across the organization. Asset libraries can be organized with folders, tags, and categories. They also integrate seamlessly with Liferay’s other content management features. For example, you can use asset libraries with workflows to create a custom publishing process.

<!--
TASK: Improve content presentation. Points to make (though not necessarily in this order):
* You can organize assets using folders, tags, and categories.
* You can define sets of assets to display in connected sites.
* You can manage membership to libraries individually and assign  assets library specific roles.
* You can manage which sites can access the library's assets. 
* You can set up workflows to govern content creation, review, and publishing.
(I'm unsure if we should also mention content localization/translation. I wonder if we should also mention that only the Web Content and D&M applications are supported in libraries)
-->

![Asset libraries are virtual spaces for storing reusable assets.](managing-claritys-digital-assets/images/01.png)

## Exercise: Creating Asset Libraries
<!--Exercise 9a-->

The training workspace already includes multiple libraries for Clarity's assets. Here, you'll create a library for branding assets as Walter Douglas.

To do this,

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Applications* tab, and click *Asset Libraries*.

1. Click *New* and enter the name `Clarity Branding and Logo`.

1. Click *Save*. This creates a library and redirects you to its configuration page.

   Now you can link the library to Clarity's site.

1. Go to the *Sites* tab in the sidebar menu.

1. Click *Add* and select *Clarity Public Enterprise Website*.

   This enables users in the site to access content in the asset library. Next, add content to the library.

   ![Add Clarity Public Enterprise Website to Clarity Branding and Logo asset library.](./managing-claritys-digital-assets/images/02.png)

1. Return to the *Asset Libraries* overview page.

1. Click *Clarity Branding and Logo* to access its applications and begin adding content.

1. Select *Documents and Media*.

1. Click *New* and select *Multiple Files Upload*.

1. Select all images from the `[repository-folder]/exercises/lesson-9/` resources folder.

1. Click *Publish*.

You should now have five asset libraries with images and content that you can use in Clarity's website:

* Clarity Branding and Logo
* Error Pages
* Leadership Headshots
* Marketing Assets
* Product Images

![Go to the Asset Libraries overview page and confirm you have five asset libraries.](./managing-claritys-digital-assets/images/03.png)

Next, you'll return to Clarity's master pages and use the imported branding images.

<!--TASK: Add content on library membership. Add Christian Carter (and Clara?) to the Marketing Assets Library.-->

## Exercise: Adding Clarity’s Logo to the Master Pages
<!--Exercise 9b-->

Clarity's master page templates are mostly complete. However, we still need to add Clarity's logo to the header and footer. Here you'll add these images as Walter Douglas.

To do this,

1. Go to *Clarity Public Enterprise Website*.

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)), expand *Design*, and select *Page Templates*.

1. In the Master tab, click *Primary Master Page* to begin editing it.

1. Double click the header's *Image* fragment.

   This selects the fragment's *image-square* sub-element and opens its configuration options.

1. In the configuration side panel, click the *Select Image* button (![Select Image](../../images/icon-plus.png)).

1. Click *Sites and Libraries* in the breadcrumb menu.

   ![Click Sites and Libraries in the breadcrumb menu.](./managing-claritys-digital-assets/images/04.png)

1. Go to the *Asset Library* tab.

   You should now see all asset libraries connected to this site.

1. Select *Clarity Branding and Logo*.

1. Select `logo-name-vector` to add the image to the header.

   !!! tip
       If you're having difficulty finding the image, use the search bar.

1. In the configuration side panel, go to the *Link* tab and configure these settings:

   | Tab  | Setting | Value |
   |:-----|:--------|:------|
   | Link | Link    | Page  |
   | Link | Page    | Home  |

   Now when users click the header image, they're directed to Clarity's Home page.

1. Repeat these steps for the footer image fragment, selecting the `logo-full-name-vector` instead.

1. Click *Publish Master* to save your changes to the master page template.

   All pages using the master page are now automatically updated.

   !!! important
       If the image does not update for you, you must clear the Liferay server's cache. To do this, sign in as the Clarity Admin user, open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Server Administration*. Then, click *Execute* for the "Clear content cached across the cluster" operation.

   ![Select logo-name-vector to add the image to the header and logo-full-name-vector to the footer.](./managing-claritys-digital-assets/images/05.png)

1. Repeat steps 4-10 to update the header image in the *Secondary Master Page* template to use `logo-name-vector`.

## Conclusion

Great! So far you've learned how to create asset libraries, import content, and display it in pages. Next you'll learn about creating web content.

Next Up: [Creating Clarity's Web Content](./creating-claritys-web-content.md)

## Additional Resources

See official documentation to learn more about Liferay's digital asset management features:

* [Asset Libraries](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/asset-libraries)
* [Documents and Media](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/documents-and-media)
