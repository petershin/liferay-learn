# 개체 항목 표시

{bdg-secondary}`liferay 7.4+`

Liferay 개체를 사용하면 기존 DXP 프레임워크를 사용하여 사이트에 개체 항목을 동적으로 표시할 수 있습니다. 여기에는 여러 항목에 대한 컬렉션 표시와 개별 항목에 대한 표시 페이지가 포함됩니다.

개체가 게시되면 Liferay는 [컬렉션 표시 조각](../../site-building/displaying-content/collections-and-collection-pages/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) 과 함께 사용할 컬렉션 공급자를 생성하여 여러 개체 항목을 표시합니다. 컬렉션의 스타일을 지정하고 필터링하고 페이지를 매기도록 조각을 구성할 수도 있습니다. 자세한 내용은 [컬렉션 공급자를 사용하여 개체 항목 표시](./displaying-object-entries-with-collection-providers.md) 참조하세요.

게시된 개체는 Info 프레임워크와 통합되므로 이를 [표시 페이지 템플릿](../../site-building/displaying-content/using-display-page-templates.md) 의 콘텐츠 유형으로 선택할 수 있습니다. 선택하면 개체가 템플릿의 매핑 소스로 설정되므로 조각 필드를 개체 필드에 쉽게 매핑하여 개별 개체 항목에 대한 유연한 페이지 표시를 만들 수 있습니다.

