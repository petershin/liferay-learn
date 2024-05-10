---
toc:
  - ./accounts/account-users.md
  - ./accounts/account-addresses.md
  - ./accounts/account-groups.md
  - ./accounts/account-roles.md
  - ./accounts/account-management-widget.md
  - ./accounts/using-workflow-with-accounts.md
  - ./accounts/channel-defaults.md
---
# 계정

{bdg-secondary}`가능 7.4+`

계정은 관리자에게 다양한 상거래 또는 비즈니스 요구에 맞게 사용자를 구성하고 관리하는 방법을 제공합니다. [조직](./organizations.md) 또는 [사용자 그룹](./user-groups.md)과 달리 계정은 상품 및 서비스 구매 또는 기존 고객 관리와 같은 비즈니스 상황에서 발생할 수 있는 상호 작용을 용이하게 합니다.

**비즈니스** , **개인** 및 **게스트** 유형의 세 가지 계정 유형이 있습니다. 비즈니스 계정은 여러 사용자를 계정에 연결할 수 있습니다. 개인 유형 계정에는 연결된 계정이 하나만 있을 수 있습니다. 게스트 유형 계정은 등록되지 않은 사용자가 비즈니스 또는 사이트와 상호 작용할 수 있는 방법을 제공합니다.

```{note}
계정은 원래 [계정 관리](https://learn.liferay.com/w/commerce/users-and-accounts/account-management) 에 있는 기능으로 현재 Liferay DXP의 일부입니다. 7.4 이상.
```

## 계정 만들기

1. **글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **제어판** &rarr; **계정** 으로 이동합니다.

1. ** 추가 아이콘(![Add icon](../images/icon-add.png))을 클릭하여 새 계정을 만듭니다.

1. 계정에 이름을 지정하고 유형을 선택합니다. 계정이 생성되면 유형을 변경할 수 없습니다.

   ![계정에 이름을 지정하고 유형을 선택합니다.](./accounts/images/01.png)

1. 세금 ID 또는 설명과 같은 계정에 대한 추가 정보를 추가합니다. **저장** 클릭하여 새 계정을 만듭니다.

1. 계정을 생성하면 페이지 상단에 탭이 나타납니다.

   ![계정을 만든 후 새 탭이 나타납니다.](./accounts/images/02.png)

### 세부 정보 탭

세부 정보 탭에는 계정 이름 및 유형과 같은 계정에 대한 기본 정보가 표시됩니다. 기본 청구 주소 및 배송 주소도 여기에서 설정할 수 있습니다. [범주](../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) 또는 [사용자 지정 필드](../system-administration/configuring-liferay/adding-custom-fields.md) 계정의 추가 사용자 지정을 위해 추가할 수도 있습니다.

### 주소 탭

주소 탭에는 계정과 연결된 여러 주소가 표시됩니다. 새 주소를 추가하려면 추가 아이콘(![Add icon](../images/icon-add.png))을 클릭하십시오. 주소 정보를 입력하고 **저장** 버튼을 클릭합니다.

![주소 정보를 입력하고 저장을 클릭합니다.](./accounts/images/03.png)

자세한 내용은 [계정 주소](./accounts/account-addresses.md) 참조하십시오.

### 사용자 탭

사용자 탭에는 계정과 연결된 다양한 사용자가 표시됩니다. 이 탭은 개인 유형 계정 또는 게스트 유형 계정에는 존재하지 않습니다. 사용자를 계정에 연결하려면

1. ** 추가 아이콘(![Add icon](../images/icon-add.png))을 클릭합니다. 창에 선택할 수 있는 계정 사용자 목록이 표시됩니다.

1. 사용자 이름 옆에 있는 상자를 선택하여 사용자를 선택하고 **할당** 버튼을 클릭합니다.

1. 이 보기에서 새 사용자를 만들 수도 있습니다. ** 추가 아이콘(![Add icon](../images/icon-add.png))을 클릭하면 새 사용자 추가 페이지가 표시됩니다.

