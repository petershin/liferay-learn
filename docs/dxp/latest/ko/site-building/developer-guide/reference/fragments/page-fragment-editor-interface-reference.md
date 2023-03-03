# 페이지 조각 편집기 인터페이스 참조

페이지 조각 편집기의 인터페이스는 두 개의 탭으로 구성됩니다.

- [코드 편집기](#code-editor)
- [설정](#configuration)

아래 섹션에서는 인터페이스의 이러한 부분을 사용하는 방법을 다룹니다. 페이지 조각을 개발하는 방법은 [페이지 조각 개발](../../developing-page-fragments/developing-fragments-intro.md) 을 참조하십시오.

## 코드 편집기

코드 편집기는 네 개의 창으로 나뉩니다.

**HTML:** 동적 동작을 추가하는 데 사용할 수 있는 Liferay Portal 특정 태그 및 FreeMarker( [대체(대괄호) 구문](https://freemarker.apache.org/docs/dgui_misc_alternativesyntax.html) 사용)와 함께 표준 HTML을 지원합니다.

```{tip}
`$(`를 입력하여 자동 완성을 사용하여 변수 이름 찾기를 시작하십시오. 자동 완성을 사용하여 taglib 이름을 찾으려면 `[@`를 입력하십시오.
```

**CSS:** 표준 CSS를 지원합니다.

**JavaScript:** 표준 JavaScript 및 JQuery를 지원합니다. JavaScript 창의 FreeMarker 컨텍스트에서 구성 값에 액세스할 수도 있습니다.

**미리보기:** 은 코드를 작성할 때 업데이트되는 구성 요소의 실시간 미리보기를 제공합니다. 데스크톱, 모바일, 태블릿 및 확장 보기 간에 전환할 수 있습니다.

![조각 편집기는 조각의 모든 부분을 만들기 위한 환경을 제공합니다.](./page-fragment-editor-interface-reference/images/01.png)

## 설정

```{note}
페이지 조각에 대한 구성 정의는 Liferay DXP 7.2 SP1+ 및 Liferay Portal GA2+에서 사용할 수 있습니다.
```

구성 탭은 페이지 조각의 구성 메뉴에 구성 옵션을 추가하기 위한 입력을 제공합니다. 이것은 [Fragments Toolkit](../../developing-page-fragments/using-the-fragments-toolkit.md) 이 생성하는 `configuration.json` 파일과 동일합니다. 예를 들어 사용자가 페이지 조각의 머리글 색상을 선택할 수 있도록 페이지 조각의 구성 옵션에 선택기를 추가할 수 있습니다. 페이지 조각에 대한 구성 옵션을 정의하면 더 유연하게 유지 관리해야 하는 페이지 조각 수가 줄어듭니다.

```{note}
구성에 대한 변경 사항은 코드 편집기에서 자동으로 사용할 수 있습니다. 구성이 유효하지 않으면 페이지 조각을 게시할 수 없습니다. 페이지 조각을 미리 보거나 게시하기 전에 항상 유효한 JSON 구성이 있는지 확인하십시오.
```

구성 값은 HTML 창의 FreeMarker 컨텍스트를 통해 페이지 조각에서 사용할 수 있습니다. 구성 옵션을 HTML의 조건부 값과 결합하여 사용자를 위한 동적 경험을 만들 수 있습니다. JavaScript를 통해 이러한 값에 액세스할 수도 있습니다. 자세한 내용은 [구성 가능한 페이지 조각 만들기](../../developing-page-fragments/adding-configuration-options-to-fragments.md) 을 참조하십시오.

DXP 7.3+에서는 페이지 상단 근처의 확인란을 선택하여 조각을 캐시할 수 있도록 할 수도 있습니다. 이 옵션을 사용하면 조각이 페이지에 추가될 때 조각이 캐시에 추가되어 이러한 조각이 있는 페이지의 성능이 향상됩니다.

![조각을 캐싱하여 페이지의 성능을 향상시키려면 캐시 가능 옵션을 선택하십시오.](./page-fragment-editor-interface-reference/images/02.png)

## 추가 정보

- [조각 개발](../../developing-page-fragments/developing-fragments-intro.md)
- [조각에 구성 옵션 추가](../../developing-page-fragments/adding-configuration-options-to-fragments.md)
- [단편 구성 유형 참조](./fragment-configuration-types-reference.md)
