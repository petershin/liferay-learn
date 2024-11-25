# 条件ノードの使用

{bdg-primary}`サブスクリプション`

**条件** ノードは、ワークフローの中で条件付きで行動（移行、割り当てなど）する場合に役立ちます。 複数のレビュアがいて、どのレビュアにタスクを割り当てるべきかを決定しなければならない場合があります。 例えば、法務部によるレビューが必要な文書もあれば、マーケティングチームによるレビューが必要な文書もあります。

条件は、指定された条件が満たされているかどうかをチェックするゲートキーパーの役割を果たし、その条件に基づいて、適切なレビュアを割り当てたり、特定のタスクに移行したりするなど、アセットに対してアクションを起こします。

[Category Specific Definition](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/category-specific-workflow-definition.xml) には、条件ノードが含まれています。 条件付きロジックは、アセットカテゴリをチェックして、 **法務レビュー** タスクに移行するか、または **コンテンツレビュー** タスクに移行するかを選択します。 ワークフローに条件ノードを追加するには、以下の手順を行います。

1. **グローバルメニュー** &rarr; ［**アプリケーション**］ &rarr; ［**ワークフロー**］ &rarr; ［**ワークフロー**］ へ行きます。
1. （![Add icon](../../../../images/icon-add.png)）をクリックして新規ワークフローを追加します。
1. ワークフローデザイナーのキャンバスで、ワークフローの名前を入力します。
1. ［**ソース**］ ビューを開いてください。
1. [Category Specific Definition](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/category-specific-workflow-definition.xml) をアップロードします。 その生のコンテンツをソースビューにコピーして既存のコンテンツをすべて上書きするか、 ［**ファイルをインポート**］ をクリックして、定義のXMLファイルをアップロードします。
1. ［**図**］ ビューを開きます。
1. ［条件ノード］、［**Determine Branch**］ をクリックして、ノードのプロパティを設定します。
1. **スクリプト （Groovy**） フィールドを探します。 コンテンツをより見やすくするには、フィールドのサイズを変更します（大きくします）。


    ![レビューパスを決定するGroovyスクリプトを追加します。](./using-condition-nodes/images/01.png)

   スクリプトは、アセットのカテゴリをループして、文字列`legal`を探します。 それが見つかった場合、ワークフローは法務レビューパスに沿って続行されます。 それ以外の場合は、コンテンツレビューパスに沿って進みます。

   すべてのコンテンツは、 [カテゴリー固有の定義の条件スクリプト](#the-category-specific-definition-s-condition-script) で確認できます。

1. 条件のスクリプトでの作業が終了したら、戻る矢印（![Back](../../../../images/icon-angle-left.png)）または ［**保存**］（以前のバージョンのワークフローデザイナーを使用する場合）をクリックします。

![Category Specific Approvalの定義は、条件ノードから始まります。](./using-condition-nodes/images/02.png)

**条件** ノードが3つの異なるタスクノードにどのように接続されているかに注目してください。

* ドキュメントが`legal`カテゴリにある場合、アセットは法務部に送られます。
* それ以外の場合、アセットはマーケティングチームに送信されます。
* **アップデート** ノードは、元の作成者によって更新されると、処理を条件に送り返します（アセットがいずれかのレビューノードで拒否された場合）。

タスクノードの設定方法については、[ワークフロータスクの作成](./creating-workflow-tasks.md)と[タスクノードの割り当て](./assigning-task-nodes.md)を参照してください。

## カテゴリ固有の定義の条件スクリプト

```groovy
import com.liferay.asset.kernel.model.AssetCategory;
import com.liferay.asset.kernel.model.AssetEntry;
import com.liferay.asset.kernel.model.AssetRenderer;
import com.liferay.asset.kernel.model.AssetRendererFactory;
import com.liferay.asset.kernel.service.AssetEntryLocalServiceUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;
import com.liferay.portal.kernel.workflow.WorkflowHandler;
import com.liferay.portal.kernel.workflow.WorkflowHandlerRegistryUtil;

import java.util.List;

String className = (String)workflowContext.get(WorkflowConstants.CONTEXT_ENTRY_CLASS_NAME);

WorkflowHandler workflowHandler = WorkflowHandlerRegistryUtil.getWorkflowHandler(className);

AssetRendererFactory assetRendererFactory = workflowHandler.getAssetRendererFactory();

long classPK = GetterUtil.getLong((String)workflowContext.get(WorkflowConstants.CONTEXT_ENTRY_CLASS_PK));

AssetRenderer assetRenderer = workflowHandler.getAssetRenderer(classPK);

AssetEntry assetEntry = assetRendererFactory.getAssetEntry(assetRendererFactory.getClassName(), assetRenderer.getClassPK());

List<AssetCategory> assetCategories = assetEntry.getCategories();

     returnValue = "Content Review";

for (AssetCategory assetCategory : assetCategories) {
String categoryName = assetCategory.getName();

if (categoryName.equals("legal")) {
    returnValue = "Legal Review";

    return;
    }
}
```

## 関連トピック

* [ワークフローの管理](../managing-workflows.md)
* [ワークフローノード](./workflow-nodes.md)
* [フォークと結合の使用](./using-forks-and-joins.md)
* [ワークフローのアクションと通知の設定](./configuring-workflow-actions-and-notifications.md)
