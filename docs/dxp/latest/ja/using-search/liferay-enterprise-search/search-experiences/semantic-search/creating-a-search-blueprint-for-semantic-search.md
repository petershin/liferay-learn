# セマンティックサーチのためのサーチブループリントを作成する

{bdg-secondary}`7.4 U70+`
{bdg-link-primary}`[ベータ版機能](../../../../system-administration/configuring-liferay/feature-flags.md)`

モデルが選択され、テキスト埋め込みがインデックスされると、検索時に埋め込みを考慮するようにLiferayを構成する必要があります。 概念的には2つの選択肢があります：

1. Liferayのデフォルトの検索要求を完全にオーバーライドするブループリントを作成し、テキスト埋め込みのみを使用した純粋なセマンティック検索クエリを実行するためにゼロから構築します。
1. すぐに使えるRescore by Text Embedding要素を使用して、標準的なキーワードベースのクエリを実行するブループリントを作成し、インデックスされた `dense_vector` フィールドのテキスト埋め込みと検索フレーズの埋め込みとの間の類似性関数で結果を再スコアするようにします。

設定した埋め込みプロバイダーによって作成されたテキスト埋め込みを活用してセマンティック検索体験を構築するために、Liferayには、テキスト埋め込み値を使用して元のクエリの結果を再スコアするRescore by Text Embeddingという要素がすぐに利用できるようになっています。 エレメントを使用して、 [検索の設計図](../search-blueprints/creating-and-managing-search-blueprints.md)を構築します。 この要素とBlueprintsのビジュアル・クエリ・ビルダーを使用すると、検索クエリを構成してテストし、正しいセマンティック検索ソリューションを構築することができます。

```{important}
Rescore by Text Embedding要素は、埋め込みプロバイダーと連携するように設定すると、一部のデータセットについて、よりターゲットを絞った検索結果を出すことができます。 しかし、多くのセマンティック検索ソリューションは、堅牢な検索ソリューションを実現するために、手動で微調整を行い、おそらく新しい要素も必要とします。
```

![Rescore by Text Embedding要素は、Liferayに基本的なセマンティック検索をもたらします。](./creating-a-search-blueprint-for-semantic-search/images/01.png)

この要素は、埋め込みプロバイダが有効で、特定のコンテンツタイプや言語に対して動作するように設定されている場合にのみ有効である。 [テキスト埋め込みプロバイダーの設定](./setting-up-a-text-embedding-provider.md)をご参照ください。

## Rescore by Text Embedding Elementの追加

