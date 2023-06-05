# CIサービスのビルドを自動的にデプロイする

Liferay Cloudでは、Webhookを使用して、プロジェクトのGitリポジトリにプッシュまたはマージされた変更に対してJenkinsビルドを自動的にトリガーできます（例： [GitHub](../getting-started/configuring-your-github-repository.md#integrating-with-the-jenkins-service) , [Bitbucket](../getting-started/configuring-your-bitbucket-repository.md#connecting-bitbucket-to-your-jenkins-service) , [GitLab](../getting-started/configuring-your-gitlab-repository.md#connecting-gitlab-to-your-jenkins-service) )。 これらのビルドは、Liferay Cloud Consoleからプロジェクト環境に手動でデプロイすることができます。 また、特定のブランチで成功したビルドを、特定の環境に自動的にデプロイするようにCIサービスを設定することで、デプロイ作業を高速化することもできます。

デフォルトでは、自動デプロイメントは `LCP_CI_DEPLOY_BRANCH` および `LCP_CI_DEPLOY_TARGET` 変数によって制御されます。 これらは、自動デプロイのトリガーとなるブランチや、ビルドの自動デプロイ先となる環境を決定します。 これらのデフォルト値は、それぞれ `develop` 、 `dev` に設定されています。

必要であれば、Liferay Cloud Console から `LCP_CI_DEPLOY_BRANCH` と `LCP_CI_DEPLOY_TARGET` 変数を編集して、自動デプロイを設定することが可能です。

1. Liferay Cloud Project の `infra` 環境に移動します。

1. **CI** サービスのページに行き、 **環境変数** タブをクリックします。

   ![CIサービスのページを開き、「環境変数」タブをクリックします。](./automatically-deploying-ci-service-builds/images/01.png)

1. CIサービスに以下の変数を追加します。

   * **Key** : `LCP_CI_DEPLOY_BRANCH`

      **Value** : 任意のブランチ名を入力します（例： `useracceptance`）。

   * **Key** : `LCP_CI_DEPLOY_TARGET`

      **Value** ：任意の環境名を入力します（例： `uat`）。

1. ［**変更を保存**］ をクリックします。 これにより、CIサービスは新しい変数で再起動します。

再起動すると、指定したブランチにプッシュまたはマージされた変更が自動的にビルドされ、ターゲット環境にデプロイされます。

## 関連トピック

* [Liferay Cloud 開発ワークフローの概要](./overview-of-the-liferay-cloud-deployment-workflow.md)
* [Liferay Cloud Consoleを使った変更のデプロイメント](./deploying-changes-via-the-liferay-cloud-console.md)
* [CLIツールによる変更点のデプロイ](./deploying-changes-via-the-cli-tool.md)
