# ワークフロータスクノードリファレンス

タスクは、ワークフローの中で仕事が行われる部分です。 タスクはユーザーに割り当てられ、ユーザーは提出されたアセットを確認し、ワークフローのコンテンツが出版物として受け入れられるか、それともさらなる作業が必要かを判断します。

他のワークフローノードとは異なり、タスクノードには割り当てがあります。なぜなら、ワークフロープロセスがタスクノードに入ると、ユーザーは何か（多くの場合、投稿を承認または拒否する）することが期待されるからです。

通常、タスクノードには、タスクタイマー、割り当て、アクション（通知とスクリプトを含めることができます）、およびトランジションが含まれます。 通知とアクションはタスクノードに限定されませんが、タスクノードとその割り当ては独自の記事（この記事）に値します。

[Single Approver](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/single-approver-workflow-definition.xml) のワークフロー定義にある Review タスクを確認します：

```xml
<task>
    <name>review</name>
    <actions>
        <notification>
            <name>Review Notification</name>
            <template>${userName} sent you a ${entryType} for review in the workflow.</template>
            <template-language>freemarker</template-language>
            <notification-type>email</notification-type>
            <notification-type>user-notification</notification-type>
            <execution-type>onAssignment</execution-type>
        </notification>
        <notification>
            <name>Review Completion Notification</name>
            <template><![CDATA[Your submission was reviewed<#if taskComments?has_content> and the reviewer applied the following ${taskComments}</#if>.]]></template>
            <template-language>freemarker</template-language>
        <notification-type>email</notification-type>
            <recipients>
            <user />
            </recipients>
            <execution-type>onExit</execution-type>
        </notification>
    </actions>
    <assignments>
        <roles>
            <role>
                <role-type>organization</role-type>
                <name>Organization Administrator</name>
        </role>
              ...
        </roles>
    </assignments>
    <transitions>
    <transition>
            <name>approve</name>
            <target>approved</target>
    </transition>
            <transition>
            <name>reject</name>
            <target>update</target>
            <default>false</default>
        </transition>
    </transitions>
</task>
```

レビュータスクには2つの`actions`があり、両方とも`<notification>`です。 各通知には、名前、テンプレート、通知タイプ、実行タイプ、および受信者を含めることができます。 通知のほかに、`<action>`タグを使用することもできます 。 これらには名前と[スクリプト](./using-the-script-engine-in-workflow.md)があり、タスクよりもステータスノードで使われることが多いです。

## 割り当て

ワークフローのタスクは、ユーザーによって完了されます。 割り当てを行うことで、適切なユーザーがタスクにアクセスできるようになります。 割り当ての設定方法を選択できます。 割り当ては以下に追加できます

* 任意のタイプの特定のロール（組織、サイト、アセットライブラリ、アカウント、またはレギュラー）

   ```xml
   <assignments>
       <roles>
           <role>
               <role-type>organization</role-type>
               <name>Organization Administrator</name>
           </role>
       </roles>
   </assignments>
   ```

   上記の割り当ては、組織管理者がタスクを完了する必要があることを指定しています。

* アセット作成者

   ```xml
   <assignments>
      <user />
   </assignments>
   ```

* リソースアクション

   ```xml
   <assignments>
       <resource-actions>
           <resource-action>UPDATE</resource-action>
       </resource-actions>
   </assignments>
   ```

* 特定ユーザー

   ```xml
   <assignments>
       <user>
           <user-id>20156</user-id>
       </user>
   </assignments>
   ```

   上記の課題では、ID `20156` を持つユーザーのみが課題を完了できることが指定されています。 または、ユーザーの `<screen-name>` または `<email-address>`を指定してください。

割り当てを定義するためのスクリプトを書くことができます。 例えば、 [single-approver-scripted-assignment-workflow-definition.xml](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/single-approver-scripted-assignment-workflow-definition.xml) を参照してください。

`user` 変数に1人のユーザーを設定するか、 `users` 変数にユーザーをリストに追加します。 役割の割り当てを指定するには、 `roles` 変数に役割のリスト（1つだけであっても）を追加します。

```xml
<assignments>
    <scripted-assignment>
        <script>
            <![CDATA[
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

                ]]>
            </script>
        <script-language>groovy</script-language>
    </scripted-assignment>
</assignments>
```

上記の割り当てでは、タスクを管理者ロールに割り当てた後、アセットのグループが組織であるかどうかをチェックします。 もしそうであれば、組織コンテンツレビュアーの役割が割り当てられます。 そうでない場合、そのタスクはサイトコンテンツレビューアーの役割に割り当てられます。

上記の`roles = new ArrayList<Role>();`の行に注目してください。 スクリプトによる割り当てでは、 `roles` 変数に、タスクの割り当て先となるロールを指定します。 例えば、 `roles.add(adminRole);` が呼び出されると、割り当てに管理者ロールが追加されます。

## リソースアクションの割り当て

