---
toc:
- ./using-display-page-templates.md
- ./using-display-page-templates/creating-and-managing-display-page-templates.md
- ./using-display-page-templates/publishing-content-with-display-pages.md
- ./using-display-page-templates/displaying-categories-using-display-pages.md
- ./using-display-page-templates/configuring-seo-and-open-graph.md
---
# Using Display Page Templates

```{toctree}
:maxdepth: 3

using-display-page-templates/creating-and-managing-display-page-templates.md
using-display-page-templates/publishing-content-with-display-pages.md
using-display-page-templates/displaying-categories-using-display-pages.md
using-display-page-templates/configuring-seo-and-open-graph.md
```

{bdg-secondary}`Available Liferay DXP/Portal 7.3+`

Display page templates define structures for displaying content at a dedicated URL. When you create or upload content items, Liferay automatically generates a unique friendly URL for accessing it. However, you can only use this URL to view the content if you first define a template for displaying it.

![Create display page templates for displaying content at a dedicated URL.](./using-display-page-templates/images/01.png)

When creating a display page template, you begin by selecting a content type (e.g., web content article, document, blog entry). This determines which content items can use the template for rendering their display pages. You can then design the template using the same UI and design elements as Content Pages. This means you can use page [fragments](../creating-pages/page-fragments-and-widgets/using-fragments.md) and [widgets](../creating-pages/using-content-pages/using-widgets-on-a-content-page.md) to build dynamic displays that map to content fields and integrate additional functionality. Additionally, you can define [SEO settings](./configuring-seo-and-open-graph.md) to improve your Pages' search ranking.

After designing the template, you can make it the default template for displaying its content type, or manually configure only some of your content items to use it. Once set, users can view the content item's display page by visiting its friendly URL. The content is dynamically rendered according to your template design.

Display page templates currently support the following content types:

* [Blog Entries](../../../content-authoring-and-management/blogs/getting-started-with-blogs.md)
* [Categories](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) {bdg-secondary}`Available 7.4+`
* [Custom Objects](../../../building-applications/objects/displaying-object-entries.md) {bdg-secondary}`Available 7.4+`
* [Documents](../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/publishing-documents.md)
* [Web Content Articles](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)

```{tip}
Use display page templates for designing layouts that you want to reuse for multiple content items.
```

These templates are ideal for displaying a list of elements in a consistent way, like business case studies, product or service options, job listings, web articles, and more. For example, consider an insurance business website where you want to showcase available insurance options for prospective customers. This site includes individual web content articles that describe each option. You have also used content pages to create a landing page where site visitors can see all options at a glance. You want to allow them to click an insurance option to access a display page containing the corresponding insurance details from the articles.

![You can apply the same layout to different content of the same type using a single Display Page Template.](./using-display-page-templates/images/02.png)

To achieve this goal, you can create a single display page template that maps your web content article fields to fragments in your template. You can reuse the same template for each article. Then, you can link each insurance option in your landing page to the corresponding article's friendly URL. When site visitors click an option, the display page is dynamically populated with information from your web content articles and rendered according to your template design.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Creating and Managing Display Page Templates
:link: ./using-display-page-templates/creating-and-managing-display-page-templates.md
:::

:::{grid-item-card} Publishing Content with Display Pages
:link: ./using-display-page-templates/publishing-content-with-display-pages.md
:::

:::{grid-item-card} Displaying Categories Using Display Pages
:link: ./using-display-page-templates/displaying-categories-using-display-pages.md
:::

:::{grid-item-card} Configuring SEO and Open Graph
:link: ./using-display-page-templates/configuring-seo-and-open-graph.md
:::
::::
