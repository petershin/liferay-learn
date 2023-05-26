# 창고 설정

창고는 제품 재고를 보관하는 물리적 사이트를 나타냅니다. 창고를 활성화하려면 지리적 사이트를 설정해야 합니다. Fedex 배송 방법은 이 지리적 사이트를 사용하여 배송비를 계산합니다. 자세한 내용은 [Fedex 배송 방법 사용](../store-management/configuring-shipping-methods/using-the-fedex-shipping-method.md) 참조하십시오.

단일 웨어하우스를 사용하여 여러 채널을 제공하거나 여러 웨어하우스가 있는 단일 채널을 제공할 수 있습니다. **Miniium** 또는 **Speedwell** 액셀러레이터를 사용하는 경우 3개의 샘플 웨어하우스가 하나의 채널에 서비스를 제공합니다.

```{note}
창고를 생성하기 전에 창고의 해당 국가 및 지역을 활성화해야 합니다. 자세한 내용은 [지역 추가](../store-management/configuring-countries-and-regions.md#adding-regions) 를 참조하세요.
```

## 창고 추가

1. **글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **상거래** &rarr; **창고** 로 이동합니다.

1. **추가**(![Add Button](../images/icon-add.png))을 클릭합니다.

   ![추가 버튼을 클릭하여 새 창고를 생성합니다.](./setting-up-warehouses/images/01.png)

1. 이름을 입력하세요.

1. **제출** 클릭합니다.

   이렇게 하면 새 비활성 창고가 생성되고 세부 정보 탭이 열립니다.

   ![새 창고에 대한 세부 정보를 입력하고 활성화합니다.](./setting-up-warehouses/images/02.png)

1. (선택 사항) 이름과 설명을 수정하거나 현지화합니다.

1. Geolocation 섹션에 창고의 위도 및 경도 값을 입력합니다.

   또는 창고 주소를 기반으로 창고의 지리적 사이트를 자동으로 생성하도록 [Bing Geocoder](#using-bing-geocoder-to-set-a-warehouses-geolocation) 을 구성할 수 있습니다.

1. 주소 섹션에 창고 주소를 입력합니다.

1. 토글을 **활성** 로 전환합니다.

   ```{important}
   창고를 활성화하려면 지리적 사이트를 설정해야 합니다.
   ```

1. 창고를 하나 이상의 채널에 연결하십시오. 이는 해당 채널의 제품 인벤토리를 결정합니다.

   **자격** 탭을 클릭하고 **특정 채널** 선택한 다음 채널 이름을 입력하고 **선택** 클릭합니다.

   ![웨어하우스를 사용 가능한 모든 채널 또는 특정 채널에 연결합니다.](./setting-up-warehouses/images/03.png)

1. **저장** 클릭합니다.

## Bing Geocoder를 사용하여 창고의 지리적 사이트 설정

Liferay는 Bing Maps API와 통합되어 창고 주소에서 지리적 사이트를 자동으로 생성합니다. 이 기능을 사용하려면 [Bing 지도 계정](https://docs.microsoft.com/en-us/bingmaps/getting-started/bing-maps-dev-center-help/creating-a-bing-maps-account) 및 [Bing 지도 키](https://docs.microsoft.com/en-us/bingmaps/getting-started/bing-maps-dev-center-help/getting-a-bing-maps-key) 있어야 합니다.

그런 다음 다음 단계에 따라 인스턴스에 대한 Bing Geocoder를 구성합니다.

1. **글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **제어판** &rarr; **시스템 설정** &rarr; **상거래** &rarr; **배송** &rarr; **Bing Geocoder** 으로 이동합니다.

1. **API 키** 을 입력하십시오.

   ![Bing Maps API용 API 키를 입력합니다.](./setting-up-warehouses/images/04.png)

1. **저장** 클릭합니다.

지오코더가 구성되면 주소가 있는 모든 창고에 대한 창고 지리적 사이트를 생성할 수 있습니다. 창고 페이지로 이동하여 원하는 창고에 대해 **작업** 버튼(![Actions Button](../images/icon-actions.png))을 클릭하고 **지리적 사이트 찾기** 선택합니다. 지오코더는 주소를 위도 및 경도 좌표로 변환합니다.

![원하는 창고에 대한 작업 버튼을 클릭하고 지리적 사이트 찾기를 선택합니다.](./setting-up-warehouses/images/05.png)

## Liferay 7.4 U46/GA46 이하

1. **글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **상거래** &rarr; **창고** 로 이동합니다.

1. **추가**(![Add Button](../images/icon-add.png))을 클릭합니다.

   ![추가 버튼을 클릭하여 새 창고를 생성합니다.](./setting-up-warehouses/images/06.png)

1. 세부 정보 섹션에서 **이름** 및 **설명**(선택 사항)을 입력합니다.

   ![새 창고에 대한 세부 정보를 입력하고 활성화합니다.](./setting-up-warehouses/images/07.png)

1. 창고를 활성화하려면 토글을 **활성** 로 전환하십시오. 활성화하기 전에 지리적 사이트를 입력해야 합니다.

1. 채널 섹션에서 확인란을 사용하여 웨어하우스를 채널에 연결합니다. 연결된 창고는 채널의 제품 재고를 결정합니다.

1. **주소** 섹션에 창고 주소를 입력합니다.

1. **Geolocation** 섹션에 창고의 위도 및 경도 값을 입력합니다.

   또는 창고의 지리 사이트를 자동으로 생성하는 방법을 알아보려면 [Bing Geocoder를 사용하여 창고의 지리 사이트 설정](#using-bing-geocoder-to-set-a-warehouses-geolocation) 참조하십시오.

1. **저장** 클릭합니다.

## 상거래 2.1 이하

새 창고를 추가하려면

1. **제어판** &rarr; **상거래** &rarr; **설정** 로 이동합니다.

1. **창고** 탭을 클릭합니다.

1. **추가**(![Add Icon](../images/icon-add.png))을 클릭하고 다음 정보를 입력합니다.

   * **이름:** 노스 베가스 창고
   * **설명:** North Vegas Processing Center

1. 토글을 **활성** 로 전환합니다.

1. 주소에 들어가십시요.

1. 채널을 선택하세요. 채널의 제품 재고는 연결된 창고에 따라 다릅니다.

1. 창고 사이트에 따라 필수 지리적 사이트 데이터를 입력합니다.

   * **위도** : 36.282974
   * **경도** : -115.136

    ![새로 생성된 웨어하우스를 구성합니다.](./setting-up-warehouses/images/08.png)

1. 완료되면 **저장** 클릭합니다.

이제 새 창고가 활성화되어 사용할 준비가 되었습니다.

## 관련 주제

* [지역 추가](../store-management/configuring-countries-and-regions.md#adding-regions)
* [국가 및 지역 구성](../store-management/configuring-countries-and-regions.md)
* [채널 소개](../store-management/channels/introduction-to-channels.md)
