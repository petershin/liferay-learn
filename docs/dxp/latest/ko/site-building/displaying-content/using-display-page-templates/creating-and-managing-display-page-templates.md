# 표시 페이지 템플릿 생성 및 관리

{bdg-secondary}`사용 가능한 Liferay DXP/Portal 7.3+`

표시 페이지 템플릿은 전용 URL에 콘텐츠를 표시하기 위한 구조를 정의합니다. 이러한 템플릿은 현재 다음 콘텐츠 유형을 지원합니다.

* [블로그 항목](../../../content-authoring-and-management/blogs/getting-started-with-blogs.md)
* [Categories](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) {bdg-secondary}`사용 가능한 7.4+`
* [사용자 정의 개체](../../../building-applications/objects/displaying-object-entries.md) {bdg-secondary}`사용 가능한 7.4+`
* [Documents](../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/publishing-documents.md)
* [웹 콘텐츠 기사](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)

자세한 내용은 [표시 페이지 템플릿 사용](../using-display-page-templates.md)을 참조하세요.

## 표시 페이지 템플릿 만들기

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **페이지 템플릿** 을 클릭합니다.

1. **표시 페이지 템플릿** 탭을 클릭합니다.

   ![Go to Page Templates, and click on the display page templates tab.](./creating-and-managing-display-page-templates/images/02.png)

1. **추가** 버튼(![추가 버튼](./../../../images/icon-add.png))을 클릭합니다.

1. 템플릿의 **이름** 을 입력하고 해당하는 경우 **콘텐츠 유형** 및 **하위 유형** 을 선택합니다. 그런 다음 **저장** 을 클릭하세요.

   ![Select the content type and subtype for your new template.](./creating-and-managing-display-page-templates/images/03.png)

1. [콘텐츠 페이지](../../creating-pages/using-content-pages/content-page-editor-ui-reference.md)와 동일한 인터페이스 및 페이지 요소를 사용하여 템플릿을 디자인합니다.

   ```{important}
   표시 페이지 템플릿은 공개 페이지의 디자인과 테마를 상속합니다. 이는 해당 특정 사이트에 대해 생성된 공개 페이지가 없더라도 마찬가지입니다.
   ```

   ![Build your template using fragments and widgets.](./creating-and-managing-display-page-templates/images/04.png)

1. 페이지 요소를 추가한 후에는 [map](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping- 설정) 편집 가능한 필드를 두 번 클릭하여 콘텐츠 구조 필드(예: 제목, 설명)로 이동합니다. 매핑된 필드는 보라색 윤곽선으로 표시됩니다.

   ```{tip}
   디스플레이 페이지 템플릿에 대한 SEO 및 오픈 그래프 설정을 구성할 때 매핑된 필드를 사용할 수 있습니다. 자세한 내용은 [SEO 및 오픈 그래프 구성](./configuring-seo-and-open-graph.md)을 참조하세요.
   ```

   ![Map page elements to structure fields.](./creating-and-managing-display-page-templates/images/05.png)

1. 게시하기 전에 [미리보기 기능](#preview-the-display-page-template-content-mappings) (7.4 이상에서 사용 가능)을 사용하여 기존 콘텐츠와 편집 가능한 필드 매핑을 미리 볼 수 있습니다.

1. 완료되면 **게시** 를 클릭하여 작업 내용을 저장하세요.

이제 템플릿을 사용하여 [콘텐츠를 표시](./publishing-content-with-display-pages.md)할 수 있습니다.

### 표시 페이지 템플릿 콘텐츠 매핑 미리보기

{bdg-secondary}`7.4+ 사용 가능`

편집하는 동안 Liferay는 콘텐츠 항목이 포함된 디스플레이 페이지 템플릿을 미리 볼 수 있는 두 가지 방법을 제공합니다.

애플리케이션 메뉴에서 **미리보기** 드롭다운 메뉴를 클릭하고 콘텐츠 항목을 선택할 수 있습니다. 항목이 나타나지 않으면 **다른 항목 선택** 을 클릭하고 원하는 콘텐츠를 찾아보세요. 그러면 필드 매핑에 따라 템플릿이 콘텐츠 데이터로 동적으로 채워집니다.

![Choose the content you want to use to preview your display page template.](./creating-and-managing-display-page-templates/images/07.png)

또는 표시 페이지 템플릿 편집기에서 **작업** 메뉴(![작업 메뉴](../../../images/icon-actions.png)) 버튼을 클릭하고 **새 탭에서 미리보기** 를 선택합니다.

![Click the Preview button to preview your display page template mappings.](./creating-and-managing-display-page-templates/images/08.png)

## 표시 페이지 템플릿 사용 보기

{bdg-secondary}`7.4+ 사용 가능`

**작업** 메뉴(![Actions](../../../images/icon-actions.png))를 사용하여 다양한 디스플레이 페이지 템플릿을 관리할 수 있습니다. 여기에서 **사용 보기** 옵션은 기본 템플릿이 아닌 특정 디스플레이 페이지 템플릿을 사용하는 콘텐츠 목록을 제공합니다. 이 옵션은 기본 템플릿에는 사용할 수 없습니다.

![Managing your display page template using the Actions menu](./creating-and-managing-display-page-templates/images/06.png)

사용 중인 표시 페이지 템플릿을 삭제하기 전에 콘텐츠에서 표시 페이지 템플릿 할당을 취소하는 두 가지 방법이 있습니다.

- 기본값에 할당: 콘텐츠가 현재 표시 페이지 템플릿에서 할당 취소되고 콘텐츠 유형 및 하위 유형(해당하는 경우)에 대한 기본 표시 페이지 템플릿에 할당됩니다.
- 할당 취소: 콘텐츠가 표시 페이지 템플릿에 할당되지 않았습니다.

표시 페이지 템플릿 사용을 확인하고 콘텐츠 할당을 취소하려면 다음 단계를 따르세요.

1. **사이트 메뉴**(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 **디자인** &rarr; **페이지 템플릿** 으로 이동합니다.

1. **표시 페이지 템플릿** 탭을 클릭합니다.

1. 디스플레이 페이지 템플릿의 **작업** 메뉴(![Actions](../../../images/icon-actions.png))를 클릭하고 **사용 보기** 를 선택합니다.

1. 표시 페이지 템플릿을 사용하여 콘텐츠 목록에서 하나 이상의 요소를 선택합니다.

1. 오른쪽 상단 모서리에 있는 **작업** 메뉴(![Actions](../../../images/icon-actions.png))를 클릭하고 **기본값에 할당** 또는 **할당 취소** 를 선택합니다.

1. **확인** 을 클릭하세요.

콘텐츠를 새 디스플레이 페이지 템플릿에 할당하는 경우 콘텐츠가 예상대로 표시되는지 확인하세요. 콘텐츠를 미리 보고 표시하려면 [표시 페이지로 콘텐츠 게시](./publishing-content-with-display-pages.md)를 참조하세요.

## 관련 주제

* [디스플레이 페이지로 콘텐츠 게시](./publishing-content-with-display-pages.md)
* [SEO 및 오픈 그래프 구성](./configuring-seo-and-open-graph.md)
* [콘텐츠 페이지 사용](./../../creating-pages/using-content-pages.md)
* [콘텐츠 페이지에 요소 추가](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)
