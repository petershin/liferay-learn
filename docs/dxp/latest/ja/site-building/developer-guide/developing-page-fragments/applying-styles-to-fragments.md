# フラグメントへのスタイル適用

ページにフラグメントを追加すると、サイドバーメニューを使って、 [**スタイル** 設定タブ](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md#styles) を含む、フラグメントを設定することができます。

![The Styles tab in the sidebar menu allows you to configure the styles per fragment on a page.](./applying-styles-to-fragments/images/01.png)

デフォルトでは、すべてのスタイル（色、スペーシングなどを含む。） はフラグメント全体に適用される。 フラグメントに含まれる要素は、そのCSSが許可していればこれらの変更を継承し、そうでなければ内側の要素は無視される。

## スタイルの適用方法を変更する

{bdg-secondary}`Liferay 7.4 U31+ and GA31+`

スタイルの適用方法を変更するには、フラグメントのHTML設定を変更する必要があります。フラグメントに含まれる要素に `data-lfr-styles` 属性を追加すると、その要素に適用されるスタイルが特定の要素に適用されるようになります。 **1つのフラグメントにつき、`data-lfr-styles` 属性は1つだけ使用できます。**

例えば、このHTMLでシンプルなカスタムフラグメントを構成し、スタイル変更を適用すると、フラグメント全体に適用されます（レンダリング時にHTMLを囲むために、外側に`<div>`タグを追加します）：

```html
<a class="btn btn-nm btn-primary" data-lfr-editable-id="link" data-lfr-editable-type="link">
    Editable link.
</a>
```

この例のフラグメントの背景色を黒に変更すると、通常バックエンドでスタイル用に作成される外側の `<div>` にもその変更が適用される。 UIではこのように見える：

![Without the data-lfr-styles attribute, the background color applies to the entire fragment, creating an undesirable effect.](./applying-styles-to-fragments/images/02.png)

しかし、`data-lfr-styles`属性をフラグメント内の内部要素の1つに追加すれば、スタイルの変更をその特定の要素に適用することができます。 これを利用して、その変更に最も意味のある要素を選ぶことができる。

上記の例では、ボタン要素のHTMLタグに属性を追加することができます：

```html
<a data-lfr-styles class="btn btn-nm btn-primary" data-lfr-editable-id="link" data-lfr-editable-type="link">
    Editable link.
</a>
```

これにより、スタイルの変更はフラグメントのその部分に適用される。 ここで背景色を黒に変えると、選択した要素の色が具体的に変わる：

![The data-lfr-styles attribute in this example applies the background color specifically to the button in the fragment.](./applying-styles-to-fragments/images/03.png)

```{note}
フラグメントに `data-lfr-styles` 属性を追加しても、すでにページに追加されているフラグメントのインスタンスには影響しません。 詳しくは [フラグメントの変更の伝播](../../creating-pages/page-fragments-and-widgets/using-fragments/propagating-fragment-changes.md) を参照のこと。
```

```{warning}
編集可能な要素（`data-lfr-editable`または `lfr-editable`属性を使用）に含まれるタグに `data-lfr-styles` 属性を使用することはできません。 これらの編集可能なタグに含まれるフラグメントの一部に `data-lfr-styles` を追加した場合、それは無視されます。
```

`data-lfr-styles`属性は、フラグメントを編集する際にお好きな方法で追加することができます：

* **Using the [Fragments Editor](./using-the-fragments-editor.md) in the UI** : エディターのHTMLウィンドウで変更を行う。
* **[Fragments Toolkit](./using-the-fragments-toolkit.md)** を使用する：フラグメントの`index.html`ファイルを変更する。

## 関連トピック

* [フラグメントの開発](./developing-fragments-intro.md) 
* [フラグメントエディターの使い方](./using-the-fragments-editor.md)
* [フラグメントツールキットの使用](./using-the-fragments-toolkit.md)
* [フラグメントへの設定オプションの追加](./adding-configuration-options-to-fragments.md)
* [フラグメントの設定](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md)
