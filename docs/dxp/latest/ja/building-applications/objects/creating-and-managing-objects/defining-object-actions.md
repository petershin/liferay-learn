# オブジェクトアクションの定義

{bdg-secondary}`Liferay DXP/Portal 7.4以降で利用可能`

Liferay Objectsでは、特定の条件でトリガーされるアクションを定義することができます。 アクションがアクティブになると、Liferayはオブジェクトのデータが追加、削除、または更新された時にリッスンし、設定されたアクションを実行します。

```{important}
現在、アクションは、データを同期・処理するために外部ソースにペイロードを配信する*webhooks*のトリガーのみをサポートしています。
```

次の手順に従って、オブジェクトにアクションを定義します。

1. *グローバルメニュー * （![Global Menu](../../../images/icon-applications-menu.png)）を開き、 *［コントロールパネル］ * タブをクリックして、 *［オブジェクト］ *に進みます。

1. 既存のオブジェクトを選択するか、 [新しいオブジェクトを作成](./creating-objects.md)します。

   ```{note}
   Liferay DXP 7.4 U22からは、システムオブジェクトにアクションを追加することができます。
   ```

1. オブジェクトを表示した状態で、 *［Actions］* タブを選択し、 *追加* ボタン（![Add Button](../../../images/icon-add.png)）をクリックします。

1. *［name］*を入力します。

1. ［When］では、アクションのトリガーを決めます。

   | トリガー | Description        |
   |:---- |:------------------ |
   | 追加後  | オブジェクトエントリが追加されたとき |
   | 削除後  | オブジェクトエントリが削除されたとき |
   | 更新後  | オブジェクトエントリが更新されたとき |

1. ［Then］に、 *［Webhook］*を選択します。 これにより、実行されるアクションの種類が決まります。

1. Webhookの *URL* を入力します。

1. (オプション）Webhookの*secret*を入力します。

   ![名前、トリガー、アクションタイプ、URLを入力します。](./defining-object-actions/images/01.png)

1. *［Save］* をクリックします。

   ```{note}
   アクションを保存した後、そのトリガーを変更することはできません。すなわち Whenフィールド）やアクションタイプ（すなわち Thenのフィールド).
   ```

作成されると、アクションはアクティブになり、構成に応じてトリガーされます。

![保存後、アクションが有効になります。](./defining-object-actions/images/02.png)

必要に応じて、いつでもアクションを無効にすることができます。 アクションを選択し、スイッチを*［Inactive］*に切り替え、*［保存］*をクリックします。

![アクションはいつでも無効にすることができます。](./defining-object-actions/images/03.png)

## 追加情報

* [オブジェクトの作成](./creating-objects.md)
* [オブジェクトへのフィールドの追加](../creating-and-managing-objects/adding-fields-to-objects.md)
* [オブジェクトリレーションの定義](../creating-and-managing-objects/defining-object-relationships.md)
