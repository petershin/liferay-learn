# 第5ステージウェブサーバー設定の移行

Liferayの設定とカスタマイズがDXP Cloudに展開されたので、次の段階としてWebサーバーの設定を移行します。 この作業では、Web サーバーを Nginx に移行し（必要な場合）、Nginx のすべての設定ファイルとカスタマイズ（シェル スクリプトと静的コンテンツ）を DXP クラウド環境にデプロイします。

## ウェブサーバをNginxに移行する

DXPクラウドは、WebサーバーとしてNginxのみをサポートしています。 まだ Nginx を使用していない場合は、まず Web サーバと設定を Nginx に移行してください。 詳しくは、 [Nginxサイト](http://nginx.org/en/docs/beginners_guide.html) をご覧ください。

```{tip}
Nginxへの移行についてお困りの方は、[DXPクラウドサポート](https://help.liferay.com/hc/en-us)までお問い合わせください。
```

## Nginxの設定を整理する

次に、Nginxの設定をリポジトリに移動し、DXP Cloudにデプロイします。

```{note}
特定のNginxの設定を整理する必要がない場合は、このステップをスキップしてください。
```

先に [クローンしたプロジェクトリポジトリで](./matching-dxp-versions.md#clone-the-dxp-cloud-repository)、 `webserver/configs/{ENV}` フォルダ（DXP Cloud 環境に対応）に移動して、Nginx 設定ファイルをすべて、このパターンに従って該当環境フォルダに配置します。

* Nginxの設定ファイル（`.conf`）を `webserver/configs/{ENV}/conf.d/`に配置する。
* `var/www/html/` ディレクトリのオーバーライドを `webserver/configs/{ENV}/public/`に配置します。
* その他のオーバーライド（ `/etc/nginx/` ディレクトリ用）は `webserver/configs/{ENV}/`に入れてください。

```{tip}
webserver/configs/common/` フォルダに置かれたファイルは、デプロイされるとすべての環境に適用されます。
```

詳しくは、 [Web Server Service Configurations](../platform-services/web-server-service.md#configurations) を参照してください。

```{tip}
Nginx の設定ファイルがどのようなものかは、設定例 [here](../reference/example-configuration-files.md#web-server-service-configuration-nginx-conf) をご覧下さい。
```

## Webサーバーのカスタマイズを整理する

```{note}
これらのカスタムシェルスクリプトやWebサーバーの静的コンテンツがない場合は、この手順をスキップしてください。
```

DXP Cloud プロジェクト リポジトリで、すべてのカスタム シェル スクリプトを適切な `webserver/configs/{ENV}/scripts/` 環境フォルダーに配置します。

すべての静的コンテンツを適切な `webserver/configs/{ENV}/public/` 環境フォルダーに入れます。

すべてのカスタムコンテンツをリポジトリに整理したら、DXP Cloud環境に変更をデプロイする準備が整いました。

## ビルドの作成とデプロイ

次に、これらの変更点を含むビルドを作成してデプロイし、DXP Cloud 環境に適用する必要があります。

### 変更を伴うJenkinsビルドの作成

Gitがインストールされている端末でGitコマンドを実行し、変更内容を送信します。

1. 変更したファイルをGitに追加します。

    ```bash
    git add .
    ```

1. 変更内容とメッセージを添えてコミットしてください。

    ```bash
    git commit -m "DXP Cloud Migration Stage 5"
    ```

1. 変更をGitHubにプッシュします。

    ```bash
    git push origin master
    ```

プロジェクトはGitHubのリポジトリにリンクされているため、変更をプッシュすると自動的にビルドが作成されます。 ビルドが完了するのを待ってから、次に進みます。

### ビルドを選択した環境にデプロイする

最後に、 [DXP Cloud Console](https://console.liferay.cloud/) を使用して、完成したビルドを選択した環境にデプロイします。

1. DXP Cloud Consoleで、Buildsページに移動します（ページ上部のリンクを使用します）。

1. リストの中から前回作成したビルドを探し、[アクション]メニューから *Deploy build to*をクリックします。

    ![ビルドのActionsメニューでデプロイします。](./migrating-web-server-configurations/images/01.png)

1. ビルドをデプロイする環境を選択します（例： `acme-dev`）。

1. 以下の情報を読み、確認ボックスを選択して、展開結果を確認します。

    ![チェックボックスにチェックを入れ、準備ができたらビルドをデプロイしてください。](./migrating-web-server-configurations/images/02.png)

1. *Deploy Build*をクリックします。

ビルドは選択した環境にデプロイされ、 `Web サーバ` サービスが再起動すると、選択した環境に Nginx の設定やカスタマイズが適用されます。

## 次のステップ

これで、DXPクラウド環境へのWebサーバー構成の移行は完了です。 次に、 [Elasticsearchの設定を移行します](./migrating-search-configurations.md).
