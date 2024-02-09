---
toc:
  - ./migrating-to-liferay-cloud/matching-dxp-versions.md
  - ./migrating-to-liferay-cloud/creating-data-backup-files.md
  - ./migrating-to-liferay-cloud/uploading-and-restoring-the-data-backup.md
  - >-
    - ./migrating-to-liferay-cloud/migrating-web-server-configurations.md
    - ./migrating-to-liferay-cloud/migrating-search-configurations.md
    - ./migrating-to-liferay-cloud/connecting-the-vpn.md
    - ./migrating-to-liferay-cloud/next-steps-after-migration.md
---
# Liferay Cloudへの移行

```{toctree}
:maxdepth: 1

migrating-to-liferay-cloud/matching-dxp-versions.md
migrating-to-liferay-cloud/creating-data-backup-files.md
migrating-to-liferay-cloud/uploading-and-restoring-the-data-backup.md
migrating-to-liferay-cloud/migrating-dxp-configurations-and-customizations.md
migrating-to-liferay-cloud/migrating-web-server-configurations.md
migrating-to-liferay-cloud/migrating-search-configurations.md
migrating-to-liferay-cloud/connecting-the-vpn.md
migrating-to-liferay-cloud/next-steps-after-migration.md
```

Liferay Cloudは、高可用性、スケーラビリティ、パフォーマンスのために構築された安全で信頼性の高いエンタープライズプラットフォームです。 Liferay Cloud上でLiferay DXPインスタンスを実行することで、 [機能が提供されます。](./getting-started.md) 、ユーザーにとって安全、信頼性が高く、スムーズなエクスペリエンスが保証されます。

オンプレミスのLiferay DXP環境からLiferay Cloudに移行するには、データ（ドキュメントやデータベース）、設定、カスタマイズ（OSGiモジュールやプラグインなど）を含め、インスタンス全体をLiferay Cloud上で動作する環境に移行する必要があります。 また、Liferay Cloud環境と統合されたGitリポジトリで作業し、変更をデプロイすることも含まれます。

Liferay Cloudへの移行の主な段階を紹介します：

- [ステージ1：DXPバージョンの一致](./migrating-to-liferay-cloud/matching-dxp-versions.md)
- [ステージ2：データバックアップファイルの作成](./migrating-to-liferay-cloud/creating-data-backup-files.md)
- [ステージ3：データバックアップのアップロードと復元](./migrating-to-liferay-cloud/uploading-and-restoring-the-data-backup.md)
- [ステージ4：DXP設定とカスタマイズの移行](./migrating-to-liferay-cloud/migrating-dxp-configurations-and-customizations.md)
- [ステージ 5：ウェブサーバー設定の移行](./migrating-to-liferay-cloud/migrating-web-server-configurations.md)
- [ステージ 6：検索設定の移行](./migrating-to-liferay-cloud/migrating-search-configurations.md)
- [第7段階VPNの接続](./migrating-to-liferay-cloud/connecting-the-vpn.md)
- [第8ステージ移行後の次のステップ](./migrating-to-liferay-cloud/next-steps-after-migration.md)

## なぜLiferay Cloudに移行する必要があるのでしょうか？

