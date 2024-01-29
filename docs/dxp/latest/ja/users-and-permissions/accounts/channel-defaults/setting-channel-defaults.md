# チャンネルのデフォルト設定

{bdg-secondary}`liferay 7.4 U49+/GA49+`.

必要なアカウント管理権限を持つユーザーは、ビジネスアカウントのチャンネル・デフォルトを設定できます。

<!-- Link to Channel Defaults Permission Guide when published -->

1. **グローバル・メニュー**( ![グローバル・メニュー](../../../images/icon-applications-menu.png))を開き、 **コントロール・パネル** &rarr; **アカウント** に移動します。

1. ビジネスアカウントを選択し、 **Channel Defaults** タブに進みます。

ここでは以下のデフォルトを設定できる。

```{note}
個々のチャンネルと他のすべてのチャンネルにデフォルトを設定した場合、適格であれば個々のデフォルトが優先されます。
```

## デフォルトの請求先住所と配送先住所

1. 請求先住所]または[配送先住所]の下にある **追加**( ![追加ボタン](../../../images/icon-add.png))をクリックします。

1. 全チャンネル* または個別のチャンネルを選択します。

1. 住所を選択してください。

1. ［**保存**］をクリックします。

   ![Set default billing and shipping addresses for all or individual channels.](./setting-channel-defaults/images/01.png)

```{note}
チャネルのデフォルトを管理できるのは、アカウント管理権限を持つユーザーのみです。 ただし、アカウントユーザーは、「アカウント詳細」タブで、すべてのチャネルのデフォルトの請求先住所と配送先住所を設定できます。
```

## 既定条件

1. 配送条件または支払条件の下にある **追加**( ![追加ボタン](../../../images/icon-add.png))をクリックします。

1. 全チャンネル* または個別のチャンネルを選択します。

1. (オプション)**Override Eligibility** トグルを有効にして、条件に設定された適格性を上書きします。

   ```{important}
   支払い条件は支払い方法とリンクし、配送条件は配送オプションとリンクします。 支払い方法または配送オプションに複数の適格な条件がある場合、適格性の優先により、適格性に関係なく、選択された条件がデフォルトとして設定されます。 詳しくは、 [Understanding Eligibility and Channel Defaults](../channel-defaults.md#understanding-eligibility-and-channel-defaults) 。
   ```

1. 用語*を選択してください。

1. ［**保存**］をクリックします。

   ![Set default terms and conditions for all or individual channels.](./setting-channel-defaults/images/02.png)

## デフォルトの配送オプション

デフォルトの出荷値は、チャンネルの既存の優先順位設定によって決定される。 他の配送オプションが利用可能な場合は、そのいずれかをデフォルトとして選択できます：

1. Shipping Options **に移動し、希望するチャネルの** Edit*をクリックします。

1. 配送オプションを選択してください。

1. ［**保存**］をクリックします。

   ![Set a default shipping option for individual channels.](./setting-channel-defaults/images/03.png)

## デフォルト価格表と割引

1. 価格表]または[割引]の下にある **追加**(![追加ボタン](../../../images/icon-add.png))をクリックします。

1. **全チャンネル** または個別のチャンネルを選択します。

1. (オプション)**Override Eligibility** トグルを有効にして、価格リストに設定されている既存の適格性基準を上書きします。

1. 価格表 **または** 割引*を選択してください。

1. ［**保存**］をクリックします。

   ![Set a default price list or discount for all or individual channels.](./setting-channel-defaults/images/04.png)

## デフォルト通貨

1. 通貨]の下にある **追加**( ![追加ボタン](../../../images/icon-add.png))をクリックします。

1. 全チャンネル* または個別のチャンネルを選択します。

1. 通貨を選択してください。

   ```{important}
   これは、ナビゲーション中のみ、口座のデフォルトのチャネル通貨を設定します。 商品ページとカタログでは、ここで設定された通貨が使用されます。 チャンネル作成時に設定された通貨は変更されない。
   ```

1. ［**保存**］をクリックします。

   ![Set a default currency for all or individual channels.](./setting-channel-defaults/images/05.png)

## デフォルトの支払い方法

デフォルトの支払い方法は、チャンネルの既存の優先順位設定によって決定されます。 他の支払い方法が利用可能な場合は、そのいずれかをデフォルトとして選択することができます：

1. **支払い方法** に移動し、希望のチャネルの_編集*をクリックします。

1. 支払い方法を選択してください。

1. ［**保存**］をクリックします。

   ![Set a default payment method for individual channels.](./setting-channel-defaults/images/06.png)

## デフォルト・チャネル・アカウント・マネージャー

1. チャンネル・アカウント・マネージャーの下にある **追加**( ![追加ボタン](../../../images/icon-add.png))をクリックします。

1. 全チャンネル* または個別のチャンネルを選択します。

   ```{tip}
   同じチャネルに複数のチャネル・アカウント・マネジャーを割り当てることができます。
   ```

1. ユーザーを選択します。

   アカウント > アカウントエントリ：Manage Available Accounts via User Channel Rel` 権限を持つすべてのユーザがチャネルアカウントマネージャのドロップダウンに表示されます。 詳しくは、 [Understanding Channel Account Managers](#understanding-channel-account-managers) 。

1. ［**保存**］をクリックします。

   ![Select default channel account manager for all or individual channels.](./setting-channel-defaults/images/07.png)

### チャネル・アカウント・マネージャーを理解する

デフォルトのチャネルアカウントマネージャを選択すると、`Accounts > Account Entry：Manage Available Accounts via User Channel Rel` 権限を持つユーザのみが表示されます。 この権限を使用すると、アカウントメンバーまたは組織アカウント管理者であることを必要とせずに、ユーザーにアカウントへのアクセス権を付与することができます。

![Users with this permission appear in the channel account manager dropdown menu.](./setting-channel-defaults/images/08.png)

この権限だけでは、Accountsアプリケーションへのアクセスや、個々のアカウントの表示と更新は許可されません。 また、価格リストやその他のコマース・エンティティの注文管理やチャネル・デフォルトの設定もできない。 チャネルアカウントマネージャーにこれらの管理アクションを実行させたい場合、各アプリケーション（例：Accounts、Orders、Price Lists）に必要なパーミッションを与える必要があります。 詳細は [チャンネル・デフォルト・パーミッション・リファレンス](./channel-defaults-permissions-reference.md) を参照。

```{note}
 [組織](../../organizations/understanding-organizations.md) を使用する場合、ユーザは、デフォルトのチャネル・アカウント・マネージャであるアカウントとともに、管理する権限を持っている組織アカウントを引き続き管理することができます。
```

## 関連トピック

* [チャンネルのデフォルト](../channel-defaults.md)
* [チャンネル・デフォルト パーミッション・リファレンス](./channel-defaults-permissions-reference.md)
* [チャネルについて](https://learn.liferay.com/web/guest/w/commerce/store-management/channels/introduction-to-channels)
