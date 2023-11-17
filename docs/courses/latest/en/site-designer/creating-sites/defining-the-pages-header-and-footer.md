---
uuid: 2300c294-4b2c-480a-8a99-a230ace39c5f
---
# Defining the Pages' Header and Footer

With Liferay's master pages, Delectable Bonsai can define common elements for their pages' headers and footers. Delectable Bonsai has just one page currently, the Home page. Since no master page was defined, the blank master page was automatically associated to the page, meaning there's a default header and footer. The header has the Liferay logo and label, a page-based navigation menu, the search bar widget, and the Sign In/personal menu. 
<!-- This actually comes in with the classic theme, so revamp it to explain why there's a header and footer by default, when the blank mp doesn't define it. -->

LIFERAY/BLANK

Delectable Bonsai needs their own design, of course. At first the master page will define the header and footer for just the one page, but Delectable Bonsai will re-use it across the entire site, as more pages are added.

1. Import some logo images. <!-- TODO: resources folder?--> Open the Site Menu (![Product Menu](../../images/icon-product-menu.png)), then click Content & Data &rarr; Documents and Media.

1. Click *Add* (![Add](./../../images/icon-add.png)) &rarr; Multiple Files.

1. Choose `DB Green - 1w.svg` and `DB Green - 3.svg`, and click _Publish_.

   <!-- SCREENSHOT-->

1. Import 1 custom fragment and 2 fragment compositions. <!--these are introduced here so briefly explain-->  Open the Site Menu (![Product Menu](../../images/icon-product-menu.png)), then click Design &rarr; Fragments.

1. Open the Actions menu (![Actions](../../images/icon-actions.png)) and click _Import_.

1. Choose `user-nav-menu.zip`.

1. Now import `header-composition.zip` and `footer-composition.zip`.

   The resources and the fragments needed for the site's header and footer are now in place.

1. Add the Master Page. Open the Site Menu (![Product Menu](../../images/icon-product-menu.png)), then click Design &rarr; Page Templates.

1. Click *Add* (![Add](./../../images/icon-add.png)) and name the page _Del Bonsai MP_.

   The content page editor appears. Only one element is currently on the page, a drop zone. Your header and footer appear above and below the drop zone, respectively.

1. In the Fragments and Widgets (![Fragments and Widgets](./../../images/icon-add-widget.png)) menu on the sidebar, drag the header-composition above the drop zone, then drag the footer-composition below the drop zone.

1. Map the image fragment in the header to a logo. Open the browser (![Browser](../../../../images/icon-browser.png)) and expand the Header Container element, and continue expanding elements until you get to the middle grid module's image fragment.

   <!--SCREENSHOT-->

1. Click the image fragment to open its settings, then click _image-square_ to set the source of the image.

1. Choose direct source selection, then choose the image _DB Green - 1W_.

1. Using the same procedure, add the _DB Green - 3_ image to the footer's image fragment.

   <!--SCREENSHOT-->

1. Click _Publish Master_.

The master page is in place, so it's time to configure Liferay to use it on the existing Home page and in all widget pages (e.g., the existing Search page).

1. Open the master page's Actions menu (![Actions](../../images/icon-actions.png)) and click _Mark as Default_. Confirm that you want to use this master page as the default for all widget pages.

1. Go to the Home page and click Edit (![Edit](../../images/icon-edit.png)) in the administrative header.

1. In the content page editor, open the Page Design Options sidebar menu (![Page Design Options](../../../../images/icon-format.png)) and select _Del Bonsai MP_.

1. Click _Publish_.

Your master page is defining the header and footer of the home page.

<!-- SCREENSHOT-->

Even with a header and footer, the look and feel is not polished yet. The Welcome to Liferay image is very blue and doesn't match Delectable Bonsai's brand colors, and the links are all currently blue as well. Instead of spending time manually fixing this, we'll leave it for now since the theme CSS client extension you deploy later will remedy these visual faults, and that Welcome to Liferay content will be removed during our content creation exercises anyway.

FINAL

Requirements for the header:

Container, fixed width, content display: flex row, justify: between, align: center
Sticky top positioning (Apparently sticky-top containers are not that easy: https://liferay.atlassian.net/browse/PTR-3708)
Menu Display fragment with horizontal display style, pages hierarchy with no sublevels (default): width, 33.3% (though hurst just displays a hamburger icon and pops out a vertical navbar when clicked)
Logo in the middle, 33.3% width--can use an image but probably want a link to the home page
Shopping Cart logo on the right, 33.3% width
Search bar configured to search the products page?

Requirements for the footer:

Container, fixed width
Menu display Fragment with stacked display style

Once developed, set it as the default and choose to let it apply to the existing page.
Note, I had to do it manually in the Page Display Options

1. Site Menu &rarr; Design &rarr; Templates &rarr; Masters.

Add a header container and a footer container

Copied from master-page-templates.md:
Master Page Templates provide a way to define elements common to every page (e.g. │
Headers and Footers previously provided by Themes) using Fragments, so you can easily maintain and manage them in Portal without having to deploy a plugin. You can use the same Master Page Template across an entire Site or have a unique one for each page. Each Page and Page Template must have an associated Master Page Template. By default, this is the "Blank" Master, which doesn't provide any common elements.
