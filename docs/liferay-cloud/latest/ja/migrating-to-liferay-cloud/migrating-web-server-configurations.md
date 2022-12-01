# 第5ステージウェブサーバー設定の移行

Liferayの設定とカスタマイズがLiferay Cloudにデプロイされたので、次の段階はWebサーバーの設定を移行することです。 これは、WebサーバーをNginxに移行し（必要な場合）、Nginxの設定ファイルやカスタマイズ（シェルスクリプトや静的コンテンツ）をすべてLiferay Cloud環境にデプロイすることです。

## ウェブサーバをNginxに移行する

Liferay Cloud は Web サーバーとして Nginx のみをサポートしています。 Nginx をまだ使用していない場合は、まず Web サーバと設定を Nginx に移行します。 詳しくは、 [Nginx サイト](http://nginx.org/en/docs/beginners_guide.html) をご覧ください。

```{tip}
Nginxへの移行についてお困りの場合は、 [Liferay Cloud Support](https://help.liferay.com/hc/en-us) までご連絡ください。
```

## Nginxの設定を整理する

次に、Nginxの設定をリポジトリに移動し、Liferay Cloudにデプロイします。

```{note}
特定のNginxの設定を整理する必要がない場合は、このステップをスキップしてください。
```

先にクローンしたプロジェクトリポジトリ [先にクローンした](./matching-dxp-versions.md#clone-the-liferay-cloud-repository) で、 `webserver/configs/{ENV}/` フォルダ（Liferay Cloud 環境に対応）に移動し、以下のパターンで Nginx 設定ファイルをすべて適切な環境フォルダに配置します。

* Nginx の設定ファイル (`.conf`) を `webserver/configs/{ENV}/conf.d/`に入れる。
* `var/www/html/` ディレクトリのオーバーライドを `webserver/configs/{ENV}/public/`に入れる。
* その他のオーバーライド（ `/etc/nginx/` ディレクトリ用）は、 `webserver/configs/{ENV}/`に入れます。

```{tip}
webserver/configs/common/` フォルダに置かれたファイルは、デプロイされるとすべての環境に適用されます。
```

詳しくは、 [Web Server Service Configurations](../platform-services/web-server-service.md#configurations) をご覧ください。

```{tip}
Nginx の設定ファイルがどのようなものかは、設定例 [here](../reference/example-configuration-files.md#web-server-service-configuration-nginx-conf) をご覧ください。
```

## Webサーバーのカスタマイズを整理する

```{note}
これらのカスタムシェルスクリプトやWebサーバーの静的コンテンツがない場合は、この手順をスキップしてください。
```

Liferay Cloud プロジェクトのリポジトリで、すべてのカスタムシェルスクリプトを適切な `webserver/configs/{ENV}/scripts/` 環境フォルダーに配置します。

すべての静的コンテンツを、それぞれ適切な `webserver/configs/{ENV}/public/` 環境フォルダに配置します。

すべてのカスタムコンテンツをリポジトリに整理したら、Liferay Cloud 環境に変更をデプロイする準備が整いました。

## ビルドの作成とデプロイ

次に、これらの変更点を含むビルドを作成し、デプロイして、Liferay Cloud 環境に適用する必要があります。

### 変更を伴うJenkinsビルドの作成

Gitがインストールされている端末でGitコマンドを実行し、変更内容を送信します。

1. 変更したファイルをGitに追加します。

    ```bash
    git add .
    ```

1. 変更内容とメッセージを添えてコミットしてください。

    ```bash
    git commit -m "Liferay Cloud Migration Stage 5"
    ```

1. 変更をGitHubにプッシュします。

    ```bash
    git push origin master
    ```

プロジェクトはGitHubのリポジトリにリンクされているため、変更をプッシュすると自動的にビルドが作成されます。 ビルドが完了するのを待ってから、次に進みます。

### ビルドを選択した環境にデプロイする

最後に、 [Liferay Cloud Console](https://console.liferay.cloud/) を使って、完成したビルドを選択した環境にデプロイします。

1. Liferay Cloud Console で Builds ページに移動します（ページ上部のリンクを使用します）。

1. リストの中から前回作成したビルドを探し、「Actions」メニューから「**Deploy build to**」をクリックします。

    ![ビルドのActionsメニューでデプロイします。](./migrating-web-server-configurations/images/01.png)

1. ビルドをデプロイする環境を選択します（例： `acme-dev`）。

1. 以下の情報を読み、確認ボックスを選択して、展開結果を確認してください。

    ![チェックボックスにチェックを入れ、準備ができたらビルドをデプロイしてください。](./migrating-web-server-configurations/images/02.png)

1. **Deploy Build** をクリックします。

ビルドは選択した環境にデプロイされ、Nginx の設定やカスタマイズは `Web サーバ` サービスが再起動した時点で、選択した環境に適用されます。

## 次のステップ

これで、Liferay Cloud 環境への Web サーバー構成の移行は完了です。 次に、 [Elasticsearchの設定を移行します。](./migrating-search-configurations.md).
