# 콘텐츠 페이지 편집기 UI 참조

{bdg-secondary}`라이프레이 7.4 U37+/GA37+`

콘텐츠 페이지 편집기를 사용하여 콘텐츠 페이지에서 요소를 [추가하고](./adding-elements-to-content-pages.md) 구성할 수 있습니다. 콘텐츠 페이지 편집기를 열려면 콘텐츠 페이지로 이동하여 **편집**(![Edit icon](../../../images/icon-edit.png) )을 클릭합니다. 이렇게 하면 콘텐츠 페이지 작성을 위한 도구와 구성 요소가 포함된 편집 도구 모음과 사이드바가 나타납니다.

- [편집 도구 모음](#editing-toolbar)
- [사이드바 편집](#editing-sidebar)

![편집 버튼을 클릭하여 편집 도구 모음 및 사이드바에 액세스합니다.](./content-page-editor-ui-reference/images/01.png)

## 편집 도구 모음

콘텐츠 페이지 도구 모음에는 고유한 사용자 경험 생성, 현지화된 번역 설정, 편집 모드 간 전환 등을 위한 도구가 포함되어 있습니다.

![편집 버튼을 클릭하여 편집 도구 모음에 액세스합니다.](./content-page-editor-ui-reference/images/02.png)

### 경험담

경험 드롭다운 메뉴를 사용하여 현재 페이지의 복사본을 만들어 특정 대상에 맞게 사용자 지정할 수 있습니다. 자세한 내용은 [콘텐츠 페이지 개인화](../../personalizing-site-experience/experience-personalization/content-page-personalization.md) 참조하십시오.

### 통역

언어 플래그를 클릭하여 번역 드롭다운 메뉴에 액세스합니다. 여기에서 페이지의 활성 언어 상태를 볼 수 있을 뿐만 아니라 언어를 전환하여 직접 번역을 보고 편집할 수 있습니다. 자세한 내용은 [사이트 언어 구성](../../site-settings/site-localization.md) 참조하십시오.

콘텐츠 페이지 개인화에 [경험](../../personalizing-site-experience/experience-personalization/content-page-personalization.md) 사용하는 경우 사이트에서 사용 가능한 언어를 사용하여 경험을 구성할 수 있습니다. 자세한 내용은 [경험 현지화 관리](../../personalizing-site-experience/experience-personalization/content-page-personalization.md#managing-experience-localization) 참조하십시오.

### 장치 표시

Liferay의 반응형 레이아웃 편집기에 액세스하려면 장치 아이콘을 클릭하십시오. 여기에서 다양한 화면 크기에 맞게 페이지를 구성할 수 있습니다. 사용 가능한 디스플레이 옵션에는 데스크톱( ![Desktop](../../../images/icon-display.png) ), 태블릿( ![Tablet](../../../images/icon-tablet-portrait.png) ), 가로형 전화기( ![Landscape Phone](../../../images/icon-mobile-landscape.png) ) 및 세로형 전화기( ![Portrait Phone](../../../images/icon-mobile-portrait.png) )가 포함됩니다. 태블릿 및 휴대폰 레이아웃을 편집하는 동안 크기 조정 핸들바를 사용하여 수동으로 화면 크기를 조정할 수 있습니다. 자세한 내용은 [반응형 레이아웃 만들기](../../optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) 을 참조하십시오.

```{note}
[조각 및 위젯](#fragments-and-widgets) 및 [페이지 디자인 옵션](#page-design-options) 패널은 데스크톱 레이아웃에서만 사용할 수 있습니다.
```

### 기록 편집

**기록** 버튼(![History Button](./../../../images/icon-time.png) )을 클릭하여 현재 편집 세션 동안 변경된 사항을 확인합니다. 이 기록을 사용하여 변경 사항을 예약하거나 복원할 수 있습니다. 또는 실행 취소 및 다시 실행 버튼을 클릭할 수 있습니다.

![실행 취소, 다시 실행 및 기록 버튼을 사용하여 변경 사항을 되돌립니다.](./content-page-editor-ui-reference/images/03.png)

### 편집 모드 선택기

콘텐츠 페이지 사이드바에서 사용할 수 있는 편집 옵션은 선택한 편집 모드에 따라 다릅니다.

| 수정 모드   | 묘사                                                      | 사용 가능한 옵션                 |
|:------- |:------------------------------------------------------- |:------------------------- |
| 페이지 디자인 | 페이지 및 페이지 콘텐츠를 업데이트할 수 있는 권한이 있으면 페이지를 디자인할 수 있습니다.     | <ul><li> [Browser](#브라우저) </li><li> [페이지 콘텐츠](#page-content) </li><li> [Comments](#댓글) </li></ul> |
| 콘텐츠 편집  | 페이지를 업데이트할 수 있는 권한이 있지만 페이지 콘텐츠가 아닌 경우 콘텐츠를 편집할 수 있습니다. | <ul><li> [단편 및 위젯](#fragments-and-widgets) </li><li> [Browser](#브라우저) </li><li> [페이지 디자인 옵션](#page-design-options) </li><li> [페이지 콘텐츠](#page-content) </li><li> [Comments](#댓글) </li></ul> |

![페이지 디자인 또는 콘텐츠 편집 편집 모드 중에서 선택합니다.](content-page-editor-ui-reference/images/04.png)

### 사이드바 전환

편집 사이드바를 숨기고 페이지를 미리 보려면 사이드바 전환 버튼( ![Toggle Sidebars](../../../images/icon-view.png) )을 클릭하십시오. 애플리케이션 표시줄에서 작업 버튼( ![Actions Button](../../../images/icon-actions.png) )을 클릭하고 **새 탭에서 미리보기** 선택하여 새 탭에서 현재 페이지 경험과 언어를 확인합니다.

### 페이지 템플릿 생성

페이지 템플릿 버튼( ![Page Template](../../../images/icon-page-template.png) )을 클릭하여 현재 페이지 디자인을 기반으로 [페이지 템플릿](../adding-pages/creating-a-page-template.md) 만듭니다.

### 공개

기본적으로 게시하면 변경 사항이 즉시 적용됩니다. 그러나 [워크플로 프로세스](../../../process-automation/workflow/introduction-to-workflow.md) 이 검토 및 게시 프로세스를 지시하도록 구성된 경우 게시를 클릭하면 정의된 절차가 시작됩니다.

## 사이드바 편집

선택한 편집 모드에 따라 편집 사이드바에서 다음 패널에 액세스할 수 있습니다.

- ![프래그먼트 및 위젯](../../../images/icon-plus.png) - [조각 및 위젯](#fragments-and-widgets)
- ![브라우저](../../../images/icon-hierarchy.png) - [브라우저](#browser) (이전에는 **선택**)
- ![페이지 디자인 옵션](../../../images/icon-format.png) - [페이지 디자인 옵션](#page-design-options)
- ![페이지 컨텐츠](../../../images/icon-paperclip.png) - [페이지 내용](#page-content) (이전에는 **내용**)
- ![댓글](../../../images/icon-message.png) - [댓글](#comments)

![편집 사이드바에는 이러한 패널이 포함되어 있습니다.](content-page-editor-ui-reference/images/05.png)

### 프래그먼트 및 위젯

Fragments and Widgets 패널( ![Fragments and Widgets icon](../../../images/icon-plus.png) )에서 기본 및 사용자 지정 페이지 요소에 모두 액세스할 수 있습니다.

**조각** : 조각은 콘텐츠 페이지의 기본 구성 요소 역할을 하는 확장 가능하고 재사용 가능한 끌어서 놓기 요소입니다. 예를 들어 텍스트 오버레이가 있는 레이아웃 요소, 비디오 및 배너 이미지가 있습니다. 기본 프래그먼트에 대해 자세히 알아보려면 [프래그먼트 사용](../page-fragments-and-widgets/using-fragments.md) 참조하고, 자신만의 프래그먼트를 만드는 방법을 알아보려면 [프래그먼트 개발](../../developer-guide/developing-page-fragments/developing-fragments-intro.md) 참조하십시오.

**위젯** : 위젯은 페이지에 동적 기능을 추가하는 [애플리케이션](../../../building-applications.md) 입니다. 예를 들면 블로그, 게시판, 캘린더 등이 있습니다. 자세한 내용은 [콘텐츠 페이지에서 위젯 사용](./using-widgets-on-a-content-page.md) 참조하십시오.

```{tip}
Liferay 7.4 U37/GA37부터 주문 버튼(![주문 버튼](../../../images/icon-order.png))을 클릭하여 조각 및 위젯 세트를 재정렬합니다. 즐겨찾는 요소 목록에 조각이나 위젯을 추가하려면 별표 버튼(![별표 버튼](../../../images/icon-star.png))을 클릭하세요.
```

### 브라우저

브라우저 패널( ![Browser](../../../images/icon-hierarchy.png) )을 사용하여 페이지의 모든 요소를 보고 구성하고 관리합니다. 요소는 계층 구조로 표시됩니다. Liferay 7.4 U37/GA37+의 경우 브라우저 패널에서 요소를 드래그 앤 드롭하여 재구성하거나 요소를 두 번 클릭하여 이름을 바꿀 수 있습니다. 요소를 선택하면 구성 측면 패널에서 해당 설정이 열립니다. 추가 설정에 액세스하려면 조각의 하위 요소를 선택하십시오. 자세한 내용은 [프래그먼트 구성](../page-fragments-and-widgets/using-fragments/configuring-fragments.md) 참조하십시오.

```{note}
콘텐츠 페이지를 편집할 때 머리글 및 바닥글 요소는 브라우저 패널에 포함되지 않습니다. 이러한 요소는 [마스터 페이지 템플릿](../defining-headers-and-footers/master-page-templates.md)에서만 편집할 수 있습니다.
```

### 페이지 컨텐츠

페이지 콘텐츠 패널( ![Page Content](../../../images/icon-paperclip.png) )에서는 페이지에 직접 추가된 콘텐츠를 보고 편집할 수 있습니다. 여기에는 인라인 텍스트, 이미지, 웹 콘텐츠 기사 등이 포함될 수 있습니다. 콘텐츠를 보는 동안 콘텐츠 항목을 검색하고 유형별로 필터링할 수 있습니다. 페이지에 [컬렉션](../../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)포함되어 있으면 해당 항목을 보고 새 항목을 추가할 수 있습니다. 자세한 내용은 [콘텐츠 페이지의 콘텐츠 관리](./managing-content-in-content-pages.md) 참조하십시오.

```{note}
컬렉션 외에 매핑된 콘텐츠는 페이지 콘텐츠 패널에 나열되지 않습니다. 패널에는 페이지에 직접 추가된 콘텐츠만 포함됩니다.
```

### 페이지 디자인 옵션

페이지 디자인 옵션 패널( ![Page Design Options](../../../images/icon-format.png) )을 열어 페이지의 [마스터 페이지 템플릿](../defining-headers-and-footers/managing-master-page-templates.md) 또는 [스타일 북](../../site-appearance/style-books/using-a-style-book-to-standardize-site-appearance.md)를 변경합니다. Cog 버튼( ![Cog Button](../../../images/icon-cog3.png) )을 클릭하여 [프런트 엔드 클라이언트 확장](../../../building-applications/client-extensions/front-end-client-extensions.md)포함한 추가 모양 및 느낌 옵션에 액세스합니다.

### 댓글

댓글 패널( ![Comments](../../../images/icon-message.png) )에서 조각 및 위젯에 댓글을 달아 페이지 기여자와 협업할 수 있습니다. 열려 있는 댓글을 보거나, 수정하거나, 삭제하거나, 답글을 달 수도 있습니다. [멘션](../../../collaboration-and-social/notifications-and-requests/user-guide/mentioning-users.md) 활성화된 경우 댓글의 일부로 사용자에게 페이지 업데이트 권한을 태그할 수 있습니다. 댓글을 추가하려면 댓글 패널을 열고 원하는 페이지 요소를 선택합니다.

```{note}
7.3 이전 버전의 경우 주석은 기본적으로 비활성화되어 있습니다. 페이지 댓글을 활성화하려면 *제어판* &rarr; *시스템 설정* &rarr; *페이지* &rarr; *콘텐츠 페이지 편집기*로 이동합니다. 그런 다음 *댓글 사용* 확인란을 선택하고 *업데이트*를 클릭합니다.
```

### 선택

{bdg-secondary}`라이프레이용 7.3`

선택 패널(![Selection](../../../images/icon-pages-tree.png))에서 모든 페이지 요소의 계층적 개요를 볼 수 있을 뿐만 아니라 해당 요소를 선택, 구성 또는 제거할 수 있습니다. 마찬가지로 디자인 모드에서 페이지의 요소를 클릭하면 선택 패널이 열리고 계층 구조에서 선택한 페이지 요소가 강조 표시됩니다. 요소를 선택하면 일반, 스타일 및 링크 옵션(있는 경우)에 액세스할 수 있습니다. 자세한 내용은 [프래그먼트 구성](../page-fragments-and-widgets/using-fragments/configuring-fragments.md) 참조하십시오.

![선택 항목은 페이지와 콘텐츠의 계층 구조를 보여줍니다.](./content-page-editor-ui-reference/images/06.png)

```{note}
페이지의 머리글 및 바닥글은 [마스터 페이지 템플릿](../defining-headers-and-footers/master-page-templates.md)에서만 수정할 수 있으므로 선택 패널 계층 구조에 나열되지 않습니다.
```

### 컨텐츠

{bdg-secondary}`라이프레이용 7.3`

콘텐츠 패널(![Contents](../../../images/icon-list-ul.png))에서 페이지의 모든 웹 콘텐츠를 보고 편집하고 관리할 수 있습니다. 여기에는 위젯에 표시되고 콘텐츠 필드에 매핑된 콘텐츠가 포함됩니다. 자세한 내용은 [콘텐츠 페이지의 콘텐츠 관리](./managing-content-in-content-pages.md) 참조하십시오.

## 추가 정보

- [콘텐츠 페이지 사용](../using-content-pages.md)
- [콘텐츠 페이지에 요소 추가](./adding-elements-to-content-pages.md)
- [조각 사용](../page-fragments-and-widgets/using-fragments/configuring-fragments.md)
