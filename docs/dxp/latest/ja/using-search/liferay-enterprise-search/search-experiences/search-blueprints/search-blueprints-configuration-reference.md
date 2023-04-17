# 検索 ブループリント コンフィギュレーション リファレンス

Search Blueprintsのユーザーインターフェイスには、Blueprintsを作成するためのQuery Builderがあります。 要素の追加やクエリ設定の構成以外にも、多くのBlueprintsのユースケースにとって重要な構成があります。 これらの設定を操作するには、グローバルメニュー &rarr; アプリケーション &rarr; ブループリントをご覧ください。 新しいブループリントを追加するか、既存のブループリントを開き、 _Configuration_ タブをクリックします。

![JSONを使用してSearch Blueprintsを構成する。](./search-blueprints-configuration-reference/images/01.png)

各設定フィールドは、JSON文字列を受け付ける単一のテキストエリアから構成されます。

## 集約構成

Search Blueprint で [Aggregations](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/search-aggregations.html) を設定します。 集計は、クエリの結果を取り込んで、データを論理的な集合にグループ化するものです。 集計は、複雑なデータサマリーを提供するために構成することができます。

Search Blueprintsで追加された集約は、検索リクエストに既に存在する集約(ファセットなどからの集約）に加えて適用されます。

```{note}
アグリゲーションは設定することができ、検索レスポンスで返されますが、LiferayのUIでBlueprintで追加されたアグリゲーションを表示したり、その他の処理をするアウトオブボックスな方法は用意されていません。 Blueprintsで追加されたアグリゲーションを消費するためには、カスタムコードが必要です。
```

ブループリントにアグリゲーションを追加するには、次のようにします、

1. ブループリント・エディターで、 _Configuration_ タブをクリックします。
1. Aggregation Configurationのテキストエリアを探し、有効なJSONを入力します。 Elasticsearch DSLを使用してJSONを作成します。

   ```{warning}
   Liferayの検索APIでサポートされていないアグリゲーションプロパティがあります。
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

検索ブループリントで [ハイライト](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/highlighting.html) を設定する。 Search Blueprintsでハイライト設定を追加すると、デフォルトの検索ハイライト設定より優先されます。

ブループリントにハイライトを追加するには、次のようにします、

1. ブループリント・エディターで、 _Configuration_ タブをクリックします。
1. Highlight Configurationのテキストエリアを探し、有効なJSONを入力します。 プロパティとその取り得る値については、 [Elasticsearchのドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/highlighting.html)に詳しく記載されています。

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

検索ブループリントで [ソート](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/sort-search-results.html) を設定する。 検索ブループリントによって追加されたソートは、検索リクエストにすでに含まれているソート(例：ソートウィジェットによるもの）に加えて適用されます。 ただし、Search Blueprintで追加したSortは、SortウィジェットのUIや設定画面には反映されない。

```{warning}
検索ページでソートを構成するために、ソートウィジェットとブループリントの両方を使用しないでください。 SortウィジェットからのSortとSearchブループリントのSort Configurationを組み合わせた場合、一貫した動作が保証されません。
```

ブループリントにソートを追加するには、次のようにします、

1. ブループリント・エディターで、 _Configuration_ タブをクリックします。
1. Sort Configurationのテキストエリアを探し、有効なJSONを入力します。

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

検索コンテキストの属性から新規テンプレート変数を宣言します。 例えば、カスタムフィルタウィジェットをウィジェットテンプレートとブループリントと組み合わせることで、エンドユーザーが検索結果を未公開コンテンツとドラフトコンテンツの間で切り替えられるようにすることができます。

この例では、新しい検索コンテキスト属性を追加し、その属性の値が _true の場合、Web コンテンツを検索結果から除外するようにします_。

1. Parameter Configuration を新しいブループリントに追加します。 _Configuration_ タブを開き、Parameter Configuration テキスト ボックスを見つけます。 追加

   ```json
   {
      "parameters": {
         "exclude.journal_articles": {
            "type": "String"
         }
      }
   }
   ```

1. ブループリントにカスタム要素を追加します： _Query Builder_ タブに移動し、Custom JSON Element を見つけて、 _Add_をクリックします。 既存のコンテンツを上書きする：

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

1. _［プレビュー］_をクリックします。 歯車アイコン(![Gear](../../../../images/icon-cog3.png))をクリックして、ブループリントのプレビュー検索に検索コンテキスト属性を追加します。 属性のキーと値のペアを入力してください： `exclude.journal_articles`/`true`

1. 次に、 _完了_をクリックします。

**チェックポイント** ウェブコンテンツの記事を返すと予想される検索を実行し(必要に応じて追加する）、記事が返されないことを確認する。 属性設定を再度開き、値を _false_に設定します。 プレビュー検索にウェブコンテンツが含まれるようになったことを確認する。


   ```{tip}
   検索ページでは、[Low Level Search Options](../../search-pages-and-widgets/search-results/understanding-low-level-search-options.md) ウィジェットを使って検索コンテキスト属性を設定することができます。
   ```

## 詳細設定

```{warning}
これは、ほとんど必要とされない高度な機能です。 LiferayのUIにはこの設定に対応するアウトオブボックス機能がないため、カスタムコードのみがこの設定の結果を検索レスポンスに消費することができます。
```

Advanced Configurationでは、検索リクエストパラメーターとして、 [source includesとexcludes](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/mapping-source-field.html#include-exclude) が追加されます。 `_source` フィールドには、インデックスリクエストに渡されたストアドドキュメントボディが含まれる。 このフィールドは、それ自身はインデックスされない。 Blueprints の Advanced Configuration では、 `_source` フィールドに含めるフィールドや除外するフィールドを指定して、プルーンすることができます。 機能的に重複しており、Low Level Search Option ウィジェットの _Fields to Return_ 設定と競合する可能性があるため、両方のアプローチを同時に使用してはいけません。 ブループリントにAdvanced構成を追加するには、次のようにします、

1. ブループリント・エディターで、 _Configuration_ タブをクリックします。
1. Advanced Configurationのテキストエリアを探し、必要な `excludes` 、 `includes` を入力します。 ワイルドカードは使用可能です。

```json
{
    "source":{
        "excludes":[
            "<fieldName1>",
            "<fieldName2>"
        ],
        "fetchSource":true,
        "includes":[
            "<fieldName3>",
            "<fieldName4>"
        ]
    }
}
```

## コントロールパネルでサーチブループリントを設定する

Search Blueprintsのほとんどの設定は、Blueprintsアプリケーションと検索ページ自体で直接確認できます。 ただし、Search Blueprintsでジオロケーション機能をサポートするサービスを有効にするシステム/インスタンス構成は2つあります。

どちらの設定項目も、コントロールパネル &rarr; システム/インスタンス設定の「Search Experiences」カテゴリで確認できます。

![Search Blueprints でジオロケーション機能を有効にするために、ipstack サービスと OpenWeatherMap サービスを設定します。](./search-blueprints-configuration-reference/images/02.png)

[Ipstack](https://ipstack.com/) ユーザーのIPアドレスに基づくジオロケーション情報を提供します。

| Ipstackのコンフィギュレーション | デフォルト値                 | 説明                                              |
|:------------------- |:---------------------- |:----------------------------------------------- |
| 有効                  | False                  | ipstack サービスを有効にする場合は、チェックボックスをオンにします。          |
| API キー              | なし                     | サービスを有効にするには、ipstack.com から API キーを取得する必要があります。 |
| API の URL           | http://api.ipstack.com | サービスのURLを記載します。                                 |
| キャッシュのタイムアウト時間      | 604800                 | キャッシュされたデータの有効期限が切れ、APIが再呼び出されるまでの時間(ms）を設定します。 |

[OpenWeatherMap](https://openweathermap.org) は、ipstackと連携して、ユーザーの位置情報に基づいた気象情報を提供するために使用します。 Search Blueprintsでこれを使用するには、ipstackも有効にする必要があります。

| Ipstackのコンフィギュレーション | デフォルト値                                         | 説明                                                    |
|:------------------- |:---------------------------------------------- |:----------------------------------------------------- |
| 有効                  | False                                          | OpenWeatherMapサービスを有効にする場合は、チェックを入れてください。             |
| API キー              | なし                                             | サービスを有効にするためには、openweathermap.orgからAPIキーを取得する必要があります。 |
| API の URL           | http://api.openweathermap.org/data/2.5/weather | サービスのURLを記載します。                                       |
| キャッシュのタイムアウト時間      | 604800                                         | キャッシュされたデータの有効期限が切れ、APIが再呼び出されるまでの時間(ms）を設定します。       |
| 単位                  | 統計情報                                           | 気象データの単位を設定する：インペリアル、メートル、標準のいずれかを選択します。              |

