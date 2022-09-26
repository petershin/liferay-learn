---
toc:
- ./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id.md
---
# 自動ライブチャットシステムの有効化

```{toctree}
:maxdepth: 3

enabling-automated-live-chat-systems/getting-a-chat-provider-account-id.md
```

{bdg-secondary}`Liferay 7.4以降で利用可能`

Liferayは現在、多数のライブサポートチャットプラットフォームとの統合を提供しています。 この統合を有効にすると、Liferayインスタンスのサイトにチャットウィンドウが追加され、ユーザーのサポートとサイトエクスペリエンスを向上させるために使用できます。

## Click To Chatの有効化

Click To Chatを有効にするには、 ［**Instance Settings**］ に移動します。

1. ［**グローバルメニュー**］(![icon](../../images/icon-applications-menu.png)) &rarr; ［**コントロールパネル**］ &rarr; ［**Instance Settings**］ に移動します。

    ![コントロールパネルの［Instance Settings］に移動します。](./enabling-automated-live-chat-systems/images/02.png)

1. ［**Content and Data**］ セクションで、 ［**Click To Chat**］ をクリックします。

    ![［コンテンツとデータ］の下にClick To Chatのアイコンが表示されます。](./enabling-automated-live-chat-systems/images/03.png)

1. インスタンスでClick to Chatを有効にするには、 ［**Enable Click to Chat**］ トグルを切り替えます。

    ![スイッチをオンに切り替えてClick to Chatを有効にします。](./enabling-automated-live-chat-systems/images/04.png)

1. 有効にしたら、[サイト設定](../site-settings.md)戦略を選択する必要があります。 サイト設定戦略は、特定の[Liferayインスタンス](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md)に存在するサイト間でClick to Chatを有効にする方法を決定します。

    ![サイト設定戦略オプションを選択します。](./enabling-automated-live-chat-systems/images/05.png)

   **Always Inherit** ：Click To Chatはインスタンス上のすべてのサイトで有効になり、サイト設定で行われた構成は無視されます。

   **Always Override** ：サイト設定で構成されたClick to Chatの設定は、インスタンス設定で構成された設定よりも常に優先されます。

   **Inherit or Override** ：サイトのサイト設定で他に構成されていない限り、サイトはインスタンス設定から構成を継承します。

1. チャットプロバイダーを選択し、チャットプロバイダーから提供された [アカウントIDまたはトークン](#getting-the-chat-provider-account-id-or-token) を入力します。

    ![使用するチャットプロバイダーを選択します。 ](./enabling-automated-live-chat-systems/images/06.png)

1. （オプション）［**Guest Users Allowed**］ トグルをクリックして、ゲストユーザー（認証されていないユーザー）がサイトのClick to Chat機能にアクセスできるようにするかどうかを構成します。

1. ［**保存**］ をクリックします。

Click To Chatとライブチャットプロバイダーとの統合が構成されました。

## チャットプロバイダーのアカウントIDまたはトークンの取得

チャットプロバイダーのアカウントIDまたはトークンを取得する方法がわからない場合は、利用可能なチャットプロバイダーについて次の記事を参照してください。

* [Chatwoot](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/chatwoot.md)
* [Crisp](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/crisp.md)
* [Hubspot](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/hubspot.md)
* [JivoChat](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/jivochat.md)
* [LiveChat](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/livechat.md)
* [Liveperson](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/liveperson.md)
* [Smartsupp](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/smartsupp.md)
* [Tawk.to](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/tawk-to.md)
* [Tidio](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/tidio.md)
* [Zendesk](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/zendesk.md)