1. 새 사용자에 대한 정보를 입력하고 **저장** 버튼을 클릭합니다.

1. 생성되었거나 계정과 연결된 모든 새 사용자가 사용자 탭에 표시됩니다. 자세한 내용은 [계정 사용자](./accounts/account-users.md) 참조하십시오.

### 조직 탭

조직 탭에는 계정과 연결된 다양한 조직이 표시됩니다. 조직을 연결하려면 **추가** 아이콘(![Add icon](../images/icon-add.png))을 클릭합니다. 연결할 조직을 선택하고 **할당** 버튼을 클릭합니다.

### 계정 그룹 탭

계정 그룹 탭에는 계정에 대한 다양한 그룹 구성원이 표시됩니다. 이러한 그룹을 생성하거나 관리하는 방법에 대해 자세히 알아보려면 [계정 그룹](./accounts/account-groups.md)을 참조하십시오.

### 역할 탭

역할 탭에는 계정에 사용할 수 있는 다양한 역할이 표시됩니다. 게스트 유형 계정에는 이 탭이 없습니다.

계정 역할을 생성하려면

1. ** 추가 아이콘(![Add icon](../images/icon-add.png))을 클릭합니다.

1. 다음 페이지에서 역할에 제목과 설명을 지정합니다. **저장** 클릭합니다.

1. 역할이 생성되면 권한을 정의하고 사용자를 할당할 수 있습니다. **권한 정의** 탭을 클릭하고 역할에 대한 권한을 선택합니다.

1. **Assignees** 탭을 클릭하여 사용자를 역할에 할당합니다. **추가** 아이콘(![Add icon](../images/icon-add.png))을 클릭하여 사용자를 선택하고 **할당** 버튼을 클릭합니다.

자세한 내용은 [계정 역할](./accounts/account-roles.md) 참조하세요.

## 계정 변경

1. 수정하려는 계정의 **작업** 아이콘(![Actions icon](../images/icon-actions.png))을 클릭합니다.

1. 다음 중 하나를 선택합니다.

   ![계정을 편집하려면 선택하십시오.](./accounts/images/04.png)

   * 편집 - 계정 정보를 보고 편집합니다.
   * 사용자 관리 - 계정 사용자를 추가하거나 제거합니다.
   * 조직 관리 - 조직 연결을 추가하거나 제거합니다.
   * 비활성화 - 계정을 비활성화합니다.
   * 삭제 - 계정을 삭제합니다.

   개인 계정 유형의 경우 사용자 관리 기능이 없습니다.

1. 다음 옵션에 액세스하려면 **편집** 선택합니다.

   ![추가 옵션을 보려면 편집을 선택합니다.](./accounts/images/02.png)

   * 세부 정보 탭 - 계정에 대한 추가 정보를 수정하거나 추가합니다.
   * 주소 탭 - 청구 및 배송 주소를 추가하거나 관리합니다.
   * 사용자 탭 - 계정 사용자를 추가하거나 제거합니다. 자세한 내용은 [계정 사용자](./accounts/account-users.md) 참조하십시오.
   * 조직 탭 - 조직 연결을 추가하거나 제거합니다.
   * 계정 그룹 탭 - 계정이 속한 계정 그룹을 봅니다. 자세한 내용은 [계정 그룹](./accounts/account-groups.md) 을 참조하십시오.
   * 역할 탭 - 계정에 대한 다양한 역할을 추가하거나 관리합니다. 자세한 내용은 [계정 역할](./accounts/account-roles.md) 참조하십시오.

## 관련 정보

* [계정 사용자](./accounts/account-users.md)
* [계정 주소](./accounts/account-addresses.md)
* [계정 그룹](./accounts/account-groups.md)
* [계정 역할](./accounts/account-roles.md)
* [계정 관리 위젯](./accounts/account-management-widget.md)
* [계정으로 워크플로 사용](./accounts/using-workflow-with-accounts.md)
* [채널 기본값](./accounts/channel-defaults.md)
