# オブジェクト構造のエクスポートとインポート

{bdg-secondary}`Liferay 7.4 U5以降と7.4 GA9以降で利用可能`

Liferay Objectsでは、オブジェクト構造を `.json` ファイルとしてインポート、エクスポートすることができます。 これにより、アプリケーション開発時の柔軟性が高まり、ユーザーはLiferay環境間でオブジェクト定義を簡単に移行することができます。

```{important}
Liferay DXP 7.4 U5およびPortal 7.4 GA9では、オブジェクトはリレーションシップのインポートまたはエクスポートをサポートしていません。 その他のオブジェクトの構成や構造要素はすべてサポートされています（例：スコープ、フィールド、レイアウト）。
```

## 構造のエクスポート

次の手順に従って、オブジェクト構造をエクスポートします。

1. *［グローバルメニュー］* （![Global Menu](../../../images/icon-applications-menu.png)）を開き、 *［コントロールパネル］*タブに移動して、*［Objects］*をクリックします。

1. 目的のオブジェクトの *アクション* ボタン（![Action Button](../../../images/icon-actions.png)）をクリックし、 *［Export as JSON］*を選択します。

   ![目的のオブジェクトのアクションボタンをクリックし、［Export as JSON］を選択します。](./exporting-and-importing-object-structures/images/01.png)

1. ダイアログウィンドウの *［保存］* をクリックすると、オブジェクトの定義をJSONファイルとしてダウンロードを開始します。

このファイルには、オブジェクトのフィールド、レイアウト、アクション、および一般的な設定の詳細（ラベル、スコープなど）が含まれます。 エクスポートされたオブジェクトにリレーションシップがある場合、それらはJSONファイルに含まれません。

エクスポートされたオブジェクト定義は、互換性のあるLiferay環境にインポートすることができます。

## 構造のインポート

次の手順に従って、オブジェクト構造をインポートします。

1. *［グローバルメニュー］ * （![Global Menu](../../../images/icon-applications-menu.png)）を開き、 *［コントロールパネル］ * タブをクリックして、 *［Objects］ *に進みます。

1. アプリケーションバーの*アクション*ボタン（![Actions Button](../../../images/icon-actions.png)）をクリックし、*［Import Object］*を選択します。

   ![アプリケーションバーのアクションボタンをクリックして、［Import Object］を選択します。](./exporting-and-importing-object-structures/images/02.png)

1. 新しいオブジェクトに*名前*を入力し、インポートしたい*［JSON file］* を選択します。

   ```{important}
   オブジェクト名はユニークで、パスカルケースを使用する必要があります。
   ```

   ![名前を入力し、目的のJSONファイルを選択します。](./exporting-and-importing-object-structures/images/03.png)

1. *［Import］*をクリックします。

オブジェクト構造のインポートはバックグラウンドで実行され、数分程度かかる場合があります。

## 追加情報

* [オブジェクトの作成](./creating-objects.md)
* [オブジェクトの管理](./managing-objects.md)
