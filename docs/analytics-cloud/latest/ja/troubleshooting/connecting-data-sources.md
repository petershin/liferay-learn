# データソースの接続

環境やデータソースが誤って設定されていると、Liferay DXPのデータソースへのアクセスを妨げたり、中断させたりすることがあります。 ここでは、DXPデータソースの問題をトラブルシューティングする方法をご紹介します。

## Analytics Cloudへのネットワークアクセスがない

次のURLを許可リストに追加して、DXPのインストールで弊社のAnalytics Cloudサーバーへのインターネットアクセスが可能であることを確認してください。

* `https://analytics.liferay.com`
* `https://osbasahpublisher-{regionKey}.lfr.cloud`
* `https://osbasahbackend-{regionKey}.lfr.cloud`
* `https://analytics-js-cdn.liferay.com`

```{note}
なお、 {regionKey} は、ワークスペース設定時の初期選択（ac-southamericaeast1、ac-europewest2、ac-europewest3、ac-uswest1）に基づく。
```

```{important}
企業のイントラネットの利用状況を分析するなど、いくつかのユースケースでは、訪問者のブラウザもファイアウォールの背後にあります。 このシナリオでは、企業のオフィスネットワークが上記のURLのアウトバウンドアクセスも許可していることを確認する必要があります。
```

## Analytics Cloudへの接続を検証する

データがAnalytics Cloudに送信されているかどうかを検証するのに役立つヒントをご紹介します。

### アナリティクスのイベント

アナリティクスのイベントは、クライアントのブラウザから直接送信されます。 データがAnalytics Cloudに送信されていることを確認するには、次の手順を実行します。

1. 追跡されているDXPのWebサイトのページをご覧ください。
1. ブラウザのインスペクタを開き、［ネットワーク］タブに移動します。
1. ネットワーク タブを XHR でフィルタリングします。
1. ページを更新します。
1. `osbasahpublisher`で始まるリクエストがあることを確認してください。 リクエストは以下のスクリーンショットのようなものになります。

   ![Validating the connection to Analytics Cloud.](connecting-data-sources/images/01.png)

   この要求が表示されている場合は、お客様のWebサイトがアナリティクス データをAnalytics Cloudワークスペースに送信していることを意味します。 リクエストのペイロードをチェックし、`channelId`という変数があることを確認する。

### 連絡先データ

DXPは、ログインユーザーの連絡先情報を個別のプロファイルデータとしてAnalytics Cloudに送信します。 このデータはDXPサーバーから直接送信されます。

連絡先データが送信されていることを確認するには、DXPサーバーのログに以下のようなメッセージがないか確認してください。

```
INFO  [liferay/analytics_messages_processor-1][AddAnalyticsMessagesMessageListener:70] Added 500 analytics messages

INFO  [liferay/analytics_messages_processor-1][AddAnalyticsMessagesMessageListener:70] Added 500 analytics messages

INFO  [liferay/scheduler_dispatch-3][SendAnalyticsMessagesMessageListener:149] Sent 100 analytics messages

INFO  [liferay/scheduler_dispatch-3][SendAnalyticsMessagesMessageListener:164] Deleted 100 analytics messages
```

これらのサーバーログが表示されている場合は、連絡先データが正常にACに送信されていることを示しています。

## データ処理時間

データが Analytics Cloud に到着すると、ワークスペース ダッシュボードに表示される前に、処理にさらに時間がかかります。

アナリティクス イベントの場合は、サイト ダッシュボードの 24 時間フィルターの訪問者メトリクスを 10 分から 15 分以内に表示できるようにする必要があります。

![Analytics Data coming in over a period of time.](connecting-data-sources/images/02.png)

セッション期間やバウンス率などの他のセッション関連データは、訪問者のセッションが終了するまで待つ必要があります。 ビジターセッションは、30分間の非活動時間が経過した時点、またはUTC 00:00:00:00のいずれか早い時点で終了したとみなされます。

訪問者プロフィールは、処理に時間がかかり、時間の経過とともに利用可能になります。

## サポート対象外のバージョン

**エラーメッセージ:** `Unsupported version. この接続方法は、データソースのLiferayバージョンをサポートしていません。 Liferay 7.0/7.1のインスタンスに接続していることを確認するか、別の接続方法を試してください。`

```{important}
Liferay DXPのインストールは、以下のフィックスパックの最小要件を満たす必要があります：

  * 7.4+
  * 7.3 フィックスパック 1
  * 7.2 フィックスパック 11
  * 7.1 フィックスパック 22
  * 7.0 フィックスパック 98

```

**解決策：**

1. [Liferay DXP 7.0 または 7.1 インスタンスと接続] していることを確認してください。

1. [Liferay DXPデータソースの追加](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) の手順に従ってください。

1. エラーが続く場合は、DXPインスタンスでJSONウェブサービスが有効になっていることを確認してください。 デフォルトで有効になっています。 [ポータルプロパティ](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) でjson.web.service.enabled=falseを設定して無効にしていた場合（例えば、 [ポータルプロパティ](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/portal-properties.html) で設定）、設定を削除するか、プロパティ値をtrueにしてください。

## ログインしているユーザーが匿名で表示される

[Syncing Contacts](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) の場合、Analytics CloudはLiferay DXP内に存在するユーザーレコードに依存します。 したがって、 [シングルサインオンの設定](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/configuring-sso) または [LDAPディレクトリへの接続](https://learn.liferay.com/w/dxp/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory) を使用している場合は、Analytics Cloudと連絡先を同期する前に、すべてのユーザーをLiferay DXPに必ずインポートまたはマッピングしてください。

## ユーザーの同期に時間がかかる

ユーザーの同期には Liferay DXP のバッチエンジンを使用します。 非常に多くのユーザーを同期する場合は、バッチサイズを大きくしてください。 Liferay DXP で、 **Global Menu** &rarr; **Instance Settings** &rarr; **Batch Engine** に移動します。 **Export Batch Size** と **Import Batch Size** を `1000` に設定する。

![Increase batch size in Liferay DXP.](./connecting-data-sources/images/03.png)
