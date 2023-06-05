# アカウントでワークフローを使用する

{bdg-secondary}`利用可能な Liferay 7.4 U49+/GA49+`

アカウントはLiferayの[ワークフローエンジン](../../process-automation/workflow/introduction-to-workflow.md) と完全に統合されているので、アカウント作成時の承認プロセスを有効にすることができます。

Accounts のワークフローを有効にするには、次のようにします。

1. **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **アプリケーション** タブ &rarr; **プロセスビルダー** を開きます。

1. **設定** タブを開き、 **アカウント入力の編集** をクリックします。

1. ドロップダウンメニューを使用して、 **ワークフローを選択します** .
 
   カスタムワークフローの設計については、 [ワークフローデザイナーの概要](../../process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md) を参照してください。
   
   ![ドロップダウンメニューで、ワークフローを選択します。](./using-workflow-with-accounts/images/01.png)

1. [**保存**] をクリックします。

ワークフローがアクティブになりました。 新規アカウントは、有効化される前に定められた承認プロセスを経る必要があります。

[アカウント作成時](../accounts.md#creating-an-account) 、ステータスが「保留」に設定され、レビュアーに通知される。

![新しいアカウントは、指定された審査担当者に通知されます。](./using-workflow-with-accounts/images/02.png)

レビュー担当者は、保留中のアカウントを承認または拒否することができます。 レビュープロセスの詳細については、 [資産のレビュー](../../process-automation/workflow/using-workflows/reviewing-assets.md) を参照してください。

![レビュアーは、アカウントを承認または拒否することができます。](./using-workflow-with-accounts/images/03.png)

## 関連トピック

* [アカウントの作成](../accounts.md#creating-an-account)
* [ワークフローデザイナーの概要](../../process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview.md)
* [アセットの確認](../../process-automation/workflow/using-workflows/reviewing-assets.md)
