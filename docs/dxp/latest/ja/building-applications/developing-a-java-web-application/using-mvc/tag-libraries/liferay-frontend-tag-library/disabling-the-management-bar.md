# 管理バーのすべてまたは一部を無効にする

表示する検索結果がない場合は、sidenavのトグルボタンを除くすべての管理バーのボタンを無効にする必要があります。

`disabled`属性を`liferay-frontend:management-bar`タグに追加することで、管理バーを無効にできます。

```jsp
<liferay-frontend:management-bar
        disabled="<%= total == 0 %>"
        includeCheckBox="<%= true %>"
        searchContainerId="<%= searchContainerId %>"
>
```

対応するタグに`disabled`属性を追加して、個々のコンポーネントを無効にすることもできます。 次の例では、表示する結果がない場合に表示スタイルを変更しても効果がないため、検索コンテナに表示される結果が0件の場合に表示ボタンを無効にします。

```jsp
<liferay-frontend:management-bar-display-buttons
        disabled="<%= total == 0 %>"
        displayViews='<%= new String[] {"descriptive", "icon", "list"} %>'
        portletURL="<%= changeDisplayStyleURL %>"
        selectedDisplayStyle="<%= displayStyle %>"
/>
```

![管理バーのすべてまたは一部を無効にできます。](./disabling-the-management-bar/images/01.png)

## 関連トピック

* [管理バーにアクションを含める](./including-actions-in-the-management-bar.md)
* [Clay管理ツールバー](../clay-tag-library/clay-management-toolbar.md)