---
toc:
  - ./using-display-page-templates.md
  - >-
    ./using-display-page-templates/creating-and-managing-display-page-templates.md
  - ./using-display-page-templates/publishing-content-with-display-pages.md
  - ./using-display-page-templates/displaying-categories-using-display-pages.md
  - ./using-display-page-templates/configuring-seo-and-open-graph.md
---
# Using Display Page Templates

```{toctree}
:maxdepth: 3

using-display-page-templates/creating-and-managing-display-page-templates.md
using-display-page-templates/publishing-content-with-display-pages.md
using-display-page-templates/displaying-categories-using-display-pages.md
using-display-page-templates/configuring-seo-and-open-graph.md
```

{bdg-secondary}`사용 가능한 Liferay DXP/Portal 7.3+`

디스플레이 페이지 템플릿은 전용 URL에 콘텐츠를 표시하기 위한 구조를 정의합니다. 콘텐츠 항목을 생성하거나 업로드할 때 Liferay는 액세스를 위한 고유하고 친숙한 URL을 자동으로 생성합니다. 그러나 콘텐츠를 표시하기 위한 템플릿을 먼저 정의한 경우에만 이 URL을 사용하여 콘텐츠를 볼 수 있습니다.

![전용 URL에 콘텐츠를 표시하기 위한 표시 페이지 템플릿을 만듭니다.](./using-display-page-templates/images/01.png)

디스플레이 페이지 템플릿을 만들 때 콘텐츠 유형(예: 웹 콘텐츠 기사, 문서, 블로그 항목)을 선택하여 시작합니다. 이는 표시 페이지를 렌더링하기 위해 템플릿을 사용할 수 있는 콘텐츠 항목을 결정합니다. 그런 다음 콘텐츠 페이지와 동일한 UI 및 디자인 요소를 사용하여 템플릿을 디자인할 수 있습니다. 즉, 페이지 [조각](../creating-pages/page-fragments-and-widgets/using-fragments.md) 및 [위젯](../creating-pages/using-content-pages/using -widgets-on-a-content-page.md) 콘텐츠 필드에 매핑되고 추가 기능을 통합하는 동적 디스플레이를 구축합니다. 또한 [SEO 설정](./using-display-page-templates/configuring-seo-and-open-graph.md)을 정의하여 페이지의 검색 순위를 높일 수 있습니다.

템플릿을 디자인한 후 콘텐츠 유형을 표시하기 위한 기본 템플릿으로 만들거나 일부 콘텐츠 항목만 사용하도록 수동으로 구성할 수 있습니다. 일단 설정되면 사용자는 친숙한 URL을 방문하여 콘텐츠 항목의 표시 페이지를 볼 수 있습니다. 콘텐츠는 템플릿 디자인에 따라 동적으로 렌더링됩니다.

디스플레이 페이지 템플릿은 현재 다음 콘텐츠 유형을 지원합니다.

* [블로그 항목](../../../content-authoring-and-management/blogs/getting-started-with-blogs.md)
* [카테고리](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) {bdg-secondary}`사용 가능 7.4 +`
* [사용자 지정 개체](../../../building-applications/objects/displaying-object-entries.md) {bdg-secondary}`Available 7.4+`
* [문서](../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/publishing-documents.md)
* [웹 콘텐츠 기사](../../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md)

```{tip}
여러 콘텐츠 항목에 재사용할 레이아웃을 디자인하려면 디스플레이 페이지 템플릿을 사용하십시오.
```

이러한 템플릿은 비즈니스 사례 연구, 제품 또는 서비스 옵션, 작업 목록, 웹 기사 등과 같은 요소 목록을 일관된 방식으로 표시하는 데 이상적입니다. 예를 들어 보험 비즈니스 웹 사이트에서 사용 가능한 옵션을 나열할 수 있습니다. 개별 웹 콘텐츠 문서에서는 각 옵션을 설명합니다. 사이트 방문자가 옵션을 볼 수 있고 기사에서 해당 보험 세부 정보를 보고 싶은 옵션을 클릭할 수 있는 랜딩 페이지가 필요합니다.

![단일 디스플레이 페이지 템플릿을 사용하여 동일한 유형의 다른 콘텐츠에 동일한 레이아웃을 적용할 수 있습니다.](./using-display-page-templates/images/02.png)

이 목표를 달성하기 위해 웹 콘텐츠 기사 필드를 템플릿의 조각에 매핑하는 단일 표시 페이지 템플릿을 만들 수 있습니다. 각 문서는 동일한 템플릿을 사용할 수 있습니다. 그런 다음 랜딩 페이지의 각 보험 옵션을 해당 기사의 친숙한 URL에 연결할 수 있습니다. 사이트 방문자가 옵션을 클릭하면 표시 페이지가 웹 콘텐츠 기사의 정보로 동적으로 채워지고 템플릿 디자인에 따라 렌더링됩니다.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 표시 페이지 템플릿 생성 및 관리
:link: ./using-display-page-templates/creating-and-managing-display-page-templates.md
:::

:::{grid-item-card} 디스플레이 페이지로 콘텐츠 게시
:link: ./using-display-page-templates/publishing-content-with-display-pages.md
:::

:::{grid-item-card} 표시 페이지를 사용하여 범주 표시
:link: ./using-display-page-templates/displaying-categories-using-display-pages.md
:::

:::{grid-item-card} SEO 및 Open Graph 구성
:link: ./using-display-page-templates/configuring-seo-and-open-graph.md
:::
::::