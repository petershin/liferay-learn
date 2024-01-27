# 最少注文金額ルールの使用

{bdg-secondary}`liferay DXP 7.4 U1+/GA5+`

注文の処理対にコストがかかるため、一定額以上の注文しか受け付けないようにすることもできます。 これは、注文ルールで、最少注文以下の金額ではチェックアウトできないように設定することで実現できます。

## 注文ルールの概要

注文ルールが適用された場合、購入者がチェックアウトを継続するには、ルールを満たす必要があります。 最低注文金額のルールの場合、購入者がチェックアウトするためには、カートの合計金額または小計金額がルールに設定されている必要があります。 そうでない場合は、次に進むために必要な最少注文金額が警告メッセージで表示されます。

![Warning message displayed for not meeting the minimum order amount.](./using-the-minimum-order-amount-rule/images/01.png)

## 注文ルールの作成

最少注文金額のルールは、すぐに利用可能です。

1. *グローバルメニュー* ([アプリケーションメニューアイコン](../../images/icon-applications-menu.png))を開き、_Commerce_ &rarr; _Order Rules_をクリックします。

1. *追加*ボタン(![アイコンの追加](../../images/icon-add.png))をクリックし、以下の情報を入力します。

   **名前:**最低注文価格 $30

   **説明:**最低注文金額の注文ルールをテストする。

   **タイプ：** 最低注文金額

1. *Submit*をクリックしてください。

   ![The Order Rule screen contains all you need to configure and activate Order Rules.](./using-the-minimum-order-amount-rule/images/02.png)

注文ルールの設定ビューが表示されます。 *優先順位*は、複数のルールがある場合にどのオーダールールを優先するかを決定する。 数値の小さい方が優先されます。 この機能は、_Active_トグルを使用して有効にし、合計または小計に最低注文金額を適用するように設定することができます。 また、ここで通貨を設定することができます。

## 注文ルール適合性

![You can set the Order Rule eligibility for Accounts, Account Groups, Channels or Order Types.](./using-the-minimum-order-amount-rule/images/03.png)

［適合性］タブでは、アカウント、アカウントグループ、チャンネル、または注文タイプに対する注文ルールの適合性を設定することができます。 デフォルトでは、これらすべてに適用されます。 特定のエンティティに関連付ける場合は、ラジオボタンをクリックし、検索バーを使って選択します。
