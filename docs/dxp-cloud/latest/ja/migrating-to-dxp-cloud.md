---
toc:
- ./migrating-to-dxp-cloud/matching-dxp-versions.md
- ./migrating-to-dxp-cloud/creating-data-backup-files.md
- ./migrating-to-dxp-cloud/uploading-and-restoring-the-data-backup.md
- ./migrating-to-dxp-cloud/migrating-dxp-configurations-and-customizations.md
- ./migrating-to-dxp-cloud/migrating-web-server-configurations.md
- ./migrating-to-dxp-cloud/migrating-search-configurations.md
- ./migrating-to-dxp-cloud/connecting-the-vpn.md
- ./migrating-to-dxp-cloud/next-steps-after-migration.md
---
# DXPクラウドへの移行

```{toctree}
:maxdepth: 1

migrating-to-dxp-cloud/matching-dxp-versions.md
migrating-to-dxp-cloud/creating-data-backup-files.md
migrating-to-dxp-cloud/uploading-and-restoring-the-data-backup.md
migrating-to-dxp-cloud/migrating-dxp-configurations-and-customizations.md
migrating-to-dxp-cloud/migrating-web-server-configurations.md
migrating-to-dxp-cloud/migrating-search-configurations.md
migrating-to-dxp-cloud/connecting-the-vpn.md
migrating-to-dxp-cloud/next-steps-after-migration.md
```

Liferay Cloudは、高い可用性、スケーラビリティ、およびパフォーマンスのために構築された、安全で信頼性の高いエンタープライズプラットフォームです。 Liferay Cloud上でLiferay DXPインスタンスを実行すると、 [機能が提供されます。](./getting-started.md) 、ユーザーに安全で信頼性の高い、スムーズなエクスペリエンスを確保します。

オンプレミスのLiferay DXP環境からLiferay Cloudに移行するには、データ（ドキュメントやデータベース）、設定、カスタマイズ（OSGiモジュールやプラグインなど）を含め、インスタンス全体をLiferay Cloud上で動作する環境に移行する必要があります。 また、Liferay Cloud環境と統合されたGitリポジトリでの作業や変更点のデプロイも含まれます。

Liferay Cloudへの移行の主な段階を紹介します。

- [ステージ1：DXPバージョンのマッチング](./migrating-to-dxp-cloud/matching-dxp-versions.md)
- [ステージ2：データバックアップファイルの作成](./migrating-to-dxp-cloud/creating-data-backup-files.md)
- [ステージ3：データバックアップのアップロードとリストア](./migrating-to-dxp-cloud/uploading-and-restoring-the-data-backup.md)
- [ステージ4：DXPの設定とカスタマイズの移行](./migrating-to-dxp-cloud/migrating-dxp-configurations-and-customizations.md)
- [第5ステージウェブサーバー設定の移行](./migrating-to-dxp-cloud/migrating-web-server-configurations.md)
- [ステージ6:検索設定の移行](./migrating-to-dxp-cloud/migrating-search-configurations.md)
- [ステージ 7:VPNを接続する](./migrating-to-dxp-cloud/connecting-the-vpn.md)
- [第8ステージ移行後の次のステップ](./migrating-to-dxp-cloud/next-steps-after-migration.md)

## なぜLiferay Cloudに移行する必要があるのでしょうか？

