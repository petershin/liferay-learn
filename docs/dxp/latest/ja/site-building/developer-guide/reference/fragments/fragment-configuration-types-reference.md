# フラグメント設定タイプのリファレンス

このリファレンスには、フラグメントに使用可能な構成タイプがリストされています。 フラグメントを設定可能にする方法については、 [フラグメントへの構成オプションの追加](../../developing-page-fragments/adding-configuration-options-to-fragments.md) を参照してください。

以下は実装できる構成可能なフラグメントタイプです。

- `text`
- `select`
- `checkbox`
- `colorPicker` (Liferay 7.4+ で使用可能)
- `長さ` (Liferay 7.4+ U44/GA44 で使用可能)
- `itemSelector`
- `url` (Liferay 7.4+ で利用可能)
- `videoSelector` (Liferay 7.4+ で使用可能)
- `collectionSelector`
- `colorPalette`
- `navigationMenuSelector` (Liferay 7.4+ で使用可能)

!!! メモ

```
FreeMarkerのコンテキストに挿入される設定値は、JSONファイルで定義された `datatype` に従います。例えば、`dataType` が String の場合、`configuration.[name-value]?is_string` は `true` となる。
```

## テキスト設定

このJSONコンフィギュレーションは、手動でテキストオプションを入力しなければならない場合に実装できる入力テキストフィールドを作成します：

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "name": "buttonText",
                    "label": "Button Text",
                    "description": "button-text",
                    "type": "text",
                    "typeOptions": {
                        "placeholder": "Placeholder"
                    },
                    "dataType": "string",
                    "defaultValue": "Go Somewhere"
                }
            ]
        }
    ]
}
```

![The text configuration is useful when an input text option is necessary.](./fragment-configuration-types-reference/images/01.png)

## 選択設定

次の JSON 構成は、事前定義されたオプションを選択する必要がある場合に実装できるセレクターを作成します。

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "name": "numberOfFeatures",
                    "label": "Number Of Features",
                    "description": "number-of-features",
                    "type": "select",
                    "dataType": "int",
                    "typeOptions": {
                        "validValues": [
                            {"value": "1"},
                            {"value": "2"},
                            {"value": "3"}
                        ]
                    },
                    "defaultValue": "3"
                }
            ]
        }
    ]
}
```

![The select configuration is useful when an option choice is necessary.](./fragment-configuration-types-reference/images/02.png)

## チェックボックスの設定

次の JSON 構成は、ブール値の選択が必要な場合に実装できるチェックボックスを作成します。

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "name": "hideBody",
                    "label": "Hide Body",
                    "description": "hide-body",
                    "type": "checkbox",
                    "defaultValue": false
                }
            ]
        }
    ]
}
```

![The checkbox configuration is useful when a boolean selection is necessary.](./fragment-configuration-types-reference/images/03.png)

## カラーピッカーの設定

{bdg-secondary}`liferay 7.4+`

カラーピッカーのJSON設定により、任意の色を選択できる柔軟なカラーセレクターが作成されます。 これらの方法のいずれかを使って、色を選択することができます。

* 左側の色をクリックすると、カラーピッカーが開き、色を選択します。

* 色の16進コードをテキストボックスに入力します。

* **スタイルブックからの値**ボタンをクリックすると、現在使用している [スタイルブック](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) で定義されている、あらかじめ定義された色のメニューが開きます。 これにより、再度ボタンを押してリンクが解除されるまで、フィールドの値が選択されたトークンにリンクされます。 トークン値のリンクを解除すると、選択した色が再び同等の16進コード値に変換されます。

* カラーピッカーにデフォルト値が定義されていない場合は、 **デフォルト** ドロップダウンメニューをクリックして、現在使用しているスタイルブックから任意の色を選択してください。 これは、値を選択する際の［スタイルブックの値］ボタンと同じように機能します。

![The color picker configuration lets you directly input a color value, select one from a range, or select one from your style book.](./fragment-configuration-types-reference/images/04.png)

!!! note
    使用しているテーマにスタイルブック [に対する](../../../site-appearance/style-books/developer-guide/frontend-token-definitions.md) トークン定義がない場合、ページ上のカラーピッカー設定は [カラーパレット](#color-palette configuration) 設定に置き換えられます。


このJSON設定により、`headingColor`というカラーピッカーフィールドが作成される：

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "name": "headingColor",
                    "label": "Heading Color",
                    "description": "heading-color",
                    "type": "colorPicker",
                    "defaultValue": "#FF0000"
                }
            ]
        }
    ]
}
```

`colorPicker`型は、設定された名前で選択された色の値を保持するオブジェクトを格納する。 このオブジェクトは、フラグメントのHTML内で次のように参照することができます。

