---
uuid: 0a2d8dd1-5426-45f1-b909-4d77fa9a6d23
---
# Audit Event Types Reference

The [`EventTypes`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-security-audit/portal-security-audit-event-generators-api/src/main/java/com/liferay/portal/security/audit/event/generators/constants/EventTypes.java) class lists the different event categories logged by the audit framework. It specifies the action performed on the resource listed in the audit application. There are 10 event types logged by the audit framework.

| Event Type    | Supported Resources                                   | Description                                                                               |
|:--------------|:------------------------------------------------------|:------------------------------------------------------------------------------------------|
| ADD           | Organization, Role, User, UserGroup                   | The listed resource has been added.                                                       |
| ASSIGN        | Organization, Role, User, UserGroup                   | The resource has been assigned to something; for example, a role assigned to a user.      |
| DELETE        | Organization, Role, User, UserGroup                   | The listed resource was deleted.                                                          |
| IMPERSONATE   | User                                                  | A user was impersonated.                                                                  |
| LOGIN         | User                                                  | A user has logged in.                                                                     |
| LOGIN_DNE     | User                                                  | The username does not exist.                                                              |
| LOGIN_FAILURE | User                                                  | A login failed.                                                                           |
| LOGOUT        | User                                                  | A user has logged out.                                                                    |
| UNASSIGN      | Organization, Role, User, UserGroup                   | The resource has been unassigned from something; for example, a role removed from a user. |
| UPDATE        | Address, Contact, Organization, Role, User, UserGroup | The listed resource was updated.                                                          |

## Related Topics

* [Searching and Exporting Audit Events](./searching-and-exporting-audit-events.md)
* [Audit Configuration Reference](./audit-configuration-reference.md)

