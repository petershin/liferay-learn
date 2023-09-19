# MBeansによるアップグレードの監視

{bdg-secondary}`利用可能 Liferay DXP 7.4 U76 / Liferay Portal 7.4 GA76`

起動時のアップグレードが有効になっている場合、JVM管理ツール（JConsoleなど）を使用して、アップグレード処理をMBeansで監視できます。 [ポータルのプロパティで `upgrade.database.auto.run=true` を設定して、起動時にアップグレードを有効にする](../../reference/portal-properties.md)。

JVM管理ツールで新しい接続を作成し、LiferayのJavaプロセスを選択します（例： `org.apache.catalina.startup.Bootstrap`）。

MBeans タブで、 `com.liferay.portal.upgrade` カテゴリを選択します。 `属性`を選択する。 つの属性キーが利用可能である： `結果` と `タイプ`。

![MBeans タブで、com.liferay.portal.upgrade カテゴリを選択します。](./monitoring-upgrades-with-mbean/images/01.png)

`Result`には以下の値が指定できる：

* `pending`: アップグレード処理はまだ開始されていません。
* `running`: アップグレードプロセスを実行中です。
* `failure`: アップグレードプロセスが終了し、アップグレードプロセス中にいくつかのエラーが記録されました。
* `unresolved`: アップグレードプロセスは終了し、エラーは記録されませんでしたが、OSGi を使用してアップグレードの完全性を確認することはできませんでした。 保留中のアップグレードや未解決の依存関係があるかもしれません。
* `warning`: アップグレードプロセスは終了し、エラーは記録されませんでした。 しかし、アップグレード中にいくつかの警告が記録された。
* `success`: アップグレードプロセスが終了し、アップグレードプロセス中にエラーや警告は記録されませんでした。

`Type`：

* `pending`: アップグレードはまだ終了していません。
* `no upgrade`: アップグレードプロセスの最後に、アップグレードプロセスが実行されていません。
* `major`: schemaVersionのメジャー変更を伴うアップグレードが少なくとも1回。
* `minor`: schemaVersionのマイナーチェンジを伴うアップグレードが少なくとも1回実行された。
* `micro`: schemaVersion のマイクロ変更を伴うアップグレードが少なくとも1回実行された。

```{note}
MBeansが提供する情報はリアルタイムで更新され、起動時に実行されるアップグレードでのみ利用可能です。 起動時のアップグレードが完了すると、MBeansに表示される値は固定され、起動時のアップグレード後に手動アップグレードを実行しても更新されません。
```

## 関連トピック

[アップグレードデータベースツールの使用](../upgrade-basics/using-the-database-upgrade-tool.md) [アップグレードレポート](./upgrade-report.md) [データベースアップグレードツールリファレンス](./database-upgrade-tool-reference.md) [アップグレードログコンテキスト](./upgrade-log-context.md)
