# アップグレードログコンテキスト

{bdg-secondary}`利用可能な Liferay DXP 7.4 U72 / Liferay Portal 7.4 GA72`

アップグレードログコンテキストを有効にして、コンソールログにアップグレード関連プロセスの識別子を表示します。 可能な識別子は以下の通り：

   * `{upgrade.component=portal}`: ポータル関連のアップグレード処理用
   * `{upgrade.component=framework}`: アップグレードフレームワークのロジックに関連する処理用
   * `{upgrade.component=<bundleSymbolicName>}.`モジュールに関するアップグレード処理

ログは、 [アップグレードツール（](../upgrade-basics/using-the-database-upgrade-tool.md) ）を通じて、またはポータルのプロパティを使って起動時に有効にすることができます。

アップグレードツールを使う場合は、 `/tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties` ファイルで、 `upgrade.log.context.enabled=true` を設定します。

起動時にアップグレードを有効にする場合は、 `{Liferay-Home}/portal-ext.properties` ファイルで、 `upgrade.log.context.enabled=true` を設定してください。

次に、 [`portal-impl/src/META-INF/portal-log4j.xml`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/META-INF/portal-log4j.xml) ファイルを `bundles/tomcat/webapps/ROOT/WEB-INF/META-INF` にコピーし、ファイル名を `portal-log4j-ext.xml`に変更する。 次に、アペンダーの定義を見つけます。

```
<Appender name="CONSOLE" type="Console">
    <Layout pattern="%d{yyyy-MM-dd HH:mm:ss.SSS} %-5p [%t][%c{1}:%L] %m%n" type="PatternLayout" />
</Appender>
```

スレッドコンテキスト情報を出力するようにLog4jに指示する `%X`を含むように定義を変更します。

```
<Appender name="CONSOLE" type="Console">
    <Layout pattern="%d{yyyy-MM-dd HH:mm:ss.SSS} %-5p [%t][%c{1}:%L] %m %X%n" type="PatternLayout" />
</Appender>
```

以下は、アップグレード識別子を含むログ行の例です：

```
...
2023-05-24 23:29:31.143 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.verify.VerifyProperties#verifySystemProperties {upgrade.component=portal}
2023-05-24 23:29:31.145 INFO  [main][LoggingTimer:44] Completed com.liferay.portal.verify.VerifyProperties#verifySystemProperties in 3 ms {upgrade.component=portal}
...
2023-05-24 23:29:34.012 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.events.StartupHelperUtil#initResourceActions {upgrade.component=framework}
2023-05-24 23:29:34.029 INFO  [main][LoggingTimer:44] Completed com.liferay.portal.events.StartupHelperUtil#initResourceActions in 17 ms {upgrade.component=framework}
...
2023-05-24 23:30:17.046 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.db.index.IndexUpdaterUtil#lambda$updateIndexes$1#Updating database indexes for com.liferay.wiki.service {upgrade.component=com.liferay.wiki.service}
2023-05-24 23:30:17.094 INFO  [main][BaseDB:776] Dropping stale indexes {upgrade.component=com.liferay.wiki.service}
2023-05-24 23:30:17.095 INFO  [main][BaseDB:846] drop index IX_18565130 on WikiPage {upgrade.component=com.liferay.wiki.service}
...
```

## アップグレードレポートとともに有効にする

[アップグレードレポート](./upgrade-report.md) がアップグレードログコンテキストとともに有効になっている場合、アップグレードレポートの内容もコンソールログに出力されます。 なお、このレポートは `upgrade_report.info` ファイルとは若干異なる形式で表示されます。

| アップグレード・レポート・キー                                 | 説明                                                              |
|:----------------------------------------------- |:--------------------------------------------------------------- |
| `upgrade.report.database.version`               | データベースのベンダーとバージョン.                                              |
| `upgrade.report.document.library.storage.size`  | ドキュメントライブラリのサイズ。                                                |
| `upgrade.report.errors`                         | アップグレードプロセス中にキャプチャされたエラーが配列されます。 同じエラーの発生元、クラス、発生回数でグループ化。      |
| `upgrade.report.execution.date`                 | レポートが作成された日時。                                                   |
| `upgrade.report.execution.time`                 | アップグレードが完了するまでの合計時間（秒）。                                         |
| `upgrade.report.longest.upgrade.processes`      | 最も長い20のアップグレードプロセスを配列し、各プロセスの名前と所要時間を示す。                        |
| `upgrade.report.portal.expected.build.number`   | アップグレード実行後に予想される最終ビルド番号。                                        |
| `upgrade.report.portal.expected.schema.version` | アップグレード実行後に予想されるスキーマのバージョン。                                     |
| `upgrade.report.portal.final.build.number`      | アップグレード実行後の実際の最終ビルド番号。                                          |
| `upgrade.report.portal.final.schema.version`    | アップグレード実行後の実際の最終スキーマ・バージョン。                                     |
| `upgrade.report.portal.initial.build.number`    | アップグレード実行前の初期ビルド番号。                                             |
| `upgrade.report.portal.initial.schema.version`  | アップグレード実行前のスキーマ初期バージョン。                                         |
| `upgrade.report.property.dl.store.impl`         | 文書ライブラリ保存用に設定された実装。                                             |
| `upgrade.report.property.liferay.home`          | Liferayのホームフォルダへの絶対パス。                                          |
| `upgrade.report.property.locales`               | 利用可能なすべてのロケールを含む配列。                                             |
| `upgrade.report.property.locales.enabled`       | すべてのロケールが有効になっている配列。                                            |
| `upgrade.report.property.rootDir`               | ドキュメントライブラリルートフォルダへの絶対パス。                                       |
| `upgrade.report.result`                         | すべてのアップグレードが実行された後に計算されたアップグレード結果。                              |
| `upgrade.report.status`                         | OSGiが提供するアップグレード情報ステータス。 すべてのアップグレードが実行されたか、保留中のアップグレードがあるかを示す。 |
| `upgrade.report.tables.initial.final.rows`      | すべてのテーブル名と、アップグレード前後の各テーブルの行数を表す配列。                             |
| `upgrade.report.type`                           | 実施されたアップグレードのタイプ（例． メジャー、マイナー、マイクロ）。 スキーマのバージョンに基づく。            |
| `upgrade.report.warnings`                       | アップグレードプロセス中にキャプチャされた警告の配列。 同じ警告の発生元、クラス、発生回数でグループ化。            |

## 関連トピック

[アップグレードデータベースツールの使用](../upgrade-basics/using-the-database-upgrade-tool.md) [アップグレードレポート](./upgrade-report.md) [データベースアップグレードツールリファレンス](./database-upgrade-tool-reference.md) [MBeansによるアップグレードの監視](./monitoring-upgrades-with-mbeans.md)
