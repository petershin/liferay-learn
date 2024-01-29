# ディストリビューター・アプリケーション用のピックリストの作成

Delectable Bonsaiは、各ビジネスチャンスの相対的な価値を評価するための情報を収集したいと考えている。 この場合、応募者にあらかじめ定義された選択肢から選んでもらうことを望んでいる。 これはLiferayのピックリストを使うことで実現できます。

ピックリストは、単一選択フィールドや複数選択フィールドのオプションを決定する文字列値の定義済みリストです。 Delectable BonsaiはDistributor Applicationオブジェクトにこれらのリストを必要とします：

* 業態
* 販売地域
* 流通チャネル
* 注文タイプ
* 商品種類
* 年間購入量
* 製品ラベル

ここではLiferay UIを使って最初のピックリストを作成します。

1. **Global Menu**( ![Global Menu](../../images/icon-applications-menu.png) ) を開き、 **Control Panel** タブを開き、 **Picklists** をクリックする。

1. **Add**( ![Add Button](../../images/icon-add.png) ) をクリックし、名称に Business Types を入力し、 **Save** をクリックする。

   ![Business Typesピックリストを作成します。](creating-picklists-for-distributor-applications/images/01.png)

1. ピックリストの編集を始める。

1. **Add**( ![Add Button](../../images/icon-add.png) ) をクリックし、これらの項目をピックリストに追加する：

   | 名前      | キー                    |
   |:------- |:--------------------- |
   | 独立事業    | `independentBusiness` |
   | フランチャイズ | `franchise`           |
   | その他     | `other`               |

1. 各項目を編集し、ERCをこれらの値に設定する：

   | 外部参照コード                              |
   |:------------------------------------ |
   | `BUSINESS_TYPE_INDEPENDENT_BUSINESS` |
   | `BUSINESS_TYPE_FRANCHISE`            |
   | `BUSINESS_TYPE_OTHER`                |

   ![ピックリストに3つのアイテムを追加し、それらのERCを更新する。](./creating-picklists-for-distributor-applications/images/02.png)

1. ピックリストのERCを `LIST_BUSINESS_TYPES`に変更する。

   ![ピックリストのERCを更新する。](./creating-picklists-for-distributor-applications/images/03.png)

1. ［**Save**］ をクリックします。

保存されたピックリストは、Distributor Applicationオブジェクトのフィールドとして使用することができます。

その前に、Delectable Bonsaiにはあと6つのピックリストが必要だ。 しかし、これらのリストを手動で作成するのではなく、 `headless-admin-list-type` REST APIを使ってプログラムで作成する。

次へ [REST APIを使ったピックリストの作成](./creating-picklists-using-rest-apis.md)

## 関連コンセプト

* [候補リスト](https://learn.liferay.com/ja/w/dxp/building-applications/objects/picklists)
