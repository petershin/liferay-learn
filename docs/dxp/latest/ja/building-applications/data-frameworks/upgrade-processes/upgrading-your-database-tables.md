# データベーステーブルのアップグレード

{bdg-secondary}`liferay DXP 7.4 U10+ または Liferay Portal 7.4 GA14+`.

アプリケーションをアップグレードすると、データベースのテーブルを変更する必要がある場合があります。 Liferayのアップグレードフレームワークは、これらの変更を簡単に行うことができます。 サンプルプロジェクトをデプロイして、このアップグレード処理を確認します。 以前のバージョンの Liferay については [Creating Upgrade Processes for Modules](https://help.liferay.com/hc/ja/articles/360031165751-Creating-Upgrade-Processes-for-Modules) を参照してください。

## バージョン1.0.0をデプロイする

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順に従います。

1. [データベーステーブルのアップグレード](./liferay-p5d2.zip) をダウンロードして解凍する。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/upgrade-processes/liferay-p5d2.zip -O
   ```

   ```bash
   unzip liferay-p5d2.zip
   ```

1. `1.0.0`ディレクトリに移動し、ビルドしてデプロイする。

   ```bash
   cd 1.0.0
   ```

   ```bash
   ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```{note}
   このコマンドはDockerコンテナ上の/opt/liferay/osgi/modulesにデプロイされたjarをコピーするのと同じです。
   ```

1. Liferay Dockerコンテナコンソールでデプロイを確認します。

   ```bash
   STARTED com.acme.p5d2.api_1.0.0 [1030]
   STARTED com.acme.p5d2.service_1.0.0 [1031]
   ```

1. 外部データベースを使用している場合、アプリのテーブル列を確認します。 たとえば、MySQLの場合：

   ```sql
   SHOW COLUMNS FROM P5D2_P5D2Entry;
   ```

   ![Verify the table columns in your database.](./upgrading-your-database-tables/images/01.png)

## 2.0.0へのアップグレード

1. ここで、2.0.0版をデプロイします。 `2.0.0`ディレクトリに移動し、ビルドしてデプロイする。

   ```bash
   cd 2.0.0
   ```

   ```bash
   ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

1. Liferay にログインし、 **Control Panel** &rarr; **Gogo Shell** から Gogo シェルコンソールに移動します。

1. コマンド `upgrade:list com.acme.p5d2.service` を入力して、2.0.0 アップグレードが利用可能であることを確認します。

1. アップグレードを実行するには、`upgrade:execute com.acme.p5d2.service` コマンドを入力します。 Gogo シェルコンソールには、アップグレード処理の完了が表示されます。

   ![Execute the upgrade in Gogo shell.](./upgrading-your-database-tables/images/02.png)

1. データベースでテーブル列が更新されたことを確認できます。 たとえば、MySQLの場合：

   ```sql
   SHOW COLUMNS FROM P5D2_P5D2Entry;
   ```

   ![Verify the table columns have been updated.](./upgrading-your-database-tables/images/03.png)

## コードを調べる

サンプルプロジェクトでは、以下のテーブル列を簡単に変更するデモを行っています。

| 次よりも前                                      | 繰り返す回数                                  | コメント           |
| :----------------------------------------- | :-------------------------------------- | :------------- |
| `able` (タイプ: long)      | `可能` (タイプ: 日付)       | 列のデータ型が変更されます。 |
| `baker` (type: boolean) | -                                       | 列がドロップされます。    |
| `foo` (タイプ: 文字列)        | `bar` (type: string) | 列名が変更されます。     |
| *                                          | `charlie` (タイプ: 文字列) | 新しい列が追加されます。   |

[1.0.0](./upgrading-your-database-tables/resources/liferay-p5d2.zip/1.0.0/p5d2-service/service.xml) と [2.0.0](./upgrading-your-database-tables/resources/liferay-p5d2.zip/2.0.0/p5d2-service/service.xml) の `service.xml` のカラム定義を比較する。

### UpgradeStepRegistratorクラスの作成

`UpgradeStepRegister`インターフェースを実装する`UpgradeStepRegistrator` クラスを作成する。

```{literalinclude} ./upgrading-your-database-tables/resources/liferay-p5d2.zip/2.0.0/p5d2-service/src/main/java/com/acme/p5d2/internal/upgrade/P5D2EntryUpgrade.java
:language: java
:lines: 26-34
```

アプリのアップグレード登録を実装するために `register` メソッドをオーバーライドします。 必ず `@Component` アノテーションを使用し、`UpgradeStepRegistrator.class` サービスとして識別してください。

### UpgradeProcessクラスの作成

基底クラスを継承した `UpgradeProcess` クラスを作成する。

```{literalinclude} ./upgrading-your-database-tables/resources/liferay-p5d2.zip/2.0.0/p5d2-service/src/main/java/com/acme/p5d2/internal/upgrade/v2_0_0/P5D2EntryUpgradeProcess.java
:language: java
:lines: 22-32
```

`doUpgrade()`メソッドをオーバーライドして、テーブルを修正する。 次の操作を使用できます。

| 関数                   | 説明           |
| :------------------- | :----------- |
| alterColumnName      | 列名を変更します     |
| alterColumnType      | 列のデータ型を変更します |
| alterTableAddColumn  | 新しい列を追加します   |
| alterTableDropColumn | 列を削除します      |

```{warning}
MariaDBでは、`alterTableDropColumn`は機能しません。 これは [既知のバグです](https://github.com/liferay-upgrades/liferay-portal/pull/263/commits/9a59708c40e19b209d99eeee2f7e68a815d5cd1b) 。 代わりに [以前のガイドライン](https://help.liferay.com/hc/ja/articles/360031165751-Creating-Upgrade-Processes-for-Modules) 。
```

変更後、サービスビルダーを再実行します。 これで、アップグレードの構築とデプロイの準備が整いました。

## 複雑なアップグレードの管理

アップグレードが複雑で多くのステップが必要な場合は、 `UpgradeProcess` クラスで `getPreUpgradeSteps()` メソッドと `getPostUpgradeSteps()` メソッドを使用することを検討してください。 このアプローチは、アップグレードプロセスをよりコントロールしやすくします。 各アップグレードステップには、デバッグしやすいように `Release_` テーブルに異なるスキーマバージョンが与えられます。 ステップに失敗し、アップグレードを再実行しなければならない場合、アップグレード処理は自動的にチェックし、最新の失敗ポイントからアップグレードを再開します。

例えば、Liferay の [OpenIdConnectSessionUpgradeProcess](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-security-sso/portal-security-sso-openid-connect-persistence-service/src/main/java/com/liferay/portal/security/sso/openid/connect/persistence/internal/upgrade/v2_0_0/OpenIdConnectSessionUpgradeProcess.java) はこの機能を利用しています。

この例では、最初に `getPreUpgradeSteps()` が実行され、新しいカラムを追加する単純なステップが含まれる。 `doUpgrade()`メソッドでは、新しいカラムにデータを入力する。 `doUpgrade()`メソッドが失敗した場合、開発者はデバッグして必要な変更を加え、アップグレードを再実行することができます。 プロセスは、最初のステップが成功したことを認識し、自動的に次のステップに進む。

アップグレードステップを利用するには、アップグレードプロセスに `import com.liferay.portal.kernel.upgrade.UpgradeStep` クラスをインポートしてください。
