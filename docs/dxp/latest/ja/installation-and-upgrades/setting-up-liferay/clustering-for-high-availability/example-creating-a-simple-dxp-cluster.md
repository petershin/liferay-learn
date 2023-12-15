# 例：シンプルなDXPクラスターの作成

DXPクラスタリングを学習する簡単な方法は、 [Dockerコンテナ](https://docs.docker.com/get-started/overview/) を使用して、単一のマシンに2ノードのDXPクラスタ環境をセットアップすることです。 この例では、2 つの DXP サーバーコンテナと、データベース、検索エンジン、およびファイルストア用のサーバーコンテナを作成します。

| サーバータイプ | 実装            | コンテナ名           |
| :------ | :------------ | :-------------- |
| データベース  | MariaDB       | `some-mariadb`  |
| ファイルストア | DBStore       | `some-mariadb`  |
| 検索エンジン  | Elasticsearch | `elasticsearch` |
| DXPサーバー | Tomcat        | `dxp-1`         |
| DXPサーバー | Tomcat        | `dxp-2`         |

```{warning}
この例は学習を目的としたものであり、本番環境のユースケースには適していません。 本番環境では、DXPサーバーへのリクエストの負荷分散用にHTTPサーバーを含め、読み取り専用操作と読み取り/書き込み操作に別々のデータベースサーバーを使用し、データベースサーバー、ファイルストアサーバー、および検索エンジンサーバーのクラスタリングと負荷分散を検討する必要があります。 詳細については、 [高可用性のクラスタリング](../clustering-for-high-availability.md) を参照してください。
```

主な手順は次のとおりです。

1. [データベースサーバーの起動](#start-a-database-server)
1. [ファイル・ストア・サーバーの起動](#start-a-file-store-server)
1. [検索エンジン・サーバーの開始](#start-a-search-engine-server)
1. [各ノードのサーチエンジンの設定](#configure-the-search-engine-server-for-each-node)
1. [DXPクラスタの起動](#start-the-dxp-cluster)
1. [DXPクラスタのテスト](#test-the-dxp-cluster)

## データベースサーバーを起動する

DXPクラスターには、すべてのDXPクラスターノードからアクセスできるデータソースが必要です。 データソースは、JNDIデータソースにするか、データベースサーバーまたはデータベースサーバークラスターへの直接接続にすることができます。 DXP バージョンがサポートするデータベースサーバーについては、 [互換性マトリックス（](https://help.liferay.com/hc/ja/articles/360049238151) ）を参照してください。

データベースサーバーとDXPデータベースを作成します。

1. MariaDB Dockerコンテナを起動します。

   ```bash
   docker run --name some-mariadb -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb:10.2
   ```

1. コンテナ上のシェルで、 [DXPデータベースを作成](../../reference/database-configurations.md) します。

   データベースサーバーにサインインします。

   ```bash
   docker exec -it some-mariadb bash -c "/usr/bin/mysql -uroot -pmy-secret-pw"
   ```

   DXP用のデータベースを作成します。

   ```sql
   create database dxp_db character set utf8;
   ```

   データベースセッションを終了します。

   ```bash
   quit
   ```

   bashセッションを終了します。

   ```bash
   exit
   ```

データベースサーバーでDXP用の準備が整いました。 詳細については、 [クラスタ・ノードのデータベース構成](./database-configuration-for-cluster-nodes.md) を参照してください。

## ファイルストアサーバーを起動する

DXPクラスターには、すべてのDXPクラスターノードからアクセスできるファイルストアが必要です。 便宜上、この例では、DXPデータベースで構成された [DBStoreファイルストア](../../../system-administration/file-storage/other-file-store-types/dbstore.md) を使用しています。 この例ですでに起動しているデータベースサーバーには、ファイルストアが含まれています。 すべてのファイルストアタイプの構成については、 [ファイルストレージの構成](../../../system-administration/file-storage.md) を参照してください。

## 検索エンジンサーバーを起動する

DXPクラスターには、すべてのDXPクラスターノードからアクセス可能な検索エンジン（個別のプロセスとして実行）が必要です。 詳しくは、 [検索エンジンのインストール](../../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md) を参照してください。

Elasticsearchサーバーを作成して設定します。

1. Elasticsearchサーバーのデータボリュームを保存するためのローカルフォルダを設定します。 例えば、

   ```bash
   mkdir -p elasticsearch/es_data_volume
   ```

1. Elasticsearchコンテナ `elasticsearch` を起動する。

   ```bash
   docker run -it --name elasticsearch -p 9200:9200 -p 9300:9300 -e cluster.name=LiferayElasticsearchCluster -e ES_JAVA_OPTS="-Xms512m -Xmx512m" -v $(pwd)/elasticsearch/es_data_volume:/var/lib/elasticsearch/data elasticsearch:6.8.7
   ```

   ```{note}
   コンテナが`max virtual memory areas vm.max_map_count [xxxxx] is too low, increase to at least [xxxxxx]`と報告してきたら、`sudo sysctl -w vm.max_map_count=[xxxxxx]`のようなコマンドを使って `vm.max_map_count`を十分な値に設定してください。 次に、コンテナを起動します。
   ```

1. 必要なElasticsearchプラグインをインストールします。

   ```bash
   docker exec -it elasticsearch bash -c '/usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-kuromoji && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-smartcn && /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-stempel'
   ```

検索エンジンは検索インデックスを管理する準備ができました。

## ノードごとに検索エンジンサーバーを設定する

各DXPノードにElasticsearchを設定するには、 [設定ファイル](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) を使用します。

1. 設定ファイルの場所を作成します。

   ```bash
   mkdir -p dxp-1/files/osgi/configs dxp-2/files/osgi/configs
   ```

1. `dxp-1`サーバノードにElasticsearchを設定する。

   ```bash
   cat <<EOT >> dxp-1/files/osgi/configs/com.liferay.portal.search.elasticsearch6.configuration.ElasticsearchConfiguration.config
   operationMode="REMOTE"
   transportAddresses="elasticsearch:9300"
   clusterName="LiferayElasticsearchCluster"
   EOT
   ```

1. `dxp-2`サーバノードにElasticsearchを設定する。

   ```bash
   cat <<EOT >> dxp-2/files/osgi/configs/com.liferay.portal.search.elasticsearch6.configuration.ElasticsearchConfiguration.config
   operationMode="REMOTE"
   transportAddresses="elasticsearch:9300"
   clusterName="LiferayElasticsearchCluster"
   EOT
   ```

これらの設定ファイルを、DXPサーバーコンテナのバインドマウントを介してクラスターノードからアクセスできるようにします。

```{note}
後でDXPサーバで使用する `docker run --add-host elasticsearch:[ip] ...` コマンドは `elasticsearch` という名前とElasticsearchサーバのホストIPアドレスを対応付ける `/etc/hosts/` エントリを追加します。
```

## DXPクラスターを開始する

1. [`docker network inspect bridge`](https://docs.docker.com/engine/reference/commandline/network_inspect/) コマンドを実行して、`elasticsearch` と `some-mariadb` コンテナのコンテナ IP アドレスを取得する。 `ブリッジ`ネットワークはデフォルトのネットワークである。

   ```{important}
   以下の `docker run` コマンドで、`[IP アドレス]` を `elasticsearch` と `some-mariadb` コンテナの IP アドレスに置き換える。
   ```

2. `dxp-1`を開始する。

   読みやすいように拡張されたコマンド：

   ```bash
   docker run -it \
      --add-host elasticsearch:[IP address] \
      --add-host some-mariadb:[IP address] \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME="" \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=org.mariadb.jdbc.Driver \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:mariadb://some-mariadb:3306/dxp_db?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false" \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=root \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD=my-secret-pw \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_ENABLED=true \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_CONTROL=control-channel-logic-name-1 \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_TRANSPORT_PERIOD_NUMBER0=transport-channel-logic-name-1 \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_AUTODETECT_PERIOD_ADDRESS=some-mariadb:3306 \
      -e LIFERAY_WEB_PERIOD_SERVER_PERIOD_DISPLAY_PERIOD_NODE=true \
      -e LIFERAY_DL_PERIOD_STORE_PERIOD_IMPL=com.liferay.portal.store.db.DBStore \
      --name dxp-1 \
      -p 11311:11311 \
      -p 8009:8009 \
      -p 8080:8080 \
      -v $(pwd)/dxp-1:/mnt/liferay \
      [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
   ```

   1行に凝縮されたコマンド：

   ```bash
   docker run -it --name dxp-1 --add-host elasticsearch:[IP address] --add-host some-mariadb:[IP address] -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME="" -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=org.mariadb.jdbc.Driver -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:mariadb://some-mariadb:3306/dxp_db?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false" -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=root -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD=my-secret-pw -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_ENABLED=true -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_CONTROL=control-channel-logic-name-1 -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_TRANSPORT_PERIOD_NUMBER0=transport-channel-logic-name-1 -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_AUTODETECT_PERIOD_ADDRESS=some-mariadb:3306 -e LIFERAY_WEB_PERIOD_SERVER_PERIOD_DISPLAY_PERIOD_NODE=true -e LIFERAY_DL_PERIOD_STORE_PERIOD_IMPL=com.liferay.portal.store.db.DBStore --name dxp-1 -p 11311:11311 -p 8009:8009 -p 8080:8080 -v $(pwd)/dxp-1:/mnt/liferay [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
   ```

3. `dxp-2`を起動する。

   読みやすいように拡張されたコマンド：

   ```bash
   docker run -it \
      --add-host elasticsearch:[IP address] \
      --add-host some-mariadb:[IP address] \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME="" \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=org.mariadb.jdbc.Driver \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:mariadb://some-mariadb:3306/dxp_db?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false" \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=root \
      -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD=my-secret-pw \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_ENABLED=true \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_CONTROL=control-channel-logic-name-2 \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_TRANSPORT_PERIOD_NUMBER0=transport-channel-logic-name-2 \
      -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_AUTODETECT_PERIOD_ADDRESS=some-mariadb:3306 \
      -e LIFERAY_WEB_PERIOD_SERVER_PERIOD_DISPLAY_PERIOD_NODE=true \
      -e LIFERAY_DL_PERIOD_STORE_PERIOD_IMPL=com.liferay.portal.store.db.DBStore \
      --name dxp-2 \
      -p 11312:11311 \
      -p 9009:8009 \
      -p 9080:8080 \
      -v $(pwd)/dxp-2:/mnt/liferay \
      [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
   ```

   1行に凝縮されたコマンド：

   ```bash
   docker run -it --add-host elasticsearch:[IP address] --add-host some-mariadb:[IP address] -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME="" -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS_UPPERCASEN_AME=org.mariadb.jdbc.Driver -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL="jdbc:mariadb://some-mariadb:3306/dxp_db?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false" -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=root -e LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD=my-secret-pw -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_ENABLED=true -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_CONTROL=control-channel-logic-name-2 -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME_PERIOD_TRANSPORT_PERIOD_NUMBER0=transport-channel-logic-name-2 -e LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_AUTODETECT_PERIOD_ADDRESS=some-mariadb:3306 -e LIFERAY_WEB_PERIOD_SERVER_PERIOD_DISPLAY_PERIOD_NODE=true -e LIFERAY_DL_PERIOD_STORE_PERIOD_IMPL=com.liferay.portal.store.db.DBStore --name dxp-2 -p 11312:11311 -p 9009:8009 -p 9080:8080 -v $(pwd)/dxp-2:/mnt/liferay [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
   ```

`--add-host [domain]:[IP address]`オプション [ドメイン名とIPアドレスを対応させる`/etc/hosts`ファイルエントリ](https://docs.docker.com/engine/reference/run/#managing-etchosts) を追加する。 これにより、設定（環境変数、ポータルのプロパティ、`.config\`ファイルなど）がドメイン名でサーバーを参照できるようになる。

`-e [variable]=[value]` オプションは DXP コンテナの環境変数を設定する。 詳しくは [付録A：環境設定](#appendix-a-environment-settings) ]を参照のこと。

DXPクラスターノードコンテナには、このような独自の設定があります：

| 設定                        | dxp-1                          | dxp-2                          |
| :------------------------ | :----------------------------- | :----------------------------- |
| AJPポートマッピング               | `8009:8009`                    | `9009:8009`                    |
| HTTPポートマッピング              | `8080:8080`                    | `9080:8080`                    |
| OSGiコンテナポートマッピング          | `11311:11311`                  | `11312:11311`                  |
| バインドマウント                  | `$(pwd)/dxp-1:/mnt/liferay`    | `$(pwd)/dxp-2:/mnt/liferay`    |
| クラスターリンク制御チャネルのロジック名      | control-channel-logic-name-1   | control-channel-logic-name-2   |
| クラスターリンクトランスポートチャネルのロジック名 | transport-channel-logic-name-1 | transport-channel-logic-name-2 |

### DXPノードにアクセスする

DXPクラスターノードは、次のURLで入手できます。

* DXP-1：http://localhost:8080
* DXP-2：http://localhost:9080

次の図は、クラスターノードのホームページを示しています。

![DXP cluster nodes.](./example-creating-a-simple-dxp-cluster/images/01.png)

各ノードのコンテナIDとポート（`Node: [id]:[port]`）は各ページの下部に表示される。 `LIFERAY_WEB_PERIOD_SERVER_PERIOD_DISPLAY_PERIOD_NODE=true`環境設定は、この表示機能を有効にした。 コンテナのIDは、 [`docker container ls`](https://docs.docker.com/engine/reference/commandline/container_ls/) コマンドを使って見つけることができる。

### コンテンツを検索エンジンにインデックス付けする

1._コントロールパネル_&rarr;_設定_&rarr;_検索_に移動します。

1. Index Actionsタブで、_Reindex all search indexes_と_Reindex all spell check indexes_をクリックします。

コンテンツは検索エンジンにインデックス付けされます。 詳しくは [検索の概要](../../../using-search/getting-started/search-overview.md) を参照。

## DXPクラスターをテストする

ノード間のデータ同期をテストします。

1. クラスタノードの1つにコンテンツを追加します。 例えば、_New Stuff_という新しいウィジェットページを追加し、そこにLanguage Selectorウィジェットを追加します。

1. 他のクラスターノードのUIを更新します。

両方のノードに同じ新しいコンテンツが表示されます。

![Content is synchronized between the cluster nodes.](./example-creating-a-simple-dxp-cluster/images/02.png)

これで作業中の DXPクラスタを作成できました！

## 次のステップ

[DXP クラスタ用にデータベース](./database-configuration-for-cluster-nodes.md) を設定します。

## 付録A：環境設定

DXPサーバーコンテナの例では、これらの設定を使用します。

| 設定                                                                                                                                                              | 説明                                |
| :-------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------- |
| LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_JNDI_PERIOD_NAME=                                                                                                     | データソースJNDI名                       |
| LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_DRIVER_UPPERCASEC_LASS\\<br>_UPPERCASEN_AME=\\<br>org.mariadb.jdbc.Driver                                          | データベースドライバークラス                    |
| LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_URL=\\<br>jdbc:mariadb://some-mariadb:3306/dxp_db?\\<br>useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false | データソースURL                         |
| LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=\\<br>root                                                                                                     | データベース管理者のユーザー名                   |
| LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_USERNAME=\\<br>root | Database admin user name |
| LIFERAY_JDBC_PERIOD_DEFAULT_PERIOD_PASSWORD=\\<br>my-secret-pw                                                                                         | データベース管理者ユーザーのパスワード               |
| LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_ENABLED=\\<br>true                                                                                                      | クラスタリンクを有効にする                     |
| LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME\\<br>_PERIOD_CONTROL=\\<br>control-channel-logic-name-2                          | クラスターノードの一意のコントロールチャネル名           |
| LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_CHANNEL_PERIOD_LOGIC_PERIOD_NAME\\<br>_PERIOD_TRANSPORT_PERIOD_NUMBER0=\\<br>transport-channel-logic-name-2     | クラスターノードの一意のトランスポートチャネル名          |
| LIFERAY_CLUSTER_PERIOD_LINK_PERIOD_AUTODETECT_PERIOD_ADDRESS=\\<br>some-mariadb:3306                                                                     | クラスターノードアドレスを取得するためにpingする既知のアドレス |
| LIFERAY_WEB_PERIOD_SERVER_PERIOD_DISPLAY_PERIOD_NODE=\\<br>true                                                                                          | サーバーアドレスとウェブサーバーポートを表示します         |
| LIFERAY_DL_PERIOD_STORE_PERIOD_IMPL=\\<br>com.liferay.portal.store.db.DBStore                                                                             | ファイルストア（ドキュメントライブラリストア）クラス        |

詳細については、Env/ [Portal Property](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 定義を参照のこと。

## 関連トピック

* [クラスタノードのデータベース構成](./database-configuration-for-cluster-nodes.md)
* [クラスタリンクの設定](./configuring-cluster-link.md)
