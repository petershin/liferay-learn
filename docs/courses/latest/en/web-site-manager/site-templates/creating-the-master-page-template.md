---
uuid: f5ee36b8-e621-4c11-a21f-4d2fc3c98510
---
# Creating the Master Page Template

*Master page templates* provide a way to define elements common to every page, so you can focus on that page's content, rather than its chrome. You can use the same master page template across an entire site or have unique templates for each page.

In this exercise, you'll create a master page template called *Main* which in turn is used to create the site template's pages. 

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)) and select *Design* &rarr; *Page Templates*.

1. Under the Masters tab, click *Add* (![Add icon](../../images/icon-add.png)). Name this page template `Main` and click *Save*.

   The page editor appears.

1. In the search bar under Fragments and Widgets, search for `Header` (1). The custom header composition you imported shows under Compositions (2). Drag and drop it on top of the Drop Zone (3).

   ![Build your page by dragging and dropping components to the page.](./creating-the-master-page-template/images/01.png)

1. Next, search for the `Footer`. The custom footer composition also shows under Compositions. Drag and drop it under the Drop Zone.

![Create and start editing the main page template.](./creating-the-master-page-template/images/02.gif)

With the header and the footer in place, you can edit them.

## Editing the Look and Feel of the Custom Header

The header composition is almost complete. Add the missing logo to the image fragment:

1. Click the *Image* fragment twice to select the image-square inside the Image fragment. On the right, select the *Image Source* tab.

   You can also select the image-square by using the Browser menu on the left (1).

   ![Add a logo to the header.](./creating-the-master-page-template/images/04.png)

1. Under Image, click the + icon, open the *Assets* folder and select the `glance-white-logo.svg` image.

Your custom header is ready.

![Edit the look and feel of the custom header.](./creating-the-master-page-template/images/05.gif)

## Editing the Look and Feel of the Custom Footer

Start by organizing the top grid. First, add the logo to the footer:

1. In the first grid module, double-click the *Image* fragment (this selects the image-square inside the Image fragment). On the right, select the *Image Source* tab.

1. Under Image, click the + icon, open the *Assets* folder, and select the `glance-white-logo.svg` image.

   You can also click the `image-square` component twice to open the modal where you select the image.

   ![Add a background image and the logo to the footer.](./creating-the-master-page-template/images/06.png)

Second, alter the headings for the menu displays:

1. In the second grid module, double-click the *Dialect Text* to edit it and change its text to `My Account`.

   ![Add the heading for the menu display.](./creating-the-master-page-template/images/07.gif)

1. Repeat the last step to add and alter the heading for the menu displays in the next two grids. Add `The Company` and `Help Center` headings to the other grids.

   You can also duplicate the Dialect text component (using the Browser or the options menu that shows once you click the component), reposition the duplicates in the next modules, and change their text.

   ![Instead of repeating the same steps, you can duplicate the component and place it wherever you want.](./creating-the-master-page-template/images/08.gif)

   The menu displays are going to be set later.

Third, create a section where the user can subscribe to the company's mailing list: 

1. In the last grid module, change the Dialect Text to `Stay in Touch`.

1. Change the Dialect text under it to `Receive updates, promotions, and more.`

1. Change the Dialect button's text to `Subscribe`.

Now, it's time to organize the bottom grid:

1. Change the Dialect button's texts to `Privacy Policy`, `Terms of Use`, and `Site Map`.

   ![Add links to the footer's bottom grid.](./creating-the-master-page-template/images/09.gif)

1. In the second module, change the Dialect text to `© 2024 Clarity, Inc. All Rights Reserved`

   ![Add the All Rights reserved message.](./creating-the-master-page-template/images/10.gif)

Your custom footer is ready.

When you're finished editing the header and the footer, click *Publish Master*.

Next: [create a page based on the Main template and populate it.](./creating-the-about-us-page.md)

## Relevant Concepts

- [Master Page Templates](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/defining-headers-and-footers/master-page-templates)
- [Using Fragments](https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-fragments)
