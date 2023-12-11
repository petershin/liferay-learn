# ロール変更リクエストアプリの作成

> **サブスクライバー**

ロール変更リクエストアプリは、従業員がリクエストフォームを送信することから始まります。 次に、現在のマネージャー、受信マネージャー、最後に人事へと処理が進みます。 各ステップで異なるフォームが表示され、オブジェクトはデータを蓄積します。 プロセスの終わりまでに、データオブジェクト全体が完成します。

![The Role Change Request object flows through several steps in this Workflow Powered App.](./creating-the-role-change-request-object/images/01.png)

先に進む前に、バッキングオブジェクト、フォームビュー、およびテーブルビューを作成します。 詳細は、 [ロール変更リクエストオブジェクトの作成](./creating-the-role-change-request-object.md) を参照してください。 ここでは、そこに表示されているバッキングオブジェクトに基づいてワークフロー対応アプリを作成します。

標準アプリは、オブジェクトコントロールパネルエントリ内から作成できますが、ワークフロー対応アプリは作成できません。 代わりに_Apps_コントロールパネルのエントリを使用します：

1. アプリケーションメニュー(![Applications Menu](../../../images/icon-applications-menu.png)) を開き、コントロールパネル &rarr; アプリビルダー &rarr; アプリ に移動します。

1. Workflow Powered_ タブをクリックします。 既存のワークフロー対応アプリが表示されます。

1. Add ボタン (![Add](../../../images/icon-add.png)) をクリックして、New Workflow Powered App キャンバスを開きます。

   ![The Workflow Powered App is underway.](./creating-a-workflow-powered-application/images/01.png)

1. ワークフローの最初のステップは完了した。 最初のステップは、アプリケーションのプロセスを開始する最初のフォームの送信を表します。 ステップの名前を変更した後、データとビューを設定します。

   * メイン・データ・オブジェクト：役割変更リクエスト_オブジェクトを選択する。
   * フォームの表示従業員リクエストフォームを選択します。
   * テーブルビュー：役割変更要求マスターリスト_を選択します（このテーブルビューはこのステップでは使用しません）。

   アクションを設定します。

   * 現在のアクションの名前を_Send to Manager_に変更する。

   アプリケーションを保存します。

1. アプリを再度開き、プラスアイコンをクリックしてワークフローにステップを追加します。

   名前を「レビュー」とする：Current Manager_と名付け、_Administrator_ロールに割り当てる。 ロール変更リクエストアプリに追加する各ステップは、異なるフォームに対応しています。 一緒に、すべてのステップ/フォームからバッキングオブジェクトのすべてのフィールドが入力されます。

   次に、データとビューを設定します。

   * フォームビュー現監督の評価_. 編集可能にします。

   ［ステップ設定］画面に戻り、アクションを設定します。

   * アクション名を_Forward to Receiving Manager_に変更する。

   アプリを保存します。 既存のアプリデータにアップデートを適用することに関する警告メッセージが表示された場合は、ダイアログボックスの_Save_をクリックします。 これは現在データレコードがない新しいアプリであり、警告は情報としてのものです。

1. アプリを再度開き、最後に追加したステップをクリックし、プラスアイコンをクリックして新しいステップを追加します。

   その名前を「レビュー」とする：Receiving Manager_と名付け、_Administrator_ Roleに割り当てる。

   次に、データとビューを設定します。

   * フォームビュー：ポテンシャル・マネージャーの評価_. 編集可能にします。

   ［ステップ設定］画面に戻り、アクションを設定します。

   * 既存のアクションの名前を「人事部へ転送」に変更します。 ワークフローの次のステップに移行します。

   * セカンダリーアクションを追加し、名前は_Send Back to Current Manager_とする。 前のワークフローステップに戻り、人事レビューの準備ができるまで2人のマネージャーが詳細について共同作業できるようにします。

1. アプリを再度開き、追加された最後のステップをクリックし、 プラスアイコンをクリックして新しいステップを追加します。

   名前を「レビュー」とする：HR_と名付け、_Administrator_ Roleに割り当てる。

   次に、データとビューを設定します。

   * フォームビューHRアセスメント_. 編集可能にします。

   ［ステップ設定］画面に戻り、アクションを設定します。

   * Submit_という名前のアクションを残す。

## アプリのデプロイ

これで、アプリを使用する準備が整いました。 ユーザーがデータの送信を開始できるように、 [デプロイ](./creating-a-standard-application.md#deploying-the-application) する必要があります。

ロール変更リクエストアプリは、専用リンクを備えたスタンドアロンアプリとしてデプロイできます。 このタイプのアプリを使用するには、事前に [Wiki](../../../collaboration-and-social/collaboration-and-social-overview.md#wiki) または会社の従業員ハンドブック [ドキュメント](../../../content-authoring-and-management/documents-and-media.md) でいくつかの手順について確認しておく必要があります。 そこにリンクを保持することで、従業員はロール変更リクエストを開始する前に適切なドキュメントを読むことができます。

## アプリの使用

他のワークフローアイテムと同様に、フォームに入力して送信するには、タスクをユーザーに割り当てる必要があります。 これを行う方法は、ワークフロータスクにアクセスする方法によって異なります。

従業員リクエストフォームが送信されると、次のステップに割り当てられたロールは [通知](../../../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md) を受け取ります。 それをクリックすると、次のフォームビュー「レビュー：現在のマネージャー」が表示されます。 変更アイコン (![Change](../../../images/icon-change.png)) をクリックして、タスクをユーザーに割り当てます。

![Each form of the app can be accessed via User Notification.](./creating-a-workflow-powered-application/images/03.png)

または、アプリのテーブルビューからアプリのエントリーのワークフロープロセスを管理することもできます。 アプリのデフォルトビューはテーブルビューであるため、ロール変更リクエストなどのスタンドアロンアプリの場合は、専用リンクを使用してアプリに移動します。 エントリーのアクションボタン（！[Actions]（../../../images/icon-actions.png））をクリックします。

![Each form of the app can be accessed via the record's Actions menu.](./creating-the-role-change-request-app/images/04.png)

タスクをユーザーに割り当てるには、_Assign To_ メニュー項目を使います。 その後、_Edit_メニューオプションを選択することにより、適切なフォームにアクセスすることができます。

```{note}
 [My Workflow Tasks](../../../process-automation/workflow/using-workflows/reviewing-assets.md#assigning-the-review-task) アプリを使用して、Workflow Powered App のステップを管理することはできません。
```
## ロール変更リクエストアプリをさらに進化させる

ロール変更リクエストアプリを完全に機能させるための拡張機能を追加します。

1. マネージャーと人事用の [ロールを作成](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) します。 管理者ロールを使用するのではなく、各ロールに適切な手順を割り当てます。

1. 標準アプリを作成して、適切な権限を持つユーザーがロール変更リクエストオブジェクトからマスターリストテーブルを表示できるようにします。 管理者は、最初のフォームである_Employee Request_にアクセスできるため、従業員のためのフォームをキックオフすることもできます。

## 関連情報

* [アプリ・ビルダー概要](../app-builder.md) 
* [標準アプリケーションの作成](./creating-a-standard-application.md) 
* [ワークフロー](../../../process-automation/workflow/introduction-to-workflow.md) 
* [役割と権限](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 
