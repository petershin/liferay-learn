# Liferayフロントエンドの［メニューを追加］

［メニューを追加］タグは、1つまたは複数のアイテムに対し［メニューを追加］ボタンを作成します。 これはエンティティを追加するアクション（新しいブログエントリなど）に使用され、管理バーの一部です。 `<liferay-frontend:add-menu>`タグを使用して［メニューを追加］を作成し、各アイテムに`<liferay-frontend:add-menu-item>`タグをネストします。

```{note}
このパターンは、@product-ver@で廃止予定になりました。 代わりに、Clay管理ツールバーの[メニューの作成パターン](/docs/7-2/reference/-/knowledge_base/r/clay-management-toolbar#creation-menu)を使用することをお勧めします。
```

メニューに1つの項目がある場合、以下のブログ管理アプリの例に示すように、ボタンがその項目のアクションをトリガーします。

```jsp
<liferay-frontend:management-bar>
  <liferay-frontend:management-bar-buttons>
      ...
      <liferay-frontend:add-menu
        inline="<%= true %>"
      >
        <liferay-frontend:add-menu-item
          title='<%= LanguageUtil.get(request, "add-blog-entry") %>'
          url="<%= addEntryURL %>"
        />
      </liferay-frontend:add-menu>

  </liferay-frontend:management-bar-buttons>
</liferay-frontend:management-bar>
```

![追加ボタンのパターンは、<code>add-menu</code>タグと少なくとも1つの<code>add-menu-item</code>タグで構成されます。](./liferay-frontend-add-menu/images/01.png)

メニューに複数の項目がある場合、それらはポップアップメニューに表示されます。 たとえば、掲示板管理アプリケーションの構成は次のとおりです。

```jsp
<liferay-frontend:add-menu>
    ...
    <liferay-frontend:add-menu-item title='<%= LanguageUtil.get(request,
    "thread") %>' url="<%= addMessageURL.toString() %>" />
    ...
    <liferay-frontend:add-menu-item title='<%= LanguageUtil.get(request,
    (categoryId == MBCategoryConstants.DEFAULT_PARENT_CATEGORY_ID) ?
    "category[message-board]" : "subcategory[message-board]") %>'
    url="<%= addCategoryURL.toString() %>" />
    ...
</liferay-frontend:add-menu>
```

![追加ボタンのパターンは、<code>add-menu</code>タグと少なくとも1つの<code>add-menu-item</code>タグで構成されます。](./liferay-frontend-add-menu/images/02.png)

上記の例では、使用可能な属性のいくつかを使用しています。 タグで使用可能な属性の完全なリストについては、「[メニューを追加](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/add-menu.html)」および「[メニュー項目の追加](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/add-menu-item.html)」のtaglibdocを参照してください。

## 関連トピック

* [Liferay Frontend Cards](./liferay-frontend-cards.md)
* [Liferay Frontend Info Bar](./liferay-frontend-info-bar.md)
* [Liferay Frontend Management Bar](./liferay-frontend-management-bar.md)