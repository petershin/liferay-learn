# 検索結果のフィルタリング

```{note}
この機能は[Elasticsearchでのみ](../../installing-and-upgrading-a-search-engine/solr/solr-limitations.md)動作します。
```

カスタムフィルターでは、メインの検索クエリにクエリを追加し、検索結果をフィルタリングして、検索結果ウィジェットに表示される内容を制御することができます。 フィルターウィジェットを表示または非表示にして、変更可能か不変かを決定できます。

![カスタムフィルターを適用して、特定の検索結果を除外します。](./filtering-search-results/images/03.png)

カスタムフィルターをページの検索に組み込むことで満足できる多くの使用例があります。

とりあえず、以下の基本的な使用法を検討してください。

| ユースケース                                                                    | `設定` (**値**) |
|:------------------------------------------------------------------------- |:-------------------------------------------------------------------------------------------------------------------------------------------- |
| **ユーザータイトルフィルター：** エンドユーザーは、フィルターキーを直接操作して、タイトルを使用して結果を探していたものに絞り込みます     | `フィルターフィールド` （**title \** en \ **US**） <br /> `フィルター値` （**ポッドキャスト**） <br /> `フィルタークエリタイプ` （**一致**） <br /> `発生タイプ` （**must** not）_ |
| **ハードコード化されたフィルタリング：** 管理ユーザーは、エンドユーザーには表示されず変更できないフィルターを使用してページの検索を構成します。 | ****上記の構成に追加_** <br /> `` （**True-チェック済み**） <br /> `不変` （**True-チェック済み**） |

カスタムフィルターは非常に多くのことを実行でき、それらすべてをリストすることは不可能です。 以下は、ウィジェットの設定ツアーです。 設定例は [カスタムフィルターの例](./custom-filter-examples.md)で見ることができます。

## カスタムフィルターの追加

カスタムフィルターウィジェットのすべてのオプションを調べるには、ページに1つ必要です。

1. ページの［追加］メニュー（![Add](../../../images/icon-add-widget.png)）を開き、［ウィジェット］セクションを展開します。

1. ［検索］セクションから、カスタムフィルターをページにドラッグします。

![カスタムフィルターは、構成するまで影響がありません。](./filtering-search-results/images/01.png)

## カスタムフィルター構成

検索結果のフィルタリングを開始するには、ウィジェットのオプションメニュー（![Options](../../../images/icon-app-options.png)）を開き、［**構成**］をクリックします。

**フィルターフィールド（テキスト）：** ほとんどの場合、フィルターは特定のフィールドに作用します。 フィルタリングするインデックス付きフィールドの名前を設定します（たとえば、 `title`）。 ［フィルタークエリタイプ］が、フィールドを必要としないタイプ（**Regexp** など）に設定されている場合、これは必要ありません。

検索文字列とスクリプトクエリでは、フィルターフィールドを設定する必要はありません。  他のすべてのクエリには、少なくとも1つのフィールドが必要です。
<!--Note: Multi Match and Simple Query String take an array of fields according to the Elasticsearch docs, but our config doesn't seem to support it. -->

