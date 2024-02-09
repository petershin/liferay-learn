# Liferayサービスにクラスタリングを設定する

Delectable Bonsaiのウェブサイトは数百万ビューを集めるため、トラフィックを処理するためにクラスタ化する必要がある。 ここでは、本番環境の2ノード・クラスタを構成する方法を学びます。

```{important}
Liferayクラウドプロジェクトのアドオンとして追加のLiferay DXPインスタンスをプロビジョニングして、Liferayサービスをクラスタリングし、別のノードを追加できるようにする必要があります。 詳しくはLiferayアカウントマネージャーにお問い合わせください。
```

## LCP.jsonにクラスタリング・プロパティを設定する

クラスタリングを有効にし、Liferayサービスの設定でスケール値を設定します。

1. プロジェクトのリポジトリで、 `liferay/` ディレクトリに移動し、 `LCP.json` ファイルを開きます。

1. `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED` 環境変数がない場合は追加します。 `true`に設定する。

   ```json
    {
        "env": {
            "LCP_PROJECT_LIFERAY_CLUSTER_ENABLED": "true"
        }
    }
   ```

1. `scale` プロパティを `1`の値で追加する。 これはノードの数を設定するもので、後で更新する。

   ```json
    {
        "kind": "Deployment",
        "id": "liferay",
        "scale": 1
    }
   ```

1. Gradle タスクを実行して、Liferay サービス用のカスタム Dockerfile を作成します。

   ```bash
   ./gradlew clean createDockerfile deploy
   ```

1. ビルドをデプロイする前に、 `LCP.json` ファイルを新しく作成した `build/docker` フォルダにコピーします。

    ```bash
    cp LCP.json build/docker
    ```

    ```bash
    cd build/docker
    ```

1. CLIツールの `lcp deploy` コマンドを使ってLiferayサービスだけをデプロイします。

    ```bash
    lcp deploy --project=[project-name] --environment=prd
    ```

Liferay サービスはクラスタリングを有効にして `scale` 変数を初期化して再起動します。 しかし、スケールは1ノードのみに設定されたままだ。 スケールを目的の2つのノードに更新し続ける。

## クラスタリング・スケールの更新

クラスタリング・スケールを初期化したので、それを2ノードに更新し、新しいビルドを作成してデプロイします。

1. プロジェクトのリポジトリで、 `liferay/` フォルダに移動し、 `LCP.json` ファイルを開きます。

1. `scale` プロパティの値を `2`に更新する。

   ```json
    {
        "kind": "Deployment",
        "id": "liferay",
        "scale": 2
    }
   ```

1. 変更をコミットして Git リポジトリにプッシュします。

   ```bash
   git add liferay/LCP.json
   ```

   ```bash
   git commit -m "Enable clustering and set the clustering scale to 2."
   ```

   ```bash
   git push origin [branch_name]
   ```

更新されたクラスタリング設定はコミットされ、Liferay Cloudインフラストラクチャは自動的にビルドを作成します。

## 構成を展開する

クラスタリングに必要な構成ができたので、構成を環境にデプロイします。

1. Liferay Cloudコンソールにログインします。

1. 画面右上の **Builds** をクリックして Builds ページにアクセスします。

1. 新しい変更を加えたコミットに対応するビルドの Actions メニュー ![Actions menu icon](../../images/icon-actions.png) をクリックし、 **Deploy build to... を選択します。**

   ![Buildsページからコミットメッセージと一緒にデプロイするビルドを選択します。](./setting-up-clustering-for-the-liferay-service/images/01.png)

1. **Environment** ドロップダウン・メニューで本番環境を選択します。

1. 配備の影響を認識するボックスにチェックを入れる。

   ![本番環境を選択し、フォームに記入してビルドをデプロイします。](./setting-up-clustering-for-the-liferay-service/images/02.png)

1. ［**Deploy Build**］ をクリックします。

サービスが再起動すると、クラスタリングが有効になり、Liferayサービスのノードが2つになります。

Next: [Liferay サービスが必要になったときに、さらに多くのインスタンスが自動でスケールするように](./configuring-auto-scaling.md) 設定します。

## 関連概念

* [Liferay Cloudのクラスタリングの設定](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud)
* [Liferay DXPサービスの設定](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/configuring-the-liferay-dxp-service)
* [Liferay Cloud Consoleを使った変更のデプロイ](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console)
* [CLIツールによる変更点のデプロイ](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/deploying-changes-via-the-cli-tool)
* [Liferayサービス環境変数](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/liferay-service-environment-variables)
