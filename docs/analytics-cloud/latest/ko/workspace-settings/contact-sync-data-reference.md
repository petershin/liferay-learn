# 연락처 동기화 데이터 참조

Liferay 인스턴스에서 연락처 [연락처 동기화](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) 동기화하면 연락처 테이블과 사용자 테이블에서 다른 필드를 선택할 수 있습니다.

![필드는 연락처 테이블과 사용자 테이블에서 선택됩니다.](./contact-sync-data-reference/images/01.png)

이러한 테이블 및 필드 외에도 동기화되는 다른 사용자 관련 데이터가 있습니다.

## 주문 속성

[사용자에게 사용자 정의 필드 추가](https://learn.liferay.com/w/dxp/users-and-permissions/users/adding-custom-fields-to-users) 사용자 또는 조직을 포함하여 많은 Liferay 자산 및 리소스를 확장할 수 있습니다. 다음 사용자 정의 필드가 동기화됩니다.

| 속성            | 묘사                                      |
|:------------- |:--------------------------------------- |
| `columnId`    | 사용자 정의 필드의 숫자 식별자                       |
| `className`   | 어떤 엔티티에 대한 참조(예: 사용자, 조직) 사용자 정의 필드가 속한 |
| `dataType`    | 사용자 정의 필드가 참조하는 데이터 값의 유형               |
| `displayType` | 사용자 정의 필드가 제공하는 데이터 값 유형                |
| `name`        | 사용자 정의 필드의 이름                           |

## 조직

사용자는 Liferay에서 다른 [조직 이해](https://learn.liferay.com/w/dxp/users-and-permissions/organizations/understanding-organizations) 에 속할 수 있습니다. 조직은 자체 사이트와 자체 역할 및 권한을 가질 수 있습니다. 조직은 상위 조직 아래에 하위 조직을 가질 수 있습니다. 다음 조직 필드가 동기화됩니다.

| 속성                       | 묘사                            |
|:------------------------ |:----------------------------- |
| `organizationId`         | 조직의 숫자 식별자                    |
| `organizationType`       | 조직의 유형                        |
| `name`                   | 조직명                           |
| `parentOrganizationId`   | 조직이 계층적일 수 있으므로 상위 조직의 숫자 식별자 |
| `parentOrganizationName` | 상위 조직의 이름                     |
| `treePath`               | 조직의 계층적 경로                    |

## 역할

사용자는 Liferay에서 다른 [역할 및 권한 이해](https://learn.liferay.com/w/dxp/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions) 부여받을 수 있습니다. 다양한 수준의 권한을 갖도록 역할을 만들고 관리할 수 있습니다. 다음 역할 필드가 동기화됩니다.

| 속성       | 묘사         |
|:-------- |:---------- |
| `역할 ID`- | 역할의 숫자 식별자 |
| `Name`   | 역할의 이름     |

## 팀

 사용자는 [사이트용 팀 만들기](https://learn.liferay.com/w/dxp/site-building/sites/site-membership/creating-teams-for-sites) 에도 속할 수 있습니다. 사용자는 사이트별 기능을 위해 단일 사이트 내에서 팀으로 모입니다. 다음 팀 필드가 동기화됩니다.

| 속성       | 묘사        |
|:-------- |:--------- |
| `teamId` | 팀의 숫자 식별자 |
| `Name`   | 팀명        |

## 사용자 그룹

[사용자 그룹 생성 및 관리](https://learn.liferay.com/w/dxp/users-and-permissions/user-groups/creating-and-managing-user-groups) 은 특정 목적을 위해 그룹화된 서로 다른 조직의 사용자입니다. 다음 사용자 그룹 필드가 동기화됩니다.

| 속성            | 묘사             |
|:------------- |:-------------- |
| `userGroupId` | 사용자 그룹의 숫자 식별자 |
| `Name`        | 사용자 그룹 이름      |

## 사용자 그룹 사이트

[사용자 그룹](https://learn.liferay.com/w/dxp/users-and-permissions/user-groups) 그룹 구성원의 개인 사이트에 추가된 페이지입니다. 다음 사용자 그룹 사이트 필드가 동기화됩니다.

| 속성        | 묘사          |
|:--------- |:----------- |
| `GroupId` | 사이트의 숫자 식별자 |
| `Name`    | DXP 사이트 이름  |
