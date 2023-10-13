# 페이지 조각 편집기 인터페이스 참조

페이지 조각 편집기의 인터페이스는 두 개의 탭으로 구성됩니다.

- [코드 편집기](#code-editor)
- [설정](#configuration)

아래 섹션에서는 인터페이스의 이러한 부분을 사용하는 방법을 다룹니다. 페이지 조각 개발 방법을 알아보려면 [페이지 조각 개발](../../developing-page-fragments/developing-fragments-intro.md) 참조하세요.

## 코드 편집기

코드 편집기는 네 개의 창으로 나누어져 있습니다.

**HTML:** 동적 동작을 추가하는 데 사용할 수 있는 Liferay Portal 특정 태그 및 FreeMarker( [대안(대괄호) 구문](https://freemarker.apache.org/docs/dgui_misc_alternativesyntax.html) 사용)과 함께 표준 HTML을 지원합니다.

```{tip}
변수 이름을 찾기 위해 자동 완성 기능을 사용하려면 `$(`를 입력하세요. 자동 완성을 사용하여 taglib 이름을 찾으려면 `[@`를 입력하세요.
```

**CSS:** 표준 CSS를 지원합니다.

**JavaScript:** 표준 JavaScript 및 JQuery를 지원합니다. JavaScript 창의 FreeMarker 컨텍스트에서 구성 값에 액세스할 수도 있습니다.

**미리보기:** 코드 작성 시 업데이트되는 구성요소의 실시간 미리보기를 제공합니다. 데스크톱, 모바일, 태블릿, 확장 보기 간에 전환할 수 있습니다.

![조각 편집기는 조각의 모든 부분을 생성하기 위한 환경을 제공합니다.](./page-fragment-editor-interface-reference/images/01.png)

## 설정

```{note}
페이지 조각에 대한 구성 정의는 Liferay DXP 7.2 SP1+ 및 Liferay Portal GA2+에서 사용할 수 있습니다.
```

구성 탭은 페이지 조각의 구성 메뉴에 구성 옵션을 추가하기 위한 입력을 제공합니다. 이는 [Fragments Toolkit](../../developing-page-fragments/using-the-fragments-toolkit.md) 이 생성하는 `` 파일과 동일합니다. 예를 들어, 사용자가 페이지 조각 제목의 색상을 선택할 수 있도록 페이지 조각의 구성 옵션에 선택기를 추가할 수 있습니다. 페이지 조각에 대한 구성 옵션을 정의하면 유연성이 향상되어 유지 관리해야 하는 페이지 조각 수가 줄어듭니다.

```{note}
구성에 대한 변경 사항은 코드 편집기에서 자동으로 사용할 수 있습니다. 구성이 유효하지 않으면 페이지 조각을 게시할 수 없습니다. 페이지 조각을 미리 보거나 게시하기 전에 항상 유효한 JSON 구성이 있는지 확인하십시오.
```

구성 값은 HTML 창의 FreeMarker 컨텍스트를 통해 페이지 조각에 사용할 수 있습니다. 구성 옵션을 HTML의 조건부 값과 결합하여 사용자를 위한 동적 경험을 만들 수 있습니다. JavaScript를 통해 이러한 값에 액세스할 수도 있습니다. 자세한 내용은 [페이지 조각을 구성 가능하게 만들기](../../developing-page-fragments/adding-configuration-options-to-fragments.md) 참조하세요.

## 관련 주제

- [조각 개발](../../developing-page-fragments/developing-fragments-intro.md)
- [조각에 구성 옵션 추가](../../developing-page-fragments/adding-configuration-options-to-fragments.md)
- [조각 구성 유형 참조](./fragment-configuration-types-reference.md)
