# 第8ステージ移行後の次のステップ

　 このセクションの前の段階がすべて完了したなら、オンプレミスの Liferay DXP インストールを Liferay Cloud に正常に移行したことになります!

Liferay DXPがLiferay Cloud上で動作するようになったので、 [自動バックアップ](../platform-services/backup-service/backup-service-overview.md), [内蔵継続的インテグレーション](../platform-services/continuous-integration.md), 自動 [サービスログ](../troubleshooting/reading-liferay-cloud-service-logs.md), 内蔵 [セキュリティ機能](../infrastructure-and-operations/security/information-security-and-liferay-cloud.md)などその機能を利用する準備が整ったことになります。

しかし、Liferay Cloudの機能をフルに活用するためには、導入時にいくつかの追加手順が必要です。

* [チームを設定する](#set-up-teams) メンバーシップとパーミッションの管理
* [シングルサインオンを設定する](#set-up-sso) 認証を効率化する
* [カスタムドメインの追加](#add-custom-domains) ニーズに合わせて
* [ディザスターリカバリー環境の構築](#set-up-a-disaster-recovery-environment)
* [サービスを設定する](#configure-your-services) あなたに最適な方法で動作するように設定する
* [アプリケーションパフォーマンスの最適化およびチューニング](#optimize-and-tune-application-performance)
* [Liferay Cloudでの開発を開始する](#get-started-developing-on-dxp-cloud)

## チーム編成

Liferay Cloudの管理者は、必要に応じて他のメンバーを招待し、プロジェクトのさまざまな領域へのアクセスを管理することができます。 [チームメンバーを招待し](../manage-and-optimize/environment-teams-and-roles.md#inviting-team-members) 、次に適切な [チームロール](../manage-and-optimize/environment-teams-and-roles.md#understanding-team-roles) を与えて、全員がDXPクラウドプロジェクトで必要なレベルのアクセス権を持っていることを確認します。

詳しくは、 [環境のチームとロール](../manage-and-optimize/environment-teams-and-roles.md) を参照してください。

## SSOの設定

シングルサインオンは、DXPクラウドインスタンスでLiferayのユーザーを認証するために、お好みのIDプロバイダーを使用することができます。 これにより、サインオン・エクスペリエンスがよりスムーズになり、プロジェクトの他の部分とより統合された印象を与えることができます。

Liferay Cloudは、SAML2.0に準拠したSignle Sign-On Identity Providerをサポートしています。 詳細は、 [Liferay CloudでのSSOの使用](../infrastructure-and-operations/security/using-sso-with-liferay-cloud.md) を参照してください。

## カスタムドメインの追加

Liferay Cloud上の環境では、必要に応じて独自のカスタムドメインをホストしていることを確認してください。 Liferay Cloudは、お客様のカスタムドメインと連携し、環境ごとに認証ドメインを定義することが可能です。

詳しくは、 [カスタムドメイン](../infrastructure-and-operations/networking/custom-domains.md) をご覧ください。

## ディザスターリカバリー環境の構築

デフォルトでは、DXPクラウドは、同じリージョン内で [自動ディザスタリカバリ](../troubleshooting/disaster-recovery-overview.md#automatic-disaster-recovery-strategy) を提供することにより、サービス停止によるダウンタイムを軽減します。 しかし、災害によってDXPクラウド環境のサービスエリアに障害が発生した場合、本番インスタンスのユーザーのダウンタイムを最小限に抑えるために、フォールバック環境（またはディザスターリカバリー環境）の使用も検討する必要があります。

[計画外のダウンタイムから可能な限り最も堅牢な保護を維持するようにDiasterRecovery環境](../troubleshooting/configuring-cross-region-disaster-recovery.md) を構成します。 自動ディザスターリカバリー、クロスリージョンディザスターリカバリーについてはこちら [disaster-recovery-overview.md](../troubleshooting/disaster-recovery-overview.md).

```{important}
ディザスターリカバリー環境を構築するためには、サブスクリプションの一部として、そのための環境を別途購入する必要があります。
```

## サービスを設定する

`liferay` サービスに加え、メインのLiferay Cloud環境にはすべて、個別に設定可能なデフォルトサービスのセットがあります。 これらの各サービスには、早い段階で設定しておくべき設定項目があります。

* [`backup` service](../platform-services/backup-service/backup-service-overview.md) は定期的に（または手動でトリガーしたときに）自動的にバックアップを作成し、いつでも環境にリストアすることができます。 まず、バックアップの [頻度と](../platform-services/backup-service/backup-service-overview.md#scheduling-automated-backups-and-cleanups) 保持期間を設定することから始めるとよいでしょう。

* [`search` service](../platform-services/search-service.md) は、 `サービスのElasticsearch実装を提供し`。 `.yml` 設定ファイルを `検索` サービスの `configs/common/config/` フォルダに配置すると [Elasticsearchの動作を設定](../platform-services/search-service.md#configurations) することが可能です。 詳しくは、 [Elasticsearch公式ドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/current/settings.html) をご覧ください。

* [`Webサーバー` サービス](../platform-services/web-server-service.md) は、Liferay Cloudサービスとインターネットの残りの部分との間のゲートウェイを提供します。 Liferayインスタンスがサービスするパフォーマンスやリクエストの種類によっては、期待通りにリクエストを処理するために [タイムアウトや再試行回数](../platform-services/web-server-service.md#environment-variables) を調整したい場合があるかもしれません。

* [`データベース` サービス](../platform-services/database-service/database-service.md) は、以前マイグレーションで [アップロードしたデータベース](./uploading-and-restoring-the-data-backup.md)を安全に提供するものです 。 メンテナンスのためのダウンタイムの影響を軽減するために、お好みの [データベースメンテナンスウィンドウ](../platform-services/database-service/database-service.md#database-maintenance-window-variables) を設定することができます。

## アプリケーションパフォーマンスの最適化およびチューニング

Liferay CloudでLiferayを使い始めるにあたり、アプリケーションのパフォーマンスを監視・チューニングするための利用可能なツールに慣れ親しんでください。

* **アラート** は、サービスがリソース制限の問題に直面したとき、インスタンス数を増減させたとき、その他の問題が発生したときにリアルタイムで通知することが可能です。 [これらのイベントを認識できるように、ステータスアラート](../manage-and-optimize/real-time-alerts.md) をニーズに合わせて設定します。

* **オートスケーリング** Liferay DXPサービスのインスタンス数は、ユーザーのトラフィックに対応するために必要に応じて自動的に調節されます。 [この最適化を利用するために、](../manage-and-optimize/auto-scaling.md) 自動スケーリングを設定します。

* [**サービスポップオーバー**](../manage-and-optimize/application-metrics.md#service-popover) および [**モニタリング画面**](../manage-and-optimize/application-metrics.md#extended-application-metrics) ではサービスの詳細やリソース使用量を確認することができます。 サービスのパフォーマンスの監視については、 [アプリケーションメトリクス](../manage-and-optimize/application-metrics.md) を参照してください。

* 本番環境では、 [Dynatrace integration](../manage-and-optimize/application-metrics.md#advanced-application-metrics-production-only) を使用して、より高度なパフォーマンスメトリクスを使用することもできます。 **これを使用するには、LiferayCloudサブスクリプションに特定のDynatraceアドオンが必要であることに注意してください。**

Liferay Cloud上のインスタンスは、オンプレミスインスタンスと同様に、お客様ご自身でパフォーマンステストと最適化を行う必要があります。 サービスデータ、メトリクス、 [ロギング](../troubleshooting/reading-liferay-cloud-service-logs.md) が利用できるので、テストに役立てることができます。

## Liferay Cloudでの開発を開始する

Liferay Cloud への移行が完了し、 [カスタマイズを](./migrating-dxp-configurations-and-customizations.md)配置したので、変更をクラウド環境に配備して開発を継続することができます。 もしまだなら、 [コマンドラインツール](../reference/command-line-tool.md) に慣れることは、開発作業を行う上で助けになります。

[DXPクラウドコンソール](../build-and-deploy/deploying-changes-via-the-liferay-cloud-console.md)を介して、サービスをデプロイすることに加えて、 [自動デプロイ](../build-and-deploy/automatically-deploying-ci-service-builds.md)を構成して、開発環境のプロセスを高速化することもできます。また、CIサービスが利用する[Jenkinsパイプラインをカスタマイズして](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile)、自分のニーズに合わせることもできます。Liferay Cloudのデプロイワークフローについて、詳しくは[こちら](../build-and-deploy/overview-of-the-liferay-cloud-deployment-workflow.md)をご参照ください。
