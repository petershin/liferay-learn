---
toc:
  - ./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id.md
---
# 自動ライブチャットシステムの有効化

{bdg-secondary}`liferay 7.4+`

Liferayは現在、多数のライブサポートチャットプラットフォームとの統合を提供しています。 この統合を有効にすると、Liferayインスタンスのサイトにチャットウィンドウが追加され、ユーザーのサポートとサイトエクスペリエンスを向上させるために使用できます。

## Click To Chatの有効化

Click To Chat を有効にするには、[インスタンス設定]に進みます。

1. **グローバル・メニュー**(![icon](../../images/icon-applications-menu.png)) に移動します。 &rarr; **コントロールパネル** &rarr; **インスタンス設定** .

   ![Go to Instance Settings under Control Panel.](./enabling-automated-live-chat-systems/images/02.png)

1. コンテンツとデータ」セクションで、「チャットをクリック」をクリックします。

   ![You can see Click To Chat's icon under Content and Data.](./enabling-automated-live-chat-systems/images/03.png)

1. インスタンスでClick to Chatを有効にするには、 **Enable Click to Chat** toggleを切り替えます。

   ![Toggle the switch on to enable Click to Chat.](./enabling-automated-live-chat-systems/images/04.png)

1. 有効にしたら、 [サイト設定](../site-settings.md) 戦略を選択する必要があります。 Site Settings（サイト設定）ストラテジーは、特定の [Liferay インスタンス](../../system-administration/configuring-liferay/virtual-instances/understanding-virtual-instances.md) に存在するサイト全体で Click to Chat をどのように有効にするかを決定します。

   ![Choose your Site Settings Strategy option.](./enabling-automated-live-chat-systems/images/05.png)

   **常に継承されます** ：Click To Chatはインスタンス上のすべてのサイトで有効であり、サイト設定で行われた構成は無視されます。

   **常に優先** :されます：サイト設定] で設定された [クリックチャット] の設定は、[インスタンス設定] で設定された内容よりも常に優先されます。

   **継承または上書き** ：継承または上書き**：サイトのサイト設定に別の設定がない限り、サイトはインスタンス設定から設定を継承します。

1. チャットプロバイダを選択し、 [アカウント ID またはチャットプロバイダから付与されたトークン](#getting-the-chat-provider-account-id-or-token) を入力してください。

   ![使用するチャットプロバイダを選択します。](./enabling-automated-live-chat-systems/images/06.png)

1. (オプション)**Guest Users Allowed** トグルをクリックして、ゲスト・ユーザー (認証されていないユーザー) がサイトの Click to Chat 機能にアクセスできるようにするかどうかを設定します。

1. ［**保存**］をクリックします。

Click To Chatとライブチャットプロバイダーとの統合が構成されました。

## チャットプロバイダーのアカウントIDまたはトークンの取得

チャットプロバイダーのアカウントIDまたはトークンを取得する方法がわからない場合は、利用可能なチャットプロバイダーについて次の記事を参照してください。

* [Chatwoot](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/chatwoot.md)
* [クリスプ](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/crisp.md)
* [ハブスポット](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/hubspot.md)
* [JivoChat](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/jivochat.md)
* [LiveChat](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/livechat.md)
* [Liveperson](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/liveperson.md)
* [スマートサップ](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/smartsupp.md)
* [Tawk.to](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/tawk-to.md)
* [ティディオ](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/tidio.md)
* [Zendesk](./enabling-automated-live-chat-systems/getting-a-chat-provider-account-id/zendesk.md)
