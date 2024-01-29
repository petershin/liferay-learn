# 支払条件と配送条件

{bdg-secondary}`liferay DXP 7.4 U16+/GA16+`.

## 支払条件

支払条件は、買い手と売り手の間の取引条件を規定するものです。 顧客ごとに異なる支払条件を指定することができます。 Liferayは、以下の条件を定義するための編集可能なテキストフィールドを提供し、あなたが作成した条件も同様に提供します。

* 購入者が費用を清算するための日数です。
* 支払期限に支払わなかった場合の遅延損害金（もしあれば）。
* 期日より前に決済された場合の割引（ある場合）。
* その他、売主・買主間で合意した条件

```{note}
支払条件は、譲渡性預金および請求書支払条件とも呼ばれる。
```

### 支払条件の作成

1. **グローバルメニュー**(![アプリケーションメニューアイコン](../../images/icon-applications-menu.png) )を開き、 **Commerce** &rarr; **Terms and Conditions** をクリックします。

   ![The Terms and Conditions menu item is available under the Order Management section.](./payment-and-delivery-terms/images/01.png)

1. **Add**(![Add icon](../../images/icon-add.png)) をクリックし、以下の情報を入力する。

   **名称：** 支払条件1

   **タイプ:** 支払条件

   **優先順位：** 0.0

   ![Enter a name, type and priority for the Payment Terms.](./payment-and-delivery-terms/images/02.png)

1. **Submit** をクリックしてください。

1. これにより、新しい支払条件が作成されます。 編集可能な説明テキストフィールドにバイヤーと合意した条件を追加し、 **Active** トグルを使用して有効にすることができます。

   ![Use the editable Description text field to add the Payment Terms and use the Active toggle to enable it.](./payment-and-delivery-terms/images/03.png)

1. ［**公開**］ をクリックします。

### 支払と支払方法の関連付け

チャンネルは複数の支払方法を持つことができ、それぞれに支払条件を関連付けることができます。 1つの支払方法に複数の支払条件がリンクされている場合、重要度によってどの支払方法が使用されるかが決定されます。

1. **グローバルメニュー**(![アプリケーションメニューアイコン](../../images/icon-applications-menu.png) )を開き、 **Commerce** &rarr; **Channels** をクリックします。

1. チャンネルを選択し、 **支払い方法** までスクロールダウンします。

1. ご希望のお支払い方法をクリックし、「資格」タブを開きます。

   ![Search for the Payment Terms to link to a Payment Method.](./payment-and-delivery-terms/images/04.png)

1. **支払条件適格性***の下にある***特定の支払条件** をクリックしてください。

1. **支払い条件の追加** で支払い条件を検索し、 **選択** をクリックします。

1. **保存** をクリックして支払条件をリンクし、設定ビューを閉じます。

1. ［**保存**］をクリックします。

### 支払条件チェックアウト手順の有効化

一つの支払方法に複数の支払条件がリンクされている場合、重要度の高いものが優先されます。 ユーザーがデフォルトの支払条件を変更する権限を持っていない場合、チェックアウト時に追加のステップが表示されません。

![You must have the permission to manage Payment Terms to be able to view and change them during checkout.](./payment-and-delivery-terms/images/05.png)

## 配送条件

配送条件は、購入者と販売者の間で注文の配送に関する条件を定義するものです。 顧客ごとに異なる配送条件を指定することができます。 納品書は、以下の条件およびお客様が作成された条件を含むことができます。

* 注文の予想納期
* 納期遅延の条件
* 返品ポリシー
* その他、売主・買主間で合意した条件

### 配送条件の作成

1. グローバルメニュー (![アプリケーションメニューアイコン](../../images/icon-applications-menu.png) )を開き、**Commerce**&rarr;**Terms and Conditions** をクリックします。

1. **Add**(![Add icon](../../images/icon-add.png)) をクリックし、以下の情報を入力する。

   **名称：** 配送条件1

   **タイプ:** 配送条件

   **優先度：** 0.0

   ![Enter a name, type and priority for the Delivery Terms.](./payment-and-delivery-terms/images/06.png)

1. **Submit** をクリックしてください。

1. これにより、新しい配送条件が作成されます。 バイヤーと合意した条件を **Description** テキストエリアに追加し、トグルを使用して有効にすることができます。

   ![Use the editable Description text field to add the Delivery Terms and use the Active toggle to enable it.](./payment-and-delivery-terms/images/07.png)

1. ［**公開**］ をクリックします。

### 配送条件と配送方法の関連付け

チャンネルは複数の配送方法を持つことができ、配送条件をそれぞれに関連付けることができます。 1つの配送方法に複数の配送条件がリンクされている場合、重要度によってどの配送方法が使用されるかが決定されます。

1. **グローバルメニュー**(![アプリケーションメニューアイコン](../../images/icon-applications-menu.png) )を開き、 **Commerce** &rarr; **Channels** をクリックします。

1. チャンネルを選択し、 **配送方法** までスクロールダウンします。

1. ご希望の配送方法をクリックし、 **配送オプション** タブを開きます。

1. 適切な配送オプションを選択し、 **Eligibility** タブを開きます。

   ![Search for the Delivery Terms to link to a Shipping Option.](./payment-and-delivery-terms/images/08.png)

1. **配送条件対象** の下にある **特定の配送条件** をクリックしてください。

1. **配送条件の追加** で配送条件を検索し、 **選択** をクリックします。

1. **保存** をクリックして配送条件をリンクし、設定ビューを閉じます。

1. ［**保存**］をクリックします。

### 配送条件チェックアウト手順の有効化

配送方法に複数の配送条件がリンクされている場合、重要度の高いものが優先されます。 ユーザーがデフォルトの配送条件を変更する権限を持っていない場合、チェックアウト時に追加の手順が表示されません。

![You must have the permission to manage Delivery Terms to be able to view and change them during checkout.](./payment-and-delivery-terms/images/09.png)

## 利用規約の適合性

支払条件と配送条件の両方を、［Eligibility］タブを使用して特定の注文タイプにリンクさせることができます。

1. 支払い条件または配送条件の **対象** タブをクリックします。

1. [特定の注文タイプ]ラジオボタンをクリックします。

   ![Use the eligibility tab to link the Payment and Delivery Terms to specific Order Types.](./payment-and-delivery-terms/images/10.png)

1. 注文タイプを検索し、 **選択** をクリックします。

1. ［**公開**］ をクリックします。
