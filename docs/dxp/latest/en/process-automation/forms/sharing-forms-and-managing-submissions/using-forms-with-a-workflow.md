---
taxonomy-category-names:
- Platform
- Forms
- Workflow
- Liferay Self-Hosted
- Liferay PaaS
- Liferay SaaS
uuid: 0c7c3a0f-b2e5-4ac6-b1c5-f017faf21df3
---
# Using Forms with a Workflow

The _Forms_ application is integrated with the _Workflow_ application and therefore users can activate a workflow process for a form. This means that before a form's entry is accepted, it must first be approved. To enable a workflow process for a Form, see [Activating Workflow for Forms](../../workflow/using-workflows/activating-workflow.md#forms) for more information.

Once workflow has enabled, the _Submit_ button is replaced by _Submit for Workflow_.

![The Submit button is replaced by Submit for Workflow.](./using-forms-with-a-workflow/images/01.png)

When a user has submitted a form, users with review permissions are notified that a Form Record is ready for review.

![Reviewers are notified.](./using-forms-with-a-workflow/images/02.png)

To learn more about how to approve or reject submissions, see [Reviewing Assets](../../workflow/using-workflows/reviewing-assets.md).

![Reviewers have the option to approve or reject the entry.](./using-forms-with-a-workflow/images/03.png)

Once a Form Record has been approved, it appears in the same Form Entries menu with the _Approved_ status.

1. Navigate to _Site Adminstration_ &rarr; _Content & Data_ &rarr; _Forms_.
1. Click the _Actions_ (![Actions](../../../images/icon-actions.png)) button next to the selected form and select _View Entries_.

![The Form Record has been approved](./using-forms-with-a-workflow/images/04.png)

## Related Topics

* [Managing Form Entries](./managing-form-entries.md)
* [Reviewing Assets](../../workflow/using-workflows/reviewing-assets.md)
* [Using the Script Engine in Workflow](../../workflow/developer-guide/using-the-script-engine-in-workflow.md)