Liferay Cloud に移行することで、 [高可用性と拡張性](./getting-started.md#high-availability-scalability-and-performance) [クラスタリング](./using-the-liferay-dxp-service/setting-up-clustering-in-dxp-cloud.md), [ロードバランシング](infrastructure-and-operations/networking/load-balancer.md), [オートスケーリング](./manage-and-optimize/auto-scaling.md) といったすぐに導入できる機能を活用することができるようになります。 内蔵の [Git および Jenkins](./getting-started.md#accelerated-development-with-built-in-ci-cd) との統合も、開発プロセスを合理化します。 これにより、本番用インスタンスのデプロイと開発が容易になり、ニーズに合わせてより柔軟に、そしてユーザーにとってより信頼性の高いものになります。

## 事前に準備するものは？

プロジェクトのリポジトリや必要なツールを前もって計画し、セットアップするなど、移行に向けたいくつかの対策を講じることができます。

### プラン・アヘッド

移行準備のために行う最初の重要な作業は、前もって計画を立て、そのための時間を確保することです。 データベース管理者と協力して、移行のステップが完了したら移行を行う時間、および [第 2 段階の移行](./migrating-to-dxp-cloud/creating-data-backup-files.md#freeze-the-data) （データベースとドキュメントライブラリのバックアップファイルの作成）のためにデータを凍結するウィンドウを手配してください。

事前に移行のステップを確認し、何が起こるか、移行にどれくらいの時間がかかるかを把握しておくこと。

### ツールのインストールと学習

また、移行ステップに必要なツールをローカルシステム上に用意しておく必要があります。

* [Git](https://git-scm.com/) : 移行期間中、Liferay Cloudに変更をコミットしプッシュするためにGitを使用できるよう、Gitをインストールする必要があります。
* リポジトリホスティングサービスアカウント。Liferay Cloudビルドのために変更をプッシュして送信するには、これらのウェブサイトのいずれかにアカウントを持つ必要があります。 [GitHub](https://github.com/) , [Bitbucket](https://bitbucket.org/) , または [GitLab](https://about.gitlab.com/) のアカウントを使用することができます。
* [Liferay Patching Tool](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/maintaining-a-liferay-installation/reference/installing-the-patching-tool.html) : 移行の第一段階として、パッチやホットフィックス情報を確認するためにPatching Toolが必要です。
* ファイル圧縮ソフト：ローカルシステムのOSとしてWindowsを使用している場合、圧縮ファイルをパック/アンパックするためのファイル圧縮ソフト（例えば、 [7-Zip](https://www.7-zip.org/) ）も必要です。

これらのツールをインストールした後は、時間をかけて慣れていくのがよいでしょう。

例えば、もしあなたがGitの初心者なら、 [公式Git資料](https://git-scm.com/doc) (リファレンスドキュメント、コマンドチートシートなどを含む)を見たり、移行に適用する前に独自に使い方を練習したりするとよいでしょう。 Gitは、この移行ガイドで使用されているもの以上の機能を持つ、強力なバージョン管理ツールです。

Liferay Cloudへの移行には、独自のカスタムコード、モジュール、テーマをプロジェクト専用のLiferay Workspaceに移動することも必要です。 もしLiferay Workspaceを初めて使うのであれば、効果的な使い方を学ぶこともできます [こちら](https://learn.liferay.com/dxp/latest/ja/building-applications/tooling/liferay-workspace/what-is-liferay-workspace.html) .

### 環境を整える

移行作業をスムーズに開始するために、事前に移行用の環境を準備します。

まだの場合は、 [初期設定の概要](./getting-started/initial-setup-overview.md) にあるタスクを完了し、Liferay Cloud 環境が期待通りに稼働していることを確認します。 移行中に問題が発生した場合、 [サポートアクセスを有効にする](./troubleshooting/support-access.md); サポートアクセスを有効にすると、Liferay Cloud サポートスタッフがプロジェクトのコンソールやログなどにアクセスできるようになり、必要に応じてより多くの支援ができるようになります。

リポジトリの設定（ [GitHub](./getting-started/configuring-your-github-repository.md), [Bitbucket](./getting-started/configuring-your-bitbucket-repository.md), または [GitLab](./getting-started/configuring-your-gitlab-repository.md)を使用）をして、デプロイができることを確認する。 移行では、プロセスを通じて複数の変更を展開する必要があるため、移行を進めるためには展開が可能であることが必要です。

## 移行はどのように行うのですか？

ローカルの Liferay DXP インスタンスにアクセスできることを確認し、 [リポジトリ](#prepare-the-environment) を移行に使用します。 そして、準備ができたら、 [ステージ1：DXPバージョンのマッチング](./migrating-to-dxp-cloud/matching-dxp-versions.md) から始めてください。
