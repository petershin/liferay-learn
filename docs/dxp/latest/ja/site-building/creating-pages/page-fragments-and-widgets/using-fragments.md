---
toc:
- ./using-fragments/default-fragments-reference.md
- ./using-fragments/using-layout-elements.md
- ./using-fragments/configuring-fragments.md
- ./using-fragments/mapping-and-linking-fragment-elements.md
- ./using-fragments/configuring-fragment-visibility.md
- ./using-fragments/editing-fragment-elements.md
- ./using-fragments/creating-dropdown-menus-with-fragments.md
- ./using-fragments/duplicating-fragments.md
- ./using-fragments/saving-fragment-compositions.md
- ./using-fragments/managing-fragments.md
- ./using-fragments/propagating-fragment-changes.md
---

# フラグメントの使用

```{toctree}
:maxdepth: 3

using-fragments/default-fragments-reference.md
using-fragments/using-layout-elements.md
using-fragments/configuring-fragments.md
using-fragments/mapping-and-linking-fragment-elements.md
using-fragments/configuring-fragment-visibility.md
using-fragments/editing-fragment-elements.md
using-fragments/creating-dropdown-menus-with-fragments.md
using-fragments/duplicating-fragments.md
using-fragments/saving-fragment-compositions.md
using-fragments/managing-fragments.md
using-fragments/propagating-fragment-changes.md
```

ページ **フラグメント** は、拡張可能で再利用可能なドラッグアンドドロップ要素であり、[コンテントページ](../using-content-pages.md)とテンプレート（[マスター](../defining-headers-and-footers/master-page-templates.md)、[ページ](../adding-pages/creating-a-page-template.md)、[表示ページ](../../displaying-content/using-display-page-templates/about-display-page-templates-and-display-pages.md)など）の作成に使用できます。 フラグメントはCSS、HTML、およびJavaScriptを使用して構築されており、ページに構造と機能の両方を提供できます。

![フラグメントを使用してコンテンツページとテンプレートを作成します。](./using-fragments/images/01.png)

Liferayは、すぐに使用できるさまざまなフラグメントを提供しています。 ただし、[ページフラグメントエディタ](../../developer-guide/reference/fragments/page-fragment-editor-interface-reference.md)または[フラグメントツールキット](../../developer-guide/developing-page-fragments/using-the-fragments-toolkit.md)を使用してカスタムフラグメントを開発することもできます。 さらに、 [Liferayウィジェットをフラグメントに埋め込んだり](../../developer-guide/reference/fragments/fragment-specific-tags-reference.md#including-widgets-within-a-fragment) 、編集可能なフィールドを追加したりできます。 詳細については、[Developing Page Fragments](../../developer-guide/developing-page-fragments/developing-fragments-intro.md)を参照してください。

すべてのページフラグメントはセットに編成され、管理と使用を容易にするために関連するフラグメントをグループ化します。 各フラグメントセットには、フラグメントのコードで直接参照できるリソースを含めることもできます。 詳細については、[Including Default Resources in Page Fragments](../../developer-guide/developing-page-fragments/including-default-resources-with-fragments.md)を参照してください。

ページまたはテンプレートにフラグメントを追加した後、フラグメントとそのサブ要素を構成したりカスタマイズしたりできます。 これらのオプションは異なる場合がありますが、一部はすべてに共通です。 使用可能なオプションの詳細については、 [フラグメントの設定](./using-fragments/configuring-fragments.md) を参照してください。

::::{grid} 2 :gutter: 3 3 3 3

:::{grid-item-card} デフォルトフラグメントのリファレンス
:link: ./using-fragments/default-fragments-reference.md
:::

:::{grid-item-card} レイアウト要素の使用
:link: ./using-fragments/using-layout-elements.md
:::

:::{grid-item-card} フラグメントの設定

* [一般設定リファレンス](using-fragments/configuring-fragments/general-settings-reference.md)
* [スタイルリファレンス](using-fragments/configuring-fragments/styles-reference.md)
* [フラグメントサブ要素リファレンス](using-fragments/configuring-fragments/fragment-sub-elements-reference.md) :::

:::{grid-item-card} フラグメント要素のマッピングとリンク
:link: ./using-fragments/mapping-and-link-fragment-elements.md
:::

:::{grid-item-card} フラグメントの閲覧の構成
:link: ./using-fragments/configuring-fragment-visibility.md
:::

:::{grid-item-card} フラグメント要素の編集
:link: ./using-fragments/editing-fragment-elements.md
:::

:::{grid-item-card} フラグメントを使ったドロップダウンメニューの作成
:link: ./using-fragments/creating-dropdown-menus-with-fragments.md
:::

:::{grid-item-card} フラグメントの複製
:link: ./using-fragments/duplicating-fragments.md
:::

:::{grid-item-card} フラグメントコンポジションの保存
:link: ./using-fragments/saving-fragment-compositions.md
:::

:::{grid-item-card} フラグメントの管理
:link: ./using-fragments/managing-fragments.md
:::

:::{grid-item-card} フラグメントの変更の伝播
:link: ./using-fragments/propagating-fragment-changes.md
::: ::::