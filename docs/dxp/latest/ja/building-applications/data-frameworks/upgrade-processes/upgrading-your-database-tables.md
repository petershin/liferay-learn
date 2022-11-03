# データベーステーブルのアップグレード

{bdg-secondary}`Liferay DXP 7.4 U10以降およびLiferay Portal7.4 GA14以降で利用可能`

アプリケーションをアップグレードすると、データベースのテーブルを変更する必要がある場合があります。 Liferayのアップグレードフレームワークは、これらの変更を簡単に行うことができます。 サンプルプロジェクトをデプロイして、このアップグレード処理を確認します。 Liferayの以前のバージョンについては、 [Creating Upgrade Processes for Modules](https://help.liferay.com/hc/ja/articles/360031165751-Creating-Upgrade-Processes-for-Modules) を参照してください。

## バージョン1.0.0をデプロイする

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. [Upgrading Your Database Tables](./liferay-p5d2.zip) をダウンロードし、解凍してください。.

   ```bash
   curl https://learn.liferay.com/dxp/latest/ja/building-applications/data-frameworks/upgrade-processes/liferay-p5d2.zip -O
   ```

   ```bash
   unzip liferay-p5d2.zip
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
   STARTED com.acme.p5d2.api_1.0.0 [1030]
   STARTED com.acme.p5d2.service_1.0.0 [1031]
   ```

1. 外部データベースを使用している場合、アプリのテーブル列を確認します。 たとえば、MySQLの場合：

   ```sql
   SHOW COLUMNS FROM P5D2_P5D2Entry;
   ```

   ![データベースのテーブル列を確認します。](./upgrading-your-database-tables/images/01.png)

## 2.0.0へのアップグレード

1. ここで、2.0.0版をデプロイします。 `2.0.0`ディレクトリに移動し、ビルドとデプロイを行います。

   ```bash
   cd 2.0.0
   ```

   ```bash
   ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

1. Liferayにログインし、*［コントロールパネル］* &rarr; *［Gogo Shell］*でGogoシェルコンソールに移動します。

1. `upgrade:list com.acme.p5d2.service`というコマンドを入力し、2.0.0へのアップグレードが可能であることを確認します。

1. `upgrade:execute com.acme.p5d2.service`というコマンドを入力して、アップグレードを実行します。 Gogo シェルコンソールには、アップグレード処理の完了が表示されます。

   ![Gogoシェルでアップグレードを実行します。](./upgrading-your-database-tables/images/02.png)

1. データベースでテーブル列が更新されたことを確認できます。 たとえば、MySQLの場合：

   ```sql
   SHOW COLUMNS FROM P5D2_P5D2Entry;
   ```

   ![テーブル列が更新されたことを確認します。](./upgrading-your-database-tables/images/03.png)

## コードを調べる

サンプルプロジェクトでは、以下のテーブル列を簡単に変更するデモを行っています。

| 変更前                     | 変更後                      | コメント           |
|:----------------------- |:------------------------ |:-------------- |
| `able` (type: long)     | `able` (type: date)      | 列のデータ型が変更されます。 |
| `baker` (type: boolean) | -                        | 列がドロップされます。    |
| `foo` (type: string)    | `bar` (type: string)     | 列名が変更されます。     |
| -                       | `charlie` (type: string) | 新しい列が追加されます。   |

[1.0.0](./upgrading-your-database-tables/resources/liferay-p5d2.zip/1.0.0/p5d2-service/service.xml) と [2.0.0](./upgrading-your-database-tables/resources/liferay-p5d2.zip/2.0.0/p5d2-service/service.xml) の`service.xml`列の定義をと比較します。

### UpgradeStepRegistratorクラスの作成

`UpgradeStepRegistrator`クラスを作成し、 `UpgradeStepRegister` インターフェイスを実装してください。

```{literalinclude} ./upgrading-your-database-tables/resources/liferay-p5d2.zip/2.0.0/p5d2-service/src/main/java/com/acme/p5d2/internal/upgrade/P5D2EntryUpgrade.java
:language: java
:lines: 26-34
```

`register` メソッドをオーバーライドして、アプリのバージョンアップ登録を実装します。 必ず`@Component`アノテーションを使用し、 `UpgradeStepRegistrator.class`サービスとして特定します。

### UpgradeProcessクラスの作成

基本クラスを拡張する`UpgradeProcess`クラスを作成します。

```{literalinclude} ./upgrading-your-database-tables/resources/liferay-p5d2.zip/2.0.0/p5d2-service/src/main/java/com/acme/p5d2/internal/upgrade/v2_0_0/P5D2EntryUpgradeProcess.java
:language: java
:lines: 22-32
```

`doUpgrade()`メソッドをテーブルを変更する指示でオーバーライドします。 次の操作を使用できます。

| 機能                   | 説明           |
|:-------------------- |:------------ |
| alterColumnName      | 列名を変更します     |
| alterColumnType      | 列のデータ型を変更します |
| alterTableAddColumn  | 新しい列を追加します   |
| alterTableDropColumn | 列を削除します      |

```{warning}
MariaDBでは、`alterTableDropColumn`は機能しません。 これは [既知のバグ](https://github.com/liferay-upgrades/liferay-portal/pull/263/commits/9a59708c40e19b209d99eeee2f7e68a815d5cd1b) です。 代わりに [旧ガイドライン](https://help.liferay.com/hc/ja/articles/360031165751-Creating-Upgrade-Processes-for-Modules) に従ってください。
```

変更後、サービスビルダーを再実行します。 これで、アップグレードの構築とデプロイの準備が整いました。

## 複雑なアップグレードの管理

アップグレードの手順が多く複雑な場合は、 `getPreUpgradeSteps()` と `getPostUpgradeSteps()` メソッドを `UpgradeProcess` クラスで使用することを検討してください。 この方法は、アップグレードプロセスをよりコントロールしやすくします。 デバッグしやすいように、各アップグレードステップには `Release_` テーブルで異なるスキーマのバージョンが与えられています。 ステップに失敗してアップグレードを再実行する必要がある場合、アップグレード処理は自動的にチェックされ、最新の失敗ポイントからアップグレードを再開します。

例えば、Liferay の [OpenIdConnectSessionUpgradeProcess](https://github.com/liferay/liferay-portal/blob/master/modules/apps/portal-security-sso/portal-security-sso-openid-connect-persistence-service/src/main/java/com/liferay/portal/security/sso/openid/connect/persistence/internal/upgrade/v2_0_0/OpenIdConnectSessionUpgradeProcess.java) は、この機能を利用しています。

この例では、 `getPreUpgradeSteps()` が最初に実行され、新しいカラムを追加する簡単なステップを含んでいます。 `doUpgrade()` メソッドでは、新しいカラムの入力が行われます。 `doUpgrade()` メソッドが失敗した場合、開発者はデバッグして必要な変更を加え、アップグレードを再実行することができます。 プロセスは、最初のステップが成功したと認識し、自動的に次のステップに進みます。

注意：アップグレードステップを利用するために、 `com.liferay.portal.kernel.upgrade.UpgradeStep` クラスをアップグレード処理にインポートしてください。
