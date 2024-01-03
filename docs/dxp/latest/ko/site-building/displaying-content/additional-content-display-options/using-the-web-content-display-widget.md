# 웹 콘텐츠 표시 위젯 사용

[웹 콘텐츠 기사](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md) 을 생성한 후 이를 표시하는 가장 빠른 방법은 웹 콘텐츠 표시 위젯입니다. 웹 콘텐츠 기사가 표시되면 업데이트를 검토하고 승인하도록 워크플로 [작업 흐름](../../../process-automation/workflow/introduction-to-workflow.md) 구성하지 않는 한 콘텐츠 업데이트가 즉시 나타납니다.

## 페이지에 웹 콘텐츠 표시 추가

1. _사이트 메뉴_( ![사이트 메뉴](../../../images/icon-product-menu.png) )로 이동하여 _사이트 빌더_ &rarr; _페이지_로 이동합니다.

1. 편집하려는 페이지 옆에 있는 _작업_( ![작업](../../../images/icon-actions.png) )을 클릭하고 _편집_을 선택합니다(또는 [새 콘텐츠 페이지 만들기).](../../creating-pages/adding-pages/adding-a-page-to-a-site.md) .)

1. _추가_( ![위젯 아이콘 추가](../../../images/icon-add-widget.png) )를 클릭하여 조각 및 위젯 패널을 엽니다.

1. 위젯 탭의 _콘텐츠 관리_ 카테고리 아래에서 _웹 콘텐츠 표시_ 위젯을 페이지의 원하는 사이트
로 드래그하세요.

   ![Drag-and-drop the web content display widget onto the page](./using-the-web-content-display-widget/images/01.png)

1. 위젯 &rarr; _구성_ 오른쪽 상단에 있는 _옵션_( ![옵션 아이콘](../../../images/icon-app-options.png) )을 클릭합니다.

   ![Open the configuration options for the Web Content Display widget](./using-the-web-content-display-widget/images/02.gif)

1. 웹 콘텐츠 표시 구성에서 설정 탭 아래의 _선택_을 클릭하세요.

1. 웹 콘텐츠 선택 대화 상자에서 추가하려는 웹 콘텐츠를 클릭합니다.

   폴더를 사용하여 콘텐츠를 구성하면 폴더를 탐색하여 사용 가능한 모든 콘텐츠를 시각화할 수 있습니다. 탐색에 도움이 되도록 폴더 및 콘텐츠 섹션 위의 탐색경로를 사용하세요.

   ![When you organize your web content using folders, view all available content by navigating throught the folders.](./using-the-web-content-display-widget/images/03.png)

   ```{tip}
   검색창을 이용하여 모든 콘텐츠(*)를 검색하실 수 있습니다. 그러면 사이트에서 사용 가능한 모든 폴더와 웹 콘텐츠가 포함된 목록이 반환됩니다.
   ```

