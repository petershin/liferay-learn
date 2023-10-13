---
uuid: 2300c294-4b2c-480a-8a99-a230ace39c5f
---
# Defining the Pages' Header and Footer

With [master pages](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/defining-headers-and-footers/master-page-templates), Clarity can define common elements for their pages' headers and footers. Clarity has just one page currently, the home page. Since this was created before any master page was available, the blank master page was associated to the page automatically. The header has the Liferay logo and label, a page-based navigation menu, the search bar widget, and the Sign In/personal menu. You can't change the header and footer on the blank master page because it's defined in the default Classic theme, so you'll have to define a new master page for Clarity. 
<!-- I wonder if this short-changes master pages by focusing on the shared header and footer--master pages are also used for setting a theme/style book or theme css and defining the drop zone, including limiting what widgets and fragments are allowed to be added to the page-->

<!-- I don't know; I almost deleted the explanatory sentence talking about the Classic theme, because I thought it would be confusing to new users. It might still be, but rather than delete it, I tried rewording it to make it more clear. Let me know what you think. We may not want to mention themes at all, since we're supposed to be showing the "new" way of doing everything. -Rich -->

![The default header and footer are useful, but replaceable.](./defining-the-pages-header-and-footer/images/01.png)

Clarity needs their own header and footer design, of course. At first the master page will define the header and footer for the one page and the utility pages, but Clarity will re-use it across the entire site, as more pages are added.

1. Add the Master Page. Open the *Site Menu* (![Product Menu](../../images/icon-product-menu.png)), then click *Design* &rarr; *Page Templates*.

1. Click *Add* (![Add](./../../images/icon-add.png)) and name the page _Del Bonsai MP_. <!-- Change this name to something Clarity-based. -Rich -->

   The content page editor appears. Only one element is currently on the page, a drop zone. Clarity's header and footer should appear above and below the drop zone, respectively.

1. In the Fragments and Widgets (![Fragments and Widgets](./../../images/icon-add-widget.png)) menu on the sidebar, drag _header-composition_ above the drop zone, then drag _footer-composition_ below the drop zone.

1. Map the image fragment in the header to a logo. Open the browser (![Browser](../../images/icon-hierarchy.png)), expand the Header Container element, and continue expanding elements until you get to the middle grid module's image fragment.

   ![Click the image fragment's inner element to set the source of the image.](./defining-the-pages-header-and-footer/images/04.png)

1. Click the image fragment to open its settings, then click _image-square_ to set the source of the image.

1. Choose direct source selection, then choose the image _DB Green - 1W_. <!-- Looks like all of these need to be changed to Clarity, so I'll stop mentioning it and assume you know. -Rich -->

   ![Set the image to use in the header.](./defining-the-pages-header-and-footer/images/05.png)

1. Using the same procedure, add the _DB Green - 3_ image to the footer's image fragment.

   ![Set the image to use in the footer.](./defining-the-pages-header-and-footer/images/06.png)

1. Click _Publish Master_.

   The user menu is a custom fragment: `user-nav-fragment.zip`. It uses HTML and CSS to create a menu for logged in users. For logged out users, they see a user icon and the words SIGN IN, which they can click on to access the sign in page.

   ![Logged in users see a menu with links to important pages.](./defining-the-pages-header-and-footer/images/03.png)

The master page is in place, so it's time to configure Liferay to use it on the existing Home page and in all widget pages (e.g., the existing Search page).

1. Open the master page's *Actions* menu (![Actions](../../images/icon-actions.png)) and click _Mark as Default_. Confirm that you want to use this master page as the default for all widget pages.

1. Go to the Home page and click *Edit* (![Edit](../../images/icon-edit.png)) in the administrative header.

1. In the content page editor, open the *Page Design Options* sidebar menu (![Page Design Options](../../images/icon-format.png)) and select _Del Bonsai MP_.

1. Click _Publish_.

1. Use a similar procedure to configure the default utility pages (404 and 500 error pages) to use the master page. In the Site Menu (![Product Menu](../../images/icon-product-menu.png)), click _Site Builder_ &rarr; _Pages_ &rarr; _Utility Pages_. 

Your master page is defining the header and footer.

![The header and footer is in place.](./defining-the-pages-header-and-footer/images/07.png)

Even with a header and footer, the look and feel is not yet well polished. Links are all currently blue and do not match with Clarity's brand colors, for example. Instead of spending time manually fixing this, leave it for now. The theme CSS client extension you deploy later will remedy these visual faults. 

Now that the master page is defined, Clarity can [fill out the site with additional pages](./completing-the-site-structure.md).
