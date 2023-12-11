# ナレッジベースの管理

{bdg-secondary}`liferay 7.4 U72+/GA72+`.

ナレッジベースを使えば、製品ドキュメントを素早く作成し、エンドユーザーがナビゲートできる階層に整理することができます。 フォルダやネストされた記事を追加して、希望の構造と順序を作成する。 さらに、記事とフォルダのアクセス権を管理し、意図したユーザーだけがコンテンツにアクセスできるようにします。

![Add folders and nested articles to create the desired structure and order.](./managing-the-knowledge-base/images/01.png)

## フォルダの追加

1. [サイトメニュー](../../images/icon-menu.png)を開き、_コンテンツとデータ_ &rarr; _ナレッジベース_に移動します。

1. [フォルダと記事](../../images/icon-pages-tree.png))で、_追加_(![追加ボタン](../../images/icon-add.png))をクリックし、_フォルダ_を選択します。

1. 名前と説明を入力します。

1. フォルダーのパーミッションを設定します。 デフォルトでは、View権限はGuestロールに割り当てられており、誰でもフォルダを見ることができます。

   ![Enter a name, description, and configure permissions.](./managing-the-knowledge-base/images/02.png)

1. ［_保存_］をクリックします。

## フォルダと記事の管理

フォルダや記事を追加したら、左側のサイドパネルにドラッグ＆ドロップして、ドキュメントを整理したり順番を決めたりすることができます。 また、アクション（[アクションボタン](../../images/icon-actions.png)）をクリックすると、追加の管理オプションにアクセスできます。

![Drag and drop folders and articles to organize and order your documentation.](./managing-the-knowledge-base/images/03.png)

```{note}
7.4 U71/GA71以前のバージョンでは、Knowledge Baseの記事には優先度の値が含まれています。 この値は記事のタイトルの下に表示され、ナレッジベース表示ウィジェットでの順番を決定します。 この動作は [ナレッジベース システム設定](knowledge-base-system-settings.md) で設定できます。
```

### フォルダオプション

![Click the Actions button for a folder to access these management options.](./managing-the-knowledge-base/images/04.png)

**編集** (![Edit](../../images/icon-edit.png))：記事の名前と説明を更新する。

**インポート** (![Import](../../images/icon-import.png))：Markdownファイルと画像添付ファイルのZIPアーカイブをインポートします。 詳しくは [ナレッジベース記事のインポート](./importing-knowledge-base-articles.md) をご覧ください。

**移動** (![Move](../../images/icon-move-folder.png))：フォルダを移動します。

**購読** (ホームフォルダのみ)：ナレッジベース記事が作成、更新、削除された際に通知を受け取る。

**パーミッション** (![Permissions](../../images/icon-permissions.png))：異なるロールにリソースのパーミッションを割り当てます。

**削除** (![Delete](../../images/icon-app-trash.png))：フォルダとその内容を直ちに削除します。

さらに、_情報_ (![情報ボタン](../../images/icon-information.png))をクリックすると、現在のフォルダの情報パネルを切り替えることができます。

### 記事オプション

![Click the Actions button for an article to access these management options.](./managing-the-knowledge-base/images/05.png)

**Edit** (![Edit](../../images/icon-edit.png))：フォルダの名前と説明を変更します。

**子記事の追加** (![Page](../../images/icon-document.png))：子記事を作成する。

