# オブジェクトの削除

{bdg-secondary}`Liferay 7.4 U26+/GA26+`

ドラフトおよび公開されたオブジェクト定義を削除できます。 定義を削除すると、公開された定義の保存された項目を含む、その関連データが削除されます。

```{important}
Liferay 7.4 U26/GA26以前のバージョンでは、 [公開されたオブジェクト定義](./creating-objects.md#publishing-object-drafts) をユーザーが削除できないようになっています。
```

定義に有効なリレーションシップがある場合、定義を削除する前にそれらを削除する必要があります。 詳細については、[リレーションシップの削除](./relationships/removing-relationships.md)を参照してください。

![オブジェクト定義を削除する前に、すべての有効なリレーションシップを削除する必要があります。](./deleting-objects/images/01.png)

定義を削除するには、

1. グローバルメニュー (![Global Menu](../../../images/icon-applications-menu.png)) を開き、 ［**コントロールパネル**］ タブを選択し、 ［**オブジェクト**］ をクリックします。

1. 目的の定義の **アクション** ボタン (![Actions Button](../../../images/icon-actions.png))をクリックし、 ［**削除**］ を選択します。

1. ダイアログウィンドウで、定義の名前を入力し、 ［**Done**］ をクリックして確定します。

   ![オブジェクト定義の名前を入力し、［Done］をクリックします。](./deleting-objects/images/02.png)

## 関連トピック

* [オブジェクトの作成](./creating-objects.md)
* [オブジェクトの有効化と無効化](./activating-and-deactivating-objects.md)
* [オブジェクト定義のエクスポートとインポート](./exporting-and-importing-object-definitions.md)
