# データ削除

{bdg-secondary}`7.4以降で利用可能`

現在のLiferay機能には、不要なデータが含まれている可能性があります。 データ削除ツールはこのデータを削除します。

廃止されたデータを削除する方法は次のとおりです。

1. **コントロールパネル** で、 ［**システム設定**］ &rarr; ［**Upgrades**］（［**プラットフォーム**］ カテゴリ内） &rarr; ［**Data Removal**］ に移動します。 ［Data Removal］画面が表示されます。

    ![これが［Data Removal］画面です。](./data-removal/images/01.png)

1. 削除するデータのタイプを選択し、 ［**保存**］ をクリックします。

廃止されたデータが削除されます。

注：設定を [設定ファイル](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)に保存するには、 **Actions** メニューをクリックし、 **Export** を選択します。

この `com.liferay.data.cleanup.internal.configuration.DataRemovalConfiguration.config` 設定ファイルをサーバー起動時に使用し、古いデータを削除します。 ファイル内の `removeExpiredJournalArticles` キーに `true` を設定します。 データ削除後、 `osgi/configs` フォルダから設定ファイルを削除し、以後のサーバー起動時にファイルが実行されないようにする。

## 追加情報

* [データ初期化](./data-cleanup.md)
* [Docker経由のアップグレード](../upgrade-basics/upgrading-via-docker.md)
* [Using the Upgrade Tool](../upgrade-basics/using-the-database-upgrade-tool.md)