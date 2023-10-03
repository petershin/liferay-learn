---
uuid: b9eead1c-5b9a-4c1c-8fdf-7e69598ccb13
---
# Setting Widget Permissions

All of Liferay's widgets support Liferay's robust, fine-grained permissions system. Some higher level permissions can be configured in the permissions tab of the widget's configuration dialog box.

1. Go to the widget's *Options* icon (![Options](../../../../../images/icon-app-options.png)) and select *Permissions*. This shows you a table of roles.

1. Use the check boxes to grant certain permissions to different roles. Click *Save* after you've made your selections.

```{note}
Some widgets have permissions specific to them. For example, Message Boards contains a *Ban User* permission. This makes no sense in the context of most other widgets. Those permissions are covered with those widgets.
```

Here is a list of the available general permissions:

| Permission           | Description                               |
| :------------------- | :---------------------------------------- |
| Add Display Template | Add a display template to the widget.     |
| Permissions          | View and modify the widget's permissions. |
| Preferences          | View and modify the widget's preferences. |
| Configuration        | Access the widget's configuration menu.   |
| View                 | View the widget.                          |
| Add to Page          | Add a widget to a site page.              |

![The permissions matrix makes configuration for a widget convenient.](./setting-widget-permissions/images/01.png)

## Related Topics

[Setting Widget Scopes](./setting-widget-scopes.md)

[Understanding Roles and Permissions](../../../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)
