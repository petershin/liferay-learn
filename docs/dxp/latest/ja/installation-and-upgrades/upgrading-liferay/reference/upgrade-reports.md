# アップグレードのレポート

データをアップグレードするときは、行われた変更と発生した問題を把握することが重要です。 [データベースアップグレードツール](../upgrade-basics/using-the-database-upgrade-tool.md)は、次の詳細を含むレポートにこの情報をキャプチャします。

* 実行日時
* アップグレードの総実行時間
* DXP / Portalスキーマの初期バージョン、想定されるバージョン、および最終バージョンとビルド番号
* データベースのベンダーとバージョン
* アップグレード関連のポータルプロパティ設定
* ドキュメントライブラリストアと`rootDir`の構成設定
* ドキュメントライブラリのサイズ（[ファイルシステムストア](../../../system-administration/file-storage/other-file-store-types/simple-file-system-store.md)および[高度なファイルシステムストア](../../../system-administration/file-storage.md)の場合）
* 行単位の初期サイズと行単位の最終サイズを含むデータベーステーブルの一覧
* 最も長く実行されている20のアップグレードプロセス
* エラーと各タイプの頻度
* 警告と各タイプの頻度

ツールは、この情報を`tools/portal-tools-db-upgrade-client/reports`フォルダの`upgrade_report.info`というファイルに報告します。 以降のアップグレードでは、ツールはファイル名にタイムスタンプを追加し（`upgrade_report.info.1631029824000`など）、新しいアップグレードの詳細を新しい`upgrade_report.info`ファイルに報告します。

```{note}
アップグレードレポートは、Liferay DXP/Portal 7.4以降で利用できます。
```

アップグレードレポートを有効にするには、`tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties`ファイルで`upgrade.report.enabled=true`[ポータルプロパティ](../../reference/portal-properties.md)を設定します。 例:

```bash
cd liferay-home
```

```bash
echo "upgrade.report.enabled=\"true\"" << tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties
```

なお、ドキュメントライブラリーのサイズを計算すると、長い待ち時間がかかる場合があります。 そのため、タイムアウト時間はデフォルトで10秒に設定されています。 この期間を変更するには、 `portal-ext.properties` ファイルの `upgrade.report.dl.storage.size.timeout` プロパティを変更してください。 時間を長くするか、 `0` に設定するとタイムアウトが無効になります。

[データベースアップグレードツール](../upgrade-basics/using-the-database-upgrade-tool.md)は、次回の実行時にアップグレードレポートを生成します。

以下は、アップグレードレポートの例です。

```
...
Date: Tue, Jul 26, 2022 09:02:44 UTC

Upgrade completed in 388 seconds

Initial portal build number: 7310
Initial portal schema version: 8.18.4
Final portal build number: 7413
Final portal schema version: 16.0.0
Expected portal build number: 7413
Expected portal schema version: 16.0.0

Using mariadb version 10.7

liferay.home=/Users/liferay/tomcat/liferay-dxp-7.4.13.u34
...
dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
rootDir=/Users/liferay/tomcat/liferay-dxp-7.4.13.u34/data/document_library

The document library storage size is 689.01 KB

Tables in database sorted by initial number of rows:
Table name                           Rows (initial)         Rows (final)
--------------                       --------------       --------------
ResourceAction                                 1822                 2043
ResourcePermission                             1440                 1488
Marketplace_Module                             1195                 2538
...
SegmentsExperience                                0                    1

Top 20 longest running upgrade processes:
    com.liferay.client.extension.internal.upgrade.v3_1_0.ClientExtensionEntryUpgradeProcess took 6866 ms to complete
    com.liferay.client.extension.internal.upgrade.v2_0_0.RemoteAppEntryUpgradeProcess took 4938 ms to complete
    com.liferay.portal.upgrade.v7_4_x.UpgradeCountry took 4429 ms to complete
   ...
    com.liferay.batch.engine.internal.upgrade.v4_4_0.BatchEngineExportTaskUpgradeProcess took 1228 ms to complete

No errors thrown during upgrade

Warnings thrown during upgrade process

...
```

## 関連トピック

* [アップグレードの基本](../upgrade-basics.md)

* [データベースアップグレードツールの使用](../upgrade-basics/using-the-database-upgrade-tool.md)

* [データベースアップグレードツールのリファレンス](../reference/database-upgrade-tool-reference.md#manual-configuration)

* [アップグレードのトラブルシューティング](../reference/troubleshooting-upgrades.md)
