---
taxonomy-category-names:
- Sites
- Content Pages
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 7546c519-0350-4811-9577-635d4d1cddec
---

# Content Page Editor UI Reference

{bdg-secondary}`For Liferay 7.4 U37+/GA37+`

Using the content page editor, you can [add](./adding-elements-to-content-pages.md) and configure elements in a content page. Go to a content page and click *Edit* (![Edit icon](../../../images/icon-edit.png)). This opens the editing toolbar and sidebar, which provide tools and components for building content pages.

- [Editing Toolbar](#editing-toolbar)

- [Editing Sidebar](#editing-sidebar)

![Click the Edit button to access the editing toolbar and sidebar.](./content-page-editor-ui-reference/images/01.png)

## Editing Toolbar

The toolbar offers tools for customizing user experiences, translating pages, switching edit modes, and more.

![Click the Edit button to access the editing toolbar.](./content-page-editor-ui-reference/images/02.png)

### Experiences

Using the Experience drop-down menu, you can create customized versions of the current page for different audiences. See [Content Page Personalization](../../personalizing-site-experience/experience-personalization/content-page-personalization.md) for more information.

### Translations

Click the language flag to access the translation drop-down menu. Here, you can view the status of active languages for a page and switch between languages to view and edit translations directly. See [Configuring Site Languages](../../site-settings/site-localization.md) for more information.

If you use [experiences](../../personalizing-site-experience/experience-personalization/content-page-personalization.md), you can also manage translations for each experience. See [Managing Experience Localization](../../personalizing-site-experience/experience-personalization/content-page-personalization.md#managing-experience-localization) for more information.

### Device Display

Click the device icons to access Liferay's responsive layout editor. Here you can configure your page for different screen sizes: desktop (![Desktop](../../../images/icon-display.png)), tablet (![Tablet](../../../images/icon-tablet-portrait.png)), landscape phone (![Landscape Phone](../../../images/icon-mobile-landscape.png)), and portrait phone (![Portrait Phone](../../../images/icon-mobile-portrait.png)). You can resize the screen using the resize handlebar manually. See [Building Responsive Layouts](../../optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) for more information.

!!! note
    The [Fragments and Widgets](#fragments-and-widgets) and [Page Design Options](#page-design-options) panels only appear in the desktop layout.

### Edit History

Click *History* (![History Button](../../../images/icon-time.png)) to see changes made in your current session. You can restore or revert changes from here or use the Undo and Redo buttons.

![Revert your changes using the Undo, Redo, and History buttons.](./content-page-editor-ui-reference/images/03.png)

### Edit Mode Selector

The editing options available in the content page sidebar depend on the editing mode you choose.

| Edit Mode | Description | Available Options |
| :--- | :--- | :--- |
| Page Design | You can design pages when you have permission to update the page and the page content. | <ul><li>[Browser](#browser)</li><li>[Page Content](#page-content)</li><li>[Comments](#comments)</li></ul> |
| Content Editing | You can edit content when you have permission to update the page but not the page content. | <ul><li>[Fragments and Widgets](#fragments-and-widgets)</li><li>[Browser](#browser)</li><li>[Page Design Options](#page-design-options)</li><li>[Page Content](#page-content)</li><li>[Comments](#comments)</li></ul> |

![Choose between Page Design or Content Editing editing modes.](content-page-editor-ui-reference/images/04.png)

### Toggle Sidebars

Click *Toggle Sidebars* (![Toggle Sidebars](../../../images/icon-view.png)) to hide the editing sidebars for a preview of the page.

Click *Actions* (![Actions Button](../../../images/icon-actions.png)) in the application bar and select *Preview in a New Tab* to see the current page experience and language in a new tab.

### Convert to Page Template

Click *Actions* (![Actions Button](../../../images/icon-actions.png)) in the application bar and select *Convert to Page Template* (![Page Template](../../../images/icon-page-template.png)) to create a [page template](../adding-pages/creating-a-page-template.md) based on the current page design.

### Publish

By default, publishing makes your changes live immediately. However, if [workflow process](../../../process-automation/workflow/introduction-to-workflow.md) is configured to direct the review and publishing process, clicking Publish initiates your defined procedure.

## Editing Sidebar

Depending on your selected editing mode, you can access these panels in the editing sidebar:

- ![Fragments and Widgets](../../../images/icon-plus.png) - [Fragments and Widgets](#fragments-and-widgets)

- ![Browser](../../../images/icon-hierarchy.png) - [Browser](#browser) (previously *Selection*)

- ![Page Design Options](../../../images/icon-format.png) - [Page Design Options](#page-design-options)

- ![Page Content](../../../images/icon-paperclip.png) - [Page Content](#page-content) (previously *Contents*)

- ![Comments](../../../images/icon-message.png) - [Comments](#comments)

![The editing sidebar includes these panels.](content-page-editor-ui-reference/images/05.png)

### Fragments and Widgets

In the Fragments and Widgets panel (![Fragments and Widgets icon](../../../images/icon-plus.png)), you can access both out-of-the-box and custom page elements.

**Fragments**: Fragments are extensible, reusable, drag-and-drop elements that serve as the primary building blocks for content pages. Examples include layout elements, videos, and banner images with text overlay. See [Using Fragments](../page-fragments-and-widgets/using-fragments.md) to learn more about the out-of-the-box fragments or [Developing Fragments](../../developer-guide/developing-page-fragments.md) to learn how to create your own.

**Widgets**: Widgets are [applications](../../../liferay-development/building-applications.md) that add dynamic functionality to a page. Examples include blogs, message boards, and calendars. See [Using Widgets on Content Pages](./using-widgets-on-a-content-page.md) for more information.

!!! tip
    Beginning with Liferay 7.4 U37/GA37, click the Order button (![Order Button](../../../images/icon-order.png)) to reorder sets of fragments and widgets. Click the Star button (![Star Button](../../../images/icon-star.png)) to add a fragment or widget to your list of favorite elements.

### Browser

Use the Browser panel (![Browser](../../../images/icon-hierarchy.png)) to view, organize, and manage all elements in the page. Elements appear in a hierarchy. In Liferay 7.4 U37/GA37+, you can drag and drop elements in the Browser panel to reorganize them or double click elements to rename them. Selecting an element opens its settings in the configuration side panel. Select a fragment's sub-elements to access additional settings. See [Configuring Fragments](../page-fragments-and-widgets/using-fragments/configuring-fragments.md) for more information.

!!! note
    Header and footer elements are not displayed in the Browser panel. These can only be edited in [master page templates](../defining-headers-and-footers/master-page-templates.md).

{bdg-link-primary}`[Beta Feature](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)` In Liferay 2024.Q4+, you can select multiple elements by holding CTRL while clicking each element, or by holding SHIFT and clicking to select a range of elements. You can also cut, copy, and paste elements by clicking *Options* (![Options menu](../../../images/icon-options.png)) and choosing the desired option.

!!! note
    Press *ESC* to clear all selections or click outside the Browser side panel area.

![The editing sidebar includes these panels.](content-page-editor-ui-reference/images/06.png)

Here's a list of elements in the content page and their behaviors regarding copying and pasting:

| Element             | Cut/Copy/Paste  | Observation                                                                              |
|:--------------------|:---------------:|:-----------------------------------------------------------------------------------------|
| Collection Item     |       ❌        | Cannot be copied or pasted.                                                              |
| Collection          |       ✅        | When pasting, the content is inserted at the beginning of the collection item.           |
| Column/Module       |       ❌        | Cannot be copied. Only allows pasting items inside, which are inserted at the beginning. |
| Row/Grid            |       ✅        | Pasting inserts the content after the selected row or grid, not inside it.               |
| Form Step           |       ❌        | Cannot be copied. Only allows pasting items inside, which are inserted at the beginning. |
| Form Step Container |       ✅        | Pasting places the content after the form container, not inside it.                      |
| Fragment            |       ✅        | When pasting, the content is added after the selected fragment.                          |
| Drop Zone           |       ❌        | Cannot be copied. Only allows pasting items inside, which are inserted at the beginning. |
| Fragment Drop Zone  |       ❌        | Cannot be copied. Only allows pasting items inside, which are inserted at the beginning. |
| Container           |       ✅        | Pasting inserts the content at the beginning of the container.                           |
| Form                |       ✅        | Pasting inserts the content at the beginning of the form.                                |
| Root                |       ⚠️        | Only allows pasting using a keyboard shortcut.                                           |

You can also use various keyboard shortcuts for actions like cutting, copying, pasting, and more. To view all available shortcuts, open the Keyboard Shortcuts menu (![Keyboard Shortcuts menu](../../../images/icon-question.png)) at the bottom left of the page editor.

![Keyboard shortcuts appear under the Keyboard Shortcuts menu.](content-page-editor-ui-reference/images/07.png)

### Page Design Options

Open the *Page Design Options panel* (![Page Design Options](../../../images/icon-format.png)) to change the page's [master page template](../defining-headers-and-footers/managing-master-page-templates.md) or [style book](../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md).

Click *Options* (![Options button](../../../images/icon-cog3.png)) to access additional page design options, including [frontend client extensions](../../../liferay-development/customizing-liferays-look-and-feel.md).

### Page Content

In the Page Content panel (![Page Content](../../../images/icon-paperclip.png)), you can view and edit content directly added to the page. This can include inline text, images, web content articles, and more. While viewing content, you can search for content items and filter by type. If the page includes a [collection](../../../site-building/displaying-content/collections-and-collection-pages.md), you can view its items and add new items. See [Managing Content in Content Pages](./managing-content-in-content-pages.md) for more information.

!!! note
    Besides collections, mapped content is not listed in the Page Content panel. The panel only includes content added directly to the page.

### Comments

Use the Comments panel (![Comments](../../../images/icon-message.png)) to leave feedback on specific fragments or widgets and collaborate with contributors. You can also view, edit, delete, or reply to open comments.

If [Mentions](../../../collaboration-and-social/notifications-and-requests/user-guide/mentioning-users.md) are enabled, you can tag users with page update permissions as part of your comment.

To add a comment, open the *Comments* panel and select the desired page element.

## Related Topics

- [Using Content Pages](../using-content-pages.md)
- [Adding Elements to Content Pages](./adding-elements-to-content-pages.md)
- [Using Fragments](../page-fragments-and-widgets/using-fragments/configuring-fragments.md)
