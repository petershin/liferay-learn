---
toc:
- ./clay-tag-library/clay-alerts.md
- ./clay-tag-library/clay-badges.md
- ./clay-tag-library/clay-buttons.md
- ./clay-tag-library/clay-cards.md
- ./clay-tag-library/clay-dropdown-and-action-menus.md
- ./clay-tag-library/clay-form-elements.md
- ./clay-tag-library/clay-icons.md
- ./clay-tag-library/clay-links-and-labels.md
- ./clay-tag-library/clay-management-toolbar.md
- ./clay-tag-library/clay-navigation-bars.md
- ./clay-tag-library/clay-progress-bars.md
- ./clay-tag-library/clay-stickers.md
---
# Clayタグライブラリ

Liferay Clayタグライブラリは、アプリで [Clay](https://clayui.com/) UIコンポーネントを作成するためのタグのセットを提供します。

```{note}
AUI taglibは、@product-ver@で廃止予定になりました。 将来の互換性の問題を回避するために、Clay taglibを使用することをお勧めします。
```

アプリでClay taglibを使用するには、JSPに次の宣言を追加します。

```jsp
<%@ taglib prefix="clay" uri="http://liferay.com/tld/clay" %>
```

Liferay Clay taglibは、FreeMarkerテーマテンプレートおよびWebコンテンツテンプレートのマクロを介して使用することもできます。 次の構文に従います。

```
[@clay["tag-name"] attribute="string value" attribute=10 /]
```

Clay taglibは、アプリに次のUIコンポーネントを提供します。

* [警告](clay-tag-library/clay-alerts.md)
* [バッジ](clay-tag-library/clay-badges.md)
* [ボタン](clay-tag-library/clay-buttons.md)
* [カード](clay-tag-library/clay-cards.md)
* [ドロップダウンメニューとアクションメニュー](clay-tag-library/clay-dropdown-and-action-menus.md)
* [フォーム要素](clay-tag-library/clay-form-elements.md)
* [アイコン](clay-tag-library/clay-icons.md)
* [ラベルとリンク](clay-tag-library/clay-links-and-labels.md)
* [管理ツールバー](clay-tag-library/clay-management-toolbar.md)
* [ナビゲーションバー](clay-tag-library/clay-navigation-bars.md)
* [進捗バー](clay-tag-library/clay-progress-bars.md)
* [ステッカー](clay-tag-library/clay-stickers.md)

このセクションでは、Clay taglibを使用してこれらのコンポーネントを作成する方法について説明します。 各記事には、サンプルのClayコンポーネントのセットと結果のUIのスクリーンショットが含まれています。
