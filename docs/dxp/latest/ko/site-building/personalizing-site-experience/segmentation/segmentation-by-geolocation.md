# 지리적 사이트별 세분화

{bdg-secondary}`사용 가능한 Liferay DXP 7.4 U44+/GA44+`

지리적 사이트별로 *세그먼트* 을 구성하여 다른 페이지를 동적으로 표시하거나 사용자 국가에 따라 콘텐츠를 표시할 수 있습니다. 다른 페이지를 표시하려면 [경험](../experience-personalization/content-page-personalization.md#understanding-how-experiences-work) 을 사용하고 페이지에 특정 콘텐츠를 표시하려면 [컬렉션](../experience-personalization/personalizing-collections.md)을 사용할 수 있습니다.

## 지리적 사이트로 세그먼트 생성

먼저 [사용자 세그먼트 생성](./creating-and-managing-user-segments.md#creating-user-segments) 의 단계에 따라 *사용자 세그먼트* 을 생성합니다.

1. 생성되면 *IP Geocoder Country* 세션 속성을 캔버스로 끌어다 놓습니다.

1. 비교 드롭다운에서 *은*, *는*, *는*포함, *은*과 같은 네 가지 조건 중 하나를 선택합니다.

   ![IP Geocoder 국가 세션 속성을 사용하여 지리적 사이트별로 세그먼트를 생성합니다.](./segmentation-by-geolocation/images/01.png)

1. 국가 드롭다운에서 국가를 선택합니다.

1. *저장*을 클릭합니다.

여러 속성을 조건과 결합할 수 있습니다. 조건 결합에 대한 자세한 내용은 [세그먼트 조건 구성](./creating-and-managing-user-segments.md#configuring-segment-conditions) 을 참조하십시오. 일단 생성되면 이 세그먼트를 사용하여 사용자를 위한 개인화된 경험을 생성할 수 있습니다. 자세한 내용은 [콘텐츠 페이지 개인화](../experience-personalization/content-page-personalization.md) 및 [개인화 컬렉션](../experience-personalization/personalizing-collections.md) 을 참조하십시오.

## 지리적 사이트 데이터베이스 구성

지리적 사이트 데이터베이스에는 IP 주소와 해당 국가 간의 매핑이 포함되어 있습니다. 이를 구성하려면

1. *글로벌 메뉴* (![Global Menu](../../../images/icon-applications-menu.png))을 열고 *제어판* &rarr; *시스템 설정*로 이동합니다.
1. *플랫폼* 섹션에서 *타사* 을 클릭합니다.

   ![파일 경로를 사용자 정의 지리적 사이트 데이터베이스로 설정할 수 있습니다.](./segmentation-by-geolocation/images/02.png)

1. 왼쪽 메뉴에서 *IP Geocoder Configuration* 을 클릭하여 사용자 지정 지리적 사이트 데이터베이스에 대한 경로를 설정합니다.

파일 경로는 기본적으로 비어 있습니다. 비어 있으면 무료 [GeoLite2](https://dev.maxmind.com/geoip/geolite2-free-geolocation-data?lang=en) 데이터베이스를 사용하여 IP 주소를 확인합니다. 선택적으로 서버에서 확장자가 `.mmdb` 인 다른 지리적 사이트 데이터베이스에 대한 경로를 설정하여 기본 데이터베이스를 재정의할 수 있습니다.

## 추가 정보

* [세그먼트 조건 구성](./creating-and-managing-user-segments.md#configuring-segment-conditions)
* [컨텐츠 페이지 개인화](../experience-personalization/content-page-personalization.md)
* [컬렉션 개인화](../experience-personalization/personalizing-collections.md)
