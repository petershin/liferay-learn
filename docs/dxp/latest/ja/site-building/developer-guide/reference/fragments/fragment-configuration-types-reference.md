# フラグメント設定タイプのリファレンス

このリファレンスには、フラグメントに使用可能な構成タイプがリストされています。 フラグメントを構成可能にする方法の詳細は、[フラグメントへの構成オプションの追加](../../developing-page-fragments/adding-configuration-options-to-fragments.md)を参照してください。

以下は実装できる構成可能なフラグメントタイプです。

- `text`
- `select`
- `checkbox`
- `colorPicker` (Liferay 7.4+ で利用可能)
- `length` (Available Liferay 7.4+ U44/GA44)
- `itemSelector`
- `url` (Liferay 7.4+ で利用可能)
- `videoSelector` （Liferay 7.4+で使用可能）
- `collectionSelector`
- `colorPalette`

```{note}
FreeMarker コンテキストに挿入された設定値は、JSON ファイルで指定された定義済みの `datatype` 値に従います。 たとえば、`dataType`が String の場合、`configuration.[name-value]?is_string` は `true`となります。
```

## テキスト設定

この JSON 設定は、手動でテキストオプションを入力しなければならない場合に実装できる入力テキストフィールドを作成します：

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

![テキスト設定は、入力テキスト オプションが必要な場合に役立ちます。](./fragment-configuration-types-reference/images/06.png)

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

![選択設定は、オプションの選択が必要な場合に役立ちます。](./fragment-configuration-types-reference/images/05.png)

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

![チェックボックス設定は、ブール値の選択が必要な場合に役立ちます。](./fragment-configuration-types-reference/images/01.png)

## カラーピッカーの設定

{bdg-secondary}`Liferay 7.4以降で利用可能`

カラーピッカーのJSON設定により、任意の色を選択できる柔軟なカラーセレクターが作成されます。 これらの方法のいずれかを使って、色を選択することができます。

* 左側の色をクリックすると、カラーピッカーが開き、色を選択します。

* 色の16進コードをテキストボックスに入力します。

* ［**スタイルブックの値**］ ボタンをクリックすると、現在使用している [スタイルブック](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)で定義されている色を選択するための定義済みの色のメニューが表示されます。 これにより、再度ボタンを押してリンクが解除されるまで、フィールドの値が選択されたトークンにリンクされます。 トークン値のリンクを解除すると、選択した色が再び同等の16進コード値に変換されます。

* カラーピッカーにデフォルト値が定義されていない場合は、 ［**デフォルト**］ ドロップダウンメニューをクリックし、現在使用しているスタイルブックから任意の色を選択します。 これは、値を選択する際の［スタイルブックの値］ボタンと同じように機能します。

![カラーピッカーの設定では、色の値を直接入力したり、範囲から選択したり、スタイルブックから選択することができます。](./fragment-configuration-types-reference/images/02.png)

```{note}
使用しているテーマに[スタイルブックのトークン定義](../../../site-appearance/style-books/developer-guide/style-book-token-definitions.md)がない場合、ページ上のカラーピッカー設定は [color palette](#color-palette configuration) 設定に置き換えられます。
```

このJSON設定は、`headingColor`というカラーピッカーフィールドを作成します。

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

`colorPicker`タイプは、設定された名前で選択されたカラー値を保持するオブジェクトを格納します。 このオブジェクトは、フラグメントのHTML内で次のように参照することができます。

```html
<div class="fragment_69">
    <h1 style="color: ${configuration.headingColor}">
        This text's color is configurable.
    </h1>
</div>
```

フラグメントがレンダリングされると、トークン`${configuration.OBJECT_NAME}`は選択された色に置き換えられます。 値のタイプは、色の選択方法によって異なります。

