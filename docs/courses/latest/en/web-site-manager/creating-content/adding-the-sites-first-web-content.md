---
uuid: 9c1e9fef-de32-4b3e-ba5d-9732218e2616
---
# Adding the Site's First Web Content

Now that you have structures and templates for two new types of content, you're ready to add some articles. Here, add content to the site for both of these types (Event and FAQs).

The site administrator doesn't add individual content articles. Log out and log back in as your site's content manager, Olivia O'Neal, before you begin.

## Add an Event Article

First, add an event article to announce the Clarity site going live soon.

1. Navigate to the Site Menu (![Site Menu](../../images/icon-product-menu.png)) &rarr; *Content & Data* &rarr; *Web Content*.

1. Click *Add* (![Add icon](../../images/icon-add.png)) &rarr; *Event*.

   ![Click Event to add an article with the structure you added previously.](./adding-the-sites-first-web-content/images/01.png)

1. At the top of the page, title the article `Clarity Site Going Live Soon`.

1. In the *Summary* field, enter this text:

   ```
   The Clarity Vision Solutions site is under construction, but it will be going live soon!
   ```

1. In the *Body* field, enter this text:

   ```
   The Clarity site is almost ready to go live! For now, it's currently undergoing construction and maintenance. Some features of the site may not be fully in place yet.

   If you have any questions about what's missing, ask us at hello@clarityvisionsolutions.com. Thank you!
   ```

1. Click *Select* beside the *Banner Image* field, and choose the Clarity logo (`clarity-logo.png`) you used for the site's [header and footer in the previous module](../creating-pages/defining-the-pages-header-and-footer.md).

   ![Fill in the same fields you configured when you created the Event structure.](./adding-the-sites-first-web-content/images/02.png)

1. Click *Publish* at the top of the page.

You're brought back to the Web Content page, and now you have an Event article. Next, create an article to answer some frequently asked questions.

## Create a FAQs Article

1. While on the Web Content page, click *Add* (![Add icon](../../images/icon-add.png)) &rarr; *FAQs*.

   ![Click FAQs to add an article with the structure you added previously.](./adding-the-sites-first-web-content/images/03.png)

1. At the top of the page, title the Article "Clarity Site FAQs".

1. Click *Add* (![Add icon](../../images/icon-add.png)) at the top-right of the Question Group to create two more sets of questions and answers (for 3 total).

1. In the first *Question* field, enter this question:

   ```
   I bought my glasses from Clarity previously, but I can't find them on the site. Is Clarity no longer selling them?
   ```

1. In the first *Answer* field, enter this answer:

   ```
   They might only be sold through other retailers now. Try checking our partner websites!
   ```

1. Enter this in the second *Question* field:

   ```
   Where can I find information about new products or changes at Clarity?
   ```

1. Enter this in the second *Answer* field:

   ```
   We will be making a news announcement for any major changes or recalls with Clarity products. Keep an eye on our Announcements page!
   ```

1. Enter this in the third *Question* field:

   ```
   I found a link that isn't working.
   ```

1. Enter this in the third *Answer* field:

   ```
   The site is still undergoing maintenance. Please email hello@clarityvisionsolutions.com with a screenshot of where you found the broken link, and we'll fix it as soon as we can. Thank you!
   ```

1. In the Properties menu on the right side of the screen, ensure that the second template you added, *Collapsible FAQs*, is selected.

1. Click *Publish* at the top of the page.

Now you have a new article for each of the web content structures you've added.

## Import More Articles

You can populate your site with more content by importing it.

1. Download and unzip the LAR file with the other web content articles:

   ```bash
   curl https://resources.learn.liferay.com/courses/latest/en/liferay-s7z9.zip -O
   ```

   ```bash
   unzip liferay-s7z9.zip

1. Still on the Web Content page, click *Options* (![Options icon](../../images/icon-options.png)) at the top right corner of the page and select *Import/Export*.

1. In the modal that opened, select the *Import* tab.

1. Click *Select File*, select the `web-content-articles.lar` file you downloaded and unzipped, and click *Continue*.

1. Use the default settings and click *Import*.

   To learn more about the import process and its options see [Exporting/Importing Widget Data](https://learn.liferay.com/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-widgets/configuring-widgets/exporting-importing-widget-data#importing-widget-data) that has a similar import process.

1. Once the import process is complete, close the modal. All the web content articles, structures, and templates created in this module are imported.

Next, [add templates to show your events and FAQs on specific display pages](./adding-simple-display-page-templates.md).

## Relevant Concepts

- [Creating a Basic Web Content Article](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content/web-content-articles/creating-web-content-articles)

- [Exporting/Importing Widget Data](https://learn.liferay.com/w/dxp/site-building/creating-pages/page-fragments-and-widgets/using-widgets/configuring-widgets/exporting-importing-widget-data)
