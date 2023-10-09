# 계정 작업

Liferay의 계정은 B2C(즉, 기업 대 소비자) 컨텍스트에서 개별 고객을 나타낼 수 있습니다. 또는 여러 사용자가 있는 B2B(즉, B2B) 컨텍스트를 나타낼 수도 있습니다. 자세한 내용은 [개 계정](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts) 참조하세요.

마블러스마켓은 전국에 걸쳐 슈퍼마켓을 운영하고 있습니다. 각 매장에서는 맛있는 분재(Delectable Bonsai)에서 메이플 시럽을 구매합니다. 아래 예는 시장 중 하나를 설정 및 설명하고 계정 사용자를 할당하는 방법을 보여줍니다.

## 계정 추가

비즈니스 유형 계정을 만드세요:

1. _글로벌 메뉴로 이동합니다._ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _계정_. _계정 추가_ (![Add icon](../../images/icon-add.png))을 클릭하세요.

1. 새 창에서 계정 이름으로 `Marvelous Markets NYC` 입력합니다. _저장_클릭하세요.

1. _주소_ 탭을 클릭합니다. _추가_ (![Add icon](../../images/icon-add.png))을 클릭합니다. 다음 정보를 입력하세요.

   * 이름: `Marvelous Markets NYC`
   * 국가: `미국`
   * 거리 1: `123 어디서나 St`
   * 도시: `뉴욕`
   * 지역: `뉴욕`
   * 우편번호: `10027`

1. _Details_ 탭을 다시 클릭하세요.

   - 기본 계정 주소 섹션까지 아래로 스크롤합니다.
   - 청구서 제목 아래에서 _기본 주소 설정_ 클릭하세요.
   - 방금 생성한 주소를 선택하세요.
   - _저장_클릭하세요.
   - 같은 방법으로 배송지 주소도 기본 주소로 설정하세요.

## 계정 사용자 추가

방금 만든 계정에 대한 새 사용자를 만듭니다. 참고로, 계정에 대한 새 사용자를 생성하거나 기존 사용자를 계정과 연결할 수 있습니다.

1. _글로벌 메뉴로 이동_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _계정 사용자_.

   - _사용자 추가_ (![Add icon](../../images/icon-add.png))을 클릭합니다.
   - _클릭하세요. Marvelous Markets NYC 옆에 있는_ 선택하세요.

1. 다음 매장 관리자를 만듭니다.

   * 화면 이름 : `노아`
   * 이메일 주소: `noah@marvelousmarkets.com`
   * 이름: `노아`
   * 성: `노먼`
   * 직위 : `점장`

   _저장_클릭하세요.

## 계정 역할 할당

각 비즈니스 계정에는 여러 사용자와 여러 역할이 있을 수 있습니다. 예를 들어 계정 구매자는 주문 생성을 처리할 수 있지만 주문 관리자는 주문 승인을 처리할 수 있습니다.

Noah Norman에게 주문 관리자 역할을 할당합니다. 이러한 방식으로 Noah의 직원은 계정의 장바구니에 항목을 추가할 수 있으며 Noah는 최종 승인을 제공합니다.

1. _글로벌 메뉴로 이동합니다._ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _계정_.

   - _Marvelous Markets NYC_을 클릭하세요.
   - _역할_ 탭을 클릭합니다.
   - _주문 관리자_클릭하세요.

