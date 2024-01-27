# MBeansによるアップグレードの監視

{bdg-secondary}`Liferay DXP 7.4 U76 / Liferay Portal 7.4 GA76`

起動時のアップグレードが有効になっている場合、JVM管理ツール（JConsoleなど）を使用して、アップグレード処理をMBeansで監視できます。 [ポータルのプロパティ](../../reference/portal-properties.md) で `upgrade.database.auto.run=true` を設定して、起動時にアップグレードを有効にします。

JVM管理ツールで、新しい接続を作成し、LiferayのJavaプロセス（例えば`org.apache.catalina.startup.Bootstrap`）を選択します。

MBeans タブで、`com.liferay.portal.upgrade` カテゴリを選択します。 属性`を選択する。 つの属性キーが利用できる：Result` と `Type` である。

![Under the MBeans tab, select the com.liferay.portal.upgrade category.](./monitoring-upgrades-with-mbean/images/01.png)

`結果`には以下の値を指定することができる：

* `pending`です：アップグレード処理はまだ開始されていません。
* `running`：アップグレードプロセスを実行中。
- 失敗しました：アップグレードプロセスが終了し、アップグレードプロセス中にいくつかのエラーが記録されました。
* `unresolved`となった：アップグレードプロセスは終了し、エラーは記録されませんでしたが、OSGi を使用してアップグレードの完全性をチェックすることはできませんでした。 保留中のアップグレードや未解決の依存関係があるかもしれません。
* `warning`：アップグレードプロセスは終了し、エラーは記録されませんでした。 しかし、アップグレード中にいくつかの警告が記録された。
* 成功しました：アップグレードプロセスは終了し、アップグレードプロセス中にエラーや警告は記録されませんでした。

`Type`には以下の値を指定することができる：

* `pending`です：アップグレードはまだ終了していません。
* `no upgrade`：アップグレードプロセスが終了した時点で、アップグレードプロセスは実行されていません。
* ` major`：schemaVersionのメジャー変更を伴うアップグレードが少なくとも1回ある。
* `minor`：schemaVersionのマイナーチェンジを伴うアップグレードが少なくとも1回実行された。
* `micro`：schemaVersion の微小な変更を伴うアップグレードが少なくとも 1 回実行された。

```{note}
MBeansが提供する情報はリアルタイムで更新され、起動時に実行されるアップグレードでのみ利用可能です。 起動時のアップグレードが完了すると、MBeansに表示される値は固定され、起動時のアップグレード後に手動アップグレードを実行しても更新されません。
```

## 関連トピック

[アップグレードデータベースツールの使用](../upgrade-basics/using-the-database-upgrade-tool.md)
[アップグレードレポート](./upgrade-report.md)
[データベースアップグレードツールリファレンス](./database-upgrade-tool-reference.md)
[アップグレードログコンテキスト](./upgrade-log-context.md)
