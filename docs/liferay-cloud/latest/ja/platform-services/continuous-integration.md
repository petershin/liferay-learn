# 継続的インテグレーション

Liferay Cloudは [Jenkins](https://jenkins.io/) を使用して、継続的なインテグレーションインフラストラクチャサービスを強化しています。 プルリクエストを送信するか、事前設定されたGitHubブランチの1つにコミットをプッシュすると、自動で設定可能なビルドがトリガーされます。

```{note}
Liferayクラウドの顧客（`customer`ログインを使用）には、ビルドの管理とレビューの権限がありますが、完全な管理権限はありません。
```

デフォルトでは、この自動ビルドはコードをコンパイルし、テストを実行するように設定できます。 Liferay Cloudはサービスをビルドし、そのステータスを環境のビルドページに表示します。 テストが失敗したら、Jenkinsのダッシュボードとログを`https://ci-companyname-infra.lfr.cloud`で確認できる。

```{note}
継続的インテグレーションが機能するのは、GitHub、GitLab、Bitbucketからデプロイする場合だけで、CLIからデプロイする場合は機能しない。
```

詳しくは、 [CIサービスの制限](../reference/platform-limitations.md#continuous-integration-service) を参照してください。

## デフォルトのJenkinsfileの使用

CIサービスには、プロジェクトのビルドに使われるデフォルトのJenkinsfileが含まれている。 デフォルトのJenkinsfileは、それまでJenkinsfileに保存されていたすべてのロジックをカプセル化し、Jenkinsプラグインに移動させます。 つまり、CI構成を必要とせずに、すべてのバグ修正、セキュリティ修正、および改善を適用できます。

さらに、拡張ポイントを使用して、CIパイプラインの各ステップをカスタマイズできます。

### デフォルトのJenkinsfileの拡張

デフォルトのJenkinsfileを拡張するには、プロジェクトリポジトリの`ci`フォルダに以下のファイルを追加する：

- `Jenkinsfile-before-all`
- `Jenkinsfile-before-cloud-build`
- `Jenkinsfile-before-cloud-deploy`
- `Jenkinsfile-after-all`
- `Jenkinsfile-post-always`

CIビルドプロセスのステップの基本的な概要は次のとおりです：

1. `ci/Jenkinsfile-before-all`があれば、それをロードする。

1. Liferay Workspaceをビルドします。

1. `ci/Jenkinsfile-before-cloud-build`があれば、それをロードする。

1. コンソールに表示されるLiferay Cloudのビルドを作成します。

1. `ci/Jenkinsfile-before-cloud-deploy`があれば、それをロードする。

1. 現在のブランチがデプロイブランチの場合、ビルドをクラウド上の環境にデプロイできます。 環境変数 `LCP_CI_DEPLOY_BRANCH` はデプロイブランチを設定し、`LCP_CI_DEPLOY_TARGET` はデプロイ環境を指定する。

1. `ci/Jenkinsfile-after-all` があれば、それをロードする。 これは、すべてのビルド手順が完了すると実行されます。

1. `ci/Jenkinsfile-post-always` が存在すれば、それをロードする。 これは、ビルドが成功しても失敗しても実行されます。

Jenkinsサービスの起動ログを監視して、デフォルトのパイプラインでこれらがどのように使用されるかを確認することができます。 完全なデフォルトのJenkinsfileが起動ログに出力されます。

## 追加のパイプラインのカスタマイズと外部通話

パイプラインの追加の手順を使用して、外部サービスを呼び出すことができます。 例えば、REST APIを通してサードパーティのモニタリングサービスを呼び出したり、ビルドプロセス中に実行するスクリプトを呼び出したりすることができます。

リポジトリの `ci/` フォルダに `Jenkinsfile` を定義することで、独自のパイプラインを作成することもできます。 詳しくは、 [Jenkins website](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/) を参照してください。

```{warning}
外部サービスやカスタムパイプラインは、Liferay Cloudサポートの対象外であるため、慎重にご利用ください。 Jenkinsのカスタムプラグインはサポートされていません。
```

## 異なる拡張ポイント間でのコードの再利用

これらの拡張ポイント間でコードを共有する方法が必要になるでしょう。 基本的な方法の1つは、groovyスクリプトをロードすることです。 例えば、`ci/`フォルダに`util.groovy`という名前で以下の内容のgroovyファイルを作ることができる：

```
def sendSlackMessage(message) {
	println(message)
}

return this
```

そして、`ci/Jenkinsfile-before-cloud-build`に以下を挿入する：

```
def util = load("ci/util.groovy")

util.sendSlackMessage("About to create Liferay Cloud build...")
```

## 環境変数リファレンス

次の環境変数は、デフォルトのJenkinsファイルでのみ使用されます。 これらが何をするのかは、 [パイプラインオプションに関するJenkinsのドキュメント](https://jenkins.io/doc/book/pipeline/syntax/#options) を参照してください。

| 名前                                    | デフォルト値    | 説明                                                                                                                                                                                                                                                                                                |
| :------------------------------------ | :-------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `LCP_CI_ARTIFACT_DAYS_TO_KEEP`        | `-1`      | 保存されるアーティファクトの日数                                                                                                                                                                                                                                                                                  |
| `LCP_CI_ARTIFACT_NUM_TO_KEEP`         | `1`       | **artifacts** と **stashes** が保存される最近のビルドの数を設定する。                                                                                                                                                                                                                                                         |
| `LCP_CI_BUILD_DAYS_TO_KEEP`           | `14`      | ビルドが保存される日数                                                                                                                                                                                                                                                                                       |
| `LCP_CI_BUILD_NUM_TO_KEEP`            | `10`      | 保存されるビルドの数                                                                                                                                                                                                                                                                                        |
| `LCP_CI_BUILD_TIMEOUT_MINUTES`        | `30`      | パイプライン実行のタイムアウト期間を設定します。 その後、Jenkinsがパイプラインを中止します。                                                                                                                                                                                                                                                |
| `LCP_CI_CLI_LOG_LEVEL`                |           | `verbose`に設定すると、CIサービスはlcpコマンドを実行する際に`--verbose`フラグを使用する。 これにより、コマンド実行時のデバッグのための情報がより多く得られる。                                                                                                                                                                                                      |
| `LCP_CI_DEPLOY_BRANCH`                | `develop` | [自動デプロイメント](../updating-services-in-liferay-paas/automatically-deploying-ci-service-builds.md) に使用するブランチを指定します。 有効なブランチ名に設定されていない場合、自動デプロイは無効となります。                                                                                                                                                      |
| `LCP_CI_DEPLOY_TARGET`                |           | [自動デプロイメント](../updating-services-in-liferay-paas/automatically-deploying-ci-service-builds.md) がデプロイされる環境を設定します。 `LCP_CI_DEPLOY_BRANCH` が設定されている場合のみ使用する。                                                                                                                                             |
| `LCP_CI_LIFERAY_DXP_HOTFIXES_{ENV}`   |           | CIがLiferayサービスをデプロイする際に自動的に適用するHotfixの名前（拡張子`.zip`なし）。 `{ENV}`を環境名（すべて大文字）、または`COMMON` に置き換える。                                                                                                                                                                                                    |
| `LCP_CI_PRESERVE_STASHES_BUILD_COUNT` | `20`      | スタッシュ*が保存される最近のビルドの数を設定する。 `LCP_CI_ARTIFACT_NUM_TO_KEEP`変数で許容されるよりも多くのビルドに対してスタッシュを保存することはできません。                                                                                                                                                                                            |
| `LCP_CI_SCM_MANAGE_HOOKS`             | `true`    | コードホスティングプラットフォーム（GitHubなど）の [ウェブフックの自動管理を無効](../getting-started/configuring-your-github-repository.md#personal-access-token-usage) を有効または無効にするオプションです。                                                                                                                                 |
| `LCP_CI_SCM_PROVIDER`                 | `github`  | ビルドの取得に使用するソースコントロール管理サービスを設定します。 [`bitbucket`](../getting-started/configuring-your-bitbucket-repository.md) , [`github`](../getting-started/configuring-your-github-repository.md) , および [`gitlab`](../getting-started/configuring-your-gitlab-repository.md) である。 |
| `LCP_CI_SCM_REPOSITORY_NAME`          |           | ビルドを取得する際に使用するリポジトリ名を設定します (GitHub、Bitbucket あるいは GitLab から)。                                                                                                                                                                                                                                     |
| `LCP_CI_SCM_REPOSITORY_OWNER`         |           | ビルドの取得に使用されるリポジトリ所有者。                                                                                                                                                                                                                                                                             |
| `LCP_CI_SCM_TOKEN`                    |           | Bitbucket、GitHub、またはGitLabからビルドにアクセスして取得するために必要な個人用アクセストークン。                                                                                                                                                                                                                                      |
| `LCP_CI_USE_DEFAULT_JENKINSFILE`      | `false`   | デフォルトのJenkinsfileを有効または無効にするオプション                                                                                                                                                                                                                                                                 |
| `LCP_DATABASE_SERVICE`                |           | データベースサービスのホスト名。                                                                                                                                                                                                                                                                                  |

## 関連トピック

* [Liferay クラウドサービス](../getting-started/logging-into-your-liferay-cloud-services.md) にログインする
* [GitLab リポジトリの設定](../getting-started/configuring-your-gitlab-repository.md)
* [Bitbucket リポジトリの設定](../getting-started/configuring-your-bitbucket-repository.md)
