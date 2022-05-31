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

Liferay DXP Cloudは、高い可用性、スケーラビリティ、およびパフォーマンスのために構築された、安全で信頼性の高いエンタープライズプラットフォームです。 DXP Cloud上でLiferay DXPインスタンスを実行すると、 [機能](./getting-started.md) が提供され、ユーザーに安全、信頼、かつスムーズな体験を保証します。

オンプレミスのLiferay DXP環境からDXP Cloudに移行するには、データ（ドキュメントやデータベース）、設定、カスタマイズ（OSGiモジュールやプラグインなど）を含むインスタンス全体をDXP Cloud上で動作する環境に移行する必要があります。 また、DXP Cloud環境と統合されたGitリポジトリでの作業や変更点のデプロイも含まれます。

DXP Cloudへの移行の主な段階を紹介します。

- [ステージ1：DXPバージョンのマッチング](./migrating-to-dxp-cloud/matching-dxp-versions.md)
- [ステージ2：データバックアップファイルの作成](./migrating-to-dxp-cloud/creating-data-backup-files.md)
- [ステージ3：データバックアップのアップロードとリストア](./migrating-to-dxp-cloud/uploading-and-restoring-the-data-backup.md)
- [ステージ4：DXPの設定とカスタマイズの移行](./migrating-to-dxp-cloud/migrating-dxp-configurations-and-customizations.md)
- [第5ステージウェブサーバー設定の移行](./migrating-to-dxp-cloud/migrating-web-server-configurations.md)
- [第6ステージ検索設定の移行](./migrating-to-dxp-cloud/migrating-search-configurations.md)
- [ステージ 7:VPNを接続する](./migrating-to-dxp-cloud/connecting-the-vpn.md)
- [第8ステージ移行後の次のステップ](./migrating-to-dxp-cloud/next-steps-after-migration.md)

## なぜDXP Cloudに移行する必要があるのか？

DXP Cloudへの移行により、 [高可用性とスケーラビリティ](./getting-started.md#high-availability-scalability-and-performance) を活用し、 [クラスタリング](./using-the-liferay-dxp-service/setting-up-clustering-in-dxp-cloud.md)、 [ロードバランス](infrastructure-and-operations/networking/load-balancer.md)そして [オートスケーリング](./manage-and-optimize/auto-scaling.md) といったすぐに導入できる機能ですぐに活用できるようになるのです。 また、内蔵の [GitやJenkinsとの統合](./getting-started.md#accelerated-development-with-built-in-ci-cd) により、開発プロセスを効率化することができます。 これにより、本番用インスタンスのデプロイと開発が容易になり、ニーズに合わせてより柔軟に、そしてユーザーにとってより信頼性の高いものになります。

## 事前に準備するものは？

プロジェクトのリポジトリや必要なツールを前もって計画し、セットアップするなど、移行に向けたいくつかの対策を講じることができます。

### プラン・アヘッド

移行準備のために行う最初の重要な作業は、前もって計画を立て、そのための時間を確保することです。 データベース管理者と協力して、移行ステップが完了したら移行を行う時間を調整し、 [移行の第2段階](./migrating-to-dxp-cloud/creating-data-backup-files.md#freeze-the-data) （データベースとドキュメント ライブラリのバックアップ ファイルの作成）のためにデータを凍結するウィンドウも準備します。

事前に移行のステップを確認し、何が起こるか、移行にどれくらいの時間がかかるかを把握しておくこと。

### ツールのインストールと学習

また、移行ステップに必要なツールをローカルシステムに用意しておくことも必要です。

* [Git](https://git-scm.com/): Git をインストールして、移行中に変更をコミットして DXP Cloud にプッシュできるようにする必要があります。
* リポジトリホスティングサービスのアカウントです。DXP Cloudビルドのために変更をプッシュして送信するには、これらのウェブサイトのいずれかにアカウントを持つ必要があります。 [GitHub](https://github.com/), [Bitbucket](https://bitbucket.org/), または [GitLab](https://about.gitlab.com/)でアカウントを使用することが可能です。
* [Liferay Patching Tool](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/maintaining-a-liferay-installation/reference/installing-the-patching-tool.html)：移行の第一段階として、パッチとホットフィックスの情報を確認するためにPatching Toolが必要です。
* ファイル圧縮ソフト：ローカルシステムのOSにWindowsを使用している場合、圧縮ファイルをパック/アンパックするためのファイル圧縮ソフト（ [7-Zip](https://www.7-zip.org/)等）も必要です。

これらのツールをインストールした後は、時間をかけて慣れていくのがよいでしょう。

例えば、あなたがGitの初心者なら、 [Gitの公式資料](https://git-scm.com/doc) （参考文書やコマンドのチートシートなどを含む）を見たり、移行に適用する前に独自に使う練習をしたりするとよいでしょう。 Gitは、この移行ガイドで使用されているもの以上の機能を持つ、強力なバージョン管理ツールです。

DXP Cloudへの移行には、独自のカスタムコード、モジュール、テーマをプロジェクト専用のLiferay Workspaceに移動することも必要です。 もし、Liferay Workspaceを初めて使うのであれば、効果的な使い方を学ぶこともできます [ここで](https://learn.liferay.com/dxp/latest/en/building-applications/tooling/liferay-workspace/what-is-liferay-workspace.html).

### 環境を整える

移行作業をスムーズに開始するために、事前に移行用の環境を準備します。

まだの方は、 [初期セットアップの概要](./getting-started/initial-setup-overview.md) にあるタスクを完了し、DXP Cloud環境が期待通りに稼働していることを確認してください。 移行中に問題が発生した場合、 [Support Access](./troubleshooting/support-access.md)を有効にします。Support Accessを有効にすると、Liferay DXP Cloudサポートスタッフがプロジェクトのコンソールやログなどにアクセスでき、必要に応じて支援できる能力が高まります。

リポジトリの設定（ [GitHub](./getting-started/configuring-your-github-repository.md), [Bitbucket](./getting-started/configuring-your-bitbucket-repository.md), [GitLab](./getting-started/configuring-your-gitlab-repository.md)を使って）、デプロイができることを確認します。 移行では、プロセスを通じて複数の変更を展開する必要があるため、移行を進めるためには展開が可能であることが必要です。

## 移行はどのように行うのですか？

移行のために、ローカルの Liferay DXP インスタンスと [あなたのリポジトリ](#prepare-the-environment) にアクセスできることを確認してください。 そして、準備ができたら、 [Stage 1: Matching DXP Versions](./migrating-to-dxp-cloud/matching-dxp-versions.md)から始めてください。
