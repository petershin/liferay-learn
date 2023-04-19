# 注文管理ステータスリファレンスガイド

> Liferay Commerce 2.0

Liferay Commerceのすべての注文には、[注文情報](./order-information.md)とそれに関連付けられた注文管理ステータスがあります。

この記事では、[**注文** メニュー](./orders-menu-reference-guide.md)にある、 **注文** 、 **支払いステータス** 、および **ワークフローステータス** の3つの注文管理ステータスタイプについてレビューします。

![Order Management Statuses](./order-management-statuses-reference-guide/images/01.png)

## 注文ステータス

**注文ステータス** は [注文ライフサイクル](./order-life-cycle.md)どこにあるかに関する情報を提供します。 各注文状況は、以下の [**注文** メニュー](./orders-menu-reference-guide.md) タブのいずれかに表示されます。 [**オープン**](./orders-menu-reference-guide.md#open) 、 [**保留**](./orders-menu-reference-guide.md#pending) 、または [**送信済み**](./orders-menu-reference-guide.md#transmitted) となります。

### 公開

［**オープン**］ タブで使用できる注文ステータスには、 ［**オープン**］ および ［**処理中**］ の2つがあります。

   ![注文ステータスの［オープン］タブ](./order-management-statuses-reference-guide/images/02.png)

| 注文ステータス | 説明                                                           |
|:------- |:------------------------------------------------------------ |
| 公開      | 1つ以上の商品がカートに追加されました。 注文が精算プロセスの途中である可能性があります(［**注文概要**］ ページまで）。 |
| 処理中     | 注文は、精算プロセスで ［**注文概要**］ ページを越えて支払いステップに進みました。                    |

### 申請中

［**保留中**］ タブでは、 ［**送信**］ という1つの注文ステータスが使用可能です。

   ![注文ステータスの［Pending］タブ](./order-management-statuses-reference-guide/images/03.png)

| 注文ステータス | 説明                                    |
|:------- |:------------------------------------- |
| 送信      | 注文が購入者によって行われましたが、販売者によってまだ送信されていません。 |

### 送信済み

［**送信済み**］ タブでは、以下にリストされている12個の注文ステータスが使用可能です。

   ![注文ステータスの［送信済み］タブ](./order-management-statuses-reference-guide/images/04.png)

| 注文ステータス  | 説明                                                                                                                                         |
|:-------- |:------------------------------------------------------------------------------------------------------------------------------------------ |
| 送信済み     | 注文は [送信](./processing-an-order.md#commerce-20-and-below) され、追加のステータス更新はありません。 (これは、送信された注文のデフォルトの注文ステータスです。）                                |
| 処理待ち     | 注文は [送信](./processing-an-order.md#commerce-20-and-below) され、支払いが確認されましたが、運送業者による[出荷](../shipments/introduction-to-shipments.md)準備はまだ整っていません。 |
| ピックアップ待ち | 注文が準備され(おそらく[出荷済み](../shipments/introduction-to-shipments.md)）、売り手が指定した場所から買い手が集荷するのを待っています。                                               |
| 出荷待ち     | 注文は [出荷](../shipments/introduction-to-shipments.md)準備ができており、運送業者による集荷および出荷を待っています。                                                         |
| 一部返金済み   | 販売者が、注文の合計金額未満の金額を購入者に払い戻しました。                                                                                                             |
| 一部発送済み   | 注文した商品の一部のみが [出荷されました](../shipments/introduction-to-shipments.md)。                                                                         |
| 払い戻し     | 販売者が、注文の合計金額を購入者に払い戻しました。                                                                                                                  |
| 出荷済み     | 注文は [出荷されました](../shipments/introduction-to-shipments.md)、まだ受領されたことが確認されていません。                                                              |
| 完了       | 注文は [出荷済み](../shipments/introduction-to-shipments.md) (または集荷）で、受領済みであることが確認されました。または、仮想商品は有料であり、ダウンロードできます。                                |
| キャンセル済み  | 注文が販売者によってキャンセルされました。                                                                                                                      |
| 不参加      | 注文は [出荷済み](../shipments/introduction-to-shipments.md)でしたが、バイヤーはそれを受け取ることを拒否しました。                                                           |
| 係争中      | 購入者が、支払い取引の紛争解決を開始しました(PayPalなどで）。                                                                                                         |

## 支払い状況

**支払いステータス** は、 [注文](./processing-an-order.md)に対して支払いが行われ、受け取られたかどうかに関する情報を提供します。 [［**注文**］ メニュー](./orders-menu-reference-guide.md)の ［**保留中**］ および ［**送信済み**］ タブでは、 ［**認証済み**］ 、 ［**支払済み**］ 、および ［**保留中**］ の3つの支払いステータスが使用可能です。 (［**オープン**］ タブでは、注文の支払いステータスは常に ［**保留中**］ です。 ）

   ![支払い状況](./order-management-statuses-reference-guide/images/05.png)

| 支払い状況 | 説明                                                                                                                                                                                        |
|:----- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 認証済み  | 支払いは関係する金融機関によって承認されており、販売者の口座に入金するためのステップが取られます。 (これは、PayPal、クレジットカード、デビットカードなどのオンラインの支払方法の場合が考えられます。）                                                                                   |
| 支払済み  | [注文](./processing-an-order.md)の支払いが販売者に支払われました。                                                                                                                                           |
| 返答待ち  | [注文](./processing-an-order.md)の支払いが受領または承認されていません。 (これは、支払いがまだ受領または確認されていない場合、または支払い状況が更新されていない場合に、郵便為替や発注書などのオフラインの支払方法の場合が考えられます。 また、購入者が支払いプロセスを停止した場合は、PayPalなどのオンラインの支払い方法の場合もあります。） |

## ワークフローのステータス

［**Workflow Status**］ には、2つの[注文ワークフロー](../order-workflows/introduction-to-order-workflows.md)のいずれかで注文がどこにあるかに関する情報が提供されます。

### 公開

［**Open**］ タブの ［**Workflow Status**］ は、 [**承認ワークフロー**](../order-workflows/introduction-to-order-workflows.md#approval-workflow-buyer-side-cart-approval-only) での注文の進行状況を示します。 この順序ワークフロー、3つのワークフローがあります： **下書き** 、 **保留中** 、及び **承認済み** 。

   ![ワークフローステータスの［Open］タブ](./order-management-statuses-reference-guide/images/06.png)

| ワークフローのステータス | 説明                                                                                                                          |
|:------------ |:--------------------------------------------------------------------------------------------------------------------------- |
| 下書き          | 商品はカートに追加されましたが、購入者によるレビューと[承認](../order-workflows/approving-or-rejecting-orders-in-order-workflows.md)のためにカートはまだ送信されていません。 |
| 申請中          | カート(注文）はレビューと[承認](../order-workflows/approving-or-rejecting-orders-in-order-workflows.md)のために提出されましたが、購入者によって承認されていません。     |
| 承認済み         | 購入者による注文の確認と[承認](../order-workflows/approving-or-rejecting-orders-in-order-workflows.md)が行われ、注文はチェックアウトに進むことができます。          |

### 返答待ち

［**Pending**］ タブの ［**Workflow Status**］ は、 [**送信ワークフロー**](../order-workflows/introduction-to-order-workflows.md#transmission-workflow-seller-side-order-approval-only) での注文の進行状況を示します。 この注文ワークフローでは、 ［**Pending**］ および ［**Approved**］ の2つのワークフローステータスが使用可能です。

   ![ワークフローステータスの［Pending］および［送信済み］タブ](./order-management-statuses-reference-guide/images/07.png)

| ワークフローのステータス | 説明                                                                                                                                                                                                     |
|:------------ |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 申請中          | 注文は行われましたが、販売者による[承認](../order-workflows/approving-or-rejecting-orders-in-order-workflows.md)がまだ行われていません。                                                                                              |
| 承認済み         | 販売者によって注文の確認と[承認](../order-workflows/approving-or-rejecting-orders-in-order-workflows.md)が行われ、注文を [送信](./processing-an-order.md#commerce-20-and-below) することができます。 (注：このワークフローステータスは、 ［**送信済み**］ タブにも表示されます。） |

## 追加情報

* [注文ワークフローの概要](../order-workflows/introduction-to-order-workflows.md)
* [注文ワークフローでの注文の承認または拒否](../order-workflows/approving-or-rejecting-orders-in-order-workflows.md)
* [注文の処理](./processing-an-order.md)
* [注文メニューリファレンスガイド](./orders-menu-reference-guide.md)
* [出荷の概要](../shipments/introduction-to-shipments.md)
