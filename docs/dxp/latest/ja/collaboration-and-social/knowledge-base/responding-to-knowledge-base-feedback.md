# ナレッジベースフィードバックへの対応

{bdg-secondary}`liferay 7.4 U72+/GA72+`.

ナレッジベースアプリケーションでは、記事のフィードバックを閲覧・管理することができます。 これを行うには、

1. [サイトメニュー](../../images/icon-menu.png) を開き、 **コンテンツとデータ** &rarr; **ナレッジベース** に移動します。

1. **提案** セクション（ [Suggestions](../../images/icon-comments-w.png) ）にアクセスしてください。

すべてのユーザーコメントは表に表示されます。

![Access article feedback in the app's Suggestions tab.](./responding-to-knowledge-base-feedback/images/01.png)

```{note}
記事の提案を表示するには、*Knowledge Base > Knowledge Base：View Suggestions* 権限が必要です。
```

各候補には、関連する記事へのリンク、フィードバック、ユーザーの名前、フィードバックのタイムスタンプ、および候補への対応ステータスが表示されます。 各エントリーのアクションメニュー(![アクションアイコン](../../images/icon-actions.png))を使用して、エントリーを **新規** 、 **進行中** 、 **解決済み** の各状態に移動できます。

個々の候補をクリックしてマークを付け、進行状況を進めることもできます。

![Track the progress of suggestions.](./responding-to-knowledge-base-feedback/images/02.png)

フィードバックには、最初に［Move to In Progress］ボタンが表示され、次に［解決する］ボタンが表示されます。**新規**ボタンをクリックすると、提案を新しい状態に戻すことができます。 また、**Delete** ボタンをクリックすることで、提案を削除することもできます。

```{note}
記事の提案を表示するには、*ナレッジベース > ナレッジベース記事：更新*権限が必要です。 この権限が割り当てられたロールは、すべてのナレッジベースウィジェットの記事提案の状態を表示および更新することもできます。
```

候補を別のステータスに移動すると、変更をユーザーに通知する電子メールが送信されます。 自動電子メールを設定するには

1. [グローバルメニュー](../../images/icon-applications-menu.png) )を開き、[コントロールパネル]タブに移動し、[システム設定]をクリックします。

1. コンテンツとデータ」の下にある「**ナレッジ・ベース**」をクリックします。

1. サイトスコープ」の「サービス」タブで、Eメールの有効／無効を設定し、その内容を決定します。

   ![Configure the app to send emails for feedback.](./responding-to-knowledge-base-feedback/images/03.png)

1. ［**保存**］をクリックします。

メールは適切なユーザーに送信される。

## 関連トピック

* [ナレッジ・ベース記事の作成](./creating-knowledge-base-articles.md)
* [ナレッジベースの管理](./managing-the-knowledge-base.md)
* [ナレッジベース システム設定](./knowledge-base-system-settings.md)
