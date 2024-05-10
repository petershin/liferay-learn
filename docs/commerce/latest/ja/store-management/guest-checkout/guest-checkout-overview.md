# ゲストのチェックアウトの概要

ゲストチェックアウト機能は、[チャネル](../../store-management/channels/introduction-to-channels.md)ごとに有効にすることができ、ユーザーはサイトに登録されたアカウントがなくても注文を送信することができます。 詳しくは[ゲストチェックアウトの有効化](./enabling-guest-checkout.md)を参照してください。

ゲストチェックアウトを有効にすると、ゲストユーザーはチェックアウトの際に［Eメールアドレス］の入力が必要になります。

![続行するには、ゲストは［Eメールアドレス］を入力する必要があります。](./guest-checkout-overview/images/01.png)

Eメールの入力後、ゲストはログインするか、アカウントを作成するか、またはゲストとして継続するかを尋ねられます。 カートに商品を入れた後、チェックアウトする前にサインインすると、その商品は自動的に自分のアカウントのカートに引き継がれます。

![ユーザーはサインインするか、アカウントを作成するか、またはゲストとして続行することができます。](./guest-checkout-overview/images/03.png)

## ゲストによる注文の処理

ゲストが注文を送信すると、他の注文と同じように処理されます。 詳細は、[注文の処理](../../order-management/orders/processing-an-order.md)を参照してください。

```{note}
ゲストは、たとえ同じメールアドレスを持っていても、認証された他のユーザーと注文履歴を共有することはありません。
```

## ゲストのチェックアウト認証ページの作成

ゲストチェックアウトには、 [ページの作成](https://learn.liferay.com/w/dxp/site-building/creating-pages) に **ゲストのチェックアウト認証** ウィジェットを設置する必要があります。 このページとウィジェットを生成するには、[チャネル設定](../../store-management/channels/channels-reference-guide.md)のヘルスチェック機能を使用します。

［**Continue as a Guest**］ をクリックすると、顧客はログインしたりアカウントを作成したりすることなく、購入を完了することができます。

![別のオプションは、ゲストのチェックアウト認証ウィジェットです。](./guest-checkout-overview/images/02.png)

この認証ページが存在しない場合、ゲストは **チェックアウト** ウィジェットのあるページにリダイレクトされます。

## 関連トピック

* [ゲストチェックアウトの有効化](./enabling-guest-checkout.md)
* [チャネルについて](../../store-management/channels/introduction-to-channels.md)
* [チャネル管理](../../store-management/channels/managing-channels.md)
* [チャネルリファレンスガイド](../../store-management/channels/channels-reference-guide.md)
