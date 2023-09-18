# アカウントとの連携

Liferayのアカウントは、B2C（つまり企業対消費者）のコンテキストで個々の顧客を表すことができます。 あるいは、複数のユーザーがいるB2B（企業間取引）のコンテキストを表すこともできる。 詳しくは [Accounts](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts) を参照。

マーベラス・マーケットは全国でスーパーマーケットを展開している。 各店舗はディレクタブル盆栽からメープルシロップを仕入れている。 以下の例では、ある市場のアカウントを設定し、アカウント・ユーザーを割り当てる方法を示しています。

## アカウントの追加

ビジネスタイプのアカウントを作成する：

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Accounts** に移動する。 **Add Account**(![Add icon](../../images/icon-add.png)) をクリックします。

1. 新しいウィンドウで、アカウント名に `Marvelous Markets NYC` と入力する。 ［**保存**］ をクリックします。

1. ［**Addresses**］ タブをクリックします。 **追加**（![Add icon](../../images/icon-add.png)） をクリックします。 以下の情報を入力してください：

   * 名前 `マーベラス・マーケッツ・ニューヨーク`
   * 国 `アメリカ合衆国`
   * Street 1: `123 Anywhere St`
   * 都市 `ニューヨーク`
   * 地域 `ニューヨーク`
   * 郵便番号 `10027`

1. **詳細** タブに戻る。

   - デフォルトアカウントアドレスセクションまでスクロールダウンしてください。
   - 請求の見出しの下にある **Set Default Address** をクリックします。
   - 作成したアドレスを選択します。
   - ［**保存**］ をクリックします。
   - 同様に、発送先住所にもデフォルトの住所を設定する。

## アカウントユーザーの追加

作成したアカウントの新規ユーザーを作成します。 アカウントに新しいユーザーを作成したり、退会したユーザーをアカウントに関連付けることができます。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Account Users** に移動する。

   - **Add User**(![Add icon](../../images/icon-add.png)) をクリックします。
   - Marvelous Markets NYCの隣にある **Choose** 。

1. 以下のストアマネージャーを作成する：

   * スクリーンネーム `ノア`
   * メールアドレス： `noah@marvelousmarkets.com`
   * ファーストネーム `ノア`
   * ラストネーム `ノーマン`
   * 職種名 `ストアマネージャー`

［**保存**］ をクリックします。

## アカウントの役割の割り当て

各ビジネスアカウントは、複数のユーザーと複数のロールを持つことができます。 例えば、アカウント・バイヤーはオーダーの作成を担当し、オーダー・マネージャーはオーダーの承認を担当する。

ノア・ノーマンにオーダーマネージャーの役割を割り当てる。 こうすることで、ノアの従業員は、ノアが最終的な承認を下す間に、アカウントのショッピング・カートに商品を追加することができる。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Accounts** に移動する。

   - クリック **Marvelous Markets NYC** .
   - **Roles** タブをクリックする。
   - **オーダーマネージャー** をクリックする。

2. 次のウィンドウで、 **Assign User**(![Add icon](../../images/icon-add.png)) をクリックします。 ノア・ノーマンを選択し、 **Assign** をクリックする。

   ノアの従業員がアカウントに注文を追加すると、ノアは注文を承認し管理することができる。 これらのロールの詳細については、 [Commerce Roles Reference](https://learn.liferay.com/en/w/commerce/users-and-accounts/roles-and-permissions/commerce-roles-reference) を参照してください。

## アカウント管理

アカウントグループを使用して、複数のアカウントを整理・管理できます。 例えば、Delectable Bonsaiは、Marvelous Marketsのアカウントグループに属しているマーケットに対して、より低い価格設定を適用することができます。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Account Groups** に移動する。 **Add Account Group**(![Add icon](../../images/icon-add.png)) をクリックします。

2. アカウント・グループ名には、 `Marvelous Markets`。 ［**保存**］ をクリックします。

3. **Accounts** タブをクリックする。

   - **Assign Account**(![Add icon](../../images/icon-add.png)) をクリックします。
   - 新しいウィンドウで、 **Marvelous Markets NYC** を選択し、 **Assign** をクリックします。

   このようにして、他の場所の異なるマーベラス・マーケットをグループに加えることができる。

同じ事業体の下に複数のアカウントを持つ大規模なB2Bのコンテキストでは、専用の組織を作成することが理にかなっているかもしれません。 そして、組織全体のアカウントマネージャーの役割を割り当てることができる。 例えば、多くの拠点がある場合、すべてのマーベラスマーケットのアカウントを組織の下に置くことができます。 そうすれば、Delectable Bonsaiの誰かがアカウントマネージャーの役割を与えられ、すべてのアカウントを監督することができます。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Users and Organizations** に移動する。

   * ［**Organizations**］ タブをクリックします。
   * **追加**（![Add icon](../../images/icon-add.png)） をクリックします。
   * **名前** の欄に `マーベラス・マーケッツ` と入力。
   * ［**保存**］ をクリックします。

1. **コントロールパネル** &rarr; **アカウント** に移動する。 クリック **Marvelous Markets NYC** .

   * ［**Organizations**］ タブをクリックします。
   * **Assign Organizations**(![Add icon](../../images/icon-add.png)) をクリックします。

1. 新しいウィンドウで、 **Marvelous Markets** を選択し、 **Assign** をクリックします。 マーベラス・マーケッツ・ニューヨークのアカウントは現在、マーベラス・マーケッツの組織の一部となっている。

   ![マーベラス・マーケッツ・ニューヨークは現在、マーベラス・マーケッツの傘下にある。](./working-with-accounts/images/01.png)

1. 今度はリリー・ルイスをアカウント・マネージャーにするんだ。 ［**コントロールパネル**］ &rarr; ［**ユーザーと組織**］ へ移動します。

   * **Lily Lewis** をクリック。
   * 左ナビゲーションの **Organizations** をクリックする。
   * **選択** をクリックします。
   * マーベラス・マーケットの隣にある「**Choose**」をクリックする。
   ［* **保存**］ をクリックします。

   リリー・ルイスは現在、マーベラス・マーケッツの一員でもある。

5. 左ナビゲーションの **Roles** をクリックする。

   * **組織の役割の横にある**「 を選択」をクリックします。
   * アカウントマネージャーの隣にある「**Choose**」をクリックします。
   ［* **保存**］ をクリックします。

   ![リリー・ルイスは現在、マーベラス・マーケッツのアカウント・マネージャーを務めている。](./working-with-accounts/images/02.png)

   リリー・ルイスは現在、マーベラス・マーケッツの全アカウントを担当するアカウント・マネージャーである。 アカウント・マネージャーは、アカウント・ユーザーに代わって注文を出すなどのアクションを取ることができる。

　 ユーザー、アカウント、組織、および権限に関するこのモジュールは終了しました。

## 関連コンセプト

- [アカウント](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts)
- [アカウントユーザー](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts/account-users)
- [アカウントグループ](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts/account-groups)
- [アカウントロール](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts/account-roles)
- [Commerceロールのリファレンス](https://learn.liferay.com/en/w/commerce/users-and-accounts/roles-and-permissions/commerce-roles-reference)
