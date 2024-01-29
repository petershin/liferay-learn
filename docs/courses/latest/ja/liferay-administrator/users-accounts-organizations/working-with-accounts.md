# アカウントとの連携

Liferayのアカウントは、B2C（つまり企業対消費者）のコンテキストで個々の顧客を表すことができます。 あるいは、複数のユーザーがいるB2B（企業間取引）のコンテキストを表すこともできる。 詳しくは [アカウント](https://learn.liferay.com/ja/w/dxp/users-and-permissions/accounts) を参照。

オポーチュン・オプティクスは全国に眼鏡店を展開している。 各店舗はクラリティ・ビジョン・ソリューションズから眼鏡を購入している。 以下の例では、ある市場のアカウントを設定し、アカウント・ユーザーを割り当てる方法を示しています。

## アカウントの追加

ビジネスタイプのアカウントを作成する：

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Accounts** に移動する。 **Add Account**(![Add icon](../../images/icon-add.png)) をクリックします。

1. 新しいウィンドウで、アカウント名に `Opportune Optics NYC` と入力します。 ［**保存**］ をクリックします。

1. ［**Addresses**］ タブをクリックします。 **追加**（![Add icon](../../images/icon-add.png)） をクリックします。 以下の情報を入力してください：

   * 名前 `Opportune Optics NYC`
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
   - Opportune Optics NYCの隣にある **Choose** 。

1. 以下のストアマネージャーを作成する：

   * スクリーンネーム `ノア`
   * メールアドレス： `noah@opportuneoptics.com`
   * ファーストネーム `ノア`
   * ラストネーム `ノーマン`
   * 職種名 `ストアマネージャー`

［**保存**］ をクリックします。

## アカウントの役割の割り当て

各ビジネスアカウントは、複数のユーザーと複数のロールを持つことができます。 例えば、アカウント・バイヤーはオーダーの作成を担当し、オーダー・マネージャーはオーダーの承認を担当する。

ノア・ノーマンにオーダーマネージャーの役割を割り当てる。 こうすることで、ノアの従業員は、ノアが最終的な承認を下す間に、アカウントのショッピング・カートに商品を追加することができる。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Accounts** に移動する。

   - クリック **Opportune Optics NYC** .
   - **Roles** タブをクリックする。
   - **オーダーマネージャー** をクリックする。

2. 次のウィンドウで、 **Assign User**(![Add icon](../../images/icon-add.png)) をクリックします。 ノア・ノーマンを選択し、 **Assign** をクリックする。

   ノアの従業員がアカウントに注文を追加すると、ノアは注文を承認し管理することができる。 これらのロールの詳細については、 [Commerceロールのリファレンス](https://learn.liferay.com/ja/w/commerce/users-and-accounts/roles-and-permissions/commerce-roles-reference) を参照してください。

## アカウント管理

アカウントグループを使用して、複数のアカウントを整理・管理できます。 例えば、クラリティ・ビジョン・ソリューションズ社は、オポチュニティ・オプティクス社のアカウント・グループに属する市場に対して、より低い価格設定を適用することができます。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Account Groups** に移動する。 **Add Account Group**(![Add icon](../../images/icon-add.png)) をクリックします。

2. アカウント・グループ名に `Opportune Optics` という名前をつける。 ［**保存**］ をクリックします。

3. **Accounts** タブをクリックする。

   - **Assign Account**(![Add icon](../../images/icon-add.png)) をクリックします。
   - 新しいウィンドウで、 **Opportune Optics NYC** を選択し、 **Assign** をクリックします。

   このようにして、他の場所にある別のOpportune Opticsをグループに加えることができる。

同じ事業体の下に複数のアカウントを持つ大規模なB2Bのコンテキストでは、専用の組織を作成することが理にかなっているかもしれません。 そして、組織全体のアカウントマネージャーの役割を割り当てることができる。 例えば、多くの拠点がある場合、すべてのOpportune Opticsアカウントを組織の下に置くことができます。 そして、クラリティ・ビジョン・ソリューションズの誰かがアカウント・マネージャーの役割を与えられ、すべてのアカウントを監督することができます。

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **Control Panel** &rarr; **Users and Organizations** に移動する。

   * ［**Organizations**］ タブをクリックします。
   * **追加**（![Add icon](../../images/icon-add.png)） をクリックします。
   * **名前** フィールドに `Opportune Optics` と入力する。
   *  ［**保存**］ をクリックします。

1. **コントロールパネル** &rarr; **アカウント** に移動する。 クリック **Opportune Optics NYC** .

   * ［**Organizations**］ タブをクリックします。
   * **Assign Organizations**(![Add icon](../../images/icon-add.png)) をクリックします。

1. 新しいウィンドウで、 **Opportune Optics** を選択し、 **Assign** をクリックします。 オッポーチュン・オプティクス・ニューヨークのアカウントは現在、オッポーチュン・オプティクス社の組織の一部となっています。

   ![オッポーチュン・オプティクス・ニューヨークは現在オッポーチュン・オプティクス社の傘下にあります。](./working-with-accounts/images/01.png)

1. 今度はリリー・ルイスをアカウント・マネージャーにするんだ。 ［**コントロールパネル**］ &rarr; ［**ユーザーと組織**］ へ移動します。

   * **Lily Lewis** をクリック。
   * 左ナビゲーションの **Organizations** をクリックする。
   * **選択** をクリックします。
   * Opportune Opticsの隣にある **Choose** 。
   * ［**保存**］ をクリックします。

   リリー・ルイスは現在、オポーチュン・オプティクス社の一員でもある。

5. 左ナビゲーションの **Roles** をクリックする。

   * **組織の役割の横にある**「 を選択」をクリックします。
   * アカウントマネージャーの隣にある「**Choose**」をクリックします。
   * ［**保存**］ をクリックします。

   ![リリー・ルイスは現在、オポーチュン・オプティクスのアカウント・マネージャーである。](./working-with-accounts/images/02.png)

   リリー・ルイスは現在、オポーチュン・オプティクス社の全アカウントのアカウント・マネージャーです。 アカウント・マネージャーは、アカウント・ユーザーに代わって注文を出すなどのアクションを取ることができる。

ユーザー、アカウント、組織、および権限に関するこのモジュールは終了しました。

## 関連コンセプト

- [アカウント](https://learn.liferay.com/ja/w/dxp/users-and-permissions/accounts)
- [アカウントユーザー](https://learn.liferay.com/ja/w/dxp/users-and-permissions/accounts/account-users)
- [アカウントグループ](https://learn.liferay.com/ja/w/dxp/users-and-permissions/accounts/account-groups)
- [アカウントロール](https://learn.liferay.com/ja/w/dxp/users-and-permissions/accounts/account-roles)
- [Commerceロールのリファレンス](https://learn.liferay.com/ja/w/commerce/users-and-accounts/roles-and-permissions/commerce-roles-reference)
