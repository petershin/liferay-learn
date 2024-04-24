---
uuid: 0ab3cf82-fa34-49e1-b885-ae22951e7747
---
# Creating Navigation Menus for Clarity’s Master Pages

Navigation is an integral part of designing a clear and intuitive user experience. In Liferay, setting up navigation involves creating menus and then adding them to pages using widgets or fragments. Each menu can include links to both internal and external pages or content. Since pages and navigation are decoupled, you can organize your pages and content without worrying about how it will affect navigation. You can also customize the look and feel of your menus and even tailor navigation based on user roles, preferences, or location, to deliver personalized experiences. In these ways, Liferay’s flexible navigation menus can help ensure users easily find what they need.

![Clarity’s header and footer designs include multiple navigation menus.](./creating-navigation-menus-for-claritys-master-pages/images/01.png)

As seen in the previous exercises, Clarity’s header and footer designs include multiple navigation menus. When wireframing the master pages, you used the default menu, which includes all site content pages. Now it is time to create custom menus that only include the desired pages. Then you can update the master pages to use them instead of the default menu.

## Exercise One: Creating the Header Navigation Menu

Clarity wants to focus visitor attention on their values and products. They also want to make sure users can find promotional content, FAQs, and career opportunities. To do this, they want to update their header navigation to only include these pages: Products, About Us, Blog, FAQ, Careers, and Contact Us.

While logged in as Walter Douglas,

1. Open the *Site Menu*, expand *Site Builder*, and click *Navigation Menus*.

1. Click *New*.

1. For name, enter `Header Page Menu`.

   ![Create the Header Page Menu.](./creating-navigation-menus-for-claritys-master-pages/images/02.png)

1. Click *Save*.

This creates a blank menu and directs you to its edit page. Now you can add pages to it.

## Exercise Two:  Adding Pages to the Menu

While editing the menu,

1. Click *Add*. This displays a list of available types of items you can add to the menu.

1. Select the *Page* item type.

   ![Select the Page item type.](./creating-navigation-menus-for-claritys-master-pages/images/03.png)

1. Check these pages:

   * About Us
   * Blog
   * Careers
   * Contact Us
   * FAQ
   * Products

   ![Add these pages to the menu.](./creating-navigation-menus-for-claritys-master-pages/images/04.png)

1. Click *Select*. This saves your changes to the menu.

1. Click the *Actions* button (![Action Button](../../images/icon-actions.png)) for one of the menu items and select *View Info*. This opens a side panel where you can update its display name if desired.

   ![You can change a menu item's display name.](./creating-navigation-menus-for-claritys-master-pages/images/05.png)

1. Drag and drop the pages into this order:

   * About Us
   * Products
   * Blog
   * FAQ
   * Careers
   * Contact Us

   ![Drag and drop the pages to reorder them.](./creating-navigation-menus-for-claritys-master-pages/images/06.gif)

These changes are saved automatically, so the menu is ready for use in the master pages.

## Exercise Three: Creating the Footer Navigation Menus

Repeat the steps from exercises one and two to create these four menus for the page footer.

### Footer Products Menu

<!--TASK: REVISIT! WE MUST ADD GLOBAL CATEGORIES BEFORE WE MAKE THIS MENU! -->

**Name**: Footer Products Menu

**Pages**: Eyeglasses, Sunglasses, Contacts, Lenses

![Create the footer Products menu.](./creating-navigation-menus-for-claritys-master-pages/images/07.png)

### Footer About Us Menu

**Name**: Footer About Us Menu

**Pages**: Leadership, Our Impact, Careers

![Create the footer About Us menu.](./creating-navigation-menus-for-claritys-master-pages/images/08.png)

!!! note
    The Leadership and Our Impact links should direct users to the About Us page. Just add the page twice and use custom names for each menu item.

### Footer Resources Menu

**Name**: Footer Resources Menu

**Pages**: Blog, FAQ

![Create the footer Resources menu.](./creating-navigation-menus-for-claritys-master-pages/images/09.png)

### Footer Get In Touch Menu

**Name**: Footer Get In Touch Menu

**Pages**: Contact Us

![Create the footer Get in Touch menu.](./creating-navigation-menus-for-claritys-master-pages/images/10.png)

Now that the menus are defined, you can update the existing menu displays in the master pages to use them.

## Exercise Four: Updating the Master Pages

When you add a menu display fragment or widget to a page, you can determine which menu to display. To do this,

1. Begin editing the primary master page.

1. Select the menu display fragment in the header.

1. In the configuration side panel, set the source to Header Page Menu.

   <!--TASK: ![Set the source to Header Page Menu.]() -->

1. Repeat the above process for the menu displays in the footer.

1. Click *Publish Master*.

1. Repeat the above process to update the secondary master page’s menu.

Once finished, navigate to the Home page to see how your changes to the template were automatically applied to the connected pages.

<!--TASK: ![Navigate to the Home page to see how your changes to the template were automatically applied to the connected pages.]()-->

## Conclusion

Congratulations! You’ve finished setting up the navigation menus for Clarity’s master pages. Next you'll create custom fragments to finish Clarity's page headers.

Next Up: [Creating Custom Fragments for Clarity](./creating-custom-fragments-for-clarity.md)
