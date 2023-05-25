---
uuid: 1e13195e-4d93-4d50-bc15-910ece4d4e8d
---
# Default Fragments Reference

Liferay provides a variety of fragments out-of-the-box, so you can start building your solution right away. To view available fragments, begin editing a content page or page template. While editing, open the *Fragment and Widgets* tab (![Fragments and Widgets](../../../../images/icon-plus.png)) in the editing sidebar menu.

Fragments are organized into the following sets:

- [Default Fragments Reference](#default-fragments-reference)
  - [Layout Elements](#layout-elements)
  - [Basic Components](#basic-components)
  - [Form Components](#form-components)
  - [Content Display](#content-display)
  - [Cookie Banner](#cookie-banner)
  - [Featured Content](#featured-content)
    - [Banners](#banners)
    - [Features](#features)
    - [Highlights](#highlights)
  - [Footers](#footers)
  - [Navigation Bars](#navigation-bars)
  - [Menu Display](#menu-display)
  - [Related Topics](#related-topics)

```{note}
Available configuration options vary by fragment and fragment sub-element. See [Configuring Fragments](./configuring-fragments.md) for more information.
```

## Layout Elements

{bdg-secondary}`For Liferay 7.3+`

*Layout Elements* define drop zones for designing page and template layouts. By Default, Liferay includes two Layout Elements: *Containers* and *Grids*.

| Fragment | Description |
| :--- | :--- |
| Container (previously *Panel*) | Adds a configurable drop zone. |
| Grid (previously *Row*) | Adds multiple drop zone modules. These modules can be configured and arranged vertically or horizontally. |

## Basic Components

These are simple design elements that add basic functionality to a page. Examples include buttons, headings, and tabs. With these Components, you can build your page piece by piece. DXP includes the following Basic Components.

| Fragment | Description |
| :--- | :--- |
| Button | Adds a [link element](./configuring-fragments/fragment-sub-elements-reference.md) with five available button types: Primary, Secondary, Link, Outline Primary, and Outline Secondary. |
| Card | Adds [image](./configuring-fragments/fragment-sub-elements-reference.md), [rich text](./configuring-fragments/fragment-sub-elements-reference.md), and [link](./configuring-fragments/fragment-sub-elements-reference.md) elements arranged as a display card. |
| Drop-down {bdg-secondary}`7.4+` | Adds a [simple text element](./configuring-fragments/fragment-sub-elements-reference.md) and drop zone. You can drag-and-drop other fragments and widgets into the drop zone to create an advanced drop-down menu. |
| External Video {bdg-secondary}`7.4+` | Embeds an external video in a page or template. Supported video sources include YouTube, Facebook, Twitch, Vimeo, and videos stored in Documents and Media. See [Embedding Videos](../../../../content-authoring-and-management/documents-and-media/videos/embedding-videos-into-liferay-assets-and-pages.md) for more information. |
| Heading | Adds a [simple text element](./configuring-fragments/fragment-sub-elements-reference.md) that can be configured to use H1-H6 style. |
| HTML | Adds an editable [HTML element](./configuring-fragments/fragment-sub-elements-reference.md). Double-clicking the element opens a modal window where you can edit its content using HTML syntax. |
| Image | Adds a configurable [image element](./configuring-fragments/fragment-sub-elements-reference.md). When configuring, determine whether to use the image's original size, or adjust it to fit its context. |
| Paragraph | Adds a [rich text element](./configuring-fragments/fragment-sub-elements-reference.md). When editing, highlight the fragment's text to access additional formatting options. |
| Separator | Adds a horizontal line between page elements. You can configure its spacing and color. |
| Slider | Adds multiple [images](./configuring-fragments/fragment-sub-elements-reference.md) with [rich text](./configuring-fragments/fragment-sub-elements-reference.md) overlay that are grouped into slides. Users can manually cycle through each slide. |
| Social | Adds [image elements](./configuring-fragments/fragment-sub-elements-reference.md) with Facebook, Twitter, and LinkedIn icons, which you can link to pages on each platform. |
| Spacer | Adds a horizontal blank space between fragments on a page. You can configure its height. |
| Tabs | Adds multiple tabs with [simple text elements](./configuring-fragments/fragment-sub-elements-reference.md) and individual drop zones for adding widgets and other fragments. |
| Video URL (previously *Video Fragment*) | Embeds a video from Youtube or Documents and Media in a page or template. You can set the video to autoplay, loop, or mute. You can also hide video controls from end users. See [Embedding Videos](../../../../content-authoring-and-management/documents-and-media/videos/embedding-videos-into-liferay-assets-and-pages.md) for more information. |

## Form Components

{bdg-secondary}`For Liferay 7.4 U45+/GA45+`

Use Form Components fragments to build forms in content pages. These fragments only support custom objects. To access them, you must have at least one published object. See [Using Fragments to Build Forms](../../../../building-applications/objects/using-fragments-to-build-forms.md) for more information.

| Fragment | Description |
| :--- | :--- |
| Form Container | Adds a container for building forms in content pages. Once added, you must map the container to a custom object. The container automatically generates form fragments for each field in the object. You can add or remove fragments from the container and set a custom success message for form submissions. You can only place other form components in a mapped form container. |
| CAPTCHA | Adds CAPTCHA confirmation to a form container. Once added, the form container requires human verification for submissions. |
| Checkbox | Adds a checkbox to the form container that you can map to boolean fields. |
| Date | Adds a field that you can map to custom date fields. |
| File Upload | Adds a file upload button that you can map to [attachment fields](../../../../building-applications/objects/creating-and-managing-objects/fields/attachment-fields.md#attachment-fields). The mapped attachment field determines how files are uploaded. By default, this fragment displays supported file extensions. |
| Multiselect List | Adds a field that you can map to multiselect picklists. |
| Numeric Input | Adds a field that you can map to custom numeric fields (i.e., integer, long integer, decimal, and precision decimal). You can set a placeholder value and help text. |
| Rich Text| Adds a field that you can map to rich text fields.|
| Select from List | Adds a drop-down menu that you can map to custom picklist and relationship fields. If the mapped field includes more than 10 options, the drop-down menu also includes a search bar for querying options. |
| Submit Button | Adds a button for submitting the form entry. Every form container must include a submit button. |
| Text Input | Adds a field that you can map to text fields (i.e., text, long text). |
| Textarea | Adds a field that you can map to long text fields. |
| Tags | Adds a field to add tags from the current site or global site to object entries.|
| Categories| Adds a field to add categories from the current site or global site to object entries.|

## Content Display

{bdg-secondary}`For Liferay 7.3+`

Use Content Display fragments to display site content individually or as part of a Collection. You can also add page elements for rating or flagging page content. DXP includes the following Content Display fragments:

| Fragment | Description |
| :--- | :--- |
| Content Display | Displays a single content item from Documents and Media, Web Content, Blogs, or Categories. Available configuration options depend on the selected content type. |
| Content Flags | Adds an element for flagging a content item. |
| Content Ratings | Adds an element for rating a content item. |
| Collection Filter (Available 7.4+) | Adds an element for filtering a collection display using a vocabulary or category. |
| Applied Filters (Available 7.4+) | Adds an element for displaying and managing filters applied to a collection display. |
| Collection Display | Displays manually and dynamically defined collections, as well as collections defined by a collection provider. You can configure whether the collection is displayed in a grid, or with a list template (i.e., bordered, bulleted, inline, numbered, and unstyled). See [Displaying Collections](../../../displaying-content/additional-content-display-options/displaying-collections.md) for more information. |

<!--| Knowledge Base Article Navigation (Available 7.4 U_+/GA_+) | |-->

## Cookie Banner

{bdg-secondary}`Available Liferay 7.4+`

| Fragment | Description |
| :--- | :--- |
| Cookie Banner Simple | Adds [rich text](./configuring-fragments/fragment-sub-elements-reference.md) and [link](./configuring-fragments/fragment-sub-elements-reference.md) elements for accepting site cookies. |

## Featured Content

Featured Content fragments are complex page elements composed of multiple components. To preview a fragment's layout, switch to *Card View* ( ![Card View](../../../../images/icon-cards2.png) ) in the Fragment's and Widgets panel. Liferay includes the following Featured Content fragments.

```{note}
For Liferay DXP/Portal 7.3, you can preview layouts by hovering over each fragment's *Information* icon (![Information](../../../../images/icon-information.png)).
```

### Banners

Use *Banner* fragments to add text and link elements to a content page for creating CTA (Call to Action) banners. DXP includes the following layouts.

![Add text and link elements to a content page for creating Call to Action banners.](./default-fragments-reference/images/01.png)

### Features

Use the *Features* fragment to add text, images, and link elements to a content page for promoting key features. DXP includes the following layouts.

![Add text, image, and link elements to a content page for promoting key features](./default-fragments-reference/images/02.png)

### Highlights

Use the *Highlights* fragment to add image, text, and link elements to a content page for highlighting. DXP provides the following layouts.

![Add image, text, and link elements to a content page for highlighting.](./default-fragments-reference/images/03.png)

## Footers

{bdg-secondary}`Available Liferay 7.3+`

Use *Footer* fragments to add a custom footer to [master page templates](../../defining-headers-and-footers/master-page-templates.md). Each footer includes a navigation menu, sign-in link, image element, and copyright text. Liferay the following layouts for Footer fragments:

![Add a custom footer to master page templates for content page.](./default-fragments-reference/images/04.png)

## Navigation Bars

{bdg-secondary}`Available Liferay 7.3+`

Use *Navigation Bar* fragments to add a custom header to [master page templates](../../defining-headers-and-footers/master-page-templates.md). Each navigation bar includes a navigation menu, sign-in link, and image element for your logo. Liferay provides the following layouts for Navigation Bar fragments:

![Add a custom header to master page templates for content page.](./default-fragments-reference/images/05.png)

## Menu Display

{bdg-secondary}`Available Liferay 7.4+`

Using the Menu Display fragment, you can add menus to your content pages. Once deployed, you can select from any predefined [Navigation Menu](../../../site-navigation/using-the-navigation-menus-application.md). To learn more about how to configure the Menu Display fragment for your site navigation, see [Managing Site Navigation](../../../site-navigation/managing-site-navigation.md).

<!--## Product-->

<!-- {bdg-secondary}`Available Liferay 7.4 U_+/GA_+` -->

<!--
| Fragment | Description |
| :--- | :--- |
| Image Gallery |  |
| Availability |  |
-->

## Related Topics

* [Using Content Pages](../../using-content-pages.md)
* [Content Page Editor UI Reference](../../using-content-pages/content-page-editor-ui-reference.md)
* [Using Fragments](../using-fragments.md)
* [Managing Site Navigation](../../../site-navigation/managing-site-navigation.md)