**Expire** (![Time](../../images/icon-time.png))：記事を期限切れとしてマークし、レビュアー、オーナー、購読者に通知する。 期限切れの記事はサイトに表示できません。 詳しくは、 [Articleのレビューと有効期限の設定](#setting-review-and-expiration-dates-for-articles) を参照のこと。

**Subscribe** (![Subscribe](../../images/icon-bell.png))：記事の更新を受け取るために登録する。 ユーザーは、システムのメールと通知設定に基づいて、記事の通知を受け取る。

**歴史** (![History](../../images/icon-date-time.png))：異なるバージョンの記事を表示し、比較する。

**Print** (![Print](../../images/icon-print.png))：記事を印刷するためのダイアログを開く。

**移動** (![Move](../../images/icon-move-folder.png))：記事を別のフォルダまたは親記事に移動します。

**パーミッション** (![Permissions](../../images/icon-permissions.png))：記事のパーミッションを管理する。

**削除** (![Delete](../../images/icon-app-trash.png))：子記事とともに記事を直ちに削除する。

また、記事を閲覧中に_Info_([情報ボタン](../../images/icon-information.png))をクリックすると、記事の詳細やバージョンを見ることができます。

## 記事の見直しと有効期限の設定

ナレッジベースの記事は一定期間しか有効でないことがあります。 このような状況のために、ドキュメンテーションの完全性を保証するために、ナレッジベース記事の有効期限とレビュー期限を設定することができます。 設定されている間、Liferayは設定された間隔でナレッジベースの記事をチェックし、有効期限やレビュー期限に達した記事がないか調べます。 そして、レビュアー、オーナー、購読者に通知を送る。 有効期限が近づくと、Liferayはユーザーに記事の有効期限が近いことを通知します。

デフォルトでは、記事の有効期限が切れたり、レビューが必要になったりしないように設定されていますが、記事を作成または編集する際に変更することができます。

![Set review and expiration dates for articles.](./managing-the-knowledge-base/images/06.png)

デフォルト値は1年先ですが、希望の日付と時間を選択できます。 ユーザーは、システムのメールと通知設定に基づいて、記事の通知を受け取る。

有効期限が切れると、ナレッジベースの記事はサイト内で使用できなくなります。 URLからナレッジベースの記事にアクセスしたユーザーは、404 HTTPステータスを受け取ります。 さらに、有効期限が将来の値に設定されるか、有効期限が無効にされない限り、期限切れの記事は修正できません。

審査期限に達しても、記事に影響はない。 ユーザーに記事の内容を確認するよう促すだけである。

### レビューと期限切れ通知の設定

1. [グローバルメニュー](../../images/icon-applications-menu.png))を開き、[コントロールパネル]タブに移動し、[システム設定]をクリックします。

1. コンテンツとデータ」の下にある「_ナレッジ・ベース_」をクリックします。

   ![記事のチェック間隔と期限切れをユーザーに通知するタイミングを設定します。 ](./managing-the-knowledge-base/images/07.png)

1. システム・スコープ」の「サービス」タブで、チェック間隔を入力する。 この値は、チェックの間隔を何分にするかを決定する。 デフォルトでは15分。

1. 通知を送信する有効期限までの週数を決定します。 この範囲内の記事には、Expiring Soonのラベルが貼られる。 デフォルト値は1週間。

1. ［_保存_］をクリックします。

1. Site Scopeの下にある_Service_タブに移動します。

1. レビューと期限切れメールを有効/無効にする。

1. レビューと期限切れメールの内容を決定する。

   ![Configure review and expiration emails.](./managing-the-knowledge-base/images/08.png)

1. ［_保存_］をクリックします。

## 記事の履歴を確認する

アーティクルの履歴を見る際、バージョンの詳細を見たり、内容を比較したり、以前のバージョンに戻したりすることができます。

![View, compare, and revert article versions.](./managing-the-knowledge-base/images/09.png)

バージョンの内容を比較するには、2つの記事を選択し、_バージョンを比較_をクリックします。

![Compare changes between two versions of an article.](./managing-the-knowledge-base/images/10.png)

これにより、バージョン間のすべての追加、削除、フォーマットの変更がハイライトされます。

## 関連トピック

* [ナレッジ・ベース記事の作成](./creating-knowledge-base-articles.md)
* [ナレッジベース記事のインポート](./importing-knowledge-base-articles.md)
* [ナレッジベース システム設定](./knowledge-base-system-settings.md)
