---
uuid: ee58e0f2-05fb-46aa-b058-90e7b7dcf21c
---
# Defining Content Relationships

When creating new content, you can define relationships between assets even if they don't share any tags and aren't in the same category. Related Assets puts related content at your users' fingertips.

Before creating a relationship, you must create web content first:

1. Go to *Product Menu*(![Product Menu icon.](../../images/icon-product-menu.png)) &rarr; *Web Content*.

1. Click *New* (![Add icon.](../../images/icon-add.png)), then *Basic Web Content*.

1. Give your new web content a name and a short description.

Now you can create relationships to this content. 

 1. Go to *Product Menu* (![Product Menu icon.](../../images/icon-product-menu.png)) and navigate to *Blogs*.

 1. Click *Add Blog Entry* (![Add icon.](../../images/icon-add.png)).

 1. Give your new blog entry a title and fill in the *Content* field.

1. Now define the relationship with the web content you just created. Click *Related Assets*.

1. Click *Select*. From here you can choose from any asset category that Liferay provides.

![Click Related Assets and the drop-down menu appears.](./defining-content-relationships/images/01.png)

1. Click *Basic Web Content*. The content you created previously appears.

1. Check the box next the web content, then click *Done*.

1. The relationship is now established! Click *Publish*. 

## Using the Related Assets Widget

Once relationships are created, you can display them with the Related Assets Widget. By default, the Related Assets widget shows assets related to the asset displayed in the Asset Publisher. If you don’t want to show every related asset, you can configure what content relationships to display. To do this, follow these steps:

1. Go to the page editor, then click *Widgets* and search for the Asset Publisher widget on *Fragments and Widgets*. After adding it to the page, configure it to display the blog entry created previously. If you need more information, see [Using the Asset Publisher Widget](../../../../../dxp/latest/en/site-building/displaying-content/using-the-asset-publisher-widget.md)

1. Add the Related Assets widget to the page, next to the Asset Publisher widget.

1. Select *Options* (![Options icon](../../images/icon-actions.png)) in the upper right corner of the Related Assets widget and click *Configuration*.

1. Under the Asset Selection tab, set the type of asset(s) to display using the Asset Type menu. The default value is set to Any.

1. You can narrow the scope of the app to display any single category of asset type or select multiple assets from the menu.

Filter options set minimum requirements for displaying assets by their categories, tags, and custom fields. Ordering and Grouping organizes assets using the same criteria. Display settings customize how the widget shows assets: by title, in a table, by abstract, or full content. You can convert assets to different document types like ODT, PDF, and RTF. You can choose to show metadata fields such as author, modification date, tags, and view count. You can even enable RSS subscriptions and customize their display settings.

1. When you’re finished setting the Source and Filter options, click *Save*.

1. Click *Publish*. The Related assets to the entry appear when you click it.

![Click on the entry and the related assets appear.](./defining-content-relationships/images/02.png)

## Related Topics

* [Using the Asset Publisher Widget](../../../../../dxp/latest/en/site-building/displaying-content/using-the-asset-publisher-widget.md)
* [Assets](assets.md)
* [Configuring Widgets](../../../../../dxp/latest/en/site-building/creating-pages/page-fragments-and-widgets/using-widgets/configuring-widgets.md)


