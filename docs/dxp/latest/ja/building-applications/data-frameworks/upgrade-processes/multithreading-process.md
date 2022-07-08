# マルチスレッド処理

{bdg-secondary}`Liferay DXP 7.4 U10以降およびLiferay Portal7.4 GA14以降で利用可能`

[アップグレードプロセス](../upgrade-processes.md)では、大規模なデータセットに複雑な変更を加える必要がある場合があります。 パフォーマンスがクリティカルな場合は、アプリケーションの`UpgradeProcess`クラスの`processConcurrently()`メソッドを使用するようにしてください。 このメソッドは複数のスレッドで実行されるため、アップグレードの時間を短縮することができます。

## バージョン1.0.0をデプロイする
```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. [マルチスレッド処理](./liferay-j7z3.zip) をダウンロードし、解凍してください。

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/upgrade-processes/liferay-j7z3.zip -O
    ```

    ```bash
    unzip liferay-j7z3.zip
    ```

1. `1.0.0`ディレクトリに移動し、ビルドとデプロイを行います。

   ```bash
   cd 1.0.0
   ```

   ```bash
   ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{note}
   このコマンドは、デプロイされたjarをDockerコンテナの/opt/liferay/osgi/modulesにコピーするのと同じです。
   ```

1. Liferay Dockerコンテナコンソールでデプロイを確認します。

    ```bash
    STARTED com.acme.j7z3.api_1.0.0 [1030]
    STARTED com.acme.j7z3.service_1.0.0 [1031]
    ```

## アプリにエントリーを追加する

1. *［コントロールパネル］* &rarr; *［サーバ管理］* &rarr; *［スクリプト］*でスクリプトコンソールに移動します。

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

   ![この3つのエントリーは、データベースのテーブルで確認することができます。](./multithreading-process/images/01.png)

## アップグレードの実行

1. `1.0.1`ディレクトリに移動し、ビルドとデプロイを行います。

   ```bash
   cd ../1.0.1    
   ```

   ```bash
   ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

1. *［コントロールパネル］* &rarr; *［Gogo シェル］*でGogoシェルコンソールに移動します。

1. `upgrade:list com.acme.j7z3.service`というコマンドを入力し、1.0.1へのアップグレードが可能であることを確認します。 1.0.1バージョンは、出力ウィンドウに登録されたアップグレードプロセスとして表示されます。

1. `upgrade:execute com.acme.j7z3.service`というコマンドを入力して、アップグレードを実行します。 ［出力］ウィンドウには、アップグレードが完了したことが表示されます。

   ![アップグレードを実行すると、アップグレードが完了したことが出力されます。](./multithreading-process/images/02.png)

1. J7Z3_J7Z3Entryテーブルのエントリーが更新されました。

   ![更新されたエントリーは、データベースのテーブルで確認することができます。](./multithreading-process/images/03.png)

## マルチスレッドメソッドの実装

アプリケーションの`UpgradeProcess`クラスで、`processConcurrently()`メソッドをオーバーライドしてください。

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

サンプルプロジェクトでは、 `name`フィールドを `processConcurrently()`メソッドで処理・変更する簡単な例を示しました。

1. `select j7z3EntryId, name from J7Z3_J7Z3Entry` - SQL文はすべてのエントリーを照会します。

1. ```java resultSet -> new Object[] { resultSet.getLong("j7z3EntryId"), resultSet.getString("name")
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
   `j7z3EntryId`ごとに、`name`フィールドを`baker`に設定しています。

1. 例外は、 `null`に設定されます。

`processConcurrently()`メソッドは2つの異なるシグネチャを持っていることに注意しましょう。 このチュートリアルの例に見られるように、1つのシグネチャはSQLクエリをソースとして渡します。 もう一つのシグネチャはソースとして配列を渡します。 詳細は、[BaseDBProcess javadocs](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/dao/db/BaseDBProcess.html#processConcurrently-java.lang.String-com.liferay.petra.function.UnsafeFunction-com.liferay.petra.function.UnsafeConsumer-java.lang.String-)を参照してください。
