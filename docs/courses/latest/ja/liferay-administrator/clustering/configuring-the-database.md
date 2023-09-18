# データベースの設定

LiferayはMySQL、MariaDB、PostgreSQLのような多くのデータベースをサポートしています。 デフォルトでは、Liferayバンドルはデモ目的に適した組み込みHSQLデータベースを使用します。 本番環境で使用する場合は、別のデータベースを使用する必要があります。 詳しくは、 [データベースの設定](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/configuring-a-database) を参照のこと。

## DockerでMariaDBを実行する

1. MariaDBイメージを自動的にダウンロードして実行するには、このコマンドを実行する：

   ```bash
   docker run --name some-mariadb -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb:10.7
   ```

1. データベースサーバーにサインインする。

   ```bash
   docker exec -it some-mariadb bash -c "/usr/bin/mysql -uroot -pmy-secret-pw"
   ```

1. クラスタで使用するデータベースを作成します。

   ```bash
   create database dxp_db character set utf8;
   ```

1. 以下のコマンドでデータベースの作成を確認する：

   ```bash
   show databases;
   ```

   `dxp_db` データベースを含むデータベースのリストが表示されます。

次に、 [Elasticsearch](./configuring-search.md)を設定します。

## 関連コンセプト

- [データベースの設定](https://learn.liferay.com/w/dxp/installation-and-upgrades/installing-liferay/configuring-a-database)
- [クラスタノードのデータベース構成](https://learn.liferay.com/w/dxp/installation-and-upgrades/setting-up-liferay/clustering-for-high-availability/database-configuration-for-cluster-nodes)
