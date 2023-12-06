# ウェブコンテンツで有効期限とレビュー期限を使用する

> 対応可能：Liferay DXP/Portal 7.4以降

ウェブコンテンツの記事に有効期限やレビュー日を設定して、時間の制約があるコンテンツを管理することができます。 [有効にすると、ファイル所有者、レビュアー、またはフォルダ購読者は、ウェブコンテンツシステム設定に基づき、設定可能な間隔で、有効期限またはレビュー期限に達した記事を電子メール](#configuring-notification-emails) で通知されます。

記事の有効期限が切れると、その記事は無効になり、使用や編集ができなくなります。 記事を再び有効にするには、その有効期限を変更するか、記事の有効期限を無効にする必要があります。 有効期限が切れている間は、その記事にアクセスすることはできません。

これとは対照的に、査読が必要な論文は、利用可能なままである。 記事のレビュー日に到達しても、ユーザーへの通知が行われるだけで、記事の利用可能性には影響しません。

## 有効期限とレビュー日時の有効化

デフォルトでは、ウェブコンテンツの記事に有効期限やレビューが必要なことはありません。 ただし、記事の作成や編集の際に変更することができます。

![個々の記事の有効期限とレビューを有効または無効にする。](./using-expiration-and-review-dates-in-web-content/images/01.png)

複数の記事を編集する場合、期限切れはツールバーやアクションメニューから行います。

![複数の記事を選択し、ツールバーから期限切れにすることができる。](./using-expiration-and-review-dates-in-web-content/images/02.png)

有効期限またはレビューを有効にするには、 **Never Expire** または **Never Review** のチェックボックスをオフにします。 デフォルトのレビュー日時と有効期限は、アクティベーション時から1年に設定されています。 必要に応じて日程を変更する。

Liferay は、特定の [チェック間隔](#configuring-the-check-interval) で、有効期限またはレビュー期限に達した記事をチェックする。

## チェック間隔の設定

デフォルトでは、ウェブコンテンツは15分ごとに記事の有効期限とレビューの日付をチェックします。 これはカスタマイズできる。

1. クリック **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **System Settings** &rarr; **Web Content** &rarr; **Web Content** .

1. チェック間隔フィールドを使用して、記事チェックの間隔を分単位で設定する。

   ![チェック間隔の分数を入力します。](./using-expiration-and-review-dates-in-web-content/images/03.png)

1. 完了したら、 ［**Save**］ をクリックします。

これでシステムは、設定した間隔に従って、有効期限またはレビュー日をチェックします。

```{warning}
この機能を無効にする必要がある場合は、 [blacklist](../../../system-administration/installing-and-managing-apps/managing-apps/blacklisting-osgi-components.md)を参照してください。 インターバルにゼロや負の数を入力しないでください。
```

## 通知メールの設定

アーティクルの有効期限が切れたり、レビューが必要になると、Liferayはアーティクルの所有者、レビュアー、またはアーティクルを含むフォルダを購読しているユーザーに通知メールを送信します。 デフォルトの通知メッセージがあるが、カスタマイズすることもできる。

1. サイトまたはアセット ライブラリ内の Web コンテンツ アプリケーションに移動します。

1. アプリケーションバーの **アクション** ボタン（![Actions Button](../../../images/icon-actions.png)）をクリックし、 ［**Configuration**］ を選択します。

1. モーダルウィンドウで、 **Web Content Review Email** または **Web Content Expired Email** タブを選択します。

   ![設定モーダルウィンドウで通知メールを編集します。](./using-expiration-and-review-dates-in-web-content/images/04.png)

1. 目的の通知メッセージを作成します。

1. 完了したら、 [**保存**] をクリックします。

## 関連トピック

* [基本Webコンテンツ記事の追加](./adding-a-basic-web-content-article.md)
* [Webコンテンツ記事の絞り込みとソート](./filtering-and-sorting-web-content-articles.md)
