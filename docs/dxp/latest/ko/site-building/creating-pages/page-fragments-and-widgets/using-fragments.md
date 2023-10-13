---
toc:
  - ./using-fragments/default-fragments-reference.md
  - ./using-fragments/using-layout-elements.md
  - ./using-fragments/configuring-fragments.md
  - ./using-fragments/mapping-and-linking-fragment-elements.md
  - ./using-fragments/configuring-fragment-visibility.md
  - ./using-fragments/editing-fragment-elements.md
  - ./using-fragments/personalizing-custom-forms-using-form-fragments.md
  - ./using-fragments/creating-dropdown-menus-with-fragments.md
  - ./using-fragments/duplicating-fragments.md
  - ./using-fragments/saving-fragment-compositions.md
  - ./using-fragments/managing-fragments.md
  - ./using-fragments/propagating-fragment-changes.md
---
# 조각 사용

```{toctree}
:maxdepth: 3

using-fragments/default-fragments-reference.md
using-fragments/using-layout-elements.md
using-fragments/configuring-fragments.md
using-fragments/mapping-and-linking-fragment-elements.md
using-fragments/configuring-fragment-visibility.md
using-fragments/editing-fragment-elements.md
using-fragments/personalizing-custom-forms-using-form-fragments.md
using-fragments/creating-dropdown-menus-with-fragments.md
using-fragments/duplicating-fragments.md
using-fragments/saving-fragment-compositions.md
using-fragments/managing-fragments.md
using-fragments/propagating-fragment-changes.md
```

페이지 조각은 콘텐츠 페이지 [및 관련 템플릿(즉, [마스터](../defining-headers-and-footers/master-page-templates.md), [콘텐츠 페이지](../adding-pages/creating-a-page-template.md)](../using-content-pages.md) [디스플레이 페이지](../../displaying-content/using-display-page-templates.md))을 구축하기 위한 확장 가능하고 재사용 가능한 드래그 앤 드롭 요소입니다. CSS, HTML 및 JavaScript를 사용하여 구축되었으며 페이지에 구조와 기능을 모두 제공할 수 있습니다.

![조각으로 콘텐츠 페이지와 템플릿을 구축하세요.](./using-fragments/images/01.png)

Liferay는 기본적으로 다양한 조각을 제공하지만 [페이지 조각 편집기](../../developer-guide/reference/fragments/page-fragment-editor-interface-를 사용하여 사용자 정의 조각을 개발할 수 있습니다. reference.md) 또는 [Fragments Toolkit](../../developer-guide/developing-page-fragments/using-the-fragments-toolkit.md). 또한 [Liferay 위젯을 포함](../../developer-guide/reference/fragments/fragment-특이적-tags-reference.md#include-widgets-within-a-fragment) 하여 조각에 추가하거나 편집 가능한 필드를 추가할 수 있습니다.  자세한 내용은 [페이지 조각 개발](../../developer-guide/developing-page-fragments/developing-fragments-intro.md)을 참조하세요.

양식 작업을 하는 경우 양식 필드를 사용자 정의 양식 조각에 매핑하여 [개인화할 수 있습니다](./using-fragments/personalizing-custom-forms-using-form-fragments.md).

모든 페이지 조각은 더 쉽게 관리하고 사용할 수 있도록 관련 조각을 그룹화하는 세트로 구성됩니다. 각 조각 세트에는 모든 조각에 액세스할 수 있는 공통 리소스가 포함될 수 있습니다. 자세한 내용은 [페이지 조각에 기본 리소스 포함](../../developer-guide/developing-page-fragments/including-default-resources-with-fragments.md) 을 참조하세요.

페이지나 템플릿에 조각을 추가한 후 조각과 해당 하위 요소를 구성하고 사용자 정의할 수 있습니다. 이러한 옵션은 다양할 수 있지만 일부는 모두에게 공통적입니다. 사용 가능한 옵션에 대해 자세히 알아보려면 조각 구성 [조각 구성](./using-fragments/configuring-fragments.md) 참조하세요.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 기본 조각 참조
:link: ./using-fragments/default-fragments-reference.md
:::  

:::{grid-item-card} 레이아웃 요소 사용
:link: ./using-fragments/using-layout-elements.md
:::  

:::{grid-item-card} 조각 구성
:link: ./using-fragments/configuring-fragments.md
:::  

:::{grid-item-card} 조각 요소 매핑 및 연결
:link: ./using-fragments/mapping-and-linking-fragment-elements.md
:::  

:::{grid-item-card} 조각 가시성 구성
:link: ./using-fragments/configuring-fragment-visibility.md
:::  

:::{grid-item-card} 조각 요소 편집
:link: ./using-fragments/editing-fragment-elements.md
:::  

:::{grid-item-card} 양식 조각을 사용하여 사용자 정의 양식 개인화
:link: ./using-fragments/personalizing-custom-forms-using-form-fragments.md
:::  

:::{grid-item-card} 조각으로 드롭다운 메뉴 만들기
:link: ./using-fragments/creating-dropdown-menus-with-fragments.md
:::  

:::{grid-item-card} 조각 복제
:link: ./using-fragments/duplicating-fragments.md
:::  

:::{grid-item-card} 조각 구성 저장
:link: ./using-fragments/saving-fragment-compositions.md
:::  

:::{grid-item-card} 조각 관리
:link: ./using-fragments/managing-fragments.md
:::  

:::{grid-item-card} 조각 변경 사항 전파
:link: ./using-fragments/propagating-fragment-changes.md
:::
::::
