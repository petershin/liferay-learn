# 국가 관리

{bdg-secondary}`사용 가능한 Liferay DXP 7.4 U36/Liferay Portal 7.4 GA36 이상`

Liferay에는 [ISO 3166 Standard](https://www.iso.org/iso-3166-country-codes.html)에 정의된 사용 가능한 국가 목록이 포함되어 있지만 국가 관리 앱을 사용하여 기존 항목을 수정하거나 새 항목을 추가할 수 있습니다.

```{note}
Liferay DXP 7.4 U36 - U40(또는 Liferay Portal 7.4 GA36 - GA40)의 경우 국가 관리 앱은 UI에서 숨겨지며 기능 플래그를 사용하여 활성화해야 합니다. 단계를 보려면 아래의 [국가 관리 앱 활성화](#enable-the-countries-management-app)를 참조하세요.
```

## 기존 국가 편집

1. 전역 메뉴(![Global Menu](../../images/icon-applications-menu.png))를 엽니다. *제어판* &rarr; *구성* &rarr; *국가 관리*로 이동합니다.

1. 이름을 클릭하여 국가를 선택하거나 해당 국가에서 _옵션_ (![Options icon](../../images/icon-actions.png))을 클릭하고 _편집_을 클릭합니다. 특정 국가를 빠르게 찾으려면 검색창을 사용하세요.

1. 원하는 대로 변경하고 *저장*을 클릭하십시오. 이제 국가가 수정되었습니다.

## 국가 비활성화

1. 전역 메뉴(![Global Menu](../../images/icon-applications-menu.png))를 엽니다. *제어판* &rarr; *구성* &rarr; *국가 관리*로 이동합니다.

1. 국가 목록을 스크롤하여 국가를 찾습니다. 특정 국가를 빠르게 찾으려면 검색창을 사용하세요.

1. _국가 에서 옵션_ (![Options icon](../../images/icon-options.png)) 을 클릭 하고 _비활성화 를 클릭 하십시오_.

1. _확인_ 을 클릭하여 확인하면 국가가 비활성화됩니다.

## 국가 활성화

1. 전역 메뉴(![Global Menu](../../images/icon-applications-menu.png))를 엽니다. *제어판* &rarr; *구성* &rarr; *국가 관리*로 이동합니다.

1. 검색 표시줄 옆에 있는 _필터 및 주문_ 을 클릭하고 *비활성* 을 선택하여 비활성화된 국가 목록을 확인합니다. 특정 국가를 빠르게 찾으려면 검색창을 사용하세요.

1. _옵션_ (![Options icon](../../images/icon-options.png)) 국가 를 클릭 하고 _활성화_를 클릭 하십시오 . 이제 국가가 활성화됩니다.

## 국가 삭제

1. 전역 메뉴(![Global Menu](../../images/icon-applications-menu.png))를 엽니다. *제어판* &rarr; *구성* &rarr; *국가 관리*로 이동합니다.

1. 국가 목록을 스크롤하여 국가를 찾습니다. 특정 국가를 빠르게 찾으려면 검색창을 사용하세요.

1. _옵션_ (![Options icon](../../images/icon-options.png)) 국가 를 클릭 하고 _삭제_를 클릭 하십시오 .

1. _확인_ 을 클릭하여 확인하면 국가가 삭제됩니다.

```{warning}
_확인_을 클릭하기 전에 항목을 삭제할 것인지 확인하십시오. 삭제된 항목은 복구할 수 없습니다.
```

## 새 국가 추가

1. 전역 메뉴(![Global Menu](../../images/icon-applications-menu.png))를 엽니다. *제어판* &rarr; *구성* &rarr; *국가 관리*로 이동합니다.

1. 검색 표시줄 옆에 있는 _추가_ (![Add icon](../../images/icon-add.png))을 클릭합니다. 국가를 추가하기 위한 새 페이지가 나타납니다.

   ![국가를 추가하기 위한 새 페이지가 나타납니다.](./managing-countries/images/02.png)

1. 새 국가를 추가하려면 양식을 작성하세요. 이름, 2자로 된 ISO 코드, 3자로 된 ISO 코드 및 번호는 필수 필드입니다.

1. _저장_을 클릭하면 새로운 국가가 추가됩니다.

## 국가 관리 앱 활성화

기본적으로 국가 관리 앱은 UI에서 숨겨져 있습니다. UI를 활성화하려면

1. [`Portal-ext.properties`](../../installation-and-upgrades/reference/portal-properties.md) 파일에 다음 속성을 추가합니다.

   `feature.flag.LPS-122223=true`

   Docker를 사용하는 경우 처음 시작할 때 다음 [`환경 변수`](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md#portal-properties) 을 사용하십시오.

   `--env LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEL__UPPERCASEP__UPPERCASES__MINUS__NUMBER1__NUMBER2__NUMBER2__NUMBER2__NUMBER2__NUMBER3_=true`

1. 서버를 다시 시작하십시오. 이제 앱이 나타납니다.

   ![UI에서 국가 관리 앱을 참조하세요.](./managing-countries/images/01.png)
