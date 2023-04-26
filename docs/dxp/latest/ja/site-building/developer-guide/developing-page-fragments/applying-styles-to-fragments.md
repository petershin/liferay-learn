# フラグメントにスタイルを適用する

ページにフラグメントを追加すると、サイドバーメニューを使用して、 [**スタイル** 設定タブ](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md#styles) など、フラグメントを設定することができます。

![サイドバーメニューの「スタイル」タブでは、ページ上のフラグメントごとにスタイルを設定することができます。](./applying-styles-to-fragments/images/01.png)

デフォルトでは、すべてのスタイル（色、スペーシングなどを含む）がフラグメント全体に適用されます。 フラグメントに含まれる要素は、その CSS が許可している場合はこれらの変更を継承し、そうでない場合は内部の要素を無視する。

## スタイルの適用方法を変更する

{bdg-secondary}`利用可能な Liferay 7.4 U31+ および GA31+`

スタイルの適用方法を変更するには、フラグメントの HTML 設定を変更する必要があります。 フラグメントに含まれる要素に `data-lfr-styles` 属性を追加し、それらに適用されるスタイルを、代わりにその特定の要素に適用するようにします。 **`data-lfr-styles` 属性は、1 つのフラグメントにつき 1 つだけ許可される。**

たとえば、このHTMLでシンプルなカスタムフラグメントを構成し、スタイル変更を適用すると、フラグメント全体に適用されます（レンダリング時にHTMLを囲むように外側の `<div>` タグを追加することで）。

```html
<a class="btn btn-nm btn-primary" data-lfr-editable-id="link" data-lfr-editable-type="link">
    Editable link.
</a>
```

この例のフラグメントの背景色を黒に変更すると、バックエンドでスタイル用に作成される外側の `<div>` 、通常その変更が適用されます。 UIではこのように表示されます。

![data-lfr-styles 属性がない場合、背景色がフラグメント全体に適用され、好ましくない効果が生じます。](./applying-styles-to-fragments/images/02.png)

しかし、 `data-lfr-styles` 属性をフラグメント内の内部要素の 1 つに追加すると、スタイルの変更をその特定の要素に代わりに適用させることができます。 これを利用して、それらの変更に最も意味のあるエレメントを選択することができます。

上記の例では、button 要素の HTML タグに属性を追加します。

```html
<a data-lfr-styles class="btn btn-nm btn-primary" data-lfr-editable-id="link" data-lfr-editable-type="link">
    Editable link.
</a>
```

これにより、スタイルの変更はフラグメントのその部分に適用されます。 ここで、背景色を黒に変更すると、選択した要素の色が具体的に変更されます。

![この例では、data-lfr-styles 属性は、フラグメント内のボタンにのみ背景色を適用します。](./applying-styles-to-fragments/images/03.png)

```{note}
フラグメントに `data-lfr-styles` 属性を追加しても、すでにページに追加されているフラグメントのインスタンスには影響を与えません。 詳しくは、 [フラグメントの変更のプロパゲート](../../creating-pages/page-fragments-and-widgets/using-fragments/propagating-fragment-changes.md) をご覧ください。
```

```{warning}
`data-lfr-styles` 属性は、編集可能な要素 (`data-lfr-editable` または `lfr-editable` 属性を使用) に含まれるタグには使用することができません。 これらの編集可能なタグに含まれるフラグメントの一部に `data-lfr-styles` を追加しても、それは無視されます。
```

`data-lfr-styles` 属性は、フラグメントの編集にお好きな方法で追加してください。

* **[フラグメントエディターを使う](./using-the-fragments-editor.md) UIで使う** : エディターのHTMLウィンドウで変更する
* ** [Fragments Toolkit の使用](./using-the-fragments-toolkit.md)** : フラグメントの `index.html` ファイルを変更する。

## 追加情報

* [フラグメントの開発](./developing-fragments-intro.md)
* [フラグメントエディターの使用](./using-the-fragments-editor.md)
* [フラグメントツールキットの使用](./using-the-fragments-toolkit.md)
* [フラグメントへの構成オプションの追加](./adding-configuration-options-to-fragments.md)
* [フラグメントの設定](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md)
