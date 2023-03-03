# 상업 창고 설정

상업 창고는 제품 재고가 보관되는 물리적 사이트를 나타냅니다. 각 창고는 여러 채널에 연결될 수 있으며 활성화할 설정된 지리적 사이트가 있어야 합니다. 이러한 지리적 사이트는 고객의 배송비를 계산할 때 Fedex 배송 방법에서 사용됩니다.

[액셀러레이터](../starting-a-store/accelerators.md) 을 사용하여 상업 사이트를 생성할 때 3개의 샘플 창고가 생성됩니다.

```{note}
상거래 창고를 설정할 때 사용자는 먼저 창고의 해당 국가 및 지역 사이트(주 또는 도)를 활성화해야 할 수 있습니다. 자세한 내용은 [지역 추가](../store-management/adding-regions.md)를 참조하세요.
```

## 창고 추가

새 창고를 추가하려면 다음 단계를 따르십시오.

1. *글로벌 메뉴* (![Global Menu](../images/icon-applications-menu.png))을 열고 *상거래* 탭을 클릭한 다음 *창고*으로 이동합니다.

1. *추가* 버튼(![Add Button](../images/icon-add.png))을 클릭합니다.

   ![추가 버튼을 클릭하여 새 창고를 생성합니다.](./setting-up-commerce-warehouses/images/01.png)

1. 새 창고에 대해 *이름* 및 *설명* (선택사항)을 입력하십시오.

1. 토글을 *활성*로 전환합니다. 창고를 활성화하려면 지리적 사이트가 필요합니다.

1. 웨어하우스와 연결된 *채널* 을 선택합니다.

   채널의 제품 재고는 연결된 창고에 의해 결정됩니다.

1. 창고 *주소*을 입력하십시오.

1. 창고의 *지리적 사이트* 을 입력합니다(활성화에 필요).

   또는 Bing Geocoder를 사용하여 창고의 지리적 위치를 자동으로 생성할 수 있습니다. 이 기능을 사용하려면 창고에 주소가 있어야 합니다. 자세한 내용은 [아래](#using-bing-geocoder-to-set-a-warehouses-geolocation) 를 참조하세요. 

1. *저장*을 클릭합니다.

창고가 활성화되면 [제품 재고 추가](./setting-inventory-by-warehouse.md)를 할 수 있습니다.

## Bing Geocoder를 사용하여 창고의 지리적 사이트 설정

Commerce는 창고 지리적 사이트를 자동으로 생성하기 위해 Bing Maps API와의 통합을 제공합니다. 이 기능을 사용하려면 [Bing 지도 계정](https://docs.microsoft.com/en-us/bingmaps/getting-started/bing-maps-dev-center-help/creating-a-bing-maps-account) 및 [Bing 지도 키](https://docs.microsoft.com/en-us/bingmaps/getting-started/bing-maps-dev-center-help/getting-a-bing-maps-key) 이 있어야 합니다.

그런 다음 다음 단계에 따라 인스턴스에 대한 Bing Geocoder를 구성합니다.

1. *글로벌 메뉴* (![Global Menu](../images/icon-applications-menu.png))을 열고 *제어판* &rarr; *시스템 설정* &rarr; *상거래* &rarr; *배송* &rarr; *Bing Geocoder*으로 이동합니다.

1. *API 키*을 입력하십시오.
   
   ![API 키를 입력하세요](./setting-up-commerce-warehouses/images/02.png)

1. *저장*을 클릭합니다.

지오코더가 구성되면 주소가 설정된 모든 창고에 대한 창고 지리적 사이트를 생성할 수 있습니다. 창고 페이지로 이동하여 원하는 창고에 대한 *작업* 버튼(![Actions Button](../images/icon-actions.png))을 클릭하고 *지리 사이트 찾기*를 선택하십시오. 지오코더는 주소를 위도 및 경도 좌표로 변환합니다.

![지리적 사이트 선택](./setting-up-commerce-warehouses/images/03.png)

## 상거래 2.1 이하

_제어판_에서 창고를 추가하려면:

1. _제어판_ → _커머스_ → _설정_로 이동합니다.
1. _창고_ 탭을 클릭합니다.
1. _창고 추가_ (![Add Icon](../images/icon-add.png)) 버튼을 클릭합니다.
1. 다음을 입력: 
      * *이름:* _창고 이름_ (예: North Vegas Warehouse)
   * *설명:* _창고 설명_ (예: North Vegas Processing Center)
1. 토글을 _활성_로 전환합니다.
1. 창고 주소를 입력하세요.
1. 채널을 선택하세요. 채널의 제품 인벤토리는 연결된 창고를 기반으로 합니다.
1. 지리적 사이트 데이터 입력(필수):
   
       * *위도*: 36.282974
    * *경도*: -115.136
      
      ![상업 창고 설정](./setting-up-commerce-warehouses/images/04.png)

1. 완료되면 _저장_ 을 클릭합니다.

이제 새 창고가 활성화되어 _배송_ 탭에서 옵션으로 사용할 수 있습니다.

## 추가 정보

* [지역 추가](../store-management/adding-regions.md)
* [청구 또는 배송 국가 비활성화](../store-management/deactivating-a-country-for-billing-or-shipping.md)
* [채널 소개](../store-management/channels/introduction-to-channels.md)
