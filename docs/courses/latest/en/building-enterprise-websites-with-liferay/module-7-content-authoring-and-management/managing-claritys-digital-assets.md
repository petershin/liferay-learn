---
uuid: 52ff56f2-e984-4800-b390-5abb125c6a5d
---
# Managing Clarity’s Digital Assets

In the context of content management, digital assets are any files or media you can use to enrich your content. This article focuses on the asset library, a Liferay feature that Clarity can use to manage their digital assets with low technical effort.

## Asset Libraries

![Asset libraries are virtual spaces for storing reusable assets.](managing-claritys-digital-assets/images/01.png)

Asset libraries declutter digital asset management by providing a collaborative hub for adding, editing, and sharing assets among multiple sites and users. Permissions and version control ensure that assets are accessible by the right people and kept up to date with the latest changes, all while maintaining security and transparency across the organization. Asset libraries can be structured with folders and tags, and they integrate seamlessly with Liferay’s other content management features.

## Exercise One: Creating an Asset Library

Clarity needs a catalog of images approved by the marketing team for the website designers to use in order to make sure they aren't including unauthorized assets in the web pages. Since you now understand what asset libraries are and how they can be used, let's create one for Clarity and add a set of approved images to it.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Applications_ &rarr; _Content_ &rarr; _Asset Libraries_.

   ![The Asset Libraries menu can be accessed from the Global Menu.](./managing-claritys-digital-assets/images/02.png)

   <!-- TODO: Update screenshot above. The newer versions of Liferay replace the Add button icon. Instead of being a plus sign, it's now a text with the word "New". The Clarity Site Initializer is, as of now, using an older version. -->

1. Click _New_ to create an asset library, then name it `Marketing Images`.

1. Update these fields in the library's configuration menu:

   | Field              | Value                                                                            |
   |:-------------------|:---------------------------------------------------------------------------------|
   | Description        | List of images that have been approved by marketing for use on public websites. |
   | Applications       | Disable all, except `Documents and Media`                                        |
   | Enable Auto Tagging | `disabled`                                                                       |

   ![An asset library's basic information can be configured in the General page.](./managing-claritys-digital-assets/images/03.png)

1. Click _Save_.

1. Navigate back to the Asset Libraries menu, then open the library's menu page by selecting `Marketing Images`.

   ![The library's menu can be accessed to make use of its functionalities.](./managing-claritys-digital-assets/images/04.png)

   Here you can access the library's active applications to create and manage content. You can also enable staging, implement custom workflows, categorize content using tags and categories, and more.

1. Select the _Documents and Media_ application.

1. Upload some images of your choice into the library.

<!-- TODO: Replace above with "Download the sample images and upload them into the library." and add the link to the sample images -->

   ![Uploaded images are saved in the library's documents and media application.](./managing-claritys-digital-assets/images/05.png)

Content added to an asset library can be accessed from connected sites and used in multiple scenarios, such as displaying content in fragments, adding it to web articles, and more.

## Exercise Two: Linking Asset Library to Site

Having successfully created and populated the Marketing Images library with content (as completed in Exercise 1), the next step is to link it with Clarity's website. This will enable Clarity's website designers to browse and use the library's content in the item selector.

Let's connect the asset library to Clarity's main site, then change a blog's cover image using the library's content.

1. Navigate to _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Applications_ &rarr; _Content_ &rarr; _Asset Libraries_.

1. Click _Actions_ (![Actions](../../images/icon-actions.png)) under Marketing Images and select _Edit_.

1. Go to _Sites_ at the left-side menu.

1. Click _Add_ and select Clarity's site to connect it with the asset library.

   ![An asset library can be connected to multiple sites.](./managing-claritys-digital-assets/images/06.png)

1. Navigate back to Clarity website's main page, open the _Product Menu_ (![Product Menu](../../images/icon-product-menu.png)), then go to _Content & Data_ &rarr; _Blogs_.

1. Select a blog of your choice and start editing it.

1. Click _Change Image_ in the cover image panel.

   ![A blog's cover image can be changed with the item selector.](./managing-claritys-digital-assets/images/07.png)

1. In the item selector, navigate to the _Document and Media_ tab, then use the breadcrumb to go to _Sites and Libraries_.

   ![You can navigate through the item selector to an asset library's menu.](./managing-claritys-digital-assets/images/08.png)

1. Navigate to the _Asset Library_ tab and select _Marketing Images_.

1. Finally, choose an image in the item selector, then click _Publish_ at the bottom of the editing page.

   ![The blog's cover image will be replaced with the chosen option from an asset library.](./managing-claritys-digital-assets/images/09.png)

After completing these steps, the blog's cover image will be replaced with your chosen option from the asset library.

## Conclusion

This concludes *Managing Clarity’s Digital Assets*. With your asset library in place, you can learn more about creating content from scratch with Liferay.

Next Up: [Creating Content for Clarity’s Pages](./creating-content-for-clarity’s-pages.md)

## Additional Resources

* [Asset Libraries](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/asset-libraries)
* [Documents and Media](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/documents-and-media)
