# データベースアップグレードツールの使用

Liferayデータベースアップグレードツールは、Liferay DXPデータベースおよびLiferay Portalデータベースをオフラインでアップグレードするためのクライアントプログラムです。

```{important}
アップグレードする前に、**必ず**データとインストールを[バックアップ](../../maintaining-a-liferay-installation/backing-up.md)してください。 バックアップコピーでアップグレードプロセスをテストすることをお勧めします。
```

```{important}
6.2以前からアップグレードする場合は、ファイルストアの構成を更新します。 詳細については、[ファイルストアの更新](../reference/file-store-updates.md) を参照してください。
```

Liferayインスタンスから切り離された状態でデータベースを変更すると、[データベースをアップグレード操作用に調整](../upgrade-stability-and-performance/database-tuning-for-upgrades.md)し、[不要なデータ（Webコンテンツ、ドキュメントなどの不要なバージョンなど）を削除](../upgrade-stability-and-performance/database-tuning-for-upgrades.md)して、アップグレードのパフォーマンスを向上させ、アップグレードの問題を解決できます。  これらのアクティビティは、DXPをはじめとする大規模で重要なポータル環境を安全かつ迅速にアップグレードするために特に重要です。 データベースの調整と削除を考慮し、 [アップグレードの基本](../upgrade-basics.md) で説明されている関連タスクを完了すると、新しいインストールをセットアップし、アップグレードツールを使用してデータベースをアップグレードする準備が整います。

[新しいLiferay Dockerイメージにアップグレード](../../installing-liferay/using-liferay-docker-images/upgrading-to-a-new-docker-image.md)していて、アップグレードツールを使用する場合は、新しいLiferayバージョンの[Liferay Tomcat Bundle](../../installing-liferay/installing-a-liferay-tomcat-bundle.md)からそのツールを使用します。 このツールは、バンドルの`tools/portal-tools-db-upgrade-client`フォルダにあります。

新しいLiferayリリースをアプリケーションサーバーにインストールした場合は、`[Liferay Home]/tools/portal-tools-db-upgrade-client`フォルダを作成し、アップグレードツールをダウンロードして、ツールを新しいフォルダにインストールします。

