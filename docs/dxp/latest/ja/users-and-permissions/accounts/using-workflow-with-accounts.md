# アカウントでワークフローを使用する

{bdg-secondary}`liferay 7.4 U49+/GA49+`.

アカウントはLiferayの[ワークフローエンジン](../../process-automation/workflow/introduction-to-workflow.md) と完全に統合されているので、アカウント作成の承認プロセスを有効にすることができます。

Accounts のワークフローを有効にする、

1. ![グローバルメニュー](../../images/icon-applications-menu.png)を開き、[アプリケーション] タブ &rarr; **プロセスビルダー** を開きます。

1. **Configurations** タブに移動し、Account Entryの **Edit** をクリックします。

1. ドロップダウンメニューを使用して、 **ワークフロー** を選択します。

   カスタム ワークフローの設計については、 [ワークフローデザイナーの概要](../../process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md) を参照してください。

   ![Use the drop-down menu to select a workflow.](./using-workflow-with-accounts/images/01.png)

1. ［**保存**］をクリックします。

ワークフローがアクティブになった。 新規アカウントは、有効化される前に定められた承認プロセスを経なければなりません。

[アカウントを作成](../accounts.md#creating-an-account) すると、ステータスが保留に設定され、レビュアーに通知されます。

![Designated reviewers are notified of new accounts.](./using-workflow-with-accounts/images/02.png)

レビュアーは保留中のアカウントを承認または拒否することができます。 審査プロセスの詳細については、 [資産の審査](../../process-automation/workflow/using-workflows/reviewing-assets.md) を参照のこと。

![Reviewers can approve or reject accounts.](./using-workflow-with-accounts/images/03.png)

## 関連トピック

* [アカウントの作成](../accounts.md#creating-an-account)
* [ワークフローデザイナーの概要](../../process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md)
* [資産の見直し](../../process-automation/workflow/using-workflows/reviewing-assets.md)
