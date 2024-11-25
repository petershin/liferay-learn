---
uuid: 27746b9f-4e37-4a0e-8b49-20c4f223442b
taxonomy-category-names:
- Cloud
- Analytics Cloud Administration
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---
# Managing Properties

After [creating a property](../workspace-settings/scoping-sites-and-individuals-using-properties.md#creating-a-property) it can be managed and modified from the Workspace Settings section of Analytics Cloud. Navigate to *Settings* &rarr; *Workspace Settings* &rarr; *Properties*.

![Navigate to the Properties section in Settings.](./managing-properties/images/01.png)

To make changes to a property,

1. Locate the property by scrolling or using the search bar.

1. Click the property name. 

## Renaming a Property

To change the name of the property click *Edit* (![edit icon](../images/icon-edit.png)) and input the changes. Clicking outside the text box commits the changes.

![Click the edit icon to change the Property name.](./managing-properties/images/02.png)

## Clearing Property Data

To clear property data, click *Clear Data*. A new form appears to confirm your action. Copy and paste the verification sentence into the text box. This enables the *Clear Data* button. Click the button and the data is cleared.

![Copy the sentence to enable the Clear Data button](./managing-properties/images/03.png)

```{warning}
This results in the complete removal of this property's historical events. You cannot undo this operation.
```

## Deleting a Property

To delete the property click the _Delete_ button. A new form appears to confirm your action. Copy and paste the verification sentence into the text box. This enables the _Delete_ button. Click the button and the property is deleted. Note, a property cannot be deleted until all sites and commerce channels have been disconnected from your Liferay instance settings. 

```{warning}
This results in the complete removal of the property and its historical events. You cannot undo this operation.
```

## Adding and Removing Users to a Property

By default all Workspace users have access to the different properties of a Workspace. To give only selected users access to the property, change the *All Users* selection to *Select Users*. A new form appears to confirm your action. Click the *Okay* button.

### Add a User

To add a to the property click *Add User*. A new form appears with a list of all the users of the Workspace. Place a checkmark next to the user you wish to add and click the *Submit* button. The user is now added to the list of select users.

![Place a checkmark for a user and click the Submit button.](./managing-properties/images/04.png)

### Remove a User

To remove a user click the "X" icon to the right of the user's email. A new form appears to confirm your action. Click the *Remove* button and the user is removed from the list of select users.

![Click the X button next to a name to remove.](./managing-properties/images/05.png)