2. 다음 창에서 _사용자_ 할당(![Add icon](../../images/icon-add.png))을 클릭합니다. Noah Norman을 선택하고 _Assign_클릭합니다.

   Noah의 직원이 계정에 주문을 추가하면 Noah는 주문을 승인하고 관리할 수 있습니다. 이러한 역할에 대해 자세히 알아보려면 [상거래 역할 참조](https://learn.liferay.com/en/w/commerce/users-and-accounts/roles-and-permissions/commerce-roles-reference) 을 참조하세요.

## 계정 관리

계정 그룹을 사용하면 여러 계정을 구성하고 관리할 수 있습니다. 예를 들어, Delectable Bonsai는 Marvelous Markets 계정 그룹에 속한 모든 시장에 대해 더 낮은 가격을 적용하도록 선택할 수 있습니다.

1. _글로벌 메뉴로 이동_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _계정 그룹_. _계정 그룹 추가_ (![Add icon](../../images/icon-add.png))을 클릭합니다.

2. 계정 그룹 이름으로 `Marvelous Markets` 이라는 이름을 지정합니다. _저장_클릭하세요.

3. _계정_ 탭을 클릭하세요.

   - _계정_ 할당(![Add icon](../../images/icon-add.png))을 클릭합니다.
   - 새 창에서 _Marvelous Markets NYC_ 선택하고 _Assign_클릭합니다.

   이러한 방식으로 다른 사이트의 다양한 Marvelous 시장을 그룹에 추가할 수 있습니다.

동일한 엔터티 아래에 여러 계정이 있는 대규모 B2B 컨텍스트에서는 전용 조직을 만드는 것이 합리적일 수 있습니다. 그런 다음 전체 조직에 계정 관리자 역할을 할당할 수 있습니다. 예를 들어, 여러 사이트에서 모든 Marvelous Market 계정을 조직에 배치할 수 있습니다. 그런 다음 Delectable Bonsai의 누군가에게 계정 관리자 역할을 할당하여 모든 계정을 감독할 수 있습니다.

1. _글로벌 메뉴로 이동_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _사용자 및 조직_.

   * _조직_ 탭을 클릭합니다.
   * __ 추가(![Add icon](../../images/icon-add.png))를 클릭합니다.
   * _이름_ 필드에 `Marvelous Markets` 입력합니다.
   * _저장_클릭하세요.

1. _제어판_ &rarr; _계정_로 이동합니다. _Marvelous Markets NYC_을 클릭하세요.

   * _조직_ 탭을 클릭합니다.
   * _조직 할당_ (![Add icon](../../images/icon-add.png))을 클릭합니다.

1. 새 창에서 _Marvelous Markets_ 선택하고 _Assign_클릭합니다. Marvelous Markets NYC 계정은 이제 Marvelous Markets 조직의 일부가 되었습니다.

   ![Marvelous Markets NYC는 이제 Marvelous Markets 조직의 일부입니다.](./working-with-accounts/images/01.png)

1. 이제 Lily Lewis를 계정 관리자로 지정하세요. _제어판_ &rarr; _사용자 및 조직_로 이동합니다.

   * _Lily Lewis_을 클릭하세요.
   * 왼쪽 탐색에서 _조직_ 클릭합니다.
   * _클릭하고_선택합니다.
   * _클릭하세요. Marvelous Markets 옆에 있는_ 선택하세요.
   * _저장_클릭하세요.

   Lily Lewis는 이제 Marvelous Markets 조직의 일원이기도 합니다.

5. 왼쪽 탐색에서 _역할_ 클릭합니다.

   * 조직 역할 옆에 있는 _선택_ 클릭합니다.
   * _클릭하세요. 계정 관리자 옆에 있는_ 선택하세요.
   * _저장_클릭하세요.

   ![Lily Lewis는 현재 Marvelous Markets의 계정 관리자입니다.](./working-with-accounts/images/02.png)

   Lily Lewis는 이제 Marvelous Markets 조직의 모든 계정에 대한 계정 관리자입니다. 계정 관리자는 계정 사용자를 대신하여 주문하는 등의 조치를 취할 수 있습니다.

축하해요! 사용자, 계정, 조직 및 권한에 대한 이 모듈을 완료했습니다.

## 관련 개념

- [계정](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts)
- [계정 사용자](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts/account-users)
- [계정 그룹](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts/account-groups)
- [계정 역할](https://learn.liferay.com/en/w/dxp/users-and-permissions/accounts/account-roles)
- [상거래 역할 참조](https://learn.liferay.com/en/w/commerce/users-and-accounts/roles-and-permissions/commerce-roles-reference)
