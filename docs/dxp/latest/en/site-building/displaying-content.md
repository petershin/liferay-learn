---
toc:
  - ./displaying-content/collections-and-collection-pages.md
  - ./displaying-content/using-the-asset-publisher-widget.md
  - ./displaying-content/defining-content-relationships.md
  - ./displaying-content/using-display-page-templates.md
  - ./displaying-content/additional-content-display-options.md
  - ./displaying-content/using-information-templates.md
taxonomy-category-names:
- Sites
- Pages and Composition
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: c3605866-6611-43cb-85f3-0f2853f6b5f4
---

# Displaying Content

You can display content in various ways. The option you choose depends on the type of asset you want to display, how many assets you want to display at once, and how you want your content to be viewed. Four key options are available: the Collection Display fragment, the Web Content Display widget, the Asset Publisher widget, and display page templates. The table below compares the key behaviors of these display options:

| Behavior                                       | Collection Display | Web Content Display | Asset Publisher | Display Pages |
|:-----------------------------------------------|:------------------:|:-------------------:|:---------------:|:-------------:|
| Display individual content                     |      &#10008;      |      &#10004;       |    &#10008;     |   &#10004;    |
| Supports multiple content types                |      &#10004;      |      &#10004;       |    &#10004;     |   &#10008;    |
| Supports Manual content selection              |      &#10004;      |      &#10004;       |    &#10004;     |   &#10004;    |
| Display multiple pieces of content             |      &#10004;      |      &#10008;       |    &#10004;     |   &#10008;    |
| Supports Dynamic content selection             |      &#10004;      |      &#10008;       |    &#10004;     |   &#10008;    |
| Displays content on its own page               |      &#10008;      |      &#10008;       |    &#10008;     |   &#10004;    |
| Provides a unique friendly URL for web content |      &#10008;      |      &#10008;       |    &#10008;     |   &#10004;    |

## Collection Display Fragment

The Collection Display fragment displays a single [collection](./displaying-content/collections-and-collection-pages.md) of assets. This fragment gives you all the flexibility of collections, which can manually or dynamically include assets (from one or multiple asset types). Read [Displaying Collections](./displaying-content/collections-and-collection-pages/displaying-collections.md) to learn more.

## Web Content Display Widget

The [Web Content Display widget](./displaying-content/additional-content-display-options/using-the-web-content-display-widget.md) displays individual web content articles. It provides customizable features that you can enable for users, such as comments and print options.

## Asset Publisher

The [Asset Publisher widget](./displaying-content/using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md) displays multiple pieces of content at a time. It can display any kind of asset. You can specify which assets to display. For instance you can display only assets that meet specific conditions, such as specific tags or keywords. You can manually create a static collection of assets, or you can configure it to select content dynamically on the fly.

## Display Page Template

A [display page template](./displaying-content/using-display-page-templates.md) defines how your web content is organized and formatted on a page. When the full web content is viewed through the Asset Publisher widget or its friendly URL, it's displayed on its own page, based on the display page template.

## Other Methods

If you must embed content from another URL, you can [use the Iframe widget](./displaying-content/additional-content-display-options/using-the-iframe-widget.md). For instance, you can include multimedia (videos, interactive elements, etc.) or display advertisements in the widget.
