---
uuid: 241798cf-f23b-47c9-af0f-23d3f231a1f4
---
# Completing the Site Structure

Now that the home page is in place and the master page is able to define the header and footer, Delectable Bonsai needs some additional pages to fill out its site structure. Once completed these pages will be in the site:

- Home
- Search
- Shop
- Events
- FAQ
- About Us
- Careers

1. Open the Site Menu (![Product Menu](../../images/icon-product-menu.png)), then click _Site Builder_ &rarr; _Pages_.

   ![The Home and Search page are already in the default site.](./completing-the-site-structure/images/02.png)

   By default there are two pages: Home and Search.

   <!-- Let's delete the search page so we can show creating one with the search page template--but this is not what anyone would actually do in the default site if they want the default search page, so we can reconsider if it's too unrealistic-->

   1. Open the Actions menu next to the Search page, then click _Delete_. Confirm the deletion when the warning menu appears.

1. Now navigate to the home page and enter _test_ in the search bar.

   Nothing happens. You deleted the search page, and now the search bar can't function properly. Let's fix it.

1. Go back to the pages administration page. Click the Add button (![Add](./../../images/icon-add.png)), then click _Page_. Click the _Global Templates_ item in the menu and then _Search_.

   ![There's a global page template for search pages.](./completing-the-site-structure/images/02.png)

1. Enter the name _Search_ and click _Add_. You're taken to the General page settings.

1. Enable _Hidden from Menu Display_. This excludes the search page from the Menu Display widget's page hierarchy. It will still be present in other navigation menus.

1. Leave the Inherit Changes setting enabled, so that any changes made to the template will be reflected on the search page. 

1. The friendly URL can be changed, but we'll leave it as `/search`. The Search Bar widget should be configured to match this friendly URL, so that it can redirect the user to the search page after entering search terms.

   ![Configure the search page.](./completing-the-site-structure/images/03.png)

1. Click _Save_ at the bottom of the General settings.

   <!--Do a better job explaining the link between the search bar config and the friendly URL--have the user search and investigate the configuration to discover for themselves where these are linked. -->

   <!--Should we explore the search page or just leave that to the search course? We still have a lot of work to do in this exercise. -->

   <!-- My search page is not using my master page even though i made it default--investigate-->

1. Navigate to the home page again. The Search page does not appear in the header's navigation. Enter _test_ in the search bar again and click _Enter_. Now you're redirected to the search page. Whether you see [results](https://learn.liferay.com/en/w/dxp/using-search/search-pages-and-widgets/search-results/search-results) and [facets](https://learn.liferay.com/en/w/dxp/using-search/search-pages-and-widgets/search-facets) depends on what content is in your system and whether you have permission to view the content.

   ![The search results and facets are part of the search page template.](./completing-the-site-structure/images/06.png)

1. Now create the important Shop page, where site visitors can buy Delectable Bonsai's products. Go back to the pages administration page. Click the Add button (![Add](./../../images/icon-add.png)), then click _Page_. Click the _Blank_ page template and enter the name _Shop_.

1. In the content page editor, open the Page Design Options sidebar menu (![Page Design Options](../../../../images/icon-format.png)) and select _Del Bonsai MP_, then publish the page. The header and footer you defined for Delectable Bonsai are now in place.

   The content for this page is defined in the [Commerce Architect](../../commerce-architect.md) course. We'll move on to creating the other pages Delectable Bonsai needs.

1. Repeat the same page creation procedure to create these blank sites, configured to use the master page:

   - Events
   - FAQ
   - About Us

1. Create a [child page](https://learn.liferay.com/en/w/dxp/site-building/site-navigation/managing-page-hierarchies) of the About Us page, called Careers. Click the Add button (![Add](../../images/icon-plus.png)) next to About Us, and then follow the same page creation procedure. You can also drag existing top-level pages onto other pages to nest them.

   The site hierarchy looks like this, from the pages administration panel:

   ![There's one nested page in the current hierarchy.](./completing-the-site-structure/images/04.png)

   Now go to the Home page and observe that these pages are automatically added to the navigation menu provided by the site header's Menu Display widget:

   ![The navigation menu displays all the pages except Search.](./completing-the-site-structure/images/05.png)
   <!--I don't like showing Careers in the navigation menu, but we can hold off on changing it until we talk more about nav menus in the next exercise, maybe. -->

   Recall that you excluded the search page from appearing the page hierarchy menu of the Menu Display widget. That's why it doesn't appear in the navigation.

1. Log out. On any page, click the user icon and choose _Sign Out_ from the drop-down menu. Currently the custom fragment controlling the logout link uses the default Liferay logout URL: `c/portal/logout`.

   <!--Validate that last sentence with someone who knows how to explain it better -->

1. Test the Sign In page. On any page, click the user icon and _Sign In_ link. Currently the custom fragment controlling the sign-in link uses the default Liferay login URL: `c/portal/login`. This activates the default Sign In widget on any page where it's invoked. However, it's currently ugly with the Delectable Bonsai master page applied to it:

   ![The default sign in widget clashes with the master page.](./completing-the-site-structure/images/07.png)

1. Delectable Bonsai needs a better sign in experience, so we'll add a custom sign in page.

   <!-- Do we change the behavior of the login link or do we change the fragment to use the sign in page's friendly URL? -->

1. Add the Sign In page, but don't configure it to use the master page. Instead, once you've clicked Add and the content page editor is loaded, open the Options menu (![Options](../../images/icon-options.png)) in the administrative bar at the top of the page, and click _Configure_.

   ![Configure the page.](./completing-the-site-structure/images/08.png)

1. On the General page setting screen, once again enable _Hidden from Menu Display_ so the sign in page does not appear in the Menu Display widget's navigation menu. Note the friendly URL, `/sign-in`, and click _Save_.

1. Click the _Design_ link from the menu, and look at the Theme options. These are currently being set for all pages by the pages administration's configuration (similarly accessed via the Options menu (![Options](../../images/icon-options.png)). 

1. Override the inherited theme options by clicking Define a _Custom Theme for this Page_. Un-check these settings: _Show Footer_ and _Show Header_. You also do not want the search bar present you can also un-check _Show Header Search_, but hiding the header accomplishes that as well.

1. Save the configuration.

1. Back on the content page editor, add the imported fragment called Sign In.

1. In the Sign In fragment's Styles configuration, set the background image to use the sign_in image form Document and Media. 

1. Set the logo to use the DB Green - 1W image. 

1. Publish the page.

   ![The sign in page is in place.](./completing-the-site-structure/images/09.png)
<!-- Also configure it: need the background image to be imported so it can be set, need to specify the logo image. Problem, the background is actually gray right now, not white. Since the custom fragment uses the brand color, it will work better once the theme css cx is imported later--so let's leave it a bit ugly for now. -->

1. Now edit the custom user navigation fragment to point to the new login page instead of `c/portal/login`. Open the user-nav_Dropdown fragment and find the line where it set the login URL:

   ```html
   <a class="user-sign-in" href="/c/portal/login">
   ```

1. Change the `href` value to `"/sign-in"` and click Publish.

   <!-- Requires setting Propagate Fragment Changes Automatically in Instance Settings -> Page Fragments -->

1. From any page, log out, then click _Sign In_. You're redirected to the new page, where you can sign in.

   ![Sign in using the new page.](./completing-the-site-structure/images/10.png)

   <!-- We might want to define the redirect behavior so the user ends up wherever they were, instead of always at the home page. Actually investigate, because we are embedding the login portlet in our fragment, so we might just need some configuration. -->

Don't be concerned with the gray background for now. The custom fragment you imported defined the form-box like this:

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

Setting the background color to a brand color variable like this is convenient, because it can be influenced later when we style the site. For now, the `brand-color-2` variable resolves to a gray which doesn't look right, but we'd need to hard code the color to fix it, so let's leave it alone.