```html
<div class="fragment_69">
    <h1 style="color: ${configuration.headingColor}">
        This text's color is configurable.
    </h1>
</div>
```

フラグメントがレンダリングされると、トークン `${configuration.OBJECT_NAME}` は選択された色に置き換えられる。 値のタイプは、色の選択方法によって異なります。

- 色を直接選んだ場合は、対応する16進コードの値に置き換わります。
- 現在のスタイルブックから色を選んだ場合、その色はリンクされたトークンのCSS変数（例えば`var(-danger)`）に置き換えられます。
- 現在のテーマに使用するトークン定義がない場合(そのため、 [カラーパレット](#color-palette-configuration) が代わりに使用されます)、CSSカラー(例えば、`rgb(255, 0, 0)`)に置き換えられます。

## 長さ構成

{bdg-secondary}`liferay 7.4 U44およびGA44+`。

`長さ`の設定タイプでは、幅、マージン、パディングのような設定に対して、数値を入力したり、定義済みの単位を選択したり、独自の単位を指定したりできるフィールドを作成します。

このJSONサンプルは、`length`コンフィギュレーションタイプを使ったフィールドを示している。 名前、ラベル、デフォルト値を定義するプロパティが含まれています。

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "defaultValue": "300px",
                    "label": "size",
                    "name": "size",
                    "type": "length"
                }
            ]
        }
    ]
}
```

ユーザー・インターフェースでは、利用可能な単位から選択するか、カスタム単位を指定することができます。

![A field labeled 'Size' from a custom fragment uses the length configuration to show a drop-down of available units.](./fragment-configuration-types-reference/images/05.png)

## アイテムセレクターの設定

{bdg-secondary}`liferay 7.3+`

このコンフィギュレーションは、フラグメントに含める既存のコンテンツ (デフォルトではドキュメント、Web コンテンツ記事、ブログエントリー、カテゴリ、製品、ナレッジベース記事) を選択するセレクタを作成します。

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "select-content",
                    "name": "itemSelector1",
                    "type": "itemSelector",
                    "typeOptions": {
                        "enableSelectTemplate": true
                    }
                }
            ]
        }
    ]
}
```

![The item selector configuration is useful when an option choice to display existing content is necessary.](./fragment-configuration-types-reference/images/06.png)

作成者が特定の種類のコンテンツのみを選択できるようにする、より高度な構成を提供できます。 以下の構成では、Web コンテンツの記事のみを選択できることを指定しています。 オプションの `itemSubtype` プロパティは、選択されたウェブコンテンツ記事が `article-structure-key-15` 構造を使用していなければ選択されないことを指定します：

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "select-content",
                    "name": "itemSelector1",
                    "type": "itemSelector",
                    "typeOptions": {
                        "itemType": "com.liferay.journal.model.JournalArticle",
                        "itemSubtype": "article-structure-key-15"
                    }
                }
            ]
        }
    ]
}
```

この例では `image/png` というMIMEタイプを持つ文書（`.png` ファイル）だけを選択できるように指定しています：

```json
{
  "fieldSets": [
    {
      "fields": [
        {
          "label": "select-content",
          "name": "itemSelector1",
          "type": "itemSelector",
          "typeOptions": {
            "itemType": "com.liferay.portal.kernel.repository.model.FileEntry",
            "mimeTypes": [
              "image/png"
            ]
          }
        }
      ]
    }
  ]
}
```

次の例では、ブログエントリーのみを選択できるように指定しています。

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "select-content",
                    "name": "itemSelector1",
                    "type": "itemSelector",
                    "typeOptions": {
                        "itemType": "com.liferay.blogs.model.BlogsEntry"
                    }
                }
            ]
        }
    ]
}
```

そして、このブログ・エントリーのHTMLスニペットで、フラグメントのコンテンツをレンダリングすることができます：

```html
<div class="fragment_name">
  [#if configuration.itemSelector1.content??]
       ${configuration.itemSelector1.content}
  [/#if]
</div>
```

コンテンツの特定の部分にアクセスする必要がある場合は、`name` 属性と `Object` 接尾辞（この場合は `itemSelector1Object`）を使用して、フラグメント内のJavaオブジェクトにアクセスすることもできます。 以下の例では、ブログエントリーのタイトル、説明、本文をレンダリングしています。

```html
<div class="fragment_name">
  [#if configuration.itemSelector1.content??]
      ${itemSelector1Object.getTitle()}
      ${itemSelector1Object.getDescription()}
      ${itemSelector1Object.getContent()}
  [/#if]
</div>
```

!!! note

