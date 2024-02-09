---
toc:
- ./getting-started/initial-setup-overview.md
- ./getting-started/development-requirements.md
- ./getting-started/configuring-your-github-repository.md
- ./getting-started/configuring-your-bitbucket-repository.md
- ./getting-started/configuring-your-gitlab-repository.md
- ./getting-started/logging-into-your-liferay-cloud-services.md
- ./getting-started/understanding-liferay-cloud-environments.md
---
# はじめに

```{toctree}
:maxdepth: 1

getting-started/initial-setup-overview.md
getting-started/development-requirements.md
getting-started/configuring-your-github-repository.md
getting-started/configuring-your-bitbucket-repository.md
getting-started/configuring-your-gitlab-repository.md
getting-started/logging-into-your-liferay-cloud-services.md
getting-started/understanding-liferay-cloud-environments.md
```

Liferay Cloudは、Liferay DXP上の素晴らしいアプリケーションを簡素化、安全、そして配信するために必要なインフラとツールを提供する、安全で信頼できるエンタープライズ向けクラウドプラットフォームです。

次の機能を提供するプラットフォームを使用して、心配をせずにさらに構築できます。

* [標準に準拠したセキュリティ、自動バックアップ、柔軟なガバナンス](#standards-compliant-security-automated-backups-and-flexible-governance)
* [高可用性、スケーラビリティ、およびパフォーマンス](#high-availability-scalability-and-performance)
* [リアルタイムアラート](#real-time-alerts)

これらすべては、Liferay DXPでビジネスクリティカルなソリューションを実行した10年以上の経験を持つLiferayプロフェッショナルの専任チームによって設計、構築、サポートされています。

Liferay Cloudは、完全なDevOps CI/CD戦略、ツール、ワークフローを提供することで、アプリケーションの開発とデプロイメントを加速します。

Liferay Cloudのプロジェクトには必ず付属しています。

* [組み込みCI/CDによる開発の加速](#accelerated-development-with-built-in-cicd)
* [アプリケーション開発ツール](#application-development-tools)
* [洞察に満ちたモニタリング](#insightful-monitoring)

## 標準に準拠したセキュリティ、自動バックアップ、柔軟なガバナンス

Liferay Cloudは、セキュリティに配慮して設計されています。 Liferay Cloudは、 **ISO 27001** および **AICPA SOC2** の認証を取得しており、ミッションクリティカルなサイトを安心して構築・展開することができます。

すべての顧客データは、デフォルトで保存時に暗号化されています。 保存時の暗号化により、ディスクに保存された機密データが、有効なキーなしでユーザーやアプリケーションから読み取られることがなくなります。 詳細は、 [セキュリティポリシー](https://www.liferay.com/documents/10182/3292406/Liferay+DXP+Cloud+Data+Security+and+Protection.pdf/78ce7065-9787-1fb2-9c7b-6d7c13f4a3e6?t=1564674972483) を参照してください。

[自動バックアップ](./platform-services/backup-service/backup-service-overview.md) データの破損や障害が発生した場合に、データとドキュメントが保護され、復元の準備ができていることを確認します。

![Liferay Cloudのバックアップサービスは、お客様のデータを保存・保護するものです。](./getting-started/images/01.png)

すぐに使える [ロールとチーム管理](./manage-and-optimize/environment-teams-and-roles.md) により、管理者はチームに人を追加または削除し、プロジェクト環境ごとに権限を管理することにより、最大の生産性とセキュリティを提供できます。

![プロジェクトのチームメンバーを、権限も含めて管理します。](./getting-started/images/02.png)

## 高可用性、スケーラビリティ、およびパフォーマンス

[クラスタリング](./customizing-liferay-dxp-in-the-cloud/setting-up-clustering-in-liferay-cloud.md) と [ロードバランシング](./configuring-the-cloud-network/load-balancer.md) 、可用性の高い、ダウンタイムのないデプロイを提供し、ミッションクリティカルなサイトがオンラインのままであることを保証します。 Liferay Cloudは、高可用性を確保するため、マルチリージョンアーキテクチャでデータを配信します。

[オートスケーリング](./manage-and-optimize/auto-scaling.md) は、予期しないトラフィックスパイクによって安定したパフォーマンスを維持するために、帯域幅とコンピューティング容量が動的に追加されることを保証します。 同様に、アクティビティが少ない期間に、不要なリソースを縮小できます。 チームはインスタンスの使用状況に関する自動通知と電子メールアラートを受信するので、自信を持ってリソースを管理できます。

![需要に応じてサーバーをオートスケールすることができます。](./getting-started/images/03.png)

## リアルタイムアラート

管理者は、リソース使用率の更新をリアルタイムで受信するように、ユーザーごとに [アラート](./manage-and-optimize/real-time-alerts.md) を設定できます。

![管理者は、リアルタイムのアラートを設定することができます。](./getting-started/images/04.png)

## 組み込みCI/CDによる開発の加速

すぐに使用できる完全に実現されたCI/CD戦略を使用して、アプリケーションをより迅速に提供します。 [GithubとJenkins](./platform-services/continuous-integration.md) 統合により、それぞれの新しいコミットまたはプル要求ごとに、 [本番環境または非本番環境](./getting-started/understanding-liferay-cloud-environments.md)にデプロイできるビルドをトリガーできます。

これらの堅牢なシステムにより、フォールトトレラントプロセスの作成が可能になり、組織固有のニーズを満たし、一般的なサーバーの問題が発生したときにそれを検出して修復します。 これにより、小さなプログラミングエラーが蓄積してサーバーがクラッシュするのを防ぐことができます。

![ビルドの表示、管理、デプロイを一元的に行えます。](./getting-started/images/05.png)

## アプリケーション開発ツール

リアルタイムのビルドと [デプロイメントログ](./support-and-troubleshooting/reading-liferay-cloud-service-logs.md)を使用して、アプリケーションのデプロイメントとパフォーマンスを追跡します。 チームは、Webコンソールまたは端子を介して[シェルへのアクセス](./support-and-troubleshooting/shell-access.md) および/またはログをダウンロードすることで、スタックトレースとトラブルシューティングのバグを分析することができます。

![ビルドやデプロイのログをリアルタイムに取得することで、アプリケーションの問題解決に役立ちます。](./getting-started/images/06.png)

## 洞察に満ちたモニタリング

Liferay Cloud は、 [アプリケーションメトリクス](./manage-and-optimize/application-metrics.md) を提供するため、IT チームはサイトの健全性とコンピューティング要件を長期的に把握することができます。 管理者は、すぐに使用できる [Dynatrace統合](./manage-and-optimize/application-metrics.md#advanced-application-metrics-production-only) を使用して、CPUとメモリの使用状況、データ転送速度などをすばやく理解することもできます。

![Liferay DXPインスタンスを含むLiferay Cloudサービスを監視するために、様々なメトリクスを使用します。](./getting-started/images/07.png)

## 関連トピック

* [開発要件](./getting-started/development-requirements.md)
* [Githubリポジトリの構成](./getting-started/configuring-your-github-repository.md)
* [Liferay Cloud 導入ワークフローの概要](./updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)
* [Liferay Cloud Consoleを使った変更のデプロイメント](./updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console.md)
