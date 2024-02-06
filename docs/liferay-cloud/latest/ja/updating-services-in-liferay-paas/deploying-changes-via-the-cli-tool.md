# CLIツールによる変更点のデプロイ

CLIツールを使用すると、Jenkinsのビルドをトリガーしたり、Liferay Cloud Consoleを使用することなく、ローカルプロジェクトの変更を直接デプロイすることができます。 このチュートリアルでは、Liferayサービスにポータル・プロパティを追加し、CLIツールを使用して `dev` にデプロイするプロセスを説明します。

始めるには、まず [CLI ツール](../reference/command-line-tool.md) をインストールして使えるようにし、同様にプロジェクトのGitリポジトリのローカルコピー（例： [GitHub](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) , [Bitbucket](https://confluence.atlassian.com/bitbucketserver/clone-a-repository-790632786.html) , [GitLab](https://docs.gitlab.com/ee/university/training/topics/getting_started.html#instantiate-workflow-with-clone) ）も必要です。

```{note}
CLIツールは、プロジェクトへの変更を迅速にデプロイする方法を提供しますが、大部分のデプロイにはCIサービスとLiferay Cloudコンソールを使用することがベストプラクティスです。 方法については、 [Liferay Cloud Consoleを使った変更のデプロイ](./deploying-changes-via-the-liferay-cloud-console.md) を参照してください。
```

そうでなければ、このステップをスキップして、デプロイメントプロセスを開始することができます。

* [Liferayサービスへのポータル・プロパティの追加](#adding-a-portal-property-to-the-liferay-service)
* [CLIツールで新しいビルドをデプロイする](#deploying-your-new-build-via-the-cli-tool)
* [サンプルデプロイメントの検証](#verifying-your-sample-deployment)

## Liferayサービスへのポータル・プロパティの追加

デプロイメント ライフサイクルを開始するには、 `dev` 環境の Liferay サービスにポータル プロパティを追加し、変更をコミットします。

1. ローカルのマスターブランチが、プロジェクトのリポジトリの最新版であることを確認してください。

1. 最新の master ブランチをベースに、新しい作業用ブランチを作成します。

   ```bash
   git checkout -b example-cli-deployment-branch
   ```

1. ``<project>\liferay\configs\dev\`にアクセスし、``portal-env.properties` ファイルに以下のプロパティを追加してください。

   ```properties
   web.server.display.node=true
   ```

1. 以下のコマンドで変更内容を追加し、コミットします。

   ```bash
   git add .
   ```

   ```bash
   git commit -m "Test - Adding Portal Property"
   ```

## CLIツールで新しいビルドをデプロイする

変更をコミットしたら、以下の手順で Gradle を使って Liferay サービスのビルドを作成し、CLI ツールを使ってそれを `dev` 環境にデプロイします。

1. 端末を開き、Liferayのサービスフォルダに移動します。

   ```bash
   cd <project-folder>/liferay
   ```

1. `lcp login`を実行します。 まだログインしていない場合は、ブラウザで認証を行うよう促されます。

1. 以下のコマンドを順番に実行して、LiferayサービスのGradleビルドを作成します。

   ```bash
   ./gradlew clean deploy createDockerfile
   ```

   `lcp deploy` コマンドを実行する前に、まずLiferayサービスのGradleビルドを作成する必要があります。 その他のサービスについては、ローカルでのビルドプロセスが不要なため、バックアップ、CI、データベース、検索、Webサーバーなどのサービスを直接導入することができます。

1. ビルドをデプロイする前に、`LCP.json`ファイルをDockerディレクトリにコピーします。

   ```bash
   cp LCP.json build/docker
   ```

   ```bash
   cd build/docker
   ```

   サービスをデプロイする際に、サービスの`LCP.json`ファイルがあるディレクトリから`lcp deploy`コマンドを実行する必要があるため、`LCP.json`ファイルをDockerディレクトリにコピーする必要があります。

1. 以下のコマンドを実行して、ビルドを `dev` の環境にデプロイします。

   ```bash
   lcp deploy --project=<project-name> --environment=dev
   ```

   ![デプロイの進捗状況はターミナルで確認できます。](./deploying-changes-via-the-cli-tool/images/01.png)

   このプロセスでは、新しいビルドがプロジェクトに追加され、 `dev` 環境にデプロイされます。 このとき、Liferay サービスは新しいポータル・プロパティで再起動する必要があります。

## サンプルデプロイメントの検証

ビルドが正常にデプロイされ、 `dev` 環境のLiferayサービスが **Ready** になったら、以下の手順で変更内容を確認します。

1. プロジェクトの `dev` の環境に移動します。

1. **Web Server** サービスのページにアクセスし、その URL をクリックして `dev` 環境の Liferay インスタンスにアクセスします。 `https://webserver-<project-name>-dev.lfr.cloud/`.

   ![WebサーバーのURLをクリックすると、開発環境のLiferayインスタンスにアクセスできます。](./deploying-changes-via-the-cli-tool/images/02.png)

1. ホームページの下部にWebサーバーのノードが表示されていることを確認します。

   ![ホームページの下部にウェブサーバノードが表示されていることを確認します。](./deploying-changes-via-the-cli-tool/images/03.png)

## 関連トピック

* [コマンドラインツール](../reference/command-line-tool.md)
* [Liferay Cloud 開発ワークフローの概要](./overview-of-the-liferay-cloud-deployment-workflow.md)
* [Liferay Cloud Consoleを使った変更のデプロイメント](./deploying-changes-via-the-liferay-cloud-console.md)
