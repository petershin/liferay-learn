# DXPクラスタの設定

2つのDockerコンテナを実行して、単純なクラスタ化環境を実証することができる。 詳しくは、 [高可用性のクラスタリング](https://learn.liferay.com/web/guest/w/dxp/installation-and-upgrades/setting-up-liferay/clustering-for-high-availability) を参照してください。

## 各ノードのElasticsearchの設定

1. Elasticsearch のデータボリュームをセットアップしたのと同じローカルフォルダ（つまり `[your_folder]`）に戻ってください。 新しいフォルダを2つ作る。

   ```bash
   mkdir -p liferay-1/files/osgi/configs liferay-2/files/osgi/configs
   ```

1. `liferay-1` ノード用の設定ファイルを生成する。

   ```bash
   cat <<EOT >> liferay-1/files/osgi/configs/com.liferay.portal.search.elasticsearch6.configuration.ElasticsearchConfiguration.config
   operationMode="REMOTE"
   transportAddresses="elasticsearch:9300"
   clusterName="LiferayElasticsearchCluster"
   EOT
   ```

1. `liferay-2` ノード用の設定ファイルを生成する。

   ```bash
   cat <<EOT >> liferay-2/files/osgi/configs/com.liferay.portal.search.elasticsearch6.configuration.ElasticsearchConfiguration.config
   operationMode="REMOTE"
   transportAddresses="elasticsearch:9300"
   clusterName="LiferayElasticsearchCluster"
   EOT
   ```

## 各クラスターノードの配置

1. `elasticsearch` と `some-mariadb` コンテナのIPアドレスを見つける。

   ```bash
   docker network inspect bridge
   ```

   以下の `[IP アドレス]` を `elasticsearch` と `some-mariadb`のそれぞれの IP アドレスに置き換えてください。

1. 最初の Liferay ノードを起動します。

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
      --name liferay-1 \
      -p 11311:11311 \
      -p 8009:8009 \
      -p 8080:8080 \
      -v $(pwd)/liferay-1:/mnt/liferay \
      liferay/portal:latest
   ```

1. 2番目のLiferayノードを起動します。

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
      --name liferay-2 \
      -p 11312:11311 \
      -p 9009:8009 \
      -p 9080:8080 \
      -v $(pwd)/liferay-2:/mnt/liferay \
      liferay/portal:latest
   ```

1. これで各ノードを訪問することができる。 `Liferay-1` は `http://localhost:8080`にある。 また、 `Liferay-2` は `http://localhost:9080`にあります。

   ![2つのノードはローカルにアクセスできる。](./configuring-the-dxp-cluster/images/01.png)

```{note}
2つのLiferay dockerノードを動かすには、デフォルトのCPUとメモリリソースの設定を増やす必要があるかもしれません。
```

## クラスタのテスト

クラスタでは、あるノードでコンテンツが作成または変更されると、他のノードでも利用できるようにする必要があります。 簡単なブログ記事を作成し、これを実際に見てみよう。

1. `Liferay-1` ノード（すなわち `http://localhost:8080`）で、 **Product Menu**(![Product Menu](../../images/icon-product-menu.png)) を開きます。 **コンテンツ & データ** の下にある **ブログ** をクリックする。

1. **追加**（![Add icon](../../images/icon-add.png)） をクリックします。

1. 以下の項目を追加する。

   * タイトルフー
   * コンテンツバー

［**保存**］ をクリックします。

1. `Liferay-2` ノード（すなわち `http://localhost:9080`）に切り替えます。 **Product Menu**(![Product Menu](../../images/icon-product-menu.png)) を開きます。 **コンテンツ & データ** の下にある **ブログ** をクリックする。

1. `Liferay-1` ノードで作成されたブログエントリーは `Liferay-2` ノードで表示されます。

   ![他のノードで作成されたブログ・エントリーが表示される。](./configuring-the-dxp-cluster/images/02.png)

これであなたのLiferay環境はクラスタ環境として構成されました。 次のステップであるノードのロードバランシングは、Liferayの外部で設定するため、このコースの範囲外であることに注意してください。 あなたはクラスタリングに関するこのモジュールを完了しました。

## 関連コンセプト

- [クラスター化されたインストールの維持](https://learn.liferay.com/ja/w/dxp/installation-and-upgrades/maintaining-a-liferay-installation/maintaining-clustered-installations)
