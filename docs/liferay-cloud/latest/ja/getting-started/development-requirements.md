# 開発要件

Liferay Cloud でのデプロイを開始する前に、モジュールを作成する予定の開発者は必要なツールをインストールする必要があります。 開発者がカスタマイズを行うために使用できる様々な開発ツールやフレームワークがありますが、Liferay Cloudへのデプロイは、プロビジョニングプロセスで作成したGitHubプロジェクトで開始します。

Liferay Cloud で開発するためのローカル環境を構築するためには、以下のものが必要です。

* [JDK 1.8 または JDK 11](http://www.oracle.com/technetwork/java/javase/downloads/index.html) : Liferay インスタンスをローカルで実行するために必要です。

    ```{important}
    JDK 9 と JDK 10 はサポートされていません。 詳しくは、最新の [Compatibility Matrix](https://help.liferay.com/hc/ja/articles/360049238151) をご覧ください。
    ```

* [Gradle 4+](http://www.gradle.org/downloads) : Liferay DXP と Liferay Cloud の様々なビルドコマンドのいずれかを実行するために使用します。

* [Git](https://git-scm.com/) : Liferay Cloud にデプロイするための変更点を追加するために必要です。

* リポジトリホスティングサービスアカウント：コードの変更をリモートリポジトリにプッシュし、Liferay Cloudのビルドのために変更を提出するために必要です。 以下の利用可能なオプションのいずれかにアカウントを使用することができます：

  * [GitHub](https://github.com/)
  * [Bitbucket](https://bitbucket.org/)
  * [GitLab](https://gitlab.com/)

```{note}
Liferay Cloudには、 [Liferay Workspace](https://help.liferay.com/hc/ja/articles/360029147471-Liferay-Workspace) と同様の前提条件があります。 [Liferay Dev Studio](https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118191007&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191038) 、 [Maven](https://help.liferay.com/hc/ja/articles/360017885592-Maven-Workspace) 、または [Liferay IntelliJ Plugin](https://plugins.jetbrains.com/plugin/10739-liferay-intellij-plugin) でLiferay Workspaceを作成し慣れた開発者は、必要なツールのほとんどをすでにセットアップしています。
```

## 関連トピック

* [Github リポジトリの設定](../getting-started/configuring-your-github-repository.md)
* [Bitbucketリポジトリの設定](./configuring-your-bitbucket-repository.md)
* [GitHubリポジトリの設定](./configuring-your-gitlab-repository.md)
* [Liferay Cloud 導入ワークフローの概要](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)
* [Liferay DXPインスタンスへのログイン](../getting-started/logging-into-your-liferay-cloud-services.md)
