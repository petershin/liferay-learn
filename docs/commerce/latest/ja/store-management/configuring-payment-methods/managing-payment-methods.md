# 支払方法の管理

Liferay Commerceの支払い方法は、[チャネル](../../store-management/channels/introduction-to-channels.md)およびストア[サイト](../../starting-a-store/sites-and-site-types.md)に限定されます。 Liferay Commerceインスタンスの同じインスタンスで複数のストアフロントがホストされている場合、管理者は各サイトで異なる支払い方法を使用できます。

支払い方法を管理するには、 _［コントロールパネル］_ &rarr; _［コマース］_ &rarr; _［チャネル］_に移動します。

![Commerce 2.1チャネル](./managing-payment-methods/images/06.png)

目的のチャネルを選択し、このストアサイトの支払い方法の［ _編集_ ］をクリックします。

![支払方法ページ](./managing-payment-methods/images/04.png)

選択した支払方法が有効になったら、値で支払方法を設定します。

## 支払方法の設定

![支払方法の設定](./managing-payment-methods/images/05.png)

### ［詳細］タブ

各詳細画面には、チェックアウトウィジェットで支払方法を描画される方法を決定するフィールドが含まれています。

| Field | Description                                       |
|:----- |:------------------------------------------------- |
| 名前    | 支払方法の名前                                           |
| 説明    | 支払方法の簡単な説明                                        |
| アイコン  | 支払方法を表す小さな画像またはロゴをアップロードします                       |
| 重要度   | チェックアウトプロセスで支払い方法が表示される順序を決定します。数値が小さいほど高く表示されます。 |
| 有効    | トグルを切り替えて、支払方法を有効または無効にします                        |

### ［設定］タブ

支払い方法の_［設定］_タブでは、ストア管理者が支払い方法をストアに統合します。

各支払方法を有効にする方法については、対応する記事を参照してください。

* [Authorize.net](./authorize.net.md)
* [Mercanet](./mercanet.md)
* [郵便為替](./money-orders.md)
* [PayPal](./paypal.md)

## Commerce 2.0以前

Liferay Commerceの以前のバージョンでは、支払方法はストア[サイト](../../starting-a-store/sites-and-site-types.md)によって範囲設定されています。

Commerce 2.0以下で支払い方法を管理するには、 _サイト管理_ → _Commerce_ → _設定_ます。

![支払方法ページ](./managing-payment-methods/images/07.png)

［ _支払い方法_ ］タブを選択します。

![支払方法ページ](./managing-payment-methods/images/01.png)

### ［詳細］タブ（2.0）

![支払方法の設定](./managing-payment-methods/images/02.png)

### ［制限］タブ（2.0）

制限は、指定された国の購入者の支払方法を無効にします。

![支払方法の制限を設定する](./managing-payment-methods/images/03.png)
