# Using Workflow with Publications

{bdg-secondary}`Available Liferay 7.4 U__+/GA__+`

Publications is fully integrated with Liferay's [Workflow](../../../process-automation/workflow/introduction-to-workflow.md) framework. This means you can continue to use custom workflows for reviewing content and pages while Publications is enabled for your system. Using Workflow with Publications can help ensure all tracked changes go through the desired approval process before publishing them to production.

![Publications is fully integrated with Liferay's Workflow framework.](./using-workflow-with-publications/images/01.png)

All changes are scoped to the environment where they are made (i.e., production or a publication). This means content reviewers must have access to the appropriate environment to review and approve changes. So, if site contributors make changes in a publication, reviewers must have access to the publication along with the necessary permissions. See [Collaboration on Publications](./collaborating-on-publications.md) for more information about inviting users to a publication and assigning them permissions.

To help with communication, workflow notifications indicate the environment where contributors have submitted changes for approval. Content reviewers must first switch to this environment before they can view and approve the changes.

![Workflow notifications indicate the environment where changes were made.](./using-workflow-with-publications/images/02.png)

If you edit content or pages with workflow enabled, reviewers must approve your changes before you can publish them to production. Attempting to publish unapproved changes displays an error message.

![Attempting to publish unapproved changes displays an error message.](./using-workflow-with-publications/images/03.png)

Once changes are approved, additional edits to the same entities are tracked as separate changes in the publication, each with its own workflow status.

![Additional edits to the same entities are tracked as separate changes in the publication.](./using-workflow-with-publications/images/04.png)

## Additional Information

* [Introduction to Workflow](../../../process-automation/workflow/introduction-to-workflow.md)
* [Creating and Managing Publications](./creating-and-managing-publications.md)
* [Collaborating on Publications](./collaborating-on-publications.md)
