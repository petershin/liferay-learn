# 자산 라이브러리 콘텐츠

{bdg-secondary}`liferay DXP/포탈 7.3+`

자산 라이브러리는 Liferay 사이트 전체에서 콘텐츠를 공유하는 편리한 방법을 제공하는 동시에 콘텐츠 협업을 간소화하고 데이터 복제 위험을 줄입니다. 자산 라이브러리의 콘텐츠를 추가하고, 보고, 관리하려면 먼저 라이브러리의 메뉴 페이지로 이동하세요.

1. _전역 메뉴_(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 _응용 프로그램_ 탭을 클릭한 다음 _자산 라이브러리_를 클릭합니다.

1. 원하는 자산 라이브러리의 _이름_을 클릭하세요.

여기에서 도서관의 활성 애플리케이션에 액세스하여 콘텐츠를 생성하고 관리할 수 있습니다. 또한 스테이징을 활성화하고, 사용자 정의 워크플로우를 구현하고, 태그 및 카테고리를 사용하여 콘텐츠를 분류하고, 컬렉션을 생성하는 등의 작업을 수행할 수 있습니다. <!--TASK: document Collections and Workflow for Asset Libraries-->

![Click on the desired Asset Library's name to access its menu page.](./asset-library-content/images/01.png)

## 콘텐츠 제작

자산 라이브러리에서 콘텐츠를 생성하려면 먼저 라이브러리 메뉴 페이지로 이동하여 원하는 애플리케이션을 클릭하세요. 여기에서 콘텐츠를 생성하는 것은 기본적으로 사이트에서 콘텐츠를 생성하는 것과 동일합니다. 유일한 차이점은 범위와 기본 테마 설정입니다.

각 유형의 콘텐츠 생성에 대한 자세한 내용은 [콘텐츠 제작 및 관리](../../content-authoring-and-management.html) 기사를 참조하세요.

```{note}
활성 응용 프로그램만 라이브러리 메뉴 페이지에 나타납니다. 애플리케이션을 활성화하거나 비활성화하려면 [자산 라이브러리 구성](./creating-and-managing-asset-libraries.md#configuring-asset-libraries) 참조하세요.
```

## 사이트에서 콘텐츠 사용

자산 라이브러리에 콘텐츠를 추가하면 연결된 [개의 사이트](./creating-and-managing-asset-libraries.md#sites) 에서 해당 콘텐츠에 액세스하고 디스플레이 페이지 템플릿, 조각, 위젯 등을 사용하여 표시할 수 있습니다.

```{note}
Liferay 7.4 U21+ 및 GA21+의 경우 항목 선택기를 사용하여 자산 라이브러리에서 웹 콘텐츠, 문서 및 미디어, 블로그를 찾아볼 수 있습니다.
```

사이트에서 항목 선택기를 사용하면 연결된 자산 라이브러리에서 콘텐츠를 찾아볼 수 있습니다. 이렇게 하려면 항목 선택기 창을 열고 이동 경로를 사용하여 _사이트 및 라이브러리_로 이동하세요.

![Use the breadcrumb to navigate to Sites and Libraries](./asset-library-content/images/02.png)

여기에서 _자산 라이브러리_ 탭을 클릭하고 연결된 자산 라이브러리를 선택할 수 있습니다. 선택한 후에는 해당 콘텐츠를 찾아보고 원하는 자산을 선택할 수 있습니다.

![Click to the Asset Library tab and select a connected library.](./asset-library-content/images/03.png)

또는 _Everywhere_의 콘텐츠를 포함하도록 항목 선택기 창을 필터링할 수 있습니다. 그러면 사이트와 사용 가능한 자산 라이브러리 콘텐츠가 모두 표시됩니다.

![Filter content in the Item Selector to include content from Everywhere.](./asset-library-content/images/04.png)

자산 게시자 위젯을 사용하여 콘텐츠를 게시하는 경우 특정 자산 라이브러리의 콘텐츠를 포함하도록 범위를 설정해야 합니다. 그런 다음 사용하려는 콘텐츠를 선택하세요.

![Set the Asset Publisher's scope to include content from a specific Asset Library.](./asset-library-content/images/05.png)

사이트에서 콘텐츠를 사용하는 방법에 대한 자세한 내용은 [콘텐츠 표시](../../site-building/displaying_content.html) 설명서를 참조하세요.

```{note}
사이트와 달리 표시 페이지 템플릿은 자산 라이브러리에서 정의할 수 없습니다. 대신 자산 라이브러리 콘텐츠는 해당 콘텐츠 유형에 대한 각 사이트의 기본 표시 페이지 템플릿을 사용하여 표시됩니다.
```

## 콘텐츠 준비

자산 라이브러리는 [로컬 라이브](../../site-building/publishing-tools/staging/configuring-local-live-staging.md) 과 [원격 라이브](../../site-building/publishing-tools/staging/configuring-remote-live-staging.md) 스테이징을 모두 지원합니다. 이는 변경 사항을 적용하기 전에 웹 컨텐츠 또는 문서 및 미디어 애플리케이션에서 자산을 추가, 제거 및 편집하기 위한 작업 환경을 제공합니다. 준비된 콘텐츠 옵션은 자산 라이브러리에 대해 활성화된 애플리케이션으로 제한됩니다. 활성화되면 라이브러리를 준비 활성화 사이트에 연결할 수 있습니다.

자세한 내용은 [자산 라이브러리와 함께 스테이징 사용](../../site-building/publishing-tools/staging/using-staging-in-asset-libraries.md) 참조하십시오.

## 콘텐츠 분류

태그 및 카테고리 애플리케이션은 모든 자산 라이브러리에 대해 활성화됩니다. 액세스하려면 라이브러리의 메뉴 페이지로 이동하여 분류 아래에서 _태그_ 또는 _카테고리_를 클릭하세요. 자산 라이브러리에서 생성된 태그는 해당 라이브러리로 범위가 지정되며 해당 컨텍스트에서만 보고 적용할 수 있습니다. 그러나 자산 라이브러리에 정의된 어휘 및 범주는 연결된 모든 사이트에서 즉시 사용할 수 있습니다.

```{note}
자산 라이브러리에서 생성된 경우 연결된 사이트에서 어휘 및 카테고리를 편집하거나 제거할 수 없습니다. 해당 항목이 생성된 자산 라이브러리에서만 수정할 수 있습니다. 
```

이러한 애플리케이션 사용에 대한 자세한 내용은 [태그 및 카테고리](../tags_and_categories.html) 설명서를 참조하세요.

## 콘텐츠 내보내기 및 가져오기

자산 라이브러리 콘텐츠를 LAR 파일로 내보내고 가져올 수 있습니다. 라이브러리에 대한 새 내보내기/가져오기 프로세스를 시작하려면 대시보드로 이동하여 페이지 하단에서 _내보내기_ 또는 _가져오기_를 클릭하세요. 그런 다음 _추가_ 버튼(![추가 버튼](../../images/icon-add.png))을 클릭하여 새 프로세스를 시작합니다.

라이브러리 컨텐츠 내보내기 및 가져오기는 사이트 자산과 동일한 프로세스를 따릅니다. 응용 프로그램 표시줄에서 _작업_ 버튼( ![작업 버튼](../../images/icon-actions.png) )을 클릭하고 _템플릿 내보내기_를 선택하여 사용자 정의 내보내기 템플릿을 만들고 사용할 수도 있습니다. 자세한 내용은 [사이트 페이지 및 콘텐츠 내보내기/가져오기](../../site-building/sites/exporting-importing-site-pages-and-content.md) 참조하세요.

## 콘텐츠 삭제

자산 라이브러리는 [휴지통](../recycle-bin/configuring-the-recycle-bin.md) 애플리케이션을 지원합니다. 활성화되면 라이브러리에서 제거된 모든 콘텐츠가 일시적으로 휴지통에 저장됩니다. 기본적으로 재활용 콘텐츠는 43200분(예: 30일) 동안 보관되지만 각 자산 라이브러리 설정에서 이 기간을 조정할 수 있습니다. 할당된 시간보다 오랫동안 휴지통에 있던 재활용 콘텐츠는 인스턴스에서 자동으로 삭제됩니다.

또는 재활용된 콘텐츠를 수동으로 삭제하거나 자산의 _작업_ 버튼( ![작업 버튼](../../images/icon-actions.png))을 통해 자산 라이브러리에 복원할 수 있습니다.

![Manually delete recycled content or restore it to your Asset Library.](./asset-library-content/images/06.png)

자세한 내용은 [휴지통 개요](../recycle-bin/recycle-bin-overview.md) 참조하세요.

## 관련 주제

* [자산 라이브러리 개요](./asset-libraries-overview.md) 
* [자산 라이브러리 생성 및 관리](./creating-and-managing-asset-libraries.md) 
