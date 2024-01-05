---
uuid: 8a5b9052-7825-496a-a772-8d854eec7a61
---
# Adding the Sign In Page

Users can currently log into Clarity by clicking _Sign In_ in the user menu in the header. 

1. Log out. On any page, click the user icon and choose _Sign Out_ from the drop-down menu. Currently the custom fragment controlling the logout link uses the default Liferay logout URL: `/c/portal/logout`.

1. Test the Sign In page. On any page, click the user icon and _Sign In_ link. Currently the custom fragment controlling the sign-in link uses the default Liferay login URL: `/c/portal/login`. This activates the default Sign In widget on any page where it's invoked. However, it's currently ugly with the Clarity master page applied to it:

   ![The default sign in widget clashes with the master page.](./adding-the-sign-in-page/images/07.png)

Clarity needs a better sign in experience. Next you'll add a custom sign in page.

1. Add the Sign In page using the Blank template. Click _Add_, and the content page editor is loaded. 

1. Open the *Options* menu (![Options](../../images/icon-options.png)) in the administrative bar at the top of the page and click _Configure_.

   ![Configure the sign-in page.](./adding-the-sign-in-page/images/08.png)

1. On the General page setting screen, once again enable _Hidden from Menu Display_ to prevent the sign in page from appearing in the Menu Display widget's navigation menu. Note the friendly URL, `/sign-in`, and click _Save_.

1. Click the _Design_ link from the menu and look at the Theme options. These are currently being set for all pages by the configuration in page administration (similarly accessed via the Options menu (![Options](../../images/icon-options.png)). 

1. Override the inherited theme options by clicking _Define a Custom Theme for this Page_. Uncheck these settings: _Show Footer_ and _Show Header_. You do not want the search bar present, so you can also uncheck _Show Header Search_, but hiding the header entirely accomplishes that as well.

1. Scroll down and save the configuration.

1. Use the back arrow at the top of the page to go back to the content page editor; then add the imported fragment called Sign In.

1. Publish the page.

   ![The sign in page is in place.](./adding-the-sign-in-page/images/09.png)

1. Now edit the custom user navigation fragment to point to the new sign-in page instead of `/c/portal/login`. Go to *Site Menu* (![Product Menu](../../images/icon-product-menu.png)) &rarr; *Design* &rarr; *Fragments*.

1. Open the `user-nav_Dropdown` fragment. In the HTML pane, find the line setting the login URL:

   ```html
   <a class="user-sign-in" href="/c/portal/login">
   ```

1. Replace the line so it points at the Sign In page's friendly URL, `sign-in`:

   ```html
   <a class="user-sign-in" href="${publicFriendlyURL}/sign-in">
   ```

   That `publicFriendlyURL` variable is set in the first line of the HTML using FreeMarker syntax:

   ```html
   [#assign publicFriendlyURL = themeDisplay.getPathFriendlyURLPublic() +
      themeDisplay.getSiteGroup().getFriendlyURL() /]
   ```

1. Click _Publish_.

1. Propagate the new fragment code to fragments that are in use on a page or master page. Open the fragment's *Actions* (![Actions](../../images/icon-actions.png)) menu and click *View Usages*.

1. Select all the listed usages, then click *Propagate* (![Propagate](../../images/icon-propagate.png)). See [Propagating Fragment Changes](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments/propagating-fragment-changes) to learn more.

1. From any page, log out, then click _Sign In_. You're sent to the new page, where you can sign in.

   ![Sign in using the new page.](./adding-the-sign-in-page/images/10.png)

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

Setting the background color to a brand color variable like this is a good practice, because it can be influenced later when styling the site. For now, the `brand-color-2` variable resolves to a gray that doesn't look right. Hard coding the color to fix it isn't a good solution, so leave it gray for now.

Now Clarity's site structure is in place. The navigation menu, however, could use some enhancements. 

![The navigation menu is okay, but it could use some enhancements.](./adding-the-sign-in-page/images/05.png)

Next: create a [new navigation menu](./creating-navigation-menus.md).

## Relevant Concepts

* [Adding Pages to a Site](https://learn.liferay.com/en/w/dxp/site-building/creating-pages/adding-pages/adding-a-page-to-a-site)
* [Working with Search Pages](https://learn.liferay.com/en/w/dxp/using-search/search-pages-and-widgets/working-with-search-pages/search-pages)
* [Searching for Content](https://learn.liferay.com/en/w/dxp/using-search/getting-started/searching-for-content)
