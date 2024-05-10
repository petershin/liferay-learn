# ステージ6:検索設定の移行

Webサーバーの構成がLiferay Cloudにデプロイされたので、次の移行段階として、検索の構成を移行することになります。 これは、検索エンジンをElasticsearchに移行し、Elasticsearchの設定ファイルやプラグインをすべてLiferay Cloud環境にデプロイすることです。

## サーチエンジンをElasticsearchに移行する

オンプレミス環境でElasticsearchを使用していない場合は、Elasticsearchに移行してから進めてください。

Elasticsearchへの移行は、インストールしてからLiferayのインストールと接続することになります。 詳しくは [Elasticsearchを開始する](https://learn.liferay.com/w/dxp/using-search/installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch) をご覧ください。

```{tip}
Elasticsearchへの移行についてお困りの場合は、 [Liferay Cloudサポート](https://help.liferay.com/hc/en-us) までお問い合わせください。
```

## 設定とシェルスクリプトを整理する

```{note}
特定のElasticsearchの設定やスクリプトを整理する必要がない場合は、このステップをスキップしてください。
```

先にクローンしたプロジェクトリポジトリ [先にクローンした](./matching-dxp-versions.md#clone-the-liferay-cloud-repository) で、 `search/configs/{ENV}/` フォルダ（Liferay Cloud 環境に対応）に移動し、Elasticsearch 設定ファイルやシェルスクリプトをすべて、このパターンで適切な環境フォルダに配置します。

* Elasticsearchの設定ファイルを `search/configs/{ENV}/config/`に入れる。
* すべてのカスタムシェルスクリプトを `search/configs/{ENV}/scripts/`に入れる。

`search` サービスが再展開されるたびに、適切なフォルダーにあるすべてのカスタムシェルスクリプトが実行されます。

```{tip}
Elasticsearchの設定ファイルがどのようなものかは、設定例 [here](../reference/example-configuration-files.md#search-service-configuration-elasticsearch-yml) をご覧ください。
```

## 検索プラグインを追加する

```{note}
追加するプラグインがない場合は、この手順をスキップしてください。
```

まず、Liferay Cloudにデフォルトでインストールされているプラグインの一覧を確認します。

1. Liferay Cloud 環境で、本番環境（`prd`）に移動してください。

    ![コンソール画面上部のドロップダウンから本番環境へ移動します。](./migrating-search-configurations/images/01.png)

    本番環境には、プレインストールされたすべてのElasticsearchプラグインが含まれています。

1. `search` サービスに移動し、 `Shell` タブをクリックします。

1. シェルで、次のコマンドを実行します。

    ```bash
    bin/elasticsearch-plugin list
    ```

コマンドを実行すると、シェルはプリインストールされているすべてのElasticsearchプラグインをリストアップします。

リストにない検索プラグインがある場合は、Liferay Cloud プロジェクトのリポジトリに追加してください。

1. リポジトリで、 `search/LCP.json` ファイルを開いてください。

1. [環境変数](../reference/defining-environment-variables.md) を追加する `LCP_SERVICE_SEARCH_ES_PLUGINS` プリインストールされているプラグインに追加する必要がある検索プラグインをカンマ区切りで記載します。

    例えば、 `analysis-kuromoji` プラグインをインストールする場合は、以下の環境変数を追加します。

    ```
    "env: {
        "LCP_SERVICE_SEARCH_ES_PLUGINS": "analysis-kuromoji"
    }
    ```

## ビルドの作成とデプロイ

次に、これらの変更を加えたビルドを作成し、デプロイして、Liferay Cloud 環境に適用させます。

### 変更を伴うJenkinsビルドの作成

Gitがインストールされている端末でGitコマンドを実行し、変更内容を送信します。

1. 変更したファイルをGitに追加します。

    ```bash
    git add .
    ```

1. 変更内容とメッセージを添えてコミットしてください。

    ```bash
    git commit -m "Liferay Cloud Migration Stage 6"
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

    ![ビルドのActionsメニューでデプロイします。](./migrating-search-configurations/images/02.png)

1. ビルドをデプロイする環境を選択します（例： `acme-dev`）。

1. 以下の情報を読み、確認ボックスを選択して、展開結果を確認してください。

    ![チェックボックスにチェックを入れ、準備ができたらビルドをデプロイしてください。](./migrating-search-configurations/images/03.png)

1. **Deploy Build** をクリックします。

ビルドは選択した環境にデプロイされ、 `search` サービスが再起動すると、選択した環境に Elasticsearch の設定、シェルスクリプト、およびプラグインが適用されます。

## 次のステップ

これで、Elasticsearch の設定を Liferay Cloud 環境に移行する作業が完了しました。 次に、 [VPNサーバーの設定と接続を行います。](./connecting-the-vpn.md).