| 編集                     | ダウンロード手順                                                                                                                                                                                                                               |
|:---------------------- |:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Liferay DXP（サブスクリプション） | [**ダウンロード** ページ](https://customer.liferay.com/group/customer/downloads) に移動し、DXPバージョンと **製品/サービスパック** のファイルタイプを選択します。 表示されるリストで、 **Liferay DXPアップグレードクライアント** 用の ［**ダウンロード**］ をクリックします。                                                                |
| Liferay Portal         | [**ダウンロード** ページ](https://www.liferay.com/downloads-community) に移動します。 ［**Liferay Portal**］ ダウンロードメニューで、 ［**Other files**］ を選択して、 ［**ダウンロード**］ をクリックします。 最新のLiferay PortalのリリースアセットのGitHubページが表示されます。 `liferay-ce-portal-tools-[version].zip`をクリックします。 |

## 新規インストール時の設定

1. 新しいLiferayインストールの`[Liferay Home]/data`フォルダを[バックアップ](../../maintaining-a-liferay-installation/backing-up.md)の`[Liferay Home]/data`フォルダに置き換えます。

1. DXPアクティベーションキー(Subscription)と[OSGi設定ファイル](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)を [バックアップ](../../maintaining-a-liferay-installation/backing-up.md#liferay-home) から新しいインストールにコピーします。

1. 7.2にアップグレードする場合は、新しいインストールの`[Liferay Home]/files/osgi/configigs/`フォルダにある[設定ファイル](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)を使って検索インデックスを無効にします。例えば、こうだ、

    ```bash
    cd liferay-home
    ```

    ```bash
    mkdir -p osgi/configs
    ```

    ```bash
    echo "indexReadOnly=\"true\"" >> osgi/configs/com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config
    ```

    ```{note}
    DXP/Portal 7.3以降は、検索インデックスが自動的に無効/再有効化されます。
    ```

1. [Commerce](https://learn.liferay.com/w/commerce/index) を使用している場合は、Commerceをアップグレードする準備をしてください。  詳細については、 [Liferay Commerceのアップグレード](https://learn.liferay.com/w/commerce/installation-and-upgrades/upgrading-liferay-commerce) を参照してください。

1. Liferayデータベースのアップグレードと一緒にマーケットプレイスアプリのデータをアップグレードする場合は、新しいLiferayバージョンの対象となる各アプリの最新バージョンを[ダウンロード](../../../system-administration/installing-and-managing-apps/installing-apps/downloading-apps.md)して、`[Liferay Home]/deploy`フォルダにコピーします。 それ以外の場合は、 [アップグレード後の考慮事項](./post-upgrade-considerations.md) で説明されているように、データベースのアップグレード後にアプリをインストールし、データをアップグレードできます。 

1. [高度なファイルシステムストア](../../../system-administration/file-storage.md)または[簡易ファイルシステムストア](../../../system-administration/file-storage/other-file-store-types/simple-file-system-store.md)を使用していて、保存場所を変更している場合は、ファイルストアの設定を [`.config`ファイル](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) にエクスポートして、新しい`[Liferay Home]/osgi/configs/`フォルダにコピーします。 

    ```{important}
    [高度なファイルシステムストア](../../../system-administration/file-storage.md)を使用している場合は、データベースをアップグレードする前に、新しいインストールで`.config`ファイルを使って設定する必要があります。

    以下に例を示します。
    必要な`rootDir`パラメーターを含む`com.liferay.portal.store.file.system.configuration.AdvancedFileSystemStoreConfiguration.config`ファイル： 

    `rootDir="data/document_library"`
    ```

1. データベースベンダーが推奨するJDBCドライバーを使用してください。 たとえば、MySQLを使用している場合は、[`portal-ext.properties`](../../reference/portal-properties.md)ファイルで`jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver`を設定し、アプリケーションサーバーが使用するMySQL JDBCドライバーのJARを置き換えます。 詳細は、 [データベースドライバー](../migrating-configurations-and-properties.md#database-drivers) を参照してください。

   アップグレードツールのプロンプトに応答するか、 [アップグレードプロパティファイルを使用](../reference/database-upgrade-tool-reference.md#manual-configuration) して、アップグレードを構成できます。 

    ```{note}
    [新しいLiferay Dockerイメージにアップグレードする](../../installing-liferay/using-liferay-docker-images/upgrading-to-a-new-docker-image.md)場合は、Docker環境変数の代わりに[ポータルプロパティ](../../reference/portal-properties.md)ファイルを使用してデータベース接続を指定してください。 [ポータルプロパティリファレンス](https://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html) には、各Liferay環境変数に対応するポータルプロパティが一覧表示されています。
    ```

2. (オプ シ ョ ナル） [アップグ レー ド 報告](../reference/upgrade-report.md)を有効にす る には、 `tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties` フ ァ イ ルで `upgrade.report.enabled=true` を設定 し ます。

3. (オプ シ ョ ナル） [アップグレードログコンテキス ト](../reference/upgrade-log-context.md)を有効にするには、 `/tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties` ファイルで、 `upgrade.log.context.enabled=true` を設定します。

### バッチインサートのプロパティ

`portal-upgrade-database.properties`ファイルで、JDBC構成のバッチインサートプロパティを有効にすることができます。 これは、INSERTステートメントのバッチ処理により実行を高速化することにより、パフォーマンスを向上させるものです。 ベンダーのプロパティパラメータについては、以下の表を参照してください。 この機能は、DB2およびOracleデータベースでは使用できません。

| データベースプロバイダー | プロパティ                            |
|:------------ |:-------------------------------- |
| MariaDB      | `rewriteBatchedStatements=true`  |
| MySQL        | `rewriteBatchedStatements=true`  |
| PostgreSQL   | `reWriteBatchedInserts=true`     |
| SQL Server   | `useBulkCopyForBatchInsert=true` |

```{note}
バッチインサートプロパティは、Liferay 7.4 U60+/GA60+ の [`portal-upgrade-database.properties`](https://github.com/liferay/liferay-portal/blob/master/modules/util/portal-tools-db-upgrade-client/properties/portal-upgrade-database.properties) ファイルに含まれています。
```

## アップグレードツールの実行

```{important}
Liferay 7.4 U82/GA82 以降では、`db_upgrade.sh` ファイルの名前が `db_upgrade_client.sh` に変更されました。
```

アップグレードツールの設定は、コマンドラインインターフェイスで行うか、 [プロパティファイル](../reference/database-upgrade-tool-reference.md#manual-configuration) を使って行います。

`[Liferay Home]/tools/portal-tools-db-upgrade-client` フォルダにある `db_upgrade_client.sh` スクリプトがアップグレードツールを起動します (`db_upgrade_client.bat` on Windows)。 `--help`オプションは、ツールの使用状況を説明します。

```bash
./db_upgrade_client.sh --help
```

ここでは、アップグレードツールを使ってデータベースをアップグレードする方法を説明しています。

1. アップグレードツールを起動します。 次にコマンドの例を示します。 

    ```bash
    cd liferay-home/tools/portal-tools-db-upgrade-client
    ```

    ```bash
    ./db_upgrade_client.sh -j "-Dfile.encoding=UTF-8 -Duser.timezone=GMT -Xmx4096m"
    ```

   上記のコマンドは、アプリケーションサーバーで推奨されているのと同じ JVM オプションでアップグレードツールを実行します。ファイルエンコーディング (`UTF-8`)、タイムゾーン (`GMT`)、国、言語、メモリ設定 (`-Xmx value`) はすべてアプリケーションサーバーの設定に合わせる必要があります。データが 10 GB を超えるデータベースについては、`-Xmx` オプションを使用して追加のメモリを割り当ててください。
    
    [アップグレードのプロパティファイル](../reference/database-upgrade-tool-reference.md#manual-configuration) を使用してアップグレードの設定を行っていない場合、アップグレードツールは設定値の入力を促し、カッコ内にデフォルト値を表示します。以下は対話の例です：

    ```
    Please enter your application server (tomcat):
    tomcat

    Please enter your application server directory (../../tomcat-9.0.17):

    Please enter your extra library directories (../../tomcat-9.0.17/bin):

    Please enter your global library directory (../../tomcat-9.0.17/lib):

    Please enter your portal directory (../../tomcat-9.0.17/webapps/ROOT):

    [ db2 mariadb mysql oracle postgresql sqlserver sybase ]
    Please enter your database (mysql):
    mariadb

    Please enter your database host (localhost):

    (etc.)
    ```

    プロンプトに表示されたデフォルト値を使用する場合は、Enter キーを押します。
    
    設定が完了すると、アップグレードが開始されます。このツールは、アップグレード処理の開始と完了をそれぞれログに記録します。

1. アップグレードが完了したら、 [アップグレードレポート](../reference/upgrade-report.md) にデータベースのアップグレードの失敗、エラー、警告がないか確認します。 [Gogo Shellコマンド](../upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md)を使用して、それらの問題をトラブルシューティングし、アップグレードを完了できます。

データベースのアップグレードが完了し、問題が解決されました。

## アップグレードされたデータベースのテスト

データベースのアップグレードが完了したので、テストしてみましょう。

1. 新しいLiferay Dockerイメージにアップグレードしている場合は、イメージをアップグレードされたデータベースに指定し、Liferayをデータベースで検証します。 詳しくは、[Liferayコンテナの設定](../../installing-liferay/using-liferay-docker-images/configuring-containers.md)を参照してください。

1. [アップグレード後の検討事項](./post-upgrade-considerations.md)を調べます。

1. カスタム [Liferay Homeのファイル](../../maintaining-a-liferay-installation/backing-up.md#liferay-home) と [アプリケーションサーバーのファイル](../../maintaining-a-liferay-installation/backing-up.md#application-server) をバックアップから新規インストールにコピーしてマージします。 ファイルには次のものが含まれる場合がありますが、これらに限定されません。

    * `/license/*`：アクティベーションキー。 (サブスクリプション)
    * `/log/*`：ログファイル。
    * `/osgi/configs/*.config`：OSGi設定ファイル。
    * `portal-*.properties`：`portal-ext.properties`のようなポータルプロパティファイル。
    * アプリケーションサーバーファイル：変更されたスクリプトと設定ファイル。
    * `web.xml`：ポータルWebアプリケーション記述子。

1. 新しいインストール先で [ポータルのプロパティを更新](../migrating-configurations-and-properties.md#migrating-portal-properties) します。

1. サーバーを起動し、アップグレードしたデータベースでLiferayを検証します。
   
   ![これがLiferay DXPのランディング画面です。](./using-the-database-upgrade-tool/images/01.png)

データベースアップグレードツールを使用してLiferayデータベースをアップグレードしました。

これが試用版のアップグレードで、アップグレード時間を短縮したい場合は、データベースをアップグレード用に調整し（まだ行っていない場合）、データベースから[不要なデータを削除](../upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md)してください。 必要に応じてこの記事の手順を繰り返してください。

問題が発生した場合は、 [アップグレードレポート](../reference/upgrade-report.md) を確認し、 [アップグレードのトラブルシューティング](../reference/troubleshooting-upgrades.md)を参照してください。

## 次のステップ

[アップグレードの基本](../upgrade-basics.md)を再確認して、アップグレードに必要な残りの作業について確認してください。
