# 계정 작업

Liferay의 계정은 B2C(즉, 기업 대 소비자) 컨텍스트에서 개별 고객을 나타낼 수 있습니다. 또는 여러 사용자가 있는 B2B(즉, B2B) 컨텍스트를 나타낼 수도 있습니다. 자세한 내용은 [Accounts](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts) 을 참조하세요.

Opportune Optics는 전국에서 안경 매장을 운영하고 있습니다. 각 매장은 Clarity Vision Solutions에서 안경을 구매합니다. 아래 예는 시장 중 하나를 설정 및 설명하고 계정 사용자를 할당하는 방법을 보여줍니다.

## 계정 추가

비즈니스 유형 계정을 만드세요:

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **계정** 으로 이동합니다. **계정 추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.

1. 새 창에서 계정 이름으로 'Opportune Optics NYC'를 입력합니다. **저장** 을 클릭하세요.

1. **주소** 탭을 클릭하세요. **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하세요. 다음 정보를 입력하세요.

   * 이름: `Opportune Optics NYC`
   * 국가: '미국'
   * 거리 1: '123 Anywhere St'
   * 도시: '뉴욕'
   * 지역 : '뉴욕'
   * 우편번호: `10027`

1. **Details** 탭을 다시 클릭하세요.

   * 기본 계정 주소 섹션까지 아래로 스크롤합니다.
   * 청구서 제목 아래의 **기본 주소 설정** 을 클릭하세요.
   * 방금 생성한 주소를 선택하세요.
   * **저장** 을 클릭하세요.
   * 같은 방법으로 배송지 주소도 기본 주소로 설정해주세요.

## 계정 사용자 추가

방금 만든 계정에 대한 새 사용자를 만듭니다. 계정에 대한 새 사용자를 생성하거나 기존 사용자를 계정과 연결할 수 있습니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **계정 사용자** 로 이동합니다.

   * **사용자 추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.
   * Opportune Optics NYC 옆에 있는 **선택** 을 클릭하세요.

1. 다음 매장 관리자를 만듭니다.

   * 화면 이름 : '노아'
   * 이메일 주소: `noah@opportuneoptics.com`
   * 이름: '노아'
   * 성 : '노먼'
   * 직위 : '스토어 매니저'

**저장** 을 클릭하세요.

## 계정 역할 할당

각 비즈니스 계정에는 여러 사용자와 여러 역할이 있을 수 있습니다. 예를 들어 계정 구매자는 주문 생성을 처리할 수 있지만 주문 관리자는 주문 승인을 처리할 수 있습니다.

Noah Norman에게 주문 관리자 역할을 할당합니다. 이러한 방식으로 Noah의 직원은 계정의 장바구니에 항목을 추가할 수 있으며 Noah는 최종 승인을 제공합니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **계정** 으로 이동합니다.

   * **Opportune Optics NYC** 를 클릭하세요.
   * **역할** 탭을 클릭하세요.
   * **주문 관리자** 를 클릭하세요.

1. 다음 창에서 **사용자 할당**(![아이콘 추가](../../images/icon-add.png))을 클릭하세요. Noah Norman을 선택하고 **Assign** 을 클릭합니다.

   Noah의 직원이 계정에 주문을 추가하면 Noah는 주문을 승인하고 관리할 수 있습니다. 이러한 역할에 대해 자세히 알아보려면 [상거래 역할 참조](https://learn.liferay.com/ko/w/commerce/users-and-accounts/roles-and-permissions/commerce-roles-reference) 를 참조하세요.

## 계정 관리

계정 그룹을 사용하면 여러 계정을 구성하고 관리할 수 있습니다. 예를 들어 Clarity Vision Solutions는 Opportune Optics 계정 그룹에 속한 모든 시장에 대해 더 낮은 가격을 적용하도록 선택할 수 있습니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **계정 그룹** 으로 이동합니다. **계정 그룹 추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.

1. 계정 그룹 이름에 'Opportune Optics'라는 이름을 지정합니다. **저장** 을 클릭하세요.

1. **계정** 탭을 클릭하세요.

   * **계정 할당**(![아이콘 추가](../../images/icon-add.png))을 클릭하세요.
   * 새 창에서 **Opportune Optics NYC** 를 선택하고 **Assign** 을 클릭하세요.

   이러한 방식으로 다른 사이트에 있는 다양한 Opportune Optics를 그룹에 추가할 수 있습니다.

동일한 엔터티 아래에 여러 계정이 있는 대규모 B2B 컨텍스트에서는 전용 조직을 만드는 것이 합리적일 수 있습니다. 그런 다음 전체 조직에 계정 관리자 역할을 할당할 수 있습니다. 예를 들어 사이트가 여러 개인 경우 모든 Opportune Optics 계정을 조직 아래에 배치할 수 있습니다. 그런 다음 Clarity Vision Solutions의 누군가에게 계정 관리자 역할을 할당하여 모든 계정을 감독할 수 있습니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **사용자 및 조직** 으로 이동합니다.

   * **조직** 탭을 클릭하세요.
   * **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.
   * **Name** 필드에 'Opportune Optics'를 입력합니다.
   * **저장** 을 클릭하세요.

1. **제어판** &rarr; **계정** 으로 이동합니다. **Opportune Optics NYC** 를 클릭하세요.

   * **조직** 탭을 클릭하세요.
   * **조직 할당**(![아이콘 추가](../../images/icon-add.png))을 클릭합니다.

1. 새 창에서 **Opportune Optics** 를 선택하고 **Assign** 을 클릭하세요. Opportune Optics NYC 계정은 이제 Opportune Optics 조직의 일부입니다.

   ![Opportune Optics NYC is now part of the Opportune Optics organization.](./working-with-accounts/images/01.png)

1. 이제 Lily Lewis를 계정 관리자로 지정하세요. **제어판** &rarr; **사용자 및 조직** 으로 이동합니다.

   * **Lily Lewis** 를 클릭하세요.
   * 왼쪽 탐색 메뉴에서 **조직** 을 클릭하세요.
   * **선택** 을 클릭하세요.
   * Opportune Optics 옆에 있는 **Choose** 를 클릭하세요.
   * **저장** 을 클릭하세요.

   Lily Lewis는 이제 Opportune Optics 조직의 일원이기도 합니다.

1. 왼쪽 탐색 메뉴에서 **역할** 을 클릭하세요.

   * 조직 역할 옆에 있는 **선택** 을 클릭하세요.
   * 계정 관리자 옆에 있는 **선택** 을 클릭하세요.
   * **저장** 을 클릭하세요.

   ![Lily Lewis is now an account manager for Opportune Optics.](./working-with-accounts/images/02.png)

   Lily Lewis는 이제 Opportune Optics 조직의 모든 계정에 대한 계정 관리자입니다. 계정 관리자는 계정 사용자를 대신하여 주문하는 등의 조치를 취할 수 있습니다.

축하해요! 사용자, 계정, 조직 및 권한에 대한 이 모듈을 완료했습니다.

## 관련 개념

* [Accounts](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts)
* [계정 사용자](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts/account-users)
* [계정 그룹](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts/account-groups)
* [계정 역할](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts/account-roles)
* [상거래 역할 참조](https://learn.liferay.com/en/w/commerce/users-and-accounts/roles-and-permissions/commerce-roles-reference)
