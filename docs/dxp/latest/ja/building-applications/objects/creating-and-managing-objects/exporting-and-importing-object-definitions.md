# オブジェクト定義のエクスポートとインポート

{bdg-secondary}`Liferay 7.4 U68+/GA68+`

オブジェクト定義は、 `.json` ファイルとしてエクスポートおよびインポートできます。 これらのファイルには、定義の完全なスキーマ（構成、フィールド、アクション、リレーションシップなど）が含まれています。

リレーションシップを含む定義をエクスポートする場合、JSON ファイルには、現在のオブジェクトで定義されているすべてのリレーションシップと、他のオブジェクトで定義されている多対多のリレーションシップが含まれます。 ただし、このファイルには他のオブジェクトで定義された一対多のリレーションシップは含まれない。

インポートされた定義が存在しないピックリストやオブジェクトを参照する場合、LiferayはJSONファイルで提供される外部参照コードを使用してそれらを自動的に生成します。

<!--TASK: Uncomment when batch feature and documentation is ready...
```{tip}
You can use the batch client extension to help migrate object definitions between Liferay environments. See [Batch Client Extensions](../../client-extensions/batch-client-extensions.md) for more information.
```
-->

## 定義のエクスポート

1. ［**グローバルメニュー**］（![Global Menu](../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**Objects**］ をクリックします。

1. 目的のオブジェクトの **アクション** ボタン（![Action Button](../../../images/icon-actions.png)）をクリックし、 ［**Export as JSON**］ を選択します。

   ![目的のオブジェクトのアクションボタンをクリックし、［Export as JSON］を選択します。](./exporting-and-importing-object-definitions/images/01.png)

1. ダイアログウィンドウの ［**保存**］ をクリックすると、オブジェクトの定義をJSONファイルとしてダウンロードします。

エクスポートされたオブジェクト定義は、互換性のあるLiferay環境にインポートすることができます。

## 定義のインポート

1. ［**グローバルメニュー**］（![Global Menu](../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**Objects**］ をクリックします。

1. アプリケーションバーの **アクション** ボタン（![Actions Button](../../../images/icon-actions.png)）をクリックし、 ［**Import Object**］ を選択します。

   ![アプリケーションバーのアクションボタンをクリックして、［Import Object］を選択します。](./exporting-and-importing-object-definitions/images/02.png)

1. オブジェクトの名前を入力します。 この値はインポート後に編集できる。

   ```{important}
   オブジェクト名はユニークで、パスカルケースを使用する必要があります。
   ```

1. インポートするJSONファイルを選択します。

   選択すると、モーダルウィンドウに定義の外部参照コード（ERC）が表示されます。 インポート後にERCを編集することができます。

   ![名前を入力し、目的のJSONファイルを選択します。](./exporting-and-importing-object-definitions/images/03.png)

1. ［**Import**］ をクリックします。

オブジェクト定義はバックグラウンドでインポートを開始し、数分かかります。

## 関連トピック

* [オブジェクトの作成](./creating-objects.md)
* [オブジェクトの有効化と無効化](./activating-and-deactivating-objects.md)
* [オブジェクト定義のエクスポートとインポート](./exporting-and-importing-object-definitions.md)
