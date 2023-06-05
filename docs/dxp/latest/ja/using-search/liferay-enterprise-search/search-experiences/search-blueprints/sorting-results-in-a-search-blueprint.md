# 検索ブループリントで結果をソートする

検索ブループリントに [ソート設定](./search-blueprints-configuration-reference.md#sort-configuration) を追加して、検索結果の順序を制御します：

1. **Global Menu**(![Global Menu](../../../../images/icon-applications-menu.png)) を開き、 **Applications** タブをクリックし、 **Blueprints** を選択します。

1. [ブループリント](./creating-and-managing-search-blueprints.md) を作成するか、既存のブループリントを開いてください。

1. **Configuration** タブをクリックし、Sort Configuration テキストエリアに JSON を入力します。

![JSONを入力して、ブループリントの結果をソートします。](./sorting-results-in-a-search-blueprint/images/01.png)

```{important}
* 検索ページでソートを設定するために、[Sort widget](../../search-pages-and-widgets/search-results/sorting-search-results.md) と検索ブループリントの両方を使用しないようにします。 Liferayは一貫した動作を保証するものではありません。

* 以下の例は簡単なものです。 堅牢なソート構成は、あらゆるシナリオを考慮する必要があります。 例えば、検索結果文書にソートフィールドが含まれていない場合、 [`missing`](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/sort-search-results.html#_missing_values) パラメータを使用してソートの動作を設定することができます。

   詳しくは [Elasticsearchのソーティングドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/sort-search-results.html) をご覧ください。
```

## 例1：タイトルでソートする

ソート設定とは、昇順(`asc`）または降順(`desc`）でソートするフィールドを定義する `sorts` 配列を持つJSONオブジェクトです。

```json
{
   "sorts": [
      {
         "localized_title_${context.language_id}_sortable": "asc"
      }
   ]
}
```

```{tip}
* 特に `title` のようなローカライズされたテキストフィールドでは、類似した名前のフィールドバリエーションが検索文書に含まれることがあります。 ローカライズされ、ソート可能なキーワードのバリエーションとして、`localized_title_en_US_sortable`のようなフィールドを使用してください。 各エンティティのドキュメントを確認し、使用可能なフィールドを探します。 例えば、`title_sortable`は共通のフィールドですが、同じエンティティに`localized_title_en_US_sortable`も含まれることがあります。

* 言語IDを直接入力する代わりに、`${context.language_id}` 変数を使用して、4文字の言語コード (例えば `en_US`) を現在の言語で自動入力することができます。

* 文書のフィールドを見るには、ブループリントのツールバーの_Preview_をクリックし、検索を実行し、その結果のフィールドを展開します。
```

## 例2：構造体フィールドによる並べ替え

[ウェブコンテンツの構造](../../../../content-authoring-and-management/web-content/web-content-structures.md) フィールドは、検索エンジンのドキュメントにネストされたフィールドとしてインデックスされます。

文書を表示する際、入れ子になったプロパティは `ddmFieldArray`の下に表示されます：

```json
"ddmFieldArray" : [
          {
            "ddmFieldName" : "ddm__keyword__30805__department_en_US",
            "ddmValueFieldName" : "ddmFieldValueKeyword_en_US",
            "ddmFieldValueKeyword_en_US" : "true",
            "ddmFieldValueKeyword_en_US_String_sortable" : "true"
          }
]
```

ドキュメントをネストされたフィールドとともに表示する、

1. ドキュメント `_source` のフェッチを有効にするには、ブループリントの **Configuration** タブを開き、この JSON を Advanced Configuration ボックスに入力します：

    ```json
    {
       "source": {
          "fetchSource": true
       }
    }
    ```

1. ツールバーの **プレビュー** をクリックし、ネストしたフィールドを持つ結果を検索し、そのフィールドを展開します。

ネストされたフィールドの場合、ソート構成のフィールド宣言はより複雑になります：

```json
{
   "sorts": [
      {
         "ddmFieldArray.ddmFieldValueKeyword_${context.language_id}_String_sortable": {
            "nested": {
               "nested_path": "ddmFieldArray",
               "nested_filter": {
                  "term": {
                     "ddmFieldArray.ddmFieldName": {
                        "value": "ddm__keyword__30805__department_${context.language_id}"
                     }
                  }
               }
            },
            "order": "asc"
         }
      }
   ]
}
```

## 例3：オブジェクトフィールドでソートする場合

[Object](../../../../building-applications/objects.md) 入力フィールドは、検索エンジンのドキュメントにネストされたフィールドとしてインデックスされます。

ドキュメントを表示する際、オブジェクトのネストされたプロパティは `nestedFieldArray`の下に表示されます：

```json
"nestedFieldArray" : [
            {
              "fieldName": "total",
              "valueFieldName": "value_integer",
              "value_integer": "8"
            }
]
```

ドキュメントをネストされたフィールドとともに表示する、

1. ドキュメント `_source` のフェッチを有効にするには、ブループリントの **Configuration** タブを開き、この JSON を Advanced Configuration ボックスに入力します：

    ```json
    {
       "source": {
          "fetchSource": true
       }
    }
    ```

1. ツールバーの **プレビュー** をクリックし、ネストしたフィールドを持つ結果を検索し、そのフィールドを展開します。

この例では、オブジェクトの整数フィールドでソートしています：

```json
{
   "sorts": [
      {
         "nestedFieldArray.value_integer": {
            "nested": {
               "nested_path": "nestedFieldArray",
               "nested_filter": {
                  "term": {
                     "nestedFieldArray.fieldName": "total"
                  }
               }
            },
            "order": "desc"
         }
      }
   ]
}
```

## 関連トピック

* [検索 ブループリント コンフィギュレーション リファレンス](search-blueprints-configuration-reference.md)
* [検索結果の並べ替え](../../../search-pages-and-widgets/search-results/sorting-search-results.md)
