# 第8ステージ移行後の次のステップ

　 このセクションの前の段階がすべて完了したなら、オンプレミスのLiferay DXPインストールをLiferay Cloudに移行することに成功したことになります!

Liferay DXPがLiferay Cloud上で動作するようになったので、その機能を活用する準備が整いました。これには [自動バックアップ](../platform-services/backup-service/backup-service-overview.md)、 [内蔵の継続的インテグレーション](../platform-services/continuous-integration.md)、自動 [サービスログ](../troubleshooting/reading-liferay-cloud-service-logs.md)、そして内蔵 [セキュリティ機能](../tuning-security-settings/information-security-and-liferay-cloud.md)があります。

しかし、Liferay Cloudの機能をフルに活用するためには、開始時にいくつかの追加手順があります。

* [チーム設定](#set-up-teams) メンバーシップとパーミッションの管理
* [シングルサインオン](#set-up-sso) を設定し、認証を効率化する。
* [ニーズに合わせてカスタムドメインを追加](#add-custom-domains)
* [ディザスターリカバリー環境の構築](#set-up-a-disaster-recovery-environment)
* [サービスを設定する](#configure-your-services) お客様に最適な方法で動作するように設定します。
* [アプリケーションパフォーマンスの最適化およびチューニング](#optimize-and-tune-application-performance)
* [Liferay Cloudでの開発を開始する](#get-started-developing-on-liferay-cloud)

## チーム編成

Liferay Cloudの管理者として、必要に応じて他のメンバーを招待し、プロジェクトの様々な領域へのアクセスを管理することができます。 [チームメンバーを招待します](../manage-and-optimize/environment-teams-and-roles.md#inviting-team-members) それから、適切な [チームロール](../manage-and-optimize/environment-teams-and-roles.md#understanding-team-roles) を与え、全員が Liferay Cloud プロジェクトで必要なレベルのアクセス権を持つようにします。

詳しくは、 [環境のチームとロール](../manage-and-optimize/environment-teams-and-roles.md) をご覧ください。

## SSOの設定

シングルサインオンは、Liferay CloudインスタンスでユーザーをLiferayに認証するために、お好みのIDプロバイダーを使用することができます。 これにより、サインオン・エクスペリエンスがよりスムーズになり、プロジェクトの他の部分とより統合された印象を与えることができます。

Liferay Cloud は、SAML 2.0 に準拠した Signle Sign-On Identity Provider をサポートしています。 詳細については、 [Liferay CloudでSSOを使用する](../tuning-security-settings/using-sso-with-liferay-cloud.md) をご覧ください。

## カスタムドメインの追加

Liferay Cloud上の環境では、必要に応じて独自のカスタムドメインをホストしていることを確認してください。 Liferay Cloudは、お客様のカスタムドメインと連携し、環境ごとに認証ドメインを定義することが可能です。

詳しくは、 [カスタムドメイン](../configuring-the-cloud-network/custom-domains.md) をご覧ください。

## ディザスターリカバリー環境の構築

Liferay Cloudはデフォルトで、同一リージョン内の [自動ディザスタリカバリ](../troubleshooting/disaster-recovery-overview.md#automatic-disaster-recovery-strategy) を提供することにより、サービス停止によるダウンタイムを軽減します。 しかし、災害によりLiferay Cloud環境のサービス提供地域が停止した場合、本番インスタンスのユーザーのダウンタイムを最小限に抑えるために、フォールバック環境（またはディザスターリカバリー環境）の使用も検討する必要があります。

[Diaster Recovery 環境](../troubleshooting/configuring-cross-region-disaster-recovery.md) を設定し、計画外のダウンタイムから可能な限り強固な保護を維持します。 [自動的かつ地域横断的なディザスターリカバリーについて詳しくはこちら](../troubleshooting/disaster-recovery-overview.md).

```{important}
ディザスターリカバリー環境を構築するためには、サブスクリプションの一部として、そのための環境を別途購入する必要があります。
```

## サービスを設定する

`liferay` サービスに加え、メインのLiferay Cloud環境にはすべてデフォルトのサービスセットがあり、個別に設定することができます。 これらの各サービスには、早い段階で設定しておくべき設定項目があります。

* [`バックアップ` サービス](../platform-services/backup-service/backup-service-overview.md) は、定期的に（または手動でトリガーしたときに）自動的にバックアップを作成し、いつでも環境にリストアすることができます。 まず、バックアップに希望する [の頻度と保存期間](../platform-services/backup-service/backup-service-overview.md#scheduling-automated-backups-and-cleanups) を設定することから始めるとよいでしょう。

* [`search` service](../platform-services/search-service.md) は、お客様の `liferay` service のために Elasticsearch の実装を提供します。 `.yml` 設定ファイルを `search` サービスの `configs/common/config/` フォルダに配置し、 [Elasticsearch の動作を設定する](../platform-services/search-service.md#configurations) . 詳しくは、 [Elasticsearch公式ドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/current/settings.html) をご覧ください。

* [`ウェブサーバー` サービス](../platform-services/web-server-service.md) は、お客様の Liferay Cloud サービスとインターネットの残りの部分との間のゲートウェイを提供します。 Liferayインスタンスがサービスするパフォーマンスやリクエストの種類によっては、 [のタイムアウトやリトライ回数](../platform-services/web-server-service.md#environment-variables) を微調整して、期待通りにリクエストが処理されるようにしたい場合があります。

* [`データベース`サービス](../platform-services/database-service/database-service.md)は、[先に移行でアップロードした]データベースを安全に提供します。メンテナンスのためのダウンタイムの影響を軽減するために、お好みの [データベースメンテナンスウィンドウ](../platform-services/database-service/database-service.md#database-maintenance-window-variables) を設定するとよいでしょう。

## アプリケーションパフォーマンスの最適化およびチューニング

Liferay CloudでLiferayを使い始めるにあたり、アプリケーションのパフォーマンスを監視・チューニングするための利用可能なツールに慣れ親しんでください。

* **アラート** サービスがリソース制限の問題に直面したとき、インスタンス数を増減させたとき、その他の問題が発生したときに、リアルタイムで通知することができます。 [これらのイベントを認識できるように、ステータスアラート](../manage-and-optimize/real-time-alerts.md) をニーズに合わせて設定します。

* **オートスケーリング** Liferayサービスのインスタンス数は、ユーザーのトラフィックに対応するために必要な数だけ自動的に調整されます。 [この最適化を利用するために、オートスケーリング（](../manage-and-optimize/auto-scaling.md) ）を設定します。

* [**サービスポップアップ**](../manage-and-optimize/application-metrics.md#service-popover) と [**モニタリング画面**](../manage-and-optimize/application-metrics.md#extended-application-metrics) を表示すると、サービスの詳細とリソースの使用状況を確認できます。 サービスのパフォーマンス監視については、 [アプリケーションメトリクス](../manage-and-optimize/application-metrics.md) を参照してください。

* 本番環境では、 [Dynatrace integration](../manage-and-optimize/application-metrics.md#advanced-application-metrics-production-only) を使用することで、より高度なパフォーマンスメトリクスを使用することもできます。 **なお、これを利用するには、Liferay Cloudのサブスクリプションに特定のDynatraceアドオンが必要です。**

オンプレミスのインスタンスをチューニングするのと同じように、Liferay Cloud上のインスタンスで独自のパフォーマンステストと最適化を実行する必要があります。 サービスデータ、メトリクス、 [ロギング](../troubleshooting/reading-liferay-cloud-service-logs.md) が用意されており、テストに役立てることができます。

## Liferay Cloudでの開発を始めよう

Liferay Cloudに移行し、[カスタマイズ](./migrating-dxp-configurations-and-customizations.md)をデプロイ済みなので、変更をクラウド環境にデプロイして開発を続けることができます。まだの方は、[コマンドラインツール](../reference/command-line-tool.md)
を習得することで、開発作業を行うことができます。

[Liferay Cloudコンソールから](../updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console.md)サービスをデプロイするだけでなく、[自動デプロイメント](../updating-services-in-liferay-paas/automatically-deploying-ci-service-builds.md)を設定して、開発環境のプロセスをスピードアップすることもできます。また、ニーズに合わせて、CIサービスが使用する [Jenkinsパイプラインをカスタマイズ](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile) することができます。

Liferay Cloudのデプロイワークフローについて、詳しくは[こちら](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)をご覧ください。