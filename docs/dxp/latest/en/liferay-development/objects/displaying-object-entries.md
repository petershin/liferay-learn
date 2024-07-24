---
toc:
  - ./displaying-object-entries/displaying-object-entries-with-collection-providers.md
uuid: bf481358-5a1a-45af-ab98-a03bddd3044a
taxonomy-category-names:
- Sites
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
---
# Displaying Object Entries

{bdg-secondary}`Liferay 7.4+`

<!-- It's not a complete list, we  only talk about collection providers, display pages, and info templates. What about frontend datasets, the default widget, and layouts and views: views exert control over the table of entries, layouts display an individual entry for creating and editing entries. If we mention these we should link to their docs and also talk about their limitations, since the general move is away from them and toward the page building features: collections for displaying the entries and display pages for looking at details, with form containers for adding and editing entries. What's the administrative story though? -->
You can display object entries dynamically with Liferay's page building features. For example, [collection displays](../../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md) can show a table of entries and [display pages](../../site-building/displaying-content/using-display-page-templates.md) can provide a detail view for each entry. When combined with the [form container](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/general-settings-reference.md#form-container), display pages can also serve as the edit screen for object entries. 

![You can use collections and display page templates for object displays.](./displaying-object-entries/images/10.png)

Using these features offers the most flexibility and is recommended. However, other display methods are available:

<!-- Add lots of links to this-->
| Object Entry Display Feature | Description | Object Entry View |
| :--------------------------- | :-------------------- | :---------- |
| Collections | You can create dynamic collections, manual collections, or automatic collections with the collection provider`*` generated for every object, and display them in the Collection Display fragment or on a Collection Page. | List view
| Display Page Templates | You can create a flexible page to display an object entry or its add/edit form using all the best page creation tools. | Detail view<br>Create/edit screen
| Form Containers/<br>Form Fragments | You can use form container fragments on any content or display page to display an object's form. | Creation/edit screen |
| Object Widgets               | You automatically get a widget for your object entries, including a default table view and edit screen. The widget is full-featured but offers limited flexibility, relying on object layouts and views to customize its displays. | List view<br>Detail view<br>Create/edit screen
| Object Layouts               | Only used with the object's widget, you can use layouts to provide a customized detail view.  | Detail view |
| Object Views                 | Only used with the object's widget, you can use views to customize the creation and edit form. | Create/edit screen |
| Mappable Fragments | |
| Information Templates | You can create information templates to control how object entries appear in the Content Display fragment and fragments with sub-elements. | Detail view |
| Frontend Data Sets (Beta) | Display any data returned from a REST application registered in Liferay. |  List view<br>Detail view<br>Create/edit screen<br>
| Liferay Forms | Use objects for data storage and the forms application for form display. | Create/edit screen | 
| Navigation Menus | Add object entries to navigation menus. | List view |

`*` You can also use a Search Blueprints Collection Provider (Beta) with objects. This is especially useful for displaying instance-scoped objects in a site, where manual and dynamic collections are not available.

