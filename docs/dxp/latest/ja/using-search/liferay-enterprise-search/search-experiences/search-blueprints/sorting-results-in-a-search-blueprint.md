# 検索ブループリントの結果の並べ替え

検索ブループリントに [ソート設定](./search-blueprints-configuration-reference.md#sort-configuration) を追加して、検索結果の順序を制御します。

1. **グローバルメニュー**(![Global Menu](../../../../images/icon-applications-menu.png)) を開き、 ［**アプリケーション**］ タブをクリックし、 ［**ブループリント**］ を選択します。

1. [ブループリントを作成する](./creating-and-managing-search-blueprints.md)か、既存のブループリントを開きます。

1. ［**Configuration**］ タブをクリックし、［Sort Configuration］テキストエリアにJSONを入力します。

![JSONを入力して、ブループリントの結果を並べ替えます。](./sorting-results-in-a-search-blueprint/images/01.png)

```{important}
* 検索ページでソートを設定するために、[Sort widget](../../../search-pages-and-widgets/search-results/sorting-search-results.md) と検索ブループリントの両方を使用することは避けてください。 Liferayは一貫した動作を保証できません。

* 以下の例は簡単なものです。 堅牢なソート構成は、あらゆるシナリオを考慮する必要があります。 例えば、検索結果ドキュメントにソートフィールドが含まれていない場合、 [`missing`](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/sort-search-results.html#_missing_values) パラメーターを使用してソートの動作を設定することができます。

   詳しくは、 [Elasticsearch's sorting documentation](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/sort-search-results.html) をご覧ください。
```

## 例1：タイトル順に並べ替える

ソート設定とは、昇順（`asc`）または降順（`desc`）で並べ替えるフィールドを定義する `sorts` 配列を持つJSONオブジェクトです。

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
* 特に `title` のようなローカライズされたテキストフィールドでは、類似した名前のフィールドバリエーションが検索ドキュメントに含まれることがあります。 `localized_title_en_US_sortable`など、フィールドのローカライズされ、ソート可能なキーワードのバリエーションを使用します。 各エンティティのドキュメントを確認し、使用可能なフィールドを探します。 例えば、`title_sortable`は共通のフィールドですが、同じエンティティに`localized_title_en_US_sortable`も含まれることがあります。

* 言語IDを直接入力する代わりに、`${context.language_id}` 変数を使用して、4文字の言語コード (例: `en_US`) を現在の言語で自動入力することができます。

* 文書のフィールドを見るには、ブループリントのツールバーの_Preview_をクリックし、検索を実行し、その結果のフィールドを展開します。
```

## 例2：ストラクチャー項目による並べ替え

[Webコンテンツストラクチャー](../../../../content-authoring-and-management/web-content/web-content-structures.md)フィールドは、検索エンジンのドキュメントにネストされたフィールドとしてインデックスされます。

ドキュメントを表示すると、入れ子になったプロパティは `ddmFieldArray`の下に表示されます。

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

ネストされたフィールドを含むドキュメントを表示するには、

1. ドキュメント`_source`の取得を有効にするには、ブループリントの ［**設定**］ タブを開き、このJSONを［詳細設定］ボックスに入力します。

    ```json
    {
       "source": {
          "fetchSource": true
       }
    }
    ```

1. ツールバーの **プレビュー** をクリックし、ネストしたフィールドを持つ結果を検索し、そのフィールドを展開します。

ネストされたフィールドの場合、ソート構成のフィールド宣言はより複雑になります。

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

## 例3：オブジェクトフィールドによる並べ替え

[オブジェクト](../../../../building-applications/objects.md)エントリーフィールドは、検索エンジンドキュメントにネストされたフィールドとしてインデックスされます。

ドキュメントを表示する際、オブジェクトのネストされたプロパティは `nestedFieldArray`の下に表示されます。

```json
"nestedFieldArray" : [
            {
              "fieldName": "total",
              "valueFieldName": "value_integer",
              "value_integer": "8"
            }
]
```

ネストされたフィールドを含むドキュメントを表示するには、

1. ドキュメント`_source`の取得を有効にするには、ブループリントの ［**設定**］ タブを開き、このJSONを［詳細設定］ボックスに入力します。

    ```json
    {
       "source": {
          "fetchSource": true
       }
    }
    ```

1. ツールバーの **プレビュー** をクリックし、ネストしたフィールドを持つ結果を検索し、そのフィールドを展開します。

この例では、オブジェクトの整数フィールドで並べ替えます。

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

* [検索ブループリント設定のリファレンス](search-blueprints-configuration-reference.md)
* [検索結果の並べ替え](../../../search-pages-and-widgets/search-results/sorting-search-results.md)
