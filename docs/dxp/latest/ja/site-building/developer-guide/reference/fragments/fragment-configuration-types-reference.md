# フラグメント設定タイプのリファレンス

このリファレンスでは、フラグメントで利用可能な設定の種類を一覧にしています。 フラグメントを設定可能にする方法については、 [フラグメントに設定オプションを追加する](../../developing-page-fragments/adding-configuration-options-to-fragments.md) を参照してください。

以上が、実装可能な設定可能なフラグメントタイプである。

- `checkbox`
- `colorPicker` (Liferay 7.4+ で利用可能)
- `colorPalette`
- `itemSelector` (Liferay 7.3+ で利用可能)
- `select`
- `text`
- `videoSelector` (Liferay 7.4+ で利用可能)
- `collectionSelector` (Liferay 7.3+ で利用可能)

```{note}
FreeMarker コンテキストに挿入された設定値は、JSON ファイルで指定された定義済みの `datatype` 値に従います。 たとえば、`dataType`が String の場合、`configuration.[name-value]?is_string` は `true`となります。
```

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
                ...
            ]
        }
    ]
}
```

![チェックボックス設定は、ブール値の選択が必要な場合に役立ちます。](./fragment-configuration-types-reference/images/01.png)

## カラーピッカーの設定

{bdg-secondary}`Liferay 7.4以降で利用可能`

カラーピッカーのJSON設定により、任意の色が選択できる柔軟なカラーセレクターが作成されます。 これらの方法のいずれかを使って、色を選択することができます。

* 左側の色をクリックすると、カラーピッカーが表示され、色を選ぶことができます。

* 色の16進コードをテキストボックスに入力します。

* **スタイルブックの値** ボタンをクリックすると、現在使用しているスタイルブック [で定義されている色をあらかじめ選択できるメニューが表示されます。](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)。 これにより、フィールドの値は選択されたトークンにリンクされ、再度ボタンを押せばリンクが解除されます。 トークン値のリンクを解除すると、選択された色は再び同等の16進コード値に変換されます。

* カラーピッカーにデフォルト値が定義されていない場合は、 **Default** ドロップダウンメニューをクリックし、現在使用しているスタイルブックから任意の色を選択することができます。 これは、値を選択するときの［スタイルブックの値］ボタンと同じ働きをします。

![カラーピッカーの設定により、色の値を直接入力したり、範囲から選択したり、スタイルブックから選択することができます。](./fragment-configuration-types-reference/images/02.png)

```{note}
使用しているテーマに[スタイルブックのトークン定義](../../site-appearance/style-books/style-book-token-definitions.md)がない場合、ページ上のカラーピッカーの設定は [カラーパレット](#color-palette configuration) に置き換わります。
```

このJSON設定により、 `headingColor`というカラーピッカーフィールドが作成されます。

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
                ...
            ]
        }
    ]
}
```

`colorPicker` 型は、選択された色値を保持するオブジェクトを、設定された名前とともに格納する。 このオブジェクトは、フラグメントのHTMLの中で次のように参照できます。

```html
<div class="fragment_69">
    <h1 style="color: ${configuration.headingColor}">
        This text's color is configurable.
    </h1>
</div>
```

フラグメントがレンダリングされると、トークン `${configuration.OBJECT_NAME}` は選択された色に置き換えられます。 どのような値になるかは、色の選び方次第です。

* 直接色を選択した場合は、対応する16進コードの値に置き換えられます。
* 現在のスタイルブックから色を選択した場合、リンク先のトークンのCSS変数に置き換えられます（例えば、 `var(--danger)`）。
* 現在のテーマが使用するトークン定義を持っていない場合（そのため、 [カラーパレット](#color-palette-configuration) が代わりに使用されます）、CSS Color（例えば、 `rgb(255, 0, 0)`）に置き換えられます。

## カラーパレットの設定

カラーパレットのJSON設定では、色を選択しなければならない場合のために、実装可能なカラーセレクタを作成します。 [カラーピッカー設定](#color-picker-configuration) とは異なり、現在使用している [スタイルブック](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)のカラーシステムで設定されているテーマカラーに基づくオプションのみを提供します。

この構成では、 `textColor`というカラーパレットフィールドが作成されます。

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
                ...
            ]
        }
    ]
}
```

`colorPalette` タイプは、`cssClass` および `rgbValue` の 2 つの値を持つオブジェクトを格納します。

たとえば、上記のスニペットを実装すると、次のように FreeMarker コンテキストで使用できます。

```html
<h3 class="text-${configuration.textColor.cssClass}">Example</h3>
```

白を選択した場合、 `h3` タグの見出しはクラス `text-white'` を持ちます。

