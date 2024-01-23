# マルチスレッド処理

{bdg-secondary}`liferay DXP 7.4 U10+ または Liferay Portal 7.4 GA14+`.

[アップグレードプロセス](../upgrade-processes.md) 大規模なデータセットに複雑な変更を加えることがあります。 パフォーマンスが重要な場合は、アプリケーションの `UpgradeProcess` クラスの `processConcurrently()` メソッドを使用してください。 このメソッドは複数のスレッドで実行されるため、アップグレードの時間を短縮することができます。

## バージョン1.0.0をデプロイする

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. [Multithreading Process](./liferay-j7z3.zip) をダウンロードして解凍する。

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/upgrade-processes/liferay-j7z3.zip -O
    ```

    ```bash
    unzip liferay-j7z3.zip
    ```

1. 1.0.0`ディレクトリに移動し、ビルドしてデプロイする。

    ```bash
    cd 1.0.0
    ```

    ```bash
    ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    !!! note
        このコマンドはDockerコンテナ上の/opt/liferay/osgi/modulesにデプロイされたjarをコピーするのと同じです。

1. Liferay Dockerコンテナコンソールでデプロイを確認します。

    ```bash
    STARTED com.acme.j7z3.api_1.0.0 [1030]
    STARTED com.acme.j7z3.service_1.0.0 [1031]
    ```

## アプリにエントリーを追加する

1. **コントロールパネル** &rarr; **サーバー管理** &rarr; **スクリプト** からスクリプトコンソールに移動します。

1. 以下のスクリプトを実行して、いくつかのエントリーを追加してください。

    ```groovy
    import com.acme.j7z3.service.J7Z3EntryLocalServiceUtil;

    import com.liferay.portal.kernel.dao.orm.QueryUtil;

    entry1 = J7Z3EntryLocalServiceUtil.createJ7Z3Entry(1);
    entry2 = J7Z3EntryLocalServiceUtil.createJ7Z3Entry(2);
    entry3 = J7Z3EntryLocalServiceUtil.createJ7Z3Entry(3);

    entry1.setName("able");
    entry2.setName("able");
    entry3.setName("able");

    J7Z3EntryLocalServiceUtil.addJ7Z3Entry(entry1);
    J7Z3EntryLocalServiceUtil.addJ7Z3Entry(entry2);
    J7Z3EntryLocalServiceUtil.addJ7Z3Entry(entry3);

    ```

    J7Z3_J7Z3Entryテーブルには、3つのエントリーが追加されました。

    ![The three entries can been verified in the database table.](./multithreading-process/images/01.png)

## アップグレードの実行

1. `1.0.1`ディレクトリに移動し、ビルドしてデプロイする。

    ```bash
    cd ../1.0.1
    ```

    ```bash
    ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

1. **コントロールパネル** &rarr; **Gogo Shell** でGogoシェルコンソールに移動します。

1. コマンド `upgrade:list com.acme.j7z3.service` を入力して、1.0.1 アップグレードが利用可能であることを確認します。 1.0.1バージョンは、出力ウィンドウに登録されたアップグレードプロセスとして表示されます。

1. コマンド `upgrade:execute com.acme.j7z3.service` を入力してアップグレードを実行します。 ［出力］ウィンドウには、アップグレードが完了したことが表示されます。

    ![Execute the upgrade and the output should display that the upgrade was completed.](./multithreading-process/images/02.png)

1. J7Z3_J7Z3Entryテーブルのエントリーが更新されました。

    ![The updated entries can been verified in the database table.](./multithreading-process/images/03.png)

## マルチスレッドメソッドの実装

アプリケーションの `UpgradeProcess` クラスで、`processConcurrently()` メソッドをオーバーライドする。

```{literalinclude} ./multithreading-process/resources/liferay-j7z3.zip/1.0.1/j7z3-service/src/main/java/com/acme/j7z3/internal/upgrade/v1_0_1/J7Z3EntryUpgradeProcess.java
    :dedent: 1
    :language: java
    :lines: 26-48
```

メソッドは4つのパートで構成されています。

1. SQLクエリ - データベースのデータを照会するためのSQL文。

1. オブジェクトを収集する - 結果セットを受け取り、結果セットに基づいたオブジェクトの配列を返します。

1. オブジェクトの処理 - オブジェクトの配列に対してビジネスロジックを実行します。

1. 例外 - 例外が発生した場合、メッセージを送信します。

サンプルプロジェクトでは、`processConcurrently()` メソッドによって `name` フィールドが処理され、変更される単純な例を示している。

1. `select j7z3EntryId, name from J7Z3_J7Z3Entry` - SQL 文は、すべてのエントリを照会します。

    1. ```java
    resultSet -> new Object[] {
        resultSet.getLong("j7z3EntryId"), resultSet.getString("name")
    ```
    オブジェクトは収集され、`resultSet`配列に格納されます。

1. ```java
    columns -> {
        long j7z3EntryId = (Long)columns[0];

        try (PreparedStatement preparedStatement =
    		connection.prepareStatement(
    			"update J7Z3_J7Z3Entry set name = ? where " +
    				"j7z3EntryId = ?")) {

    		preparedStatement.setString(1, "baker");
    		preparedStatement.setLong(2, j7z3EntryId);

    		preparedStatement.executeUpdate();
    	}
    }
   ```
   すべての `j7z3EntryId` に対して、`name` フィールドに `baker` が設定される。

1. 例外は `null` に設定される。

`processConcurrently()`メソッドには2つの異なるシグネチャがある。 このチュートリアルの例に見られるように、1つのシグネチャはSQLクエリをソースとして渡します。 もう一つのシグネチャはソースとして配列を渡します。 詳しくは [BaseDBProcess javadocs](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/dao/db/BaseDBProcess.html) を参照してください。