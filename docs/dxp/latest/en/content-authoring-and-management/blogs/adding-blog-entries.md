---
uuid: 357d9fa7-1cc8-499a-9770-c6ac607c6444
---
# Adding Blog Entries

Blog entries are scoped to sites. By default, only authenticated users have the ability to create blog entries. See the [Blogs Permissions Reference](./blog-permissions-reference.md) for more information.

The easiest way to create a blog entry is on the blogs widget deployed on a site page.

## Creating an Entry

1. Click *Site Menu* ( ![Product Menu](../../images/icon-product-menu.png) ) then click compass icon ( ![Compass](../../images/icon-compass.png) ) on the *Site Administration* menu. Select the site where the blog will be created.
1. Once the blogs widget has been added to the Site page, click the *New Entry* button.

    ![Blog Entry Form Editor](./adding-blog-entries/images/01.png)

1. *Drag \& Drop to Upload* an optional cover image for the entry. By default, this cover image is published as part of the blog entry's abstract. Insert the desired image, either via drag and drop or the *Select File* button.
1. Enter a title for the blog entry.
1. Enter an optional subtitle for the entry.
1. Enter the entry's content in the *Content* field. To learn more about the different text editing features, see the [Blog Entry Editor Reference](./blog-entry-editor-reference.md) article.

### Organizing Blog Entries with Tags and Related Assets

<!-- ```{note} Available in Liferay DXP 7.3+. This section must be updated to reflect the new by-default categories and vocabularies in 7.3``` -->

Adding tags and relating other assets to the blog entry can help users better find content on your site.

To add tags:

1. Expand the *Categorization* section.
1. Click  *Select* button to choose an existing tag. Alternately, create a new tag by entering the tag name in the *Tags* field and clicking *Add*. See [the documentation on tags](https://help.liferay.com/hc/articles/360028820472-Tagging-Content) for more information.

To add an asset relation:

1. Expand the related assets section and click *Select* button to select the desired asset to link.

### Configuring How the Entry is Displayed

To customize the blog entry's URL, abstract, or display date:

1. Expand the *Configuration* menu.
1. Leave the default URL setting as *Automatic*; the URL is based on the blog entry's title. Alternately, selecting *Custom* lets you enter your own URL.
1. Specify the blog entry's abstract. By default, the blogs application uses the first 400 words. Alternately, enter a custom abstract.
1. Finally, you can allow pingbacks for the blog entry. Pingbacks are XML-RPC requests that are sent automatically when you link to another site.

    ![When creating a blog entry, the Configuration panel lets you control when and where the blog entry appears, and what to use for the entry's abstract.](./adding-blog-entries/images/02.png)

1. Expand the display page template panel if you want to select a [display page template](https://help.liferay.com/hc/articles/360028820332-Display-Page-Templates-for-Web-Content) for displaying your blog entry. Otherwise, use the default display page template.

1. Click *Publish* to publish the blog entry.

![The Blog Entry has been published.](./adding-blog-entries/images/03.png)

The entry is now published. Fellow site members can add comments, rate the entry, or share it on other social media sites.
