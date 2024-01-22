---
uuid: 0a2d8dd1-5426-45f1-b909-4d77fa9a6d23
---
# Audit Event Types Reference

The [`EventTypes`](https://github.com/liferay/liferay-portal/blob/%5B$LIFERAY_LEARN_PORTAL_GIT_TAG$%5D/modules/apps/portal-security-audit/portal-security-audit-event-generators-api/src/main/java/com/liferay/portal/security/audit/event/generators/constants/EventTypes.java) class lists the different event categories logged by the audit framework. It specifies the action performed on the resource listed in the audit application. There are 10 events types logged by the audit framework.

| Event Type    | Supported Resources                                   | Description                                                                                               |
| :------------ | :---------------------------------------------------- | :-------------------------------------------------------------------------------------------------------- |
| ADD           | Organization, Role, User, UserGroup                   | Specifies the addition of the listed resource.                                                            |
| ASSIGN        | Organization, Role, User, UserGroup                   | Specifies that the resource has been assigned to something. For instance, a role assigned to a user.      |
| DELETE        | Organization, Role, User, UserGroup                   | Specifies the deletion of the listed resource.                                                            |
| IMPERSONATE   | User                                                  | Specifies the impersonation of a user.                                                                    |
| LOGIN         | User                                                  | Specifies a user has logged in.                                                                           |
| LOGIN_DNE     | User                                                  | Specifies that the username does not exist.                                                               |
| LOGIN_FAILURE | User                                                  | Specifies a login failure.                                                                                |
| LOGOUT        | User                                                  | Specifies a user has logged out.                                                                          |
| UNASSIGN      | Organization, Role, User, UserGroup                   | Specifies that the resource has been unassigned from something. For instance, a role removed from a user. |
| UPDATE        | Address, Contact, Organization, Role, User, UserGroup | Specifies the updation of the listed resource.                                                            |

## Related Topics

* [Searching and Exporting Audit Events](./searching-and-exporting-audit-events.md)
* [Audit Configuration Reference](./audit-configuration-reference.md)