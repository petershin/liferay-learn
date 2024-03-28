---
taxonomy-category-names:
- Platform
- Workflow
- Liferay Self-Hosted
- Liferay PaaS
uuid: 8be1370c-e992-44c5-bbf5-63c3016c54c7
---
# Using the Script Engine in Workflow

Add Groovy scripts to [your XML workflow definition](./crafting-xml-workflow-definitions.md) to inject logic and access Liferay's Java services in your workflow. Scripts run during workflow execution.

* [Adding Scripts to Workflow Nodes](#adding-scripts-to-workflow-nodes)
* [Using Predefined Variables](#predefined-variables)
* [Script Example](#script-example)
* [Calling OSGi Services](#calling-osgi-services)

## Adding Scripts to Workflow Nodes

You can invoke Workflow scripts from `<actions>` in these workflow node types:

* `<fork>`
* `<join>`
* `<state>`
* `<task>`

Additionally, you can add scripts directly to `<condition>` nodes, as the [example below](#script-example) demonstrates. See [Creating a Condition Evaluator](./creating-a-condition-evaluator.md) to learn about writing condition logic in Java.

Actions invoke a script like this:

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

Instead of writing the logic directly in a `<script>` element, you can write an [`ActionExecutor`](./creating-an-action-executor.md) Java class and call it in the workflow definition. In the workflow definition, set the language to `java` and call the `ActionExecutor`:

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

One common script operation is to set the workflow status. For example, this script sets the workflow status to *approved*.

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

## Predefined Variables

Some variables are common to all node types, while others are exclusively available to `task` nodes.

### Variables Common to All Node Types

These variables are available from anywhere that you can run a workflow script:

| Variable | Description | Usage |
| :--- | :--- | :--- |
| `kaleoInstanceToken` ([`KaleoInstanceToken`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-api/src/main/java/com/liferay/portal/workflow/kaleo/model/KaleoInstanceToken.java)) |  A workflow instance and corresponding instance token (the `KaleoInstanceToken`) are created each time a user clicks *Submit for Workflow*. | Use the injected token to retrieve its ID by calling `kaleoInstanceToken.getKaleoInstanceTokenId()`. This is often passed as a method parameter in a script. |
| `userId` | The `userId` returned is context dependent. | The logic works like this: if the `KaleoTaskInstanceToken.getcompletionUserId()` is null, check `KaleoTaskInstanceToken.getUserId()`. If that's null too, call `KaleoInstanceToken.getUserId()`. It's the ID of the last user to intervene in the workflow at the time the script is run. In the `created` node, this would be the user that clicked *Submit for Workflow*, whereas it's the ID of the reviewer upon exit of the `review` node of the Single Approver definition. |
| `workflowContext` (`Map<String, Serializable>`) | The workflow context contains information you can use in scripts. | The context is typically passed as a parameter, but all of the `WorkflowContext` attributes are available in the script as well. The workflow context in the script is context dependent. If a call to `ExecutionContext.getWorkflowContext()` comes back null, then the workflow context is obtained by `KaleoInstanceModel.getWorkflowContext()`. |

### Variables Injected into Task Nodes

These variables are injected into task nodes:

| Variable | Description | Usage |
| :--- | :--- | :--- |
| `kaleoTaskInstanceToken` ([`KaleoTaskInstanceToken`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-api/src/main/java/com/liferay/portal/workflow/kaleo/model/KaleoTaskInstanceToken.java)) | The task's token itself is available in the workflow script. | Use it to get its ID, which is useful in other programmatic workflow activities. |
| `taskName` (`String`)  The task's own name is accessible (returns the same as `KaleoTak.getName()`). | |
| `workflowTaskAssignees` (`List<`[`WorkflowTaskAssignee`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/workflow/WorkflowTaskAssignee.java)`>`) | Lists the task's assignees. | |
| `kaleoTimerInstanceToken` ([`KaleoTimerInstanceToken`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-api/src/main/java/com/liferay/portal/workflow/kaleo/model/KaleoTimerInstanceToken.java)) | If a [task timer](./workflow-task-node-reference.md) exists, get its ID by calling `kaleoTimerInstanceToken.getKaleoTimerInstanceTokenId()`. | | |

```{warning}
These variables appear in action scripts in workflow task nodes (i.e., scripts in an `<actions>` &rarr; `<action>` &rarr; `<script>` block). [Scripted assignments](../designing-and-managing-workflows/workflow-designer/assigning-task-nodes.md#scripted-assignments) do not have these variables injected.
```

## Script Example

At virtually any point in a workflow, you can use Liferay's script engine to access workflow APIs or other Liferay APIs. Here are a few practical ways you can use workflow scripts:

* Getting a list of users who have a specific role
* Sending an email to the designated content approver with a list of people to contact if he is unable to review the content
* Creating an alert to be displayed in the Alerts portlet for any user assigned to approve content

The following workflow script is written using Groovy and is used with a condition node. The script uses Liferay's [asset framework](../../../liferay-development/building-applications/data-frameworks/asset-framework.md) to determine an asset's category and uses the category to determine the correct approval process automatically. If the asset is in the `legal` category, it is sent to the `Legal Review` task upon submission. Otherwise, the asset is sent to the `Default Review` task.

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
A condition node script's `returnValue` variable must be a valid transition name to determine the next task or state.

For Liferay Portal, a valid transition name is the transition's `<name>` element value as entered in the XML file or in the source view of the Process Builder. For Liferay DXP, when you view the source of the definition in the Process Builder, you must instead use the value of the transition ID as specified in the transition's `<id>` element.
```

See [Crafting Workflow Definitions](./crafting-xml-workflow-definitions.md) for links to downloadable workflow script examples.

## Calling OSGi Services

[Service Trackers](../../../liferay-development/core-frameworks/dependency-injection.md) retrieve OSGi services that are available. If the Service Tracker returns null for the service, that service is unavailable and you can do something appropriate in response.

Here's a workflow script written in Groovy that uses a `JournalArticleLocalService` to get an article count:

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

The script tracks the service using the OSGi bundle of the class that executes the script. Since a `com.liferay.portal.scripting.groovy.internal.GroovyExecutor` instance executes the script, the instance's bundle is used to track the service.

```groovy
Bundle bundle = FrameworkUtil.getBundle(GroovyExecutor.class);
```

Liferay's Kaleo Workflow Engine and Liferay's Script Engine makes for a powerful combination. When configuring your permissions, be aware of the potential consequences of poorly or maliciously written scripts inside a workflow definition.

## Related Topics

* [Introduction to Workflow](../introduction-to-workflow.md)
* [Creating an Action Executor](./creating-an-action-executor.md)
* [Creating a Condition Evaluator](./creating-a-condition-evaluator.md)
* [Running Scripts From the Script Console](../../../system-administration/using-the-script-engine/running-scripts-from-the-script-console.md)
* [Script Examples](../../../system-administration/using-the-script-engine/script-examples.md)
