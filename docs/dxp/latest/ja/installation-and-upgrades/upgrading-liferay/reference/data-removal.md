# データ削除

{bdg-secondary}`7.4以降で利用可能`

データ削除ツールで、期限切れの雑誌記事や出版物のプレビューなど、不要なアプリケーションデータを消去します。

データを削除する場合、

1. *グローバルメニュー* (![Global Menu](../../../images/icon-applications-menu.png)) を開き、 *コントロールパネル* &rarr; *システム設定* &rarr; *アップグレード* &rarr; *データ削除*.

   ![データ削除」タブに移動します。](./data-removal/images/01.png)

1. 削除するデータを選択します：

   * 有効期限切れの雑誌記事

   * ドキュメントライブラリ プレビュー 変更履歴 ストア コンテンツデータ (出版物)

   * 出版物変更追跡ストアコンテンツデータ(出版物）

   ```{important}
   Liferay のバージョンが 7.3 U10 または 7.4 U37 より前のものを使用している場合のみ、発行済み変更追跡ストアコンテンツデータを削除します。 タスク実行後は、この不要なデータがこれ以上蓄積されないようにアップグレードしてください。
   ```

1. *［保存］* をクリックします。

Liferayは選択したデータを即座に削除します。

## 追加情報

* [データ初期化](./data-cleanup.md)
* [Docker経由のアップグレード](../upgrade-basics/upgrading-via-docker.md)
* [Using the Upgrade Tool](../upgrade-basics/using-the-database-upgrade-tool.md)
