# 出荷の作成

シップメントの作成は[［**注文**］ メニュー](../orders/orders-menu-reference-guide.md)と統合されています。 注文が[**処理** 段階](../orders/processing-an-order.md)になったら、 ［**出荷**］ メニューで[すべての出荷を管理](./introduction-to-shipments.md)することもできます。

## 新規出荷の作成

新しい出荷を作成するには：

1. ［**コントロールパネル**］ → ［**コマース**］ → ［**注文**］ に移動します。
1. **保留中** タブをクリックし、注文を選択します。

    ![注文メニュー](./creating-a-shipment/images/11.png)

1. **受注** ボタンをクリックします。

    ![注文メニュー-受注](./creating-a-shipment/images/12.png)

1. 注文が受理されたら、［**出荷を作成**］ボタンをクリックします。

    ![注文メニュー](./creating-a-shipment/images/10.png)

1. これにより、［出荷］メニューにリダイレクトされます。

1. 追加（![Add Icon](../../images/icon-add.png)）をクリックします。
1. この注文に関連付けられているすべてのアイテムを選択します。

    ![注文メニュー](./creating-a-shipment/images/07.png)

1. ［**送信**］ をクリックします 。
1. アイテムの横にある ［**編集**］ クリックして、数量とソーシング[倉庫](../../product-management/managing-inventory/warehouse-reference-guide.md)を選択します。
1. ［**出荷数量**］フィールドに数量を入力します。

    ![注文メニュー](./creating-a-shipment/images/08.png)

1. ［**保存**］ をクリックします。
1. ［**処理を終了**］クリックします 。

注文の出荷準備完了：

1. ［**編集**］をクリックして、予定発送日と予想配達日を入力します。

    ![注文メニュー](./creating-a-shipment/images/09.png)

1. 準備ができたら ［**出荷**］ クリックし ます。

## Liferay Commerce 2.0以前での新規出荷の作成

Liferay Commerceの以前のバージョンで出荷を作成するには：

1. ［**コントロールパネル**］ → ［**コマース**］ → ［**出荷**］ に移動します。
1. 追加（![add-icon](../../images/icon-add.png)）ボタンをクリックして、新しい発送を追加します。
1. ドロップダウンメニューから注文を選択します（たとえば、 **41241**）。

    ![注文を選択](./creating-a-shipment/images/02.png)

1. ［**保存**］ をクリックします。
1. 対応する[倉庫](../../product-management/managing-inventory/warehouse-reference-guide.md)からの数量を入力します。

    ![US NE倉庫から数量を入力](./creating-a-shipment/images/03.png)

1. ［**保存**］ をクリックします。
1. 配送先住所を確認します。

    ![配送先住所を確認](./creating-a-shipment/images/04.png)

1. ［**保存**］ をクリックします。

新しい出荷が作成されました。

出荷が作成されると、オーダーマネージャーが出荷に対して実行できるアクションがさらにいくつかあります。

### アイテムを確認する

1. ［**アイテム**］ タブをクリックして、アイテムが正しいことを確認します。

    ![アイテムの確認](./creating-a-shipment/images/05.png)

### 出荷状況を更新する

1. ［**詳細**］ タブをクリックします。
1. ［**配送業者**］ フィールドに運送業者の名前を入力します（例：USPS、FedEx、UPS）
1. **追跡番号** を入力します 。
1. ［**ステータス**］ ドロップダウンメニューからステータスを選択します（例： **出荷準備完了**）。
1. ［**保存**］ をクリックします。

オーダーマネージャーは、注文が完了するまで、必要に応じて出荷のステータスを更新できます。

![出荷済みアイテム](./creating-a-shipment/images/06.png)

## 追加情報

* [Commerce倉庫のセットアップ](../../product-management/managing-inventory/setting-up-commerce-warehouses.md)
* [倉庫ごとの在庫設定](../../product-management/managing-inventory/setting-inventory-by-warehouse.md)
* [注文情報](../orders/order-information.md)
* [注文の処理](../orders/processing-an-order.md)
* [倉庫リファレンスガイド](../../product-management/managing-inventory/warehouse-reference-guide.md)
