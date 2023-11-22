---
uuid: f5ee36b8-e621-4c11-a21f-4d2fc3c98510
---
# Creating the Master Page Template

Master page templates provide a way to define elements common to every page using fragments, so you can maintain and manage them easily in the portal without having to deploy a plugin.

You can use the same master page template across an entire site or have unique templates for each page.

In this exercise, you are creating a master page template and using it to create the pages for the site template.

## Creating and Editing the Master Page Template

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)) and select *Design* &rarr; *Page Templates*.

1. Under the Masters tab, click *Add* (![Add icon](../../images/icon-add.png)). Let's name this page template `Main Page` &rarr; click *Save*.

   You are redirected to the page editor.

1. In the search bar under Fragments and Widgets, search for `Header` (1). The custom header composition you imported shows under Compositions (2). Drag and drop it on top of the Drop Zone (3).

   ![Drag and drop the custom composition to the editing area.](./creating-the-master-page-template/images/01.png)

1. Next, search for the `Footer`. The custom footer composition also shows under Compositions. Drag and drop it under the Drop Zone.

![Creating and building the main page template.](./creating-the-master-page-template/images/02.gif)

With the the header and the footer in place, let's edit the way they look.

### Editing the Look and Feel of the Custom Header

First, add a background to the header:

1. Select the outer *Container* (1) in the header composition. On the right, select the *Style* tab (2).

   You can also select the outer *Container* by using the Browser menu on the left.

<!-- 1. Under Background, Select *Direct* under Image Source (3). -->
<!-- I am not sure if this step needs to be mentioned. The Direct option is the default once we select the tabs. But I thought, maybe, someone could alter this option by accident. Then, they would not be able to add the image manually (the + icon would not be enabled). - Eric -->

1. Under Background Image, click the `+` icon (3), open the *Assets* folder, and select the `header-background.svg` image.

   ![Select a background image for the outer container](./creating-the-master-page-template/images/03.png)

Then, add the logo to the Image fragment:

1. Click the *Image* fragment twice (this selects the image-square inside the Image fragment). On the right, select the *Image Source* tab.

   You can also select the *image-square* by using the Browser menu on the left (1).

   ![Select the image-square through the Browser menu on the left.](./creating-the-master-page-template/images/04.png)

<!-- 1. Under Source Selection (2), Select *Direct* under Image Source. -->

1. Under Image, click the + icon, open the *Assets* folder and select the `glance-white-logo.svg` image.

Your custom header is ready.

![Editing the look and feel of the custom header](./creating-the-master-page-template/images/05.gif)

### Editing the Look and Feel of the Custom Footer

First, add a background to the footer:

1. Select the outer *Container* (1) in the footer composition. On the right, select the *Style* tab (2).

   You can also select the outer *Container* by using the Browser menu on the left.

<!-- 1. Under Background, Select *Direct* under Image Source (3). -->

1. Under Background Image, click the + icon, open the *Assets* folder, and select the `footer-background.svg` image.

Second, add the logo to the footer:

1. In the first grid module, click the *Image* fragment twice (this selects the image-square inside the Image fragment). On the right, select the *Image Source* tab.

<!-- 1. Under Source Selection, Select *Direct* under Image Source. -->

1. Under Image, click the `+` icon, open the *Assets* folder and select the `glance-white-logo.svg` image.

   You can also click three times on the Image fragment to open the modal where you select the image.

Third, alter the texts:

1. In the second grid module, select the *Dialect Text* fragment. Double click to edit the text &rarr; change the text to `The Company`.

   Under this fragment, you are adding (later in this module) the primary menu navigation with the pages created for the site template.

1. In the third grid module, select the *Dialect Text* fragment &rarr; Change the text to `Talk to us`.

1. Alter the paragraph's content to:

   ```
   New York HQ
   10019, NY. USA
   Tel: +1-212-555-0139
   nyoffice@clarity.com

   Recife HQ
   Rua da Aurora, Recife. Brazil
   Tel: +55 81 2020-5000
   recifeoffice@clarity.com

   Tokyo HQ
   Bunkyo, Tokyo 112-0001
   Tel: +81 75 429-7496
   tokyooffice@clarity.com
   ```

1. By the end of the page, select the *Paragraph* and change its content to `© 2023 Clarity, Inc. All Rights Reserved`.

Your custom footer is ready.

![Editing the look and feel of the custom footer](./creating-the-master-page-template/images/06.gif)

Once you are done editing the header and the footer, click *Publish Master*.

Coming up next, let's [create pages to populate our site template](./creating-pages-to-populate-the-site-template.md).