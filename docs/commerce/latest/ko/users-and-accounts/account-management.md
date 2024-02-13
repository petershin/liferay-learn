---
toc:
- ./account-management/creating-a-new-account.md
- ./account-management/inviting-users-to-an-account.md
- ./account-management/adding-addresses-to-an-account.md
- ./account-management/account-roles.md
- ./account-management/creating-a-new-account-group.md
- ./account-management/using-organizations-to-create-a-sales-network.md
- ./account-management/adding-organizations-to-accounts.md
---
# 계정 관리

Liferay Commerce에서 계정은 청구 및 배송 주소, 주문 세부 정보 및 VAT 번호와 같은 고객 정보를 저장하는 데 사용됩니다. 계정이 생성되면 공유 기준(예: 지역)에 따라 그룹으로 분류할 수 있습니다. 이러한 계정 그룹은 특정 가격표, 판촉 및 할인이 있는 고객을 대상으로 하는 데 사용할 수 있습니다.

## 계정 유형

Commerce는 비즈니스 및 개인의 두 가지 계정 유형을 제공합니다. 각각은 서로 다른 [사이트 유형](../starting-a-store/sites-and-site-types.md) (즉, B2B 또는 B2C)에 사용됩니다.

* **비즈니스 계정** : 비즈니스 계정에는 연결된 여러 사용자가 있을 수 있습니다. 이러한 사용자는 계정을 대신하여 책임을 위임하기 위해 [계정 역할](./account-management/account-roles.md) 을 할당받을 수 있습니다. B2B 사이트에서 구매하려면 고객이 비즈니스 계정과 연결되어야 합니다.

* **개인 계정** : 개인 계정은 단일 사용자와만 연결할 수 있습니다. B2C 사이트에서 인증된 고객에게는 자동으로 개인 계정이 할당되며 개별적으로 구매할 수 있습니다.

  ```{note}
  Liferay 사용자 계정 프로필 정보는 생성 시 개인 계정으로 가져옵니다. Liferay 사용자 계정 프로필에 대한 추가 업데이트는 개인 계정에 자동으로 전파되지 않습니다.
  ```
<!-- TASK: Add the Guest Account type; also note that B2X Sites recognize both Business and Personal Accounts-->
## 일반적인 계정 관리 작업

일반적인 계정 관리 작업에 대한 자세한 내용은 다음 문서를 참조하십시오.

* [새 계정 만들기](./account-management/creating-a-new-account.md)
* [계정에 사용자 초대](./account-management/inviting-users-to-an-account.md)
* [계정에 주소 추가](./account-management/adding-addresses-to-an-account.md)
* [새 계정 그룹 만들기](./account-management/creating-a-new-account-group.md)

## 관련 주제

* [사이트 및 사이트 유형](../starting-a-store/sites-and-site-types.md)
* [계정 역할](./account-management/account-roles.md)
