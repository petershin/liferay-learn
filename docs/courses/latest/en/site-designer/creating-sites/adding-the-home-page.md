---
uuid: e33a05f2-6716-4fda-a14b-ad6f8221e534
---
# Adding the Home Page

Note: Grow is internal and shouldn't be indexed by Google. A user should have to navigate there directly, and there should be a barebones landing page with a sign-in widget. Choose some or all of these approaches: https://webmasters.stackexchange.com/questions/112615/how-to-restrict-web-site-intranet-access-to-company-network
Most is not really relevant to our course, and maybe not even to any liferay tech we need to discuss--so maybe just the login is what we want, but how do we set noindex on our pgaes? To disallow crawling, go to pages, kebab menu, configuration, and add a `/` in the Disallow property, which is blank by default--this disables crawling (for any search engine that listens to robots.txt), indexing can still happen via external links to the site, we'd control that through page headers i think (nothing in robots can help with that). on the robots.txt file, see https://developers.google.com/search/docs/crawling-indexing/robots/create-robots-txt

Show what happens when an unauthenticated user hits <http://grow.delectablebonsai.com:8080> and logs in (they're brought to their user dashboard page)

Grow Delectable Bonsai needs a home page. This activity can be completed by anyone with the proper permissions. Out-of-the-box, Liferay comes with a role named Site Administrator that provides the required permissions. Any user assigned to the role and a member of the site can act as an administrator in the site. The setup script and the steps completed in the [Liferay Administrator](../../liferay-administrator.md) lessons have your Liferay instance pre-populated with just such a user, NAME NAME. 

NOTE: must iron this site administrative user out.

While logged in as the site administrator, create the home page:

1. Open the Site Menu (![Product Menu](../../images/icon-product-menu.png)), then click the compass icon (![Compass](../../images/icon-compass.png)) to browse the sites you have access to.

   ![The site menu contains site-scoped applications and configurations.](./adding-the-home-page/images/02.png)

   The Site Menu is only visible to site administrators or other users granted the proper permissions. From here users can access applications and configurations scoped to the current site, which is labeled at the top of the menu.

1. Click _Grow Delectable Bonsai_.

1. Click _Site Builder_, then _Pages_. In a new blank site like Grow, there are no pages.

1. Click _New_ &rarr; _Page_.

1. Choose the _Blank_ template, and name the page _Home_.

   You've created a content page by choosing the blank template. There's another kind of page, called a widget page, where users can add widgets and adjust the layout of the page. Widget pages are more limited as they don't have access to the most recent page building features Liferay offers, such as the fragments toolbox.

   NOTE: What about the other page types? Mention them here or keep on chugging?

1. Click _Add_.

   The content page editor appears. This is where you add content, functionality, and structure to the page.

1. Click the plus icon (![Fragments and Widgets](../../images/icon-plus.png)) to open the Fragments and Widgets sidebar menu.

1. Drag the _Container_ fragment onto the page.

   Containers define configurable drag and drop zones for fragments and widgets. Adding all content page elements to a container makes styling the page more convenient.

1. Add a banner to the container. Search for _Banner_ in the Fragments and Widgets sidebar menu, and drag it into the container you already added.

ADD A GRID WITH THREE CARDS? MIGHT BE PRECONFIGURED AS FEATURES OR SOMETHING

3 REM for banner text padding

paddings for first one, margins for second
spacer option 4, rem 1.5 for featured content or highlights margin--


   The banner consists of two containers, a heading, a paragraph, and a button.

   In the Browser sidebar (![Browser](../../images/icon-hierarchy.png)), expand the elements to see the current page element hierarchy:

   ![These elements were added with the container fragment and the banner fragment.](./adding-the-home-page/images/03.png)

1. Configure the banner's elements: 

   * Set the inner container to use right aligned text--perhaps an image will be placed to the right of the text.
   * Set the outer container's opacity to 70%, so an image used as the page's background will still show faintly through the banner.
   * Click the outer container to access its settings. They appear in the right sidebar menu in the General tab when you click on the container. Change the Container Width to _Fixed Width_. This means the outer container won't adapt to the page width.
   * Adjust the spacing for the inner container or other elements… we’ll set the content and image later.

1. Click the _Publish_  Button.

Now there's a home page for Grow Delectable Bonsai. It's blank, but that's okay for now. Users can navigate to <http://grow.delectablebonsai.com:8080> and see the home page.

![There's a home page for Grow, but right now it's not doing much.](./adding-the-home-page/images/01.png)

