# 웹 콘텐츠 표시 위젯 사용

[웹 콘텐츠 기사](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)을 생성한 후 이를 페이지에 표시하는 가장 빠른 방법은 웹 콘텐츠 표시 위젯입니다. 웹 콘텐츠 기사가 표시되면 업데이트를 검토하고 승인하도록 [워크플로우](../../../process-automation/workflow/introduction-to-workflow.md) 를 구성하지 않는 한 콘텐츠 업데이트가 즉시 나타납니다.

## 페이지에 웹 콘텐츠 표시 추가

1. 사이트 메뉴에서 **Site Builder** &rarr; **Pages** 로 이동합니다.
1. 편집하려는 페이지 옆에 있는 **작업**(![Actions](../../../images/icon-actions.png)) 버튼을 클릭하고 **편집**(또는 [새 콘텐츠 페이지 만들기](../../creating-pages/adding-pages/adding-a-page-to-a-site.md).)를 선택합니다.
1. 콘텐츠 페이지 사이드바에서 **조각 및 위젯** 버튼을 선택합니다.
1. **Fragments** 탭을 선택하고 **Web Content Display** 위젯을 페이지로 끌어다 놓습니다.

    ![Web Content Display 위젯을 페이지로 끌어다 놓습니다.](./using-the-web-content-display-widget/images/04.png)

1. 웹 콘텐츠 표시 위젯 위로 마우스를 이동하고 위젯의 **작업**(![Actions](../../../images/icon-widget-options.png)) 메뉴에서 **구성** 를 선택합니다.

    ![웹 콘텐츠 표시 위젯에 대한 구성 옵션을 엽니다.](./using-the-web-content-display-widget/images/05.gif)