1. 선택적 [웹 콘텐츠 표시 옵션 설정](#web-content-display-setup-options) .

1. _저장_을 클릭하고 웹 콘텐츠 디스플레이 구성 대화 상자를 닫습니다.

1. 콘텐츠 페이지를 게시하려면 _게시_를 클릭하세요.

## 웹 콘텐츠 표시 위젯에서 범위 사용

웹 콘텐츠 표시 위젯을 페이지에 추가한 후 해당 범위를 설정하여 위젯에 표시할 수 있는 콘텐츠를 찾을 수 있는 사이트와 라이브러리를 정의할 수 있습니다. 범위에 대한 자세한 내용은 [위젯 범위 설정](../../creating-pages/page-fragments-and-widgets/using-widgets/configuring-widgets/setting-widget-scopes.md) 참조하세요.

1. 위젯 &rarr; _구성_ 오른쪽 상단에 있는 _옵션_( ![옵션 아이콘](../../../images/icon-app-options.png) )을 클릭합니다.

1. 웹 콘텐츠 표시 구성의 탭에서 _범위_를 클릭합니다.

1. _Liferay DXP_를 클릭하여 범위 메뉴를 엽니다. 여기에서 위젯에 대해 원하는 범위를 선택할 수 있습니다. _저장_을 클릭하세요.

1. 탭에서 _설정_을 클릭하세요.

1. _선택_을 클릭하여 웹 콘텐츠 선택 메뉴를 엽니다.

1. 탐색경로 메뉴에서 _사이트 및 라이브러리_를 클릭합니다.

![Click on Sites and Libraries option in the breadcrumb menu.](./using-the-web-content-display-widget/images/07.png)

표시할 수 있는 콘텐츠는 선택한 범위에 따라 정의됩니다.

  ```{note}
   Liferay DXP 7.3 이하의 경우 웹 콘텐츠 표시 위젯의 범위를 선택해도 위젯에 표시할 수 있는 콘텐츠에는 영향이 없습니다.
   ```

## 웹 콘텐츠 표시 설정 옵션

웹 콘텐츠를 선택한 경우 웹 콘텐츠 표시 위젯에서 다른 옵션을 구성할 수 있습니다.

위젯 구성에 액세스하려면 웹 콘텐츠 표시 위젯 위에 마우스를 놓고 위젯의 _옵션_( ![옵션 아이콘](../../../images/icon-widget-options.png) )에서 다음을 선택하세요. _구성_. 구성 옵션은 설정 탭 아래에 나타납니다.

![Configuration options for the web content display](./using-the-web-content-display-widget/images/04.png)

### 템플렛

| 옵션         | 묘사                                                       |
| :--------- | :------------------------------------------------------- |
| 기본 템플릿 사용  | 기본 템플릿을 사용하여 위젯을 표시합니다. 여기에서 사용 중인 기본 템플릿의 이름을 볼 수 있습니다. |
| 지정된 템플릿 사용 | 다른 템플릿을 사용하여 위젯을 표시하려면 이 옵션을 선택합니다. 새 템플릿을 선택해야 합니다.     |

### 사용자 도구

| 옵션                       | 묘사                                                                                                                                                                        |
| :----------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 통역                       | 콘텐츠에 대한 추가 번역을 표시합니다. 콘텐츠를 다른 언어로 번역한 경우 이 옵션을 사용하여 원하는 번역을 표시하세요.                                                                                                        |
| 출력                       | 인쇄에 적합한 버전의 콘텐츠가 포함된 인쇄 대화 상자를 제공합니다.                                                                                                                                     |
| PDF, DOC, ODT, TXT로 다운로드 | 선택한 위젯 콘텐츠를 원하는 형식으로 다운로드합니다. 이 옵션은 [OpenOffice 또는 LibreOffice 통합](#integrating-open-office-or-libre-office-with-the-web-content-display) 을 구성한 후에만 사용할 수 있습니다. |

### 콘텐츠 메타데이터

| 옵션    | 묘사                                                                                                                                                                                                                                                 |
| :---- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 관련 애셋 | 다른 관련 콘텐츠에 대한 링크를 표시하려면 이 옵션을 설정하세요. 콘텐츠에 대한 관련 자산 속성에서 관련 콘텐츠를 구성합니다(기본 웹 콘텐츠 자산에 대한 예는 아래 이미지 참조).                                                                                                                            |
| 등급    | 사용자가 다양한 방식(좋아요, 별표, 추천)으로 콘텐츠를 평가할 수 있는 클릭 가능한 옵션을 표시합니다. 다양한 콘텐츠 유형에 대해 이 등급 옵션을 구성하려면 [콘텐츠 등급 유형 구성](../../../site-building/site-settings/site-content-configurations/configuring-content-rating-type.md) 을 참조하세요. |
| 댓글    | 사용자가 웹 콘텐츠 표시 위젯의 콘텐츠에 대한 설명을 입력할 수 있습니다. 기본적으로 게스트는 댓글을 남길 수 없습니다. 기본 옵션을 변경하려면 [게스트](#enabling-comments-for-guests) 에 대한 설명 활성화를 참조하십시오.                                                                                              |
| 댓글 평가 | 댓글에 대한 평가 옵션을 표시합니다.                                                                                                                                                                                                                               |

![Configuring related assets for a basic web content entry](./using-the-web-content-display-widget/images/05.png)

### 조회수 증가분

이 웹 콘텐츠 표시 위젯에 조회수 카운터를 추가하려면 _조회수 증가_ 옵션을 활성화하세요.

## 웹 콘텐츠 표시 위젯에 대한 추가 옵션

[설정 옵션](#web-content-display-setup-options) 외에도 웹 콘텐츠 표시 위젯에서 추가 설정을 구성할 수 있습니다.

### 손님에 대한 설명 활성화

기본적으로 게스트는 웹 콘텐츠에 댓글을 남길 수 없습니다. 손님이 귀하의 웹 콘텐츠 기사에 댓글을 달 수 있도록 허용하려면 다음 단계를 따르세요.

1. [전역 메뉴](../../../getting-started/navigating-dxp.md) ( ![전역 메뉴 아이콘](../../../images/icon-applications-menu.png) )을 열고 _제어판_ &rarr; _사용자_ &rarr; _역할_로 이동합니다.

1. _Guest_ 역할을 클릭합니다.

1. _권한 정의_ 열을 클릭합니다.

1. 왼쪽 메뉴에서 _사이트 및 자산 라이브러리 관리_ &rarr; _콘텐츠 및 데이터_ &rarr; _웹 콘텐츠_를 선택합니다.

1. _웹 콘텐츠 기사_ 섹션에서 _토론 추가_를 선택하세요.

1. _저장_을 클릭하세요.

### 웹 콘텐츠 표시 위젯에서 콘텐츠 편집

편집 모드에서 콘텐츠 페이지 작업을 할 때 웹 콘텐츠 표시 위젯에서 게시된 콘텐츠를 직접 편집할 수 있습니다.

1. 웹 콘텐츠 표시 위젯을 클릭하세요.

1. 왼쪽 사이드바 패널에서 _페이지 콘텐츠_( ![페이지 콘텐츠 아이콘](../../../images/icon-paperclip.png) )를 클릭합니다.

1. 편집하려는 콘텐츠에 대해 _작업_( ![액션](../../../images/icon-actions.png) )을 클릭하고 _편집_을 선택합니다.

   ![Open the editing options for the web content display widget](./using-the-web-content-display-widget/images/06.png)

### OpenOffice 또는 LibreOffice를 웹 콘텐츠 디스플레이와 통합

라이프레이 포털 인스턴스에서 [오픈오피스/리브레오피스 통합 활성화](../../../content-authoring-and-management/documents-and-media/devops/enabling-openoffice-libreoffice-integration.md)를 활성화하면 콘텐츠에 대한 문서 변환을 활성화할 수 있습니다. 이 통합을 통해 사용자는 다양한 형식으로 콘텐츠를 다운로드할 수 있습니다. 웹 콘텐츠 표시 위젯의 [사용자 도구](#user-tools) 구성에서 사용 가능한 형식을 선택해야 합니다.

## 관련 주제

- [기본 웹 콘텐츠 기사 추가](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)
- [위젯 범위 설정](../../creating-pages/page-fragments-and-widgets/using-widgets/configuring-widgets/setting-widget-scopes.md)
- [콘텐츠 페이지 사용하기](../../../site-building/creating-pages/using-content-pages.md)
- [디스플레이 페이지 템플릿에 콘텐츠 표시](../using-display-page-templates.md)
- [자산 표시](../using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md)
