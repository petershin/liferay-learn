# 検索ブループリント設定のリファレンス

Search Blueprints ユーザー・インターフェースには、ブループリントを作成するためのクエリ・ビルダーがあります。 要素の追加とクエリ設定の構成以外にも、多くのブループリントの使用例にとって重要な構成があります。 これらのコンフィギュレーションを操作するには、Global Menu &rarr; Applications &rarr; Blueprints にアクセスしてください。 新しいブループリントを追加するか、既存のブループリントを開き、 **Configuration** タブをクリックします。

![JSON を使用して検索ブループリントを構成します。](./search-blueprints-configuration-reference/images/01.png)

各設定フィールドは、JSON文字列を受け付ける1つのテキスト・エリアからなる。

## 集約構成

Search Blueprint で [Aggregations](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/search-aggregations.html) を構成します。 集計は、クエリの結果を取り込み、データを論理的な集合にグループ化する。 集計は、複雑なデータ要約を提供するために構成することができます。

検索ブループリントで追加された集約は、検索リクエストにすでに存在するもの（ファセットなど）に加えて適用されます。

```{note}
アグリゲーションは設定することができ、検索レスポンスで返されますが、LiferayのUIでBlueprintで追加されたアグリゲーションを表示したり、その他の方法で処理したりする、すぐに使える方法はありません。 ブループリントで追加された集約を使用するには、カスタムコードが必要です。
```

ブループリントにアグリゲーションを追加するには

