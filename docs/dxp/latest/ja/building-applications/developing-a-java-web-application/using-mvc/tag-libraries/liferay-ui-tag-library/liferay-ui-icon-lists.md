# Liferay UIアイコンリスト

アイコンリストは、 [アイコンメニュー](https://help.liferay.com/hc/ja/articles/360029145151-Liferay-UI-Icon-Menus) のようなポップアップナビゲーションメニューではなく、水平リストにアイコンを表示します。 掲示板スレッドでアイコンリストメニューの例を確認できます。 スレッドのアクションは、管理者に常に表示されます。

![アイコンリストには、アプリのアクションが常に表示されます。](./liferay-ui-icon-lists/images/01.png)

以下に示すように、`liferay-ui:icon-list`タグと各リストアイテムのネスト [アイコン](https://help.liferay.com/hc/ja/articles/360028832232-Liferay-UI-Icons) を使用してリストメニューを作成します。

```jsp
<div class="thread-actions">
    <liferay-ui:icon-list>

        <liferay-ui:icon
        iconCssClass="icon-lock"
        message="permissions"
        method="get"
        url="<%= permissionsURL %>"
        useDialog="<%= true %>"
        />

        <liferay-rss:rss
        delta="<%= rssDelta %>"
        displayStyle="<%= rssDisplayStyle %>"
        feedType="<%= rssFeedType %>"
        url="<%= MBRSSUtil.getRSSURL(plid, 0, message.getThreadId(), 0, themeDisplay) %>"
        />

        <liferay-ui:icon
        iconCssClass="icon-remove-sign"
        message="unsubscribe"
        url="<%= unsubscribeURL %>"
        />

        <liferay-ui:icon
        iconCssClass="icon-lock"
        message="lock"
        url="<%= lockThreadURL %>"
        />

        <liferay-ui:icon
        iconCssClass="icon-move"
        message="move"
        url="<%= editThreadURL %>"
        />

        <liferay-ui:icon-delete
        showIcon="<%= true %>"
        trash="<%= trashHelper.isTrashEnabled(themeDisplay.getScopeGroupId()) %>"
        url="<%= deleteURL %>"
        />
    </liferay-ui:icon-list>
</div>
```

使用可能な属性の完全なリストについては、 [Icon List taglibdocs](https://help.liferay.com/hc/ja/articles/360029145131-Liferay-UI-Icon-Lists) を参照してください。

## 関連トピック

* [Clayアイコン](../clay-tag-library/clay-icons.md)
* [Liferay UIアイコンメニュー](./liferay-ui-icon-menus.md)
* [Liferay UIアイコン](./liferay-ui-icons.md)