* 色を直接選んだ場合は、対応する16進コードの値に置き換わります。
* 現在のスタイルブックから色を選択した場合、リンク先のトークンのCSS変数（例えば、 `var(--danger)`）に置き換えられます。
* 現在のテーマに使用するトークン定義がない場合（そのため、 [カラーパレット](#color-palette-configuration) が代わりに使用される）、CSS カラー（例えば、 `rgb(255, 0, 0)`）に置き換えられます。

## 長さ構成

{bdg-secondary}`利用可能な Liferay 7.4 U44 および GA44+`

`length` 設定タイプは、幅、マージン、パディングなどの設定に、数値を入力し、定義済みの単位を選択するか、独自の単位を指定できるフィールドを作成します。

このJSONサンプルは、 `length` コンフィギュレーション・タイプを使用したフィールドを示しています。 名前、ラベル、デフォルト値を定義するプロパティが含まれています。

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

<!-- The below screenshot is way too big. Please reduce. -Rich --> 

![カスタムフラグメントの'Size'というラベルの付いたフィールドは、長さの設定を使用して、利用可能な単位のドロップダウンを表示します。](./fragment-configuration-types-reference/images/10.png)

## アイテムセレクターの設定

{bdg-secondary}`Liferay 7.3以降で利用可能`

この設定により、フラグメントに含める既存のコンテンツ（デフォルトではWebコンテンツの記事、ブログエントリー、ドキュメント）を1つ選択するためのセレクターが作成されます。

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

作成者が特定の種類のコンテンツのみを選択できるようにする、より高度な構成を提供できます。 以下の構成では、Web コンテンツの記事のみを選択できることを指定しています。 オプションの `itemSubtype` プロパティは、選択された Web コンテンツの記事が `article-structure-key-15` のストラクチャーを使用している必要があることを指定します。

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

次の例では、ストラクチャー `metadataset-structure-key-2` を使用している `img` または `jpg` MIME タイプのドキュメントのみを選択できることを指定しています。

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
            "itemSubtype": "metadataset-structure-key-2",
            "mimeTypes": [
              "img/jpg"
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

その後、Web コンテンツ記事に次の HTML スニペットを使用して、フラグメント内のコンテンツをレンダリングできます。

```html
<div class="fragment_name">
  [#if configuration.itemSelector1.content??]
       ${configuration.itemSelector1.content}
  [/#if]
</div>
```

コンテンツの特定の部分にアクセスする必要がある場合は、`[name-of-field]Object`（以下の例では、`itemSelector1Object`）というキーでフラグメント内のJavaオブジェクトにアクセスすることもできます。 次の例は、Web コンテンツの記事のタイトル、説明、および本文をレンダリングします。

```html
<div class="fragment_name">
  [#if configuration.itemSelector1.content??]
      ${itemSelector1Object.getTitle()}
      ${itemSelector1Object.getDescription()}
      ${itemSelector1Object.getContent()}
  [/#if]
</div>
```

![アイテム セレクターの設定は、既存のコンテンツを表示するオプションの選択が必要な場合に役立ちます。](./fragment-configuration-types-reference/images/04.png)

```{note}
アイテムセレクタ構成のフラグメントをコレクション表示ウィジェットに配置すると、コレクションアイテムが選択コンテンツとして自動的にマップされます。
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

このコンフィギュレーションでフラグメントを構成する場合、ドロップダウンメニューから、URLを手動で入力する（`URL`）か、同じサイトから別のページを選択し、その完全なURLを使用する（`Page`）かを選択できます。

以下は、上記のJSONのURLコンフィギュレーションを使用してハイパーリンクを作成するフラグメントHTMLの例である：

```html
<div class="fragment_1">
    <a href=${configuration.myURL}>Click this link!</a>
</div>
```

## ビデオセレクター

{bdg-secondary}`Liferay 7.4以降で利用可能`

`videoSelector`タイプを使用すると、 [外部ビデオ](../../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md)フラグメントを別のフラグメントに組み込むためのビデオセレクターを作成することができます。

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

![ビデオセレクターで、フラグメントに外部ビデオを含めることができます。](./fragment-configuration-types-reference/images/07.png)

```{note}
videoSelector`型は [外部ビデオ](../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#external-video) フラグメントと互換性がありますが、 [ビデオURL](../../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) フラグメントとの互換性はありません。
```

## コレクションセレクター

{bdg-secondary}`Liferay 7.3以降で利用可能`

`collectionSelector` の設定タイプを使用すると、 [コレクション](../../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md) またはコレクションプロバイダーを含むフラグメントを開発することが可能です。 `collectionSelector` は、手動コレクションと動的コレクションの両方で使用することができます。

```{note}
開発者は、コレクションプロバイダーを使用して、より高度な基準を持つ特定のコレクションを作成することができます。 詳しくは、開発者向けドキュメント [Info Framework](https://help.liferay.com/hc/ja/articles/360029067251-Introduction-to-The-Info-Framework) の [Creating an Information List Provider](https://help.liferay.com/hc/ja/articles/360029067271-Creating-an-Information-List-Provider) に関する情報をご覧ください。
```

次のJSON設定は、`collectionSelector`を使用する方法を示しています。

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

このフラグメント設定を、以下のHTMLコードサンプルで使用することで、コレクション項目を一覧表示することができます。 `collectionObjectList`は[コンテントページエディタ](../../../creating-pages/using-content-pages/content-page-editor-ui-reference.md)で選択されたコレクションを表します。

このコレクションをHTMLから参照するには、JSONの設定でコレクションの`名前`と`ObjectList`サフィックスを使用します。 先のJSONコードの抜粋では、コレクションの`name`は`collection`なので、HTMLでは `collectionObjectList`を使ってコレクションを参照しています。

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

![コレクションの設定により、フラグメントをコレクションセレクターで開発することができます。](./fragment-configuration-types-reference/images/08.png)

### コレクションセレクターのフィルタリング

`collectionSelector` 構成の `itemType` を使用して、コレクションセレクタをフィルタリングできます。 例えば、Webコンテンツとブログを含む異なるコレクションがある場合、コレクションセレクターを制限して、ブログコレクションのみを表示することができます。 このJSONサンプルは、この設定を説明するものです。

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

![Webコンテンツやブログエントリーを含むコレクションは、アセットタイプに対応します。](./fragment-configuration-types-reference/images/09.png)

```{tip}
`itemType`に加え、`itemSubtype`をコンフィギュレーションで指定することができる。 `itemSubtype`はアセット`classPK`に対応します。
```

### 返却されたコレクション項目の最大数の定義

デフォルトでは、最大項目数の制限を定義しない場合、コレクション内のすべての項目が返されます。 この制限は、JSON設定の `numberOfItems` を使って設定できます。

```json
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
```

## カラーパレットの設定

カラーパレットJSON 構成は、色を選択する必要がある場合に実装できるカラー セレクターを作成します。 [カラーピッカー設定](#color-picker-configuration) とは異なり、現在使用されている [スタイルブック](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)のカラーシステムで設定されているテーマカラーに基づいたオプションのみを提供します。

この設定では、`textColor`というカラーパレットフィールドが作成されます。

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
                        "cssClass": "white",
                        "rgbValue": "rgb(255,255,255)"
                    }
                }
            ]
        }
    ]
}
```

`colorPalette` タイプは、`cssClass` および `rgbValue` の 2 つの値を持つオブジェクトを格納します。

例えば、上記のスニペットを実装すれば、FreeMarkerで使用することができます：

```html
<h3 class="text-${configuration.textColor.cssClass}">Example</h3>
```

白を選択した場合、 `h3` タグの見出しはクラス `text-white'` を持ちます。

![カラー パレットの設定は、色の選択が必要な場合に役立ちます。](./fragment-configuration-types-reference/images/03.png)

## 関連トピック

- [フラグメントの開発](../../developing-page-fragments/developing-fragments-intro.md)
- [フラグメント固有のタグリファレンス](./fragment-specific-tags-reference.md)
- [ページ フラグメントエディタのインターフェースリファレンス](./page-fragment-editor-interface-reference.md)
- [スタイルブックを使用してサイトの外観を標準化する](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)
