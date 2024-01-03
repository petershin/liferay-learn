# 관리 국가

{bdg-secondary}`Liferay DXP 7.4 U36/Liferay Portal 7.4 GA36 이상`

Liferay에는 ISO 3166 표준 [에 정의](https://www.iso.org/iso-3166-country-codes.html) 사용 가능한 국가 목록이 포함되어 있지만 국가 관리 앱을 사용하여 기존 항목을 수정하거나 새 항목을 추가할 수 있습니다.

```{note}
liferay DXP 7.4 U36 - U40(또는 Liferay Portal 7.4 GA36 - GA40)의 경우 국가 관리 앱이 UI에서 숨겨져 있으며 기능 플래그를 사용하여 활성화해야 합니다. 단계를 보려면 아래의 [국가 관리 앱 활성화](#enable-the-countries-management-app)를 참조하세요.
```

## 기존 국가 편집

1. 글로벌 메뉴(![글로벌 메뉴](../../images/icon-applications-menu.png))를 엽니다. _제어판_ &rarr; _구성_ &rarr; _국가 관리_로 이동합니다.

1. 국가 이름을 클릭하여 국가를 선택하거나 해당 국가에서 _옵션_ (![옵션 아이콘](../../images/icon-actions.png))을 클릭하고 _편집_을 클릭하세요. 특정 국가를 빠르게 찾으려면 검색창을 사용하세요.

1. 원하는 대로 변경하고 _저장_을 클릭하세요. 이제 국가가 수정되었습니다.

## 국가 비활성화

1. 글로벌 메뉴(![글로벌 메뉴](../../images/icon-applications-menu.png))를 엽니다. _제어판_ &rarr; _구성_ &rarr; _국가 관리_로 이동합니다.

1. 국가 목록을 스크롤하여 국가를 찾으세요. 특정 국가를 빠르게 찾으려면 검색창을 사용하세요.

1. 국가에서 _옵션_(![옵션 아이콘](../../images/icon-options.png))을 클릭하고 _비활성화_를 클릭하세요.

1. _확인_을 클릭하여 확인하면 국가가 비활성화됩니다.

## 국가 활성화

1. 글로벌 메뉴(![글로벌 메뉴](../../images/icon-applications-menu.png))를 엽니다. _제어판_ &rarr; _구성_ &rarr; _국가 관리_로 이동합니다.

1. 비활성화된 국가 목록을 보려면 검색창 옆에 있는 _필터 및 주문_을 클릭하고 _비활성_을 선택하세요. 특정 국가를 빠르게 찾으려면 검색창을 사용하세요.

1. 국가에서 _옵션_(![옵션 아이콘](../../images/icon-options.png))을 클릭하고 _활성화_를 클릭하세요. 이제 국가가 활성화되었습니다.

## 국가 삭제

1. 글로벌 메뉴(![글로벌 메뉴](../../images/icon-applications-menu.png))를 엽니다. _제어판_ &rarr; _구성_ &rarr; _국가 관리_로 이동합니다.

1. 국가 목록을 스크롤하여 국가를 찾으세요. 특정 국가를 빠르게 찾으려면 검색창을 사용하세요.

1. 국가에서 _옵션_(![옵션 아이콘](../../images/icon-options.png))을 클릭하고 _삭제_를 클릭하세요.

1. _확인_을 클릭하여 확인하면 국가가 삭제됩니다.

```{warning}
_확인_을 클릭하기 전에 항목을 삭제할 것인지 확인하세요. 항목을 삭제하면 복구할 수 없습니다.
```

## 새 국가 추가

1. 글로벌 메뉴(![글로벌 메뉴](../../images/icon-applications-menu.png))를 엽니다. _제어판_ &rarr; _구성_ &rarr; _국가 관리_로 이동합니다.

1. 검색창 옆에 있는 _추가_(![아이콘 추가](../../images/icon-add.png))를 클릭하세요. 국가를 추가하기 위한 새 페이지가 나타납니다.

   ![A new page appears for adding a country.](./managing-countries/images/02.png)

1. 새 국가를 추가하려면 양식을 작성하세요. 이름, 2자리 ISO 코드, 3자리 ISO 코드, 번호는 필수 필드입니다.

1. _저장_을 클릭하면 새 국가가 추가됩니다.

## 국가 관리 앱 활성화

기본적으로 국가 관리 앱은 UI에서 숨겨져 있습니다. UI를 활성화하려면,

1. [`portal-ext.properties`](../../installation-and-upgrades/reference/portal-properties.md) 파일에 다음 속성을 추가합니다.

   `feature.flag.LPS-122223=true`

   Docker를 사용하는 경우 처음 시작할 때 다음 [`환경 변수`](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md#portal-properties) 사용하십시오.

   `--env LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEL__UPPERCASEP__UPPERCASES__MINUS__NUMBER1__NUMBER2__NUMBER2__NUMBER2__NUMBER2__NUMBER3_=true`

1. 서버를 다시 시작하세요. 이제 앱이 나타납니다.

   ![See the Countries Management app in the UI.](./managing-countries/images/01.png)
