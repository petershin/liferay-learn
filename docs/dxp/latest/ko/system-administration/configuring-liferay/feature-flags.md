# 기능 플래그

{bdg-secondary}`DXP 7.4 U69+/GA69+`

Liferay의 일부 기능은 *기능 플래그*뒤에 숨겨져 있습니다. 기능 플래그를 사용하면 Liferay 인스턴스에 도입된 새로운 기능을 제어할 수 있습니다. 새로운 실험적 기능은 기능 플래그를 사용하여 보다 효과적으로 채택하고 검증할 수 있습니다.

기능 플래그에 액세스하고 관리하려면 *전역 메뉴* (![Global Menu](../../images/icon-applications-menu.png))을 열고 *제어판* &rarr; *인스턴스 설정*으로 이동합니다. *플랫폼*아래에서 *기능 플래그* 클릭하십시오. 세 가지 유형의 기능 플래그를 사용할 수 있습니다.

1. [베타 기능 플래그](#beta-feature-flags)

1. [릴리스 기능 플래그](#release-feature-flags)

1. [개발 기능 플래그](#dev-feature-flags).

![기능 플래그를 사용하여 기능의 가시성을 제어할 수 있습니다.](./feature-flags/images/01.png)

<!--  Add image for badge used to denote beta features in product
Liferay DXP uses a badge to highlight beta features. See below: -->

베타 기능에 대한 설명서에는 기능을 구분하는 배지가 포함되어 있습니다.

![베타 기능에 대한 설명서에는 배지가 포함되어 있습니다.](./feature-flags/images/02.png)

## 베타 기능 플래그

베타 기능은 비즈니스 검증을 진행 중인 기능적 기능입니다. 이들은 실험적이며 사용하기 전에 신중한 고려가 필요합니다. 베타 기능은 제한된 기간 후에 더 이상 사용되지 않거나 [릴리스 기능](#release-feature-flags)로 변환될 수 있습니다. Liferay의 [Community Slack](https://liferay.dev/chat)을 통해 베타 기능에 대한 피드백을 제공할 수 있습니다.

베타 기능을 활성화하려면

1. *전역 메뉴* (![Global Menu](../../images/icon-applications-menu.png))을 열고 *제어판* &rarr; *인스턴스 설정*로 이동합니다.

1. 플랫폼에서 *기능 플래그* 클릭한 다음 *베타*클릭합니다.

1. 모든 베타 기능이 나타납니다. 기능을 활성화 또는 비활성화하려면 토글합니다.

또한 검색 표시줄을 사용하여 베타 기능을 찾거나 정렬(![Sort](../../images/icon-sort2.png)) 버튼을 사용하여 정렬하거나 상태에 따라 필터링할 수 있습니다.

![베타 기능을 검색, 정렬 또는 필터링할 수 있습니다.](./feature-flags/images/03.png)

## 릴리스 기능 플래그

릴리스 기능은 완전히 작동하지만 제한된 시간 동안 플래그 뒤에 숨겨져 있습니다. 플래그를 사용하면 새 기능의 가시성을 제어하고 준비가 되면 활성화할 수 있습니다.

릴리스 기능을 활성화하려면

1. *전역 메뉴* (![Global Menu](../../images/icon-applications-menu.png))을 열고 *제어판* &rarr; *인스턴스 설정*로 이동합니다.

1. 플랫폼 아래에서 *기능 플래그* 클릭한 다음 *릴리스*클릭하십시오.

1. 모든 릴리스 기능이 나열됩니다. 기능을 활성화 또는 비활성화하려면 토글합니다.

또한 검색 표시줄을 사용하여 릴리스 기능을 찾거나 정렬(![Sort](../../images/icon-sort2.png)) 버튼을 사용하여 정렬하거나 상태에 따라 필터링할 수 있습니다. 릴리스 기능에 대한 플래그는 일정 시간이 지나면 제거되므로 Liferay 업데이트에 대한 릴리스 정보를 모니터링하십시오.

![릴리스 기능을 검색, 정렬 또는 필터링할 수 있습니다.](./feature-flags/images/04.png)

## 개발 기능 플래그

Dev 기능 플래그는 활성 개발 중인 기능 및 기능에 대한 것이며 프로덕션에서 활성화해서는 안 됩니다. 테스트용으로 개발 기능만 활성화하십시오.

포털 속성을 사용하여 코드 `XXX-000000` 로 이론적 개발 기능 플래그를 활성화하려면 다음을 `portal-ext.properties`에 추가합니다.

```
feature.flag.XXX-000000=true
```

환경 변수를 사용하여 코드 `XXX-000000` 로 이론적 개발 기능 플래그를 활성화하려면 다음을 구성에 추가하십시오.

```
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEX__UPPERCASEX__UPPERCASEX__MINUS__NUMBER0__NUMBER0__NUMBER0__NUMBER0__NUMBER0__NUMBER0_=true
```

```{warning}
프로덕션에서 개발 기능을 사용하지 마십시오. Liferay의 불안정성은 dev 기능 플래그를 활성화할 때 예상되는 부작용입니다. 
```

## 추가 정보

* [시맨틱 검색](../../using-search/liferay-enterprise-search/search-experiences/semantic-search.md)
* [베타 기능](https://help.liferay.com/hc/en-us/articles/12917247551757-Beta-Features)
