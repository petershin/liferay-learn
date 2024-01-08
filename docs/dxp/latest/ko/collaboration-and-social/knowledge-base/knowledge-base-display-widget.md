# 기술 자료 디스플레이 위젯

{bdg-secondary}`liferay 7.4 U72+/GA72+`

지식 베이스 표시 위젯을 사용하면 내장된 탐색, 댓글, 평가 및 소셜 미디어 링크가 있는 사이트 페이지에 게시된 기사를 표시할 수 있습니다. 기본적으로 이 위젯은 기술 자료 홈 폴더의 기사를 표시합니다. 포함할 기사를 사용자 정의할 수 있습니다.

조각 및 위젯 측면 패널의 **콘텐츠 관리** 에서 위젯을 찾을 수 있습니다.

![The Knowledge Base Display widget appears under Content Management in the widget menu.](./knowledge-base-display-widget/images/01.png)

## 위젯 구성

1. 기술 자료 표시 위젯이 포함된 페이지 편집을 시작합니다.

1. 위젯의 **옵션** 버튼(![옵션 버튼](../../images/icon-actions.png))을 클릭하고 **구성** 을 선택합니다.

   ![Click the Options button and select Configuration.](./knowledge-base-display-widget/images/02.png)

1. 설정 탭의 콘텐츠 선택 아래에서 **선택** 을 클릭하여 표시할 기사를 결정하세요.

   ![In the Setup tab, click Select under Content Selection  to determine which articles to display.](./knowledge-base-display-widget/images/03.png)

1. 개별 기사나 폴더에 대해 **선택** 을 클릭하세요.

   또는 **이 폴더 선택** 을 클릭하여 현재 폴더의 기사를 표시하세요.

   ![Click Select for the desired article or folder, or click Select this Folder to select the current folder.](./knowledge-base-display-widget/images/04.png)

1. 설정 및 활성화에서 위젯에 사용할 기능을 결정합니다. 옵션에는 다음이 포함됩니다.

   * 설명 활성
   * 등급을 가능하게 하십시요
   * 자산 항목 표시
   * 첨부 파일 표시
   * 관련 애셋 활성
   * 조회수 증가 활성
   * 구독 활성
   * 이력 활성
   * 인쇄를 가능하게 하십시오

   ![Determine which Knowledge Base features to use in the widget.](./knowledge-base-display-widget/images/05.png)

1. 소셜 북마크에서 포함할 소셜 미디어 링크와 표시 방법을 결정합니다.

   ![Determine which social media links to include and how to display them.](./knowledge-base-display-widget/images/06.png)

1. 섹션 선택기의 폴더에 접두사를 추가합니다.

   ![Add a prefix to folders in the section selector.](./knowledge-base-display-widget/images/07.png)

1. 최대 중첩 수준을 설정합니다. 이에 따라 기사 계층 구조가 표시되는 방식이 결정됩니다.

   ![Set a maximum nesting level.](./knowledge-base-display-widget/images/08.png)

   다음 계층 구조의 시나리오를 고려해보세요.

   ```
   제1조
   ├── 제1.1조
   │ ├── 제1.1.1
   │ └── 제1.1.2
   └── 제1.2
       ├── 제1.2.1
       └── 제1.2.2조
   ```

   최대 중첩 수준을 '3' 이상으로 설정하면 이러한 기사는 세 가지 수준으로 중첩되어 표시됩니다. 그러나 최대 중첩 수준을 '2'로 설정하면 기사가 두 가지 수준으로 표시됩니다.

   ```
   제1
   ├── 제1.1조
   ├── 제1.1.1
   ├── 제1.1.2
   ├── 제1.2
   ├── 제1.2.1
   └── 제1.2.2조
   ```

1. **저장** 을 클릭하세요.

## 위젯 기능 살펴보기

Knowledge Base Display의 탐색 메뉴와 표시 옵션은 전체 페이지 위젯에 적합한 후보입니다. 기사 폴더를 표시하는 경우 위젯 왼쪽의 탐색 기능에 해당 폴더의 모든 기사에 대한 링크가 표시됩니다. 기사가 [폴더](./managing-the-knowledge-base.md#adding-folders) 로 구성되어 있는 경우 이 위젯은 사용자에게 폴더 간 전환을 위한 선택기를 제공합니다.

![The navigation menu on the left shows you article links.](./knowledge-base-display-widget/images/09.png)

위젯 오른쪽의 보기 영역에는 폴더의 주요 기사가 표시됩니다. 탐색에서 기사를 클릭하면 보기 영역에 표시됩니다. 현재 표시된 기사의 링크는 탐색에서 굵게 표시됩니다. 기사 하단의 제안 섹션 앞에 있는 링크를 클릭하여 기사 간에 이동할 수도 있습니다.

![The navigation on the left and the article on the right are displayed.](./knowledge-base-display-widget/images/10.png)

기술 자료 표시에는 기사 계층 구조도 표시될 수 있습니다. 하위 기사가 있는 기사를 보면 탐색 트리가 확장되어 하위 기사에 대한 링크가 표시됩니다. 다른 최상위 기사를 볼 때 확장된 노드가 축소됩니다.

위젯 상단의 링크는 기사에 다음 작업을 표시합니다.

* 기술 자료의 RSS 피드를 구독하세요.
* 현재 기사를 구독하세요
* 현재 기사의 기록 보기
* 현재 기사 인쇄

관리자는 위젯 상단에 있는 추가 링크 세트에 액세스할 수 있습니다.

* 기사 편집
* 하위 기사 추가
* 기사를 이동하세요
* 기사 삭제

기사 콘텐츠 아래에는 추천/추천 아이콘을 표시하는 평가 인터페이스가 있습니다. 사용자는 기사 아래의 **제안 사항** 이 있습니까?라는 텍스트 상자에 제안이나 의견을 제출할 수도 있습니다. 관리자는 [제안을 보고 진행 상황을](./responding-to-knowledge-base-feedback.md) 로 표시할 수 있습니다.

관리자가 지식 베이스 소스 URL 기능을 활성화하고 기사에 할당된 소스 URL이 있는 경우 **GitHub에서 편집** 버튼(![GitHub 아이콘](./knowledge-base-display-widget/images/11.png)) 기사 제목 오른쪽에 나타납니다. 이 버튼은 GitHub의 기사 소스로 연결됩니다. 이 기능을 사용하면 사람들이 기사 수정이나 개선에 기여하도록 장려할 수 있습니다. 자세한 내용은 [지식 베이스 시스템 설정](./knowledge-base-system-settings.md) 을 참조하세요.

## 관련 주제

* [기술 자료 문서 작성](./creating-knowledge-base-articles.md) 
* [지식 베이스 관리](./managing-the-knowledge-base.md) 
* [기타 지식 베이스 위젯](./other-knowledge-base-widgets.md) 
