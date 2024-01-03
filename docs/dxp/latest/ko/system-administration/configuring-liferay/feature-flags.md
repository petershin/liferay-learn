# 베타 기능 및 기능 플래그

## 기능 플래그

{bdg-secondary}`DXP 7.4 U69+/GA69+`

Liferay의 일부 기능은 _기능 플래그_ 뒤에 숨겨져 있습니다. 기능 플래그를 사용하면 Liferay 인스턴스에 도입된 새로운 기능을 제어할 수 있습니다. 기능 플래그를 사용하면 새롭고 실험적인 기능을 보다 효과적으로 채택하고 검증할 수 있습니다.

기능 플래그에 액세스하고 관리하려면 _전역 메뉴_(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 _제어판_ &rarr; _인스턴스 설정_으로 이동합니다. _플랫폼_ 아래에서 _기능 플래그_를 클릭하세요. 사용 가능한 기능 플래그에는 세 가지 유형이 있습니다.

1. [베타 기능 플래그](#beta-feature-flags) 

1. [릴리스 기능 플래그](#release-feature-flags) 

1. [개발 기능 플래그](#dev-feature-flags) 

![You can use feature flags to control the visibility of features.](./feature-flags/images/01.png)

<!--  Add image for badge used to denote beta features in product
Liferay DXP uses a badge to highlight beta features. See below: -->

베타 기능에 대한 문서에는 이를 구별하는 배지가 포함되어 있습니다.

![The documentation for a beta feature includes a badge.](./feature-flags/images/02.png)

## 베타 기능 플래그

베타 기능은 비즈니스 검증을 거치는 기능적 특징 또는 능력입니다. 이는 실험적이므로 사용하기 전에 신중한 고려가 필요합니다. 베타 기능은 제한된 기간이 지나면 더 이상 사용되지 않거나 [릴리스 기능](#release-feature-flags) 으로 변환될 수 있습니다. Liferay의 [Community Slack](https://liferay.dev/chat) 을 통해 베타 기능에 대한 피드백을 제공할 수 있습니다.

베타 기능을 활성화하려면,

1. _전역 메뉴_(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 _제어판_ &rarr; _인스턴스 설정_으로 이동합니다.

1. 플랫폼 아래에서 _기능 플래그_를 클릭한 다음 _베타_를 클릭하세요.

1. 모든 베타 기능이 나타납니다. 기능을 활성화 또는 비활성화하려면 전환하세요.

검색창을 사용하여 베타 기능을 찾고, 정렬(![정렬](../../images/icon-sort2.png)) 버튼을 사용하여 정렬하거나, 상태에 따라 필터링할 수도 있습니다.

![You can search, sort, or filter beta features.](./feature-flags/images/03.png)

## 릴리스 기능 플래그

릴리스 기능은 완벽하게 작동하지만 제한된 시간 동안 플래그 뒤에 숨겨져 있습니다. 플래그를 사용하면 새 기능의 가시성을 제어하고 준비가 되면 활성화할 수 있습니다.

릴리스 기능을 활성화하려면,

1. _전역 메뉴_(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 _제어판_ &rarr; _인스턴스 설정_으로 이동합니다.

1. 플랫폼 아래에서 _기능 플래그_를 클릭한 다음 _릴리스_를 클릭하세요.

1. 모든 릴리스 기능이 나열됩니다. 기능을 활성화 또는 비활성화하려면 전환하세요.

검색 창을 사용하여 릴리스 기능을 찾고, 정렬(![정렬](../../images/icon-sort2.png)) 버튼을 사용하여 정렬하거나, 상태에 따라 필터링할 수도 있습니다. 릴리스 기능에 대한 플래그는 일정 시간이 지나면 제거되므로 Liferay 업데이트에 대한 릴리스 노트를 모니터링하십시오.

![You can search, sort, or filter release features.](./feature-flags/images/04.png)

## 개발 기능 플래그

Dev 기능 플래그는 활성 개발 중인 기능을 위한 것이므로 프로덕션에서는 활성화하면 안 됩니다. 테스트용으로만 개발 기능을 활성화하세요.

포털 속성을 사용하여 'XXX-000000' 코드로 이론적 개발 기능 플래그를 활성화하려면 다음을 'portal-ext.properties'에 추가하세요.

```
feature.flag.XXX-000000=true
```

환경 변수를 사용하여 'XXX-000000' 코드로 이론적인 개발 기능 플래그를 활성화하려면 다음을 구성에 추가하세요.

```
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEX__UPPERCASEX__UPPERCASEX__MINUS__NUMBER0__NUMBER0__NUMBER0__NUMBER0__NUMBER0__NUMBER0_=true
```

```{warning}
프로덕션 환경에서는 개발 기능을 절대 사용하지 마세요. Liferay의 불안정성은 개발 기능 플래그를 활성화하면 예상되는 부작용입니다. 
```

## 즉시 사용 가능한 베타 기능

{bdg-secondary}`liferay 2023.Q4+/GA102+`

위에서 설명한 대로 베타 기능은 실험적이므로 사용하기 전에 신중한 고려가 필요합니다. 베타 기능은 제한된 기간이 지나면 더 이상 사용되지 않거나 [릴리스 기능](#release-feature-flags) 으로 변환될 수 있습니다. Liferay의 [Community Slack](https://liferay.dev/chat) 을 통해 베타 기능에 대한 피드백을 제공할 수 있습니다.

일부 베타 기능은 [베타 기능 플래그](#beta-feature-flags) 뒤에 추가됩니다.

Liferay 2023.Q4부터 일부 베타 기능은 기본적으로 활성화되지만 베타 상태를 강조하기 위해 UI에 태그가 표시됩니다(![Beta](../../images/icon- 베타 기능.png)).

![Some beta features are included out-of-the-box, clearly marked in the UI.](./feature-flags/images/05.png)

## 관련 주제

* [의미 검색](../../using-search/liferay-enterprise-search/search-experiences/semantic-search.md)
* [베타 기능](https://help.liferay.com/hc/en-us/articles/12917247551757-Beta-Features)