Liferay Cloud に移行することで、 [クラスタリング](./getting-started.md#high-availability-scalability-and-performance) のようなすぐに導入できる機能で、 [高可用性とスケーラビリティ](./getting-started.md#high-availability-scalability-and-performance) を利用することができます。 クラスタリング](./customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud.md)、[ロードバランシング](/configuring-the-cloud-network/load-balancer.md)、[オートスケーリング](./manage-and-optimize/auto-scaling.md)のようなすぐにデプロイできる機能がすぐに使えます。組み込みの [GitとJenkinsとの統合](./getting-started.md#accelerated-development-with-built-in-ci-cd) も開発プロセスを合理化します。これにより、本番インスタンスのデプロイと開発がより簡単になり、ニーズに対してより柔軟になり、ユーザーにとってより信頼性の高いものになります。

## 事前に準備するものは？

事前にプロジェクトリポジトリや必要なツールの計画やセットアップを行うなど、事前に移行準備のための対策をいくつか講じることができます。

### 計画を立てる

移行の準備として最初に行うべき重要な作業は、前もって計画を立て、そのための時間を確保することです。データベース管理者と協力して、移行の手順が完了したら移行を行う時間と、 [移行の第二段階](./migrating-to-liferay-cloud/creating-data-backup-files.md#freeze-the-data) (データベースとドキュメントライブラリのバックアップファイルを作成する)のためにデータを凍結するためのウィンドウを調整します。

事前に移行のステップを確認することで、期待されることや移行完了までにかかる時間を把握することができます。

### ツールのインストールと学習

また、移行ステップに必要なツールをローカルシステムに用意しておくことも必要です：

* [Git](https://git-scm.com/) : Gitがインストールされている必要があります。移行中、変更をコミットしてLiferay Cloudにプッシュするために使用します。
* リポジトリホスティングサービスのアカウント：Liferay Cloudのビルドのために変更をプッシュして送信するには、これらのウェブサイトのいずれかのアカウントが必要です。 [GitHub](https://github.com/) , [Bitbucket](https://bitbucket.org/) , または [GitLab](https://about.gitlab.com/) のアカウントを使用できます。
* [パッチングツールのインストール](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/maintaining-a-liferay-installation/reference/installing-the-patching-tool.html) : 移行の第一段階のパッチとHotfix情報を確認するためにPatching Toolが必要です。
* ファイル圧縮ソフトウェア：ローカルシステムのOSとしてWindowsを使用している場合、圧縮ファイルのパック/アンパックにはファイル圧縮ソフトウェア（ [7-Zip](https://www.7-zip.org/) など）も必要です。

これらのツールをインストールしたら、時間をかけて使いこなしたい。

たとえば、Gitを使うのが初めてなら、 [Gitの公式資料](https://git-scm.com/doc) （リファレンス・ドキュメントやコマンド・チートシートなどを含む）を見たり、移行に適用する前に独自に使い方を練習したりするとよいでしょう。 Gitは強力なバージョン管理ツールであり、このマイグレーション・ガイドで使われる以上の機能を備えている。

Liferay Cloudへの移行には、独自のカスタムコード、モジュール、テーマをプロジェクト専用のLiferay Workspaceに移動することも含まれます。 もしLiferay Workspaceを初めて使うのであれば、その効果的な使い方を [Liferay Workspaceの概要](https://learn.liferay.com/dxp/latest/ja/building-applications/tooling/liferay-workspace/what-is-liferay-workspace.html) から学ぶこともできます。

### 環境を整える

移行プロセスをスムーズに開始できるように、事前に移行用の環境を準備しましょう。

まだの場合は、 [初期設定の概要](./getting-started/initial-setup-overview.md) のタスクを完了し、Liferay Cloud 環境が期待通りに稼働していることを確認してください。 移行中に問題が発生した場合は、 [サポートアクセス](./support-and-troubleshooting/support-access.md) を有効にしてください。Support Accessを有効にすると、Liferay Cloudのサポートスタッフがプロジェクトのコンソールやログなどにアクセスできるようになり、必要に応じてサポートできるようになります。

リポジトリをセットアップし（ [GitHub](./getting-started/configuring-your-github-repository.md), [Bitbucket](./getting-started/configuring-your-bitbucket-repository.md), または [GitLab](./getting-started/configuring-your-gitlab-repository.md)を使用）、デプロイできることを確認します。 この移行では、プロセス全体を通じて複数の変更を展開する必要があるため、移行を進めるにはそれらを展開できなければならない。

## どのように移行を開始しますか？

ローカルのLiferay DXPインスタンスにアクセスできることを確認し、 [マイグレーション用のリポジトリ](#prepare-the-environment) 。 準備ができたら、 [ステージ1：DXPバージョンのマッチング](./migrating-to-liferay-cloud/matching-dxp-versions.md)から始めてください。
