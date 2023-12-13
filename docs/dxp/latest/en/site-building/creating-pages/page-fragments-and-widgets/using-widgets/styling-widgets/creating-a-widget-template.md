---
uuid: 42d0d78f-d8fe-461f-8d48-a3376b49ed44
---

# Creating a Widget Template

Widget Templates use [FreeMarker](https://freemarker.apache.org/) to determine how widgets are rendered in site pages. Each template is designed for a specific widget type and can be selected while configuring the widget in a page.

```{note}
For Liferay DXP/Portal 7.4+, widget templates only support FreeMarker. Velocity is no longer supported.
```

Follow these steps to create a Widget Template:

1. Navigate to the desired site where you want to create the widget template.

1. Open the _Site Menu_ ( ![Site Menu](../../../../../images/icon-product-menu.png) ) and go to _Design_ &rarr; _Templates_ &rarr; _Widget Templates_.

   ```{note}
   In the Global Site, you can view sample widget templates. These sample templates differ from the default templates already configured in the apps.
   ```

1. Click _Add_ ( ![Add Button](../../../../../images/icon-add.png) ) and select the type of template to create.

   ![Click on Design and Widget templates.](./creating-a-widget-template/images/01.png)

1. Enter a _name_ for the template.

1. Design your template in the editor.

   In the _Elements_ side panel ( ![Elements](../../../../../images/icon-list-ul.png) ), you can select from available widget fields, variables, and utilities. Some elements are common to all widgets, while others are specific to the selected widget type.

   ![Design the template using field elements.](./creating-a-widget-template/images/02.png)

1. (Optional) In the Details side panel (![Details](../../../../../images/icon-cog3.png)), enter a _description_ and select an _image_ for the template.

1. Click _Save_.

## The Template Editor

On the right side of the template editor is a palette of common variables used for making templates. This is a great reference when creating your template. To place one of the variables into the template editor, position your text cursor where you want it placed, and click the variable name.

Each variable also has a tooltip which displays a detailed description. Because there are multiple kinds of widget templates, there are also different variables for each widget template. Thus, each template has a different set of variables only applicable for that specific template.

![Liferay offers a versatile script editor to customize your widget template.](./creating-a-widget-template/images/03.png)

You can also use the autocomplete feature to add variables to your template. It can be invoked by typing `${` which opens a drop-down menu of available variables. By clicking one of the variables the editor inserts the variable into the editor.

You can also embed same-type templates into other templates. For example, suppose you have an existing Wiki widget template and want to create another Wiki widget template. Instead of starting from scratch, you can import the existing Wiki widget template into your new one and build from it. In other words, you can use widget templates as generic templates to reuse code imported by Velocity or FreeMarker templates in the system.

## Calling Headless APIs in the Template Editor

You can call Liferay's [Headless](../../../../../headless-delivery/using-liferay-as-a-headless-platform.md) API services directly in the template editor. Use the `restClient` object with the relative URL of an API endpoint to inject headless resources into your templates.

!!! note
You can only call GET endpoints with the `restClient` object.

For example, you can use `restClient` to retrieve a site's blog postings and then print out their headlines with the following FreeMarker script:

```ftl
<#assign 
	blogPostings = restClient.get("/headless-delivery/v1.0/sites/{siteId}/blog-postings").items
/>

<#list blogPostings as blogPosting>
	<h1>${blogPosting.headline}</h1>
</#list>
```

You can filter, sort, search, and paginate your API responses the same way you would with a standard cURL request. For example:

```ftl
<#assign 
	blogPostings = restClient.get("/headless-delivery/v1.0/sites/{siteId}/blog-postingssort=dateCreated:asc&filter=creatorId+eq+20126").items
/>

<#list blogPostings as blogPosting>
	<h1>${blogPosting.headline}</h1>
</#list>
```

See [API Query Parameters](../../../../../headless-delivery/consuming-apis/api-query-parameters.md) for more information on filtering APIs.

Use the [API Explorer](../../../../../headless-delivery/consuming-apis/consuming-rest-services.md) to find API endpoints and schemas for Headless resources.

## Configuring Widget Templates

After you've saved your widget template, you can manage it through its Actions button (![Actions Button](../../../../../images/icon-actions.png)). This provides several options:

- _Edit_: modify the widget template's setup properties.
- _Permissions_: manage the permissions _Update_, _Permissions_, _Delete_, and _View_ for the widget template.
- _Copy_: creates a copy of the widget template.
- _Delete_: deletes the widget template.

Additionally, your widget template generates a static URL and a WebDAV URL. These values access the XML source of your template. You can find these URLs by clicking the widget template from the menu and expanding the _Details_ section. With the WebDAV URL, Site administrators can add, browse, edit, and delete widget templates on a remote server. If you want to learn more about what the WebDAV URL can do, see [WebDAV access](../../../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/accessing-documents-with-webdav.md).

```{note}
Embedding widgets into widget templates, although possible, is not recommended because this could cause conflicts with other widgets or unexpected behavior (e.g., embedding a widget that aggregates data to the breadcrumb). If embedding a widget into a widget template is your only option, make sure it does not interfere with other widgets.
```

Next, configure the widget to use the new widget template:

1. Go to the _Configuration_ page for the widget you want to modify and open its _Display Settings_.

1. Under _Display Template_, select your widget template from the drop-down menu.

Also, you can manage Site-specific display templates for your app: do this by clicking the _Manage Display Templates for [SPECIFIC_SITE]_ link next to the _Display Template_ drop-down menu. A window appears with a list of your configured templates only available for your Site with options to add new templates or edit existing templates.

![Click the _Configuration_ menu of an app to edit and manage available widget templates.](./creating-a-widget-template/images/04.png)

## Related Topics

- [Widget Template Example](./using-a-widget-template-example.md)
