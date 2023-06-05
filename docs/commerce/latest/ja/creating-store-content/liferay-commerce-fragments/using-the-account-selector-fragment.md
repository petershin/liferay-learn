# アカウントセレクターフラグメントの使用

{bdg-secondary}`利用可能 Liferay DXP 7.4 U72+/GA72+`

Account Selectorフラグメントは、ユーザーが商品を閲覧したり注文を作成したりする際に、アカウントを簡単に切り替えることができるようにするものです。

```{tip}
このフラグメントは、 [カタログ](../commerce-storefront-pages/catalog.md) , [open cart](../commerce-storefront-pages/pending-orders.md), および [チェックアウト](../commerce-storefront-pages/checkout.md) ページで最も有効に機能します。
```

## アカウントセレクターフラグメントをページに追加する

1. 目的のコンテンツページまたはテンプレートに移動し、 **Edit**(![Edit icon](../../images/icon-edit-pencil.png)) をクリックします。

1. フラグメントとウィジェットのサイドバー（！ [ウィジェット追加アイコン](../../images/icon-add-widget.png) ）で、 **account selector** を検索します。

   ![フラグメントとウィジェット」サイドバーで「Account Selector」フラグメントを検索します。](./using-the-account-selector-fragment/images/01.png)

1. フラグメントをページ上にドラッグ＆ドロップします。 この断片を [アカウント管理ウィジェット](https://learn.liferay.com/dxp/latest/ja/users-and-permissions/accounts/account-management-widget.html) と間違えないようにしてください。

1. ［**Publish**］ をクリックします。

   ![アカウントアイコンをクリックすると、アカウントセレクタが表示されます。](./using-the-account-selector-fragment/images/02.png)

アカウントセレクターは、ユーザーが選択したアカウントが存在する場合、即座に表示します。

## アカウントセレクター詳細

アカウントセレクタのフラグメントをページに追加した後、アカウントアイコンをクリックすると、そのページを開くことができます。 ここでは、管理権限のあるアカウントにアクセスすることができます。 また、アカウントセレクターから、 **Create New Order** ボタンをクリックすることで、新しい注文を作成することができます。 これが正しく機能するためには、 [オープンカートページ](../commerce-storefront-pages/pending-orders.md)を用意する必要があります。

有効な注文がある場合、アカウントセレクタフラグメントは、アカウント名のすぐ下に注文番号とそのステータスを表示します。 アクティブなワークフローがある場合、 **Draft** のステータスで注文が作成されます。

![アカウントセレクターを開いて、新しい注文を作成したり、アカウントを切り替えたりすることができます。](./using-the-account-selector-fragment/images/03.gif)

## 関連トピック

[カタログ](../commerce-storefront-pages/catalog.md)

[保留中の注文](../commerce-storefront-pages/pending-orders.md)

[チェックアウト](../commerce-storefront-pages/checkout.md)