[セマンティック検索を有効にした状態で初めてLiferayを起動した場合](../semantic-search.md#enabling-semantic-search) 、Rescore by Text Embedding要素は [Search Blueprints UI](../search-blueprints/creating-and-managing-elements.md)で使用する準備が整っています。 インスタンスに要素が表示されない場合は、手動で追加することができます：

1. Liferay で **Global Menu**(![Global Menu](../../../../images/icon-applications-menu.png)) を開き、 **Application** &rarr; **Blueprints** をクリックします。

1. **Elements** をクリックし、 **Add**(![Add](../../../../images/icon-add.png)) をクリックします。

1. タイトル **Rescore by Text Embedding** を入力し、 **Create** をクリックします。

1. 以下のセクション、 [リファレンスから要素のJSONをコピーします：テキスト埋め込み要素によるリスコア](#reference-rescore-by-text-embedding-element)

1. デフォルトのJSONを、以下からコピーしたJSONで上書きします。

![必要であれば、Rescore by Text Embedding要素を追加します。](./creating-a-search-blueprint-for-semantic-search/images/02.png)

## テキスト埋め込み要素によるリスコアの設定

Rescore by Text Embedding要素には、いくつかの設定可能なオプションが用意されています：

**ブースト：** デフォルトは10で、再スコアされた結果をどの程度ブーストするかを設定します。

**ベクトルフィールド関数：** コサイン類似度関数、ドットプロダクト関数から選択します。 デフォルトではCosine Similarity関数が使用され、検索されたキーワードと対象文書のテキスト埋め込みの類似性を測定します。 どの機能が最適かは、モデルのマニュアルをご確認ください。

**Min Score(最小スコア）：** デフォルトは1で、この設定の整数(または0）は、返された文書が再スコアクエリに含まれるために必要な最小スコアを設定します。

**クエリの重み：** デフォルトは0.01で、この設定は最終的なスコア計算におけるオリジナルクエリの重みを制御します。

**Rescore Query Weight(リスコアクエリーの重み）：** デフォルトは10で、最終的なスコア計算における再スコアのクエリの重みを設定します。

**スコア・モード：** デフォルトはAverageで、元のクエリのスコアと再スコアの結果を組み合わせるときに使用する戦略を指定します。 平均、最大、最小、乗算、合計から選択します。

**Rescorer Window Size(再採点ウィンドウサイズ）：** デフォルトは50で、一度に再採点する結果の数を選択することができます。 非常に大きなウィンドウサイズを選択すると、パフォーマンスに悪影響を及ぼす可能性があります。

## 参考テキスト埋め込み要素によるリスコア

便宜上、このJSONをRescore by Text Embedding要素にコピーしておくとよいでしょう：

```json
{
    "description_i18n": {
        "en_US": "rescore-by-text-embedding-description"
    },
    "elementDefinition": {
        "category": "semantic search",
        "configuration": {
            "queryConfiguration": {
                "queryEntries": [
                    {
                        "condition": {
                            "exists": {
                                "parameterName": "keywords"
                            }
                        },
                        "rescores": [
                            {
                                "query": {
                                    "script_score": {
                                        "boost": "${configuration.boost}",
                                        "min_score": "${configuration.min_score}",
                                        "query": {
                                            "bool": {
                                                "filter": [
                                                    {
                                                        "exists": {
                                                            "field": "text_embedding_${ml.text_embeddings.vector_dimensions}_${context.language_id}"
                                                        }
                                                    }
                                                ],
                                                "must": [
                                                    {
                                                        "match_all": {
                                                        }
                                                    }
                                                ]
                                            }
                                        },
                                        "script": {
                                            "params": {
                                                "query_vector": "${ml.text_embeddings.keywords_embedding}"
                                            },
                                            "source": "${configuration.vector_field_function}(params.query_vector, 'text_embedding_${ml.text_embeddings.vector_dimensions}_${context.language_id}') + 1"
                                        }
                                    }
                                },
                                "queryWeight": "${configuration.query_weight}",
                                "rescoreQueryWeight": "${configuration.rescore_query_weight}",
                                "scoreMode": "${configuration.score_mode}",
                                "windowSize": "${configuration.window_size}"
                            }
                        ]
                    }
                ]
            }
        },
        "icon": "custom-field",
        "uiConfiguration": {
            "fieldSets": [
                {
                    "fields": [
                        {
                            "defaultValue": 10,
                            "label": "boost",
                            "name": "boost",
                            "type": "number",
                            "typeOptions": {
                                "min": 0
                            }
                        },
                        {
                            "defaultValue": "cosineSimilarity",
                            "helpText": "vector-field-function-field-help",
                            "label": "vector-field-function",
                            "name": "vector_field_function",
                            "type": "select",
                            "typeOptions": {
                                "nullable": false,
                                "options": [
                                    {
                                        "label": "Cosine Similarity",
                                        "value": "cosineSimilarity"
                                    },
                                    {
                                        "label": "Dot Product",
                                        "value": "dotProduct"
                                    }
                                ]
                            }
                        },
                        {
                            "defaultValue": 1,
                            "helpText": "min-score-field-help",
                            "label": "min-score",
                            "name": "min_score",
                            "type": "number",
                            "typeOptions": {
                                "min": 0
                            }
                        },
                        {
                            "defaultValue": 0.01,
                            "helpText": "query-weight-field-help",
                            "label": "query-weight",
                            "name": "query_weight",
                            "type": "slider",
                            "typeOptions": {
                                "min": 0.01,
                                "step": 0.1
                            }
                        },
                        {
                            "defaultValue": 10,
                            "helpText": "rescore-query-weight-field-help",
                            "label": "rescore-query-weight",
                            "name": "rescore_query_weight",
                            "type": "slider",
                            "typeOptions": {
                                "min": 0.01,
                                "step": 0.1
                            }
                        },
                        {
                            "defaultValue": "avg",
                            "helpText": "score-mode-field-help",
                            "label": "score-mode",
                            "name": "score_mode",
                            "type": "select",
                            "typeOptions": {
                                "nullable": false,
                                "options": [
                                    {
                                        "label": "Average",
                                        "value": "avg"
                                    },
                                    {
                                        "label": "Max",
                                        "value": "max"
                                    },
                                    {
                                        "label": "Min",
                                        "value": "min"
                                    },
                                    {
                                        "label": "Multiply",
                                        "value": "multiply"
                                    },
                                    {
                                        "label": "Total",
                                        "value": "total"
                                    }
                                ]
                            }
                        },
                        {
                            "defaultValue": 50,
                            "helpText": "rescore-window-size-field-help",
                            "label": "rescore-window-size",
                            "name": "window_size",
                            "type": "number",
                            "typeOptions": {
                                "min": 1
                            }
                        }
                    ]
                }
            ]
        }
    },
    "externalReferenceCode": "RESCORE_BY_TEXT_EMBEDDING",
    "title_i18n": {
        "en_US": "rescore-by-text-embedding"
    },
    "type": 0
}
```
