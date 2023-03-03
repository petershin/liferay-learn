# 고급 설정 참조

{bdg-secondary}`사용 가능 7.4 U37+/GA37+`

모든 Liferay의 기본 조각에는 Collection Display 조각을 제외한 고급 설정이 포함되어 있습니다. 고급 설정은 사용자 지정 CSS를 조각에 추가하고 콘텐츠를 검색할 수 있는지 여부 등을 구성할 수 있습니다.

```{note}
framgent의 고급 설정을 구성하려면 페이지에 대한 업데이트 - 고급 옵션 권한이 필요합니다.
```

프래그먼트의 고급 설정에 액세스하려면

1. 조각을 지원하는 페이지 또는 템플릿 편집을 시작합니다.

1. *브라우저* 측면 패널(![Browser](../../../../../images/icon-hierarchy.png))을 열고 *페이지 요소* 탭으로 이동하여 원하는 조각을 선택합니다.

   또는 페이지 또는 템플릿에서 원하는 조각을 클릭합니다.

1. 페이지 요소 사이드 메뉴에서 *고급* 탭을 클릭합니다.

![페이지 요소 사이드 메뉴에서 조각의 고급 설정에 액세스합니다.](./advanced-settings-reference/images/01.png)

## 표준 고급 설정

고급 설정이 있는 모든 기본 프래그먼트에는 다음 옵션이 있습니다.

### 사이트 검색 결과에서 숨김

사이트의 검색 결과에서 조각의 콘텐츠를 숨길지 여부를 지정합니다. 조각 콘텐츠를 숨기면 관련이 없고 중복되는 검색 결과를 줄일 수 있습니다. 선택한 조각에 하위 조각이 포함되어 있으면 해당 구성을 상속합니다.

![사이트의 검색 결과에서 조각의 콘텐츠를 숨길지 여부를 결정합니다.](./advanced-settings-reference/images/02.png)

### 커스텀 CSS

{bdg-secondary}`사용 가능 7.4 U34+/GA34+`

*Custom CSS* 텍스트 상자를 사용하여 조각에 CSS를 추가합니다. 기본적으로 이 텍스트 상자에는 다음 자리 표시자가 포함되어 있습니다.

```css
.[$FRAGMENT_CLASS$] {

}
```

`[$FRAGMENT_CLASS$]` 는 구성 중인 프래그먼트의 고유한 이름을 나타내는 CSS 클래스 토큰입니다. 이 CSS 코드는 현재 프래그먼트에만 적용됩니다. 예를 들어 프래그먼트의 배경을 일반적으로 빨간색으로 설정하고 사용자가 커서를 위로 가져가면 파란색으로 설정할 수 있습니다.

```css
.[$FRAGMENT_CLASS$] {
    background: red;
}

.[$FRAGMENT_CLASS$]:hover {
    background: blue
}
```

페이지가 렌더링될 때 `[$FRAGMENT_CLASS$]` 는 프래그먼트의 클래스 이름(예: `lfr-layout-structure-item-01d752e4-32e3-ed4a-9cd6-fcaf483d0c34`)으로 대체됩니다.

```{tip}
*확장* 아이콘( ![Expand](../../../../../images/icon-expand.png) )을 클릭하여 모달 창을 열고 프래그먼트의 CSS를 편집할 때 더 많은 공간을 확보하십시오.
```

[스타일 북](../../../../site-appearance/style-books/using-a-style-book-to-standardize- site-appearance.md)를 현재 사용 중입니다. 이 예에서는 스타일 책의 정보 색상(진한 파란색으로 정의됨)을 사용하여 조각의 배경색을 설정합니다.

```css
.[$FRAGMENT_CLASS$] {
    background: var(--info);
}
```

![스타일 북의 변수를 사용하여 특정 조각에 대한 CSS를 미세 조정할 수 있습니다.](./advanced-settings-reference/images/03.png)


### CSS 클래스

*CSS Classes* 필드를 사용하여 [Custom CSS](#custom-css) 에서 사용할 클래스를 추가합니다. 여러 클래스를 추가할 때 각 클래스를 공백, 쉼표 또는 줄 바꿈으로 구분하십시오. 동일한 페이지의 다른 조각에 이러한 클래스를 사용할 수 있습니다. 입력하는 동안 기존 수업에 대한 제안이 나타납니다.

![이 필드에 사용자 정의 CSS 클래스를 입력하면 동일한 페이지의 다른 부분에 대한 고급 설정에서 제안으로 표시됩니다.](./advanced-settings-reference/images/04.png)

```{note}
직접 추가한 CSS 클래스만 CSS 클래스 텍스트 상자에 제안으로 표시됩니다. 기존 클래스 또는 변수(예: `[$FRAGMENT_CLASS$]`)는 표시되지 않으며 이 필드에 추가할 필요가 없습니다.
```

## 고급 컨테이너 설정

컨테이너 조각에는 [표준 항목](#standard-advanced-settings) 및 고급 설정이 포함됩니다.

### HTML 태그

컨테이너 조각에 대해 생성된 HTML 태그를 선택합니다: `div`, `header`, `nav`, `section`, `article`, `main`, `aside`또는 `footer`. 이러한 태그는 웹 스크레이퍼, 브라우저 및 사이트 렌더러가 페이지 콘텐츠를 더 쉽게 찾고 검색하는 데 도움이 됩니다. 선택한 태그는 선택한 컨테이너 자체에만 적용되며 중첩된 조각이나 콘텐츠에는 적용되지 않습니다.

![고급 설정 탭에서 컨테이너 조각에 사용되는 HTML 태그를 선택할 수 있습니다.](./advanced-settings-reference/images/05.png)

### 콘텐츠 가시성을 자동으로 설정

{bdg-secondary}`사용 가능 7.4 U37+/GA37+`

기본적으로 Liferay는 페이지의 모든 컨테이너를 자동으로 렌더링합니다. 그러나 컨테이너의 [`content-visibility`](https://drafts.csswg.org/css-contain/#propdef-content-visibility) 속성을 `auto` 로 설정하면 요소가 필요할 때만 렌더링됩니다. 이렇게 하면 페이지의 로드 성능이 향상될 수 있습니다.

![컨테이너의 콘텐츠 가시성을 자동으로 설정하여 페이지 로드 성능을 개선합니다.](./advanced-settings-reference/images/06.png)

## 추가 정보

* [일반 설정 참조](./general-settings-reference.md)
* [조각 사용](../../using-fragments.md)
* [스타일 북 만들기](../../../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)
* [Style Book 토큰 정의](../../../../site-appearance/style-books/developer-guide/style-book-token-definitions.md)
