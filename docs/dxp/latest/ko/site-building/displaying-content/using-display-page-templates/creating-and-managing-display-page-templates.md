# 표시 페이지 템플릿 생성 및 관리

{bdg-secondary}`liferay DXP/포탈 7.3+`

표시 페이지 템플릿은 전용 URL에 콘텐츠를 표시하기 위한 구조를 정의합니다. 이러한 템플릿은 현재 다음 콘텐츠 유형을 지원합니다.

* [블로그 항목](../../../content-authoring-and-management/blogs/getting-started-with-blogs.md)
* [카테고리](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) {bdg-secondary}`7.4+`
* [사용자 정의 개체](../../../building-applications/objects/displaying-object-entries.md) {bdg-secondary}`7.4+`
* [문서](../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/publishing-documents.md)
* [웹 콘텐츠 기사](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)

자세한 내용은 [표시 페이지 템플릿 사용](../using-display-page-templates.md) 을 참조하십시오.

## 표시 페이지 템플릿 만들기

1. _사이트 메뉴_(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 _디자인_ &rarr; _페이지 템플릿_을 클릭합니다.

1. _페이지 템플릿 표시_ 탭을 클릭하고 _추가_(![추가 버튼](./../../../images/icon-add.png))를 클릭합니다.

1. 템플릿의 _이름_을 입력하고 해당하는 경우 _콘텐츠 유형_ 및 _하위 유형_을 선택합니다. 그런 다음 _저장_을 클릭하세요.

   ![Select the content type and subtype for your new template.](./creating-and-managing-display-page-templates/images/01.png)

1. [콘텐츠 페이지](../../creating-pages/using-content-pages/content-page-editor-ui-reference.md) 과 동일한 인터페이스 및 페이지 요소를 사용하여 템플릿을 디자인합니다.

1. 페이지 요소를 추가한 후에는 편집 가능한 필드를 [지도](../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings) 클릭하여 해당 요소를 콘텐츠 구조 필드(예: 제목, 설명)에 매핑할 수 있습니다. 매핑된 필드는 보라색 윤곽선으로 표시됩니다.

   ```{tip}
   디스플레이 페이지 템플릿에 대한 SEO 및 오픈 그래프 설정을 구성할 때 매핑된 필드를 사용할 수 있습니다. 자세한 내용은 [SEO 및 오픈 그래프 구성](./configuring-seo-and-open-graph.md) 참조하세요.
   ```

   ![Map page elements to structure fields.](./creating-and-managing-display-page-templates/images/02.png)

1. 게시하기 전에 [미리보기 기능](#previewing-the-display-page-template-content-mappings) (7.4+ 사용 가능)을 사용하여 기존 콘텐츠와 편집 가능한 필드 매핑을 미리 볼 수 있습니다.

1. 완료되면 _게시_를 클릭하여 작업 내용을 저장하세요.

이제 템플릿을 사용하여 콘텐츠를 [할 수 있습니다](./publishing-content-with-display-pages.md) .

### 표시 페이지 템플릿에 대한 친숙한 URL 설정

```{important}
이 기능은 현재 릴리스 기능 플래그 뒤에 있습니다. 자세한 내용은 [릴리스 기능 플래그](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) 을 읽어보세요.
```

디스플레이 페이지 템플릿에 친숙한 URL을 설정할 수 있습니다. 표시 페이지 템플릿이 기본값으로 표시되지 않거나 사용하기 위해 수동으로 선택한 경우 친숙한 URL이 사용됩니다.

예를 들어 콘텐츠 페이지의 버튼을 매핑된 URL에 연결하면 표시 페이지 템플릿에 연결된 개체를 항목으로 선택하고 표시 페이지 템플릿을 필드로 선택할 수 있습니다. 이 경우 선택한 표시 페이지 템플릿에 친숙한 URL이 사용됩니다.

![Set a friendly URL for your display page template](./creating-and-managing-display-page-templates/images/03.png)
![The friendly URL is used when you select a display page template specifically from a list of links](./creating-and-managing-display-page-templates/images/04.png)

디스플레이 페이지 템플릿에 친숙한 URL을 설정하려면,

1. 디스플레이 페이지 템플릿을 편집하는 동안 페이지 오른쪽 상단에 있는 _옵션_(![옵션 아이콘](../../../images/icon-options.png))을 클릭하세요.

1. _구성_을 선택하세요.

1. 일반 섹션에서 친숙한 URL을 정의합니다.

1. _저장_을 클릭하세요.

### 다른 표시 페이지 템플릿에 대한 링크 매핑

```{important}
이 기능은 현재 릴리스 기능 플래그 뒤에 있습니다. 자세한 내용은 [릴리스 기능 플래그](../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) 을 읽어보세요.
```

콘텐츠 유형(예: 사용자 정의 개체, 웹 콘텐츠 기사 또는 블로그 항목)이 둘 이상의 표시 페이지 템플릿인 경우 해당 콘텐츠 유형에 사용 가능한 템플릿에 링크를 매핑할 수 있습니다.

예를 들어, 개체에 대해 각각 매핑된 양식의 단계(예: 제출, 편집 및 승인)에 해당하는 다양한 표시 페이지 템플릿을 만들 수 있습니다. 그런 다음 각 단계에 사용할 표시 페이지 템플릿을 선택하여 다단계 양식을 만들 수 있습니다.

![Map links to different display page templates](./creating-and-managing-display-page-templates/images/05.png)

이를 통해 여러 단계를 거쳐 개체 [에서 매핑된 개체 및](../../../building-applications/objects/using-fragments-to-build-forms.md) 형태를 처리할 때 더 많은 자유를 얻을 수 있습니다.

### 표시 페이지 템플릿 콘텐츠 매핑 미리보기

{bdg-secondary}`7.4+`

편집하는 동안 Liferay는 콘텐츠 항목이 포함된 디스플레이 페이지 템플릿을 미리 볼 수 있는 두 가지 방법을 제공합니다.

애플리케이션 메뉴에서 _미리보기_ 드롭다운 메뉴를 클릭하고 콘텐츠 항목을 선택할 수 있습니다. 항목이 나타나지 않으면 _다른 항목 선택_을 클릭하고 원하는 콘텐츠를 찾아보세요. 그러면 필드 매핑에 따라 템플릿이 콘텐츠 데이터로 동적으로 채워집니다.

![Choose the content you want to use to preview your display page template.](./creating-and-managing-display-page-templates/images/06.png)

또는 표시 페이지 템플릿 편집기에서 오른쪽 상단에 있는 _옵션_ 메뉴(![옵션 메뉴](../../../images/icon-options.png)) 버튼을 클릭하고 _미리보기를 선택합니다. 새 탭_에서.

## 표시 페이지 템플릿 사용 보기

{bdg-secondary}`7.4+`

_작업_ 메뉴(![작업](../../../images/icon-actions.png))를 사용하여 다양한 디스플레이 페이지 템플릿을 관리할 수 있습니다. 여기에서 _사용 보기_ 옵션은 기본 템플릿이 아닌 특정 디스플레이 페이지 템플릿을 사용하는 콘텐츠 목록을 제공합니다. 이 옵션은 기본 템플릿에는 사용할 수 없습니다.

![Managing your display page template using the Actions menu](./creating-and-managing-display-page-templates/images/07.png)

사용 중인 표시 페이지 템플릿을 삭제하기 전에 콘텐츠에서 표시 페이지 템플릿 할당을 취소하는 두 가지 방법이 있습니다.

* 기본값에 할당: 콘텐츠가 현재 표시 페이지 템플릿에서 할당 취소되고 콘텐츠 유형 및 하위 유형(해당하는 경우)에 대한 기본 표시 페이지 템플릿에 할당됩니다.
* 할당 취소: 콘텐츠가 표시 페이지 템플릿에 할당되지 않았습니다.

표시 페이지 템플릿 사용을 확인하고 콘텐츠 할당을 취소하려면 다음 단계를 따르세요.

1. _사이트 메뉴_(![사이트 메뉴](../../../images/icon-product-menu.png))를 열고 _디자인_ &rarr; _페이지 템플릿_으로 이동합니다.

1. _표시 페이지 템플릿_ 탭을 클릭합니다.

1. 표시 페이지 템플릿의 _작업_ 메뉴(![작업](../../../images/icon-actions.png))를 클릭하고 _사용 보기_를 선택합니다.

1. 표시 페이지 템플릿을 사용하여 콘텐츠 목록에서 하나 이상의 요소를 선택합니다.

1. 오른쪽 상단 모서리에 있는 _작업_ 메뉴(![작업](../../../images/icon-actions.png))를 클릭하고 _기본값에 할당_ 또는 _할당 취소_를 선택합니다.

1. _확인_을 클릭하세요.

콘텐츠를 새 디스플레이 페이지 템플릿에 할당하는 경우 콘텐츠가 예상대로 표시되는지 확인하세요. 콘텐츠를 미리 보고 표시하려면 [디스플레이 페이지로 콘텐츠 게시](./publishing-content-with-display-pages.md) 참조하세요.

## 관련 주제

[디스플레이 페이지로 콘텐츠 게시](./publishing-content-with-display-pages.md)

[SEO 및 오픈 그래프 구성](./configuring-seo-and-open-graph.md)

[콘텐츠 페이지 사용하기](./../../creating-pages/using-content-pages.md)

[콘텐츠 페이지에 요소 추가하기](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)
