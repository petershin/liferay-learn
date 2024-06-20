---
uuid: 5257b2ec-69e8-4192-89a7-6143a5a25922
taxonomy-category-names:
- Content Management System
- Wiki
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---

# Creating Wiki Pages

The *Wiki* widget starts with a default wiki page called *FrontPage*. Users can edit this page to make their first wiki page.

By default, only authenticated users can create *Wiki* articles; guests must sign in first.

!!! note
    Set `permissions.propagation.enabled` to `true` in the `portal-ext.properties` file to have Wiki pages inherit their parent's permissions. This affects only Wiki pages and message board threads; other assets inherit the default resource permission.

## Creating Content on the *FrontPage*

1. Navigate to the site page where the Wiki widget is deployed.

   ![The Wiki Widget with no content](./creating-wiki-pages/images/01.png)

1. To modify the `FrontPage`, click the *This page is empty. Edit it to add some text.* link in the box.

1. The default text editor uses Creole. To switch the format, expand the *Configuration* section.

   ![Changing the Text Format](./creating-wiki-pages/images/02.png)

1. Select a new format (HTML) then click *OK* to accept the change.

1. Enter the article's content.

### Uploading an Attachment

Users can attach files to wiki pages.

1. To add attachments, expand the *Attachments* section.

1. Drag and drop a file to upload or use the *Select Files* button to navigate to the file's location.

    ![Uploading an attachment](./creating-wiki-pages/images/03.png)

    !!! important
        You can enable automatic antivirus scanning to scan files on upload. For details, please see [Enabling Antivirus Scanning for Uploaded Files](../../system-administration/file-storage/enabling-antivirus-scanning-for-uploaded-files.md).

### Using Tags and Related Assets to Organize Wiki Pages

Users can add a tag to a page. If searching for content using this tag (for example, *Toyota*), all posts with the *Toyota* are returned faster.

1. Expand the *Categorization* section.

1. Click the *Select* button to select an existing tag. Alternately, create a new tag by entering the tag name in the *Tags* field and clicking *Add*. See [the documentation on tags](https://help.liferay.com/hc/articles/360028820472-Tagging-Content) for more information.

1. Click *Publish* when finished.

![Publishing the FrontPage page](./creating-wiki-pages/images/05.png)

The *FrontPage* article has been created.

## Creating Child Pages

Once the `FrontPage` Page has been created, users can create a child page. This creates a parent-child hierarchy of wiki pages. A Wiki child page could have child pages of its own even as it also belongs to a parent page. To create a child page, click *Add Child Page*.

![Add a child page](./creating-wiki-pages/images/06.png)

It opens the same wiki page editor.

![The Wiki Page editor is the same for all pages at all levels.](./creating-wiki-pages/images/07.png)

## Creating Other Top Level Pages

As noted above, future wiki pages are created as child pages for organizational purposes. To create another top-level page:

1. Click the *All Pages* tab.

1. Mouse over the *Wiki* widgets menu and click *Add Page*.

   ![Add another wiki top level page](./creating-wiki-pages/images/04.png)

This opens the same Wiki page editor.

A Wiki widget can have multiple top-level pages; while the main Wiki widget displays only the `FrontPage` wiki page, site content creators can use the [Wiki Display Widget](./using-the-wiki-display-widget.md) to display the other top-level pages.

![Using the Wiki Display Widget to display other top-level pages](./creating-wiki-pages/images/08.png)

## What's Next

- [Creating a Node](./creating-a-node.md)
- [Using the Wiki Display Widget](./using-the-wiki-display-widget.md)
