# パブリケーションでのコラボレーション

{bdg-secondary}`liferay 7.4+が利用可能です。`

デフォルトでは、パブリケーションには制作者のみがアクセスできます。 ただし、パブリケーションの制作者は、他のユーザーを招待して、パブリケーションを表示、編集、および公開することができます。 進行中、スケジュール済み、および公開済みのパブリケーションにユーザーを追加できます。

[$LIFERAY_LEARN_YOUTUBE_URL$]=https://www.youtube.com/embed/n790hDkDenI

ユーザーをパブリケーションに招待したら、統合コメント機能を使用して、寄稿者間のコラボレーションを促進できます。

## パブリケーションにユーザーを招待する

次の手順に従って、ユーザーをパブリケーションでの共同作業に招待します。

1. グローバル・メニュー(![グローバル・メニュー](../../../images/icon-applications-menu.png))を開き、 **アプリケーション** タブをクリックし、 **出版物** に進みます。

1. 目的のパブリケーションの **Actions** ボタン（ [Actions Button](../../../images/icon-actions.png) ）をクリックし、 **Invite Users** を選択します。

   ![Click the publication's Actions button and select Invite Users.](./collaborating-on-publications/images/01.png)

   または、パブリケーションの変更を確認し始め、 **Invite Users**(![Invite Users](../../../images/icon-plus.png)) をクリックします。

   ![In publication Changes page, click the Invite Users button.](./collaborating-on-publications/images/02.png)

   ```{note}
   これは、公開された出版物にユーザーを招待する唯一の方法です。
   ```

1. ドロップダウンメニューを使用して、 **view** 、 **edit** 、 **publish** 、 **invite** の権限を付与する。

   ![Use the drop-down menu to determine the users permissions for the publication.](./collaborating-on-publications/images/03.png)

1. **ユーザー** を検索し、選択します。

   各ユーザーには選択した権限が割り当てられますが、招待状を送信する前と後にその権限を編集できます。

   ![Search for and select the desired users.](./collaborating-on-publications/images/04.png)

1. **送信** をクリックして、ユーザーをパブリケーションに追加します。

招待されたユーザーには通知が届き、パブリケーションでの共同作業を開始できます。

## パブリケーションにコメントする

共同作業を行うユーザーは、［Changes］ページからパブリケーションにコメントを追加できます。 各コメントは、それらが作成されたパブリケーションにスコープされます。

1. [グローバルメニュー](../../../images/icon-applications-menu.png) を開き、[アプリケーション] タブをクリックし、[出版物] に進みます。

1. ご希望の出版物をクリックしてください。

1. **コメント** ボタン( ![コメントボタン](../../../images/icon-comments-w.png))をクリックします。

1. チャットウィンドウにコメントを入力し、 **返信** をクリックします。

   ![Click the Comments button, enter your comment, and click Reply.](./collaborating-on-publications/images/05.png)

共同作業しているすべてのユーザーにコメントが通知され、返信することもできます。

## パブリケーションからユーザーを削除する

パブリケーションからコラボレーターを削除するには、次の手順に従います。

1. 目的の出版物の **Invite User** モーダルウィンドウを開きます。

1. 目的のユーザーのドロップダウンメニューをクリックし、 **Remove** を選択します。

   ![Open the permissions drop-down menu and select Remove.](./collaborating-on-publications/images/06.png)

1. ［**保存**］をクリックします。

## リンクによる出版物の共有

{bdg-link-primary}` [ベータ版特集](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) `

{bdg-secondary}`liferay 7.4 2023.Q3+/GA98+`.

パブリケーションの変更をサイト・ユーザ以外の人と共有する必要がある場合、パブリケーションのリンク共有を有効にすることができます。

1. 目的のパブリケーションの **Actions**(![Actions Button](../../../images/icon-actions.png)) をクリックし、 **Invite Users** を選択して、 **Share Link** タブに移動します。

   ![Select Invite Users and go to the Share Link tab.](./collaborating-on-publications/images/07.png)

   または、出版物の変更を確認し始め、 **共有**(![共有ボタン](../../../images/icon-link.png))をクリックします。

   ![Click the Share button.](./collaborating-on-publications/images/08.png)

1. スイッチを切り替えて共有を有効にする。

1. リンクをコピーしてください。

   ![Enable sharing and copy the link.](./collaborating-on-publications/images/09.png)

リンクがあれば、誰でも出版物の変更点を見ることができる。

## 関連トピック

* [出版物の作成と管理](./creating-and-managing-publications.md)
* [変更の作成と公開](./making-and-publishing-changes.md)
* [コンフリクトの解決](./resolving-conflicts.md)
