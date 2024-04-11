---
uuid: 8b2a2a37-b3d1-45a6-a1c7-5d712ffa1ef2
taxonomy-category-names:
    - Development and Tooling
    - Data Sets
    - Liferay Self-Hosted
    - Liferay SaaS
---

# Data Set View Creation Actions

With *Item Actions*, you can delete, edit, or display the details of a single item in the data set (e.g., a row in the table or an item from a list).

To create item actions,

1. [Create a data set view action](../data-set-view-actions.md).

1. Under the Display Options section, configure the general settings common to all actions.

Under the Action Behavior section, select the action type. You can find specific configurations for each item action you choose.

Here's a list of available item actions:
- [Async](#async-action)
- [Headless](#headless-action)
- [Link](#link-action)
- [Modal](#modal-item-action)
- [Side Panel](#side-panel-item-action)

### Link Action

Under the Action Behavior section,

![Use the Link type action and specify a URL for redirecting the user. Add a Headless Action Key, write a Confirmation Message, and choose the Message Type.](./data-set-view-actions/images/03.png)

1. The Link Type is selected by default. Use it to send users to a specified URL once they click on the action button/icon.

1. Specify the URL for redirecting the user.

1. (Optional) Enter a Headless Activation Key. With the activation key, administrators can associate an action to a headless endpoint (e.g. GET, POST, and DELETE).

   If you want to create a button with an action to edit a document, use `replace` as the Headless Activation Key.

   Find activation keys through your [API Explorer](../../../headless-delivery/consuming-apis/consuming-rest-services.md). See [Use Case: Using Actions to Edit Documents](./using-data-set-view-actions.md#use-case-using-actions-to-edit-documents) to learn more.

   ![Use Headless Activation Keys to link an action to a headless endpoint.](./data-set-view-actions/images/04.png)

   !!! important
       As the action is associated with a headless endpoint, the user must have the necessary permissions to use the endpoint (e.g. to edit the document). Otherwise, the action is not shown.

1. (Optional) Enter a Confirmation Message. The message appears before the action is executed.

   No message appears if this field is left blank.

   Choose the Message Type: Warning, Info, Secondary, Success, and Danger.

Once you're done, users should be redirected to the selected URL once they click on the action button/icon.

## Related Topics

- [Data Set View Item Actions](./data-set-view-item-actions.md)
- [Data Set View Creation Actions](./data-set-view-actions/data-set-view-creation-actions.md)
- [Data Set View Actions](../data-set-view-actions.md)