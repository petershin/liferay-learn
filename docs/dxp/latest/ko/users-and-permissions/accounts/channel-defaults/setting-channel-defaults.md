# 채널 기본값 설정

{bdg-secondary}`liferay 7.4 U49+/GA49+`

필요한 계정 관리 권한이 있는 사용자는 비즈니스 계정에 대한 채널 기본값을 설정할 수 있습니다.

<!-- Link to Channel Defaults Permission Guide when published -->

1. _전역 메뉴_( ![전역 메뉴](../../../images/icon-applications-menu.png) )를 열고 _제어판_ &rarr; _계정_으로 이동합니다.

1. 비즈니스 계정을 선택하고 _채널 기본값_ 탭으로 이동하세요.

여기서는 다음 기본값을 설정할 수 있습니다.

```{note}
개별 채널 및 기타 모든 채널에 대해 기본값을 설정하는 경우 해당하는 경우 개별 기본값이 우선적으로 적용됩니다.
```

## 기본 청구서 수신 및 배송 주소

1. 청구 주소 또는 배송 주소 아래에서 _추가_( ![추가 버튼](../../../images/icon-add.png) )를 클릭합니다.

1. _모든 채널_ 또는 개별 채널을 선택합니다.

1. 주소를 선택하세요.

1. _저장_을 클릭하세요.

   ![Set default billing and shipping addresses for all or individual channels.](./setting-channel-defaults/images/01.png)

```{note}
계정 관리 권한이 있는 사용자만 채널 기본값을 관리할 수 있습니다. 그러나 계정 사용자는 계정 세부 정보 탭을 통해 모든 채널에 대한 기본 청구 및 배송 주소를 설정할 수 있습니다.
```

## 기본 이용 약관

1. 배송약관 또는 결제약관에서 _추가_( ![추가버튼](../../../images/icon-add.png) )를 클릭하세요.

1. _모든 채널_ 또는 개별 채널을 선택합니다.

1. (선택 사항) 이용 약관에 설정된 자격을 재정의하려면 _자격 재정의_ 토글을 활성화합니다.

   ```{important}
   결제 조건은 결제 방법에 연결되고 배송 조건은 배송 옵션에 연결됩니다. 결제 방법이나 배송 옵션에 대한 적격 이용약관이 여러 개 있는 경우, 자격을 재정의하면 적격성과 관계없이 선택한 이용약관이 기본값으로 설정됩니다. 자세한 내용은 [자격 및 채널 기본값 이해](../channel-defaults.md#understanding-eligibility-and-channel-defaults) 을 참조하세요.
   ```

1. _용어_를 선택하세요.

1. _저장_을 클릭하세요.

   ![Set default terms and conditions for all or individual channels.](./setting-channel-defaults/images/02.png)

## 기본 배송 옵션

기본 배송 값은 채널의 기존 우선순위 설정에 따라 결정됩니다. 다른 배송 옵션을 사용할 수 있는 경우 해당 옵션 중 하나를 기본값으로 선택할 수 있습니다.

1. _배송 옵션_으로 이동하여 원하는 채널에 대해 _수정_을 클릭하세요.

1. 배송 옵션을 선택하세요.

1. _저장_을 클릭하세요.

   ![Set a default shipping option for individual channels.](./setting-channel-defaults/images/03.png)

## 기본 가격표 및 할인

1. 가격 목록 또는 할인 아래에서 _추가_( ![추가 버튼](../../../images/icon-add.png) )를 클릭합니다.

1. _모든 채널_ 또는 개별 채널을 선택합니다.

1. (선택 사항) 가격 목록에 대해 구성된 기존 자격 기준을 재정의하려면 _자격 재정의_ 토글을 활성화합니다.

1. _가격표_ 또는 _할인_을 선택하세요.

1. _저장_을 클릭하세요.

   ![Set a default price list or discount for all or individual channels.](./setting-channel-defaults/images/04.png)

## 기본 통화

1. 통화 아래에서 _추가_( ![추가 버튼](../../../images/icon-add.png) )를 클릭합니다.

1. _모든 채널_ 또는 개별 채널을 선택합니다.

1. _통화_를 선택하세요.

   ```{important}
   이는 탐색 중에만 계정의 기본 채널 통화를 설정합니다. 제품 페이지와 카탈로그는 여기에 설정된 통화를 사용합니다. 채널 생성 시 설정된 통화는 수정되지 않습니다.
   ```

1. _저장_을 클릭하세요.

   ![Set a default currency for all or individual channels.](./setting-channel-defaults/images/05.png)

## 기본 결제 방법

기본 결제 방법은 채널의 기존 우선순위 설정에 따라 결정됩니다. 다른 결제 방법을 사용할 수 있는 경우 해당 방법 중 하나를 기본값으로 선택할 수 있습니다.

1. _결제 수단_으로 이동하여 원하는 채널에 대해 _수정_을 클릭하세요.

1. 결제 방법을 선택.

1. _저장_을 클릭하세요.

   ![Set a default payment method for individual channels.](./setting-channel-defaults/images/06.png)

## 기본 채널 계정 관리자

1. 채널 계정 관리자 아래에서 _추가_( ![추가 버튼](../../../images/icon-add.png) )를 클릭합니다.

1. _모든 채널_ 또는 개별 채널을 선택합니다.

   ```{tip}
   동일한 채널에 여러 채널 계정 관리자를 할당할 수 있습니다.
   ```

1. 사용자를 선택하세요.

   '계정 > 계정 항목: 사용자 채널 관계를 통해 사용 가능한 계정 관리' 권한이 있는 일반 역할을 가진 모든 사용자가 채널 계정 관리자 드롭다운에 표시됩니다. 자세한 내용은 [채널 계정 관리자 이해](#understanding-channel-account-managers) 참조하십시오.

1. _저장_을 클릭하세요.

   ![Select default channel account manager for all or individual channels.](./setting-channel-defaults/images/07.png)

### 채널 계정 관리자 이해

기본 채널 계정 관리자를 선택하면 '계정 > 계정 항목: 사용자 채널 관계를 통해 사용 가능한 계정 관리' 권한이 있는 일반 역할의 사용자만 나타납니다. 이 권한을 사용하면 사용자에게 계정 구성원이나 조직 계정 관리자가 아니더라도 계정에 대한 액세스 권한을 부여할 수 있습니다.

![Users with this permission appear in the channel account manager dropdown menu.](./setting-channel-defaults/images/08.png)

이 권한 자체로는 계정 애플리케이션에 대한 액세스 권한을 부여하거나 개별 계정을 보고 업데이트할 수 있는 권한을 부여하지 않습니다. 또한 가격 목록 및 기타 상거래 엔터티에 대한 주문 관리 또는 채널 기본값 설정을 허용하지 않습니다. 채널 계정 관리자가 이러한 관리 작업을 수행하도록 하려면 각 애플리케이션(예: 계정, 주문, 가격표)에 필요한 권한을 부여해야 합니다. 자세한 내용은 [채널 기본 권한 참조](./channel-defaults-permissions-reference.md) 을 참조하세요.

```{note}
 [조직](../../organizations/understanding-organizations.md) 사용하는 경우 사용자는 자신이 기본 채널 계정 관리자인 계정과 함께 관리 권한이 있는 조직 계정을 계속 관리할 수 있습니다.
```

## 관련 주제

* [채널 기본값](../channel-defaults.md)
* [채널 기본값 권한 참조](./channel-defaults-permissions-reference.md)
* [채널 소개](https://learn.liferay.com/web/guest/w/commerce/store-management/channels/introduction-to-channels)
