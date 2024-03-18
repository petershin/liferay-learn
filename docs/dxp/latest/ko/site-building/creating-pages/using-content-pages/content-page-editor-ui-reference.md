# 콘텐츠 페이지 편집기 UI 참조

{bdg-secondary}`Liferay 7.4 U37+/GA37+용`

콘텐츠 페이지 편집기를 사용하면 콘텐츠 페이지에 [를](./adding-elements-to-content-pages.md) 하고 구성할 수 있습니다. 콘텐츠 페이지 편집기를 열려면 콘텐츠 페이지로 이동하여 **편집**(![아이콘 편집](../../../images/icon-edit.png))을 클릭하세요. 그러면 콘텐츠 페이지 작성을 위한 도구와 구성 요소가 포함된 편집 도구 모음과 사이드바가 표시됩니다.

* [편집 도구 모음](#editing-toolbar)

* [사이드바 편집](#editing-sidebar)

![Click the Edit button to access the editing toolbar and sidebar.](./content-page-editor-ui-reference/images/01.png)

## 툴바 편집

콘텐츠 페이지 도구 모음에는 고유한 사용자 경험 생성, 현지화된 번역 설정, 편집 모드 간 전환 등을 위한 도구가 포함되어 있습니다.

![Click the Edit button to access the editing toolbar.](./content-page-editor-ui-reference/images/02.png)

### 경험

경험 드롭다운 메뉴를 사용하면 현재 페이지의 복사본을 만들어 특정 대상에 맞게 사용자 정의할 수 있습니다. 자세한 내용은 [콘텐츠 페이지 개인화](../../personalizing-site-experience/experience-personalization/content-page-personalization.md) 참조하세요.

### 통역

번역 드롭다운 메뉴에 액세스하려면 언어 플래그를 클릭하세요. 여기에서 페이지의 활성 언어 상태를 볼 수 있을 뿐만 아니라 언어 간 전환을 통해 번역을 직접 보고 편집할 수도 있습니다. 자세한 내용은 [사이트 언어 구성](../../site-settings/site-localization.md) 참조하세요.

콘텐츠 페이지 개인화에 [경험](../../personalizing-site-experience/experience-personalization/content-page-personalization.md) 사용하는 경우 사이트에 사용 가능한 언어를 사용하여 경험을 구성할 수 있습니다. 자세한 내용은 [경험 현지화 관리](../../personalizing-site-experience/experience-personalization/content-page-personalization.md#managing-experience-localization) 참조하세요.

### 장치 디스플레이

Liferay의 반응형 레이아웃 편집기에 액세스하려면 장치 아이콘을 클릭하세요. 여기에서 다양한 화면 크기에 맞게 페이지를 구성할 수 있습니다. 사용 가능한 디스플레이 옵션에는 데스크탑( ![Desktop](../../../images/icon-display.png) ), 태블릿( ![Tablet](../../../images/icon- Tablet-portrait.png) ), 가로 방향 전화( ![Landscape Phone](../../../images/icon-mobile-landscape.png) ) 및 세로 방향 전화( ![세로 방향 전화](.. /../../images/icon-mobile-portrait.png)). 태블릿 및 휴대폰 레이아웃을 편집하는 동안 크기 조정 핸들바를 사용하여 화면 크기를 수동으로 조정할 수 있습니다. 자세한 내용은 [반응형 레이아웃 구축](../../optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) 을 참조하세요.

```{note}
 [조각 및 위젯](#fragments-and-widgets) 및 [페이지 디자인 옵션](#page-design-options) 패널은 데스크톱 레이아웃에서만 사용할 수 있습니다.
```

### 편집 기록

현재 편집 세션 중에 변경된 내용을 보려면 **기록**( ![기록 버튼](./../../../images/icon-time.png) )을 클릭하세요. 이 기록을 사용하여 변경 사항을 예약하거나 복원할 수 있습니다. 또는 실행 취소 및 다시 실행 버튼을 클릭할 수도 있습니다.

![Revert your changes using the Undo, Redo, and History buttons.](./content-page-editor-ui-reference/images/03.png)

### 편집 모드 선택기

콘텐츠 페이지 사이드바에서 사용할 수 있는 편집 옵션은 선택한 편집 모드에 따라 다릅니다.

| 수정 모드   | 묘사                                                     | 사용 가능한 옵션                                                                                                                                                                                                                               |
| :------ | :----------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 페이지 디자인 | 페이지 및 페이지 콘텐츠를 업데이트할 수 있는 권한이 있는 경우 페이지를 디자인할 수 있습니다.  | <ul><li> [브라우저](#browser) </li><li> [페이지 내용](#page-content) </li><li> [댓글](#comments) </li></ul>                                                                                                             |
| 콘텐츠 편집  | 페이지 업데이트 권한이 있는 경우 콘텐츠를 편집할 수 있지만 페이지 콘텐츠는 편집할 수 없습니다. | <ul><li> [조각 및 위젯](#fragments-and-widgets) </li><li> [브라우저](#browser) </li><li> [페이지 디자인 옵션](#page-design-options) </li><li> [페이지 콘텐츠](#page-content) </li><li> [댓글](#comments) </li></ul> |

![Choose between Page Design or Content Editing editing modes.](content-page-editor-ui-reference/images/04.png)

### 사이드바 전환

편집 사이드바를 숨기고 페이지를 미리 보려면 **사이드바 전환**( ![사이드바 전환](../../../images/icon-view.png) )을 클릭하세요. 애플리케이션 표시줄에서 **작업**( ![작업 버튼](../../../images/icon-actions.png) )을 클릭하고 **새 탭에서 미리보기** 를 선택하여 현재 페이지 경험과 언어를 확인하세요. 새 탭에서.

### 페이지 템플릿으로 변환

응용 프로그램 표시줄에서 **작업**( ![작업 버튼](../../../images/icon-actions.png) )을 클릭하고 **페이지 템플릿으로 변환**(![페이지 템플릿](../../../images/icon-page-template.png)) 현재 페이지 디자인을 기반으로 [페이지 템플릿](../adding-pages/creating-a-page-template.md) 생성합니다.

### 공개

기본적으로 게시하면 변경 사항이 즉시 적용됩니다. 그러나 검토 및 게시 프로세스를 지시하도록 [워크플로 프로세스](../../../process-automation/workflow/introduction-to-workflow.md) 구성된 경우 게시를 클릭하면 정의된 절차가 시작됩니다.

## 사이드바 편집

선택한 편집 모드에 따라 편집 사이드바에서 다음 패널에 액세스할 수 있습니다.

- ![조각 및 위젯](../../../images/icon-plus.png) - [조각 및 위젯](#fragments-and-widgets)

- ![브라우저](../../../images/icon-hierarchy.png) - [브라우저](#browser) (이전**선택**)

- ![페이지 디자인 옵션](../../../images/icon-format.png) - [페이지 디자인 옵션](#page-design-options)

- ![페이지 콘텐츠](../../../images/icon-paperclip.png) - [페이지 콘텐츠](#page-content) (이전**콘텐츠**)

- ![댓글](../../../images/icon-message.png) - 댓글 [개](#comments)

![The editing sidebar includes these panels.](content-page-editor-ui-reference/images/05.png)

### 프래그먼트 및 위젯

조각 및 위젯 패널( ![조각 및 위젯 아이콘](../../../images/icon-plus.png) )에서 기본 페이지 요소와 사용자 정의 페이지 요소에 모두 액세스할 수 있습니다.

**조각** : 조각은 콘텐츠 페이지의 기본 구성 요소 역할을 하는 확장 가능하고 재사용이 가능한 드래그 앤 드롭 요소입니다. 예를 들어 레이아웃 요소, 비디오, 텍스트 오버레이가 포함된 배너 이미지가 있습니다. 기본 조각에 대해 자세히 알아보려면 [조각 사용](../page-fragments-and-widgets/using-fragments.md) 참조하고, 자신만의 조각을 만드는 방법을 알아보려면 [조각 개발](../../developer-guide/developing-page-fragments/developing-fragments-intro.md) 참조하세요.

**위젯** : 위젯은 페이지에 동적 기능을 추가하는 애플리케이션 [애플리케이션](../../../building-applications.md) . 예로는 블로그, 게시판, 달력 등이 있습니다. 자세한 내용은 [콘텐츠 페이지에서 위젯 사용](./using-widgets-on-a-content-page.md) 참조하세요.

```{tip}
Liferay 7.4 U37/GA37부터 Order 버튼(![Order 버튼](../../../images/icon-order.png))을 클릭하여 프래그먼트 및 위젯 세트를 재정렬합니다. 즐겨찾는 요소 목록에 조각이나 위젯을 추가하려면 별표 버튼(![별표 버튼](../../../images/icon-star.png))을 클릭하세요.
```

### 브라우저

브라우저 패널( ![Browser](../../../images/icon-hierarchy.png) )을 사용하여 페이지의 모든 요소를 보고, 구성하고, 관리합니다. 요소는 계층 구조로 표시됩니다. Liferay 7.4 U37/GA37+의 경우 브라우저 패널에서 요소를 끌어서 놓아 재구성하거나 요소를 두 번 클릭하여 이름을 바꿀 수 있습니다. 요소를 선택하면 구성 측면 패널에서 해당 설정이 열립니다. 추가 설정에 액세스하려면 조각의 하위 요소를 선택하세요. 자세한 내용은 [조각 구성](../page-fragments-and-widgets/using-fragments/configuring-fragments.md) 참조하세요.

```{note}
콘텐츠 페이지를 편집할 때 머리글 및 바닥글 요소는 브라우저 패널에 포함되지 않습니다. [마스터 페이지 템플릿](../defining-headers-and-footers/master-page-templates.md) 에서만 이러한 요소를 편집할 수 있습니다.
```

### 페이지 디자인 옵션

**페이지 디자인 옵션 패널**(![페이지 디자인 옵션](../../../images/icon-format.png))을 열어 페이지의 [마스터 페이지 템플릿](../defining-headers-and-footers/managing-master-page-templates.md) 또는 [스타일 북](../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md) 을 변경합니다. **옵션**(![옵션 버튼](../../../images/icon-cog3.png))을 클릭하여 [프런트 엔드 클라이언트 확장을 포함한 추가 페이지 디자인 옵션에 액세스하세요](../../../building-applications/client-extensions/frontend-client-extensions.md) .

### 페이지 컨텐츠

페이지 콘텐츠 패널( ![페이지 콘텐츠](../../../images/icon-paperclip.png) )에서는 페이지에 직접 추가된 콘텐츠를 보고 편집할 수 있습니다. 여기에는 인라인 텍스트, 이미지, 웹 콘텐츠 기사 등이 포함될 수 있습니다. 콘텐츠를 보는 동안 콘텐츠 항목을 검색하고 유형별로 필터링할 수 있습니다. 페이지에 [컬렉션](../../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) 포함되어 있으면 해당 항목을 보고 새 항목을 추가할 수 있습니다. 자세한 내용은 [콘텐츠 페이지의 콘텐츠 관리](./managing-content-in-content-pages.md) 참조하세요.

```{note}
컬렉션 외에 매핑된 콘텐츠는 페이지 콘텐츠 패널에 나열되지 않습니다. 패널에는 페이지에 직접 추가된 콘텐츠만 포함됩니다.
```

### 댓글

댓글 패널( ![댓글](../../../images/icon-message.png) )에서 조각과 위젯에 댓글을 달아 페이지 참여자와 공동 작업할 수 있습니다. 열린 댓글을 보거나 편집하거나 삭제하거나 답글을 달 수도 있습니다. [멘션](../../../collaboration-and-social/notifications-and-requests/user-guide/mentioning-users.md) 활성화된 경우 댓글의 일부로 페이지 업데이트 권한이 있는 사용자를 태그할 수 있습니다. 댓글을 추가하려면 댓글 패널을 열고 원하는 페이지 요소를 선택하세요.

### 브라우저

{bdg-secondary}`liferay 7.3용`

선택 패널(![선택](../../../images/icon-pages-tree.png))에서는 모든 페이지 요소의 계층적 개요를 볼 수 있을 뿐만 아니라 선택, 구성 또는 해당 요소를 제거하세요. 마찬가지로 디자인 모드에서 페이지의 요소를 클릭하면 선택 패널이 열리고 계층 구조에서 선택한 페이지 요소가 강조 표시됩니다. 요소를 선택하면 해당 요소의 일반, 스타일 및 링크 옵션(있는 경우)에 액세스할 수 있습니다. 자세한 내용은 [조각 구성](../page-fragments-and-widgets/using-fragments/configuring-fragments.md) 참조하세요.

![Selection shows you a hierarchy of your page and contents.](./content-page-editor-ui-reference/images/06.png)

```{note}
페이지의 머리글과 바닥글은 마스터 페이지 템플릿 [에서만 수정할 수 있으므로 선택 패널 계층 구조에 나열되지](../defining-headers-and-footers/master-page-templates.md) .
```

### 컨텐츠

{bdg-secondary}`liferay 7.3용`

콘텐츠 패널(![콘텐츠](../../../images/icon-list-ul.png))에서는 페이지의 모든 웹 콘텐츠를 보고, 편집하고, 관리할 수 있습니다. 여기에는 위젯에 표시되고 콘텐츠 필드에 매핑된 콘텐츠가 포함됩니다. 자세한 내용은 [콘텐츠 페이지의 콘텐츠 관리](./managing-content-in-content-pages.md) 참조하세요.

## 관련 주제

[콘텐츠 페이지 사용하기](../using-content-pages.md)

[콘텐츠 페이지에 요소 추가하기](./adding-elements-to-content-pages.md)

[조각 사용](../page-fragments-and-widgets/using-fragments/configuring-fragments.md)
