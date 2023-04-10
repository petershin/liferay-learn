# 역할 및 권한 이해

Liferay DXP에서 작업을 수행하려면 [사용자](./../users/understanding-users.md) 적절한 권한이 있어야 합니다. 역할은 사용자에게 권한을 부여합니다. 역할 및 권한에 대한 대부분의 관리 작업은 **제어판** &rarr; **사용자** &rarr; **역할** 에서 수행됩니다.

![제어판에서 역할을 관리합니다.](./understanding-roles-and-permissions/images/03.png)

역할 생성 및 사용자 할당으로 바로 건너뛰려면 다음을 참조하십시오.

* [역할 생성 및 관리](./creating-and-managing-roles.md)
* [역할 권한 정의](./defining-role-permissions.md)
* [역할에 사용자 할당](./assigning-users-to-roles.md)

```{note}
[사이트 팀](./../../site-building/sites/site-membership/creating-teams-for-sites.md)에는 전용 권한 관리 사용자 인터페이스가 있습니다.
```

## 역할 및 범위

사용자에게 Liferay DXP 내에서 의도한 기능을 수행하는 데 필요한 권한을 부여하려면 먼저 권한 집합을 역할과 연결해야 합니다.

예를 들어 **Message Boards Admin** 역할 및 사용자 **Jane Slaughter** 사용하여 수행할 수 있는 단계는 다음과 같습니다.

1. 필요한 기능 결정: **Liferay DXP에서 게시판 관리.**
1. 범위 결정: **가상 인스턴스 전체(전역).**
1. 적절하게 범위가 지정된 역할을 생성하여 기능을 강화하는 권한을 할당합니다: **Message Boards Admin(일반 역할).**
1. 사용자 컬렉션 만들기: **Message Boards Administrators라는 사용자 그룹.**
1. 사용자 컬렉션에 역할 할당: **Message Boards Administrators &rarr; Message Boards Admin Role.**
1. 사용자 컬렉션에 사용자 할당: **Jane Slaughter &rarr; Message Boards Administrators.**

아래의 개념 다이어그램은 사용자가 Liferay DXP의 역할 및 권한 시스템에서 필요한 권한을 상속받는 방법을 보여줍니다. 여기에는 완전히 연결된 하나의 역할 할당만 표시되지만(메시지 보드 관리자가 되는 사용자의 경우) 새 화살표를 그리면 다른 사용자 컬렉션 및 역할 할당을 통해 사용자와 권한이 어떻게 연결되는지 확인할 수 있습니다.

![역할은 권한을 사용자와 효율적으로 연결하기 위해 존재합니다.](./understanding-roles-and-permissions/images/02.png)

역할에는 범위가 있으므로 다양한 수준에 적용됩니다.

| 권한 범위          | 역할 유형    | 사용자에게 할당되는 사이트는 어디입니까?                              | 사용 가능한 과제                                                                 |
|:-------------- |:-------- |:-------------------------------------------------- |:------------------------------------------------------------------------- |
| 가상 인스턴스 전체(전역) | 일정한      | 제어판 &rarr; 사용자 &rarr; 역할(역할 클릭) &rarr; 담당자         | 사용자 그룹 <br />조직 <br />사이트 <br />세그먼트 <br />개인 사용자 |
| 단일 조직          | 조직       | 제어판 &rarr; 사용자 &rarr; 사용자 및 조직 &rarr; 조직(조직 작업 메뉴) | 개인 사용자                                                                    |
| 단일 사이트         | 사이트      | 사이트 관리 &rarr; 명 &rarr; 멤버십                         | 사용자 그룹 <br />조직 <br />세그먼트 <br />개별 사이트 구성원             |
| 단일 자산 라이브러리    | 애셋 라이브러리 | 자산 라이브러리의 사이트/라이브러리 관리 &rarr; 사람 &rarr; 멤버십        | 조직 <br />사용자 그룹 <br /> 개인 사용자                                 |

<!-- ripped out row from above table as per LRODCS-8188: | A single Account | Account   | Control Panel &rarr; Accounts &rarr; Accounts (Select Account) &rarr; Roles | Individual Account Members -->

개별 [사용자](./../users/understanding-users.md)를 역할에 수동으로 할당할 수 있습니다. 이 방법은 사용자 컬렉션을 사용하는 것보다 덜 효율적입니다. 또한 사용자는 기본 사용자라는 가상 인스턴스 설정을 통해 모든 범위의 역할에 [자동으로](../../system-administration/configuring-liferay/virtual-instances/users.md#default-user-associations) 할당될 수 있습니다. 협회.

### 일정한 역할

인스턴스 범위 역할을 일반 역할이라고 합니다. 이러한 역할은 전역적으로 또는 [가상 인스턴스](./../../system-administration/configuring-liferay/virtual-instances.html) 전체에 권한을 부여합니다.

일반 역할에 여러 사용자 컬렉션을 할당할 수 있습니다.

* [조직](./../organizations/understanding-organizations.md) 은 공유 계층 수준의 사용자를 보유합니다.
* [사용자 그룹](./../user-groups/creating-and-managing-user-groups.md) 은 동일한 기능을 수행할 필요성만 공유하는 사용자를 보유합니다.
* [사이트](./../../site-building/sites/site-membership/adding-members-to-sites.md) 은 특정 작업을 수행해야 할 수 있는 사용자(사이트 구성원)를 보유합니다.
* [세그먼트](./../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) 특정 조건과 일치하는 사이트 사용자를 보유합니다.

### 조직 역할

조직 범위 역할을 조직 역할이라고 합니다. 조직 역할에 대한 권한은 전역 수준에서 정의되며 하나의 특정 [조직](../../users-and-permissions/organizations/understanding-organizations.md)에 적용됩니다. 사용자는 조직에 개별적으로 추가되고 조직 역할에 개별적으로 할당됩니다.

### 역할을 쓰십시요

사이트 범위 역할을 사이트 역할이라고 합니다. 사이트 역할에 대한 권한은 전역 수준에서 정의되며 하나의 [사이트](../../site-building/introduction-to-site-building.md)에 적용됩니다. 개별 사용자, 조직 및 사용자 그룹을 사용하여 사이트 구성원을 제어하고 사이트 역할을 할당할 수 있습니다.

## 권한

권한은 응용 프로그램 개발자가 만듭니다. 사용자가 수행할 수 있는 작업 또는 특정 자산에 대한 사용자의 액세스 권한을 정의합니다.

### 애플리케이션 범위 권한

Liferay DXP의 페이지에 있는 각 위젯 인스턴스와 사이트 메뉴 &rarr; 콘텐츠 및 데이터 섹션의 각 관리 응용 프로그램에 대한 권한을 부여할 수 있습니다. 자세한 내용은 [위젯 권한](./../../site-building/creating-pages/page-fragments-and-widgets/using-widgets/configuring-widgets/setting-widget-permissions.md) 참조하세요.

### 자산 범위 권한

자산 수준 권한(예: 개별 블로그 게시물을 편집하거나 문서 및 미디어 라이브러리의 폴더를 볼 수 있는 권한)은 제어판이 아닌 개별 자산에서 관리됩니다. 자세한 내용은 [위젯 권한](./../../site-building/creating-pages/page-fragments-and-widgets/using-widgets/configuring-widgets/setting-widget-permissions.md) 참조하세요.

## 관련 항목

* [역할 생성 및 관리](./creating-and-managing-roles.md)
* [역할 권한 정의](./defining-role-permissions.md)
* [역할에 사용자 할당](./assigning-users-to-roles.md)
