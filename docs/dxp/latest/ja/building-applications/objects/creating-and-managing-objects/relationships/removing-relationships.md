# 関連の削除

{bdg-secondary}`Liferay 7.4 U26+/GA26+`

ドラフトと公開されたオブジェクト定義の両方からリレーションシップを削除することができます。 関連を削除すると、関連するオブジェクト定義からそのフィールドが永久に削除されます。 公開された定義の場合、これは多くのレコードに影響を与える可能性があります。

```{important}
Liferay 7.4 U26/GA26以前のバージョンでは、 [publishing](../creating-objects.md#publishing-object-drafts) の時点でオブジェクトに含まれている関連をユーザーが削除することはできません。
```

次の手順で、公開されているオブジェクト定義から関連を削除します。

1. **グローバルメニュー**（![Global Menu](../../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. 目的のオブジェクト定義の編集を開始し、 ［**関連**］ タブに進みます。

1. 目的の関連の **アクション** ボタン (![Actions Button](../../../../images/icon-actions.png))をクリックし、 ［**削除**］ を選択します。

1. ダイアログウィンドウで、関連の名前を入力し、 ［**Delete**］ をクリックして確認します。

   ![関連の名前を入力し、［Done］をクリックします。](./removing-relationships/images/01.png)

## 関連トピック

* [オブジェクトの作成](../creating-objects.md)
* [オブジェクトリレーションシップの定義](./defining-object-relationships.md)
