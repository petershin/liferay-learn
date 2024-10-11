---
taxonomy-category-names:
- Digital Asset Management
- Documents and Media
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 949e8979-f069-4304-81d1-708d8b741e3d
---

# Using Adapted Images in Site Content

Adaptive Media operates in the background to create multiple resolutions for images uploaded to Liferay DXP. When used in blogs, web content, or content pages, it automatically selects the best resolution based on the target screen size. Understanding how to include these adapted images in your content is essential for optimizing performance.

Each adapted image is identified in the HTML with a `data-fileentryid` attribute, which updates to the latest adapted image upon viewing the content. This ensures that even previously created content displays the most current adapted images.

!!! note
    If you [disable Adaptive Media for an image](./managing-image-resolutions.md), the original image appears in the Blog entries, Web Content articles, and Content Pages.

## Including Adapted Images in Content

When [adding images to Content Pages](../../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#image-source-settings), Adaptive Media supports both directly selected and mapped images. In Blogs and Web Content, it only applies to images added from the *Blog Images*, *Documents and Media*, and *Upload* tabs.

!!! note
    Adapted images can only be applied to the content of a blog entry, not cover images.

Images added to a blog entry via drag and drop are uploaded automatically to the Blog Images repository, adapted, and included in the blog entry's content. You can verify this by inspecting the HTML, where the image contains an `<img>` tag and a `data-fileentryid` attribute.

For web content articles, Adaptive Media works only with images added from the file selector's *Documents and Media* tab. Unlike blogs, Adaptive Media doesn't deliver adapted images for images added to web content articles via drag and drop.

!!! warning
    Adaptive Media doesn't work with images added from the *URL* tab in the file selector for both blog entries and media content articles. This is because the image is linked directly from the URL, providing no image file for Adaptive Media to copy.

Note that you can see the `<img>` tag and `data-fileentryid` attribute in the HTML of a blog entry or a web content article while you're writing it. When the content appears, the HTML is automatically replaced and looks similar to this:

```html
<picture>

   <source media="(max-width:850px)" srcset="/o/adaptive-media/image/44147/med/photo.jpeg">

   <source media="(max-width:1200px) and (min-width:850px)" srcset="/o/adaptive-media/image/44147/hd/photo.jpeg">

   <source media="(max-width:2000px) and (min-width:1200px)" srcset="/o/adaptive-media/image/44147/ultra-hd/photo.jpeg">

   <img src="/documents/20140/0/photo.jpeg/1992-9143-85d2-f72ec1ff77a0">

</picture>
```

This example uses three different images, each with a different resolution. A `source` tag defines each of these images. Also note the original image (`img`) is used as a fallback in case the adapted images aren't available.

## Using Adapted Images in Structured Web Content

To use adapted images in [structured web content](../../../web-content/web-content-structures/creating-structures.md), content creators must manually include an image field in the web content's structure. Then they can reference that image field in the matching template by selecting it on the left side of the editor. Here's an example snippet of an image field named `Imagecrrf` included in a template:

```html
<#if Imagecrrf.getData()?? && Imagecrrf.getData() !="">
   <img data-fileentryid="${Imagecrrf.getAttribute("fileEntryId")}" alt="${Imagecrrf.getAttribute("alt")}" src="${Imagecrrf.getData()}" />
</#if>
```

This snippet includes the `data-fileentryid` attribute to ensure that Adaptive Media replaces the image with an adapted image. If you inspect the resulting web content's HTML in the editor's code view, you should see a tag like this:

```html
<img data-fileentryid="37308" src="/documents/20143/0/photo.jpeg/85140258-1c9d-89b8-4e45-d79d5e262318?t=1518425" />
```

Note the `<img>` tag with a `data-fileentryid` attribute. Adaptive Media uses the file entry ID to replace the `<img>` element automatically with a `<picture>` element that contains the available adapted images for each resolution (see the `<picture>` example above).

## Staging Adapted Images

Adaptive Media is integrated with Liferay's [content staging](../../../../content-authoring-and-management.md) and [export/import](../../../../site-building/sites/exporting-importing-site-pages-and-content.md) features. Adapted images are included in staged content when published.

Similarly, when you export content with adapted images, those images are included in the LAR file. You can then import them along with the original image.

To improve performance, Adaptive Media reuses the existing adapted images during publishing and export/import.

## Related Topics

- [Adding Image Resolutions](./adding-image-resolutions.md)