![カラーパレットの設定は、色の選択が必要な場合に便利です。](./fragment-configuration-types-reference/images/03.png)

## アイテムセレクターの設定

{bdg-secondary}`Liferay 7.3以降で利用可能`

この設定では、フラグメントに含める既存のコンテンツ (デフォルトでは Web コンテンツの記事、ブログのエントリ、またはドキュメント) を 1 つ選択するセレクタを作成します。

```json
{
"fieldSets": [{
    "fields": [{
        "label": "select-content",
        "name": "itemSelector1",
        "type": "itemSelector",
        "typeOptions": {
            "enableSelectTemplate": true
        }
    }]
}]
}
```

作成者が特定の種類のコンテンツのみを選択できるようにする、より高度な構成を提供できます。 以下の構成では、Web コンテンツの記事のみを選択できることを指定しています。 オプションの `itemSubtype` プロパティは、選択された Web コンテンツの記事が `article-structure-key-15` のストラクチャーを使用している必要があることを指定します。

```json
{
"fieldSets": [{
    "fields": [{
        "label": "select-content",
        "name": "itemSelector1",
        "type": "itemSelector",
        "typeOptions": {
    "itemType" : "com.liferay.journal.model.JournalArticle",
    "itemSubtype": "article-structure-key-15"
        }
    }]
}]
}
```

次の例では、ストラクチャー `metadataset-structure-key-2` を使用している `img` または `jpg` MIME タイプのドキュメントのみを選択できることを指定しています。

```json
{
"fieldSets": [{
    "fields": [{
        "label": "select-content",
        "name": "itemSelector1",
        "type": "itemSelector",
        "typeOptions": {
    "itemType" : "com.liferay.portal.kernel.repository.model.FileEntry",
    "itemSubtype": "metadataset-structure-key-2",
    "mimeTypes": ["img/jpg"]
        }
    }]
}]
}
```

次の例では、ブログエントリーのみを選択できるように指定しています。

```json
{
"fieldSets": [{
    "fields": [{
        "label": "select-content",
        "name": "itemSelector1",
        "type": "itemSelector",
        "typeOptions": {
    "itemType" : "com.liferay.blogs.model.BlogsEntry",
        }
    }]
}]
}
```

そして、このWebコンテンツ記事のHTMLスニペットで、フラグメント内のコンテンツをレンダリングすることができます。

```markup
<div class="fragment_name">
  [#if configuration.itemSelector1.content??]
       ${configuration.itemSelector1.content}
  [/#if]
</div>
```

コンテンツの特定の部分にアクセスする必要がある場合は、フラグメント内のJavaオブジェクトを `[name-of-field]Object` ( 以下の例では`itemSelector1Object` ) のキーでアクセスすることもできます。 次の例は、Web コンテンツの記事のタイトル、説明、および本文をレンダリングします。

```markup
<div class="fragment_name">
  [#if configuration.itemSelector1.content??]
    ${itemSelector1Object.getTitle()}
    ${itemSelector1Object.getDescription()}
    ${itemSelector1Object.getContent()}
  [/#if]
</div>
```

