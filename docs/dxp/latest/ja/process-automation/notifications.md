---
toc:
- ./notifications/configuring-personal-notifications.md
- ./notifications/creating-notification-templates.md
- ./notifications/using-the-notification-queue.md
---
# 通知

Liferayには通知ツールが統合されているため、プラットフォームのイベントをユーザーに確実に通知することができます。 Liferay DXPの場合、以下のデフォルトアプリケーションのメールやウェブサイトでの通知が含まれます。

| アプリケーション          | メール      | Webサイト   |
|:----------------- |:-------- |:-------- |
| ブログ               | &#10004; | &#10004; |
| 掲示板のディスカッション      | &#10004; | &#10004; |
| コンタクトセンター         |          | &#10004; |
| ドキュメントとメディア       | &#10004; | &#10004; |
| バッチテンプレートデザイナー    |          | &#10004; |
| メンバーの招待           |          | &#10004; |
| 自分について書かれた記事/コメント | &#10004; | &#10004; |
| 掲示板               | &#10004; | &#10004; |
| マイワークフロータスク       | &#10004; | &#10004; |
| 公開                |          | &#10004; |
| セグメントの実験          | &#10004; | &#10004; |
| 仮想インスタンス共有        | &#10004; | &#10004; |
| Webコンテンツ          | &#10004; | &#10004; |
| Wikiノード           | &#10004; | &#10004; |

メール通知設定を使用するには、インスタンスの[メールサーバーを設定する](../installation-and-upgrades/setting-up-liferay/configuring-mail.md)必要があります。 設定が完了すると、インスタンスレベルで追加の [メール通知設定](../system-administration/configuring-liferay/virtual-instances/email-settings.md)にアクセスできます。 Liferay 7.4 U33+/GA33+からは、[通知テンプレート](./notifications/creating-notification-templates.md)を作成し、オブジェクトのメール通知設定をデザインして動的に入力することも可能です。 詳しくは、 [Notification Action](../building-applications/objects/creating-and-managing-objects/actions/defining-object-actions.md#notification-actions) をご覧ください。

コマース・コンテキストでは、チャネルイベントに対する通知がサポートされています。 詳しくは、 [メールの保存](https://learn.liferay.com/commerce/latest/ja/store-management/sending-emails/store-emails.html) をご覧ください。

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} パーソナル通知の設定
:link: ./notifications/configuring-personal-notifications.md
:::

:::{grid-item-card} 通知テンプレートの作成
:link: ./notifications/creating-notification-templates.md
:::

:::{grid-item-card} 通知キューを使う
:link: ./notifications/using-the-notification-queue.md
:::
::::
