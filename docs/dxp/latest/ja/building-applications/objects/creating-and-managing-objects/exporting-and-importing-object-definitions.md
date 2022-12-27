# オブジェクト定義のエクスポートとインポート

{bdg-secondary}`利用可能な Liferay 7.4 U5+/GA9+`

オブジェクト定義は、 `.json` ファイルとしてインポートおよびエクスポートすることができます。 これにより、Liferay環境間でのオブジェクトの移行が容易になります。

```{important}
Objects は、リレーションシップのエクスポートおよびインポートをサポートしていません。 その他のすべてのオブジェクト要素および構成（スコープ、フィールド、レイアウト、アクションなど）をサポートしています。
```

## 定義のエクスポート

1. **グローバルメニュー**（![Global Menu](../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. 目的のオブジェクトの **Actions** ボタン (![Action Button](../../../images/icon-actions.png)) をクリックし、 **Export as JSON** を選択します。

   ![目的のオブジェクトのActionsボタンをクリックし、Export as JSONを選択します。](./exporting-and-importing-object-definitions/images/01.png)

1. ダイアログウィンドウの **Save** をクリックし、オブジェクト定義をJSONファイルとしてダウンロードします。

一度エクスポートすると、互換性のあるLiferay環境にオブジェクト定義をインポートすることができます。

## 定義のインポート

1. **グローバルメニュー**（![Global Menu](../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. アプリケーションバーの **アクション** ボタン（![Actions Button](../../../images/icon-actions.png)）をクリックし、 ［**Import Object**］ を選択します。

   ![アプリケーションバーのアクションボタンをクリックして、［Import Object］を選択します。](./exporting-and-importing-object-definitions/images/02.png)

1. 新しいオブジェクトの **名前** を入力し、インポートしたい **JSON ファイル** を選択します。

   ```{important}
   オブジェクト名はユニークで、パスカルケースを使用する必要があります。
   ```

   ![名前を入力し、目的のJSONファイルを選択します。](./exporting-and-importing-object-definitions/images/03.png)

1. ［**Import**］ をクリックします。

オブジェクトの定義はバックグラウンドでインポートされるため、数分かかることがあります。

## 追加情報

* [オブジェクトの作成](./creating-objects.md)
* [オブジェクトの有効化と無効化](./activating-and-deactivating-objects.md)
* [オブジェクト定義のエクスポートとインポート](./exporting-and-importing-object-definitions.md)