1. **Web Content Display Configuration** 에서 **Setup** 탭 아래의 **Select** 을 클릭합니다.
1. **웹 콘텐츠 선택** 대화 상자에서 추가할 웹 콘텐츠를 클릭합니다.
1. 설정 옵션 [웹 콘텐츠 표시 옵션](#web-content-display-setup-options) .
1. **저장** 을 클릭하고 **웹 콘텐츠 디스플레이 구성** 대화 상자를 닫습니다.
1. 콘텐츠 페이지를 게시하려면 **게시** 을 클릭합니다.

## 웹 콘텐츠 표시 설정 옵션

웹 콘텐츠 표시 위젯에서 다른 옵션을 구성할 수 있습니다. 위젯의 구성에 액세스하려면 웹 컨텐츠 표시 위젯 위로 마우스를 이동하고 위젯의 **조치**(![Actions](../../../images/icon-widget-options.png)) 메뉴에서 **구성** 을 선택하십시오. **설정** 탭에서 구성 옵션을 찾을 수 있습니다.

![웹 콘텐츠 표시에 대한 구성 옵션](./using-the-web-content-display-widget/images/07.png)

### 템플렛

| 옵션         | 묘사                                                       |
|:---------- |:-------------------------------------------------------- |
| 기본 템플릿 사용  | 기본 템플릿을 사용하여 위젯을 표시합니다. 여기에서 사용 중인 기본 템플릿의 이름을 볼 수 있습니다. |
| 지정된 템플릿 사용 | 다른 템플릿을 사용하여 위젯을 표시하려면 이 옵션을 선택합니다. 새 템플릿을 선택해야 합니다.     |

### 사용자 도구

| 옵션                       | 묘사                                                                                                                                                             |
|:------------------------ |:-------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 통역                       | 콘텐츠에 대한 추가 번역을 표시합니다. 콘텐츠를 다른 언어로 번역한 경우 이 옵션을 사용하여 원하는 번역을 표시합니다.                                                                                             |
| 출력                       | 인쇄용 버전의 콘텐츠가 포함된 인쇄 대화 상자를 제공합니다.                                                                                                                              |
| PDF, DOC, ODT, TXT로 다운로드 | 선택한 위젯 콘텐츠를 선택한 형식으로 다운로드합니다. 이 옵션은 [OpenOffice 또는 LibreOffice 통합](#integrating-open-office-or-libre-office-with-the-web-content-display) 을 구성한 후에만 사용할 수 있습니다. |

### 콘텐츠 메타데이터

| 옵션    | 묘사                                                                                                                                                                                                                     |
|:----- |:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 관련 애셋 | 다른 관련 콘텐츠에 대한 링크를 표시하려면 이 옵션을 설정합니다. 콘텐츠에 대한 **관련 자산** 속성에서 관련 콘텐츠를 구성합니다(기본 웹 콘텐츠 자산에 대한 예는 아래 이미지 참조).                                                                                                                 |
| 등급    | 사용자가 다양한 방식(좋아요, 별표, 좋아요)으로 콘텐츠를 평가할 수 있는 클릭 가능한 옵션을 표시합니다. 다양한 콘텐츠 유형에 대해 이 등급 옵션을 구성하려면 [콘텐츠 등급 유형 구성](../../../site-building/site-settings/site-content-configurations/configuring-content-rating-type.md)을 참조하십시오. |
| 댓글    | 사용자가 웹 콘텐츠 표시 위젯의 콘텐츠에 대한 설명을 입력할 수 있습니다. 기본적으로 게스트는 댓글을 남길 수 없습니다. 기본 옵션을 변경하려면 [게스트](#enabling-comments-for-guests) 에 대한 설명 활성화를 참조하십시오.                                                                             |
| 댓글 평가 | 댓글에 대한 평가 옵션을 표시합니다.                                                                                                                                                                                                   |

![기본 웹 콘텐츠 항목에 대한 관련 자산 구성](./using-the-web-content-display-widget/images/06.png)

### 조회수 증가분

**조회수 증분** 옵션을 활성화하여 이 웹 콘텐츠 표시 위젯에 조회수 카운터를 추가합니다.

## 웹 콘텐츠 표시 위젯에 대한 추가 옵션

[설정 옵션](#web-content-display-setup-options) 외에도 Web Content Display Widget에서 추가 설정을 구성할 수 있습니다.

### 손님을 위한 댓글 활성화

기본적으로 게스트는 웹 콘텐츠에 댓글을 남길 수 없습니다. 게스트가 웹 콘텐츠 기사에 댓글을 달 수 있도록 하려면 다음 단계를 따르세요.

1. [글로벌 메뉴](../../../getting-started/navigating-dxp.md) (![Global Menu icon](../../../images/icon-applications-menu.png))을 열고 **제어판** &rarr; **사용자** &rarr; **역할** 으로 이동합니다.
1. **게스트** 롤을 클릭합니다.
1. **권한 정의** 열을 클릭합니다.
1. 왼쪽 메뉴에서 **사이트 및 자산 라이브러리 관리** &rarr; **콘텐츠 & 데이터** &rarr; **웹 콘텐츠** 을 선택합니다.
1. **웹 콘텐츠 기사** 섹션에서 **토론 추가** 을 확인합니다.
1. **저장** 을 클릭합니다.

### 웹 콘텐츠 표시 위젯에서 콘텐츠 편집

편집 모드에서 콘텐츠 페이지로 작업할 때 웹 콘텐츠 표시 위젯에서 게시된 콘텐츠를 직접 편집할 수 있습니다.

1. 웹 콘텐츠 표시 위젯을 클릭합니다.
1. 사이드바 패널에서 **콘텐츠**(![Contents](../../../images/icon-list-ul.png)) 버튼을 클릭합니다.
1. **Contents** 아래에서 편집할 내용에 대해 **Actions**(![Actions](../../../images/icon-actions.png)) 버튼을 클릭합니다.
1. **편집** 을 선택합니다.

    ![Web Content Display 위젯의 편집 옵션 열기](./using-the-web-content-display-widget/images/08.png)

### OpenOffice 또는 LibreOffice를 Web Content Display와 통합

Liferay Portal에서 [OpenOffice 또는 LibreOffice 통합을 활성화](../../../content-authoring-and-management/documents-and-media/devops/enabling-openoffice-libreoffice-integration.md)하는 경우 예를 들어 콘텐츠에 대한 문서 변환을 활성화할 수 있습니다. 이 통합을 통해 사용자는 다양한 형식으로 콘텐츠를 다운로드할 수 있습니다. 웹 콘텐츠 표시 위젯에 대한 [**사용자 도구**](#user-tools) 구성에서 사용 가능한 형식을 선택해야 합니다.

## 관련 정보

- [기본 웹 콘텐츠 기사 추가](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)
- [콘텐츠 페이지 사용](../../../site-building/creating-pages/using-content-pages.md)
- [디스플레이 페이지 템플릿에 콘텐츠 표시](../using-display-page-templates.md)
- [자산 표시](../using-the-asset-publisher-widget/displaying-assets-using-the-asset-publisher-widget.md)
