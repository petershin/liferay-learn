# ドキュメントとメディアでのワークフローの使用

Documents and Mediaは、Liferayのワークフローエンジン（ [）と完全に統合されています。](../../../process-automation/workflow/introduction-to-workflow.md). つまり、ファイルのレビューや承認プロセスをカスタムで定義することができます。 Documents and Mediaは、標準的なワークフロー機能に加えて、複数のワークフローを使用することもサポートしています。 すべての文書タイプに対してデフォルトのワークフローを設定し、特定の文書タイプに対して代替ワークフローを使用するように個々のフォルダを設定することができます。

マーケティング、法務、会計の各ファイルに、それぞれ異なる [ドキュメントタイプ](../uploading-and-managing/managing-metadata/defining-document-types.md) を定義している場合を考えてみましょう。 その内容から、各文書タイプは特定のレビューと承認プロセスを経る必要があります。 これを実現するには、 [各タイプのカスタムワークフロー](../../../process-automation/workflow/designing-and-managing-workflows/workflow-designer.md) を作成し、Documents と Media フォルダでカスタムワークフローを使用するように設定します。 また、他のすべての種類のドキュメントに同じレビューと承認プロセスを実行させる必要がある場合は、Documents and Mediaのルートフォルダにデフォルトのワークフローを設定することができます。

## デフォルトのワークフローを有効にする

以下の手順で、すべての種類の文書に対してデフォルトのワークフローを有効にします。

1. 目的のサイトまたはアセットライブラリで、 **Documents and Media** アプリケーションを開きます。

1. ルートフォルダ（＝ホーム）から、アプリケーションバーの「**アクション**」 ボタン（![Actions Button](../../../images/icon-actions.png)）をクリックし、「**編集**」 を選択します。

   ![アプリケーションバーの「アクション」ボタンをクリックし、「編集」を選択します。](./using-workflow-with-documents-and-media/images/01.png)

1. ドロップダウンメニューから、目的の **ワークフロー** を選択します。

   ![ワークフローの定義を選択します。](./using-workflow-with-documents-and-media/images/02.png)

1. ［**Save**］ をクリックします。

サイトまたはアセットライブラリ内のすべてのドキュメントタイプに対して、デフォルトのワークフローを有効にします。 ユーザーがファイルをアップロードまたは編集するたびに、 **Publish** ボタンが、 **Submit for Publication** ボタンに置き換えられるようになりました。 必要に応じて、個々のフォルダーに対してこのワークフローをオーバーライドすることができます。 詳しくは、 [フォルダーとドキュメント タイプの代替ワークフローを有効にする](#enabling-alternative-workflows-for-folders-and-document-types) を参照してください。

## フォルダーとドキュメントタイプの代替ワークフローを有効にする

以下の手順で、個々のフォルダーや文書タイプに対してワークフローの有効/無効を設定します。

1. 目的のサイトまたはアセットライブラリで、 **Documents and Media** アプリケーションを開きます。

1. 目的のフォルダーの **アクション** ボタン (![Actions Button](../../../images/icon-actions.png)) をクリックし、 **編集** を選択します。

   ![フォルダーの[アクション]ボタンをクリックし、 [編集]を選択します。](./using-workflow-with-documents-and-media/images/03.png)

1. ［**ドキュメントタイプ制限およびワークフロー**］ で、目的の構成を選択します。

   **親フォルダー（parent-folder）の文書タイプ制限とワークフローを使用する** : 親フォルダーの設定を使用します。 これはデフォルト値である。

   **このフォルダー（current-folder）の特定のドキュメントタイプの制限とワークフローを定義する** : 個々のドキュメントタイプに対して **カスタムワークフロー** を選択するか、 **ワークフローなし** を選択して個々のタイプに対するデフォルトワークフローを無効にすることができます。

   **Default Workflow for This Folder (current-folder**) : 現在のフォルダーに対するデフォルトのワークフローを選択します。 文書の種類に関係なく、フォルダ内のすべてのファイルに対してワークフローを適用します。

   ![［ドキュメントタイプ制限およびワークフロー］で、目的の構成を選択します。](./using-workflow-with-documents-and-media/images/04.png)

1. ［**Save**］ をクリックします。

これにより、選択したフォルダーと文書タイプに対して、選択したワークフローが有効になります。

## 追加情報

* [ワークフローデザイナー](../../../process-automation/workflow/designing-and-managing-workflows/workflow-designer.md)
* [ドキュメントとメディアUIリファレンス](../documents-and-media-ui-reference.md)
