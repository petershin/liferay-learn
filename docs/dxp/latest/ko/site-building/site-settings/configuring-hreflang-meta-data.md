# Hreflang 메타 데이터 구성

Hreflang 태그는 사이트 페이지의 대체 버전이 대상으로 하는 언어 및 지역을 식별하는 데 사용되는 HTML 속성입니다. 경우에 따라 이러한 속성은 검색 엔진이 사용자에게 페이지의 올바른 버전을 제공하고 SEO에 기여하는 데 도움이 될 수 있습니다. 기본적으로 Liferay DXP는 페이지 hreflang 메타 데이터를 사이트에서 사용 가능한 모든 언어로 채웁니다.

Liferay 7.4+ DXP/Portal부터 페이지에서 번역된 콘텐츠가 있는 언어에 대한 hreflang 메타 데이터만 생성하도록 이 동작을 구성할 수 있습니다. 이는 인스턴스 및 사이트 레벨 [모두에서 구성될 수](../../system-administration/configuring-liferay/understanding-configuration-scope.md).

hreflangs가 이러한 방식으로 제한되면 Liferay의 동작은 페이지 유형에 따라 달라질 수 있습니다.

***위젯 페이지** : 위젯 페이지의 이름을 번역하는 데 사용되는 언어가 hreflang 태그에 추가됩니다.

***콘텐츠 페이지** / **디스플레이 페이지 템플릿** : 페이지 조각을 번역하는 데 사용되는 언어가 hreflang 태그에 추가됩니다.

## 인스턴스 설정

Liferay 인스턴스에 대한 hreflang 동작을 구성하려면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../images/icon-applications-menu.png))을 열고 **제어판** 탭을 클릭한 다음 **인스턴스 설정** &rarr; **페이지** &rarr; **SEO**(가상 인스턴스 범위)로 이동합니다.

1. 선택/선택 취소 **번역된 Hreflang만 활성화** .

   ![모든 인스턴스 페이지에 대해 hreflang 동작을 활성화하거나 비활성화합니다.](./configuring-hreflang-meta-data/images/01.png)

1. **저장** 을 클릭합니다.

활성화되면 hreflang 메타 데이터는 페이지에서 번역된 콘텐츠가 있는 언어에 대해서만 생성됩니다. 비활성화되면 Page hreflang 태그가 사이트에서 사용 가능한 모든 언어로 채워집니다.

## 인스턴스 사이트 범위 설정

사이트 범위를 사용하여 인스턴스의 모든 사이트에 대한 hreflang 동작을 구성하려면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../images/icon-applications-menu.png))을 열고 **제어판** 탭을 클릭한 다음 **인스턴스 설정** &rarr; **페이지** &rarr; **SEO**(사이트 범위)로 이동합니다.

1. 선택/선택 취소 **번역된 Hreflang만 활성화** .

   ![모든 사이트에 대해 hreflang 동작을 활성화하거나 비활성화합니다.](./configuring-hreflang-meta-data/images/02.png)

1. **저장** 을 클릭합니다.

활성화되면 hreflang 메타 데이터는 페이지에서 번역된 콘텐츠가 있는 언어에 대해서만 생성됩니다. 비활성화되면 Page hreflang 태그가 사이트에서 사용 가능한 모든 언어로 채워집니다.

```{note}
기본적으로 사이트 범위 인스턴스 설정은 모든 인스턴스 사이트에 적용됩니다. 그러나 [개별 사이트 구성](#individual-site-settings) 은 전역 메뉴의 구성을 재정의합니다. 기본 동작을 복원하고 두 메뉴 간의 변경 사항을 동기화하려면 개별 사이트의 설정을 기본값으로 복원해야 합니다. 
```

## 개별 사이트 설정

개별 사이트에 대한 hreflang 설정을 구성하려면 다음 단계를 따르십시오.

1. 원하는 **사이트** 로 이동합니다.

1. **사이트 메뉴**(![Site Menu](../../images/icon-product-menu.png))을 열고 **구성** 를 확장한 다음 **사이트 설정** &rarr; **페이지** &rarr; **SEO** 로 이동합니다.

1. 선택/선택 취소 **번역된 Hreflang만 활성화** .

   이 구성은 현재 사이트의 페이지에만 영향을 미칩니다.

   ![사이트 페이지에 대한 hreflang 동작을 활성화하거나 비활성화합니다.](./configuring-hreflang-meta-data/images/03.png)

1. **저장** 을 클릭합니다.

활성화되면 hreflang 메타 데이터는 페이지에서 번역된 콘텐츠가 있는 언어에 대해서만 생성됩니다. 이 구성은 현재 사이트의 모든 페이지에 영향을 미치며 인스턴스 구성 설정을 재정의합니다.

```{note}
기본적으로 개별 사이트 설정은 [사이트 범위 인스턴스 설정](#instance-site-scope-settings) 에서 상속됩니다. 그러나 개별 사이트 구성은 이 동작을 재정의합니다. 기본 동작을 복원하고 두 메뉴 간의 변경 사항을 동기화하려면 개별 사이트의 설정을 기본값으로 복원해야 합니다. 
```

## 관련 주제

* [사이트 현지화](./site-localization.md)
* [번역 내보내기 및 가져오기](../../content-authoring-and-management/translating-pages-and-content.md)