```
アイテムセレクタ構成のフラグメントをコレクション表示ウィジェットに配置すると、コレクションアイテムが自動的に選択コンテンツとしてマップされます。
```

## URL設定

このコンフィギュレーションは、フラグメントのマークアップで使用するURL専用のフィールドを追加します：

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "My URL",
                    "name": "myURL",
                    "type": "url"
                }
            ]
        }
    ]
}
```

この設定でフラグメントを設定する場合、ドロップダウンメニューからURLを手動で入力するか（`URL`）、同じサイトから別のページを選択してその完全なURLを使用するか（`Page`）を選ぶことができます。

以下は、上記のJSONのURLコンフィギュレーションを使用してハイパーリンクを作成するフラグメントHTMLの例である：

```html
<div class="fragment_1">
    <a href=${configuration.myURL}>Click this link!</a>
</div>
```

## ビデオセレクター

{bdg-secondary}`liferay 7.4+`

`videoSelector`型を使うと、 [外部ビデオ](../../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) フラグメントを別のフラグメントに組み込むためのビデオセレクタを作成することができる。

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "label": "My Video Selector",
                    "name": "myVideoConfig",
                    "type": "videoSelector"
                }
            ]
        }
    ]
}
```

これは、デフォルトでビデオが埋め込まれているフラグメントが必要な場合に便利です。 以下のJSON設定サンプルは、カードフラグメントに外部ビデオセレクターを組み込む方法を示しています。

```json
{
"fieldSets": [
    {
        "fields": [
            {
                "label": "Video",
                "name": "video",
                "type": "videoSelector"
            }
        ]
    },
    {
        "configurationRole": "style",
        "fields": [
            {
                "dataType": "string",
                "defaultValue": "w-100",
                "label": "image-size",
                "name": "imageSize",
                "type": "select",
                "typeOptions": {
                    "validValues": [
                        {
                            "label": "fit",
                            "value": "w-100"
                        },
                        {
                            "label": "original-size",
                            "value": "w-0"
                        }
                    ]
                }
            }
        ]
    }
]
}
```

![With the video selector you can include external videos in fragments](./fragment-configuration-types-reference/images/07.png)

!!! note

