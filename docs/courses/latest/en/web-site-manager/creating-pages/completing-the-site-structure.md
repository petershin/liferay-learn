---
uuid: 241798cf-f23b-47c9-af0f-23d3f231a1f4
---
# Completing the Site Structure

<!-- This exercise is too long; we should break it up into two. -Rich --> 

Now that the home page is in place and the master page is able to define the header and footer, Clarity needs some additional pages to fill out its site structure: 

- Home
- Search
- Shop
- Events
- FAQ
- About Us
- Careers

1. While logged in as the site administrator, Preston Palmer, open the Site menu (![Product Menu](../../images/icon-product-menu.png)), then click _Site Builder_ &rarr; _Pages_.

   ![The Home and Search page are already in the default site.](./completing-the-site-structure/images/01.png)

   By default there are two pages: Home and Search.

1. Open the *Actions* menu next to the Search page, then click _Delete_. Confirm the deletion when the warning menu appears.

1. Test search after deleting the page. Navigate to the home page and enter _test_ in the search bar.

   Nothing happens. You deleted the search page, and now the search bar can't function properly.

1. Go back to the pages administration page. Click *Add* (![Add](./../../images/icon-add.png)), then click _Page_. Click the _Global Templates_ item in the menu and then _Search_.

   ![There's a global page template for search pages.](./completing-the-site-structure/images/02.png)

1. Enter the name _Search_ and click _Add_. You're taken to the General page settings.

1. Enable _Hidden from Menu Display_. This excludes the search page from the Menu Display widget's page hierarchy. It is still present in other navigation menus.

   Leave the *Inherit Changes* setting enabled, so that any changes made to the template are reflected on the search page. 

   The friendly URL can be changed, but leave it as `/search`. The Search Bar widget is configured to use this friendly URL as its destination page, directing the user to the search page after a search is executed.

   ![Configure the search page.](./completing-the-site-structure/images/03.png)

1. Click _Save_ at the bottom of the settings.

1. Navigate to the home page again. Enter _test_ in the search bar again and click _Enter_. The search page appears. Whether you see [results](https://learn.liferay.com/en/w/dxp/using-search/search-pages-and-widgets/search-results/search-results) and [facets](https://learn.liferay.com/en/w/dxp/using-search/search-pages-and-widgets/search-facets) depends on what content is in your system and whether you have permission to view the content.

   <!-- In my most recent test I had to set the destination page, it was blank--what gives? -->

   ![The search results and facets are part of the search page template.](./completing-the-site-structure/images/06.png)

   Consider why this search worked. You added a search bar widget to the master page's header and a search page in the site. How did the search bar know to send you to the search page? It's all in the configuration. The friendly URL of a page named Search defaults to `/search`, and the search bar configuration has a setting called Destination Page, and it also defaults to `/search`. The search page's friendly URL must match its search bar's Destination Page setting.

1. Now create the important e-commerce storefront page, where site visitors can buy Clarity's products. Go back to the pages administration page. Click *Add* (![Add](./../../images/icon-add.png)), then click _Page_. Select the _Del Bonsai_ page template and enter the name _Shop_.

1. In the content page editor, click _Publish_. The header and footer you defined for Clarity are now in place.

   The content for this page is defined in the [Commerce Architect](../../commerce-architect.md) course.

1. Repeat the same procedure to create these content pages, configured to use the master page:

   - Events
   - FAQ
   - About Us

1. Create a [child page](https://learn.liferay.com/en/w/dxp/site-building/site-navigation/managing-page-hierarchies) of the About Us page, called Careers. Click *Add* (![Add](../../images/icon-plus.png)) next to About Us, and then follow the same page creation procedure. You can also drag existing top-level pages onto other pages to nest them.

   The site hierarchy looks like this, from the pages administration panel:

   ![There's one nested page in the current hierarchy.](./completing-the-site-structure/images/04.png)

   Now go to the Home page and observe that these pages are added automatically to the navigation menu provided by the site header's Menu Display widget:

   ![The navigation menu displays all the pages except Search.](./completing-the-site-structure/images/05.png)

   Recall that you excluded the search page from appearing in the page hierarchy menu of the Menu Display widget. That's why it doesn't appear in the navigation.

<!-- Maybe break it here. -Rich --> 

1. Log out. On any page, click the user icon and choose _Sign Out_ from the drop-down menu. Currently the custom fragment controlling the logout link uses the default Liferay logout URL: `c/portal/logout`.

1. Test the Sign In page. On any page, click the user icon and _Sign In_ link. Currently the custom fragment controlling the sign-in link uses the default Liferay login URL: `c/portal/login`. This activates the default Sign In widget on any page where it's invoked. However, it's currently ugly with the Clarity master page applied to it:

   ![The default sign in widget clashes with the master page.](./completing-the-site-structure/images/07.png)

1. Clarity needs a better sign in experience. Next you'll add a custom sign in page.

1. Add the Sign In page using the Blank template. Click _Add_ and the content page editor is loaded. 

1. Open the *Options* menu (![Options](../../images/icon-options.png)) in the administrative bar at the top of the page and click _Configure_.

   ![Configure the sign-in page.](./completing-the-site-structure/images/08.png)

1. On the General page setting screen, once again enable _Hidden from Menu Display_ so the sign in page does not appear in the Menu Display widget's navigation menu. Note the friendly URL, `/sign-in`, and click _Save_.

1. Click the _Design_ link from the menu and look at the Theme options. These are currently being set for all pages by the pages administration's configuration (similarly accessed via the Options menu (![Options](../../images/icon-options.png)). 

1. Override the inherited theme options by clicking _Define a Custom Theme for this Page_. Un-check these settings: _Show Footer_ and _Show Header_. You do not want the search bar present so you can also un-check _Show Header Search_, but hiding the header entirely accomplishes that as well.

1. Scroll down and save the configuration.

1. Use the back arrow at the top of the page to go back to the content page editor, then add the imported fragment called Sign In.

1. In the Sign In fragment's Styles configuration, set the background image to use the `sign_in` image from Documents and Media. 

1. Set the logo to use the `DB Green - 1W` image. 

1. Publish the page.

   ![The sign in page is in place.](./completing-the-site-structure/images/09.png)

1. Now edit the custom user navigation fragment to point to the new login page instead of `c/portal/login`. Go to *Site* menu (![Product Menu](../../images/icon-product-menu.png)) &rarr; *Design* &rarr; *Fragments*. 

1. Open the `user-nav_Dropdown` fragment and find the line setting the login URL:

   ```html
   <a class="user-sign-in" href="/c/portal/login">
   ```

1. Replace the line so it points at the Sign In page's priendly URL, `sign-in`:

   ```html
   <a class="user-sign-in" href="${publicFriendlyURL}/sign-in">
   ```

1. Click _Publish_.

   <!-- The change needs to be propagated to the fragment in use. Requires setting Propagate Fragment Changes Automatically in Instance Settings -> Page Fragments. Alternatively, do the manual propagation method and maybe also mention that there's a setting that can be used in testing/dev scenarios. -->

1. From any page, log out, then click _Sign In_. You're redirected to the new page, where you can sign in.

   ![Sign in using the new page.](./completing-the-site-structure/images/10.png)

Don't be concerned with the gray background for now. The custom sign-in fragment's CSS styles the `form-box` class like this:

```css
.form-box {
    align-items: flex-start;
    background-color: var(--brand-color-2);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    padding: var(--spacer-6) var(--spacer-7) var(--spacer-4);
    width: 35%;
}
```

Setting the background color to a brand color variable like this is a good practice, because it can be influenced later when styling the site. For now, the `brand-color-2` variable resolves to a gray that doesn't look right, but hard coding the color to fix it isn't a good solution, so leave it gray for now.

Now Clarity's basic pages are in place. However, the navigation menu is pretty basic, and could use some enhancements. 

<!-- We could just configure the Careers page to be excluded from the Menu Display navigation, like we did with search and sign-in-->

   ![The navigation menu is okay, but it could use some enhancements.](./completing-the-site-structure/images/05.png)

Next, the design team at Clarity would like a new Home page design to replace the basic banner with some better looking and more robust content. Clarity next needs a [new navigation menu](./creating-navigation-menus.md) so that it behaves exactly as desired.
