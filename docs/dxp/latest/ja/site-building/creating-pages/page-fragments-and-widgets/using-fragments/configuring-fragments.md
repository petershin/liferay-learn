---
toc:
- ./configuring-fragments/general-settings-reference.md
- ./configuring-fragments/styles-reference.md
- ./configuring-fragments/advanced-settings-reference.md
- ./configuring-fragments/fragment-sub-elements-reference.md
- ./configuring-fragments/localizing-fragment-configuration-fields.md
---
# フラグメントの設定

```{toctree}
:maxdepth: 3

configuring-fragments/general-settings-reference.md
configuring-fragments/styles-reference.md
configuring-fragments/advanced-settings-reference.md
configuring-fragments/fragment-sub-elements-reference.md
configuring-fragments/localizing-fragment-configuration-fields.md
```

フラグメントとそのサブエレメントを設定することができます。 利用できるオプションはさまざまですが、共通で利用できるものもあります。 利用可能な設定オプションを表示するには、ページまたはテンプレートの編集を開始し、サイドバーメニューから **ブラウザ** パネル (![Browser](../../../../images/icon-hierarchy.png)) を開きます。 次に、設定するフラグメントまたはサブエレメントをクリックします。 利用可能な設定オプションは、3つのタブで表示されます。一般」、「スタイル」、「詳細」の3つのタブに表示されます。

![利用可能な設定オプションは、3つのタブにグループ化されています。](./configuring-fragments/images/01.png)

一部の設定は、作成された特定のビューポートにスコープされるため、特定のデバイス用にフラグメントを設定して、ページのコンテンツが最適な方法で表示されるようにすることができます。 詳しくは、 [レスポンシブサイトの構築](../../../optimizing-sites/building-a-responsive-site.md) をご覧ください。

一部のフラグメント設定フィールドをローカライズすることができます。 詳細は、[フラグメント設定フィールドのローカライズ](./configuring-fragments/localizing-fragment-configuration-fields.md)を参照してください。

## 共通

Generalタブには、標準的な設定オプション（例：可視性、フレーム）と、各フラグメントに固有のオプションがあります。 詳しくは、 [一般設定リファレンス](./configuring-fragments/general-settings-reference.md) を参照してください。

## スタイル

スタイル] タブには、フラグメントの寸法、背景、ボーダーなど、フラグメントのスタイルを設定するための標準オプションが含まれています。 利用可能なスタイル設定の詳細については、「 [フラグメントスタイルの設定」](./configuring-fragments/styles-reference.md) を参照してください。

## 詳細設定

Advancedタブには、より高度な設定や技術的な設定が含まれています。 これには、検索結果からフラグメントを隠したり、ページ上に生成されるHTMLを変更したりすることが含まれます。 詳しくは、 [詳細設定リファレンス](./configuring-fragments/advanced-settings-reference.md) をご覧ください。

## フラグメントサブ要素設定

多くのフラグメントは、独自の設定オプションを持つサブエレメントを含んでいます。 使用可能なオプションは、サブ要素のタイプによって異なり、［マッピング］、［画像ソース］、および［リンク］のタブに編成されています。 詳しくは、 [フラグメントサブ要素リファレンス](./configuring-fragments/fragment-sub-elements-reference.md) を参照してください。

### マッピング

［マッピング］タブでは、目的のアイテム（Webコンテンツの記事、ドキュメント、ブログなど）を選択し、要素に表示するフィールド（タイトル、作成者、名前など）を指定することで、ページ要素を使用可能なアセットにマップできます。

### 画像ソース

［画像ソース］タブでは、要素の画像を選択し、その解像度を表示し、そのaltテキストを提供できます。

### リンク

［リンク］タブでは、ページ要素にURLを手動で追加するか、使用可能なコンテンツ項目から選択することができます。 目的のターゲット（例：自身、親）を指定することもできます。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 一般設定リファレンス
:link: ./configuring-fragments/general-settings-reference.md
:::

:::{grid-item-card} スタイルリファレンス
:link: ./configuring-fragments/styles-reference.md
:::

:::{grid-item-card} フラグメントサブエレメントリファレンス
:link: ./configuring-fragments/fragment-sub-elements-reference.md
:::

:::{grid-item-card} ローカライズフラグメント設定フィールド
:link: ./configuring-fragments/localizing-fragment-configuration-fields.md
:::
::::
