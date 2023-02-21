# 在庫管理システムの活用

Liferayの在庫管理システムを使用して、インスタンス内の製品SKUの在庫を管理することができます。 本システムは、SKUを管理するために、このような機能を備えています。

* 在庫の追加
* ご注文を見る
* 安全在庫を追加する
* 過去の変更履歴を見る

商品SKUの在庫を追加する前に、在庫を保管するための倉庫を少なくとも1つ作成する必要があります。 詳しくは、 [倉庫の設置](./setting-up-warehouses.md) をご覧ください。

インベントリーページにアクセスするには、 **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Inventory** に移動してください。

```{note}
Commerce 2.0 または 2.1 を使用している場合、在庫管理オプションはコントロールパネルにあります。
```

## SKUの在庫を追加する

在庫はSKUレベルで管理されます。 インベントリエントリーを作成する際には、SKU、倉庫、数量を指定する必要があります。 SKUがなければ、商品に在庫を追加することはできません。

次の手順を実行します：

1. **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Inventory** に移動します。

1. **追加**(![Add Button](../images/icon-add.png)) をクリックし、SKU、倉庫、数量を入力します。 例えば、

   * **［SKU**］ : CHINAWARE-GRAY
   * **［Warehouse**］ : United States - Southwest
   * **［Quantity**］ ：120

   ![新しい在庫商品のSKU、倉庫、数量を入力します。](./using-the-inventory-management-system/images/01.png)

1. ［**Submit**］ をクリックします 。

選択した倉庫のSKUの在庫を追加します。

```{tip}
商品アプリケーションでSKUを編集しているときに、SKUの在庫を追加することができます。 詳しくは、 [SKU在庫の追加](../product-management/creating-and-managing-products/products/creating-skus-for-product-variants.md#adding-sku-inventory) をご覧ください。
```

## 安全在庫の設定

安全在庫とは、倉庫にある商品在庫のうち、販売できないように取り置かれたものです。 これは、出荷の遅れ、サプライチェーンの中断、異なるチャネルでの販売など、さまざまな理由が考えられます。 安全在庫量は、選択された倉庫の利用可能な在庫を減らすことができます。

安全在庫数量を設定する。

1. **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Inventory** に移動します。

1. **SKU** をクリックしてください。

1. 倉庫の横にある **アクション**(![Actions Button](../images/icon-actions.png)) をクリックし、 **編集** を選択します。

1. **安全在庫量** フィールドに値を入力します。

   ![選択したSKUの安全在庫数量を設定する。](./using-the-inventory-management-system/images/02.png)

1. 完了したら、 [**保存**] をクリックします。

使用可能な個数は安全在庫量によって減少します。 Available欄で確認することができます。

![安全在庫量を設定することで、倉庫内の在庫を減らすことができます。](./using-the-inventory-management-system/images/03.png)

## 注文時のSKUを表示する

1. **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Inventory** に移動します。

1. **SKU** をクリックしてください。

1. [**注文中**] タブをクリックします。

   ![選択したSKUを含むすべての注文を表示します。](./using-the-inventory-management-system/images/04.png)

このページでは、選択したSKUを含むすべての注文を一覧表示します。 注文したアカウント、注文ID、数量、有効期限を確認することができます。

## 入荷在庫の追加

入荷予定品とは、将来的に倉庫に入荷する予定のSKU在庫のことです。 入荷予定数量や納期を追加することができます。

1. **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Inventory** に移動します。

1. **SKU** をクリックしてください。

1. [**入荷**] タブをクリックします。

1. **追加**(![Add Button](../images/icon-add.png)) をクリックし、数量、仕向け地倉庫、納品予定日を入力します。 例えば、

    * **［Quantity**］ ：20
    * **目的地** : アメリカ合衆国 - 北東部
    * **配信予定日** : 2022年11月20日（これは未来の日付です。）

   ![選択したSKUの入庫を追加する。](./using-the-inventory-management-system/images/05.png)

1. ［**Submit**］ をクリックします 。

入荷した在庫を追加すると、「概要」ページの「入荷」欄に表示されます。

![入荷数量は、SKUの概要ページに表示されます。](./using-the-inventory-management-system/images/06.png)

## 在庫変更の確認

ChangelogページでSKUの在庫の変化を確認することができます。

1. **Global Menu**(![Global Menu](../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Inventory** に移動します。

1. **SKU** をクリックしてください。

1. **Changelog** タブをクリックします。

この情報は、チェンジログで見ることができます。

* 発注後、注文を満たすために予約されたSKUの単位。
* 出荷を作成し、前回計上した金額をコミットした後、在庫から削除されたSKUの単位。
* 倉庫の在庫に追加されたSKUの単位。
* 倉庫間で移動したSKUの単位。
* 出荷をキャンセルして返品されたSKUの個数。
* インベントリ内のSKUの更新。

![選択したSKUのインベントリに関連するさまざまなイベントを表示します。](./using-the-inventory-management-system/images/07.png)

## 追加情報

* [在庫管理リファレンスガイド](./inventory-management-reference-guide.md)
* [倉庫リファレンスガイド](./warehouse-reference-guide.md)
* [倉庫ごとの在庫設定](./setting-inventory-by-warehouse.md)
