# Liferayフロントエンド情報バー

情報バーには、サイドバーの追加情報の表示を切り替えるボタンがあります。 これは、ファイルサイズ、タイプ、URLなど、検索結果のより詳細なメタデータを提供するのに最適です。

![情報バータグは、追加情報を表示するサイドバーパネルのトグルを作成します。](./liferay-frontend-info-bar-intro/images/01.png)

構成には、情報バー（およびボタン）とサイドバーパネルの2つの重要な部分があります。

情報バー：

```jsp
<liferay-frontend:info-bar>
  <liferay-frontend:info-bar-buttons>
    <liferay-frontend:info-bar-sidenav-toggler-button
      icon="info-circle"
      label="my info"
    />
  </liferay-frontend:info-bar-buttons>
</liferay-frontend:info-bar>
```

`<liferay-frontend:info-bar-sidenav-toggler-button>`タグは、`icon`属性に[Clayアイコン](../clay-tag-library/clay-icons.md)を使用します。

サイドバーパネル：

```jsp
<div class="closed container-fluid-1280 sidenav-container sidenav-right" id="<portlet:namespace />infoPanelId">
    <liferay-frontend:sidebar-panel>
      <div>
      <h2>sidebar content</h2>
      <p>Here is some content</p>
      </div>
    </liferay-frontend:sidebar-panel>
</div>
```

サイドバーパネルのラッパー`<div>`に、クラス`closed`と`sidenav-right`があることに注目してください。 情報ボタンは、クラス`open`と`closed`を切り替え、サイドバーパネルの表示と非表示を切り替えます。 `sidenav-right`クラスは、パネルが右側で開く必要があることを指定しています。

![情報バータグは、追加情報を表示するサイドバーパネルのトグルを作成します。](./liferay-frontend-info-bar-intro/images/02.png)

上記の例では、使用可能な属性のいくつかを使用しています。 タグで使用可能な属性の完全なリストについては、 [情報バー](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/info-bar.html) 、 [情報バーボタン](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/info-bar-buttons.html) 、 [情報バーサイドナビゲーショントグルボタン](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/info-bar-sidenav-toggler-button.html) 、および [サイドバーパネル](https://docs.liferay.com/ce/apps/frontend-taglib/latest/taglibdocs/liferay-frontend/sidebar-panel.html) のtaglibdocを参照してください。

## 関連トピック

* [Liferayフロントエンドの［メニューを追加］](./liferay-frontend-add-menu.md)
* [Liferayフロントエンドカード](./liferay-frontend-cards.md)
* [Liferayフロントエンド管理バー](./liferay-frontend-management-bar.md)