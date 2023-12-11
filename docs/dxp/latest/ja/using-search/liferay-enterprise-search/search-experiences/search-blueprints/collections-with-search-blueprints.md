# 検索ブループリントのコレクション

{bdg-secondary}`7.4 U88+`
{bdg-link-primary}`[ベータ版特集](../../../../system-administration/configuring-liferay/feature-flags.md)`

検索ブループリントを作成すると、 [コレクション・プロバイダ](../../../../site-building/displaying-content/collections-and-collection-pages/collection-providers.md) が自動的に登録されます。 ブループリントのクエリとコンフィギュレーションに一致するアセットがコレクションに追加されます。

```{important}
Liferay の [Asset Framework](../../../../building-applications/data-frameworks/asset-framework.md) に登録されたコンテンツだけが、ブループリント収集プロバイダから返されます。
```

![Search blueprints are registered as collection providers.](./collections-with-search-blueprints/images/01.png)

検索ブループリントのコレクション・プロバイダを使用するには、

1. LPS-129412 の [ベータ機能フラグ](../../../../system-administration/configuring-liferay/feature-flags.md) を有効にしてください。

   ブループリントのコレクションプロバイダは、Liferayの起動時またはブループリントの公開時にのみ登録されます。 機能フラグを有効にしたときに既存のブループリントがある場合は、各ブループリントを編集して保存し、コレクション プロバイダを登録する必要があります。

1. [ブループリントの作成](./creating-and-managing-search-blueprints.md) .

1. コンテンツページのエディタで、Collection Displayフラグメントを追加します。

   コレクションページを追加するときに、コレクションプロバイダを使用することもできます。

1. コレクション プロバイダ フィールドで、ブループリントのコレクション プロバイダを選択します。

他のコレクションと同様に、 [コレクションフィルター](../../../../site-building/displaying-content/additional-content-display-options/filtering-collections-on-a-page.md) を使用して、キーワードまたはカテゴリでブループリント駆動コレクションをフィルタリングできます。

## 例将来のイベントの表示

カレンダーイベントを作成し、将来発生するイベントのみを返すようにブループリントを設定します。 コレクション表示フラグメントを使用して、コンテンツページにイベントを表示します：

1. LPS-129412 の [ベータ機能フラグ](../../../../system-administration/configuring-liferay/feature-flags.md) を有効にしてください。

1. ページを作成し、カレンダーウィジェットを追加します。

1. 3つのカレンダーイベントを作成する：

   * 過去のイベント：今後5分以内に発生し、15分（またはそれ以下）続くように設定する。
   * 未来のイベント1：未来に始まるイベントを作る。
   * 未来の出来事2：未来に起こる別の出来事を作る。

   ![Three events are added to the Calendar widget.](./collections-with-search-blueprints/images/03.png)

1. アプリケーション・メニュー(![グローバル・メニュー](../../../../images/icon-applications-menu.png))から、_Blueprints_を開きます。

1. 要素タブで、このJSONを使って新しいカスタム要素を追加する：

   ```json
   {
      "description_i18n": {
         "en_US": "Limit results to only future events, using the endTime field."
      },
      "elementDefinition": {
         "category": "filter",
         "configuration": {
            "queryConfiguration": {
               "queryEntries": [
                  {
                     "clauses": [
                        {
                           "context": "query",
                           "occur": "filter",
                           "query": {
                              "range": {
                                 "endTime": {
                                    "gt": "${time.current_date|date_format=timestamp}"
                                 }
                              }
                           }
                        }
                     ]
                  }
               ]
            }
         },
         "icon": "filter",
         "uiConfiguration": {}
      },
      "title_i18n": {
         "en_US": "Limit Results to Future Events."
      },
      "type": 0
   }
   ```

1. ブループリント] タブで、未来のカレンダー イベントのみに一致するブループリントを作成します：

   * タイトル今後のカレンダーイベント提供者_を入力してください。
   * クエリ設定：検索可能なタイプで_カレンダーイベント_を選択します。
   * Query Elements: _Limit Results to Future Events_ 要素を追加しました。

1. 設計図を保存する。

1. サイトメニュー(![サイトメニュー](../../../../images/icon-product-menu.png))から、Upcoming Eventsというコンテンツページを追加する。

1. コレクション表示フラグメントをページに追加し、_Future Calendar Events Provider_ コレクション・プロバイダを選択します。

   箇条書きリストを表示するようにコレクション表示フラグメントを設定する。

1. ページを公開すると、未来のカレンダーイベントが表示されます。

![Only the future events are displayed in the collection display fragment.](./collections-with-search-blueprints/images/02.png)

ブループリントを活用して結果を動的に返し、フラグメント・ツールボックスのメリットを享受してページをレイアウトする。
