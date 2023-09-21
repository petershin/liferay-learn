# GitHubリポジトリの設定

Liferay Cloud のオンボーディングメールを受け取ると、 `dxpcloud` 組織でホストされている GitHub リポジトリがプロビジョニングされます。 このリポジトリは、チームの独立したプライベートなLiferay Cloud開発リポジトリのテンプレートで、通常10営業日後に削除されます。 ユーザーは以下のことを行う必要があります：

1. プロビジョニングされたリポジトリを独自のプライベートリポジトリに転送します。
1. Webhook を使用して、プライベートリポジトリを Liferay Cloud の Jenkins (CI) サービスと統合します。

プロビジョニングされたリポジトリはGitHubにありますが、Jenkinsサービスのバージョン3.2.0以降ではGitLabリポジトリに転送できます。 これは、GitLab リポジトリの管理者権限で行う必要があります。

```{note}
リポジトリの管理者は、クラウドコンソールのプロジェクトの管理者と同じとは限りません。
```

## Jenkinsサービスの準備

Jenkinsfileをカスタマイズした場合は、このガイドに従って [デフォルトのJenkinsfileを拡張する](../platform-services/continuous-integration.md#extending-the-default-jenkinsfile) 。

## GitLabリポジトリの作成

まず、新しいGitLabリポジトリを作成します：

1. [GitLab](https://gitlab.com) に移動します。

1. ［**New project**］ をクリックします。
   
   ![［新しいプロジェクト］をクリックして、新しいGitLabリポジトリの作成を開始します。](./configuring-your-gitlab-repository/images/01.png)

1. プロジェクトのスラッグ（URL内のリポジトリ名）を提供します。
   
   ![新しいリポジトリの詳細を記入してください。](./configuring-your-gitlab-repository/images/02.png)

1. 表示レベルをプライベートに設定します（無料ユーザーは無制限のプライベートリポジトリを使用できます）。

1. **Initialize repository with a README** がチェックされていないことを確認します。

1. ［**Create project**］ をクリックします。

## GitHubからGitLabへの転送

以下の手順に従って、プロビジョニング済みの GitHub リポジトリを自分の GitLab リポジトリに転送します：

1. プロビジョニング済みのGitHubリポジトリをローカルでクローンします：
   
   `git clone git@github.com:dxpcloud/example.git` 

    ```{note}
    すでに他のプロバイダで作業するためにリポジトリをクローンしている場合は、このステップをスキップして、同じクローン内で作業することができます。
    ```

1. 新しいGitリモートを追加し、GitLabをポイントします：
   
   `git remote add gitlab git@gitlab.com:USERNAME/REPOSITORYNAME.git`

1. クローンされたリポジトリを新しいリモートリポジトリにプッシュします：
   
   `git push gitlab master`

GitHub リポジトリの作成、クローン、プッシュについてのヘルプが必要な場合は、 [GitLab's documentation](https://docs.gitlab.com/ee/gitlab-basics/start-using-git.html) を参照してください。

## GitLabのアクセストークンの生成

次に、JenkinsのビルドをトリガーするためにWebhookで使用するアクセストークンを作成します。

1. [パーソナル・アクセストークンのページ](https://gitlab.com/profile/personal_access_tokens) に移動します。
   
   ![GitLabのパーソナルアクセストークンを作成します。](./configuring-your-gitlab-repository/images/03.png)

1. このアクセストークンの名前と有効期限を指定します。

1. 次のアクセス許可を持つようにアクセストークンを設定します：

    * api
    * read_repository
    * write_repository

1. [**Create personal access token**]をクリックします。

1. アクセストークンをコピーしてどこかに保存します（アクセストークンが再度表示されないためです）。

## GitLabをJenkinsサービスに接続する

最後に、新しいリポジトリを指すようにJenkinsサービスの環境変数を設定します：

1. Liferay Cloud Console にログインし、 `infra` 環境の Jenkins サービスに移動します。

1. ［**環境変数**］ タブに移動します。

1. 以下の環境変数を設定します：

| 名前                            | 値              |
|:----------------------------- |:-------------- |
| `LCP_CI_SCM_PROVIDER`         | gitlab         |
| `LCP_CI_SCM_REPOSITORY_OWNER` | [repo_owner]   |
| `LCP_CI_SCM_REPOSITORY_NAME`  | [repo_name]    |
| `LCP_CI_SCM_TOKEN`            | [access_token] |

これらの環境変数を更新した後、Jenkinsサービスは再起動します。 これで、新しいリポジトリでプッシュされたブランチとプルリクエストがビルドをトリガーします。

## プライベートGitLabサーバーへの接続

プライベートGitLabサーバーを使用するには、Jenkinsサービスで追加の環境変数を設定する必要があります：

| 名前                       | 値                  |
|:------------------------ |:------------------ |
| `LCP_CI_SCM_SERVER_HOST` | [private host URL] |

`LCP_CI_SCM_SERVER_HOST` 変数に、プライベートGitLabサーバーのベースURLを設定します（例えば、 `http://private.gitlab.server.com/`）。 これにより、ビルドを生成してリポジトリのブランチにリンクするときにCIがコードベースを取得するために使用するサーバーURLが設定されます。 デフォルトでは、CIはGitLabのベースURLとして `https://gitlab.com/` を使用しています。

## 追加のGitLab Webhook設定

Liferay Cloud の Jenkins サービスは、選択した git SCM プロバイダのウェブフックを作成します。 GitLabのデフォルトのWebhookをGitHubやBitBucketのWebhookの機能と一致させるためには追加の設定が必要です。

1. GitLabリポジトリに移動します。

1. **Settings** に移動し ［**Webhooks**］ を選択します。

1. **Project Hooks** で、作成されたWebhookがリストされていることを確認します。

1. CI webhookの[**Edit**]ボタンをクリックします。
   
   ![リポジトリ用に自動的に作成されたWebhookを編集します。](./configuring-your-gitlab-repository/images/04.png)

1. ［**Tags push events**］ と ［**Comments**］ をアンチェックします。

1. ［**Enable SSL verification**］ にチェックします。

1. ［**変更を保存**］ クリックします。

## ビルドの確認

プッシュされたブランチとマージリクエスト（GitLab のプルリクエストに相当）がビルドのトリガーとなり、Liferay Cloud Console の **Builds** タブからビルドの確認やデプロイができます。 Jenkins サービスとの統合を設定したら、次のステップとして、インテグレーションが成功したかどうかを確認するためにビルドを検証します。

### プッシュされたブランチからのビルドの確認

新しいGitプッシュがJenkinsビルドをトリガーすることを確認します：

1. リポジトリに変更を加え（ファイルの追加など）、ブランチにコミットします： 

    ```bash
    git commit -m "Add file to test builds"
    ```

1. ブランチをGitLabにプッシュします： 

    ```bash
    git push gitlab branch-name
    ```

1. Liferay Cloud Console の **Builds** ページに移動します。

1. **Builds** ページで、プッシュされたブランチのビルドが表示されることを確認します。

### マージリクエストからのビルドの確認

新しいマージリクエストがJenkinsビルドをトリガーすることを確認します：

1. 任意のブランチから `develop` ブランチへのマージリクエストを作成します。

1. マージリクエストに対して新しいビルドが作成されていることを確認します。

1. Liferay Cloud Console の **Builds** ページに移動します。

1. ブランチのリンクをクリックして、適切なビルドでコミットします。
   
   ![Buildページで、ブランチのリンクを確認し、ビルドをコミットします。](./configuring-your-gitlab-repository/images/05.png)

1. リンクが正しいGitLabページにリダイレクトすることを確認します。

## 関連トピック

* [BitBucketリポジトリの設定](./configuring-your-bitbucket-repository.md)
* [GitHubリポジトリの設定](./configuring-your-github-repository.md)
