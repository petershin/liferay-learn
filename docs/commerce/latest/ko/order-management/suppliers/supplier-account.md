# 공급업체 계정

{bdg-secondary}`liferay DXP 7.4 U84+/GA84+`

_공급업체_ 계정 유형에는 Liferay 계정의 모든 기능(주소, 사용자, 조직, 계정 그룹 및 역할 추가 및 관리)이 있습니다. 또한 공급업체와 고객을 명확하게 구분합니다. 새 계정을 생성할 때 유형 드롭다운에서 _공급업체_ 옵션을 선택하세요. 새 계정 생성에 대한 자세한 내용은 [계정](https://learn.liferay.com/w/dxp/users-and-permissions/accounts) 을 참조하세요.

다른 계정 유형과 달리 공급업체 계정을 채널 및 카탈로그에 연결할 수 있습니다. 이는 공급자 역할과 함께 사용될 수 있습니다. 채널과 카탈로그를 모두 공급업체 계정에 연결하면 공급업체가 자신의 주문과 제품 카탈로그를 관리할 수 있습니다.

## 채널을 공급업체 계정에 연결

1. _글로벌 메뉴_(![글로벌 메뉴](../../images/icon-applications-menu.png))를 열고 _커머스_ &rarr; _채널_로 이동합니다.

1. 채널을 선택하세요.

1. 세부정보 카드 내에서 _공급업체에 채널 연결_ 드롭다운을 사용하여 공급업체 계정을 선택합니다.

   ![Choose a supplier account from the dropdown to link to the channel.](./supplier-account/images/01.png)

1. _저장_을 클릭하세요.

## 공급자 계정에 카탈로그 연결

1. _글로벌 메뉴_(![글로벌 메뉴](../../images/icon-applications-menu.png))를 열고 _Commerce_ &rarr; _카탈로그_로 이동합니다.

1. 공급업체 카탈로그를 이미 생성한 경우 기존 카탈로그를 선택하거나 _추가_(![추가](../../images/icon-add.png))를 클릭하여 새 카탈로그를 생성합니다.

1. 카탈로그를 선택한 후 _공급업체에 채널 연결_ 드롭다운을 사용하여 공급업체 계정을 선택합니다.

   ![Choose a supplier account from the dropdown to link to the catalog.](./supplier-account/images/02.png)

1. _저장_을 클릭하세요.

```{note}
*공급자* 역할을 가진 사용자는 자신의 카탈로그를 생성할 수 있습니다. 공급업체로서 새 카탈로그를 생성할 때 공급업체 계정을 선택하는 드롭다운이 생성 당시에 제공됩니다. 공급업체가 계정을 올바르게 연결하지 않으면 카탈로그가 생성되지 않습니다.

공급업체는 카탈로그나 채널에 연결된 공급업체 계정을 변경하거나 자체 채널을 생성할 수 없습니다. 이는 관리자에게만 가능합니다.
```

## 관련 주제

* [공급업체](../../users-and-accounts/roles-and-permissions/commerce-roles-reference.md#supplier) 
* [계정 공급자](../../users-and-accounts/roles-and-permissions/commerce-roles-reference.md#account-supplier) 
* [공급업체 역할](./supplier-role.md) 