1. ブループリント・エディタで、 **Configuration** タブをクリックします。
1. Aggregation Configurationテキストエリアを見つけて、有効なJSONを入力する。 Elasticsearch DSLを使ってJSONを作成します。

   ```{warning}
   いくつかの集約プロパティはLiferayの検索APIではサポートされていません。
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

検索ブループリントで [ハイライト](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/highlighting.html) を設定します。 検索ブループリントでハイライト設定を追加すると、デフォルトの検索ハイライト設定より優先されます。

ブループリントにハイライトを追加します、

1. ブループリント・エディタで、 **Configuration** タブをクリックします。
1. Highlight Configurationテキストエリアを見つけて、有効なJSONを入力します。 プロパティとその取り得る値については、 [Elasticsearch ドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/highlighting.html) に詳しく記述されています。

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

検索ブループリントで [ソート](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/sort-search-results.html) を設定します。 検索ブループリントによって追加されたソートは、検索リクエストにすでに含まれているソート（例えば、Sort ウィジェットによるもの）に追加して適用されます。 ただし、検索ブループリントで追加されたソートは、ソート・ウィジェットのUIや設定画面には反映されません。

```{warning}
検索ページでソートを設定するために、ソート・ウィジェットとブループリントの両方を使用しないでください。 ソート・ウィジェットのソートと検索ブループリントのソート・コンフィギュレーションを組み合わせた場合、一貫した動作は保証されません。
```

ブループリントにソートを追加するには

1. ブループリント・エディタで、 **Configuration** タブをクリックします。
1. Sort Configurationテキストエリアを見つけて、有効なJSONを入力する。

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

検索コンテキストの属性から新規テンプレート変数を宣言します。 例えば、カスタムフィルタウィジェットをウィジェットテンプレートとブループリントと組み合わせることで、エンドユーザーが検索結果を未公開コンテンツと草稿コンテンツの間で切り替えることができます。

この例では、新しい検索コンテキスト属性を追加し、その属性値が **true の場合、ウェブコンテンツを検索結果から除外します** 。

1. 新しいブループリントにパラメータ構成を追加します。 **Configuration** タブに移動し、Parameter Configuration テキストボックスを見つけます。 追加

   ```json
   {
      "parameters": {
         "exclude.journal_articles": {
            "type": "String"
         }
      }
   }
   ```

1. ブループリントにカスタム要素を追加します： **Query Builder** タブに移動し、Custom JSON Element を見つけて、 **Add** をクリックします。 既存のコンテンツを上書きする：

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

1. 検索コンテキスト属性を追加する。 テスト目的で、 [プレビュー](creating-and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar) サイドバーでこれを行うことができます。

1. ［**プレビュー**］ をクリックします。 歯車のアイコン (![Gear](../../../../images/icon-cog3.png)) をクリックして、ブループリントのプレビュー検索に検索コンテキスト属性を追加します。 属性のキーと値のペアを入力してください： `exclude.journal_articles`/`true`

1. そして、 **Done** をクリックする。

**チェックポイント** ウェブコンテンツの記事を返すと予想される検索を実行し（必要であれば追加する）、記事が返されないことを確認する。 属性コンフィギュレーションをもう一度開き、値を **false** に設定する。 プレビュー検索にウェブコンテンツが含まれていることを確認します。


   ```{tip}
   [低レベル検索オプション](../../../search-pages-and-widgets/search-results/understanding-low-level-search-options.md) ウィジェットを使用して、検索ページで検索コンテキスト属性を設定できます。
   ```

## 詳細設定

```{warning}
これはほとんど必要とされない高度な機能である。 LiferayのUIにはこのコンフィギュレーションに対応する機能がないため、カスタムコードのみがこのコンフィギュレーションの結果を検索レスポンスに取り込むことができます。
```

Advanced Configurationは、検索リクエスト・パラメーターとして、 [source includesとexcludes](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/mapping-source-field.html#include-exclude) を追加する。 `_source` フィールドは、インデックス要求に渡された保存されたドキュメント本体を含む。 このフィールド自体にはインデックスが付けられない。 ブループリントの詳細構成では、 `_source` フィールドに含めるフィールドまたはフィールドから除外するフィールドを指定して、 **source フィールドを刈り込むことができます。 これは機能が重複しており、低レベル検索オプション・ウィジェットの** Fields to Return_ 設定と衝突する可能性があるため、両方のアプローチを同時に使用してはならない。 ブループリントに詳細設定を追加するには、以下の手順に従います、

1. ブループリント・エディタで、 **Configuration** タブをクリックします。
1. Advanced Configurationのテキストエリアを見つけて、 `excludes` と `includes` を入力してください。 ワイルドカードは使用可能。

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

## コントロールパネルでの検索ブループリントの設定

検索ブループリントのほとんどの設定は、ブループリント・アプリケーションおよび検索ページ自体に直接あります。 ただし、Search Blueprints でジオロケーション機能をサポートするサービスを有効にするシステム/インスタンス構成が 2 つあります。

どちらの設定項目も、「コントロールパネル」 &rarr; 「システム/インスタンス設定」の「検索エクスペリエンス」カテゴリにあります。

![ipstack サービスと OpenWeatherMap サービスを設定して、Search Blueprints でジオロケーション機能を有効にします。](./search-blueprints-configuration-reference/images/02.png)

[Ipstack](https://ipstack.com/) ユーザーのIPアドレスに基づくジオロケーション情報を提供します。

| Ipstackの設定     | デフォルト値                 | 説明                                             |
|:-------------- |:---------------------- |:---------------------------------------------- |
| 有効             | False                  | ipstackサービスを有効にするには、チェックボックスをオンにします。           |
| API キー         | なし                     | サービスを有効にするには、ipstack.comからAPIキーを取得する必要があります。   |
| API の URL      | http://api.ipstack.com | サービスのURLを入力してください。                             |
| キャッシュのタイムアウト時間 | 604800                 | キャッシュされたデータの有効期限が切れ、APIが再度起動されるまでの時間（ms）を設定する。 |

[OpenWeatherMap](https://openweathermap.org) は、ipstackと組み合わせて使用され、ユーザーの位置に基づいた気象情報を提供する。 検索ブループリントでこれを使用するには、ipstackも有効にする必要があります。

| Ipstackの設定     | デフォルト値                                         | 説明                                                  |
|:-------------- |:---------------------------------------------- |:--------------------------------------------------- |
| 有効             | False                                          | OpenWeatherMapサービスを有効にするには、チェックボックスをオンにします。         |
| API キー         | なし                                             | サービスを有効にするには、openweathermap.orgからAPIキーを取得する必要があります。 |
| API の URL      | http://api.openweathermap.org/data/2.5/weather | サービスのURLを入力してください。                                  |
| キャッシュのタイムアウト時間 | 604800                                         | キャッシュされたデータの有効期限が切れ、APIが再度起動されるまでの時間（ms）を設定する。      |
| 単位             | 統計情報                                           | 気象データの単位を設定します：Imperial、Metric、またはStandardを選択します。   |

