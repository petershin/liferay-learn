# レイアウト要素の使用

{bdg-secondary}`Liferay 7.4 U22+/GA22+ 用`

レイアウト要素は、ページやテンプレートのレイアウトをデザインするためのドロップゾーンを定義します。 デフォルトでは、Liferayは2つのレイアウト要素を含んでいます： [Containers](#containers) と [Grids](#grids)です。 一度追加すれば、ウィジェットや他のフラグメントをこれらのドロップゾーンにドラッグ＆ドロップすることができ、さらに複雑なレイアウトを作成するための追加コンテナやグリッドも含まれます。 レイアウトをデザインしたら、レイアウト構成を保存して、他のページやテンプレートで再利用できます。 詳細については、[Saving Fragment Compositions](./saving-fragment-compositions.md)を参照してください。

![コンテナとグリッドのフラグメントは、ページのレイアウトをデザインするためのものです。](./using-layout-elements/images/01.png)

フラグメントをサポートする新しいページやテンプレートを作成すると、デフォルトのドロップゾーンが表示されます。 この領域にはどのフラグメントを追加してもよいが、コンポジションの最初の要素としてコンテナ・フラグメントを使用すると、重要な利点がある：

* [、高度なコンポジション](./saving-fragment-compositions.md#creating-advanced-compositions-with-the-container-fragment) （Liferay DXP 7.4+）のためのフレックス表示プロパティを含む、ページデザインのより大きなレイアウト制御。
* [](./saving-fragment-compositions.md) のコンポジションを保存し、他のページやテンプレートで素早く再利用する。
* フラグメント構文にURLまたはページリダイレクトを追加する
* [スタイルブック](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) を活用し、サイトの外観を標準化する。

コンテナを追加したら、グリッドフラグメントを使用して、さまざまなビューポート用にコンテンツのレイアウトをカスタマイズできます。 詳細については、[Building Responsive Layouts with the Grid Fragment](./../../../optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md)を参照してください。

```{tip}
コンテナやグリッドに要素をドラッグ＆ドロップすると、Liferayはドロップゾーンをハイライトして配置場所を示します。 一度追加した要素は、ブラウザのサイドパネル ( ![Browser](../../../../images/icon-hierarchy.png) ) でドラッグ＆ドロップして並べ替えることができます。
```

最後に、ページ上にさまざまな要素が入れ子になっている場合、入れ子階層内の要素をたどるのに役立つパンくずが表示されます。

![パンくずシステムを使用して、構造内を移動し、親要素を選択する。](./using-layout-elements/images/04.png)

```{tip}
要素を選択し、ショートカット `Shift + Enter` でその親を選択することもできます。
```

## コンテナ

> 以前の名称 *パネル*

コンテナ・フラグメントは、設定可能なドロップ・ゾーンをコンテンツ・ページに追加します。 標準的な設定オプションに加えて、コンテナのHTMLタグや表示構造などを設定することができます。 詳しくは、[フラグメントの設定](./configuring-fragments.md)を参照してください。

![コンテナには、標準的な構成オプションと独自の構成オプションがあります。](./using-layout-elements/images/02.png)

## グリッド

> 以前の名称は *Rows*

グリッドフラグメントは、ページやテンプレートに複数のドロップゾーンモジュールを追加します。 これらのモジュールは、水平および垂直に配置できます。 標準的な設定オプションに加えて、各グリッドのモジュール数、行ごとのモジュール数、各モジュールのコンテンツの垂直方向の配置を決定できます。 各モジュールの幅を手動で調整し、モジュール間のパディングを追加または削除することができます。 詳しくは、[フラグメントの設定](./configuring-fragments.md)を参照してください。

![グリッドには、標準と独自の構成オプションがあります。](./using-layout-elements/images/03.png)

## 関連トピック

* [デフォルトのフラグメントリファレンス](./default-fragments-reference.md)
* [Saving Fragment Compositions](./saving-fragment-compositions.md)
* [フラグメントの設定](./configuring-fragments.md)