<!-- This is probably incomplete because what about manual and dynamic collections? And talk about the general purpose of collections and how they interact with objects-->
When an object is published, Liferay creates a Collection Provider for use with the [Collection Display fragment](../../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) to display multiple object entries. You can also configure the fragment to style, filter, and paginate the collection. See [Displaying Object Entries with Collection Providers](#displaying-object-entries-with-collection-providers) for more information.

And since published objects are integrated with the Info framework, you can select them as the content type for [Display Page Templates](../../site-building/displaying-content/using-display-page-templates.md). When selected, the object is set as the template's mapping source, so you can easily map fragment fields to object fields to create flexible page displays for individual object entries.

<!-- Add the purpose: With information templates, you can provide a consistent template that's used to display object entries wherever they appear in display pages and regular content pages. This is like a web content template to determine how articles are displayed. I think its usage is to display a detail view on a display page with the content display fragment, but a fragment can also be mapped to a template. Does that mean you'd want to create an information template for each field? -->
Additionally, you can use FreeMarker to create [Information Templates for Objects](#creating-information-templates-for-objects). Once created, you can map fragment fields to your template to determine how entries are rendered in Content Pages and Display Pages.

!!! note
    Information Templates can be used in Content Display fragments and any other fragment with [sub-elements](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md) (e.g., text, rich text) that can be mapped to objects.

Together, these integrations enable users to leverage Liferay's WYSIWYG page building capabilities while delivering personalized user experiences.

## Creating Display Page Templates for Objects

When created, each object entry is assigned automatically a dedicated friendly URL that uses the following pattern: `server-address/l/objectEntryId` (e.g., `https://mysite.com/l/44337`). To view an entry at its URL, you must first create a Display Page Template for the object.

Follow these steps:

1. Open the *Site Menu* (![Site Menu](../../images/icon-menu.png)), expand *Design*, and go to *Page Templates*.

1. Click the *Display Page Templates* tab.

1. Click the *Add* button (![Add Button](../../images/icon-add.png)) and select the *Blank* template.

   This opens a modal window.

1. Enter a *name* and select the desired *Object* for Content Type.

   ![Enter a name and select the desired object for Content Type](./displaying-object-entries/images/01.png)

1. Click *Save*.

   This creates a blank template with the selected object as its default mapping source and redirects you to the template editing page.

1. Use page fragments and widgets to create flexible, dynamic displays for object entries. See [Using Display Page Templates](../../site-building/displaying-content/using-display-page-templates.md) for information.

   ![Map fragment elements to object fields to dynamically populate Display Pages for individual entries.](./displaying-object-entries/images/02.png)

1. Add the Page Comments widget so end users can comment on entry display pages.

   ```{note}
   You must enable comments for the object definition. Otherwise, the widget is hidden in the display page.
   ```

1. When finished, click *Publish*.

1. Click the *Actions* button (![Actions Button](../../images/icon-actions.png)) for your template and select *Mark as Default*.

   This template is now used to render the object's entries whenever users visit their friendly URLs.

   ![Click the Actions button for the template and select Mark as Default.](./displaying-object-entries/images/03.png)

<!-- It may be more important to show the option to map a fragment link to the page, either with the Default mapping or to the Page -->

### Enabling Comments

1. Open the *Global Menu* (![Global Menu](../../images/icon-applications-menu.png)), go to the *Control Panel* tab, and click *Objects*.

1. Edit an object definition.

1. In the Details tab, enable comments and click *Save*.

   ![Enable comments.](./displaying-object-entries/images/04.png)

## Creating Information Templates for Objects

1. Open the *Site Menu* (![Site Menu](../../images/icon-product-menu.png)) and go to *Design* &rarr; *Templates* &rarr; *Information Templates*.

1. Click *Add* (![Add Button](../../images/icon-add.png))

1. Enter a *name* and select the desired *Object*.

   ![Enter a name and select the desired object.](./displaying-object-entries/images/05.png)

1. Click *Save*. This redirects you to the template design page.

1. (Optional) Click Actions (![Actions Button](../../images/icon-actions.png)) in the Application Bar, select *Import Script*, and choose an `.ftl` file to import. This replaces the current template with the file's FreeMarker script.

   ![Import script from an .ftl file.](./displaying-object-entries/images/06.png)

1. Use [FreeMarker](https://freemarker.apache.org) to design your template.

   In the *Elements* side panel (![Elements](../../images/icon-list-ul.png)), you can access available fields from the selected object's structure.

   ![Select from available fields in the object's structure.](./displaying-object-entries/images/07.png)

1. (Optional) Add a description or image to the template in the Properties side panel (![Properties](../../images/icon-cog3.png)).

   ![Add a description or image in the Properties panel.](./displaying-object-entries/images/08.png)

1. Click *Save* when finished.

You can now select from the template when mapping object entries to fragment fields.

![Select the template when mapping fragment elements.](./displaying-object-entries/images/09.png)

## Adding Entries to Navigation Menus

Since objects are integrated with the info framework, you can add object entries to navigation menus to provide quick access. All published objects automatically appear as available sources for menu elements. See [Using the Navigation Menus Application](../../site-building/site-navigation/using-the-navigation-menus-application.md) for more information.

## Related Topics

* [Creating Objects](./creating-and-managing-objects/creating-objects.md)
* [Displaying Object Entries with Collection Providers](./displaying-object-entries-with-collection-providers.md)
* [About Collections and Collection Pages](../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md)
* [Using Display Page Templates](../../site-building/displaying-content/using-display-page-templates.md)
