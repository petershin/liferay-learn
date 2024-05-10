---
uuid: d8c3adfd-711a-486b-b4c6-7d1a27a569d2
taxonomy-category-names:
- Cloud
- Analytics Cloud Administration
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
---
# Contact Sync Data Reference

When you [Sync Contacts](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) from your Liferay Instance, you can choose different fields from the Contacts table and the User table.

![Fields are selected from the contacts table and the user table.](./contact-sync-data-reference/images/01.png)

In addition to these tables and fields, there are other user associated data that are also synced.

## Custom Fields

[Custom Fields](https://learn.liferay.com/en/w/dxp/system-administration/configuring-liferay/adding-custom-fields) can extend many of Liferay's assets and resources, including users or organizations. The following custom fields are synced:

| Attribute     | Description                                                                     |
| :------------ | :------------------------------------------------------------------------------ |
| `columnId`    | Numeric identifier of the custom field                                          |
| `className`   | Reference to which entity (i.e. User, Organization) the custom field belongs to |
| `dataType`    | Type of the data value the custom field refers to                               |
| `displayType` | Type of data value the custom field presents                                    |
| `name`        | Name of the custom field                                                        |

## Organizations

Users can belong to different [Organizations](https://learn.liferay.com/w/dxp/users-and-permissions/organizations/understanding-organizations) in Liferay. Organizations can have their own sites as well as their own roles and permissions. Organizations can have sub-organizations under a parent organization. The following organization fields are synced:

| Attribute                | Description                                                                       |
| :----------------------- | :-------------------------------------------------------------------------------- |
| `organizationId`         | Numeric identifier of the Organization                                            |
| `organizationType`       | Type of the Organization                                                          |
| `name`                   | Name of the Organization                                                          |
| `parentOrganizationId`   | Numeric identifier of the parent Organization as Organization can be hierarchical |
| `parentOrganizationName` | Name of the parent Organization                                                   |
| `treePath`               | The hierarchical path to the Organization                                         |

## Roles

Users can be given different [Roles](https://learn.liferay.com/w/dxp/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions) in Liferay. Roles can be created and managed to have different levels of permissions. The following role fields are synced:

| Attribute | Description                    |
| :-------- | :----------------------------- |
| `roleId`  | Numeric identifier of the role |
| `Name`    | Name of the role               |

## Teams

Users can also belong to [Teams](https://learn.liferay.com/w/dxp/site-building/sites/site-membership/creating-teams-for-sites). Users are brought together into a team within a single site for site-specific functions. The following team fields are synced:

| Attribute | Description                    |
| :-------- | :----------------------------- |
| `teamId`  | Numeric identifier of the Team |
| `Name`    | Name of the Team               |

## User Groups

[User Groups](https://learn.liferay.com/w/dxp/users-and-permissions/user-groups/creating-and-managing-user-groups) are users who may be from different organizations, who are grouped together for a specific purpose. The following user group fields are synced:

| Attribute     | Description                          |
| :------------ | :----------------------------------- |
| `userGroupId` | Numeric identifier of the User Group |
| `Name`        |  Name of the User Group              |

## User Group Sites

[User Group Sites](https://learn.liferay.com/w/dxp/users-and-permissions/user-groups) are pages added to group members' personal sites. The following user group sites fields are synced:

| Attribute | Description                    |
| :-------- | :----------------------------- |
| `GroupId` | Numeric identifier of the Site |
| `Name`    | Name of the DXP Site           |