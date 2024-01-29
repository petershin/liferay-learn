# チャンネルの作成と設定

チャネルとは、顧客ポータル、B2Bマーケットプレイス、バックオフィスの電話販売など、製品を販売するための手段である。 そのサイトで製品を販売するには、チャネルをサイトにリンクする必要があります。 クラリティは、B2C顧客向けとB2B顧客向けの2つのオンラインストアを運営している。 これをサポートするために、カイルが2つのチャンネルを作り、対応するサイトにリンクさせるのを手伝わなければならない。

チャンネルを作成する、

1. グローバルメニュー( [グローバルメニュー](../../images/icon-applications-menu.png) )を開き、 **Commerce** → **Channels** に移動します。

1. **追加**(![Add](../../images/icon-add.png)) をクリックし、以下の詳細を入力します：

   **クラリティB2C**

   **通貨：** 米ドル

   **タイプ：** サイト

   ![Enter the name, currency, and type for the channel.](./creating-and-configuring-channels/images/01.png)

1. **追加** をクリックする。

これにより、B2Cストアに新たなチャネルが生まれる。 B2Bチャネルを以下の情報で作成するために、ステップを繰り返します。

| 名前       | 為替レート | 種類  |
| :------- | :---- | :-- |
| クラリティB2B | 米ドル   | サイト |

両方のチャンネルを作成したら、対応するLiferayサイトにリンクし、設定する必要があります。

## B2Cチャンネルの設定

B2Cチャネルでは、支払い方法、配送方法を設定し、サイトタイプがB2Cに設定されていることを確認します。

1. Details "セクションで、"Commerce Site Type "を " **B2C** "に設定する。 [サイトタイプ](/w/commerce/starting-a-store/sites-and-site-types#site-types) がB2Cの場合、サイト内のアカウントはすべて個人アカウントでなければなりません。

1. Type **タブを選択し、***Select Site** をクリックします。

1. クラリティB2C*サイトを選ぶ

1. ［**Save**］をクリックします。

このチャネルを使用して、お客様のサイトからの注文を受け付けることができます。

クラリティはB2Cの顧客にPayPalによる支払いオプションを提供している。 お客様からのご注文は、一律料金の配送方法で発送されます。 Liferayのすぐに使える支払い方法と配送方法を使って、これらの両方を実装することができます。

### ペイパルの設定

1. [PayPal Developer Dashboard](https://developer.paypal.com/dashboard/) にアクセスし、アカウントにサインアップしてください。

1. サンドボックス*モードに切り替える。

   ![Switch to sandbox mode using the toggle.](./creating-and-configuring-channels/images/02.png)

1. Apps & Credentials*タブに移動します。

1. アプリの作成*をクリックします。

1. 名前に **Clarity** と入力し、タイプを **Merchant** とする。

1. アプリの作成*をクリックします。

これにより、名前、クライアントID、秘密鍵が設定されたアプリが作成される。

1. クライアントIDと秘密鍵をコピーする。

   ![Copy the client ID and secret key.](./creating-and-configuring-channels/images/03.png)

1. さて、Liferayインスタンスに戻りましょう。 グローバルメニュー( [グローバルメニュー](../../images/icon-applications-menu.png) )を開き、 **Commerce** → **Channels** に移動します。

1. クラリティB2C*を選択してください。

1. 支払い方法 **セクションまでスクロールダウンし、***PayPal** を選択します。

1. トグルを使ってアクティブにする。

1. ［**Save**］をクリックします。

1. Configuration*タブに移動し、PayPalからコピーしたクライアントIDとシークレットキーを貼り付けます。

1. モード*をサンドボックスに設定する。

1. ［**Save**］をクリックします。

### 定額配送方法の設定

1. 配送方法]セクションに移動し、[定額料金*]を選択します。

1. トグルを使ってアクティブにする。

1. ［**Save**］をクリックします。

1. 配送オプション **ページに移動し、***追加**(![Add](../../images/icon-add.png)) ボタンをクリックします。

1. 名前は **Regular Shipping** 、金額は **$4.99** と入力してください。

1. ［**Save**］をクリックします。

1. 追加* (![Add](../../images/icon-add.png)) をもう一度クリックする。

1. 名前は **Express Shipping** 、金額は **$9.99** と入力してください。

1. ［**Save**］をクリックします。

## B2Bチャネルの設定

B2Bチャネルでは、支払い方法、配送方法を設定し、サイトタイプがB2Bに設定されていることを確認します。

1. Details]セクションで、[Commerce Site Type]を **B2B** に設定します。 [サイトタイプ](https://learn.liferay.com/web/guest/w/commerce/starting-a-store/sites-and-site-types#site-types) が B2B の場合、サイト内のすべてのアカウントはビジネスアカウントでなければなりません。

1. **Type** タブを選択し、 **Select Site** をクリックします。

1. クラリティB2B*サイトを選択してください。

1. ［**Save**］をクリックします。

クラリティは、B2Bの顧客に為替による支払いオプションを提供している。 荷物の重量に基づいて計算される変動送料で発送される。 Liferayのすぐに使える支払い方法と配送方法を使って、これらの両方を実装することができます。

### マネー・オーダーの設定

1. 支払方法のセクションに移動し、 **マネーオーダー** を選択します。

1. トグルを使ってアクティブにする。

1. ［**Save**］をクリックします。

   これはすべての注文タイプに適用されるべきである。

### 可変レート配送方法の設定

1. 次に、配送方法のセクションに移動し、 **変動料金** を選択します。

1. トグルを使ってアクティブにする。

1. ［**Save**］をクリックします。

1. Shipping Options（配送オプション）ページに移動し、 **Add**（![Add]（../../images/icon-add.png））をクリックします。

1. 名前を **Standard Shipping** と入力し、 **Save** をクリックします。

1. 配送オプション設定 **に移動し、***追加**(![Add](../../images/icon-add.png)) をクリックします。

1. ドロップダウンから先ほど作成した配送オプションを選択します。

1. Settingsセクションで、以下の詳細を入力する：

   **配送オプション:** 標準配送

   **重量：** 0.0

   **への重量：** 10.0

   **固定価格:** 4.99

   **重量単価：** 2.99

   ![Configure the available tiers of variable rate shipping.](./creating-and-configuring-channels/images/04.png)

1. これを次の内容でさらに2回繰り返す：

   | 配送オプション | 以下の重量： | 以下の重量まで： | 固定価格 | 単位重量単価 |
   | :------ | :----- | :------- | :--- | :----- |
   | 通常配送    | 10.01  | 20.0     | 5.99 | 3.99   |
   | 通常配送    | 20.01  | 30.0     | 6.99 | 4.99   |

次のセクションでは、注文通知を設定し、バイヤーの注文承認ワークフローを有効にします。 これは、ワークフローがある場合に注文のライフサイクルがどのように変化し、注文が受理されたときにユーザーにどのように通知されるかを示している。

次へ [ワークフローと通知の設定](./configuring-workflows-and-notifications.md) 

## 関連トピック

* [サイトの種類](https://learn.liferay.com/web/guest/w/commerce/starting-a-store/sites-and-site-types#site-types) 
* [アクセラレーター](https://learn.liferay.com/web/guest/w/commerce/starting-a-store/accelerators) 
