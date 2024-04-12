# データベース設定

デモンストレーション用のデフォルトでは、Liferay DXP/Portal は組み込みHSQLデータベースを使用するように構成されています。 デモの目的以外に、次のようなフル機能のサポートされているRDBMSを使用することをお勧めします。

* MariaDB
* MySQL
* Oracle
* PostgreSQL

```{note}
[Liferay DXP Compatibility Matrix](https://help.liferay.com/hc/ja/articles/360049238151) には、サポートされているデータベースとバージョンが一覧表示されています。
```

データベースに接続するには、次の手順が必要です。

* [データベース設定](#database-configuration)
* [JDBCコネクターのインストール](#install-a-jdbc-connector)
* [データソースの構成](#configuring-a-data-source)

## データベース設定

データベースを選択したら、次の手順に従って構成します。

* [UTF-8に対応している空のデータベースを作成する](#create-a-blank-database-with-utf-8-support)
* [データベースユーザーアクセスを設定する](#configure-database-user-access)
* [クエリ結果の並べ替え順序を設定する（オプション）](#configure-the-query-result-sort-order-optional)

```{important}
データベースを変更する前に、必ずデータベースベンダーのドキュメントを参照してください。
```

### UTF-8に対応している空のデータベースを作成する

多言語文字セットでは、UTF-8を使用する必要があります。 UTF-8を使用するデータベースを作成します。 MySQLコマンドの例は以下の通りです：

```sql
create database lportal character set utf8;
```

### データベースユーザーアクセスを設定する

Liferay DXPがデータを保持するには、データベースユーザーの認証情報が必要です。 最も単純で簡単な方法は、テーブルを作成および削除する権限を含む完全なデータベース権限を持つデータベースユーザーを使用することです。 このようなユーザーの場合、DXPプラグインはデータベースとシームレスに対話し、アップグレード操作は自動的に行われます。 データベースユーザーの権限をこれ以上制限することはお勧めしません。

ただし、組織によってデータベースの初期化後にLiferay DXPデータベースのユーザー権限を制限する必要がある場合は、次の高セキュリティデータベースユーザーのプラクティスを参照してください。

#### 高セキュリティデータベースユーザーのプラクティス

お客様の組織では、より厳しいセキュリティポリシーで、データベースが初期化された時点でLiferay DXPデータベースのユーザー権限を制限する必要があるかもしれません。 選択、挿入、更新、および削除操作の権限のみをユーザーに許可する場合は、データベースを手動で初期化および保守する必要があります。 これを実行するための推奨事項は次のとおりです。

1. Liferay DXPデータベースユーザーにデータベースに対して行うための完全な権限を付与します。

1. Liferay DXPをインストールして起動し、データベースに自動的にデータが入力されるようにします。

1. データベースにLiferay DXPテーブルが挿入されたら、選択、挿入、更新、および削除操作を実行する権限を除き、Liferay DXPデータベースユーザーからすべての権限を削除します。

```{warning}
Liferayのイベントの中には、これらの高いセキュリティのステップと互換性のないデータベースアクション（例えば、テーブルの作成と削除）を引き起こすものがあります。 これらのイベントは、Liferayデータベースのユーザーがデータベースに対するフルパーミッションを持っていることを必要とします。

| Event | How to Proceed | 
| :---- | :---------- | 
| [Publishing Object Definitions](../../building-applications/objects/creating-and-managing-objects/creating-objects.md#publishing-object-drafts) | Liferayデータベースユーザーが完全なデータベース権限を持っていない場合はObjectsを使用しないでください。 |
| テーブルを作成するプラグインをデプロイする | デプロイする前に、Liferayデータベースユーザーに完全な権限を付与し、デプロイ後にデータベースを再セキュアにします。 |
| Liferay をアップグレードする | アップグレードする前に、Liferay データベースユーザーに完全な権限を付与し、アップグレード後にデータベースを再セキュア化します。 |
```

### クエリ結果の並べ替え順序を設定する（オプション）

すべてのデータベースには、結果をソートするためのデフォルトの順序があります（ [この記事](https://help.liferay.com/hc/ja/articles/360029315971-Sort-Order-Changed-with-a-Different-Database) を参照）。 この順序が気になる場合は、データベースベンダーのドキュメントを参照して並べ替え順序を確認し、必要に応じて、Liferay DXPエンティティに適したデフォルトのクエリ結果順序を使用するようにデータベースを構成してください。

データベースサーバー、データベース、およびデータベースユーザーを構成しました。 Liferay DXPがデータベースとの通信に使用するJDBCコネクターをインストールする準備が整いました。

## JDBCコネクターをインストールする

Liferay DXPには、データベースと通信するためのJDBCコネクターが必要です。

### オープンソースデータベース

Liferay DXPバンドルには、いくつかのオープンソースJDBCコネクターが含まれています。 コネクターファイルは通常、Tomcatの`/lib/ext`またはJBoss EAPおよびWildFlyの`/module`などのアプリケーションサーバー上のグローバルフォルダに提供およびインストールされます。

OracleやDB2などの専用データベースに接続している場合は、ベンダーからコネクターをダウンロードして、アプリケーションサーバーのグローバルフォルダにインストールします。

**専用データベース：**

| データベース | コネクタ          | ベンダーサイト                                     | メモ                                                                                                                                                |
|:------ |:------------- |:------------------------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------- |
| DB2    | `db2jcc4.jar` | [IBM](https://www.ibm.com/)                 | ` dbc2jcc`コネクターは3.72以降廃止されました。                                                                                                                    |
| Oracle | `ojdbc8.jar`  | [Oracle](https://www.oracle.com/index.html) | [データ切り捨ての問題](https://issues.liferay.com/browse/LPS-79229) がCLOB列からデータを読み取って検出されたため、少なくともOracle 12.2.0.1.0 JDBC 4.2バージョンを備えた`ojdbc8.jar`ライブラリが必要です。 |

## データソースの構成

次の表にリストされている方法のいずれかを使用して、データソース接続を組み込んだDXPを構成できます。

| メソッド        | Dockerイメージで利用可能 | 本番環境に推奨 |
|:----------- |:--------------- |:------- |
| Docker環境変数  | はい              | はい      |
| ポータルプロパティ   | はい*             | はい      |
| セットアップウィザード | いいえ             | いいえ     |

### Docker環境変数

DXP環境変数をDockerイメージに渡すことで、組み込みのデータソース接続を構成できます。 例として、 [データベーステンプレート](./database-templates.md) を参照してください。

### ポータルプロパティ

[ポータルプロパティ](./portal-properties.md)ファイルを使用して、Liferay Tomcatバンドル、アプリケーションサーバーのインストール、またはDockerイメージでデータソース接続を構成できます。 例として、 [データベーステンプレート](./database-templates.md) を参照してください。

```{note}
Dockerイメージでポータルプロパティファイルを使用するには、バインドマウントまたはボリュームを使用してファイルを渡す必要があります。 詳細については、 [コンテナへのファイルの提供](../installing-liferay/using-liferay-docker-images/providing-files-to-the-container.md) を参照してください。
```

### セットアップウィザード

バンドルまたはアプリケーションサーバーで本番環境以外の目的でDXPを実行している場合は、セットアップウィザードを使用して[DXPの起動](../installing-liferay/running-liferay-for-the-first-time.md)時にデータソース接続を構成できます。

![セットアップウィザードのデータベースセクションでは、DXPの組み込みデータソースを構成できます。](./database-configurations/images/01.png)

```{note}
お使いのアプリケーションサーバーで管理されているデータソースを使用している場合は、アプリケーションサーバーの手順を参照してください：[Tomcat](../installing-liferay/installing-liferay-on-an-application-server/installing-on-tomcat.md)、[WildFly](../installing-liferay/installing-liferay-on-an-application-server/installing-on-wildfly.md)、[JBoss EAP](../installing-liferay/installing-liferay-on-an-application-server/installing-on-jboss-eap.md)、[WebLogic](../installing-liferay/installing-liferay-on-an-application-server/installing-on-weblogic.md)、または[WebSphere](../installing-liferay/installing-liferay-on-an-application-server/installing-on-websphere.md)
```
