# Liferay Cloud 導入ワークフローの概要

Liferay Cloudは、高効率なCI/CD戦略を実現するための堅牢なフレームワークを提供します。 GitとJenkinsの統合により、CIビルドを自動的にトリガーして、プロジェクト環境にデプロイすることができます。 また、CIサービスのビルドプロセスを完全に省略し、 [Command Line Interface](../reference/command-line-tool.md) (CLI)ツールを使用して、プロジェクト環境にローカルの変更を直接デプロイすることもできます。

デプロイメントには複数のパスがありますが、ワークフローは一般的に以下の3つのステージに沿って行われます：

* [開発・構成](#develop-and-configure)
* [ビルド＆テスト](#build-and-test)
* [デプロイする](#deploy)

## 開発・構成

すべてのワークフローは、プロジェクトのGitリポジトリ（つまり、[GitHub](../getting-started/configuring-your-github-repository.md)、[Bitbucket](../getting-started/configuring-your-bitbucket-repository.md)、または[GitLab](../getting-started/configuring-your-gitlab-repository.md)）に変更を加えることから始まります。 このリポジトリは、Liferayサービスインスタンス自体を含め、プロジェクトにカスタムで追加する際の基礎となるものです。 このGitリポジトリは、プロジェクトサービスの構成とカスタマイズのための共有バージョンコントロール、プロジェクトのデプロイのための単一の真実のソース、およびLiferayモジュール、テーマ、および拡張機能を構築するための共有ワークスペースとなります。

サービスの [LCP.json file](../reference/configuration-via-lcp-json.md)を構成、 または`configs/` フォルダを介してサービスへの環境固有およびプロジェクト全体の変更を行います。 各サービスの構成オプションの詳細については、それぞれのドキュメンテーションを参照してください：

* [Liferayサービス](../customizing-liferay-dxp-in-the-cloud/configuring-the-liferay-dxp-service.md)
* [バックアップサービス](../platform-services/backup-service/backup-service-overview.md)
* [継続的インテグレーションサービス（Jenkins）](../platform-services/continuous-integration.md)
* [データベースサービス(MySQL)](../platform-services/database-service/database-service.md)
* [検索サービス（Elasticsearch）](../platform-services/search-service.md)
* [ウェブサーバーサービス（Nginx）](../platform-services/web-server-service.md)

## ビルド＆テスト

プロジェクトのGitリポジトリの構成にもよりますが、プロジェクトの中央リポジトリにコミットをマージしたり、変更内容を記載した新しいプルリクエストを公開したりすることで、自動CIビルドをトリガーすることができます。 このプロセスは自動的に行われますが、`infra`環境のCIサービスを変更して、テストを含む追加のパイプラインステップを含めることができます。 詳しくは [継続的インテグレーション](../platform-services/continuous-integration.md) を参照してください。

すべてのプロジェクト環境でのビルドの全履歴にアクセスするには、Liferay Cloud コンソールの **Builds** ページに移動してください。 ここでは、CIサービスまたはCLIツールのいずれかによって開始されたすべてのビルドを、その一般的な情報やステータス（保留、通過、失敗など）とともに表示することができます。

![ビルドページからプロジェクトのビルドにアクセスできます。](./overview-of-the-liferay-cloud-deployment-workflow/images/01.png)

## デプロイ

Liferay Cloudでは、CLIツールによるデプロイ（手動）、Liferay Cloud Management Consoleによるデプロイ（手動）、特定のCIビルドを設定して自動的にデプロイする、という3つの方法でサービスを展開することができます。

### オプション1：コマンドラインインターフェースを介したデプロイ

CLIツールを使用するのが、ローカル変更をサービスにデプロイする最も早い方法です。 これを使えば、ターミナルからデプロイすることができ、変更内容をリモートリポジトリにプッシュしたり、Jenkinsのビルドをトリガーしたりする必要がありません。 他のデプロイ方法とは異なり、CLIツールでは一度に1つのサービスのローカル変更をデプロイすることもできます。

これを行うには、ターミナルのCLIツールにログインし、デプロイしたいサービスのフォルダーに移動します（フォルダーにはサービスの`LCP.json`ファイルが含まれている必要があります）。 次に、`lcp deploy`を実行してデプロイを開始し、デプロイするプロジェクトと環境を選択します（例： `dev`、`uat`、`prd`）。 **本番環境にデプロイする前に、必ず `dev` または `uat` 環境にデプロイして、変更点を確認してください。**

デプロイを成功させるには、選択した環境にデプロイする権限が必要です。 このデプロイのワークフローについては、 [Deploying Changes via CLI Tool](./deploying-changes-via-the-cli-tool.md)を参照してください。

```{important}
バックアップ、CI、データベース、検索機能、Webサーバの各サービスを直接デプロイすることはできますが、 `lcp deploy` コマンドを実行する前に、まずLiferayサービスのgradleビルドを作成する必要があります。 詳細については、 [Deploying to the Liferay Service](../customizing-liferay-dxp-in-the-cloud/deploying-to-the-liferay-service.md#cli-tool-deployment) を参照してください。
```

CLIツールでデプロイする場合、すべてのサービスを一度にデプロイする（プロジェクトのルートディレクトリからコマンドを実行する）か、単一のサービスのみをデプロイする（サービスの `LCP.json`ファイルを含むディレクトリからコマンドを実行する）ことができます。 `liferay` サービスではデプロイするために [追加のステップ](../customizing-liferay-dxp-in-the-cloud/deploying-to-the-liferay-service.md#cli-tool-deployment) を必要とするため、プロジェクトワークスペースからファイルをビルドおよび準備できます。

### オプション2：Liferay Cloud Consoleからのデプロイメント

Liferay Cloudコンソールは、プロジェクトに変更をデプロイするための主要な方法です。 これを使用すると、成功したビルドを表示して選択し、選択した環境にデプロイできます。 これらはCIサービスとCLIツールの両方で生成されたビルドを含み、Liferay Cloudコンソールの **Builds** ページからアクセスすることができます。 **本番環境にデプロイする前に、必ず `dev` または `uat` の環境を選択し、変更点を検証してください。**

[Deploying Changes via Liferay Cloud Console](./deploying-changes-via-the-liferay-cloud-console.md) を参照し、デプロイメントのワークフローを説明します。

![Liferay Cloudのコンソールからビルドをデプロイします。](./overview-of-the-liferay-cloud-deployment-workflow/images/02.png)

### オプション3：自動的にビルドを `dev`環境にデプロイ

必要に応じて、CIサービスを設定して、プロジェクトの `dev`環境にビルドを自動的にデプロイすることもできます。 CIサービスに環境変数を追加することで、指定したブランチで作成されたビルドの自動デプロイを開始します。 詳細については、[Setting Up Automatic Deployment](./automatically-deploying-ci-service-builds.md)を参照してください。

## 関連トピック

* [配布タイプについて](./understanding-deployment-types.md)
* [デプロイメント戦略について](./understanding-deployment-strategies.md)
* [Liferay Cloud Consoleを使った変更のデプロイメント](./deploying-changes-via-the-liferay-cloud-console.md)
* [CLIツールによる変更点のデプロイ](./deploying-changes-via-the-cli-tool.md)
