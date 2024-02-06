# Liferayクラウドスタックのアップグレード

リポジトリをアップグレードしてLiferay Cloudバージョン4の新しい構造を使用することで、リポジトリ内でLiferay Workspaceを活用し、サービスを最新の状態に保ち、様々な新機能や更新機能を使用することができます。

新しいリポジトリ構造へのアップグレードには、 [アップグレードスクリプト](https://github.com/LiferayCloud/stack-upgrade/archive/release.zip) の使用が含まれます。

## アップグレードの準備

Liferay Cloud スタックのバージョン 4.x.x にアップグレードするためには、現在のサービスが 3.x.x であることが必要です。 現在のバージョンを確認するには、リポジトリでgradle.propertiesファイルを見つけます。 バージョン4.x.xにアップグレードする前のリポジトリは、このような構造になっています：

```
repository
├── gradle
├── lcp
├── liferay
├── modules
├── themes
├── build.gradle
├── gradle.properties
├── gradlew
├── gradlew.bat
├── Jenkinsfile
├── README.md
├── README-dxpcloud.md
└── settings.gradle
```

```{important}
もし、リポジトリがこの構造に従っていない場合（そして、ルートに `gradle.properties` ファイルや `lcp` フォルダが存在しない場合）、これはバージョン 4.x.x へのアップグレードが既に完了していることを示しています。
```

`gradle.properties` ファイルを開き、Dockerイメージに指定されたバージョンを確認します。 たとえば、これはLiferayサービスのイメージバージョンです：

```properties
liferay.workspace.lcp.liferay.image=liferaycloud/liferay-dxp:7.2.10-sp1-fp4-3.0.19
```

Dockerイメージ名の末尾にある数字は、使用しているLiferay Cloudスタックのバージョンを示しています。 イメージ名が `3.xx` （この例では、liferay-dxp：7.2.10-sp1-fp4- **3.0.19**）で終わっていることを確認します。

次に、Gitリポジトリがクリーンなブランチ上にあることを確認します。 アップグレードスクリプトは、以前にコミットされていないファイルをコミットし、 `upgrade-workspace`と呼ばれる新しいブランチをチェックアウトします。

```{important}
すでに `upgrade-workspace` ブランチがある場合は、スクリプトはそのブランチの作成をスキップし、現在のブランチで作業します。
```

## アップグレードスクリプトの実行

アップグレードするには、次の手順を実行します：

1. [アップグレードスクリプト](https://github.com/LiferayCloud/stack-upgrade/archive/release.zip) をダウンロードし、ローカルの Liferay Cloud リポジトリのルートに解凍してください。

    ```bash
    curl -L https://github.com/LiferayCloud/stack-upgrade/archive/release.zip -O
    ```

    ```bash
    unzip -j release.zip stack-upgrade-release/upgrade-workspace.sh -d path/to/project/folder
    ```

1. アップグレードスクリプトを実行します：

    ```bash
    cd /path/to/project/folder
    ```

    ```bash
    ./upgrade-workspace.sh
    ```

1. スクリプトの開始出力を読み、プロンプトでプロジェクトのIDを入力します：

    ```
    Press enter to continue:
    Please enter your project id: lfrlearn
    ```

1. プロンプトで、Liferay Cloud Consoleに認証します。

1. サービスに使用するLiferayバージョンに対応する番号を入力します：

    ```
    1) 7.0
    2) 7.1
    3) 7.2
    Please select the Liferay DXP version, which will determine the Liferay CLOUD image set in liferay/LCP.json and the Liferay image set in liferay/gradle.properties: 3
    ```

1. プロンプトで、プロジェクトファイルに使用する環境のコンマ区切りのリストを入力します（ `common`は含まれません）。

    ```
    Please enter a comma-delimited list of environments: dev,uat,prd
    ```

    ```{important}
    プロジェクトリポジトリにファイルを追加するLiferay環境の名前だけを入力してください。 インフラストラクチャ(`infra`)環境を追加しないでください。
    ```

1. すべてのLiferay環境にElasticsearchプラグインをインストールする場合は、プロンプトでそれらの名前のコンマ区切りのリストを入力します。 それ以外の場合は、Enterキーを押します。

    ```
    Please enter a comma-delimited list of elasticsearch plugins:
    ```

    このスクリプトは、リポジトリに新しいブランチを作成してチェックアウトし、アップグレードスクリプトを `.gitignore` ファイルに追加します。

1. サービスレベルのフォルダーがルートレベルにある状態で、リポジトリの新しい組織をチェックして、スクリプトが正常に実行されたことを確認します。

    ```
    repository
    ├── backup
    ├── build
    ├── ci
    ├── database
    ├── liferay
    ├── search
    ├── webserver
    └── upgrade-workspace.sh
    ```

リポジトリが再編成され、 `liferay` フォルダーがLiferayワークスペースになり、サービスが4.xxにアップグレードされます。

## CIサービスの環境変数を確認する

サービススタックのアップグレードを完了すると、プロジェクトの `ci/LCP.json` ファイル内の環境変数が異なる動作をするようになります。 アップグレードしたプロジェクトを続行する前に、 `ci` サービスの環境変数が正しい設定を反映していることを確認してください。

### リポジトリ統合変数の確認

プロジェクトとバージョン管理との統合（この例では、GitHubを使用）に対して次のプロパティが正しく設定されていることを確認します：

```json
{
    "LCP_CI_SCM_PROVIDER": "github",
    "LCP_CI_SCM_REPOSITORY_OWNER": "OWNER_NAME",
    "LCP_CI_SCM_REPOSITORY_NAME": "PROJECT_NAME",
    "LCP_CI_SCM_TOKEN": "AUTH_TOKEN"
}
```

詳しくは [GitHub](../getting-started/configuring-your-github-repository.md#setting-environment-variables) 、 [Bitbucket](../getting-started/configuring-your-bitbucket-repository.md#connecting-bitbucket-to-your-jenkins-service) 、 [GitLab](../getting-started/configuring-your-gitlab-repository.md#connecting-gitlab-to-your-jenkins-service) の統合を参照してください。

### Jenkinsfile設定変数の確認

プロジェクトにデフォルトのJenkinsfileが [必要とされていない](./liferay-cloud-project-changes-in-version-4.md#ci-service-changes) ので、プロジェクトのルートのJenkinsfileもアップグレードした後に除去することができます。 プロジェクトにデフォルトのJenkinsfileを使用する場合は、 `ci` サービス環境変数がこれを反映していることを確認してください：

```json
{
    "LCP_CI_USE_DEFAULT_JENKINSFILE": "true",
    "LCP_CI_SCM_JENKINSFILE_HOOKS_DIR": "ci/",
}
```

```{note}
デフォルトのJenkinsfileを拡張するフックを使用したい場合は、 `LCP_CI_SCM_JENKINSFILE_HOOKS_DIR` 変数を定義する必要があります。
```

`ci` サービスディレクトリ内に独自のJenkinsfileを定義してデフォルトを上書きする場合は、環境変数が次のようになっていることを確認してください。

```json
{
    "LCP_CI_USE_DEFAULT_JENKINSFILE": "false",
    "LCP_CI_SCM_JENKINSFILE_PATH": "ci/Jenkinsfile"
}
```

## 次のステップ

ローカルリポジトリが変更されたら、 `ci` サービスを `infra` 環境にデプロイします。 他のより先に`インフラ`環境にデプロイすることによって、`ci`サービスへの変更事項が最初にデプロイされることが保証されます。これにより、他の変更事項が正しくデプロイされます。

`ci` サービスのみをデプロイするには、 [CLIツールを使用](../updating-services-in-liferay-paas/deploying-changes-via-the-cli-tool.md)するのが最も早い方法です。 プロジェクトリポジトリの `ci/` フォルダに移動し、 `lcp deploy` コマンドを実行します：

```bash
    lcp deploy --project=<project-name> --environment=infra
```

あるいは、 [開発ワークフロー](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) に従って、Liferay Cloud コンソールからビルドとして変更をデプロイすることもできます。

</a> その後、新しいサービスバージョン

を開発環境にデプロイしたり、Liferay Cloud サービスの新バージョンの新機能の一部を試したりすることができます。 詳細は、[変更点の説明 ](./liferay-cloud-project-changes-in-version-4.md)ご覧ください。</p> 



## 関連トピック

* [サービススタックのバージョンについて](./understanding-service-stack-versions.md)
