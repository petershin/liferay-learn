# 詳細設定リファレンス

{bdg-secondary}`Available 7.4 U37+/GA37+`

Liferayのデフォルトのフラグメントには、Collection Displayフラグメントを除き、高度な設定が含まれています。 高度な設定では、フラグメントにカスタムCSSを追加したり、コンテンツを検索可能にするかどうかを設定したりすることができます。

```{note}
フレームエージェントの詳細設定を行うには、ページの更新 - 詳細オプションのパーミッションが必要です。
```

フラグメントの詳細設定にアクセスするには

1. フラグメントをサポートするページまたはテンプレートの編集を開始します。

1. ブラウザ]サイドパネル(![ブラウザ](../../../../../images/icon-hierarchy.png))を開き、[ページ要素]タブに移動し、目的のフラグメントを選択します。

   または、ページやテンプレート内の目的のフラグメントをクリックします。

1. ページ要素サイドメニューの **詳細** タブをクリックします。

![Access a fragment's advanced settings in the Page Elements side menu.](./advanced-settings-reference/images/01.png)

## 標準詳細設定

高度な設定を持つすべてのデフォルトのフラグメントには、以下のオプションがある。

### 検索結果に表示しない

サイトの検索結果からフラグメントのコンテンツを非表示にするかどうかを指定します。 断片的なコンテンツを隠すことで、無関係で冗長な検索結果を減らすことができる。 選択したフラグメントが子フラグメントを含む場合、子フラグメントはその設定を継承します。

![Determine whether to hide the fragment's content from search results in your site.](./advanced-settings-reference/images/02.png)

### カスタム CSS

{bdg-secondary}`Available 7.4 U34+/GA34+`

**カスタムCSS** テキストボックスを使用して、フラグメントにCSSを追加します。 デフォルトでは、このテキストボックスにはこのプレースホルダーが含まれています：

```css
.[$FRAGMENT_CLASS$] {

}
```

`[$FRAGMENT_CLASS$]`はCSSクラス・トークンで、設定するフラグメントの一意の名前を表します。 このCSSコードは、現在のフラグメントにのみ適用される。 例えば、フラグメントの背景を通常は赤に、ユーザーがカーソルを合わせたときに青に設定することができます：

```css
.[$FRAGMENT_CLASS$] {
    background: red;
}

.[$FRAGMENT_CLASS$]:hover {
    background: blue
}
```

ページがレンダリングされるとき、`[$FRAGMENT_CLASS$]` はフラグメントのクラス名に置き換えられます（例：`lfr-layout-structure-item-01d752e4-32e3-ed4a-9cd6-fcaf483d0c34`）。

```{tip}
*Expand*アイコン ( ![Expand](../../../../../images/icon-expand.png) ) をクリックするとモーダルウィンドウが開き、フラグメントのCSSを編集する際に余裕ができます。
```

また、現在使用している [スタイルブック](../../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) に由来する変数をカスタム CSS で使用することもできます。 この例では、スタイル・ブックの情報色（紺色と定義）を使用して、フラグメントの背景色を設定しています：

```css
.[$FRAGMENT_CLASS$] {
    background: var(--info);
}
```

![You can use variables from your style book to fine-tune the CSS for specific fragments.](./advanced-settings-reference/images/03.png)

### CSS クラス

[Custom CSS](#custom-css) で使用するクラスを追加するには、 **CSS Classes** フィールドを使用します。 複数のクラスを追加する場合は、それぞれをスペース、コンマ、または改行で区切ってください。 これらのクラスは、同じページ上の他のフラグメントに使用することができます。 入力中に既存のクラスの候補が表示されます。

![Entering custom CSS classes in this field makes them appear as suggestions in the advanced settings for other fragments on the same page.](./advanced-settings-reference/images/04.png)

```{note}
CSS Classesテキストボックスには、自分で追加したCSSクラスだけが候補として表示されます。 既存のクラスや変数（`[$FRAGMENT_CLASS$]`など）は表示されないので、このフィールドに追加する必要はない。
```

## コンテナの詳細設定

コンテナの断片には、 [標準的なもの](#standard-advanced-settings) と高度な設定がある。

### HTML タグ

コンテナフラグメントに生成される HTML タグを選択します: `div`、`header`、`nav`、`section`、`article`、`main`、`aside`、`footer` のいずれかです。 これらのタグは、ウェブスクレイパー、ブラウザ、サイトレンダラーがページのコンテンツをより簡単に検索・取得するのに役立ちます。 選択されたタグは、選択されたコンテナ自体にのみ適用され、ネストされたフラグメントやコンテンツには適用されない。

![You can choose which HTML tag is used for container fragments in the Advanced Settings tab.](./advanced-settings-reference/images/05.png)

### コンテンツの可視性を自動に設定

デフォルトでは、Liferayはページ内のすべてのコンテナを自動的にレンダリングします。 しかし、コンテナの [`content-visibility`](https://drafts.csswg.org/css-contain/#propdef-content-visibility) プロパティを `auto` に設定すると、要素は必要なときだけレンダリングされる。 これにより、ページのロード・パフォーマンスを向上させることができる。

![Improve page load performance by setting the container's content-visibility to auto.](./advanced-settings-reference/images/06.png)

## 関連トピック

* [一般設定リファレンス](./general-settings-reference.md)
* [フラグメントの使用](../../using-fragments.md)
* [スタイルブックの作成](../../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)
* [スタイルブック・トークンの定義](../../../../site-appearance/style-books/developer-guide/frontend-token-definitions.md)
