---
taxonomy-category-names:
- Platform
- Publications
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: b1426540-9d0f-4387-b7fa-3dc44336cb94
---

# Resolving Conflicts

When you begin the publishing process, Liferay performs a compatibility check to determine if there are any conflicts between your publication and production. While some conflicts can be resolved automatically, others require manual resolution. Resolving all conflicts is necessary for publishing changes.

[$LIFERAY_LEARN_YOUTUBE_URL$]=https://www.youtube.com/embed/4w16zEFoP8o

!!! note
    Publishing conflicts only occur when changes are made to production *after* changes have already been made in a publication. This is because each publication is automatically updated with changes made to production, provided those changes don't conflict with changes made in the publication.

## Automatically Resolving Conflicts

For some conflicts, Liferay can provide an automatic resolution. Essentially, an automatic resolution is a pre-configured solution to certain kinds of conflicts, so you can publish your changes without further action. These solutions may include adding, modifying, or removing content from the current publication, or replacing the version of content in production with your publication's version.

When an automatic solution is available, you'll be notified during publishing. You can then click on *View* to review the solution's details. To implement an automatic solution, simply click on *Publish*.

![To implement an automatic solution, simply click on Publish.](./resolving-conflicts/images/01.png)

## Manually Resolving Conflicts

For some conflicts, Liferay cannot provide an automatic resolution. This means you must perform an additional action to resolve the conflict before you can finish publishing. When a manual resolution is necessary, Publications identifies the conflict type and prompts you to resolve it.

![Edit or discard the publication's conflicting changes.](./resolving-conflicts/images/02.png)

Depending on the [conflict type](#understanding-conflict-types), Publications may prompt you to perform one of the following actions.

- **Edit**: This redirects you to the cause of the conflict in the current publication. From there, you can make the changes necessary to resolve the conflict.

- **Discard**: This displays a list of all changes that will be discarded. You can then click on *Discard* to permanently remove them from your publication.

!!! warning
    Discarding is permanent and cannot be reversed. Ensure you've saved any changes you want to keep before discarding them from your publication.

## Conflicts on Scheduled Publications

{bdg-secondary}`Liferay DXP 2024.Q2+/Portal 7.4 GA120+`

!!! important
    This feature is currently behind a release feature flag (LPD-11018). Read [Release Feature Flags](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) for more information.

Scheduled publications are more susceptible to conflicts and errors as they are published in the future, and elements affected by the publication can be altered in production in the meantime.

When that happens, some conflicts or errors may arise. Some conflicts are [handled automatically](#automatically-resolving-conflicts) while others have to be [handled manually](#manually-resolving-conflicts).

Either way, when conflicts or errors arise, a notification is sent out to [users involved in the publication process](./collaborating-on-publications.md) (i.e., publishers, editors, administrators, and owners). This notification provides details about what went wrong and what needs fixing.

To see the notifications, open the *User Administration Menu* and click *Notifications*.

![A notification is sent out whenever scheduled publications run into conflicts or errors.](./resolving-conflicts/images/03.png)

!!! note
    If the `scheduled-publications-conflict-checks` is set at the [Job Scheduler](../../../liferay-development/core-frameworks/job-scheduler-framework/using-job-scheduler.md), a check is performed periodically to look for potential conflicts for scheduled publications. By default, the cron expression is set to midnight UTC.

    If scheduled publications run into conflicts or errors, users receive notification messages every time the conflict check runs.

In case of conflict errors, users can access a list of conflicts through the notification. In the Conflicts screen, users can solve conflicts that require manual resolution and view which conflicts were resolved automatically.

![With conflict errors, users can see a list of conflicts that need to be resolved manually and a list of conflicts that were resolved automatically.](./resolving-conflicts/images/04.png)

In the event of Java errors unrelated to conflicts, users receive an error message notification whereas owners and system administrators have access to a stack trace of errors for further investigation.

![With java errors that are not related to conflicts, users view an error message whereas owners and system administrators can access a stack trace of errors.](./resolving-conflicts/images/05.png)

## Understanding Conflict Types

Users can encounter six general types of conflicts: *Duplication*, *Modification*, *Deletion Modification*, *Modification Deletion*, *Missing Requirement*, and *Addition*.

### Duplication Conflicts

![Publications notifies you to resolve Duplication conflicts.](./resolving-conflicts/images/06.png)

These conflicts occur when something in production uses the same unique value of a change made in the publication. This can be caused by any type of component that requires a unique value (e.g., a folder, url, role name).

Consider the following example. Suppose you've added a new folder named "Marketing" to a publication, while a user in production creates a folder using the same name. Since folders in the same repo must have a unique name, attempting to publish your change will result in a duplication conflict.

To resolve duplication conflicts, users can either edit the value in their publication, or discard their change.

### Modification Conflicts

![Publications notifies you to resolve Modification conflicts.](./resolving-conflicts/images/07.png)

These conflicts occur when an entity you've modified in a publication is then modified in production (e.g., when an edited Web Content article is moved). While some modification conflicts can be automatically resolved, others require manual resolution.

To resolve modification conflicts, you can edit the conflicting material, discard the conflicting changes in your publication, or replace the version in production.

### Deletion Modification and Modification Deletion Conflicts

![Publications notifies you to resolve Deletion Modification and Modification Deletion conflicts.](./resolving-conflicts/images/08.png)

These conflicts occur when an entity is modified in a publication and then deleted in production (Deletion Modification), or vice versa (Modification Deletion). The only provided resolution for this conflict is to discard the publication's conflicting change.

### Missing Requirement Conflicts

![Publications notifies you to resolve Missing Requirement conflicts.](./resolving-conflicts/images/09.png)

These conflicts occur when a child entity is created or edited in your publication, while its parent has been removed from production. Examples include deleting a folder from production when your publication adds or modifies a sub-folder.

To resolve Missing Requirement conflicts, you can discard the conflicting changes from your publication or revert the deletion in production. See [Reverting Changes](./reverting-changes.md) for how to revert changes published to production.

### Addition Conflict

![Publications notifies you to resolve Addition conflicts.](./resolving-conflicts/images/10.png)

These conflicts only occur when users attempt to revert a publication including a deletion that has already been reverted. Users cannot revert the same publication twice if it included a deletion, since the system cannot add back what has already been added back.

## Related Topics

- [Creating and Managing Publications](./creating-and-managing-publications.md)
- [Making and Publishing Changes](./making-and-publishing-changes.md)
- [Resolving Conflicts](./resolving-conflicts.md)
