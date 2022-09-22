# 継続的インテグレーション

Liferay Cloudは [Jenkins](https://jenkins.io/) を使用して、継続的なインテグレーションインフラストラクチャサービスを強化しています。 プルリクエストを送信するか、事前設定されたGitHubブランチの1つにコミットをプッシュすると、自動で設定可能なビルドがトリガーされます。

```{note}
DXPクラウドの顧客（ ［customer］ログインを使用）には、ビルドを管理および確認する権限がありますが、完全な管理者権限はありません。
```

デフォルトでは、この自動ビルドはコードをコンパイルし、テストを実行するように設定できます。 Liferay Cloudはサービスをビルドし、そのステータスを環境のビルドページに表示します。 テストが失敗した場合は、Jenkinsダッシュボードと `［https://ci-companyname-infra.lfr.cloud］`ログを確認できます。

```{note}
継続的インテグレーションは、CLIではなく、GitHub、GitLab、またはBitbucketからデプロイする場合にのみ機能します。
```

詳しくは、 [CI service limitations](../reference/platform-limitations.md#continuous-integration-service) を参照してください。

## デフォルトのJenkinsfileの使用

CIサービスのバージョン `［liferaycloud/jenkins:2.222.1-3.2.0］`からは、オーバーライドされていない場合、デフォルトのJenkinsfileが利用可能です。 デフォルトのJenkinsfileは、[［version 4.x.x servicesを使用］](../reference/understanding-service-stack-versions.md)しているプロジェクトで常に使うことができます。

デフォルトのJenkinsfileは、それまでJenkinsfileに保存されていたすべてのロジックをカプセル化し、Jenkinsプラグインに移動させます。 つまり、CI構成を必要とせずに、すべてのバグ修正、セキュリティ修正、および改善を適用できます。

それとは別に、CIパイプラインのすべてのステップをカスタマイズするための強力な拡張ポイントのセットを提供しています。

### デフォルトのJenkinsfileを有効にする

プロジェクトが既に [［version 4.x.x］](../reference/understanding-service-stack-versions.md)にアップデートされている場合、この手順は既に完了しています。 そうでない場合は、以下の手順でデフォルトのJenkinsfileを有効にしてください：

1. CIサービスを`［liferaycloud/jenkins:2.222.1-3.2.0］`.バージョンにアップデートします

1. ルートフォルダにある `［Jenkinsfile］` を削除します

1. 次の環境変数を追加します：`［LCP_CI_USE_DEFAULT_JENKINSFILE: true］`

1. Jenkinsサービスをデプロイします

### デフォルトのJenkinsfileの拡張

デフォルトのJenkinsfileを拡張するには、プロジェクトリポジトリの `ci` フォルダに以下のファイルを追加します：

- `Jenkinsfile-before-all（ジェンキンスファイル・ビフォア・オール`
- `Jenkinsファイル（ビフォア・クラウド・ビルド`
- `Jenkinsファイル（ビフォアクラウドデプロイ`
- `Jenkinsfile-アフターオール`
- `Jenkinsfile-post-always（ジェンキンスファイル・ポスト・アルウェイズ`

CIビルドプロセスのステップの基本的な概要は次のとおりです：

1. 存在する場合は、 `［ci/Jenkinsfile-before-all］`をロードします。

1. Liferayワークスペースをビルドします。

1. 存在する場合は、 `［ci/Jenkinsfile-before-cloud-build］`をロードします。

1. コンソールに表示されるLiferay Cloudビルドを作成します。

1. 存在する場合は、 `［ci/Jenkinsfile-before-cloud-deploy］`をロードします。

1. 必要に応じて、現在のブランチがデプロイブランチとして指定されているかどうかに応じて、ビルドをクラウド内の環境にデプロイします。 これは、 `［LCP_CI_DEPLOY_BRANCH］` 環境変数を介して設定されます。 `［LCP_CI_DEPLOY_TARGET］` 環境変数は、デプロイ先の環境を指定します。

1. 存在する場合は、 `［ci/Jenkinsfile-after-all］`をロードします。 これは、すべてのステップが完了すると実行されます。

1. 存在する場合は、 `［ci/Jenkinsfile-post-always］`をロードします。 これは、ビルドが失敗したときと成功したときの両方で実行されます。

```{note}
バージョン3.x.xのサービスを使用している場合、Jenkinsfileのこれらの拡張は、［lcp/ci/］フォルダーにあります。 バージョンの確認方法については， [サービススタックのバージョンについて](../reference/understanding-service-stack-versions.md) を参照してください。
```

Jenkinsサービスの起動ログを監視して、デフォルトのパイプラインでこれらがどのように使用されるかを確認することができます。 完全なデフォルトのJenkinsfileが起動ログに出力されます。

## 追加のパイプラインのカスタマイズと外部通話

パイプラインの追加の手順を使用して、外部サービスを呼び出すことができます。 例えば、REST APIを通してサードパーティのモニタリングサービスを呼び出したり、ビルドプロセス中に実行するスクリプトを呼び出したりすることができます。

また、リポジトリの `ci/` フォルダで`［Jenkinsfile］` を定義することで、独自のパイプラインを作成することができます。 詳しくは、 [Jenkins website](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/) を参照してください。

```{warning}
外部サービスやカスタムパイプラインは、DXPクラウドサポートの対象外であるため、慎重にご利用ください。 Jenkinsのカスタムプラグインはサポートされていません。
```

```{note}
もし、バージョン 3.x.x のサービスを使用していて、独自の ［Jenkinsfile］を定義している場合は、代わりにリポジトリのルートに定義する必要があります。 バージョン確認の詳細については、 [サービススタックのバージョンについて](../reference/understanding-service-stack-versions.md) を参照してください。
```

## 異なる拡張ポイント間でのコードの再利用

これらの拡張ポイント間でコードを共有する方法が必要になるでしょう。 基本的な方法の1つは、groovyスクリプトをロードすることです。 例えば、 `［ci］/` フォルダに `［util.groovy］` という内容でgroovyファイルを作成すると、次のようになります：

```
def sendSlackMessage(message) {
    println(message)
}

return this
```

次に、以下を `［ci/Jenkinsfile-before-cloud-build］`に挿入できます：

```
def util = load("ci/util.groovy")

util.sendSlackMessage("About to create Liferay Cloud build...")
```

```{note}
バージョン3.x.xのサービスを使用している場合、これらのファイルはリポジトリ内の［lcp/ci/］ディレクトリにあります。 バージョン確認の詳細については、 [サービススタックのバージョンについて](../reference/understanding-service-stack-versions.md) を参照してください。
```

## 環境変数リファレンス

次の環境変数は、デフォルトのJenkinsファイルでのみ使用されます。 これらが何をするのかは、 [パイプラインオプションに関するJenkinsのドキュメント](https://jenkins.io/doc/book/pipeline/syntax/#options) を参照してください。

| 名前                                    | デフォルト値   | 説明                                                                                                                                                                                                                                                                              |
|:------------------------------------- |:-------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `lcp_ci_artifact_days_to_keep`        | `-1`     | 保存されるアーティファクトの日数                                                                                                                                                                                                                                                                |
| `lcp_ci_artifact_num_to_keep`         | `1`      | **アーティファクト** と **スタッシュ** を保存する最近のビルドの数を設定します。                                                                                                                                                                                                                                       |
| `lcp_ci_build_days_to_keep`           | `14`     | ビルドが保存される日数                                                                                                                                                                                                                                                                     |
| `lcp_ci_build_num_to_keep`            | `10`     | 保存されるビルドの数                                                                                                                                                                                                                                                                      |
| `lcp_ci_build_timeout_minutes`        | `30`     | パイプライン実行のタイムアウト期間を設定します。 その後、Jenkinsがパイプラインを中止します。                                                                                                                                                                                                                              |
| `lcp_ci_deploy_branch`                |          | [［automatic deployment］](../build-and-deploy/automatically-deploying-ci-service-builds.md)に使用されるブランチ。 この変数が有効なブランチ名に設定されていない場合、自動デプロイは無効になります。                                                                                                                                  |
| `lcp_ci_deploy_target`                |          | [［automatic deployment］](../build-and-deploy/automatically-deploying-ci-service-builds.md) がデプロイされる環境を設定します。 `［LCP_CI_DEPLOY_BRANCH］` が設定されている場合にのみ使用されます。                                                                                                                      |
| `lcp_ci_liferay_dxp_hotfixes_{ENV}`   |          | Liferayサービスをデプロイする際にCIが自動的に適用するHotfixの名前（ `.zip` の拡張子なし）。 環境名を`［{ENV}］`（全て大文字で）、または`［COMMON］`に置き換えます。                                                                                                                                                                           |
| `lcp_ci_preserve_stashes_build_count` | `20`     | **stashes** が保存される最近のビルドの数を設定します。 `LCP_CI_ARTIFACT_NUM_TO_KEEP` 変数で許可されているよりも多くのビルドでStashを保持することはできません。                                                                                                                                                                           |
| `lcp_ci_scm_manage_hooks`             | `true`   | コードホスティングプラットフォーム（GitHubなど）の [［automatic web hook management］](../getting-started/configuring-your-github-repository.md#personal-access-token-usage) を有効または無効にするオプションです。                                                                                                        |
| `lcp_ci_scm_provider`                 | `github` | ビルドの取得に使用するソースコントロール管理サービスを設定します。 許容されているのは [`［bitbucket］`](../getting-started/configuring-your-bitbucket-repository.md)、 [`［github］`](../getting-started/configuring-your-github-repository.md)、及び [`［gitlab］`](../getting-started/configuring-your-gitlab-repository.md)の値です。 |
| `lcp_ci_scm_repository_name`          |          | ビルドを取得する際に使用するリポジトリ名を設定します (GitHub、Bitbucket あるいは GitLab から)。                                                                                                                                                                                                                   |
| `lcp_ci_scm_repository_owner`         |          | ビルドの取得に使用されるリポジトリ所有者。                                                                                                                                                                                                                                                           |
| `lcp_ci_scm_token`                    |          | Bitbucket、GitHub、またはGitLabからビルドにアクセスして取得するために必要な個人用アクセストークン。                                                                                                                                                                                                                    |
| `lcp_ci_use_default_jenkinsfile`      | `false`  | デフォルトのJenkinsfileを有効または無効にするオプション                                                                                                                                                                                                                                               |
| `lcp_database_service`                |          | データベースサービスのホスト名。                                                                                                                                                                                                                                                                |


## 追加情報

* [DXPクラウドサービスへログインする](../getting-started/logging-into-your-liferay-cloud-services.md)
* [GitHubリポジトリの設定](../getting-started/configuring-your-gitlab-repository.md)
* [Bitbucket リポジトリの設定](../getting-started/configuring-your-bitbucket-repository.md)
* [バージョン4でのLiferay Cloudプロジェクトの変更](../reference/liferay-cloud-project-changes-in-version-4.md)
<!-- While Version 3 is still supported, because of the fact a large part of this article hinges on the project version, this link may be helpful. This link should likely be removed once version 3 is no longer supported. -->