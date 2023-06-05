# タスクノードの割り当て

{bdg-primary}`サブスクリプション`

タスクノードでは、人によるインタラクションが必要です。 タスクを適切な人に警告したり関連付けたりするには、それぞれ [通知](./configuring-workflow-actions-and-notifications.md#adding-notifications) と割り当てを使用します。 タスクノードを割り当てることができます。

- 具体的な役割
- [ロールタイプ](../../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) の複数のロール（組織、サイト、アセットライブラリ、アカウント、または通常のロールタイプ）
- コンテンツクリエイター
- リソースアクション
- 特定ユーザー

さらに、 [スクリプト](../../developer-guide/using-the-script-engine-in-workflow.md) を書いて、割り当てを定義することができます ( [スクリプトでの割り当て](#scripted-assignments) 参照)。

![タスクノードに割り当てを追加することができます。](./assigning-task-nodes/images/01.png)

## リソースアクションの割り当て

**リソースアクション** にワークフロータスクを割り当てることができます。 リソースアクションとは、ユーザーがアプリケーションやエンティティに対して行う操作のことです。 例えば、あるユーザーがメッセージボードのメッセージを更新する権限を持っているとします。 ユーザーがリソースを更新できるため、UPDATEリソースアクションと呼ばれます。 ワークフロー定義で割り当てにUPDATEアクションが指定されている場合、ワークフローで処理されているアセットタイプを更新する権限を持つユーザーがタスクに割り当てられます。  1つのタスクに複数の割り当てを設定することができます。

ソース（XML）ビューで見ると、課題の内容はこんな感じです：

```xml
<assignments>
    <resource-actions>
        <resource-action>UPDATE</resource-action>
    </resource-actions>
</assignments>
```

ワークフローを適切なワークフロー対応のアセットに割り当てることができます。

これで、ワークフローがリソースアクションを割り当てたタスクに進むと、リソース（例えば、メッセージボードのメッセージ）に対して `UPDATE` の権限を持つユーザーにタスクが通知され、（タスク割り当て者に通知が設定されている場合）自分自身にタスクを割り当てることができます。 具体的には、 **My Workflow Tasks** アプリケーションのタブ **Assigned to My Roles** にあるタスクが表示されます。

```{note}
My Workflow Tasksアプリケーションは、ユーザーのパーソナルメニューからアクセスできます。

![My Workflow Tasksは、ユーザーがワークフローのコンテンツを管理する場所です。](./assigning-task-nodes/images/02.png)
```

リソースのアクション名には、すべて大文字を使用してください。 複数入力する場合は、カンマ区切りのリストを使用します。 一般的なリソースアクションは次のとおりです。

* UPDATE
* ADD
* DELETE
* VIEW
* PERMISSIONS
* SUBSCRIBE
* ADD_DISCUSSION

考えられるリソースアクション名は、そのリソースの権限画面から確認できます。 例えば、掲示板では、その画面に表示されるパーミッションのひとつに、 **Add Discussion** があります。 これをすべて大文字に変換し、スペースをアンダースコアに置き換えると、アクション名になります。

## スクリプトでの割り当て

スクリプトで課題を管理することができます。 `user` 変数に1人のユーザーを設定するか、 `users` 変数にユーザーをリストに追加します。 役割の割り当てを指定するには、 `roles` 変数に役割のリスト（1つだけであっても）を追加します。

XMLソースでは、スクリプトによる課題は、 `<scripted-assignment>` XML要素に記述されます：

```xml
<assignments>
   <scripted-assignment>
      <script>
         <![CDATA[
            ...
         ]]>
      </script>
      <script-language>groovy</script-language>
   </scripted-assignment>
</assignments>
```

### 役割に割り当てる

スクリプト型シングル承認者ワークフロー定義（`singleapprover-scripted-assignment-workflow-definition.xml`）のレビュータスク割り当てのスクリプトは、 `ロール`を設定します：

```groovy
import com.liferay.portal.kernel.model.Group;
import com.liferay.portal.kernel.model.Role;
import com.liferay.portal.kernel.service.GroupLocalServiceUtil;
import com.liferay.portal.kernel.service.RoleLocalServiceUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;

long companyId = GetterUtil.getLong((String)workflowContext.get(WorkflowConstants.CONTEXT_COMPANY_ID));

long groupId = GetterUtil.getLong((String)workflowContext.get(WorkflowConstants.CONTEXT_GROUP_ID));

Group group = GroupLocalServiceUtil.getGroup(groupId);

roles = new ArrayList<Role>();

Role adminRole = RoleLocalServiceUtil.getRole(companyId, "Administrator");

roles.add(adminRole);

if (group.isOrganization()) {
    Role role = RoleLocalServiceUtil.getRole(companyId, "Organization Content Reviewer");

    roles.add(role);
}
else {
    Role role = RoleLocalServiceUtil.getRole(companyId, "Site Content Reviewer");

    roles.add(role);
}
```

このスクリプトは、タスクを管理者ロールに割り当て、アセットのグループが組織であるかどうかをチェックします。 その場合、組織コンテンツレビュアー役が追加されます。 そうでない場合は、サイトコンテンツレビュアー役が追加されます。

`role = new ArrayList<Role>();` 行に注目してください。 スクリプトによる割り当てでは、 `roles` 変数で、タスクにロールを割り当てることができます。 例えば、 `roles.add(adminRole);` が呼び出されると、割り当てに管理者ロールが追加されます。

`役割` 変数の割り当てで、タスクの割り当て可能な候補を定義します。 ワークフローにエントリーが提出されると、候補となるユーザーの1人が自分にタスクを割り当てる必要があります。 詳しくは、 [資産の見直し](../../using-workflows/reviewing-assets.md) をご覧ください。

### ユーザーへの割り振り

タスクにユーザーまたはユーザーのリストを割り当てる。 これらの割り当ては、「My Workflow Tasks」アプリケーションの「Assigned to Me」に表示されます。 候補となるユーザーのリストを割り当てるには、次のようなコードを使用します：

```groovy
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;

users = new ArrayList();

long companyId = GetterUtil.getLong((String)workflowContext.get(WorkflowConstants.CONTEXT_COMPANY_ID));

users.add(UserLocalServiceUtil.getUserByEmailAddress(companyId, "user1@liferay.com"));
users.add(UserLocalServiceUtil.getUserByEmailAddress(companyId, "user2@liferay.com"));
```

`users` 変数割当は、 `role`のように、タスクの割当可能候補を定義する。 ワークフローにエントリーが提出されると、候補となるユーザーの1人が自分にタスクを割り当てる必要があります。 詳しくは、 [資産の見直し](../../using-workflows/reviewing-assets.md) をご覧ください。

タスクに1人のユーザーを割り当てる場合、

```groovy
import com.liferay.portal.kernel.service.UserLocalServiceUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.workflow.WorkflowConstants;

long companyId = GetterUtil.getLong((String)workflowContext.get(WorkflowConstants.CONTEXT_COMPANY_ID));

user = UserLocalServiceUtil.getUserByEmailAddress(companyId, "user1@liferay.com");
```

この場合、候補が1つしかないので、 `user` の変数割当は即座に行われます。

## 関連トピック

* [ワークフロータスクの作成](./creating-workflow-tasks.md)
* [ワークフローノード](./workflow-nodes.md)
