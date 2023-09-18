# GitHubリポジトリの設定

Liferay Cloud アカウントがプロビジョニングされた後の最初のタスクは、管理者として設定をデプロイできるようにプロジェクトの Git リポジトリをセットアップすることです。 マーカスは、Delectable Bonsaiプロジェクトの管理者として、この手続きに従わなければなりません。

リポジトリをセットアップし、最初のプッシュを完了させ、機能していることを確認します。

```{note}
このコースを続けるには、 [CLIツールのインストール](../setting-up-your-cloud-project/using-the-cli-tool.md#install-the-cli-tool) が必要です。
```

## GitHub リポジトリをフォークしてクローンする

まず、Gitをインストールし、GitHubリポジトリのフォークを作成する必要があります。 Delectable Bonsaiプロジェクトの場合、Marcusは初期設定のためにこれらのステップをすべて実行しなければならないが、Kyleは貢献者として最後の2つのステップ（cloneとリモートリポジトリの追加）だけを実行すればよい。

新しいビルドのためにLiferay Cloudプロジェクトをフォークに移します。

1. [ローカル・システムにGit](https://docs.github.com/en/get-started/quickstart/set-up-git) をセットアップする。

1. GitHubでプロビジョニングしたリポジトリのページを開きます。

   ```{tip}
   プロジェクトのリポジトリへのリンクがない場合は、Liferay Cloud コンソールの *Builds* ページに移動し、最新のビルドの *Branch* の下のリンクをクリックします。 このリンクは、プロビジョニングされたリポジトリの特定のブランチを指します。
   ```

1. [リポジトリのフォーク](https://docs.github.com/en/get-started/quickstart/fork-a-repo) を作成してください。

1. [作成したフォーク](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) をローカルシステム上にクローンする。

1. Git がインストールされた）コマンドプロンプトで、あなたのフォークを（上流の） [リモートリポジトリ](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/configuring-a-remote-repository-for-a-fork) として追加します。

これで、ローカルと GitHub 上で Liferay Cloud のプロジェクト構造を持つフォークされたリポジトリができました。

## ウェブフックの設定

次に、Liferay CloudがリポジトリにアクセスできるようにWebhookを設定します。

1. GitHub ウェブサイトで、リポジトリの設定ページに行き、 **Webhooks** をクリックします。

   ![GitHub リポジトリの設定ページからウェブフックを設定します。](./setting-up-the-github-repository/images/02.png)

1. ［**Webhookの追加**］ をクリックします。

1. **Payload URL** フィールドに、Liferay Cloud `infra` 環境の CI サービスのドメインを追加し、最後に `github-webhook/` を追加します（例： `https://ci-delectablebonsai-infra.lfr.cloud/github-webhook/` for the `delectablebonsai` project）。

1. **Content type** ドロップダウンメニューで、 **application/json** を選択する。

1. **Enable SSL verification** が選択されていることを確認する。

   ![新しいWebhookのフォームに必要事項を入力し、トリガーとなるイベントを選択して完了です。](./setting-up-the-github-repository/images/03.png)

1. ［**このウェブフックをトリガーにしたいイベントはどれですか？**］ の下にある、 ［**個々のイベントを選択させてください**］ を選択してください。

1. 表示されるイベントリストから **Pushes** と **Pull Requests** を選択する。

   ![プッシュとプルリクエストを選択して、Liferay Cloud プロジェクトでビルドをトリガーするようにします。](./setting-up-the-github-repository/images/04.png)

1. **Active** チェックボックスが選択されていることを確認する。

1. **Add webhook** をクリックする。

これでLiferay Cloudはあなたのリポジトリにアクセスできるようになりました。

## Liferayクラウドをプライベートリポジトリに向ける

最後に、 `infra` 環境でCIサービスを設定し、プライベートリポジトリで動作するようにする。

1. Liferay Cloud コンソールにログインします。

1. `infra` 環境に移動し、 **Services** をクリックします。

1. CIサービスを選択する。

1. Environment Variablesタブで、これらの環境変数の値を追加する：

    | **名前** | **値** |
    |:----------------------------- |:---------------- |
    | `LCP_CI_SCM_PROVIDER`         | `github`         |
    | `LCP_CI_SCM_REPOSITORY_NAME`  | [リポジトリ名］         |
    | `LCP_CI_SCM_REPOSITORY_OWNER` | [リポジトリ所有者のアカウント］ |
    | `LCP_CI_SCM_TOKEN`            | [個人アクセストークン］     |

    **repo** および **admin:repo_hook** カテゴリですべてのパーミッションがチェックされている [パーソナルアクセストークン](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) を使用してください。

CIサービスが再起動すると、プライベートリポジトリへのプッシュやプルリクエストがLiferay Cloudプロジェクトの新しいビルドのトリガーになります。

次： [カスタムドメイン](./configuring-your-sites-domain.md)を使用するようにサイトを設定する。

## 関連概念

* [GitHubリポジトリの設定](https://learn.liferay.com/w/liferay-cloud/getting-started/configuring-your-github-repository)
* [コマンドラインツール](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool)
* [Bitbucket リポジトリの設定](https://learn.liferay.com/w/liferay-cloud/getting-started/configuring-your-bitbucket-repository)
* [GitHubリポジトリの設定](https://learn.liferay.com/w/liferay-cloud/getting-started/configuring-your-gitlab-repository)
