# アカウント・セレクタ・フラグメントの使用

{bdg-secondary}`liferay DXP 7.4 U72+/GA72+`

アカウントセレクターフラグメントは、ユーザーが商品を閲覧したり注文を作成したりする際に、アカウントを簡単に切り替える方法を提供します。

```{tip}
このフラグメントは、 [カタログ](../commerce-storefront-pages/catalog.md) 、 [オープンカート](../commerce-storefront-pages/pending-orders.md) 、 [チェックアウト](../commerce-storefront-pages/checkout.md) のページがあるときに最適に機能する。
```

## アカウントセレクターフラグメントをページに追加する

1. 目的のコンテンツページまたはテンプレートに移動し、 **Edit**（![編集アイコン](../../images/icon-edit-pencil.png)）をクリックします。

1. フラグメントとウィジェットのサイドバー（ [ウィジェット・アイコンを追加](../../images/icon-add-widget.png) ）で、 **account selector** を検索する。

   ![Search for the Account Selector fragment in the Fragments and Widgets sidebar.](./using-the-account-selector-fragment/images/01.png)

1. フラグメントをページにドラッグ＆ドロップする。 この断片を [アカウント管理ウィジェット](https://learn.liferay.com/w/dxp/users-and-permissions/accounts/account-management-widget) と間違えないでください。

1. **Publish** をクリックする。

   ![Click the account icon to open the account selector.](./using-the-account-selector-fragment/images/02.png)

アカウントセレクターは、ユーザーが選択したアカウントが存在する場合、即座に表示します。

## アカウントセレクターの詳細

アカウントセレクタをページに追加した後、アカウントアイコンをクリックして開くことができます。 ここでは、管理権限のあるアカウントにアクセスできます。 また、_Create New Order（新規注文の作成）ボタンをクリックして、アカウントセレクタから新規注文を作成することもできます。 これを正しく動作させるには、 [Open Carts ページ](../commerce-storefront-pages/pending-orders.md) が必要です。

有効な注文がある場合、アカウント・セレクタは注文番号とステータスをアカウント名のすぐ下に表示します。 アクティブなワークフローがある場合、注文は **Draft** ステータスで作成される。

![Open the account selector to create a new order or switch between accounts.](./using-the-account-selector-fragment/images/03.gif)

## 関連トピック

[カタログ](../commerce-storefront-pages/catalog.md)

[保留中の注文](../commerce-storefront-pages/pending-orders.md)

[チェックアウト](../commerce-storefront-pages/checkout.md)
