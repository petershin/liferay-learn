# Liferayフロントエンド管理バー

管理バーを使用すると、管理者は検索コンテナの結果を制御できます。 検索結果の表示形式をフィルタリング、並べ替え、選択できるため、ドキュメント、Webコンテンツ、アセットエントリーなど、アプリ内で探しているものをすばやく特定できます。 管理バーは完全にカスタマイズ可能であるため、すべてのコントロールまたはアプリに必要なコントロールのみを実装できます。

![管理バーを使用すると、ユーザーはアプリがコンテンツを表示する方法をカスタマイズできます。](./liferay-frontend-management-bar/images/01.png)

```{note}
Liferayフロントエンド管理バーは@product-ver@で廃止予定になりました。 代わりに、[Clay管理ツールバー](../clay-tag-library/clay-management-toolbar.md)を使用することをお勧めします。
```

管理バーにはいくつかの重要なセクションがあります。 各セクションは、さまざまなtaglibを使用してグループ化および構成されます。

[`<liferay-frontend:management-bar-buttons>`タグ](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/management-bar-buttons.html) は、管理バーのボタン要素をラップします。

![<code>management-bar-buttons</code>タグには、管理バーのメインボタンが含まれています。](./liferay-frontend-management-bar/images/02.png)

[`<liferay-frontend:management-bar-sidenav-toggler-button>`タグ](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/management-bar-sidenav-toggler-button.html)  は、情報ボタンのスライドアウトナビゲーションを実装します。

[`<liferay-frontend:management-bar-display-buttons>`タグ](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/management-bar-display-buttons.html) は、アプリの表示形式オプションをレンダリングします。

![<code>management-bar-display-buttons</code>タグには、コンテンツの表示オプションが含まれています。](./liferay-frontend-management-bar/images/03.png)

[`<liferay-frontend:management-bar-filters>`タグ](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/management-bar-filters.html) は、アプリのフィルタリングオプションをラップします。 このフィルターは、すべてのコントロールパネルアプリケーションに含まれている必要があります。 フィルタリングオプションには、ソート条件、ソート順序などを含めることができます。

![<code>management-bar-filters</code>タグには、コンテンツフィルタリングオプションが含まれています。](./liferay-frontend-management-bar/images/04.png)

最後に、[`<liferay-frontend:management-bar-action-buttons>`タグ](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/management-bar-action-buttons.html)は、選択したアイテムに対して実行できるアクションをラップします。 ページ間で複数の項目を選択できます。 管理バーには、選択された項目の数が記録されます。

![管理バーには、選択された項目が記録され、それらに対して実行するアクションが表示されます。](./liferay-frontend-management-bar/images/05.png)

たとえば、ゴミ箱アプリの管理バーの構成は次のとおりです。

```jsp
<liferay-frontend:management-bar
   includeCheckBox="<%= true %>"
   searchContainerId="trash"
>
   <liferay-frontend:management-bar-buttons>
       <liferay-frontend:management-bar-sidenav-toggler-button />

       <liferay-portlet:actionURL name="changeDisplayStyle"
       varImpl="changeDisplayStyleURL">
           <portlet:param name="redirect" value="<%= currentURL %>" />
       </liferay-portlet:actionURL>

       <liferay-frontend:management-bar-display-buttons
           displayViews='<%= new String[] {"descriptive", "icon",
           "list"} %>'
           portletURL="<%= changeDisplayStyleURL %>"
           selectedDisplayStyle="<%= trashDisplayContext.getDisplayStyle()
           %>"
       />
   </liferay-frontend:management-bar-buttons>

   <liferay-frontend:management-bar-filters>
       <liferay-frontend:management-bar-navigation
           navigationKeys='<%= new String[] {"all"} %>'
           portletURL="<%= trashDisplayContext.getPortletURL() %>"
       />

       <liferay-frontend:management-bar-sort
           orderByCol="<%= trashDisplayContext.getOrderByCol() %>"
           orderByType="<%= trashDisplayContext.getOrderByType() %>"
           orderColumns='<%= new String[] {"removed-date"} %>'
           portletURL="<%= trashDisplayContext.getPortletURL() %>"
       />
   </liferay-frontend:management-bar-filters>

   <liferay-frontend:management-bar-action-buttons>
       <liferay-frontend:management-bar-sidenav-toggler-button />

       <liferay-frontend:management-bar-button href="javascript:;"
       icon="trash" id="deleteSelectedEntries" label="delete" />
   </liferay-frontend:management-bar-action-buttons>
</liferay-frontend:management-bar>
```