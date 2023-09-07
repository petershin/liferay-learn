# 개체 항목 표시

{bdg-secondary}`사용 가능 7.4 이상`

Liferay 객체를 사용하면 기존 DXP 프레임워크를 사용하여 사이트에 객체 항목을 동적으로 표시할 수 있습니다. 여기에는 여러 항목에 대한 컬렉션 표시와 개별 항목에 대한 표시 페이지가 포함됩니다.

객체가 게시되면 Liferay는 여러 객체 항목을 표시하기 위해 [컬렉션 디스플레이 조각(](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) )과 함께 사용할 컬렉션 공급자를 생성합니다. 컬렉션의 스타일을 지정하고, 필터링하고, 페이지 매김을 지정하도록 조각을 구성할 수도 있습니다. 자세한 내용은 [수집 제공업체를 통해 객체 항목 표시하기](./displaying-object-entries-with-collection-providers.md) 를 참조하세요.

또한 게시된 개체는 정보 프레임워크와 통합되므로 [페이지 템플릿 표시](../../site-building/displaying-content/using-display-page-templates.md)의 콘텐츠 유형으로 선택할 수 있습니다. 선택하면 객체가 템플릿의 매핑 소스로 설정되므로 조각 필드를 객체 필드에 쉽게 매핑하여 개별 객체 항목에 대한 유연한 페이지 표시를 만들 수 있습니다.

