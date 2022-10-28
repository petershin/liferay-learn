# コンタクトシンクのデータ参照

Liferayインスタンスから [Sync Contacts](../getting-started/syncing-sites-and-contacts.md) を選択すると、ContactsテーブルとUserテーブルから異なるフィールドを選択することができます。

![フィールドは、contactsテーブルとuserテーブルから選択されます。](./contact-sync-data-reference/images/01.png)

これらのテーブルとフィールドの他に、ユーザー関連のデータも同期されます。

## カスタムフィールド

[カスタムフィールド](https://learn.liferay.com/dxp/latest/en/users-and-permissions/users/adding-custom-fields-to-users.html) ユーザーや組織など、Liferayの多くの資産やリソースを拡張することができます。 以下のカスタムフィールドがシンクされます。

| 属性            | 説明                                        |
|:------------- |:----------------------------------------- |
| `columnId`    | カスタムフィールドの数値識別子                           |
| `className`   | どのエンティティかを参照する（すなわち ユーザー、組織）カスタムフィールドの所属先 |
| `dataType`    | カスタムフィールドが参照するデータ値のタイプ                    |
| `displayType` | カスタムフィールドが示すデータ値の種類                       |
| `name`        | カスタムフィールドの名前                              |

## 組織

Liferay では、ユーザーは異なる [Organizations](https://learn.liferay.com/dxp/latest/en/users-and-permissions/organizations/understanding-organizations.html) に所属することができます。 組織は、独自のサイトを持つことができ、また、独自の役割と権限を持つことができます。 組織は、親組織の下に子組織を持つことができます。 以下の組織フィールドがシンクされます。

| 属性                       | 説明                          |
|:------------------------ |:--------------------------- |
| `organizationId`         | 組織の数値的な識別子                  |
| `organizationType`       | 組織の種類                       |
| `name`                   | 団体名                         |
| `parentOrganizationId`   | 組織は階層化することができるので、親組織の数値の識別子 |
| `parentOrganizationName` | 親組織の名称                      |
| `treePath`               | 組織への階層的なパス                  |

## ロール

Liferay では、ユーザーに異なる [Roles](https://learn.liferay.com/dxp/latest/en/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.html) を与えることができます。 ロールを作成し、異なるレベルの権限を持つように管理することができます。 以下のロールフィールドがシンクされます。

| 属性        | 説明         |
|:--------- |:---------- |
| `roleId`- | 役割の数値的な識別子 |
| `Name`    | 役割の名称      |

## チーム

 ユーザーは、 [チーム](https://learn.liferay.com/dxp/latest/en/site-building/sites/site-membership/creating-teams-for-sites.html)に所属することもできます。 ユーザーは、1つのサイト内でチームにまとめられ、サイト固有の機能を発揮します。 以下のチームフィールドがシンクされます。

| 属性       | 説明           |
|:-------- |:------------ |
| `teamId` | チームの数字による識別子 |
| `Name`   | チーム名         |

## ユーザーグループ

[ユーザーグループ](https://learn.liferay.com/dxp/latest/en/users-and-permissions/user-groups/creating-and-managing-user-groups.html) 異なる組織に所属するユーザーが、特定の目的のためにグループ化されたものです。 以下のユーザーグループのフィールドがシンクされます。

| 属性            | 説明               |
|:------------- |:---------------- |
| `userGroupId` | ユーザーグループの数値的な識別子 |
| `Name`        | ユーザーグループ名        |

## ユーザーグループサイト

[ユーザーグループサイト](https://learn.liferay.com/dxp/latest/en/users-and-permissions/user-groups.html) グループメンバーの個人サイトに追加されるページです。 以下のユーザーグループサイトのフィールドが同期されます。

| 属性        | 説明           |
|:--------- |:------------ |
| `GroupId` | サイトの数字による識別子 |
| `Name`    | DXPサイト名      |
