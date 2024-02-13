---
toc:
  - ./using-fragments/default-fragments-reference.md
  - ./using-fragments/using-layout-elements.md
  - ./using-fragments/configuring-fragments.md
  - ./using-fragments/mapping-and-linking-fragment-elements.md
  - ./using-fragments/configuring-fragment-visibility.md
  - ./using-fragments/editing-fragment-elements.md
  - ./using-fragments/personalizing-custom-forms-using-form-fragments.md
  - ./using-fragments/creating-dropdown-menus-with-fragments.md
  - ./using-fragments/duplicating-fragments.md
  - ./using-fragments/saving-fragment-compositions.md
  - ./using-fragments/managing-fragments.md
  - ./using-fragments/propagating-fragment-changes.md
taxonomy-category-names:
- Sites
- Fragments
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 6daca74f-6058-429b-af62-1e1af9c71048
---
# Using Fragments

Page fragments are extensible and reusable drag-and-drop elements for building [content pages](../using-content-pages.md) and their related templates (i.e., [masters](../defining-headers-and-footers/master-page-templates.md), [pages](../adding-pages/creating-a-page-template.md), and [display pages](../../displaying-content/using-display-page-templates.md)). They are built using HTML, CSS, and JavaScript and can provide both structure and functionality to your pages.

![Build content pages and templates with fragments.](./using-fragments/images/01.png)

Liferay provides a variety of fragments out-of-the-box, but you can develop custom fragments using the [page fragment editor interface](../../developer-guide/reference/fragments/page-fragment-editor-interface-reference.md) or the [Fragments Toolkit](../../developer-guide/developing-page-fragments/using-the-fragments-toolkit.md). Additionally, you can [embed Liferay widgets](../../developer-guide/reference/fragments/fragment-specific-tags-reference.md#including-widgets-within-a-fragment) into fragments or add [editable fields](../../developer-guide/reference/fragments/fragment-specific-tags-reference.md). See [Developing Page Fragments](../../developer-guide/developing-page-fragments/developing-fragments-intro.md) to learn more.

If you are working with forms, you can personalize your form fields by [mapping them to custom form fragments](./using-fragments/personalizing-custom-forms-using-form-fragments.md).

All page fragments are organized into *sets*, which group related fragments for easier management and use. Each fragment set can include common resources accessible to all the fragments. See [Including Default Resources in Fragments](../../developer-guide/developing-page-fragments/including-default-resources-with-fragments.md) for more information.

After adding fragments to a page or template, you can configure and customize them and their sub-elements. These options can vary, though some are common to all. See [Configuring Fragments](./using-fragments/configuring-fragments.md) to learn more about available options.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} Default Fragments Reference
:link: ./using-fragments/default-fragments-reference.md
:::

:::{grid-item-card} Using Layout Elements
:link: ./using-fragments/using-layout-elements.md
:::

:::{grid-item-card} Configuring Fragments
:link: ./using-fragments/configuring-fragments.md
:::

:::{grid-item-card} Mapping and Linking Fragment Elements
:link: ./using-fragments/mapping-and-linking-fragment-elements.md
:::

:::{grid-item-card} Configuring Fragment Visibility
:link: ./using-fragments/configuring-fragment-visibility.md
:::

:::{grid-item-card} Editing Fragment Elements
:link: ./using-fragments/editing-fragment-elements.md
:::

:::{grid-item-card} Personalizing Custom Forms Using Form Fragments
:link: ./using-fragments/personalizing-custom-forms-using-form-fragments.md
:::

:::{grid-item-card} Creating Dropdown Menus with Fragments
:link: ./using-fragments/creating-dropdown-menus-with-fragments.md
:::

:::{grid-item-card} Duplicating Fragments
:link: ./using-fragments/duplicating-fragments.md
:::

:::{grid-item-card} Saving Fragment Compositions
:link: ./using-fragments/saving-fragment-compositions.md
:::

:::{grid-item-card} Managing Fragments
:link: ./using-fragments/managing-fragments.md
:::

:::{grid-item-card} Propagating Fragment Changes
:link: ./using-fragments/propagating-fragment-changes.md
:::
::::
