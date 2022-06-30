# 注文メニューリファレンスガイド

注文は **注文** メニューの管理者によって[閲覧、管理](./processing-an-order.md)できます。 **注文** メニューにアクセスするには、 ［**グローバルアプリケーション**］ ボタン &rarr; ［**コマース**］ &rarr; ［**Orders**］ からいきます。

![グローバルアプリケーションの注文メニューに移動します。](./orders-menu-reference-guide/images/11.png)

## Commerce 2.1以前

**注文** メニューにアクセスするには、 ［**コントロールパネル**］ &rarr; ［**Commerce**］ &rarr; ［**Orders**］ からいきます。

上部には5つのタブがあります: ［**All**］ 、 ［**Open**］ 、 ［**Pending**］ 、 ［**Processing**］ 、 ［**Completed**］ です。

![注文メニュー](./orders-menu-reference-guide/images/05.png)

## すべて

**全て** のタブには、注文状況に関係なくすべての注文が表示されます。

## 公開

［**公開**］ タブには、チェックアウトプロセスを完了していないすべての注文が表示されます。

![［注文］メニュー-［公開］タブ](./orders-menu-reference-guide/images/07.png)

| Field   | Description                 |
|:------- |:--------------------------- |
| オーダーID  | オーダーIDです。                   |
| アカウント   | アカウントの名前です。                 |
| アカウント番号 | 生成されたアカウント番号です。             |
| チャネル    | 注文が行われたチャネルまたはストアフロントの名前です。 |
| 総量      | 注文金額です。                     |
| 作成日時    | 注文が作成された日付が表示されます。          |
| 注文ステータス | 注文のステータスです。                 |

## 保留中

［**保留中**］ タブには、チェックアウトプロセスを完了したすべての注文が表示されます。

![［注文］メニュー-［保留中］タブ](./orders-menu-reference-guide/images/06.png)

注意すべき3つの特定のフィールドがあります。

| 項目            | 説明                                                                                          |
|:------------- |:------------------------------------------------------------------------------------------- |
| 注文日           | 注文が作成された日付です。                                                                               |
| 注文ステータス       | 注文のステータスです。                                                                                 |
| 受注ワークフローステータス | 注文の[購入者の承認ワークフロー](../order-workflows/enabling-or-disabling-order-workflows.md)ステータスが表示されます。 |

## 処理中

注文を **保留中** から **処理中** に進めるには、 ［**Accept Order**］ ボタンをクリックします。

![［注文］メニュー-［保留中］タブ](./orders-menu-reference-guide/images/10.png)

ストアが注文の処理を開始すると、注文は ［**Processing**］ タブに表示されます。

![［注文］メニュー-［保留中］タブ](./orders-menu-reference-guide/images/09.png)

## 完了

[配送が確認された場合](../shipments/introduction-to-shipments.md)、注文は ［**Completed**］ タブに移動します。

![［注文］メニュー-［保留中］タブ](./orders-menu-reference-guide/images/08.png)

## Liferay Commerce 2.0以下

注文は、[オーダーのライフサイクル](./order-life-cycle.md)による注文の進行状況に応じて、 ［**Open**］ 、 ［**Pending**］ 、及び ［**Transmitted**］ タブで管理されます。

![［注文］メニューの概要](./orders-menu-reference-guide/images/01.png "［注文］メニューの概要")

**注文** メニューの注文情報は、 ［**カートを開く**］ ウィジェット（［**Open**］ タブにある注文の場合 ）および ［**注文**］ ウィジェット（［**Pending**］ または ［**Transmitted**］ タブにある注文の場合）を使用して、他のユーザー（特に購入者）に提示することもできます。 詳細は、 [保留中の注文](../../creating-store-content/commerce-storefront-pages/pending-orders.md) および[発注済み注文](../../creating-store-content/commerce-storefront-pages/placed-orders.md)を参照してください。

### 公開

このタブでは、注文アクティビティは購入者側のみで行われます。 購入者が商品をカートに追加すると、 ［**Open**］ タブで新しい注文が作成されます。 購入者が注文するまで、注文はこのタブに残ります。

```{note}
*許可ワークフロー*が有効になっている場合、ワークフロープロセスが完了して注文が行われるまで、注文は［Open］タブに残ります。
```

![［公開］タブ](./orders-menu-reference-guide/images/02.png "［公開］タブ")

### 申請中

［**Pending**］ タブは注文の保留場所として機能します。これは、すべての注文をすぐに送信するわけではないビジネスコンテキストで役立ちます。 購入者が注文すると、注文は ［**Pending**］ タブに移動します。 ここで売り手は、 [変更、キャンセル、または注文を送信する](./processing-an-order.md#commerce-20-and-below) ことができます。

```{note}
*ワークフロー遷移*が有効になっている場合、売り手が注文を拒否して買い手に送り返す場合でも、注文はワークフロープロセス全体で*［Pending］*タブに残ります。
```

![［保留中］タブ](./orders-menu-reference-guide/images/03.png "［保留中］タブ")

### 送信済み

このタブでは、注文アクティビティは販売者側のみで行われます。 売り手は、 **保留中** の注文を、 [注文ステータス](./processing-an-order.md#commerce-20-and-below) を（手動または自動で）" **送信** "ステータスから他の注文ステータスに変更することで送信します。 この時点で、注文は ［**Transmitted**］ タブに移動し、設定されている場合は、MicrosoftのDynamics GP、OracleのNetSuite、SAPなどの外部システムに送信されます。 その後、販売者は、購入者への注文された商品の配送を進めることができます。 また、追加情報として、更新された[注文ステータス](./order-management-statuses-reference-guide.md)、[出荷情報](../shipments/introduction-to-shipments.md)、到着予定時間などを追加することも可能です。

![［送信済み］タブ](./orders-menu-reference-guide/images/04.png "［送信済み］タブ")

## 追加情報

* [注文ワークフローの概要](../order-workflows/introduction-to-order-workflows.md)
* [注文ワークフローの有効化・無効化](../order-workflows/enabling-or-disabling-order-workflows.md)
* [注文の処理](./processing-an-order.md)
* [注文管理ステータスリファレンスガイド](./order-management-statuses-reference-guide.md)
* [出荷の概要](../shipments/introduction-to-shipments.md)