```
videoSelector`タイプは、 [external video](../../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#external-video) フラグメントと互換性がありますが、 [video URL](../../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) フラグメントとは互換性がありません。
```

## コレクションセレクター

{bdg-secondary}`liferay 7.3+`

`collectionSelector`構成タイプを使用すると、 [コレクション](../../../displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) または [コレクションプロバイダ](../../../displaying-content/collections-and-collection-pages/collection-providers.md) を含むフラグメントを開発することができます。 コレクションセレクタは手動コレクションでも動的コレクションでも使用できます。

!!! note
    開発者は、コレクション・プロバイダを使用して、より高度な基準で特定のコレクションを作成できます。詳しくは、 [Info Framework](https://help.liferay.com/hc/en-us/articles/360029067251-Introduction-to-The-Info-Framework) 開発者ドキュメントの [Creating an Information List Provider](https://help.liferay.com/hc/en-us/articles/360029067271-Creating-an-Information-List-Provider) を参照してください。


次の JSON 設定は `collectionSelector` の使い方を示している：

```json
{
    "fieldSets": [
        {
        "label": "Collection",
        "fields": [
            {
                "name": "collection",
                "type": "collectionSelector"
            }
        ]
        }
    ]
}
```

このフラグメント設定を、以下のHTMLコードサンプルで使用することで、コレクション項目を一覧表示することができます。 collectionObjectList`は [コンテンツページエディタ](../../../creating-pages/using-content-pages/content-page-editor-ui-reference.md) で選択されたコレクションを表します。

HTMLでこのコレクションを参照するには、JSONコンフィギュレーションでコレクション`name`と接尾辞`ObjectList`を使用する。 前のJSONコードの抜粋では、コレクション `name` は `collection` なので、HTMLは `collectionObjectList` を使ってコレクションを参照している。

```html
<div class="fragment_310">
    <h1>
        List of Items:
    </h1>
    <ul>
        [#if collectionObjectList??]
        [#list collectionObjectList as item]
        <li>${item.title}</li>
        [/#list]
        [/#if]
    </ul>
</div>
```

![You can develop a fragment with a collection selector using the collection configuration.](./fragment-configuration-types-reference/images/08.png)

### コレクションセレクターのフィルタリング

`collectionSelector`の設定で `itemType` を使ってコレクションセレクタをフィルタリングすることができる。 例えば、Webコンテンツとブログを含む異なるコレクションがある場合、コレクションセレクターを制限して、ブログコレクションのみを表示することができます。 このJSONサンプルは、この設定を説明するものです。

```json
{
    "fieldSets": [
        {
            "label": "Collection",
            "fields": [
                {
                    "name": "collection",
                    "type": "collectionSelector",
                    "typeOptions": {
                        "itemType": "com.liferay.blogs.model.BlogsEntry"
                    }
                }
            ]
        }
    ]
}
```

このサンプル構成では、Webコンテンツとブログの両方を含むコレクションは、コレクションタイプがアセットであるため、コレクションセレクターからフィルタリングされます。

![A collection including web content and blog entries corresponds to the asset type.](./fragment-configuration-types-reference/images/09.png)

!!! tip
    コンフィギュレーションでは `itemType` に加えて `itemSubtype` を指定することができます。itemSubtype` はアセット `classPK` に対応する。

### 返却されたコレクション項目の最大数の定義

デフォルトでは、最大項目数の制限を定義しない場合、コレクション内のすべての項目が返されます。 この制限は、JSON設定の `numberOfItems` を使って設定することができる。

```json
{
    "fieldSets": [
        {
            "label": "Collection",
            "fields": [
                {
                    "name": "collection",
                    "type": "collectionSelector",
                    "typeOptions": {
                        "numberOfItems": 3
                    }
                }
            ]
        }
    ]
}
```

## カラーパレットの設定

カラーパレットJSON 構成は、色を選択する必要がある場合に実装できるカラー セレクターを作成します。 [カラーピッカー設定](#color-picker-configuration) とは異なり、現在使用されている [スタイルブック](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) のカラーシステムで設定されたテーマカラーに基づくオプションのみを提供します。

この設定により、`textColor`というカラーパレットフィールドが作成される：

```json
{
    "fieldSets": [
        {
            "fields": [
                {
                    "name": "textColor",
                    "label": "Text color",
                    "type": "colorPalette",
                    "dataType": "object",
                    "defaultValue": {
                        "color": "white"
                    }
                }
            ]
        }
    ]
}
```

`colorPalette`型は`color` という値を持つオブジェクトを格納する。

例えば、上記のスニペットを実装すれば、FreeMarkerで使用することができます：

```html
<h3 class="text-${configuration.textColor.color}">Example</h3>
```

もし白を選択した場合、`h3`タグの見出しは`text-white`というクラスを持つことになります。

![The color palette configuration is useful when a color selection is necessary.](./fragment-configuration-types-reference/images/10.png)

## ナビゲーション・メニュー・セレクターの構成

{bdg-secondary}`Liferay DXP 2024.Q1`

`navigationMenuSelector`設定タイプを使用すると、フラグメントHTMLエディタからFreeMarker変数にアクセスし、カスタムナビゲーションメニューをレンダリングするためのマークアップを定義することができます。

フラグメントHTMLエディタでFreeMarkerの変数を使用するには、 [設定タイプ](../../developing-page-fragments/adding-configuration-options-to-fragments.md#modify-the-configuration) として `navigationMenuSelector` を設定することから始めます。 以下のJSONスニペットをモデルとして使用できます。

```json
"fieldSets": [
    {
    "fields": [
        {
        "label": "source",
        "name": "source",
        "type": "navigationMenuSelector"
        }
    ]
    }
]
```

これで FreeMarker の変数にアクセスできるようになります。変数は `[name]Object` の下にあります。 この例では、`sourceObject.navItems` は `sourceObject` の下にある `navItems` リストを返す。 オブジェクトは `sourceObject` という名前になる。

これらはナビゲーションメニューセレクタ設定タイプで使用可能な変数です：

| 値                 | 用途                                             |
| :---------------- | :--------------------------------------------- |
| `branchNavItems`  | ナビゲーションメニューの階層構造を表す。                           |
| `navItems`        | それぞれが表示されるナビゲーションアイテムを表す `NavItem` オブジェクトのリスト。 |
| `rootLayoutLevel` | 階層のレベルを定義する。                                   |
| `rootLayoutType`  | 現在のページに対するルートレイアウトの解釈方法（絶対、相対、選択）を指定します。       |

`navigationMenuSelector`型をよりよく見るには、 [navigation-menu fragment](https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/reference/fragments/fragment-configuration-types-reference/liferay-r5q5.zip) をダウンロードし、フラグメントセットにインポートする。 フラグメントのインポートについては、 [フラグメントの管理](../../../creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md) を参照してください。

## 関連トピック

- [フラグメントの開発](../../developing-page-fragments/developing-fragments-intro.md)
- [フラグメント特異的タグ 参照](./fragment-specific-tags-reference.md)
- [ページ・フラグメント・エディター・インターフェイス・リファレンス](./page-fragment-editor-interface-reference.md)
- [スタイルブックを使ってサイトの外観を標準化する](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)
