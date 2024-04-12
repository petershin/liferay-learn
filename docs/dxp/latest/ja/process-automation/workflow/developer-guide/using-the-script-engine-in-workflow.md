# ワークフローでのスクリプトエンジンの使用

Groovyスクリプトを[XMLワークフロー定義](./crafting-xml-workflow-definitions.md) に追加して、ワークフローにロジックを注入し、LiferayのJavaサービスにアクセスします。スクリプトはワークフロー実行中に実行されます。

* [ワークフローノードへのスクリプトの追加](#adding-scripts-to-workflow-nodes)
* [定義済み変数](#predefined-variables)
* [スクリプトの例](#script-example)
* [OSGiサービスの呼び出し](#calling-osgi-services)

## ワークフローノードへのスクリプトの追加

これらのワークフローノードタイプでは、`<actions>`からワークフロースクリプトを呼び出すことができます。

* `<fork>`
* `<join>`
* `<state>`
* `<task>`

さらに、 [以下の例](#script-example) が示すように、`<condition>`ノードに直接スクリプトを追加することができます。Javaで条件ロジックを書く方法については、[条件評価器の作成](./creating-a-condition-evaluator.md)を参照してください。

アクションは次のようなスクリプトを呼び出します。

```xml
<actions>
    <action>
        <script>
            <![CDATA[script code goes here]]>
        </script>
        <script-language>groovy</script-language>
    </action>
    ...
</actions>
```

`<script>`要素に直接ロジックを記述する代わりに、[`ActionExecutor`](./creating-an-action-executor.md) Javaクラスを記述し、ワークフロー定義内で呼び出すことができます。 ワークフロー定義で、言語を`java`に設定し、`ActionExecutor`を呼び出します。

```xml
<actions>
   <action>
      <name>reject</name>
      <script>
         <![CDATA[com.acme.e5c9.internal.kaleo.runtime.action.executor.E5C9ActionExecutor]]>
      </script>
      <script-language>java</script-language>
      <execution-type>onAssignment</execution-type>
   </action>
   ...
</actions>
```

一般的なスクリプト操作として、ワークフローの状態の設定があります。 例えば、このスクリプトでは、ワークフローの状態を **approved** に設定しています。

```groovy
<script>
<![CDATA[
    import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;
    import com.liferay.portal.kernel.workflow.WorkflowConstants;

    WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.getLabelStatus("approved"), workflowContext);
]]>
</script>
<script-language>groovy</script-language>
```

## 定義済み変数

すべてのノードタイプに共通する変数もあれば、 `task` ノードだけが利用できる変数もあります。

### すべてのノードタイプに共通する変数

次の変数は、ワークフロースクリプトを実行できる場所であればどこからでも利用できます。

| 変数                                                                                                                                                                                                                                                                  | 説明                                                                                                   | 使用量                                                                                                                                                                                                                                                                                                                 |
|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:---------------------------------------------------------------------------------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `kaleoInstanceToken` ( [`KaleoInstanceToken`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-api/src/main/java/com/liferay/portal/workflow/kaleo/model/KaleoInstanceToken.java) ) | ワークフローのインスタンスとそれに対応するインスタンストークン（ `KaleoInstanceToken`）は、ユーザーが **Submit for Workflow** をクリックするたびに作成されます。 | `kaleoInstanceToken.getKaleoInstanceTokenId()`を呼び出して、注入されたトークンを使用してそのIDを取得します。 これは多くの場合、スクリプトのメソッドパラメータとして渡されます。                                                                                                                                                                                                    |
| `userId`                                                                                                                                                                                                                                                            | `userId` が返されるかどうかは、コンテキストに依存します。                                                                    | ロジックは次のように動作します： `KaleoTaskInstanceToken.getcompletionUserId()`がNULLの場合、`KaleoTaskInstanceToken.getUserId()`を確認します。 それもnullの場合は、`KaleoInstanceToken.getUserId()`を呼び出します。 これは、スクリプトの実行時にワークフローに介入する最後のユーザーのIDです。 `作成された` ノードでは、 **ワークフローの送信** をクリックしたユーザーとなります。一方、Single Approver 定義の `レビュー` ノードでは、終了時のレビューアの ID となります。 |
| `workflowContext` (`Map<String, Serializable>`)                                                                                                                                                                                                               | ワークフローのコンテキストには、スクリプトで使用できる情報が含まれています。                                                               | コンテキストは通常、パラメータとして渡されますが、 `WorkflowContext` のすべての属性は、スクリプトでも利用可能です。 スクリプトのワークフローコンテキストは、コンテキストに依存します。 `ExecutionContext.getWorkflowContext()`の呼び出しがnullに戻ると、ワークフローコンテキストは`KaleoInstanceModel.getWorkflowContext()`によって取得されます。                                                                                       |




### タスクノードに挿入される変数

これらの変数は、タスクノードに注入されます。

| 変数                                                                                                                                                                                                                                                                                 | 説明                                                                                                                           | 使用法                                     |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:---------------------------------------------------------------------------------------------------------------------------- |:--------------------------------------- |
| `kaleoTaskInstanceToken` ( [`KaleoTaskInstanceToken`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-api/src/main/java/com/liferay/portal/workflow/kaleo/model/KaleoTaskInstanceToken.java) )    | タスクのトークン自体は、ワークフロースクリプトで利用できます。                                                                                              | これを使用してIDを取得し、他のプログラムによるワークフロー活動で役立てます。 |
| `taskName`（`String`）：タスク自体の名前にアクセスできます（`KaleoTak.getName()`と同じ値を返します）。                                                                                                                                                                                                             |                                                                                                                              |                                         |
| `workflowTaskAssignees` (`List<` [`WorkflowTaskAssignee`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/workflow/WorkflowTaskAssignee.java) `>`)                                                 | タスクの担当者をリストアップします。                                                                                                           |                                         |
| `kaleoTimerInstanceToken` ( [`KaleoTimerInstanceToken`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-api/src/main/java/com/liferay/portal/workflow/kaleo/model/KaleoTimerInstanceToken.java) ) | [タスクタイマー](./workflow-task-node-reference.md)が存在する場合は、`kaleoTimerInstanceToken.getKaleoTimerInstanceTokenId()`を呼び出してIDを取得します。 | |                                       |

```{warning}
これらの変数は、ワークフロータスクノードのアクションスクリプト（すなわち、`<actions>` &rarr; `<action>` &rarr; `<script>`ブロック内のスクリプト）に現れます。 [スクリプトによる割り当て](../designing-and-managing-workflows/workflow-designer/assigning-task-nodes.md#scripted-assignments) には、これらの変数は注入されていません。
```

## スクリプトの例

ワークフローのほぼすべての時点で、Liferayのスクリプトエンジンを使用して、ワークフローAPIまたは他のLiferay APIにアクセスできます。 ワークフロースクリプトを使用できる実用的な方法をいくつか次に示します。

* 特定の役割を持つユーザーのリストを取得する
* 指定されたコンテンツ承認者に、コンテンツをレビューできない場合に連絡する人のリストを記載したメールを送信する
* コンテンツの承認に割り当てられたユーザーのアラートポートレットに表示されるアラートを作成する

以下のワークフロースクリプトはGroovyで記述され、条件ノードと共に使用されます。 スクリプトはLiferayの[アセットフレームワーク](../../../building-applications/data-frameworks/asset-framework.md)を使用してアセットのカテゴリを決定し、カテゴリを使用して正しい承認プロセスを自動的に決定します。 アセットが`legal`カテゴリーにある場合は、提出時に`Legal Review`タスクに送られます。 それ以外の場合、アセットは`Default Review`タスクに送信されます。

```groovy
<script>
    <![CDATA[
        import com.liferay.portal.kernel.util.GetterUtil;
        import com.liferay.portal.kernel.workflow.WorkflowConstants;
        import com.liferay.portal.kernel.workflow.WorkflowHandler;
        import com.liferay.portal.kernel.workflow.WorkflowHandlerRegistryUtil;
        import com.liferay.asset.kernel.model.AssetCategory;
        import com.liferay.asset.kernel.model.AssetEntry;
        import com.liferay.asset.kernel.model.AssetRenderer;
        import com.liferay.asset.kernel.model.AssetRendererFactory;
        import com.liferay.asset.kernel.service.AssetEntryLocalServiceUtil;

        import java.util.List;

        String className = (String)workflowContext.get(
            WorkflowConstants.CONTEXT_ENTRY_CLASS_NAME);

        WorkflowHandler workflowHandler =
            WorkflowHandlerRegistryUtil.getWorkflowHandler(className);

        AssetRendererFactory assetRendererFactory =
            workflowHandler.getAssetRendererFactory();

        long classPK =
            GetterUtil.getLong((String)workflowContext.get
            (WorkflowConstants.CONTEXT_ENTRY_CLASS_PK));

        AssetRenderer assetRenderer =
            workflowHandler.getAssetRenderer(classPK);

        AssetEntry assetEntry = assetRendererFactory.getAssetEntry(
            assetRendererFactory.getClassName(), assetRenderer.getClassPK());

        List<AssetCategory> assetCategories = assetEntry.getCategories();

        returnValue = "Default Review";

        for (AssetCategory assetCategory : assetCategories) {
            String categoryName = assetCategory.getName();

            if (categoryName.equals("legal")) {
                returnValue = "Legal Review";

                return;
            }
        }
       ]]>
</script>
<script-language>groovy</script-language>
```

```{note}
条件ノードスクリプトの `returnValue` 変数は、次のタスクまたは状態を決定するための有効な移行名でなければなりません。

Liferay Portalの場合、有効な移行名はXMLファイルまたはワークフローのソースビューに入力された移行の `<name>` 要素の値です。 Liferay DXPでは、ワークフローで定義のソースを表示するとき、代わりに移行の `<id>` 要素で指定された移行IDの値を使用する必要があります。
```

ダウンロード可能なワークフローのスクリプト例へのリンクは、[ワークフロー定義の作成](./crafting-xml-workflow-definitions.md)を参照してください。

## OSGiサービスの呼び出し

[Service Tracker](../../../building-applications/core-frameworks/dependency-injection.md)は、使用可能なOSGiサービスを取得します。 Service Trackerがサービスに対してnullを返した場合、そのサービスは利用できず、応答時に適切な処理を行うことができます。

以下は、`JournalArticleLocalService`を使用して記事数を取得するGroovyで記述されたワークフロースクリプトです。

```groovy
import com.liferay.journal.model.JournalArticle;
import com.liferay.journal.service.JournalArticleLocalService;
import com.liferay.portal.scripting.groovy.internal.GroovyExecutor;

import org.osgi.framework.Bundle;
import org.osgi.framework.FrameworkUtil;
import org.osgi.util.tracker.ServiceTracker;

ServiceTracker<JournalArticleLocalService, JournalArticleLocalService> st;

try {
    Bundle bundle = FrameworkUtil.getBundle(GroovyExecutor.class);

    st = new ServiceTracker(bundle.getBundleContext(), JournalArticleLocalService.class, null);
    st.open();

    JournalArticleLocalService jaService = st.waitForService(500);

    if (jaService == null) {
        _log.warn("The required service 'JournalArticleLocalService' is not available.");
    }
    else {
        java.util.List<JournalArticle>articles = jaService.getArticles();
        if (articles != null) {
            _log.info("Article count: " + articles.size());
        } else {
            _log.info("no articles");
        }
    }
}
catch(Exception e) {
    //Handle error appropriately
}
finally {
    if (st != null) {
        st.close();
    }
}
```

このスクリプトは、スクリプトを実行するクラスのOSGiバンドルを使用してサービスを追跡します。 `com.liferay.portal.scripting.groovy.internal.GroovyExecutor`インスタンスがスクリプトを実行するため、インスタンスのバンドルを使用してサービスを追跡します。

```groovy
Bundle bundle = FrameworkUtil.getBundle(GroovyExecutor.class);
```

LiferayのKaleoワークフローエンジンとLiferayのスクリプトエンジンの組み合わせは強力です。 権限を設定するときは、ワークフロー定義内のスクリプトが不適切だったり悪意を持って記述された場合の潜在的な影響に注意してください。

## 関連トピック

* [ワークフローの概要](../introduction-to-workflow.md)
* [アクションエグゼキュータの作成](./creating-an-action-executor.md)
* [条件エバリュエーターの作成](./creating-a-condition-evaluator.md)
* [スクリプトコンソールからのスクリプトの実行](../../../system-administration/using-the-script-engine/running-scripts-from-the-script-console.md)
* [スクリプトの例](../../../system-administration/using-the-script-engine/script-examples.md)
