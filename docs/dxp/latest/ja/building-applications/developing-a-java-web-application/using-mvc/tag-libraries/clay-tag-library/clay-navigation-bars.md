# Clayナビゲーションバー

ドロップダウンメニューと同様に、ナビゲーションバーにはナビゲーションアイテムのリストが表示されます。 主な違いは、ナビゲーションバーが水平バーに表示され、すべてのナビゲーションアイテムが常に表示されることです。 また、ナビゲーションバーでは、アクティブなナビゲーション項目が下線で表示されます。 ナビゲーションバーには2つのスタイルがあります。白の背景に濃い灰色のテキスト（デフォルト）と濃い灰色の背景に白のテキスト（反転）です。

デフォルトのナビゲーションバー：

```jsp
<clay:navigation-bar 
    navigationItems="<%= navigationBarsDisplayContext.getNavigationItems() %>" 
/>
```

![アプリにナビゲーションバーを含めることができます。](./clay-navigation-bars/images/01.png)

反転ナビゲーションバー（ `inverted`属性を`true`に設定）：

```jsp
<clay:navigation-bar 
    inverted="<%= true %>" 
    navigationItems="<%= navigationBarsDisplayContext.getNavigationItems() %>" 
/>
```

![必要に応じて、ナビゲーションバーを反転させることができます。](./clay-navigation-bars/images/02.png)

## 関連トピック

* [Clayドロップダウンメニューとアクションメニュー](./clay-dropdown-and-action-menus.md)
* [Clayフォーム要素](./clay-form-elements.md)
* [Clay進捗バー](./clay-progress-bars.md)