Liferay DXPインデックスに存在するフィールドを見つけるには、 [コントロールパネルのフィールドマッピングUI](#finding-fields) を使用します。

**フィルター値（テキスト）：** ほとんどのフィルターでは、ここにテキスト値を入力して、指定したフィールドでフィルターを適用するテキストを指定する必要があります（たとえば、 **マッチ** クエリをテキスト **ストリート** に設定します `title_en_US` フィールド）。 一部のフィルタークエリタイプでは、 [_Regexp_](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/query-dsl-regexp-query.html) クエリの場合のように、特別な表記が必要です。

**フィルタクエリタイプ（リストを選択）：** 結果をフィルターするクエリタイプを選択します。 使用可能なタイプには、ブール、日付の範囲、存在、ファジー、一致、一致フレーズ、一致フレーズプレフィックス、マルチ一致、プレフィックス、検索文字列、正規表現、スクリプト、単純検索文字列、用語、ワイルドカードが含まれます。

これらのクエリの詳細は、 [Elasticsearchのドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/query-dsl.html) ご覧ください。

**発生（リストを選択）：** 検索に提供されるクエリの発生タイプを設定します。 オプションには、Filter、must、must_not、shouldがあります。

各タイプを理解するには、 [Elasticsearchのドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/query-dsl-bool-query.html) 参照してください。

**クエリ名（テキスト）：** 提供されたクエリの名前を設定します。 このフィルターが、子句を提供する別のフィルターに対する親クエリとして機能しない限り、これは不要です。その場合、このフィルターのクエリ名を子フィルターの親クエリ名として設定します。  この親/子動作は、Boolタイプのフィルターでのみ使用できます。

**親クエリ名（テキスト）：** 子節をBoolクエリに寄与する場合、親カスタムフィルタウィジェットで設定されたクエリ名と一致するように設定します。 それ以外の場合は、空白のままにします。

**ブースト（数値）：** このクエリに一致する結果のスコアの [ブースト](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/query-dsl-term-query.html#term-field-params) 。 ここでは、意味のある整数または10進数を指定します。

常にこれと一致する結果が常に必要な場合は、ブースト値を非常に高く設定します（例： **1000**）。

**カスタム見出し（テキスト）：** このフィルターに表示する見出しを入力します。 設定されていない場合、フィルターフィールドの値が表示されます。

**カスタムパラメータ名（テキスト）：** フィルタのURLパラメータ名を指定します。 設定されていない場合、フィルターフィールドの値が使用されます。

**非表示 (ブール値)：** チェックすると、ウィジェットは通常のユーザーには表示されません。 構成のフィルタ値はデフォルトで適用されますが、ユーザーは引き続きURLパラメーターを介して他の値をフィルターできます。 不変設定（以下を参照）を使用すると、URLパラメータのフィルタリングを防ぐことができます。

**不変 (ブール値):** これを有効にして、通常のユーザーがフィルタ値を変更できないようにします。 ウィジェットは非表示になり、 **また** URLパラメーターを介して設定されたフィルタ値は受け入れられません。 ウィジェット構成で設定されたフィルタ値は、（無効にされていない限り）常に適用されます。 なお、不変をtrueに設定すると、カスタムパラメータ名の値は無視されます。

**無効 (ブール値):** チェックすると、クエリは無視され、検索に参加しません。 これにより、フィルターを簡単に停止できますが、構成を保持して後で再度有効にすることができます。

**統合検索キー（テキスト）:** このウィジェットが参加している代替検索のキーを入力します。 設定されている場合、デフォルトのインデックスはまったく検索されないことに注意してください。 設定されていない場合、このウィジェットはデフォルトの検索に参加します。

このフィールドの値は、通常、アプリケーション定義のインデックスの名前と一致します。

## フィールドを見つける

カスタムフィルタウィジェットでフィルタリングできるフィールドを見つけるには、適切な権限を持つユーザーは、 ［**コントロールパネル**］ &rarr; ［**設定**］ &rarr; ［**検索**］ にナビゲートすることができます。  そこから、［フィールドマッピング］タブを開き、 `liferay-［companyId］` インデックスのマッピングを参照します。 マッピングの [`プロパティ`](https://www.elastic.co/guide/en/elasticsearch/reference/current/properties.html) セクションまでスクロールします。

![フィールドマッピングを参照して、Liferay DXPのインデックス付きフィールドを見つけます。](./filtering-search-results/images/04.png)

## ネストされたフィールドの検索と使用

{bdg-secondary}`利用可能 7.2 FP10+、7.3 FP1+、7.4+`

オブジェクト定義と [ウェブコンテンツ構造](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) フィールドは Elasticsearch のネストされたフィールドとしてインデックスされる。 ネストしたフィールドでフィルタリングするには、3つのカスタムフィルタウィジェットをページに追加する必要があります。 最初のウィジェットは、 [Elasticsearch `ネストされた` クエリ](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/query-dsl-nested-query.html) を追加するためのもので、他の2つはネストされたフィールドの名前と値にマッチする子クエリを定義するためのものです。 最終的なポータル・クエリが生成されると、 `ネストされた` クエリが子クエリをラップします。

```{important}
同一ページ内の複数のネストしたフィールドに対してカスタムフィルターを必要とする場合、各子クエリに対して別々のパラメーター名を設定する必要があります。 例については、 [カスタムフィルターの例](./custom-filter-examples.md#boosting-matches-to-nested-fields) を参照してください。 
```

インデックス内の既存のドキュメントでネストされたフィールドを検索するには、検索結果ウィジェットの [Display Results in Document Form](../search-results/configuring-the-search-results-widget#inspecting-search-engine-documents) 設定を使用します。

例えば、オブジェクト・エントリーは、 `nestedFieldArray` 、ネストされたフィールドを持ちます：

```json
"nestedFieldArray" : [
   {
     "fieldName" : "lastAcessed",
     "valueFieldName" : "value_date",
     "value_date" : "20230502000000"
   }
],
```

一方、ウェブコンテンツ記事は、 `ddmFieldArray` 、ネストされたフィールドを持っています：

```json
"ddmFieldArray" : [
   {
     "ddmFieldName" : "ddm__keyword__44012__Checkbox08350381_en_US",
     "ddmFieldValueKeyword_en_US" : "true",
     "ddmFieldValueKeyword_en_US_String_sortable" : "true",
     "ddmValueFieldName" : "ddmFieldValueKeyword_en_US"
   }
],
```

お使いのバージョンによっては、 [DDMフィールドのネストされたフィールドストレージ](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) がElasticsearchのデフォルトで有効になっている場合があります：

| Liferayのバージョン    | ネストされたフィールドはデフォルトで有効 |
|:---------------- |:-------------------- |
| 7.4 すべてのアップデート   | &#10004;             |
| 7.3 すべてのアップデート   | &#10004;             |
| DXP 7.2 SP3/FP8+ | &#10008;             |

動作を変更するには、System Settings &rarr; Dynamic Data Mapping Indexer の **Enable Legacy Dynamic Data Mapping Index Fields** 設定を使用します。

カスタムフィルタウィジェットを使ったウェブコンテンツ構造フィールドの使用例については [Boosting Matches to Nested Fields](custom-filter-examples.md#boosting-matches-to-nested-fields) を参照してください。

## 関連トピック

[カスタムフィルターの例](./custom-filter-examples.md)

[結果ランキング](../../search-administration-and-tuning/result-rankings.md)

[同義語セット](../../search-administration-and-tuning/synonym-sets.md)
