# トラブルシューティングツールとリソース

技術的な問題を素早く診断し、解決する能力が不可欠です。 Liferay Cloud プロジェクトにおける問題のトラブルシューティングに利用できるツールやリソースを熟知していること。

* [アプリケーションメトリクス](#application-metrics)
* [リアルタイムアラート](#real-time-alerts)
* [環境アクティビティ](#environment-activities)
* [環境ログ](#environment-logs)
* [シェルアクセス](#shell-access)
* [セルフヒーリング](#self-healing)
* [ディザスタリカバリ](#disaster-recovery)
* [Liferay Cloud Platformのステータス](#liferay-cloud-platform-status)
* [サポートアクセス](#support-access)
* [ヘルプセンター](#help-center)

これらのツールやリソースを使用することで、プロジェクト活動の追跡、サービスの設定、技術的な問題の解決などが可能になります。

```{note}
詳細については、Liferayとの法的契約に従うものとします。 法的な契約やサービスについては、 [Liferay Legal](https://www.liferay.com/legal) のページを参照してください。
```

## アプリケーションメトリクス

Liferay Cloudに組み込まれたモニタリング機能により、ユーザーは各環境サービスが使用しているリソースを把握することができます。 これらのアプリケーションメトリクスには、メモリとCPUの使用量、およびネットワークデータ転送量が含まれます。

メトリクスは、デフォルトの Liferay Cloud スタックサービスで利用可能です。Webserver、Liferay、Search、Database、Backupです。 CIメトリクスはinfra環境でも利用可能です。

![Liferay Cloud コンソールの Monitoring ページからアプリケーションメトリクスを表示します。](./troubleshooting-tools-and-resources/images/01.png)

ユーザーは、 [Dynatrace](../manage-and-optimize/application-metrics.md#advanced-application-metrics-production-only) の高度なパフォーマンス・モニタリングを本番環境に統合することもできます。

詳しくは、 [アプリケーションメトリクス](../manage-and-optimize/application-metrics.md) を参照してください。

## リアルタイムアラート

Liferay Cloud は、プロジェクトにおける予期せぬ動作をシステム管理者に警告することができます。 予期せぬ動作の例としては、オートスケーリングイベント、予想以上のメモリ消費量、割り当てられたCPUクォータへの到達、データベース接続の問題などがあります。

Liferay Cloudコンソールからすべての環境アラートを表示し、アラートの設定を行うことができます。

![Liferay CloudコンソールのAlertsページでアラートを表示、管理します。](./troubleshooting-tools-and-resources/images/02.png)

詳しくは [リアルタイムアラート](../manage-and-optimize/real-time-alerts.md) をご覧ください。

## 環境アクティビティ

ユーザーは、Liferay Cloud コンソールから環境のアクティビティを監視することができます。 **ビルドとデプロイメント** と **一般的な活動** 。

ビルド、デプロイメント、サービスアクティビティなどのステータスを確認し、環境問題のトラブルシューティングに役立てることができます。

![Liferay Cloudのコンソールから環境のアクティビティを表示します。](./troubleshooting-tools-and-resources/images/03.png)

詳しくは [チーム活動](../manage-and-optimize/team-activities.md) をご覧ください。

## 環境ログ

環境ログは、プロジェクトにおける技術的な問題を診断し、解決するために非常に重要です。 ユーザーは、Liferay Cloudのコンソールやお使いのOSの端末で環境ログにアクセスし、ダウンロードすることができます。

アプリケーションログ、ステータスログ、ビルドログは、Liferay Cloud Serviceごとに提供されます。

* **Application Logs** ：これらのログは、アプリケーションが実行され、ユーザーがアクセスした後に生成されたランタイム情報をリストアップします。
* **Application Logs** ：これらのログは、アプリケーションが実行され、ユーザーがアクセスした後に生成されたランタイム情報をリストアップします。
* **Build Logs** ：これらのログは、アプリケーションの起動時に生成されるビルド情報を一覧表示します。

![Liferay Cloud コンソールの Logs ページからログを表示します。](./troubleshooting-tools-and-resources/images/04.png)

詳しくは [Log Management](./reading-liferay-cloud-service-logs.md) をご覧ください。

## シェルアクセス

Liferay Cloudコンソールのコマンドラインツールは、スピード、コントロール、トレーサビリティ、スクリプト作成、自動化機能を提供し、開発者のワークフローに貢献します。

トラブルシューティングの際には、シェルアクセスツールを使用してアプリケーションの内部を確認し、ログでは簡単に見つけられない詳細を見ることができます。

![Liferay Cloudコンソールのシェルアクセスツールを使って、アプリケーション内部で何が起こっているのかを確認します。](./troubleshooting-tools-and-resources/images/05.png)

シェルは、 `liferay`、 `search`、 `webserver` など、ほとんどのサービスでアクセス可能です。 サーバーのファイルシステムに直接アクセスしたり、トラブルシューティングのためのコマンドを実行したりすることができます。

例えば、 `liferay` サービスのシェルから以下のコマンドを実行して、アドレスや外部サーバーへの接続をテストすることができます。

```bash
curl -v [address]
```

詳しくは [シェルアクセス](./shell-access.md) をご覧ください。

## セルフヒーリング

Liferay Cloudの自己修復機能は、サービスやアプリケーションが応答しなくなったことを検知し、応答しなくなったサービスを回復させるための手順を自動的に開始します。 このプラットフォームでは、プローブを使ってサービスを監視しています。

Liferay Cloud では、アプリケーションを管理するために組み合わせて使用する 2 つのプローブが用意されています。

* **Liveness Probe** ：サービスが実行されているかどうかを示すプローブです。
* **Readiness Probe** ：サービスがリクエストを受信する準備ができているかどうかを示すプローブです。

各プローブの設定については、「 [セルフヒーリング](./self-healing.md) 」を参照してください。

## ディザスタリカバリ

災害発生時、Liferay Cloudはプロジェクト復旧のために2つの戦略を提供します。自動」と「クロスリージョン」です。

Liferay Cloudの自動ディザスターリカバリー戦略は、同一地域内の3つのアベイラビリティゾーン間でサービスを複製します。 あるアベイラビリティーゾーンが利用できなくなった場合、ロードバランサーはユーザーの操作を必要とせず、残りのアベイラビリティーゾーンに自動的にルーティングします。

しかし、地域を越えた災害では、ユーザーの介入が必要です。 クロスリージョン ディザスタリカバリのツールやプロセスについては、 [クロスリージョンディザスタ リカバリの設定](./configuring-cross-region-disaster-recovery.md)を参照してください。

両方のディザスタリカバリ戦略の詳細は、 [ディザスタリカバリの概要](./disaster-recovery-overview.md) を参照してください。

## Liferay Cloud Platformの現状

技術的な問題を解決する際には、すべてのクラウドプラットフォームシステムが動作していることを確認してください。

ユーザーは、 [Liferay Cloud Platform](https://status.liferay.cloud/) ステータス ページから、Liferay Cloud Platform システムのステータス、計画されたメンテナンス ウィンドウ、およびインシデントの履歴を確認できます。

クラウドプラットフォームのステータス変更の通知を受け取るには、 **Subscribe to Updates** をクリックし、希望する通知方法を選択してください。

![Liferay Cloud Platformシステムのステータスを表示します。](./troubleshooting-tools-and-resources/images/06.png)

詳細は、 [Liferay Cloud Platformのステータス](./liferay-cloud-platform-status) を参照してください。

## サポートアクセス

サポートアクセスは、LiferayのエンジニアがLiferay Cloudのプロジェクト環境に直接アクセスすることで、トラブルシューティングを迅速に行うための環境設定です（オプション）。

デフォルトでは、サポートアクセスは各プロジェクト環境で有効になっていますが、管理者は **設定** ページから無効にすることができます。

![環境管理者は、設定ページでサポートアクセスを有効化または無効化することができます。](./troubleshooting-tools-and-resources/images/07.png)

詳しくは、 [サポートアクセス](./support-access.md) をご覧ください。

## ヘルプセンター

Liferay Cloud [Liferay Cloud](https://learn.liferay.com/w/liferay-cloud/index) で回答されていない質問がある場合、または問題を報告したい場合は、Liferay [Help Center](https://help.liferay.com/) にサインインしてサブスクリプション専用のリソースを閲覧するか、チケットを送信してください。

![Liferayヘルプセンターのページから、サブスクリプション専用のリソースを閲覧したり、チケットを送信することができます。](./troubleshooting-tools-and-resources/images/08.png)

ここから、Liferay Cloud [ナレッジベース](https://help.liferay.com/hc/ja/categories/360001132872) 、 [製品サポート](https://help.liferay.com/hc/ja/articles/360030208451-DXP-Cloud-Support-Overview) 、 [お知らせ](https://help.liferay.com/hc/ja/categories/360001192512) にアクセスすることができます。

ユーザーは、最新の Liferay Cloud [Help Center Updates](https://www.liferay.com/web/l/subscribe-to-liferay-dxp-cloud-updates) のメール通知を受け取るために登録することもできます。 これらのアップデートには、新しいプラットフォームのリリース、サービスアップデート、セキュリティアラートやパッチなどが含まれます。

```{note}
Liferay Cloud の通知は、Liferay Enterprise サブスクリプションが有効なお客様のみに配信されます。
```

追加のサポートについては、ユーザーはLiferayのグローバルな [サポートセンター](https://help.liferay.com/hc/ja/articles/360017784212?_ga=2.254167624.1908736764.1562000563-1350017715.1560788053) に電話で問い合わせるか、 [ヘルプセンター](https://help.liferay.com/) のページからチケットを提出することができます。

チケットを提出する際には、現在使用しているビルドイメージ、直面している動作や問題、問題を再現するための手順、実際の動作と期待される動作の両方の説明などの情報を提供してください。

## 関連トピック

* [Liferayクラウドサポートの概要](https://help.liferay.com/hc/ja/articles/360030208451-DXP-Cloud-Support-Overview)
* [Liferay Cloud ナレッジベース](https://help.liferay.com/hc/ja/categories/360001132872)
* [Liferay Cloudのお知らせ](https://help.liferay.com/hc/ja/categories/360001192512)
* [サポートアクセス](./support-access.md)
