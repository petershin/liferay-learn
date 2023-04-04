---
uuid: 02aa1e2d-bde7-4e9f-b412-3fcc362928a8
---

# 역할에 사용자 할당

Role의 할당 UI 위치는 [Role의 범위](./understanding-roles-and-permissions.md#roles-and-scope)에 해당합니다.

## 일정한 역할

전역 범위의 일반 역할은 DXP [제어판](../../getting-started/navigating-dxp.md#control-panel)에서 구성할 수 있습니다.

| 권한 범위          | 사용 가능한 과제                                                                 |
|:-------------- |:------------------------------------------------------------------------- |
| 가상 인스턴스 전체(전역) | 사용자 그룹 <br />조직 <br />사이트 <br />세그먼트 <br />개인 사용자 |

역할 추가/편집 양식의 담당자 탭에서 일반 역할에 사용자를 지정할 수 있습니다.

1. 제어판 &rarr; 사용자 &rarr; 역할로 이동하고 일반 역할을 클릭합니다.

1. 역할 추가/편집 양식의 할당자 탭에서 필요한 할당 유형 탭을 클릭합니다. 일반 역할은 사용자, 사이트, 조직, 사용자 그룹 또는 사용자 세그먼트에 할당됩니다.

1. 추가 버튼 ![Add](../../images/icon-add.png)을 클릭합니다.

1. 양수인을 선택하고 *추가*클릭합니다.

   그룹을 할당하면 해당 그룹에 할당된 모든 사용자가 역할을 상속합니다.

![전체 사용자 조직에 정규 역할을 할당할 수 있습니다.](./assigning-users-to-roles/images/05.png)

## 역할을 쓰십시요

사이트 사람 하위 메뉴의 멤버십 섹션에서 사이트 역할에 사용자를 할당할 수 있습니다.

| 권한 범위  | 사용 가능한 과제                                                     |
|:------ |:------------------------------------------------------------- |
| 단일 사이트 | 사용자 그룹 <br />조직 <br />세그먼트 <br />개별 사이트 구성원 |

1. 사이트 메뉴 &rarr; 사람 &rarr; 멤버십으로 이동합니다.

1. 역할을 할당할 회원 유형 탭을 클릭합니다. 사이트 역할은 사용자(즉, 개별 사이트 구성원), 조직 또는 사용자 그룹에 할당됩니다.

1. 작업 버튼 ![Add](../../images/icon-actions.png) &rarr; 역할 할당을 클릭합니다.

1. 할당할 역할을 선택하고 *완료*클릭합니다.

   그룹을 할당하면 해당 그룹에 할당된 모든 사용자가 역할을 상속합니다.

![사이트 메뉴의 People &rarr; Memberships 섹션 내에서 사이트 역할을 할당합니다.](./assigning-users-to-roles/images/01.png)

```{note}
Liferay CE 7.3.1 GA2 및 Liferay DXP 7.2 SP3+부터 사이트 역할을 [사용자 세그먼트](../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user -세그먼트.md). 자세한 내용은 [사용자 세그먼트에 역할 할당](./assigning-roles-to-user-segments.md)을 참조하십시오.
```

## 조직 역할

사용자 및 조직 제어판 섹션의 조직 탭에서 조직 역할에 사용자를 할당할 수 있습니다.

| 권한 범위 | 사용 가능한 과제 |
|:----- |:--------- |
| 단일 조직 | 개인 사용자    |

1. 제어판 &rarr; 사용자 &rarr; 사용자 및 조직으로 이동하여 _조직_ 탭을 클릭합니다.

1. 조직에 대한 작업 버튼 ![Add](../../images/icon-actions.png) 클릭하고 _조직 역할 할당_선택합니다.

1. 할당할 역할을 선택하면 현재 담당자 목록이 표시됩니다.

1. 새 할당자를 추가하려면 _사용 가능_ 탭을 클릭하여 역할에 할당할 수 있는 조직 구성원을 확인합니다.

1. 양수인을 선택한 다음 _Update Associations_클릭합니다.

![제어판의 조직 섹션에서 조직 역할을 할당합니다.](./assigning-users-to-roles/images/02.png)

## 애셋 라이브러리 역할

자산 라이브러리에 대한 역할 할당은 사이트에 대한 할당과 거의 동일합니다. 즉, 자산 라이브러리의 사람 하위 메뉴에 있는 구성원 섹션에서 사용자를 자산 라이브러리 역할에 할당합니다.

| 권한 범위       | 사용 가능한 과제                                 |
|:----------- |:----------------------------------------- |
| 단일 자산 라이브러리 | 조직 <br />사용자 그룹 <br /> 개인 사용자 |

1. [자산 라이브러리](../../content-authoring-and-management/asset-libraries/asset-libraries-overview.md) 메뉴 &rarr; 사람 &rarr; 멤버십으로 이동합니다.

1. 역할을 할당할 회원 유형 탭을 클릭합니다. 사이트와 마찬가지로 자산 라이브러리는 사용자(즉, 개별 사이트 구성원), 조직 또는 사용자 그룹에 할당됩니다.

1. 작업 버튼 ![Add](../../images/icon-actions.png) &rarr; 역할 할당을 클릭합니다.

1. 할당할 역할을 선택하고 *완료*클릭합니다.

   그룹을 할당하면 해당 그룹에 할당된 모든 사용자가 역할을 상속합니다.

![자산 라이브러리 메뉴의 People &rarr; Memberships 섹션 내에서 자산 라이브러리 역할을 할당합니다.](./assigning-users-to-roles/images/03.png)


<!--
## Account Roles

You can assign Users to an Account Role in the Accounts Control Panel section.

| Permission Scope | Available Assignments |
| :--- | :--- |
| A single Account | Individual Account Members |

1. Go to Control Panel &rarr; Accounts &rarr; Accounts, and click on the Account of interest.

1. Click the Roles tab for the Account.

1. Choose the Role to assign and you see the current assignees listed.

1. To add new assignees, click the _Available_ tab to see the Account members that can be assigned to the Role.

1. Choose the assignees, then click _Update Associations_.

![Assign an Account Role within the Accounts section of the Control Panel.](./assigning-users-to-roles/images/04.png)
-->

## 과태 사용자 협회

기본적으로 새 사용자는 사용자 역할만 받지만 기본 역할 연결을 관리하여 새 역할을 추가하거나 사용자 할당을 제거할 수 있습니다.

| 권한 범위          | 사용 가능한 과제 |
|:-------------- |:--------- |
| 가상 인스턴스 전체(전역) | 모든 신규 사용자 |

1. 제어판 &rarr; 구성 &rarr; 인스턴스 설정으로 이동합니다.

1. PLATFORM 섹션에서 사용자 범주를 선택합니다.

1. 왼쪽 메뉴에서 _기본 사용자 연결_ 클릭합니다.

1. 일반 역할 구성 필드를 사용하여 모든 새 사용자가 상속해야 하는 일반 역할 목록을 쉼표로 구분하여 입력합니다.

자세한 내용은 [기본 사용자 연결](../../system-administration/configuring-liferay/virtual-instances/users.md#default-user-associations) 설명서를 참조하십시오.

![인스턴스 설정을 사용하여 모든 새 사용자에 대한 기본 일반 역할을 설정합니다.](./assigning-users-to-roles/images/06.png)

할당은 중요하지만 역할은 권한 없이 차지하는 데이터베이스 행만큼 가치가 없습니다. 다음에 역할에 대한 [정의 권한](./defining-role-permissions.md) 에 대해 읽으십시오.
