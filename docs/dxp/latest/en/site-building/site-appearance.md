---
toc:
  - ./site-appearance.md
  - ./creating-pages/defining-headers-and-footers/master-page-templates.md
  - ../liferay-development/customizing-liferays-look-and-feel/themes.md
  - ./site-appearance/style-books.md
taxonomy-category-names:
- Sites
- Site Appearance and Design
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 4bdf5e37-c37a-4cce-9cbc-5dcbc3cdc9b6
---

# Site Appearance

You can customize the design and functionality of a Liferay site in several different ways. The table below shows the Liferay tools you can use:

| Features                                | Style Books | Master Page Templates | Themes |
|-----------------------------------------|:-----------:|:---------------------:|:------:|
| Embed common fragments/widgets          |             |           ✓           |    ✓   |
| Define common layouts for pages         |             |           ✓           |    ✓   |
| Managed through the UI                  |      ✓      |           ✓           |        |
| Customize styles, spacing, colors, etc. |      ✓      |                       |    ✓   |
| Add extra functionality                 |             |                       |    ✓   |

## Master Page Templates

With [Master Page Templates](creating-pages/defining-headers-and-footers/master-page-templates.md), you can define common elements for your pages using fragments, especially headers and footers. Use them to conform any number of pages on your site to the look and feel you design.

![Master Page Templates are a simple way to define elements common to all of your pages, such as headers and footers.](./site-appearance/images/01.png)

## Style Books

[Style Books](site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) are visual standards defined for a site, such as standard colors and spacing. With *Style Books*, you can design every page's layout independently while maintaining a consistent experience between each of them.

![Style Books define the rules for your Site's appearance, such as text colors.](./site-appearance/images/02.png)

<!--
TODO:

### Frontend Token Definitions

Note how they tie into themes as well (depending on them for definitions), possibly? And then maybe link to developer guide articles? (Unless maybe developer guide material is not good to go into for this overview... then perhaps it'd be better to just briefly reference their reliance on the theme and leave it as that, not even with an H3)
-->

## Widget/Fragment Appearance

Fragments and widgets are the building blocks of your site. There are many ways to customize them to suit your site's appearance.

- [Fragment customizations](./developer-guide/developing-page-fragments.md) can be used to tailor the look and feel of your site's fragment pages.

- Application Display Templates<!--Add link when available--> can customize the appearance and behavior of the widgets on your site.

## Themes

[Themes](../liferay-development/customizing-liferays-look-and-feel/themes.md) are a frontend developer's tool for customizing the default look and feel of your site. They provide a foundation that your [Style Books](#style-books) and [Page Templates](creating-pages/adding-pages/creating-a-page-template.md) can extend. You can also embed widgets in a theme to ensure a particular arrangement.

!!! note
    Themes are not supported in Liferay SaaS.

![Choosing a theme for your site's pages can significantly alter your site's look and feel.](./site-appearance/images/03.png)
