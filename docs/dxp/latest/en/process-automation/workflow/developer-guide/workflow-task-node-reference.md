---
taxonomy-category-names:
- Platform
- Workflow
- Reference
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: e7efd454-e2cb-44e8-949d-8aff5238e78a
---
# Workflow Task Node Reference

!!! important
    As of DXP 2024.Q2/Portal 7.4 GA120, scripting is disabled by default. You can enable it in System Settings &rarr; Script Management (under the Security category).

Tasks are the part of the workflow where work is done. Tasks must be assigned to users, who review the submitted asset and decide if content from the workflow is acceptable for publication or needs more work.

Unlike other workflow nodes, task nodes have assignments, because a user is expected to do something (often approve or reject the submission) when a workflow process enters the task node.

Commonly, task nodes contain task timers, assignments, actions (which can include notifications and scripts), and transitions. Notifications and actions are not limited to task nodes, but task nodes and their assignments deserve their own article (this one).

Check out the Review task in the [Single Approver](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/single-approver-workflow-definition.xml) workflow definition:

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

There are two `actions` in the review task, both `<notification>`s. Each notification may contain a name, template, notification-type, execution-type, and recipients. Besides notifications, You can also use the `<action>` tag.
These have a name and a [script](./using-the-script-engine-in-workflow.md) and are more often used in state nodes than tasks.

## Assignments

Workflow tasks are completed by a user. Assignments make sure the right users can access the tasks. You can choose how you want to configure your assignments. Assignments can be added to

* Specific roles of any type (Organization, Site, Asset Library, Account, or Regular)

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

   The above assignment specifies that an Organization Administrator must complete the task.

* Asset creator

   ```xml
   <assignments>
      <user />
   </assignments>
   ```

* Resource actions

   ```xml
   <assignments>
       <resource-actions>
           <resource-action>UPDATE</resource-action>
       </resource-actions>
   </assignments>
   ```

* Specific users

   ```xml
   <assignments>
       <user>
           <user-id>20156</user-id>
       </user>
   </assignments>
   ```

   The above assignment specifies that only the user with the ID `20156` may complete the task. Alternatively, specify the user's `<screen-name>` or `<email-address>`.

You can write a script to define the assignment. For an example, see the [single-approver-scripted-assignment-workflow-definition.xml](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-workflow/portal-workflow-kaleo-runtime-impl/src/main/resources/META-INF/definitions/single-approver-scripted-assignment-workflow-definition.xml).

Set a single user in the `user` variable, or add users to a list in the `users` variable. To specify role assignments, add a list of roles (even if there's just one) to the `roles` variable.

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

The above assignment assigns the task to the administrator role, then checks whether the group of the asset is an organization. If it is, the organization content reviewer role is assigned to it. If it's not, the task is assigned to the site content reviewer role.

Note the `roles = new ArrayList<Role>();` line above. In a scripted assignment, the `roles` variable is where you specify any roles the task is assigned to. For example, when `roles.add(adminRole);` is called, the administrator role is added to the assignment.

## Resource Action Assignments

Users can assign a task to a resource action such as an update action. If your workflow definition specifies the UPDATE action in an assignment, then anyone who has permission to update the content being processed in the workflow is assigned to the task. You can configure multiple assignments for a task.

*Resource actions* are operations performed by users on an application or entity. For example, a user might have permission to update message boards messages. This is called an UPDATE resource action, because the user can update the resource.

To find all the available resource actions, you need access to the roles admin application in the Control Panel (in other words, you need permission for the `VIEW` action on the roles resource).

1. Navigate to the _Control Panel_ &rarr; _Users_ &rarr; _Roles_.
1. Add a new Regular Role. See [Managing Roles](../../../users-and-permissions/roles-and-permissions/creating-and-managing-roles.md) for more information.
1. Once the role is added, navigate to the Define Permissions interface for the role.
1. Find the resource whose action should define your workflow assignment.

Here's what the assignment's XML looks like:

```xml
<assignments>
    <resource-actions>
        <resource-action>UPDATE</resource-action>
    </resource-actions>
</assignments>
```

Now when the workflow proceeds to the task with the resource action assignment, users with UPDATE permission on the resource (for example, Message Boards Messages) are notified of the task and can assign it to themselves (if the notification is set to Task Assignees). Specifically, users see the tasks in their My Workflow Tasks application under the tab Assigned to My Roles.

Use all upper case letters for resource action names. Here are some common resource actions:

* UPDATE
* ADD
* DELETE
* VIEW
* PERMISSIONS
* SUBSCRIBE
* ADD_DISCUSSION

Determine the probable resource action name from the permissions screen for a resource. For example, in Message Boards, one of the permissions displayed on that screen is Add Discussion. Convert that to all uppercase and replace the space with an underscore, and you have the action name.

## Task Timers

Task timers trigger an action after a specified time period passes. Timers are useful for ensuring a task does not go unattended for a long time. Available timer actions include sending an additional notification, reassigning the asset, or creating a timer action.

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

The above task timer creates a notification. Specify a time period in the `<delay>` tag, and specify what action to take when the time expires in the `<timer-actions>` block. The `<blocking>` element specifies whether the timer actions may recur. If blocking is set to `false`, timer actions may recur. In a `recurrence` element, specify the recurrence interval using a `duration` and a `scale`, as demonstrated above. The above recurrence element specifies that the timer actions run again every ten minutes after the initial occurrence. Setting blocking to true prevents timer actions from recurring.

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

The above snippet demonstrates how to set up a reassignment action.

Like `<action>` elements, `<timer-action>` elements can contain scripts. See [Using the Script Engine in Workflow](./using-the-script-engine-in-workflow.md) for more information.

```{note}
A `timer-action` can contain all the same tags as an `action`, with one exception: `execution-type`. Timer actions are always triggered once the time is up, so specifying and execution type of `onEntry`, for example, isn't meaningful inside a timer.
```

## Related Topics

* [Crafting XML Workflow Definitions](./crafting-xml-workflow-definitions.md)
* [Workflow Definition Node Reference](./workflow-definition-node-reference.md)
