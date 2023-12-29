---
uuid: 1acf98a4-c309-439b-89ff-8048fa997a2d
---
# Creating the About Us Page

Now that you have a master page, use it to create the pages and populate the site template.

In this lesson, you'll use *compositions*, pre-built structures that speed up the process of page building, to create the About Us, Contact Us, and Careers pages. With compositions, you'll add the elements to the right places in an existing structure to build your page.

Start by creating a page using the master page template from the last lesson.

## Creating a Page Using a Master Page Template

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)) and select *Site Builder* &rarr; *Pages*.

1. Click *New Page* &rarr; *Page* and select the Main template.

   ![Click New Page to add a new page based on the master page template.](./creating-the-about-us-page/images/01.png)

1. Name the page `About Us` and click *Add*.

   You are redirected to the page editor.

All the created pages have the same structure set in the Master page: a header, the content in the middle, and a footer. Now, you'll populate the About Us page.

## Populating the About Us Page

<!-- 1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)) and navigate to *Site Builder* &rarr; *Pages*.

1. Click on the name of the page to start editing it.

Start editing the About Us page. -->

<!-- I'll show the step-by-step process this time and speed it up with the other pages. I'll probably use a table and an image with numbers to indicate where to put what -->

<!-- 1. In the Pages application, click on the About Us page to start editing it. -->

1. (Applying a Composition) While editing the page, look at the Fragments and Widgets tab on the left of the page editor and search for "About Us Composition".

1. Drag and drop the "About Us Composition" into the editing area".

   A whole structure is set and you can edit its elements. If you applied the Dialect theme and imported the style book correctly, the composition should look like this:

   ![The About Us composition is set and now you can edit its elements to create your About Us page.](./creating-the-about-us-page/images/02.png)

Now, add some information and images to the composition. Start by editing the first row.

1. Select the first paragraph element and double-click its content to edit it. Erase its placeholder text and enter this text instead:

   ```
   Welcome to Clarity, your premier destination for eyewear solutions. We began as a modest garage operation led by the entrepreneurial spirit of our founders, Mr. and Mrs. Anderson, and we have grown into a globally renowned brand that stands as a testment to innovation, quality, and unwavering commitment to eyewear excellence.
   Discover the clarity of vision you deserve with Clarity.
   ```

1. Select `Discover the clarity of vision you deserve with Clarity.`. In the toolbar that pops up, click *Bold*.

1. Select the first image element and double-click its content to open the Documents and Media modal. Open the *About Us Images* folder and select image `01`.

![Edit the first row. Add text and image to the composition.](./creating-the-about-us-page/images/03.gif)

Now, edit the second row.

1. Repeat the last step and choose image `02`.

1. Enter this text in the paragraph in the middle:

   ```
   In the early days, the Andersons scouted thrift stores and garage sales, carefully collecting discarded eyeglass frames and lenses. These seemingly forgotten parts were meticulously refurbished and transformed into unique, eco-friendly eyewear creations.
   ```

1. Select image `03` for the image on the right.

<!-- 1. apply some color to the background. First, select the outer container and open the Styles tab. Then, under Background, enter `#1D8C8C` as the background color.

1. Change the color of the text to white. Select the paragraph, open the *Styles* tab, and, under Text, enter `#FFFFFF` as the text color. -->

Edit the third row.

1. Select image `04` for the image on the left and add this text to the paragraph on the right:

   ```
   Today, Clarity has over 100 stores and offices worldwide, each exemplifying our commitment to excellence in eyewear. From our flagship stores in major fashion capitals to our regional offices dedicated to serving our B2B partners, our presence is a testament to the enduring values of innovation and quality that have shaped our brand.
   ```

Edit the third row.

1. Add this text to the paragraph:

   ```
   We blend style with sustainability. We craft eco-friendly, innovative eyewear solutions. Our network of worldwide stores ensures quality and personalized service. Experience Clarity for exceptional vision and environmental responsibility.
   ```

<!-- 1. Apply the `#1D8C8C` color to the container's background. And change the paragraph's text color to `#FFFFFF`. -->

![The first rows are complete.](./creating-the-about-us-page/images/04.png)

Edit the cards. They are going to hold information about the main Clarity offices. They have an image (a picture of the office), a title (the name of the office), a paragraph (information about the office), and a link (to redirect the user to the office's page).

1. Use the information and the instructions in the table below to fill in the cards:

   | Office | Component | Content |
   | :--- | :--- | :--- |
   | New York | Image | `nyoffice` |
   | New York | Title | New York Office |
   | New York | Paragraph | 10019, NY. USA <br> Tel: +1-212-555-0139 <br> nyoffice@clarity.com |
   | Recife | Image | `recifeoffice` |
   | Recife | Title | Recife Office |
   | Recife | Paragraph | Rua da Aurora, Recife. Brazil <br> Tel: +55 81 2020-5000 <br> recifeoffice@clarity.com |
   | Tokyo | Image | `tokyooffice` |
   | Tokyo | Title | Tokyo Office |
   | Tokyo | Paragraph | Bunkyo, Tokyo 112-0001 <br> Tel: +81 75 429-7496 <br> tokyooffice@clarity.com |

1. Add the image by double-clicking the image component and selecting the image as indicated in the table.

1. Change the title/paragraph by double-clicking the text component and replacing its content with the text in the table.

1. Change the text of the link by double-clicking the link component. Change its content to `Visit the Office's Page`.

   <!-- You are not going to create an individual page for each office in this exercise, but if you create one, you can link it here. -->

Once the elements are in place, click *Publish* at the top right corner of the page. This is how the About Us Page should look once you are finished:

![With the cards filled, the About Us page is complete.](./creating-the-about-us-page/images/05.png)

Now that the About Us Page is complete, let's [create the Contact Us page.](./creating-the-contact-us-page.md)