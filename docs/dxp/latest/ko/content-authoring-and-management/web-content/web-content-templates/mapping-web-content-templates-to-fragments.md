# 웹 콘텐츠 템플릿을 조각에 매핑
<!--TASK: Relocate to section on Web Content Templates, since this is done on the Web Content side. -->
기본적으로 단일 값(예: 날짜, 숫자, 이미지, 숫자 또는 텍스트)을 포함하는 [웹 콘텐츠 구조](../../../content-authoring-and-management/web-content/web-content-structures/understanding-web-content-structures.md) 필드를 조각에 매핑할 수 있습니다. 다중 값 필드(예: 목록에서 선택, 라디오 버튼 또는 HTML)의 경우 먼저 웹 컨텐츠 템플릿 [웹 콘텐츠 템플릿](../../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)사용하여 필드를 렌더링해야 합니다. 그런 다음 템플릿을 조각에 매핑할 수 있습니다.

예를 들어, 이 이미지의 **대상이 있는 웹 콘텐츠** 구조에는 **텍스트** 유형의 콘텐츠 필드와 **목록에서 선택** 유형의 대상 필드가 포함되어 있습니다.

![기본적으로 단일 값 구조 필드를 조각에 매핑할 수 있습니다.](./mapping-web-content-templates-to-fragments/images/01.png)

단일 값 콘텐츠 필드를 조각에 직접 매핑할 수 있지만 다중 값 대상 필드를 매핑하려면 웹 콘텐츠 템플릿이 필요합니다. [웹 콘텐츠 템플릿](../../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md) 은 매핑하려는 필드가 포함된 웹 콘텐츠 기사와 동일한 구조를 사용해야 합니다. 다음 이미지는 이 관계를 보여줍니다.

![웹 콘텐츠 기사와 동일한 구조를 사용하는 웹 콘텐츠 템플릿을 만듭니다.](./mapping-web-content-templates-to-fragments/images/02.png)

```{note}
여러 구조 필드 값을 개별 조각에 매핑하려면 해당 구조를 사용하는 각 필드에 대해 하나의 필드만 렌더링하는 별도의 웹 콘텐츠 템플릿을 생성해야 합니다. 하나의 템플릿에서 모든 필드를 렌더링하는 경우 템플릿을 선택할 때 모든 값이 조각에 매핑됩니다.
```

## 웹 콘텐츠 템플릿을 조각에 매핑

1. [매핑하려는 다중 값 필드가 포함된 웹 콘텐츠 구조](../../../content-authoring-and-management/web-content/web-content-structures/creating-structures.md) 을 생성합니다.

1. [다중 값 필드(A)와 동일한 구조를 사용하는 웹 콘텐츠 템플릿](../../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md) 을 생성합니다.

1. 웹 콘텐츠 템플릿의 필드(B)에서 구조의 다중 값 필드가 있는 **변수**(C)을 선택합니다.

    ![다중 값 필드가 있는 구조를 기반으로 웹 콘텐츠 템플릿을 만듭니다.](./mapping-web-content-templates-to-fragments/images/03.png)

1. [이전 웹 콘텐츠 템플릿을 기반으로 웹 콘텐츠](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md) 생성합니다.

    ![다중 값 필드가 있는 템플릿을 기반으로 웹 콘텐츠를 만듭니다.](./mapping-web-content-templates-to-fragments/images/04.png)

1. 프래그먼트 지원 페이지(콘텐츠 페이지, 디스플레이 페이지 템플릿 등)에서 [조각을 추가하십시오](../../../site-building/creating-pages/using-content-pages/adding-elements-to-content-pages.md).

1. 사이드바 패널에서 **선택**(![Selection](../../../images/icon-pages-tree.png)) 버튼을 클릭하고 매핑하려는 조각의 요소를 선택합니다.

1. 매핑 섹션에서 [**선택 및 매핑**](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings) 매핑하려는 값이 포함된 웹 콘텐츠 기사입니다.
   
1. **필드** 드롭다운 메뉴를 클릭하고 이전에 생성한 웹 콘텐츠 템플릿을 선택합니다.

  ![웹 콘텐츠 템플릿의 필드를 조각에 매핑합니다.](./mapping-web-content-templates-to-fragments/images/05.png)

1. **게시** 를 클릭하여 변경 사항을 저장합니다.

```{warning}
웹 콘텐츠 기사는 편집하고 저장할 때 다시 색인화되지만, 콘텐츠 페이지는 게시될 때만 다시 색인화됩니다(리소스 절약을 위해). 따라서 캐시된 조각에 매핑된 웹 콘텐츠 기사가 업데이트되면 페이지를 다시 게시하거나 [조각을 캐시 가능으로 표시 해제](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md#managing-individual-page-fragments) 할 때까지 업데이트가 콘텐츠 페이지에 표시되지 않습니다.
```

## 관련 주제

[조각 사용](../../../site-building/creating-pages/page-fragments-and-widgets/using-fragments.md)

[웹 콘텐츠 구조 이해](../../../content-authoring-and-management/web-content/web-content-structures/understanding-web-content-structures.md)

[웹 콘텐츠 템플릿 만들기](../../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)
