# エレメントを作る

検索ブループリントに同梱されている [システムエレメントはたくさんある](../search-blueprints-elements-reference.md)。 どのシステム要素もあなたのニーズを満たさない場合、独自の検索ブループリント要素を作成する多くの方法があります：

* [Custom JSON Element](#using-the-custom-json-elements) を使用して、Search Blueprints [Query Builder](../creating-and-managing-search-blueprints.md#using-the-query-builder) から Element を作成します。
* [Add Element source editor](#using-the-add-element-source-editor) を使用すると、便利なプレビュー機能やシステム内の定義済みテンプレート変数のリストを含む、より堅牢なエレメントエディタを使ってエレメントを記述することができます。
* [システムエレメント](./managing-elements.md) を複製して、独自のカスタムエレメントを開発しましょう。
* [Elasticsearch query DSL](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/query-dsl.html) を使い慣れていて、Elasticsearchクエリに基づいて素早く要素を作成する必要がある場合は、 [Paste Any Elasticsearch Query system Element](../search-blueprints-elements-reference.md#paste-any-elasticsearch-query) を使ってください。

## カスタムJSON要素の使用

他のブループリントで再利用することを意図していない要素は、ブループリントの作業中に [クエリビルダ](../creating-and-managing-search-blueprints.md#using-the-query-builder) で追加できます。 これらは起源のブループリントでのみ利用可能で、ブループリント検索の要素セクションには表示されません。

カスタムJSON要素をビルダーに追加し、定型JSONの編集を開始します：

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

JSONエディターに入力すると、オートコンプリートによって利用可能なプロパティが表示されます。 これらをさらに理解するには、 [スキーマを理解する](#understanding-the-element-schema) を参照してください。

どのような要素でもカスタムJSON要素に書くことができますが、通常、この方法は、クエリ句とおそらく条件を追加する単純な要素に最適です。 多くの場合、これらは `uiConfiguration` セクションを必要とせず、要素で使用できる定義済みのテンプレート変数を多用しません。 より複雑なケースでは、 [Element source editor](#using-the-add-element-source-editor) を使用してください。

例えば、以下のExclude Journal Articles要素は、Custom JSON要素に基づいています。 これは、 `exclude.journal_articles` というパラメータが `true`である場合にのみ、エレメントのクエリーが適用されるように条件を追加するものである。 このクエリは、結果がウェブコンテンツ記事の `entryClassName` フィールドと一致しないことを確認するために、 `must_not` term クエリ句を追加します。

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

この要素は、ブループリントのパラメータ構成を使用して追加できるカスタム変数に依存します。 ブループリントへのカスタム変数の追加については、 [Search Blueprints Configuration Reference](../search-blueprints-configuration-reference.md#parameter-configuration) を参照してください。

## 要素ソース・エディターの追加

エレメンツをより強固に編集することができます。 Search Blueprint の Elements セクションから、 **Add**(![Add](../../../../../images/icon-add.png)) をクリックします。

要素に名前を付け、 **Create** をクリックする。 要素ソース・エディターが表示され、エディターの左側のペインに定義済み変数が表示されます。 JSONエディターに入力すると、オートコンプリートによって利用可能なプロパティが表示されます。 利用可能なJSONプロパティをさらに理解するには、 [Understanding the Schema](#understanding-the-element-schema) を参照。


![エレメント・ソース・エディターでエレメントを作成する。](./creating-elements/images/02.png)

UIコンフィギュレーションのオプションは、エレメントJSONの `uiConfiguration` プロパティで定義されます。 クエリビルダで要素の設定ウィンドウをプレビューするには、 **Preview**（キャンセルボタンの隣）リンクをクリックします。

![Element Configurationウィンドウをプレビューする。](./creating-elements/images/03.png)

### 定義済み変数

エレメント・ソース・エディターのエレメントに定義済み変数を挿入するには、カーソルを希望の位置に置き、左側のサイドバーで変数をクリックします。 カスタムJSON要素では、エディタに変数を直接入力する必要があります。

詳細は [定義済み要素変数リファレンス](./predefined-element-variables-reference.md) を参照。

## 要素スキーマを理解する

```{warning}
要素スキーマ](#understanding-the-element-schema)は変更可能です。 Liferayのバージョン間でスキーマが変更されると、古いエレメントのJSONのインポートに失敗することがあります。
```

<!-- TODO: change the link below to use the git tag when we update the version to one that supports this feature. -->

検索ブループリント要素のスキーマは、 [sxp-query-element.schema.json](https://github.com/liferay/liferay-portal/blob/master/modules/dxp/apps/search-experiences/search-experiences-web/src/main/resources/META-INF/resources/sxp_blueprint_admin/schemas/sxp-query-element.schema.json) ファイルで定義されています。 REST API Explorerにアクセスできるユーザーは、スキーマをより便利に閲覧できる。 Liferay にログインした状態で、次のサイトにアクセスします。

<http://localhost:8080/o/api?endpoint=http://localhost:8080/o/search-experiences-rest/v1.0/openapi.json>

**POST /v1.0/sxp-blueprints** エンドポイントエントリーを展開します。 下にスクロールして、 **Schema** リンク（**Example Value** リンクの隣）をクリックします。

![APIエクスプローラから要素スキーマを探索する。](./creating-elements/images/04.png)

```{tip}
システム要素の構文を調べて、スキーマ要素を使用して要素がどのように構築されるかをよりよく理解する。
```

`elementDefinition` および `title_i18n`。 `elementDefinition` は、 `category` と、 `configuration` &rarr; `queryConfiguration` プロパティを含まなければならない：

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

タイトルフィールドで、要素のタイトルテキストを必要な言語数だけ設定する。

### 要素の作成 `elementDefinition`

`elementDefinition` が、作業の大部分を行う場所である。 そのプロパティには、 `category`、 `configuration`、 `icon`、 `uiConfiguration`がある。

`category` 要素の振る舞いを分類する文字列を提供します。 `match`, `boost`, `conditional`, `filter`, `hide`, or `custom`を指定する。

`configuration` は `queryConfiguration` を提供し、`queryEntries` プロパティを通して、投稿するクエリ句を保持する。

`icon` 要素に使用するアイコンを文字列で指定します。 [Lexicon Icon Library](../../../../../building-applications/developing-a-java-web-application/using-mvc/tag-libraries/clay-tag-library/clay-icons.md) で利用可能な任意の画像を使用することができます（例： `サムズアップ`）。

`uiConfiguration` UIに表示するコンフィギュレーション要素を設定し、設定した値をカスタムエレメントに渡します。

たとえば、 `entryClassName` フィールドのタームクエリ一致をブーストするエレメントは、クエリと UI を次のように設定できます：

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

### Element `コンフィギュレーションの定義`

`configuration` プロパティは、 `queryConfiguration` &rarr; `queryEntries`のネストされたプロパティを保持する。

`queryEntries` JSONに飛び込むと、プロパティ `clauses`, `conditions`, `enabled`, `postFilterClauses`, and `rescores`を含むことができる。

- 上のスニペットは、 `節` (要素の配列) を使用して、ブループリント主導の検索にクエリ節を追加する Element を示しています。 `クエリ`に加えて、 `additive`、 `boost`、 `content`、 `disabled`、 `field`、 `name`、 `occur`、 `parent`、 `type`、または `value` properties を追加できる。
- `条件` は、ブーリアン・チェックを提供する。 trueの場合、指定された節は検索クエリに含まれ、falseの場合、それらは除外される。
- エレメントを無効にするには、 `enabled` （デフォルトではtrue）をfalseに設定します。
- `postFilterClauses` を追加する（ `節` 要素の配列として）。 `additive`, `boost`, `content`, `disabled`, `field`, `name`, `occur`, `parent`, `query`, `type`, or `value` properties.
- `rescores` を追加して、クエリの結果の関連性スコアを再計算する。 `query`, `queryWeight`, `rescoreQueryWeight`, `scoreMode`, and `windowSize`を指定する。 詳細は [Elasticsearch ドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/filter-search-results.html#rescore) を参照してください。

`uiConfiguration` プロパティは、ネストされたプロパティ `fieldSet` と `field`を保持する。

UIコンフィギュレーションの各フィールドに追加できるコンフィギュレーション・プロパティがいくつかあります：

- `defaultValue` を使って、フィールドの初期値を入力する。
- `helpText` と入力すると、ブループリント UI にフィールドのヘルプ テキストが表示されます。
- 人間が読める `ラベル`を入力する。
- クエリ句にフィールド値を渡すときなど、エレメント内の他の場所でフィールドを参照するために使用できる `名` を入力します： `${configuration.name}`。
- フィールドの `タイプ` を設定する。 ` <code>date , fieldMapping , fieldMappingList (利用可能なフィールドのリスト、ロケールとフィールドブースト付き), itemSelector , json , keywords , multiselect , number , select , slider , and text から選択します。` `` `` `` `` `` `` ``</code> `` ``
- `typeOptions` プロパティを使用して、各タイプのフィールドで利用可能なオプションを設定します。 例えば、セレクト・フィールドに表示される `オプション` を設定する。
   - `boost` フィールドごとに数値ブースト値を設定する。
   - `フォーマット` は、 [受け入れ可能な日付フォーマット](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/mapping-date-format.html) を決定する（例えば、 `yyyyMMddHHmmss`）。
   - `nullable` null 値を渡せるかどうかを設定します。
   - `options` セレクト・フィールドのオプションを設定します。
   - `required` コンフィギュレーションが値を持たなければならないかどうかを設定します。
   - `step` 数値またはスライダー・フィールドの数値の増減を設定します。
   - `unit` 数値フィールドの測定単位を設定する。
   - `unitSuffix` は、単位を持つ数値フィールドに表示する単位表記を設定します（例えば、 `unit` が `km`の場合、 `unitSuffix` を `km` または `kilometers`と設定できます）。

## 関連トピック

- [検索ブループリントの作成と管理](../creating-and-managing-search-blueprints.md)
- [検索ブループリント要素のリファレンス](../search-blueprints-elements-reference.md)
- [検索ブループリント設定のリファレンス](../search-blueprints-configuration-reference.md)
