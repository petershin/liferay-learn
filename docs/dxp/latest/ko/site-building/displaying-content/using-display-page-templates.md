---
toc:
  - ./using-display-page-templates.md
  - ./using-display-page-templates/creating-and-managing-display-page-templates.md
  - ./using-display-page-templates/publishing-content-with-display-pages.md
  - ./using-display-page-templates/displaying-categories-using-display-pages.md
  - ./using-display-page-templates/using-multiple-display-page-templates-to-create-multi-step-applications.md
  - ./using-display-page-templates/configuring-seo-and-open-graph.md
---
# 표시 페이지 템플릿 사용

{bdg-secondary}`liferay DXP/포탈 7.3+`

표시 페이지 템플릿은 전용 URL에 콘텐츠를 표시하기 위한 구조를 정의합니다. 콘텐츠 항목을 생성하거나 업로드하면 Liferay는 해당 항목에 액세스하기 위한 고유한 친숙한 URL을 생성합니다. 그러나 콘텐츠를 표시하기 위한 템플릿을 먼저 정의한 경우에만 이 URL을 사용하여 콘텐츠를 볼 수 있습니다.

![Create display page templates for displaying content at a dedicated URL.](./using-display-page-templates/images/01.png)

표시 페이지 템플릿을 생성할 때 콘텐츠 유형(예: 웹 콘텐츠 기사, 문서, 블로그 항목)을 선택하는 것부터 시작합니다. 이는 표시 페이지를 렌더링하기 위해 템플릿을 사용할 수 있는 콘텐츠 항목을 결정합니다. 그런 다음 콘텐츠 페이지와 동일한 UI 및 디자인 요소를 사용하여 템플릿을 디자인할 수 있습니다. 이는 페이지 [조각](../creating-pages/page-fragments-and-widgets/using-fragments.md) 과 [위젯](../creating-pages/using-content-pages/using-widgets-on-a-content-page.md) 하여 콘텐츠 필드에 매핑되고 추가 기능을 통합하는 동적 디스플레이를 구축할 수 있음을 의미합니다. 또한 [SEO 설정](./using-display-page-templates/configuring-seo-and-open-graph.md) 을 정의하여 페이지의 검색 순위를 높일 수 있습니다.

템플릿을 디자인한 후 콘텐츠 유형을 표시하기 위한 기본 템플릿으로 만들거나 일부 콘텐츠 항목만 사용하도록 수동으로 구성할 수 있습니다. 일단 설정되면 사용자는 친숙한 URL을 방문하여 콘텐츠 항목의 표시 페이지를 볼 수 있습니다. 콘텐츠는 템플릿 디자인에 따라 동적으로 렌더링됩니다.

표시 페이지 템플릿은 현재 다음 콘텐츠 유형을 지원합니다.

* [블로그 항목](../../content-authoring-and-management/blogs/getting-started-with-blogs.md)
* [카테고리](../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) 
{bdg-secondary}`7.4+`
* [사용자 정의 개체](../../building-applications/objects/displaying-object-entries.md) {bdg-secondary}`7.4+`
* [문서](../../content-authoring-and-management/documents-and-media/publishing-and-sharing/publishing-documents.md)
* [웹 콘텐츠 기사](../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)

```{tip}
여러 콘텐츠 항목에 재사용할 레이아웃을 디자인하려면 표시 페이지 템플릿을 사용하세요.
```

이러한 템플릿은 비즈니스 사례 연구, 제품 또는 서비스 옵션, 채용 정보 목록, 웹 기사 등과 같은 요소 목록을 일관된 방식으로 표시하는 데 이상적입니다. 예를 들어, 보험 사업 웹사이트에서는 사용 가능한 옵션을 나열할 수 있습니다. 개별 웹 콘텐츠 기사에서는 각 옵션을 설명합니다. 사이트 방문자가 옵션을 보고 기사에서 해당 보험 세부 정보를 보고 싶은 옵션을 클릭할 수 있는 랜딩 페이지를 원합니다.

![You can apply the same layout to different content of the same type using a single display page template.](./using-display-page-templates/images/02.png)

이 목표를 달성하기 위해 웹 콘텐츠 기사 필드를 템플릿의 조각에 매핑하는 단일 표시 페이지 템플릿을 만들 수 있습니다. 각 기사는 동일한 템플릿을 사용할 수 있습니다. 그런 다음 랜딩 페이지의 각 보험 옵션을 해당 기사의 친숙한 URL에 연결할 수 있습니다. 사이트 방문자가 옵션을 클릭하면 표시 페이지가 웹 콘텐츠 기사의 정보로 동적으로 채워지고 템플릿 디자인에 따라 렌더링됩니다.

콘텐츠 유형에 생성된 여러 디스플레이 페이지 템플릿이 있는 경우 해당 자산 유형에 대해 사용 가능한 템플릿 [에 대한](./using-display-page-templates/using-multiple-display-page-templates-to-create-multi-step-applications.md) 링크를 생성할 수 있습니다. 표시 페이지에 대한 링크를 매핑할 때 기본 옵션이나 사용 가능한 다른 표시 페이지 템플릿을 선택할 수 있으므로 콘텐츠 표시 방법에 대한 사용자 정의 및 유연성이 향상됩니다.


