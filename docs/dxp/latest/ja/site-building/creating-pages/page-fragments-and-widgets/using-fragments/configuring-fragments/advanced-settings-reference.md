# 詳細設定リファレンス

{bdg-secondary}`利用可能 7.4 U37+/GA37+`

Liferayのデフォルトフラグメントには、Collection Displayフラグメントを除き、すべて詳細設定が含まれています。 高度な設定では、フラグメントにカスタムCSSを追加したり、その内容を検索可能にするかどうかなどを設定することができます。

```{note}
フレームジェントの詳細設定を行うには、そのページの更新 - 詳細オプションの権限が必要です。
```

フラグメントの詳細設定にアクセスするには

1. フラグメントに対応したページやテンプレートの編集を開始します。

1. **ブラウザ** サイドパネル (![Browser](../../../../../images/icon-hierarchy.png)) を開き、 **ページ要素** タブを開き、目的のフラグメントを選択します。

   または、ページやテンプレート内の目的のフラグメントをクリックします。

1. ページ要素」サイドメニューの「**アドバンス**」 タブをクリックします。

![ページ要素のサイドメニューから、フラグメントの詳細設定にアクセスします。](./advanced-settings-reference/images/01.png)

## 標準詳細設定

詳細設定のあるデフォルトフラグメントには、すべて以下のオプションがあります。

### 検索結果に表示しない

フラグメントの内容をサイト内の検索結果から非表示にするかどうかを指定します。 フラグメントコンテンツを隠すことで、無関係な検索結果や冗長な検索結果を減らすことができます。 選択されたフラグメントが子フラグメントを含む場合、それらはその設定を引き継ぎます。

![フラグメントの内容をサイト内の検索結果から非表示にするかどうかを決定します。](./advanced-settings-reference/images/02.png)

### カスタム CSS

{bdg-secondary}`利用可能 7.4 U34+/GA34+`

**Custom CSS** テキストボックスを使用して、フラグメントにCSSを追加します。 デフォルトでは、このテキストボックスにはこのプレースホルダーが含まれています。

```css
.[$FRAGMENT_CLASS$] {

}
```

`[$FRAGMENT_CLASS$]` は、設定するフラグメントの一意な名前を表すCSSクラス・トークンです。 この CSS コードは、現在のフラグメントにのみ適用される。 例えば、フラグメントの背景を通常は赤、ユーザーがカーソルを合わせたときは青に設定することができます。

```css
.[$FRAGMENT_CLASS$] {
    background: red;
}

.[$FRAGMENT_CLASS$]:hover {
    background: blue
}
```

ページがレンダリングされるとき、 `[$FRAGMENT_CLASS$]` はフラグメントのクラス名に置き換えられます（例： `lfr-layout-structure-item-01d752e4-32e3-ed4a-9cd6-fcaf483d0c34`)。

```{tip}
拡張*アイコン ( ![Expand](../../../.../images/icon-expand.png) ) をクリックするとモーダルウィンドウが開き、フラグメントのCSSを編集する際に余裕が生まれます。
```

また、現在使用している [スタイルブック](../../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) に由来する変数をカスタム CSS で使用することができます。 この例では、スタイルブックのInfoカラー（ダークブルーと定義）を使用して、フラグメントの背景色を設定しています。

```css
.[$FRAGMENT_CLASS$] {
    background: var(--info);
}
```

![スタイルブックの変数を使用して、特定のフラグメントのCSSを微調整することができます。](./advanced-settings-reference/images/03.png)

### CSS クラス

**CSS Classes** フィールドを使用して、 [Custom CSS](#custom-css) で使用するクラスを追加します。 複数のクラスを追加する場合は、それぞれをスペース、カンマ、または改行で区切ってください。 これらのクラスは、同じページ内の他のフラグメントに使用することができます。 入力中に既存のクラスの候補が表示されます。

![このフィールドにカスタムCSSクラスを入力すると、同じページ上の他のフラグメントの詳細設定に候補として表示されます。](./advanced-settings-reference/images/04.png)

```{note}
CSSクラス]テキストボックスには、自分で追加したCSSクラスだけが候補として表示されます。 既存のクラスや変数（`[$FRAGMENT_CLASS$]`など）は表示されないので、このフィールドに追加する必要はありません。
```

## コンテナの詳細設定

コンテナフラグメントには、 [標準的なもの](#standard-advanced-settings) と高度な設定があります。

### HTML タグ

`div`, `header`, `nav`, `section`, `article`, `main`, `aside`, or `footer`の中から、コンテナフラグメント用に生成された HTML タグを選択してください。 これらのタグは、ウェブスクレイパー、ブラウザ、サイトレンダラーが、ページのコンテンツをより簡単に検索して取得できるようにするためのものです。 選択されたタグは、選択されたコンテナ自体にのみ適用され、ネストされたフラグメントやコンテンツには適用されません。

![コンテナフラグメントにどのHTMLタグを使用するかは、「詳細設定」タブで選択することができます。](./advanced-settings-reference/images/05.png)

### コンテンツの可視性を自動に設定

{bdg-secondary}`利用可能 7.4 U37+/GA37+`

デフォルトでは、Liferayはページ内のすべてのコンテナを自動的にレンダリングします。 しかし、コンテナの [`content-visibility`](https://drafts.csswg.org/css-contain/#propdef-content-visibility) プロパティを `auto` に設定すると、必要なときだけ要素がレンダリングされるようになります。 これにより、ページの読み込み性能を向上させることができます。

![コンテナのcontent-visibilityをautoに設定することで、ページロードのパフォーマンスを向上させることができます。](./advanced-settings-reference/images/06.png)

## 関連トピック

* [一般設定リファレンス](./general-settings-reference.md)
* [フラグメントの使用](../../using-fragments.md)
* [新しいスタイルブックの作成](../../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)
* [スタイルブックトークンの定義](../../../../site-appearance/style-books/developer-guide/style-book-token-definitions.md)
