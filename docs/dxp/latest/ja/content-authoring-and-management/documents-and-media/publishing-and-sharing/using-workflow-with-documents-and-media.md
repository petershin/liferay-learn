# ドキュメントとメディアでのワークフローの使用

Documents and Mediaは、Liferayのワークフローエンジン [と完全に統合されています](../../../process-automation/workflow/introduction-to-workflow.md)。 つまり、ファイルのレビューと承認プロセスをカスタムで定義できるのです。 Documents and Mediaは、標準的なワークフロー機能に加えて、複数のワークフローを使用することもサポートしています。 すべての文書タイプに対してデフォルトのワークフローを設定し、特定の文書タイプに対して代替ワークフローを使用するように個々のフォルダーを設定することができます。

マーケティング、法務、会計のファイル用に、それぞれ異なる [ドキュメントタイプ](../uploading-and-managing/managing-metadata/defining-document-types.md) を定義した場合を考えてみましょう。 その内容から、各文書タイプは特定のレビューと承認プロセスを経なければなりません。 これを実現するには、 [、各タイプのカスタムワークフロー](../../../process-automation/workflow/designing-and-managing-workflows/workflow-designer.md) を作成し、Documents と Media フォルダでカスタムワークフローを使用するように設定します。 また、他のすべての文書タイプに同じレビューと承認プロセスを経る必要がある場合は、Documents and Mediaルートフォルダにデフォルトのワークフローを設定することができます。

## デフォルトのワークフローを有効にする

以下の手順で、すべてのドキュメントタイプに対してデフォルトのワークフローを有効にします：

1. 目的のサイトまたはアセットライブラリで、 *Documents and Media* アプリケーションを開きます。

1. ルートフォルダ(＝ホーム）から、アプリケーションバーの「 *アクション」* ボタン(![Actions Button](../../../images/icon-actions.png)）をクリックし、「 *編集」*を選択します。

   ![アプリケーションバーの［アクション］ボタンをクリックし、［編集］を選択します。](./using-workflow-with-documents-and-media/images/01.png)

1. ドロップダウンメニューから、目的の *ワークフロー* を選択します。

   ![ワークフローの定義を選択します。](./using-workflow-with-documents-and-media/images/02.png)

1. *［Save］* をクリックします。

サイトまたはアセットライブラリー内のすべてのドキュメントタイプに対して、デフォルトのワークフローを有効にします。 これにより、ユーザーがファイルをアップロードまたは編集するたびに、 *Publish* ボタンが、 *Submit for Workflow* ボタンに置き換わります。 必要に応じて、個々のフォルダーに対してこのワークフローをオーバーライドすることができます。 [フォルダーとドキュメントタイプの代替ワークフローを有効にする](#enabling-alternative-workflows-for-folders-and-document-types) を参照してください。

## フォルダーとドキュメントタイプの代替ワークフローを有効にする

以下の手順で、個々のフォルダーや文書タイプに対してワークフローの有効/無効を設定します：

1. 目的のサイトまたはアセットライブラリで、 *Documents and Media* アプリケーションを開きます。

1. 目的のフォルダの *アクション* ボタン (![Actions Button](../../../images/icon-actions.png)) をクリックし、 *編集*を選択します。

   ![フォルダの［アクション］ボタンをクリックし、［編集］を選択します。](./using-workflow-with-documents-and-media/images/03.png)

1. *［ドキュメントタイプ制限およびワークフロー］*で、目的の構成を選択します。

   **親フォルダー(parent-folder）のドキュメントタイプ制限とワークフローを使用する**: 親フォルダーの設定を使用します。 この値は初期値です。

   **このフォルダー(current-folder）の特定のドキュメントタイプの制限とワークフローを定義する**: 個々のドキュメントタイプに対して *カスタムワークフロー* を選択するか、 *ワークフローなし* を選択して個々のタイプのデフォルトワークフローを無効にします。

   **Default Workflow for This Folder (current-folder)**: 現在のフォルダーのデフォルトのワークフローを選択します。 文書の種類に関係なく、フォルダー内のすべてのファイルに対してワークフローが適用されます。

   ![［ドキュメントタイプ制限およびワークフロー］で、目的の構成を選択します。](./using-workflow-with-documents-and-media/images/04.png)

1. *［Save］* をクリックします。

選択したフォルダーとドキュメントタイプに対して、選択したワークフローを有効にします。

## 追加情報

* [ワークフローデザイナー](../../../process-automation/workflow/designing-and-managing-workflows/workflow-designer.md)
* [ドキュメントとメディアUIリファレンス](../documents-and-media-ui-reference.md)
