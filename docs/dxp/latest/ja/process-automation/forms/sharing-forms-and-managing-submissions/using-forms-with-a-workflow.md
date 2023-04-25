# ワークフローでのフォームの使用

**Forms** アプリケーションは、 **Workflow** アプリケーションと統合されているため、ユーザーはフォームのワークフロープロセスを起動することができます。 つまり、フォームの入力が受け入れられる前に、まず承認が必要なのです。 フォームに対しワークフロープロセスを有効にする方法については、 [Activating Workflow for Forms](../../workflow/using-workflows/activating-workflow.md#forms) を参照してください。

ワークフローが有効になると、 **Submit** ボタンが、 **Submit for Workflow** に置き換わります。

![送信ボタンがSubmit for Workflowに置き換わっています。](./using-forms-with-a-workflow/images/01.png)

ユーザーがフォームを送信すると、レビュー権限を持つユーザーに対して、フォームレコードがレビュー可能な状態になったことが通知されます。

![査読者に通知されます。](./using-forms-with-a-workflow/images/02.png)

申請を承認または拒否する方法の詳細は、[アセットの確認](../../workflow/using-workflows/reviewing-assets.md)を参照してください。

![レビュアーは、エントリーを承認するか否かを選択することができます。](./using-forms-with-a-workflow/images/03.png)

フォームレコードが承認されると、 ［**Approved**］ ステータスとともに同じフォームエントリメニューに表示されます。

1. ［**サイト管理**］ &rarr; ［**コンテンツ& データ**］ &rarr; ［**フォーム**］ に移動します。
1. 選択したフォームの横にある **アクション**(![Actions](../../../images/icon-actions.png)）ボタンをクリックし、 ［**View Entries**］ を選択します。

![フォームレコードが承認されました](./using-forms-with-a-workflow/images/04.png)

## 追加情報

* [フォームエントリの管理](./managing-form-entries.md)
* [アセットの確認](../../workflow/using-workflows/reviewing-assets.md)
* [ワークフローでのスクリプトエンジンの使用](../../workflow/developer-guide/using-the-script-engine-in-workflow.md)