ユーザーは、アップデートアクションなどのリソースアクションにタスクを割り当てることができます。 ワークフロー定義でUPDATEアクションが割り当てに指定されている場合、ワークフローで処理されるコンテンツの更新権限を持つ人がタスクに割り当てられることになります。 1つのタスクに複数の割り当てを設定することができます。

**リソースアクション** ユーザーがアプリケーションやエンティティに対して行う操作のことである。 例えば、あるユーザーがメッセージボードのメッセージを更新する権限を持っているとします。 ユーザーがリソースを更新できるため、UPDATEリソースアクションと呼ばれます。

利用可能なリソースのアクションをすべて確認するには、コントロールパネルのロール管理アプリケーションにアクセスする必要があります（言い換えれば、ロールリソースの `VIEW` アクションの権限が必要です）。

1. ［**Control Panel**］ → ［**Users**］ → ［**ロール**］ に移動します。
1. 新しい標準ロールを追加します。 詳細は、[ロールの管理](../../../users-and-permissions/roles-and-permissions/creating-and-managing-roles.md)を参照してください。
1. ロールが追加されたら、そのロールのDefine Permissionsインターフェイスに移動します。
1. ワークフローの割り当てを定義するアクションを持つリソースを探します。

割り当てのXMLは次のようになります。

```xml
<assignments>
    <resource-actions>
        <resource-action>UPDATE</resource-action>
    </resource-actions>
</assignments>
```

これで、ワークフローがリソースアクションを割り当てたタスクに進むと、リソースのUPDATE権限を持つユーザー（例えば、メッセージボード・メッセージ）にタスクが通知され、（通知がタスクアサイニーに設定されている場合）自分自身にタスクを割り当てることができます。 具体的には、「マイワークフロータスク」アプリケーションの「自分の役割に割り当てられたタスク」タブに表示されるタスクが、ユーザーに表示されます。

リソースのアクション名には、すべて大文字を使用してください。 一般的なリソースアクションは次のとおりです。

* UPDATE
* ADD
* DELETE
* VIEW
* PERMISSIONS
* SUBSCRIBE
* ADD_DISCUSSION

考えられるリソースアクション名を、そのリソースの権限画面から決定します。 例えば、掲示板では、その画面に表示される権限の1つにAdd Discussionがあります。 これをすべて大文字に変換し、スペースをアンダースコアに置き換えると、アクション名になります。

## タスクタイマー

タスクタイマーは、指定された期間が経過した後にアクションをトリガーします。 タイマーは、タスクが長時間放置されないようにするために便利です。 使用可能なタイマーアクションには、追加の通知の送信、アセットの再割り当て、タイマーアクションの作成などがあります。

```xml
<task-timers>
    <task-timer>
        <name></name>
        <delay>
            <duration>1</duration>
            <scale>hour</scale>
        </delay>
        <blocking>false</blocking>
        <recurrence>
            <duration>10</duration>
            <scale>minute</scale>
        </recurrence>
        <timer-actions>
            <timer-notification>
                <name></name>
                <template></template>
                <template-language>text</template-language>
                <notification-type>user-notification</notification-type>
            </timer-notification>
        </timer-actions>
    </task-timer>
</task-timers>
```

上記のタスクタイマーは通知を作成します。 `<delay>` タグで期間を指定し、 `<timer-actions>` ブロックで期間が過ぎたときのアクションを指定します。 `<blocking>` 要素は、タイマーアクションを繰り返すかどうかを指定します。 ブロッキングが`false`に設定されている場合、タイマーアクションを繰り返すことができます。 `recurrence`要素では、上記で示したように`duration`と`scale`を使って繰り返し間隔を指定します。 上記のrecurrence要素は、タイマーアクションが最初の発生後10分ごとに再度実行されることを指定しています。 ブロッキングをtrueに設定すると、タイマーアクションが繰り返されなくなります。

```xml
<timer-actions>
    <reassignments>
       <assignments>
         <roles>
          <role>
              <role-type></role-type>
              <name></name>
          </role>
          ...
         </roles>
       </assignments>
    </reassignments>
</timer-actions>
```

上記のスニペットは、再割り当てアクションを設定する方法を示しています。

`<action>` 要素と同様に、 `<timer-action>` 要素にはスクリプトを含めることができます。 詳細は、[ワークフローでのスクリプトエンジンの使用](./using-the-script-engine-in-workflow.md)を参照してください。

```{note}
`timer-action`には、` execution-type`という1つの例外を除いて、`action`と同じタグをすべて含めることができます。 タイマーアクションは、時間切れになると常にトリガーされるため、たとえば、 実行タイプに`onEntry`を指定しても、タイマーの中では意味がありません。
```

## 関連トピック

* [XMLワークフロー定義の作成](./crafting-xml-workflow-definitions.md)
* [ワークフロー定義ノードリファレンス](./workflow-definition-node-reference.md)
