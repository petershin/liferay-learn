---
uuid: e33a05f2-6716-4fda-a14b-ad6f8221e534
---
# Adding the Home Page

Right now, browsing to <http://localhost:8080> loads the default site and the default home page, with the option to sign in. In the last module, you changed the instance name and set the logo. This began to give the site a customized look and feel.

![The default home page has a header, footer, and some Welcome to Liferay content.](./adding-the-home-page/images/01.png)

<!-- Re-work this for default home page -->
Delectable Bonsai needs its own home page. Page creation and management is part of the site administration activity, and can be completed by anyone with the proper permissions. Out-of-the-box, Liferay comes with a role named Site Administrator that provides the required permissions. Any user assigned to the role and a member of the site can act as an administrator in the site. The setup script and the steps completed in the [Liferay Administrator](../../liferay-administrator.md) lessons have your Liferay instance pre-populated with just such a user, Preston Palmer.

<!-- NOTE: must iron this site administrative user out. -->

While logged in as the site administrator, configure the existing home page for Delectable Bonsai:

1. Go to the Home page and click Edit (![Edit](../../images/icon-edit.png)) in the administrative header.

   The content page editor appears. This is where you add content, functionality, and structure to the page.

1. Open the browser (![Browser](../../images/icon-hierarchy.png)) and expand all the elements to get a snapshot of the page's structure: 

   ![The default home page has some content defined already.](./adding-the-home-page/images/02.png)

1. Click the outermost container's Actions menu (![Actions](../../images/icon-actions.png)), then click _Delete_.

   Now your page is a blank slate. There's still a header and footer (we'll customize that in the next exercise), but the default page content is gone!
   <!-- Maybe not relevant to the course, but I've observed that there's a section element called content that's still visible (though blank) in the page, but the main-content div is no longer visible. Everything you add in the content page editor goes into this main-content div and provides the actual visible page content. It's useful to know about the content section though, because you can provide styling to the parent of main-content as needed (for example we had to set it to display: flex for our footer to work properly)-->

1. Click the plus icon (![Fragments and Widgets](../../images/icon-plus.png)) to open the Fragments and Widgets sidebar menu.

1. Drag a _Container_ fragment onto the page.

   Containers define configurable drag and drop zones for fragments and widgets. Adding all content page elements to a container makes styling the page more convenient.

1. Add a banner to the container. Search for _Banner_ in the Fragments and Widgets sidebar menu, and drag it into the container you already added.

   The banner consists of two containers, a heading, a paragraph, and a button.

   In the Browser sidebar (![Browser](../../images/icon-hierarchy.png)), expand the elements to see the current page element hierarchy:

   ![These elements were added with the container fragment and the banner fragment.](./adding-the-home-page/images/03.png)

1. Rename the Banner's top level container. In the Browser sidebar, open the Actions menu (![Actions](../../images/icon-actions.png)) and click _Rename_.

   ![Rename the banner's container for readability.](./adding-the-home-page/images/04.png)

1. Enter _Banner Container_.

1. Click _Banner Container_ in the browser sidebar and open its settings (in the right sidebar menu). In the General section, set the minimum height of the banner to 80VH. This ensures the banner takes up much of the home page's space.

1. Configure the banner so its inner container is centered.  Set the Banner Container's Content Display to _Flex Column_ and Justify Content to _Center_.

1. Configure the inner container and its elements (heading, paragraph, and button) to have some padding around them. Click the innermost _Container_ in the sidebar to open its settings, then click _Styles_.

1. Change the padding to be 1 REM all around. In the Spacing settings, choose _Spacer 3_ for the padding on the right, left, top, and bottom of the element.

   The value for each spacer setting is defined by the [Style Book](https://learn.liferay.com/en/w/dxp/site-building/site-appearance/style-books).
   <!-- Is it the style book, the theme, the theme CSS CX? -->

1. Set an image as the banner's background. Each container element's configuration lets you configure the background. Click _Banner Container_ in the browser sidebar.

1. Open the _Styles_ menu in the right sidebar, and set the Background Image to `banner-image.png`.

1. Change the text on the page by double clicking the element to edit:

   - **Heading:** _Delectably Delightful_
   - **Paragraph:** Good things come in small packages. Great things come in tiny trees.
   - **Button:** Shop

1. Click the _Publish_ Button.

Now there's a home page for Delectable Bonsai. It's not fully implemented yet, but users can navigate to <http://localhost:8080> and it's clearly for Delectable Bonsai, not Liferay.

![There's a home page for Delectable Bonsai's public site.](./adding-the-home-page/images/05.png)

Before completing the home page design and moving on to design each additional page, Delectable Bonsai wants to create a custom header and footer for all its pages.

## Relevant Concepts

* [Adding Pages to a Site](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/adding-pages/adding-a-page-to-a-site)
* [Page Fragments and Widgets](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/page-fragments-and-widgets)
* [Configuring Fragments](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments)

 <!--

1. Open the Site Menu (![Product Menu](../../images/icon-product-menu.png)), then click the compass icon (![Compass](../../images/icon-compass.png)) to browse the sites you have access to.

   ![The site menu contains site-scoped applications and configurations.](./adding-the-home-page/images/02.png)

   The Site Menu is only visible to site administrators or other users granted the proper permissions. From here users can access applications and configurations scoped to the current site, which is labeled at the top of the menu.

1. Click _Grow Delectable Bonsai_.

1. Click _Site Builder_, then _Pages_. In a new blank site like Grow, there are no pages.

1. Click _New_ &rarr; _Page_.

1. Choose the _Blank_ template, and name the page _Home_.

   You created a content page by choosing the blank template. Content pages are the default in Liferay, as they offer the most page building features. You can add fragments and widgets to a content page.

-->
