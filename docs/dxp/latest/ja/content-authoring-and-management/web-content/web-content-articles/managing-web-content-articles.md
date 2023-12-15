# ウェブコンテンツの記事管理

ウェブコンテンツライブラリーに記事を追加したら、ウェブコンテンツUIで管理することができます。 アーティクルの管理アクションにアクセスするには、その **アクション** ボタン(![アクションボタン](../../../images/icon-actions.png))をクリックします。

![Click the article's actions button to access configuration options.](./managing-web-content-articles/images/01.png)

| オプション                                                          | 説明                                                                                                                                                                                                                     |
| :------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 編集 (![Edit](../../../images/icon-edit.png))                    | 記事の内容を編集する。 記事を修正するとバージョン番号が増えることに注意してください。                                                                                                                                                                            |
| プレビュー (![Preview](../../../images/icon-view.png))              | レンダリングされたウェブコンテンツを表示します。                                                                                                                                                                                               |
| Translate (![Translate](../../../images/icon-translate.png))   | ウェブコンテンツの記事を希望の言語に翻訳する。 詳しくは [ウェブコンテンツの翻訳](../../translating-pages-and-content/translating-web-content.md) をご覧ください。                                                                                         |
| 期限切れ (![Expire](../../../images/icon-time.png))                | ウェブコンテンツの記事を非アクティブにする。                                                                                                                                                                                                 |
| 購読 (![Subscribe](../../../images/icon-subscribe.png))          | 新着・更新記事の通知を受け取る。                                                                                                                                                                                                       |
| 履歴を見る(![履歴を見る](../../../images/icon-date-time.png))            | ウェブコンテンツのバージョン履歴を表示します。                                                                                                                                                                                                |
| 使用例を見る (![使用例を見る](../../../images/icon-view-type-list.png))    | ウェブコンテンツ記事が使用されているページ、ページテンプレート、表示ページテンプレートを表示します。                                                                                                                                                                     |
| コピーを取る (![Copy](../../../images/icon-copy.png))                | ウェブコンテンツの記事を複製する。 コピーは、同じ名前の最後に **Copy** が付加されたものを使用する。                                                                                                                                                                    |
| 翻訳用エクスポート (![Export](../../../images/icon-export.png))         | 翻訳用のウェブコンテンツを `.xliff` または `.xlf` ファイルとしてエクスポートします。 詳しくは、 [Exporting Content for Translation](../../translating-pages-and-content/translating-web-content.md#exporting-content-for-translation) を参照してください。  |
| 翻訳のインポート (![Import](../../../images/icon-download.png))        | `.zip`ファイルとしてまとめてインポートすることも、`.xliff`ファイルまたは`.xlf`ファイルとして個別にインポートすることもできます。 詳細については、 [コンテンツ翻訳のインポート](../../translating-pages-and-content/translating-web-content.md#importing-content-translations) を参照してください。 |
| 移動 (![Move](../../../images/icon-move-folder.png))             | 記事を別のフォルダに移す。                                                                                                                                                                                                          |
| パーミッション (![Permissions](../../../images/icon-permissions.png)) | ユーザーロールの記事権限を管理する。                                                                                                                                                                                                     |
| 削除 (![Delete](../../../images/icon-app-trash.png))             | ファイルを [ごみ箱](../../recycle-bin/recycle-bin-overview.md) に移動する。                                                                                                                                                |

```{tip}
フォルダを使用することで、ワークフローやパーミッションを含む、さらなる組織とアーティクルの管理機能を提供することができる。
```

情報パネルでは、記事の情報は2つのタブに整理されている：詳細とバージョンです。 記事の情報パネルにアクセスするには、記事を選択し、アプリケーション・メニューの **情報パネルの切り替え**( [情報パネルの切り替え](../../../images/icon-information.png) )をクリックします。

![Select the article and click on the toggle info panel icon to access the info panel reference.](./managing-web-content-articles/images/02.png)

## 情報パネル詳細タブ

詳細] タブには、ウェブコンテンツ記事に関する以下の情報が含まれます。

| 項目     | 説明                |
| :----- | :---------------- |
| ID     | 記事のID             |
| タイトル   | 記事のタイトル           |
| テンプレート | 記事で使用されているテンプレート。 |
| 原作者    | 記事の著者             |
| 重要度    | 記事の優先順位           |
| 公開開始日時 | 記事の表示日。           |
| 有効期限   | 記事の有効期限           |
| レビュー日時 | 記事が審査用に設定されたとき。   |

## 情報パネルのバージョンタブ

バージョン] タブには、選択したウェブコンテンツ記事の最新の 10 バージョンが表示されます。 利用可能なすべてのバージョンを表示するには、バージョンタブの一番下にある **もっと見る** ボタンをクリックするか、記事の **アクション** ボタン(![アクションボタン](../../../images/icon-actions.png))をクリックし、 **履歴を見る** を選択します。

![Click the article's Actions button and select View History to access configuration options for the versions.](./managing-web-content-articles/images/03.png)

| オプション                                              | 説明                                                                 |
| :------------------------------------------------- | :----------------------------------------------------------------- |
| プレビュー (![Preview](../../../images/icon-view.png))  | レンダリングされたウェブコンテンツの記事バージョンを表示します。                                   |
| 期限切れ (![Expire](../../../images/icon-time.png))    | ウェブコンテンツの記事バージョンを無効にする。                                            |
| 比較する                                               | 選択したバージョンと別のバージョンの違いを表示する。 バージョン間の追加、削除、書式の変更を表示する新しいページが表示されます。   |
| コピーを取る (![Copy](../../../images/icon-copy.png))    | 選択したバージョンと同じ新しいウェブコンテンツ記事を作成します。 コピーは、同じ名前の最後に **Copy** が付加されたものを使用する。 |
| 削除 (![Delete](../../../images/icon-app-trash.png)) | 選択したバージョンを削除する。                                                    |

## 関連トピック

* [基本的なウェブコンテンツ記事の追加](./adding-a-basic-web-content-article.md) 
* [ウェブコンテンツ記事のフィルタリングと並べ替え](./filtering-and-sorting-web-content-articles.md) 
* [ウェブ・コンテンツで有効期限とレビュー期限を使用する](./using-expiration-and-review-dates-in-web-content.md) 
