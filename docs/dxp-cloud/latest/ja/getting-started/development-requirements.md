# 開発要件

Liferay DXP Cloudでのデプロイを開始する前に、DXP Cloudのモジュールを作成することを計画している開発者は、必要なツールをインストールする必要があります。 開発者がカスタマイズを作成するために使用できるさまざまな開発ツールとフレームワークがありますが、DXP Cloudへのデプロイは、プロビジョニングプロセス中に作成されたGitHubプロジェクトから始まります。

DXP Cloudで開発するためのローカル環境をセットアップするには、以下が必要です:

* [JDK 1.8またはJDK 11](http://www.oracle.com/technetwork/java/javase/downloads/index.html)：Liferay DXPをローカルで実行するために必要

    ```{important}
    JDK 9 と JDK 10 はサポートされていません。 詳しくは、最新の[Compatibility Matrix](https://help.liferay.com/hc/en-us/articles/360049238151)をご覧ください。
    ```

* [Gradle 4+](http://www.gradle.org/downloads)：Liferay DXPおよびDXP Cloudのさまざまなビルドコマンドを実行するために使用されます

* [Git](https://git-scm.com/): DXP Cloudにデプロイするための変更を追加するために必要です。

* リポジトリホスティングサービスアカウント：コードの変更をリモートリポジトリにプッシュしたり、DXP Cloudのビルド用に変更を送信するために必要です。 以下の利用可能なオプションのいずれかにアカウントを使用することができます：

  * [GitHub](https://github.com/)
  * [Bitbucket](https://bitbucket.org/)
  * [GitLab](https://gitlab.com/)

```{note}
Liferay DXP Cloud は、[Liferay Workspace](https://help.liferay.com/hc/en-us/articles/360029147471-Liferay-Workspace)と同様の前提条件となります。 Liferay Dev Studio] を使って Liferay Workspace を作成することに慣れている開発者(https://customer.liferay.com/downloads?p_p_id=com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_productAssetCategoryId=118191007&_com_liferay_osb_customer_downloads_display_web_DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191038), [Maven]（https://help.liferay.com/hc/en-us/articles/360017885592-Maven-Workspace), または [Liferay IntelliJ Plugin](https://plugins.jetbrains.com/plugin/10739-liferay-intellij-plugin) には必要なツールのほとんどがすでにセットアップされています。
```

## 追加情報

* [Github リポジトリの設定](../getting-started/configuring-your-github-repository.md)
* [Bitbucketリポジトリの設定](./configuring-your-bitbucket-repository.md)
* [GitHubリポジトリの設定](./configuring-your-gitlab-repository.md)
* [DXP Cloud デプロイメントワークフローの概要](../build-and-deploy/overview-of-the-dxp-cloud-deployment-workflow.md)
* [Liferay DXPインスタンスへのログイン](../getting-started/logging-into-your-dxp-cloud-services.md)
