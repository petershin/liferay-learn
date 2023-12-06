# クラスタノードのデータベース構成

最低限、DXPクラスタのノードが機能するためには、 [同じデータベースを共有するように構成されている](./example-creating-a-simple-dxp-cluster.md#configure-cluster-link-and-the-other-server-connections) (またはデータベースクラスタ)必要があります。ここで説明する最適化により、DXP クラスタのデータベース パフォーマンスをさらに向上させることができます。

```{warning}
クラスタリングは、組み込みHSQLデータベースでは機能しません。
```

## 読み書きデータベース構成

データベースのパフォーマンスを向上させるために、読み取り/書き込みデータベース構成を使用できます。 この戦略では、読み取り操作と読み取り/書き込み操作に同じデータソースを使用する代わりに、操作の種類ごとに個別のデータソースを使用します。 DXPのアスペクト指向プログラミング（AOP）トランザクションインフラストラクチャは、読み取りトランザクションを読み取りデータソースに送信し、読み取り/書き込みトランザクションを書き込みデータソースに送信します。

![読み書きデータベースの相互作用](./database-configuration-for-cluster-nodes/images/01.png)

次のセクションで説明するように、読み取りと読み取り/書き込み [データソース](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#JDBC) を分離する接続は、JDBCまたはJNDI [ポータルプロパティ](../../reference/portal-properties.md) （たとえば、 [`portal-ext.properties` ファイル](../../reference/portal-properties.md)）を使用して構成されます。 データソースは、DXPデータベースの個別のインスタンスを使用する必要があります。この場合、読み取り/書き込みデータベースインスタンスが読み取りデータベースインスタンスに複製されます。

### JDBC

次の手順に従って、`portal-ext.properties`ファイルを編集し、[JDBC](../../installing-liferay/configuring-a-database.md)を使用して別々の読み取りおよび書き込みデータソースに直接接続します。

1. 個別の読み取りおよび書き込みデータソースへのJDBC接続を構成します。 詳しくは、 [JDBCプロパティリファレンス](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#JDBC) を参照してください。 以下に例を示します。 

    ```properties
    jdbc.read.driverClassName=[place your driver name here]
    jdbc.read.url=[place the URL to your "read" database here]
    jdbc.read.username=[place your user name here]
    jdbc.read.password=[place your password here]

    jdbc.write.driverClassName=[place your driver name here]
    jdbc.write.url=[place the URL to your "read-write" database here]
    jdbc.write.username=[place your user name here]
    jdbc.write.password=[place your password here]
    ```

    ```{note}
    Liferayでは、接続プールプロバイダーとしてHikariCPを使用しています。
    ```

    JDBC接続値の例については、[データベース・テンプレート](../../reference/database-templates.md)を参照してください。

1. 読み取りプールと書き込みプールのタイムアウトとサイズの設定 

    ```properties
    jdbc.read.connectionTimeout=30000
    jdbc.read.idleTimeout=600000
    jdbc.read.maximumPoolSize=100
    jdbc.read.maxLifetime=0
    jdbc.read.minimumIdle=10
    jdbc.read.registerMbeans=true

    jdbc.write.connectionTimeout=30000
    jdbc.write.idleTimeout=600000
    jdbc.write.maximumPoolSize=100
    jdbc.write.maxLifetime=0
    jdbc.write.minimumIdle=10
    jdbc.write.registerMbeans=true
    ```

1. (**この手順は、DXP 7.4 U69 以下でのみ必要です**） DXP が書き込みデータソース（接頭辞が `jdbc.write.`であるデータソース）を使用して、 [カウンター](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Counter) データソースを作成するように構成します。 別のデータソースは常にカウンター専用です。 

    ```properties
    counter.jdbc.prefix=jdbc.write.
    ```

1. オプションで、データ接続を検証して、不正な接続が適切に処理されることを確認します。

1. (**この手順は、DXP 7.3 U22、DXP 7.4 U65以下の場合のみ必要です。**) デフォルトの [`spring.infrastructure.configs` Portal Properties](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring) を `portal-ext.properties` ファイルにコピーし、以下のSpring構成ファイルのパスを追加することで、リードライターのデータベース構成を有効にします。
   
   `spring.infrastructure.configs`に追加します。 

    ```
    META-INF/dynamic-data-source-infrastructure-spring.xml
    ```

詳細は、 [Spring構成のポータルプロパティ](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring) を参照してください。

### JNDI

次の手順に従って `portal-ext.properties` ファイルを編集し、JNDIを使用してアプリサーバーの読み取りおよび書き込みデータソースに接続します。

1. 読み取りおよび書き込みJNDIデータソースのユーザー名とパスワードを設定します。 

    ```properties
    jdbc.read.jndi.name=[place your "read" data source JNDI name here]

    jdbc.read.username=*[place your user name here]
    jdbc.read.password=[place your password here]

    jdbc.write.jndi.name=[place your "read-write" data source JNDI name here]

    jdbc.write.username=[place your user name here]
    jdbc.write.password=[place your password here]
    ```

1. 読み取りプールと書き込みプールのタイムアウトとサイズの設定 

    ```properties
    jdbc.read.connectionTimeout=30000
    jdbc.read.idleTimeout=600000
    jdbc.read.maximumPoolSize=100
    jdbc.read.maxLifetime=0
    jdbc.read.minimumIdle=10
    jdbc.read.registerMbeans=true

    jdbc.write.connectionTimeout=30000
    jdbc.write.idleTimeout=600000
    jdbc.write.maximumPoolSize=100
    jdbc.write.maxLifetime=0
    jdbc.write.minimumIdle=10
    jdbc.write.registerMbeans=true
    ```

1. (**この手順は、DXP 7.4 U69 以下でのみ必要です**） DXP が書き込みデータソース（接頭辞が `jdbc.write.`であるデータソース）を使用して、 [カウンター](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Counter) データソースを作成するように構成します。 別のデータソースは常にカウンター専用です。 

    ```properties
    counter.jdbc.prefix=jdbc.write.
    ```

1. オプションで、データ接続を検証して、不正な接続が適切に処理されることを確認します。

1. (**この手順は、DXP 7.4 U65以下またはDXP 7.3 U22以下の場合のみ必要です**） デフォルトの [`spring.infrastructure.configs` Portal Properties](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring) を `portal-ext.properties` ファイルにコピーし、以下のSpring構成ファイルのパスを追加して、リードライターのデータベース構成を有効にします。
   
   `spring.infrastructure.configs`に追加します。 

    ```
    META-INF/dynamic-data-source-infrastructure-spring.xml
    ```

詳細は、 [Spring構成のポータルプロパティ](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring) を参照してください。

DXPは、次回の起動時に、読み取りデータソース、書き込みデータソース、およびカウンターデータソースを使用します。

## データベースの複製

データベースクラスタを使用すると、フォールトトレランスとDXPのパフォーマンスが向上します。 データベースクラスタインスタンスは常に同期している必要があります。 レプリケーションは、変更されたデータと変更されたスキーマを1つのデータベースインスタンスから別のデータベースインスタンスにコピーするプロセスです。 サポートされるすべての [データベース](https://help.liferay.com/hc/ja/articles/360049238151) はレプリケーションをサポートします。 データベースクラスターを使用している場合は、データベースベンダーの指示に従って、データベースをレプリケーション用に設定します。

## 次のステップ

クラスター用のデータベースを設定したので、 [DXP クラスタリングの要件](../clustering-for-high-availability.md#clustering-requirements) に引き続き対処することができます。 次の要件は、すべてのノードが [ファイルストア](../../../system-administration/file-storage.md)にアクセスできるようにし、そのファイルストアで各ノードを構成することです。