또한 FreeMarker를 사용하여 [객체에 대한 정보 템플릿](#creating-information-templates-for-objects) 을 만들 수 있습니다. 만든 후에는 조각 필드를 템플릿에 매핑하여 콘텐츠 페이지 및 표시 페이지에서 항목이 렌더링되는 방식을 결정할 수 있습니다.

```{note}
정보 템플릿은 콘텐츠 표시 조각 및 [sub-elements](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md)를 사용하여 개체에 매핑할 수 있는 기타 조각(예: 텍스트, 서식 있는 텍스트)에서 사용할 수 있습니다.
```

이러한 통합을 통해 사용자는 개인화된 사용자 경험을 제공하는 동시에 Liferay의 WYSIWYG 페이지 구축 기능을 활용할 수 있습니다.

## 개체에 대한 표시 페이지 템플릿 만들기

생성되면 각 객체 항목에는 다음 패턴을 사용하는 전용 친숙한 URL이 자동으로 할당됩니다: `서버 주소/l/objectEntryId` (예: `https://mysite.com/l/44337`). URL에서 항목을 보려면 먼저 객체에 대한 표시 페이지 템플릿을 만들어야 합니다.

다음 단계를 따르세요:

1. **사이트 메뉴**(![Site Menu](../../images/icon-menu.png))를 열고 **디자인** 을 확장한 다음 **페이지 템플릿** 으로 이동합니다.

1. **페이지 템플릿 표시** 탭을 클릭합니다.

1. **추가** 버튼(![Add Button](../../images/icon-add.png))을 클릭하고 **빈** 템플릿을 선택합니다.

   모달 창이 열립니다.

1. **이름** 을 입력하고 콘텐츠 유형으로 원하는 **객체** 를 선택합니다.

   ![이름을 입력하고 원하는 콘텐츠 유형에 대한 객체를 선택합니다.](./displaying-object-entries/images/01.png)

1. **저장** 을 클릭합니다.

   이렇게 하면 선택한 객체를 기본 매핑 소스로 사용하는 빈 템플릿이 생성되고 템플릿 편집 페이지로 리디렉션됩니다.

1. 페이지 조각과 위젯을 사용하여 개체 항목에 유연하고 동적인 디스플레이를 만들 수 있습니다. 자세한 내용은 [디스플레이 페이지 템플릿 사용](../../site-building/displaying-content/using-display-page-templates.md) 을 참조하세요.

   ![조각 요소를 개체 필드에 매핑하여 개별 항목에 대한 표시 페이지를 동적으로 채웁니다.](./displaying-object-entries/images/02.png)

1. 최종 사용자가 항목 표시 페이지에 댓글을 달 수 있도록 페이지 댓글 위젯을 추가합니다.

   ```{note}
   객체 정의에 대한 주석을 활성화해야 합니다. 그렇지 않으면 위젯이 표시 페이지에서 숨겨집니다.
   ```

1. 완료되면 **게시** 를 클릭합니다.

1. 템플릿에 대한 **작업** 버튼(![Actions Button](../../images/icon-actions.png))을 클릭하고 **기본값으로 표시** 를 선택합니다.

   이제 이 템플릿은 사용자가 친숙한 URL을 방문할 때마다 객체의 항목을 렌더링하는 데 사용됩니다.

   ![템플릿의 작업 버튼을 클릭하고 기본값으로 표시를 선택합니다.](./displaying-object-entries/images/03.png)

### 댓글 활성화

1. **글로벌 메뉴**(![Global Menu](../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **객체** 를 클릭합니다.

1. 개체 정의를 편집합니다.

1. 세부 정보 탭에서 댓글을 활성화하고 **저장** 을 클릭합니다.

   ![댓글을 활성화합니다.](./displaying-object-entries/images/04.png)

## 개체에 대한 정보 템플릿 만들기

1. **사이트 메뉴**(![Site Menu](../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **템플릿** &rarr; **정보 템플릿** 으로 이동합니다.

1. **클릭** 추가 (![Add Button](../../images/icon-add.png))

1. **이름** 을 입력하고 원하는 **객체** 를 선택합니다.

   ![이름을 입력하고 원하는 개체를 선택합니다.](./displaying-object-entries/images/05.png)

1. **저장** 을 클릭합니다. 템플릿 디자인 페이지로 리디렉션됩니다.

1. (선택 사항) 애플리케이션 표시줄에서 작업(![Actions Button](../../images/icon-actions.png))을 클릭하고 **스크립트 가져오기** 를 선택한 다음 가져올 `.ftl` 파일을 선택합니다. 이렇게 하면 현재 템플릿이 파일의 FreeMarker 스크립트로 바뀝니다.

   ![.ftl 파일에서 스크립트 가져오기.](./displaying-object-entries/images/06.png)

1. [FreeMarker](https://freemarker.apache.org) 를 사용하여 템플릿을 디자인하세요.

   **요소** 사이드 패널(![Elements](../../images/icon-list-ul.png))에서 선택한 객체의 구조에서 사용 가능한 필드에 액세스할 수 있습니다.

   ![객체 구조의 사용 가능한 필드에서 선택합니다.](./displaying-object-entries/images/07.png)

1. (선택 사항) 속성 사이드 패널에서 템플릿에 설명 또는 이미지를 추가합니다(![Properties](../../images/icon-cog3.png)).

   ![속성 패널에서 설명 또는 이미지를 추가합니다.](./displaying-object-entries/images/08.png)

1. 완료되면 **저장** 을 클릭합니다.

이제 개체 항목을 조각 필드에 매핑할 때 템플릿에서 선택할 수 있습니다.

![조각 요소를 매핑할 때 템플릿을 선택합니다.](./displaying-object-entries/images/09.png)

## 탐색 메뉴에 항목 추가

객체는 정보 프레임워크와 통합되어 있으므로 탐색 메뉴에 객체 항목을 추가하여 빠른 액세스를 제공할 수 있습니다. 게시된 모든 개체는 메뉴 요소에 사용 가능한 소스로 자동으로 표시됩니다. 자세한 내용은 [내비게이션 메뉴 애플리케이션 사용](../../site-building/site-navigation/using-the-navigation-menus-application.md) 을 참조하세요.

## 관련 주제

* [개체 만들기](./creating-and-managing-objects/creating-objects.md)
* [컬렉션 공급자가 있는 개체 항목 표시](./displaying-object-entries-with-collection-providers.md)
* [컬렉션 및 컬렉션 페이지 정보](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
* [디스플레이 페이지 템플릿 사용](../../site-building/displaying-content/using-display-page-templates.md)
