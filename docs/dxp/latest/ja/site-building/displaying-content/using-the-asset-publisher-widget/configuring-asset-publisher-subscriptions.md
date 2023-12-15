# Configuring Asset Publisher Subscriptions

アセットパブリッシャーは、メール購読とRSSフィード購読の2種類のサブスクリプションをサポートしています。

## メール購読

ユーザーは、アセットパブリッシャーを購読して、新しいアセットが公開されたときに電子メール通知を受け取ることができます。 最初にこの通知を有効にする必要があります。 次の手順を実行します：

1. アセットパブリッシャーにカーソルを合わせ、ウィジェットのメニューにあるオプションアイコン(![Options](../../../images/icon-app-options.png)) をクリックし、 **設定** を選択します。

1. **電子メール購読を有効にする** セレクターをはいに切り替えます。
1. フォームに記入し、 **保存** をクリックして変更を適用します。

   ![An email subscription notifies users when new assets are published.](./configuring-asset-publisher-subscriptions/images/01.png)

1. もし有効になっていなければ、「表示設定」タブの「**購読**」機能を有効にしてください。 ユーザーは、 **Subscribe** ボタンをクリックして、新しく公開されたアセットのEメール通知を受け取ることができます。

![Enabling Email Subscription adds a Subscribe link to the Asset Publisher.](./configuring-asset-publisher-subscriptions/images/02.png)

### アセットチェック間隔の設定

Liferay Portalは定期的に新しいアセットをチェックし、購読しているユーザーに新しいアセットを通知するメールを送信します。 デフォルトでは、アセットは 24 時間ごとにチェックされます。 システム設定からチェック間隔を変更できます。 次の手順を実行します：

1. Product Menuを開き、 **Control Panel** &rarr; **Configuration** &rarr; **System Settings** に進みます。
1. コンテンツとデータ」の見出しの下にある「資産」を選択します。
1. **システム スコープ** に移動します &rarr; **アセット パブリッシャー** 。
1. **Check Cron Expression** または **Check Interval** 設定を、新しいアセットをチェックしてサブスクライブしたユーザーに通知する間隔（時間単位）に変更し、 **Save** をクリックして変更を適用します。

![The Check Interval settings specifies how often assets are checked for updates.](./configuring-asset-publisher-subscriptions/images/03.png)

```{warning}
この機能を無効にする必要がある場合は、 [ブラックリスト](../../../system-administration/installing-and-managing-apps/managing-apps/blacklisting-osgi-components.md) コンポーネント。 インターバルにゼロや負の数を入力しないでください。
```

## RSSフィード購読

```{note}
RSSフィードはLiferay Portal 7.2以降では廃止予定であり、デフォルトでは無効になっています。 RSSフィードを活用するには、この機能を有効にする必要があります。
```

アセットパブリッシャーのRSSフィード購読を有効にするには、次の手順を実行します。

1. Product Menuを開き、 **Control Panel** &rarr; **Configuration** &rarr; **System Settings** に進みます。

1. コンテンツとデータ」の見出しの下にある「ウェブコンテンツ」を選択します。

1. **System Scope** &rarr; **Administration** タブで、 **Show Feeds** ボックスをチェックする。 廃止予定のアプリの詳細は、 [こちらの記事](../../../installation-and-upgrades/upgrading-liferay/reference/maintenance-mode-and-deprecations-in-7-4.md) を参照してください。

   ![Enable RSS feeds through System Settings.](./configuring-asset-publisher-subscriptions/images/04.png)

1. Asset Publisherウィジェットに戻り、ウィジェットにカーソルを合わせて、ウィジェットのメニューにあるOptionsアイコン(![Options](../../../images/icon-app-options.png)) をクリックし、 **Configuration** を選択します。

1. **RSS購読を有効にする** セレクタを「はい」に切り替えます。

1. フォームに記入し、 **保存** をクリックして変更を適用します。

   ![An RSS subscription sends RSS feeds to subscribers' RSS readers.](./configuring-asset-publisher-subscriptions/images/05.png)

1. もし有効になっていなければ、「表示設定」タブの「**購読**」機能を有効にしてください。 ユーザーは **RSS** リンクをクリックしてRSSフィードを購読することができます。

![Enabling RSS Subscription adds a RSS link to the Asset Publisher.](./configuring-asset-publisher-subscriptions/images/06.png)

## 関連情報

* [メールの設定](../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)
* [アセットパブリッシャーウィジェットを使用したアセットの表示](./displaying-assets-using-the-asset-publisher-widget.md)
* [アセットパブリッシャー表示設定の設定](./configuring-asset-publisher-display-settings.md)
