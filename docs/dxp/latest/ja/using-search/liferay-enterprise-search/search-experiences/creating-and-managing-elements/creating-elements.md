# エレメントの作成

Search Blueprints に同梱されている [system Elements はたくさんあります](../search-blueprints-elements-reference.md). システムエレメントで対応できない場合は、サーチブループリントのエレメントを独自に作成する方法もあります。

* [Custom JSON Element](#using-the-custom-json-elements) を使用して、Search Blueprints [Query Builder](../creating-and-managing-search-blueprints.md#using-the-query-builder) から Element を作成します。
* [Add Element source editor](#using-the-add-element-source-editor) を使用すると、便利なプレビュー機能やシステム内の定義済みテンプレート変数のリストなど、より堅牢なElementエディタを使用してElementを記述することができます。
* [システムのElement](./managing-elements.md) を複製して、独自のカスタムElementを開発するためのスタートラインに立つことができます。
* [Paste Any Elasticsearch Query system Element](../search-blueprints-elements-reference.md#paste-any-elasticsearch-query) クエリDSL の使い方に慣れていて、Elasticsearchクエリを元に素早くElementを作り上げたい場合は、この方法を使用します。

## カスタムJSON要素の使用

他のブループリントで再利用されることを意図していない要素は、ブループリントの作業中に [Query Builder](creating-and-managing-search-blueprints.md#using-the-query-builder) で追加することができます。 これらは、原点のブループリントでのみ利用可能で、ブループリントの検索の要素セクションには表示されません。 

Custom JSON Elementをビルダーに追加し、定型的なJSONの編集を開始します。



```json
{
   "description_i18n": {
      "en_US": "Editable JSON Text Area"
   },
   "elementDefinition": {
      "category": "custom",
      "configuration": {},
      "icon": "custom-field"
   },
   "title_i18n": {
      "en_US": "Custom JSON Element"
   }
}
```


JSONエディタに入力すると、オートコンプリートにより、利用可能なプロパティが表示されます。 利用可能なJSONプロパティをさらに理解するには、 [スキーマを理解する](#understanding-the-element-schema) を参照してください。

どのような要素でもカスタムJSON要素で記述することができますが、通常、この方法は、クエリ句とおそらく条件を追加する単純な要素にのみ使用するのが最適です。 多くの場合、 `uiConfiguration` セクションは必要なく、Element で使用できる定義済みのテンプレート変数を広範囲に使用することはありません。 より複雑なケースでは、 [Element source editor](#using-the-add-element-source-editor) をご利用ください。

例えば、以下のExclude Journal Articles Elementは、Custom JSON Elementをベースにしています。 `exclude.journal_articles` というパラメータが `true`のときだけ、Element のクエリが適用されるように条件を追加しています。 このクエリでは、 `must_not` term クエリ句を追加して、結果が Web Content article の `entryClassName` フィールドと一致しないことを確認しています。



```json
{
   "description_i18n": {
      "en_US": "Exclude journal articles from the search."
   },
   "elementDefinition": {
      "category": "hide",
      "configuration": {
         "queryConfiguration": {
            "queryEntries": [
               {
                  "clauses": [
                     {
                        "context": "query",
                        "occur": "filter",
                        "query": {
                           "bool": {
                              "should": [
                                 {
                                    "bool": {
                                       "must_not": [
                                          {
                                             "term": {
                                                "entryClassName": {
                                                "value": "com.liferay.journal.model.JournalArticle"}
                                             }
                                          }
                                       ]
                                    }
                                 },
                                 {
                                    "bool": {
                                       "must": [
                                          {
                                             "term": {
                                                "discussion": false
                                             }
                                          }
                                       ]
                                    }
                                 }
                              ]
                           }
                        }
                     }           
                  ],
                  "condition": {
                     "contains": {
                        "parameterName": "exclude.journal_articles",
                        "value": "true"
                     }
                  }
               }
            ]
         }
      },
      "icon": "hidden"
   },
   "title_i18n": {
      "en_US": "Exclude Journal Articles"
   }
}
```


この要素は、ブループリントのパラメータ構成を使用して追加できるカスタム変数に依存します。 ブループリントにカスタム変数を追加する方法については、 [Search Blueprints Configuration Reference](../search-blueprints-configuration-reference.md#parameter-configuration) を参照してください。



## 要素ソース追加エディターを使う

Elementsを構築するために、より強固な編集環境を提供します。 Search BlueprintsのElementsセクションから、Add(![Add](../../../../images/icon-add.png))ボタンをクリックします。 

要素に名前を付けて、 **Create** をクリックします。 Element Sourceエディタが表示され、エディタ左側のペインにPredefined Variablesが表示されます。 JSONエディタに入力すると、オートコンプリートにより、利用可能なプロパティが表示されます。 利用可能なJSONプロパティをさらに理解するには、 [スキーマを理解する](#understanding-the-element-schema) を参照してください。

![エレメントソースエディタでエレメントを作成します。](./creating-elements/images/02.png)

UI設定オプションは、Element JSON内の `uiConfiguration` プロパティで定義されます。 要素の設定ウィンドウがクエリビルダでどのように表示されるかをプレビューするには、 **プレビュー** リンク（キャンセルボタンの隣）をクリックします。

![要素設定ウィンドウをプレビューします。](./creating-elements/images/03.png)



### 定義済み変数

要素ソースエディタで要素に定義済み変数を追加するには、変数を配置する場所にカーソルを置き、左側のサイドバーで変数をクリックして挿入させます。 Custom JSON Elementでは、エディタに直接変数を入力する必要があります。

詳しくは、 [定義済み要素変数リファレンス](./predefined-element-variables-reference.md) をご覧ください。



## 要素スキーマの理解



```{warning}
[要素スキーマ](#understanding-the-element-schema) は変更されることがあります。 Liferayのバージョン間でスキーマが変更された場合、古いエレメントのJSONのインポートに失敗することがあります。
```


Search Blueprint Elements のスキーマは、 [sxp-query-element.schema.json](https://github.com/liferay/liferay-portal/blob/master/modules/dxp/apps/search-experiences/search-experiences-web/src/main/resources/META-INF/resources/sxp_blueprint_admin/schemas/sxp-query-element.schema.json) ファイルに定義されています。 REST API Explorerにアクセスできるユーザーは、より便利にスキーマを参照することができます。 Liferayにログインした状態で、次のページにアクセスします。

<http://localhost:8080/o/api?endpoint=http://localhost:8080/o/search-experiences-rest/v1.0/openapi.json>

**POST /v1.0/sxp-blueprints** エンドポイントエントリを展開します。 下にスクロールして、 **Schema** リンク（**Example Value** リンクの隣）をクリックします。

![APIエクスプローラーからElementスキーマを探索します。](./creating-elements/images/04.png)



```{tip}
システム要素の構文を確認し、スキーマ要素を使用して要素がどのように構築されるかをよりよく理解することができます。
```


各要素は、次の2つの必須トップレベル特性を持つ： `elementDefinition` and `title_i18n`. `elementDefinition` には、 `category` と `configuration` &rarr; `queryConfiguration` のプロパティを含める必要があります。



```json
{
    "elementDefinition": {
        "category": "custom",
        "configuration": {
            "queryConfiguration": {}
        }
    },
    "title_i18n": {
        "en_US": "Custom JSON Element"
    }
}
```


タイトル欄には、要素のタイトルテキストを必要な数だけ言語設定します。



### エレメントの作成 `elementDefinition`

`elementDefinition` は、作業の大部分を行う場所です。 そのプロパティは、 `category`, `configuration`, `icon`, `uiConfiguration`です。 

- `category` は、Element の振る舞いを分類する文字列を提供する。 `match`, `boost`, `conditional`, `filter`, `hide`, or `custom`を指定する。
- `` `queryConfiguration`を提供し、 `queryEntries` プロパティを介して、あなたが貢献しているクエリ句を保持します。
- `icon` 要素にどの利用可能なアイコンを使用するかを設定する文字列を設定します。 [Lexicon Icon Library](../../../../building-applications/developing-a-java-web-application/using-mvc/tag-libraries/clay-tag-library/clay-icons.md) で利用可能な任意の画像を使用することができます（例： `thumbs-up`）。
- `uiConfiguration` は、UIに表示する設定要素を設定し、設定した値をカスタムElementに渡します。

たとえば、 `entryClassName` フィールドの条件クエリ一致度を高める要素は、クエリと UI を次のように設定できます。



```json
"configuration": {
   "queryConfiguration": {
      "queryEntries": [
         {
            "clauses": [
               {
                  "query": {
                     "term": {
                        "entryClassName": {
                           "boost": "${configuration.boost}",
                           "value": "${configuration.entry_class_name}"
                        }
                     }
                  }
               }
            ]
         }
      ]
   }
},
"uiConfiguration": {
   "fieldSets": [
      {
         "fields": [
            {
               "defaultValue": 1,
               "label": "Boost",
               "name": "boost",
               "type": "number",
               "typeOptions": {
                  "min": 0
               }
            }
         ]
      }
   }
```




### Element `の設定`を定義する。

`configuration` property はネストしたプロパティを保持する `queryConfiguration` &rarr; `queryEntries`.

`queryEntries` JSONに飛び込むと、プロパティ `clauses`, `conditions`, `enabled`, `postFilterClauses`, and `rescores`を含むことができます。 

- 上のスニペットは、 `clauses` (要素の配列) を使って、Element が Blueprint-driven search に寄与するクエリ句を追加している様子を示しています。 `クエリ`に加えて、 `additive`, `boost`, `content`, `disabled`, `field`, `name`, `occur`, `parent`, `type`, or `value` properties を追加可能です。
- `条件` は、ブーリアン・チェックを提供します。 trueの場合、提供された句は検索クエリに含まれ、falseの場合、それらは省かれます。
- `enabled` を false に設定すると（デフォルトでは true です）、Element が無効になります。
- `postFilterClauses` を追加（ `節` 要素の配列として）。 `additive`, `boost`, `content`, `disabled`, `field`, `name`, `occur`, `parent`, `query`, `type`, or `value` propertyを追加することができる。
- `rescores` を追加して、クエリの結果に対する関連性スコアを再計算します。 `query`, `queryWeight`, `rescoreQueryWeight`, `scoreMode`, and `windowSize`を指定する。 詳しくは、 [Elasticsearchのドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/filter-search-results.html#rescore) をご覧ください。

`uiConfiguration` プロパティは、ネストされたプロパティ `fieldSet` と `field`を保持します。

UIコンフィギュレーションの各フィールドに追加できる設定プロパティは多数あります。

- `defaultValue` を使用して、フィールドの初期値を入力します。
- `helpText` と入力すると、Blueprints UI にフィールドのヘルプテキストが表示されます。
- 人間が読みやすい `ラベルを入力する`.
- `` `${configuration.name}`という名前を入力します。この名前は、クエリ句にフィールドの値を渡すときなど、要素の他の場所でフィールドを参照するために使用できます。
- フィールドの `タイプ` を設定します。 `date`, `fieldMapping`, `fieldMappingList` （利用可能なフィールドのリストとそのロケール、フィールドブースト）, `itemSelector`, `json`, `keywords`, `multiselect`, `number`, `select`, `slider`, and `text`から選択できます。
- `typeOptions` プロパティを使用して、各フィールドのタイプで利用可能なオプションを設定する。 例えば、セレクトフィールドに表示される `オプション` を設定します。 
     - `boost` フィールドごとのブースト値を数値で設定します。
   - `format` は、 [受入可能な日付形式](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/mapping-date-format.html) を決定する（例： `yyyyMMddHHmmss`）。
   - `nullable` null 値を渡すことができるかどうかを設定する。
   - `options` セレクトフィールドのオプションを設定します。
   - `required` 構成に値が必要であるかどうかを設定します。
   - `step` 数値またはスライダーフィールドの数値の増加または減少を設定します。
   - `unit` 数値フィールドの計測単位を設定する。
   - `unitSuffix` は、単位を持つ数値フィールドに表示する単位表記を設定します（例えば、 `unit` が `km`であれば、 `unitSuffix` を `km` または `kilometers`と設定することができます）。



## 追加情報

- [検索ブループリントの作成と管理](../creating-and-managing-search-blueprints.md)
- [検索ブループリント要素のリファレンス](../search-blueprints-elements-reference.md)
- [検索ブループリント 構成リファレンス](../search-blueprints-configuration-reference.md) 
