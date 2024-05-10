# コンタクトシンクのデータ参照

Liferay Instance から [Sync Contacts](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) を選択すると、Contacts テーブルと User テーブルから異なるフィールドを選択することができます。

![フィールドは、連絡先テーブルとユーザーテーブルから選択されます。](./contact-sync-data-reference/images/01.png)

これらのテーブルやフィールドの他に、ユーザー関連のデータも同期されます。

## カスタムフィールド

[ユーザーへのカスタムフィールドの追加](https://learn.liferay.com/w/dxp/users-and-permissions/users/adding-custom-fields-to-users) ユーザーや組織など、Liferayの多くの資産やリソースを拡張することができます。 以下のカスタムフィールドがシンクされます。

| 属性            | 説明                                        |
|:------------- |:----------------------------------------- |
| `columnId`    | カスタムフィールドの数値識別子                           |
| `className`   | どのエンティティへの参照か（すなわち カスタムフィールドが属するユーザー、組織）。 |
| `dataType`    | カスタムフィールドが参照するデータ値のタイプ                    |
| `displayType` | カスタムフィールドが提示するデータ値の種類                     |
| `name`        | カスタムフィールドの名前                              |

## 組織

ユーザーは、Liferay の異なる [組織について](https://learn.liferay.com/w/dxp/users-and-permissions/organizations/understanding-organizations) に所属することができます。 組織は、独自のサイトだけでなく、独自のロールやパーミッションを持つことができます。 組織は、親組織の下に子組織を持つことができます。 以下の組織フィールドがシンクされます。

| 属性                       | 説明                    |
|:------------------------ |:--------------------- |
| `organizationId`         | 組織を識別するための数値          |
| `organizationType`       | 組織の種類                 |
| `name`                   | 団体名                   |
| `parentOrganizationId`   | 親組織の数値識別子（組織は階層化できる）。 |
| `parentOrganizationName` | 親組織の名称                |
| `treePath`               | 組織への階層的なパス            |

## ロール

Liferay では、ユーザーにさまざまな [ロールと権限について](https://learn.liferay.com/w/dxp/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions) を与えることができます。 ロールは、異なるレベルの権限を持つように作成・管理することができます。 以下のロールフィールドがシンクされます。

| 属性        | 説明          |
|:--------- |:----------- |
| `roleId`- | 役割の数値による識別子 |
| `Name`    | 役割の名称       |

## チーム

 また、ユーザーは [サイトにチームを作成する](https://learn.liferay.com/w/dxp/site-building/sites/site-membership/creating-teams-for-sites) に所属することができます。 ユーザーは、1つのサイト内でチームにまとめられ、サイト固有の機能を発揮します。 以下のチームフィールドが同期されます。

| 属性       | 説明        |
|:-------- |:--------- |
| `teamId` | チームの数値識別子 |
| `Name`   | チーム名      |

## ユーザーグループ

[ユーザーグループの作成と管理](https://learn.liferay.com/w/dxp/users-and-permissions/user-groups/creating-and-managing-user-groups) 特定の目的のためにグループ化された、異なる組織に所属するユーザーのことである。 以下のユーザーグループのフィールドがシンクされます。

| 属性            | 説明             |
|:------------- |:-------------- |
| `userGroupId` | ユーザーグループの数値識別子 |
| `Name`        | ユーザーグループ名      |

## ユーザーグループサイト

[ユーザーグループ](https://learn.liferay.com/w/dxp/users-and-permissions/user-groups) グループメンバーの個人サイトに追加されるページです。 以下のユーザーグループサイトのフィールドが同期されます。

| 属性        | 説明            |
|:--------- |:------------- |
| `GroupId` | サイトを識別するための数値 |
| `Name`    | DXPサイト名       |