또한 FreeMarker를 사용하여 객체 [에 대한](#creating-information-templates-for-objects) 정보 템플릿을 생성할 수 있습니다. 생성된 후에는 조각 필드를 템플릿에 매핑하여 콘텐츠 페이지 및 표시 페이지에서 항목이 렌더링되는 방식을 결정할 수 있습니다.

```{note}
정보 템플릿은 콘텐츠 표시 조각 및 개체에 매핑될 수 있는 [하위 요소](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md) (예: 텍스트, 서식 있는 텍스트)가 있는 기타 조각에서 사용할 수 있습니다.
```

이러한 통합을 통해 사용자는 Liferay의 WYSIWYG 페이지 구축 기능을 활용하는 동시에 개인화된 사용자 경험을 제공할 수 있습니다.

## 개체에 대한 표시 페이지 템플릿 만들기

생성되면 각 객체 항목에는 `server-address/l/objectEntryId`(예: `https://mysite.com/l/44337`) 패턴을 사용하는 친숙한 전용 URL이 자동으로 할당됩니다. 해당 URL에서 항목을 보려면 먼저 개체에 대한 표시 페이지 템플릿을 만들어야 합니다.

다음과 같이하세요:

1. _사이트 메뉴_(![사이트 메뉴](../../images/icon-menu.png))를 열고 _디자인_을 확장한 다음 _페이지 템플릿_으로 이동합니다.

1. _표시 페이지 템플릿_ 탭을 클릭합니다.

1. _추가_ 버튼(![추가 버튼](../../images/icon-add.png))을 클릭하고 _빈_ 템플릿을 선택합니다.

   그러면 모달 창이 열립니다.

1. _이름_을 입력하고 콘텐츠 유형으로 원하는 _개체_를 선택하세요.

   ![Enter a name and select the desired Object for Content Type](./displaying-object-entries/images/01.png)

1. _저장_을 클릭하세요.

   그러면 선택한 개체를 기본 매핑 소스로 사용하여 빈 템플릿이 생성되고 템플릿 편집 페이지로 리디렉션됩니다.

1. 페이지 조각과 위젯을 사용하여 개체 항목에 대한 유연하고 동적인 디스플레이를 만듭니다. 자세한 내용은 [표시 페이지 템플릿 사용](../../site-building/displaying-content/using-display-page-templates.md) 참조하십시오.

   ![Map fragment elements to Object fields to dynamically populate Display Pages for individual entries.](./displaying-object-entries/images/02.png)

1. 최종 사용자가 항목 표시 페이지에 댓글을 달 수 있도록 페이지 댓글 위젯을 추가합니다.

   ```{note}
   객체 정의에 대한 설명을 활성화해야 합니다. 그렇지 않으면 위젯이 표시 페이지에서 숨겨집니다.
   ```

1. 완료되면 _게시_를 클릭하세요.

1. 템플릿에 대한 _작업_ 버튼(![작업 버튼](../../images/icon-actions.png))을 클릭하고 _기본값으로 표시_를 선택합니다.

   이제 이 템플릿은 사용자가 친숙한 URL을 방문할 때마다 개체 항목을 렌더링하는 데 사용됩니다.

   ![Click the Actions button for the template and select Mark as Default.](./displaying-object-entries/images/03.png)

### 댓글 활성화

1. _전역 메뉴_(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 _제어판_ 탭으로 이동한 다음 _개체_를 클릭합니다.

1. 객체 정의를 편집합니다.

1. 세부정보 탭에서 댓글을 활성화하고 _저장_을 클릭하세요.

   ![Enable comments.](./displaying-object-entries/images/04.png)

## 객체에 대한 정보 템플릿 생성

1. _사이트 메뉴_(![사이트 메뉴](../../images/icon-product-menu.png))를 열고 _디자인_ &rarr; _템플릿_ &rarr; _정보 템플릿_으로 이동합니다.

1. _추가_(![추가 버튼](../../images/icon-add.png))를 클릭합니다.

1. _이름_을 입력하고 원하는 _개체_를 선택하세요.

   ![Enter a name and select the desired Object.](./displaying-object-entries/images/05.png)

1. _저장_을 클릭하세요. 그러면 템플릿 디자인 페이지로 리디렉션됩니다.

1. (선택 사항) 애플리케이션 표시줄에서 작업(![작업 버튼](../../images/icon-actions.png))을 클릭하고 _스크립트 가져오기_를 선택한 다음 가져올 `.ftl` 파일을 선택합니다. 그러면 현재 템플릿이 파일의 FreeMarker 스크립트로 대체됩니다.

   ![Import script from an .ftl file.](./displaying-object-entries/images/06.png)

1. [FreeMarker](https://freemarker.apache.org) 사용하여 템플릿을 디자인하세요.

   _요소_ 측면 패널(![요소](../../images/icon-list-ul.png))에서는 선택한 개체 구조에서 사용 가능한 필드에 액세스할 수 있습니다.

   ![Select from available fields in the Object's structure.](./displaying-object-entries/images/07.png)

1. (선택 사항) 속성 측면 패널(![속성](../../images/icon-cog3.png))에서 템플릿에 설명이나 이미지를 추가합니다.

   ![Add a description or image in the Properties panel.](./displaying-object-entries/images/08.png)

1. 완료되면 _저장_을 클릭하세요.

이제 개체 항목을 조각 필드에 매핑할 때 템플릿에서 선택할 수 있습니다.

![Select the template when mapping fragment elements.](./displaying-object-entries/images/09.png)

## 탐색 메뉴에 항목 추가

개체는 정보 프레임워크와 통합되므로 탐색 메뉴에 개체 항목을 추가하여 빠른 액세스를 제공할 수 있습니다. 게시된 모든 개체는 자동으로 메뉴 요소에 사용 가능한 소스로 표시됩니다. 자세한 내용은 [탐색 메뉴 응용 프로그램 사용](../../site-building/site-navigation/using-the-navigation-menus-application.md) 을 참조하십시오.

## 관련 주제

* [객체 생성](./creating-and-managing-objects/creating-objects.md) 
* [컬렉션 공급자를 사용하여 개체 항목 표시](./displaying-object-entries-with-collection-providers.md) 
* [컬렉션 및 컬렉션 페이지 정보](../../site-building/displaying-content/collections-and-collection-pages/about-collections-and-collection-pages.md) 
* [표시 페이지 템플릿 사용](../../site-building/displaying-content/using-display-page-templates.md) 
