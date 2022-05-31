# 第6ステージ検索設定の移行

Webサーバーの構成がDXP Cloudに展開されたので、次の移行段階として、検索構成の移行を行います。 検索エンジンをElasticsearchに移行し、Elasticsearchの設定ファイルやプラグインをすべてDXP Cloud環境にデプロイする作業が必要です。

## 検索エンジンをElasticsearchに移行する

オンプレミス環境でElasticsearchを使用していない場合は、Elasticsearchに移行してから進めてください。

Elasticsearchへの移行は、インストールしてからLiferayのインストールと接続することになります。 詳しくは、 [Elasticsearch入門](https://learn.liferay.com/dxp/latest/en/using-search/installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch.html) をご覧ください。

```{tip}
Elasticsearchへの移行についてお困りの方は、[DXPクラウドサポート](https://help.liferay.com/hc/en-us)までご連絡ください。
```

## 設定とシェルスクリプトを整理する

```{note}
特定のElasticsearchの設定やスクリプトを整理する必要がない場合は、このステップをスキップしてください。
```

先に [クローンしたプロジェクトリポジトリから](./matching-dxp-versions.md#clone-the-dxp-cloud-repository) `search/configs/{ENV}` フォルダ（DXP Cloud環境に対応）に移動して、Elasticsearch設定ファイルやシェルスクリプトをこのパターンで適切な環境のフォルダに配置します。

* Elasticsearchの設定ファイルを `search/configs/{ENV}/config/`に入れる。
* すべてのカスタムシェルスクリプトを `search/configs/{ENV}/scripts/`に配置する。

`search` サービスが再展開されるたびに、該当フォルダー内のすべてのカスタムシェルスクリプトが実行されます。

```{tip}
Elasticsearchの設定ファイルがどのようなものかは、設定例 [here](../reference/example-configuration-files.md#search-service-configuration-elasticsearch-yml) をご覧下さい。
```

## 検索プラグインを追加する

```{note}
追加するプラグインがない場合は、このステップをスキップしてください。
```

まず、DXPクラウドにデフォルトでインストールされているプラグインの一覧を確認します。

1. DXPクラウド環境で、本番環境（`prd`）に移動します。

    ![コンソール画面上部のドロップダウンから本番環境へ移動します。](./migrating-search-configurations/images/01.png)

    本番環境には、プレインストールされたすべてのElasticsearchプラグインが含まれています。

1. `search` サービスに移動し、 `Shell` タブをクリックします。

1. シェルで、次のコマンドを実行します。

    ```bash
    bin/elasticsearch-plugin list
    ```

コマンドを実行すると、シェルはプリインストールされているすべてのElasticsearchプラグインを一覧表示します。

リストにない検索プラグインをお持ちの場合は、DXP Cloud プロジェクトのリポジトリに追加してください。

1. リポジトリで、 `search/LCP.json` ファイルを開いてください。

1. [環境変数](../reference/defining-environment-variables.md) 名 `LCP_SERVICE_SEARCH_ES_PLUGINS` にプリインストールのプラグインに追加したい検索プラグインをカンマ区切りで追加してください。

    例えば、 `analysis-kuromoji` プラグインをインストールするには、以下の環境変数を追加してください。

    ```
    "env: {
        "LCP_SERVICE_SEARCH_ES_PLUGINS": "analysis-kuromoji"
    }
    ```

## ビルドの作成とデプロイ

次に、これらの変更を含むビルドを作成し、デプロイして、DXP Cloud 環境に適用します。

### 変更を伴うJenkinsビルドの作成

Gitがインストールされている端末でGitコマンドを実行し、変更内容を送信します。

1. 変更したファイルをGitに追加します。

    ```bash
    git add .
    ```

1. 変更内容とメッセージを添えてコミットしてください。

    ```bash
    git commit -m "DXP Cloud Migration Stage 6"
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

    ![ビルドのActionsメニューでデプロイします。](./migrating-search-configurations/images/02.png)

1. ビルドをデプロイする環境を選択します（例： `acme-dev`）。

1. 以下の情報を読み、確認ボックスを選択して、展開結果を確認します。

    ![チェックボックスにチェックを入れ、準備ができたらビルドをデプロイしてください。](./migrating-search-configurations/images/03.png)

1. *Deploy Build*をクリックします。

ビルドは選択した環境にデプロイされ、 `search` サービスが再起動すると、選択した環境にElasticsearchの設定、シェルスクリプト、プラグインが適用されます。

## 次のステップ

これで、DXPクラウド環境へのElasticsearch構成の移行は完了です。 次に、 [VPNサーバーの設定と接続を行います](./connecting-the-vpn.md).
