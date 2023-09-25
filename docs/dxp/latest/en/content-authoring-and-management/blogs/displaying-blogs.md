---
uuid: 7f36774b-50b3-439e-8651-f43fe33d6113
---
# Displaying Blogs

Liferay provides two methods for displaying blog entries: [display page templates](#using-display-page-templates) and the [Blogs widget](#using-the-blogs-widget).

## Using Display Page Templates

You can use [display page templates](../../site-building/displaying-content/using-display-page-templates.md) to create reusable dynamic designs for displaying blog entries at their friendly URLs. By default, all blog entries are assigned a unique friendly URL automatically. You can use this URL to view the blog entry at a display page if you've selected a display page template to use for blog entries.

The blog's friendly URL is appended to the display page's URL (i.e., `display-page-url/blog-friendly-url`) and can be edited at any time. If you do change it, Liferay stores the previous URL in the entry's friendly URL history. As long as the old URL remains in this history, it works to access the latest version of the blog entry. See [Publishing Content with Display Pages](../../site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) for more instructions on setting up templates for displaying blog entries.

Once you've set up display pages for your blog entries, you can use collections to list them in your content pages. See [About Collections and Collection Pages](./../collections-and-collection-pages/about-collections-and-collection-pages.md) for more information.

### Friendly URL History

If an old blog entry URL appears in the friendly URL history, it can't be used for other entries in the same site. You must first remove it from the entry's friendly URL history before using it for a new entry.

Follow these steps to manage a blog entry's friendly URL history:

1. Open the *Site Menu* ( ![Site Menu](../../images/icon-product-menu.png) ), expand *Content & Data*, and go to *Blogs*.

1. Click the *Actions* button ( ![Actions Button](../../images/icon-actions.png) ) for the desired entry and select *Edit*.

1. Expand the Configuration section and click the *History* button ( ![History Button](../../images/icon-history.png) ) in the Friendly URL field.

   ![Click History button for the Friendly URL field.](./displaying-blogs/images/01.png)

1. Click the *Restore* button ( ![Restore Button](../../images/icon-restore2.png) ) to replace the current friendly URL with the selected URL.

1. Click the *Forget URL* button ( ![Forget URL Button](../../images/icon-delete.png) ) to remove the selected URL from the entry's history. Once removed, you can no longer use the URL to access the blog entry.

   ![Click Restore or Forget URL buttons.](./displaying-blogs/images/02.png)

Changes to the friendly URL history are automatically saved.

## Using the Blogs Widget

Adding the Blogs widget to a page exposes the blog interface to site members. Similarly, adding the widget to a user's personal site (Profile) creates a blog just for that user. The widget works the same way in both cases. 

Once you've added a Blogs widget to a page, there are several display options for configuring the listing to look the way you want. 

To configure the widget, click *Options* ( ![Options icon](../../images/icon-app-options.png) ) &rarr; *Configuration*.

![There are different setup options for the Blogs widget](displaying-blogs/images/03.png)

### Setup Tab

**Enable Ratings:** Enable the [ratings system](../../collaboration-and-social/social-tools/user-guide/using-the-ratings-system.md) for blog entries. 

**Enable Comments:** Enable comments on blog entries.

**Show View Count:** Enable showing the number of views for each entry.

**Social Bookmarks:** Enable sharing blog entries on the social media platforms you add to the *Current* column. To move social networking sites between the *Current* and *Available* columns, select the sites and use the arrows between those columns. Similarly, use the up/down arrows beneath the Current column to reorder the sites as they appear on each blog entry. 

**Display Style:** Define how social bookmarks appear. *Inline* is the default and displays the social bookmark icons in a row. *Menu* hides them inside a share menu.

**Maximum Items to Display:** The total number of blog entries to display on the initial page. You can select up to 60 to display at once.

**Display Template:** Choose the display layout for blogs:

* **Abstract:** Displays an abstract of each blog entry.

* **Full Content:** Displays the full content of each blog entry.

* **Title:** Displays only the title of each blog entry.

* **Basic:** A stripped-down version of the Abstract, with less text and no cover image.

* **Card:** Displays each blog entry in a card-like rectangle that shows the cover image, title, author, post date, and a few lines of text.

![The card display template makes your blog posts look like fun little trading cards.](displaying-blogs/images/04.png)

To select a different application display template (ADT) or create your own, click *Manage Templates*. 

**Enable Report Inappropriate Content:** Enable flagging content as inappropriate, which sends an email to administrators.

**Enable Ratings for Comments:** Enable the [ratings system](../../collaboration-and-social/social-tools/user-guide/using-the-ratings-system.md) for blog entry comments.

**Show Related Assets:** Enable showing related content from other widgets.

### Communication, Sharing, and Scope Tabs

**Communication:** Lists public render parameters the widget publishes to other widgets on the page. Other widgets can read and take actions on these. For each shared parameter, you can specify whether to allow communication using the parameter and select which incoming parameter can populate it.

**Sharing:** Embed the widget instance as a widget on any website, Facebook, Netvibes, or as an OpenSocial Gadget.

**Scope:** Specify the blog instance the widget displays: the current Site's blog (default), the global blog, or the page's blog. 

## Related Topics

* [Adding Blog Entries](./adding-blog-entries.md)
* [Using Display Page Templates](../../site-building/displaying-content/using-display-page-templates.md)
