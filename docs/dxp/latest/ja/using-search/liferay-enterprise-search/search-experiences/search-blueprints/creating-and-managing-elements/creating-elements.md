# エレメントを作る

[Search Blueprintsに同梱されているシステム要素](../search-blueprints-elements-reference.md)がたくさんあります。どのシステム要素もあなたのニーズを満たしていない場合、独自のSearch Blueprints要素を作成する方法はたくさんあります：

* [Custom JSON Element](#using-the-custom-json-elements) を使用して、Search Blueprints [Query Builder](../creating-and-managing-search-blueprints.md#using-the-query-builder) から Element を作成します。
* [Add Element source editor](#using-the-add-element-source-editor) を使用すると、便利なプレビュー機能やシステムで定義済みのテンプレート変数のリストなど、より堅牢なElementエディタを使用してElementを記述することができます。
* [システムのElement](./managing-elements.md) を複製して、独自のカスタムElementを開発するためのスタートラインに立つことができます。
* [Elasticsearch クエリ DSL](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl.html) の使用に慣れていて、Elasticsearch クエリに基づいて素早く Element を作成する必要がある場合は、 [Paste Any Elasticsearch Query system Element](../search-blueprints-elements-reference.md#paste-any-elasticsearch-query) を使ってください。

## カスタムJSON要素の使用

他のブループリントで再利用することを想定していない要素は、ブループリントの作業中に [Query Builder](../creating-and-managing-search-blueprints.md#using-the-query-builder) で追加することができます。 これらは、原点となるブループリントでのみ利用可能で、「ブループリントを検索」の「要素」セクションには表示されません。 

Custom JSON Elementをビルダーに追加し、定型のJSONの編集を開始します：

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

JSONエディターで入力すると、オートコンプリートにより、利用可能なプロパティが表示されます。 さらに理解を深めるには、 [スキーマを理解する](#understanding-the-element-schema) を参照してください。

どのような要素でもカスタムJSON要素に書き込むことができますが、通常、この方法は、クエリ句とおそらく条件を追加する単純な要素に最も適しています。 多くの場合、 `uiConfiguration` セクションは必要なく、Elementで使用できる定義済みのテンプレート変数を広範囲に使用することはありません。 より複雑なケースでは、 [Element source editor](#using-the-add-element-source-editor) を使用してください。

例えば、以下のExclude Journal Articles Elementは、Custom JSON Elementをベースにしています。 `exclude.journal_articles` というパラメータが `true`の場合のみ、Element のクエリが適用されるように条件を追加します。 このクエリでは、 `must_not` term query clause を追加して、結果が Web Content article の `entryClassName` フィールドに一致しないことを確認します。

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

この要素は、ブループリントのパラメータ構成を使用して追加できるカスタム変数に依存します。 ブループリントへのカスタム変数の追加については、「 [Search Blueprints Configuration Reference」](../search-blueprints-configuration-reference.md#parameter-configuration) を参照してください。

## 要素ソース追加エディターを使う

Elementsを構築するための、より強固な編集作業を行うことができます。 ブループリントを検索」の「要素」セクションから、「**追加**」(![Add](../../../../../images/icon-add.png)) をクリックします。 

要素に名前を付けて、 **作成** をクリックします。 要素ソースエディタが表示され、エディタ左側のペインに「定義済み変数」が表示されます。 JSONエディターで入力すると、オートコンプリートにより、利用可能なプロパティが表示されます。 利用可能な JSON プロパティについてさらに理解するには、 [スキーマを理解する](#understanding-the-element-schema) を参照してください。

![エレメントソースエディターでエレメントを作成します。](./creating-elements/images/02.png)

UI設定オプションは、Element JSONの `uiConfiguration` プロパティで定義されます。 Query BuilderでElementの設定画面をプレビューするには、 **Preview**(Cancelボタンの隣）リンクをクリックします。

![Element Configuration」ウィンドウをプレビューします。](./creating-elements/images/03.png)

### 定義済み変数

要素ソースエディタで要素に定義済みの変数を挿入するには、目的の場所にカーソルを置き、左側のサイドバーで変数をクリックします。 カスタムJSON要素では、エディタに直接変数を入力する必要があります。

詳細は「 [Predefined Element Variables Reference」](./predefined-element-variables-reference.md) をご参照ください。

## 要素スキーマの理解

```{warning}
要素スキーマ](#understanding-the-element-schema)は変更することができます。 Liferayのバージョン間でスキーマが変更された場合、古い方のエレメントのJSONのインポートに失敗することがあります。
```

<!-- TODO: change the link below to use the git tag when we update the version to one that supports this feature. -->

検索ブループリント要素のスキーマは、 [sxp-query-element.schema.json](https://github.com/liferay/liferay-portal/blob/master/modules/dxp/apps/search-experiences/search-experiences-web/src/main/resources/META-INF/resources/sxp_blueprint_admin/schemas/sxp-query-element.schema.json) ファイルに定義されています。 REST API Explorerにアクセスできるユーザーは、より便利にスキーマを閲覧することができます。 Liferayにログインした状態で、以下のサイトにアクセスします。

<http://localhost:8080/o/api?endpoint=http://localhost:8080/o/search-experiences-rest/v1.0/openapi.json>

**POST /v1.0/sxp-blueprints** エンドポイントエントリーを展開する。 下にスクロールして、 **Schema** リンク(**Example Value** リンクの隣）をクリックします。

![APIエクスプローラからElementスキーマを探索する。](./creating-elements/images/04.png)

```{tip}
システム要素の構文を検査し、スキーマ要素を使用して要素がどのように構築されるかをよりよく理解することができます。
```

各Elementは、 `elementDefinition` と `title_i18n`の2つの必須トップレベルプロパティを持ちます。 `elementDefinition` には、 `category` と `configuration` &rarr; `queryConfiguration` のプロパティを含める必要がある：

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

`elementDefinition` が、作業の大部分を行う場所です。 そのプロパティは、 `category`、 `configuration`、 `icon`、 `uiConfiguration`。 

`category` は、Element の動作を分類する文字列を提供する。 `match`, `boost`, `conditional`, `filter`, `hide`, or `custom`を指定してください。

`configuration` は `queryConfiguration` を提供し、`queryEntries` プロパティを介して、投稿するクエリ句を保持します。

`icon` Element に使用するアイコンを指定する文字列を設定する。 [Lexicon Icon Library](../../../../../building-applications/developing-a-java-web-application/using-mvc/tag-libraries/clay-tag-library/clay-icons.md) で利用可能な画像はすべて使用可能です(例： `thumbs-up`）。

`uiConfiguration` UIに表示する設定要素を設定し、設定した値でカスタムElementに渡します。 

例えば、 `entryClassName` フィールドの用語クエリ一致を高める Element は、クエリと UI を次のように設定することができます：

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

### エレメントを定義する `構成`

`configuration` プロパティは、ネストしたプロパティ `queryConfiguration` &rarr; `queryEntries`を保持する。

`queryEntries` JSONに飛び込むと、プロパティ `clauses`, `conditions`, `enabled`, `postFilterClauses`, and `rescores`を含むことができます。 

- 上のスニペットは、Elementが `clauses` (要素の配列)を使って、Blueprint-driven searchにquery clauseを追加しているところです。 `クエリ`に加えて、 `additive`, `boost`, `content`, `disabled`, `field`, `name`, `occur`, `parent`, `type`, or `value` properties を追加することができます。
- `条件` は、ブーリアン・チェックを提供します。 trueの場合、提供された節は検索クエリに含まれ、falseの場合、それらは除外されます。
- `enabled` を false に設定すると(デフォルトでは true）、Element を無効化することができます。
- `postFilterClauses` を追加する( `節` の要素の配列として）。 `追加`, `ブースト`, `コンテンツ`, `無効`, `フィールド`, `名前`, `occur`, `親`, `クエリー`, `タイプ`, または `値` プロパティを追加できる。
- Add `rescores` クエリの結果に対する関連性スコアを再計算する。 `query`, `queryWeight`, `rescoreQueryWeight`, `scoreMode`, `windowSize`を指定してください。 詳しくは [Elasticsearchのドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/filter-search-results.html#rescore) をご覧ください。

`uiConfiguration` プロパティは、ネストされたプロパティ `fieldSet` と `field`を保持しています。

UI Configurationでは、各フィールドに対して追加できる設定プロパティがいくつかあります：

- `defaultValue` を使って、フィールドの初期値を入力します。
- `helpText` と入力すると、Blueprints UIにフィールドのヘルプテキストが表示されます。
- 人間が読める `ラベル`を入力してください。
- クエリ句にフィールドの値を渡すときなど、要素内の他の場所でフィールドを参照するために使用できる `名` を入力します： `${configuration.name}`.
- フィールドの `タイプ` を設定します。 ``date , fieldMapping , fieldMappingList (利用可能なフィールドのリストとそのロケール、フィールドブースト）, itemSelector , json , keywords , multiselect number , select , slider , and text から選択してください。</code> `` `` `` `` `` ` <code>` `` `` ``
- `typeOptions` プロパティを使用して、各フィールドのタイプで利用可能なオプションを設定します。 例えば、セレクトフィールドに表示される `オプション` を設定します。 
     - `boost` フィールドごとの数値ブースト値を設定します。
   - `フォーマット` は、 [受け入れ可能な日付フォーマット](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/mapping-date-format.html) を決定する(例えば、 `yyyyMMddHHmmss`）。
   - `nullable` null 値を渡すことができるかどうかを設定する。
   - `options` セレクトフィールドのオプションを設定します。
   - `required` コンフィギュレーションに値が必要かを設定します。
   - `step` 数値フィールドやスライダーフィールドの数値の増減値を設定します。
   - `unit` 数値フィールドの測定単位を設定する。
   - `unitSuffix` は、単位を持つ数値フィールドに表示する単位表記を設定します(例えば、 `unit` が `km`の場合、 `unitSuffix` を `km` または `kilometers`として設定できます）。

## 追加情報

- [検索ブループリントの作成と管理](../creating-and-managing-search-blueprints.md)
- [検索ブループリント要素のリファレンス](../search-blueprints-elements-reference.md)
- [検索 ブループリント コンフィギュレーション リファレンス](../search-blueprints-configuration-reference.md) 