![アイテムセレクタの構成は、既存のコンテンツを表示するためのオプション選択が必要な場合に有効である。](./fragment-configuration-types-reference/images/04.png)

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
                ...
            ]
        }
    ]
}
```

![オプションの選択が必要な場合は、select 設定が有効です。](./fragment-configuration-types-reference/images/05.png)

## テキスト設定

次のJSON構成は、テキストオプションを手動で入力する必要がある場合に実装できる入力テキストフィールドを作成します。

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
                ...
            ]
        }
    ]
}
```

![テキスト設定は、入力テキストオプションが必要な場合に有効です。](./fragment-configuration-types-reference/images/06.png)

## ビデオセレクター

{bdg-secondary}`Liferay 7.4以降で利用可能`

`videoSelector` タイプを使用すると、 [外部ビデオ](../../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) フラグメントを別のフラグメントに組み込むためのビデオセレクタを作成することができます。

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

これは、デフォルトで動画が埋め込まれているフラグメントが欲しい場合に便利です。 以下のJSON設定サンプルは、カードフラグメントに外部ビデオセレクタを組み込む方法を示しています。

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

![ビデオセレクターを使えば、フラグメントに外部ビデオを含めることができます](./fragment-configuration-types-reference/images/07.png)

```{note}
`videoSelector` 型は [external video](../../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#external-video) フラグメントに対応しますが、 [video URL](../../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md) フラグメントには非対応とします。
```

## コレクションセレクター

{bdg-secondary}`Liferay 7.3以降で利用可能`

`collectionSelector` 構成タイプを使用すると、 [コレクション](../../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md) またはコレクションプロバイダを含むフラグメントを開発することができます。 `collectionSelector` は、手動コレクションと動的コレクションの両方で使用することができます。

```{note}
開発者は、コレクションプロバイダを使用して、より高度な基準で特定のコレクションを作成することができます。 詳しくは、開発者向けドキュメント [Info Framework](https://help.liferay.com/hc/ja/articles/360029067251-Introduction-to-The-Info-Framework) の [情報リストプロバイダの作成](https://help.liferay.com/hc/ja/articles/360029067271-Creating-an-Information-List-Provider) の情報をご覧ください。
```

次のJSON設定は、 `collectionSelector`を使用する方法を示しています。

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

このフラグメント構成を以下のHTMLコードサンプルで使用すると、コレクションアイテムの一覧を表示することができます。 `collectionObjectList` は、 [コンテンツページエディタ](../../../creating-pages/using-content-pages/content-page-editor-ui-reference.md)で選択されたコレクションを表します。

このコレクションを HTML で参照するには、JSON 設定でコレクション名 `を` に、サフィックスを `ObjectList` にします。 前のJSONコードの抜粋では、コレクション `名前` は `コレクション` なので、HTMLは `collectionObjectList`を使ってコレクションを参照しています。

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

![コレクション設定を使用して、コレクションセレクタを持つフラグメントを開発することができます。](./fragment-configuration-types-reference/images/08.png)

また、 `collectionSelector` の設定で、 `itemType` を使用してコレクションセレクタをフィルタリングすることもできます。 例えば、Webコンテンツとブログを含む異なるコレクションがある場合、コレクションセレクターを制限して、ブログコレクションのみを表示することができます。 このJSONサンプルは、この設定を説明するものです。

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

このサンプル設定を使用すると、コレクションタイプがアセットであるため、Webコンテンツとブログの両方を含むコレクションは、コレクションセレクタからフィルタリングされます。

![ウェブコンテンツやブログエントリーを含むコレクションがアセットタイプに相当します。](./fragment-configuration-types-reference/images/09.png)

```{tip}
設定には `itemTime` の他に、`itemSubtype` を指定することができます。 itemSubtype` は、アセット `classPK` に対応します。
```

## 追加情報

- [フラグメントの開発](../../developing-page-fragments/developing-fragments-intro.md)
- [フラグメント固有のタグリファレンス](./fragment-specific-tags-reference.md)
- [ページ フラグメントエディタのインターフェイスリファレンス](./page-fragment-editor-interface-reference.md)
- [スタイルブックを使用してサイトの外観を標準化する](../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)
