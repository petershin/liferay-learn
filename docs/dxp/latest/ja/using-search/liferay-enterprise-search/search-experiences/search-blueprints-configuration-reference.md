# 検索ブループリント 構成リファレンス

Search Blueprintsのユーザーインターフェースには、Blueprintsを作成するためのQuery Builderがあります。 要素の追加とクエリ設定の構成以外にも、多くのBlueprintsのユースケースで重要な構成があります。 これらの設定を行うには、Global Menu &rarr; Applications &rarr; Blueprintsにアクセスしてください。 新しいブループリントを追加するか、既存のブループリントを開き、 _Configuration_ ]タブをクリックします。

![JSON を使用して検索ブループリントを設定します。](./search-blueprints-configuration-reference/images/01.png)

各設定フィールドは、JSON文字列を受け入れる1つのテキストエリアから構成されています。

## 集約構成

Search Blueprint で [Aggregations](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/search-aggregations.html) を設定します。 集計は、クエリの結果を論理的なセットにグループ化するものである。 集計は、複雑なデータのサマリーを提供するために構成することができます。

Search Blueprintsで追加された集約は、検索要求に既に存在するもの（ファセットからの集約など）に加えて適用されます。

```{note}
アグリゲーションは設定でき、検索レスポンスで返されますが、LiferayのUIでBlueprintで追加されたアグリゲーションを表示したり、その他の処理をするアウトオブザボックスな方法は存在しません。 Blueprintsで追加されたアグリゲーションを消費するためには、カスタムコードが必要です。
```

ブループリントにアグリゲーションを追加するには、次のようにします。

1. ブループリント・エディターから、 _Configuration_ タブをクリックします。
1. Aggregation Configurationのテキストエリアを探し、有効なJSONを入力します。 Elasticsearch DSLを使用してJSONを作成します。

   ```{warning}
   いくつかのアグリゲーションプロパティは、Liferayの検索APIでサポートされていません。
   ```

   ```json
   {
      "aggs": {
         "date_histogram-test": {
            "date_histogram": {
               "date_histogram_interval": "minute",
               "field": "modified",
               "keyed": true,
               "min_doc_count": 1,
               "order": {
                  "_count": "asc"
               }
            }
         }
      }
   }
   ```

## ハイライト構成

Search Blueprints で [Highlights](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/highlighting.html) を設定します。 Search Blueprints でハイライト設定を追加すると、デフォルトの検索ハイライト設定より優先されます。

ブループリントにハイライトを追加するには。

1. ブループリント・エディターから、 _Configuration_ タブをクリックします。
1. Highlight Configurationのテキストエリアを探し、有効なJSONを入力します。 プロパティとその取り得る値については、 [Elasticsearch documentation](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/highlighting.html)で詳しく説明しています。

   ```json
   {
      "fields": {
         "content${context.language_id}": {},
         "title${context.language_id}": {}
      },
      "fragment_size": 100,
      "number_of_fragments": 10,
      "post_tags": [
         "</liferay-hl>"
      ],
      "pre_tags": [
         "<liferay-hl>"
      ],
      "require_field_match": true
   }
   ```

## 並び替え構成

Search Blueprints で [Sorts](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/sort-search-results.html) を設定します。 検索ブループリントで追加されたソートは、検索リクエストにすでに含まれているもの（ソートウィジェットなど）に加えて適用されます。 ただし、検索ブループリントで追加されたソートは、ソートウィジェットのUIや設定画面には反映されません。

```{warning}
検索ページでソートを設定するために、ソートウィジェットとブループリントの両方を使用しないでください。 SortウィジェットのSortとSearch BlueprintのSort Configurationを組み合わせて使用した場合、一貫した動作は保証されません。
```

ブループリントにソートを追加するには。

1. ブループリント・エディターから、 _Configuration_ タブをクリックします。
1. ソート設定のテキストエリアを探し、有効なJSONを入力します。

   ```json
   {
      "sorts": [
         {
            "title_sortable": "desc"
         }
      ]
   }
   ```

## パラメーター構成

検索コンテキストの属性から新規テンプレート変数を宣言します。 例えば、Custom FilterウィジェットをWidget TemplateとBlueprintと組み合わせて、エンドユーザーが検索結果を未公開コンテンツと下書きコンテンツの間で切り替えられるようにすることができます。

この例では、新しい検索コンテキスト属性を追加し、その属性の値が _true の場合に、検索結果から Web コンテンツを除外するために使用します_.

1. 新しいブループリントにパラメータ設定を追加する： 設定 タブで、PArameter Configuration テキストボックスを見つけます。 追加

   ```json
   {
      "parameters": {
         "exclude.journal_articles": {
            "type": "String"
         }
      }
   }
   ```

1. ブループリントにカスタム要素を追加します。Query Builder] タブで [Custom JSON Element] を見つけ、[ _Add_] をクリックします。 既存のコンテンツをこれで上書きしてください。

   ```json
   {
      "description_i18n": {
         "en_US": "Conditionally exclude journal articles from the search."
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

1. 検索コンテキスト属性を追加します。 テスト目的であれば、 [プレビュー](creating-and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar) サイドバーで行うことができます。

   _［プレビュー］_をクリックします。 歯車のアイコン(![Gear](../../../images/icon-cog3.png))をクリックして、ブループリントのプレビュー検索に検索コンテキスト属性を追加します。 属性のキーと値のペアを入力してください： `exclude.journal_articles`/`true`

   次に、 _完了_をクリックします。

   **チェックポイント** ウェブコンテンツの記事が返されることを想定した検索を実行し（必要なら追加）、記事が返されないことを確認する。 再度、属性設定を開き、値を _false_に設定します。 プレビュー検索にWebコンテンツが含まれるようになったことを確認します。


   ```{tip}
   検索ページでは、[Low Level Search Options](../../search-pages-and-widgets/search-results/understanding-low-level-search-options.md) ウィジェットを使って、検索コンテキスト属性を設定することができます。
   ```

## 詳細設定

```{warning}
これは高度な機能で、ほとんど必要ないでしょう。 LiferayのUIにはこの設定に対応する機能がないため、カスタムコードのみがこの設定の結果を検索レスポンスに利用することができます。
```

Advanced Configurationでは、検索リクエストパラメーターとして、 [source includeとexcludes](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/mapping-source-field.html#include-exclude) が追加されます。 `_source` フィールドには、インデックスリクエストに渡された保存されたドキュメント本体が含まれています。 このフィールドは、それ自身はインデックスされない。 Blueprints の Advanced Configuration では、 `_source` フィールドに含めるフィールドと除外するフィールドを指定して、プルーンすることができます。 この機能は、低レベル検索オプションウィジェットの _Fields to Return_ の設定と重複し、競合する可能性があるため、両方のアプローチを同時に使用してはいけません。 ブループリントにAdvanced構成を追加するには、次のようにします。

1. ブループリント・エディターから、 _Configuration_ タブをクリックします。
1. Advanced Configurationのテキストエリアを探し、必要な `excludes` と `includes` を入力します。 ワイルドカードは使用可能です。

```json
{
    "excludes":[
      "<fieldName1>","<fieldName2>"
    ],
    "fetchSource":true,
    "includes":[
      "<fieldName3>","<fieldName4>"
    ]
}
```
