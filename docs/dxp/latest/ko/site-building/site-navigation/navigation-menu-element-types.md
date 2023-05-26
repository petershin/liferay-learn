# 탐색 메뉴 요소 유형

탐색 메뉴에는 원하는 계층 구조에 추가하고 정렬할 수 있는 다양한 요소 유형이 있습니다. 이러한 유형에는 [특정 페이지](#pages) , [어휘](#vocabularies) , 특정 콘텐츠 유형에 대한 페이지 표시 또는 사용자 지정 [자리 표시자](#submenus) 또는 [URL](#urls) 이 포함됩니다. 이러한 요소로 탐색 메뉴를 추가하는 방법에 대한 자세한 내용은 [여기](./using-the-navigation-menus-application.md) 을 참조하십시오.

## 페이지

특정 페이지는 탐색 메뉴에 사용되는 가장 일반적인 요소 중 일부입니다. 사이트의 페이지 세트에서 게시된 페이지를 메뉴에 추가할 수 있습니다.

## 하위 메뉴

하위 메뉴는 탐색 메뉴에 추가할 수 있는 자리 표시자 요소로, 특정 페이지나 콘텐츠 없이 하위 메뉴 요소를 추가로 그룹화할 수 있습니다. 페이지에서 사용할 때 하위 메뉴 요소에는 클릭 가능한 링크가 없지만 사용자가 마우스를 가져가면 하위 요소가 표시되도록 확장됩니다.

![탐색 메뉴의 하위 메뉴 요소는 클릭할 수 없지만 포함된 하위 요소는 클릭할 수 있습니다.](./navigation-menu-element-types/images/01.png)

탐색 메뉴용 기본 애플리케이션 표시 템플릿을 사용하여 하위 메뉴에 다른 요소가 구성되어 있지 않으면 사용자의 탐색 메뉴에 표시되지 않습니다.

## 블로그 항목

[블로그 항목](../../content-authoring-and-management/blogs/adding-blog-entries.md) 을 항목의 [디스플레이 페이지](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)에 연결하는 독립 메뉴 요소로 추가할 수 있습니다. 탐색 메뉴용 기본 애플리케이션 표시 템플릿을 사용하여 표시 페이지가 없는 블로그 항목을 추가하면 링크가 없으므로 메뉴에서 사용자에게 표시되지 않습니다. 이 동작은 다른 애플리케이션 표시 템플릿을 사용하는 경우 변경될 수 있습니다.

## 웹 콘텐츠 기사

[웹 콘텐츠 기사](../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md) 를 기사의 [디스플레이 페이지](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)에 연결하는 독립 메뉴 요소로 추가할 수 있습니다. 탐색 메뉴용 기본 애플리케이션 표시 템플릿을 사용하여 표시 페이지가 없는 웹 콘텐츠 기사가 추가되면 링크가 없으므로 메뉴에서 사용자에게 숨겨집니다. 이 동작은 다른 애플리케이션 표시 템플릿을 사용하는 경우 변경될 수 있습니다.

## 문서 도서관

문서의 [표시 페이지](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)에 연결되는 독립 메뉴 요소로 [문서](../../content-authoring-and-management/documents-and-media.md) 을 추가할 수 있습니다. 탐색 메뉴용 기본 애플리케이션 표시 템플릿을 사용하여 표시 페이지가 없는 문서를 추가하면 링크가 없으므로 메뉴에서 사용자에게 표시되지 않습니다. 이 동작은 다른 애플리케이션 표시 템플릿을 사용하는 경우 변경될 수 있습니다.

## 분류

카테고리의 [디스플레이 페이지](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)에 연결되는 메뉴 요소로 [카테고리](../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#defining-categories) 을 추가할 수 있습니다. 탐색 메뉴용 기본 애플리케이션 표시 템플릿을 사용하여 표시 페이지가 없는 카테고리가 추가되면 링크가 없으므로 메뉴에서 사용자에게 표시되지 않습니다. 이 동작은 다른 애플리케이션 표시 템플릿을 사용하는 경우 변경될 수 있습니다.

Liferay 7.4 버전 U9+ 및 GA13+부터 한 번에 여러 범주를 선택할 수 있습니다. 하위 범주와 함께 범주를 추가하면 올바른 계층 구조의 탐색 메뉴에 배치됩니다.

```{note}
탐색 메뉴 요소로 추가된 범주에 하위 범주가 포함된 경우 하위 범주에 대한 변경 사항이 탐색 메뉴의 계층 구조에 자동으로 반영되지 않습니다. 탐색 메뉴를 자동으로 업데이트하기 위해 하위 범주를 변경하려면 대신 동적 [Vocabulary](#vocabularies) 요소를 사용할 수 있습니다.
```

## 어휘

{bdg-secondary}`Liferay Portal 7.4 GA26+, DXP 7.4 U26+에서 사용 가능`

전체 [어휘](../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#defining-vocabularies) 을 메뉴 요소로 추가할 수 있습니다. 어휘는 동적으로 업데이트되어 어휘 내의 범주 및 계층 구조에 대한 모든 변경 사항이 탐색 메뉴 자체에 반영됩니다. 그러나 이렇게 하면 포함된 범주의 계층 구조를 재정렬하거나 변경할 수 없습니다. 카테고리의 다른 계층 구조를 생성하려면 [은 대신 어휘](#categories) 외부에 개별적으로 카테고리를 추가합니다.

기본적으로 어휘를 메뉴 요소로 추가하면 메뉴가 페이지에 표시될 때 해당 요소를 모든 최상위 범주로 바꿉니다. 그러나 Navigation Menu를 편집하는 동안 Vocabulary 요소를 선택할 때 **Display Name as First Level** 확인란을 선택하여 Vocabulary 자체가 메뉴에 나타나도록(클릭할 수 없는 요소로) 최상위 카테고리가 아래에 있도록 할 수 있습니다. 그것.

![탐색 메뉴에서 어휘가 요소로 나타나도록 하려면 표시 이름을 1단계로 선택합니다.](./navigation-menu-element-types/images/02.png)

탐색 메뉴에 대한 기본 응용 프로그램 표시 템플릿(다른 응용 프로그램 표시 템플릿을 사용하는 경우 변경될 수 있음)을 사용하면 어휘의 각 최상위 범주에는 탐색 메뉴에 나타나도록 구성된 디스플레이 페이지가 있어야 합니다. 메뉴에 표시된 범주는 자체 표시 페이지가 있거나 없는 모든 하위 범주를 여전히 표시합니다. 그러나 표시 페이지가 없는 하위 범주에는 클릭 가능한 링크가 없으며 하위 범주 아래에 자체 하위 범주가 표시되지 않습니다.

## URLs

특정 콘텐츠에 연결할 필요가 없는 사용자 지정 URL을 사용하여 탐색 메뉴 요소를 추가할 수도 있습니다. 탐색 메뉴에 URL 요소를 추가할 때 메뉴 요소의 표시 이름과 클릭 시 해당 요소가 가리키는 URL을 입력해야 합니다. URL을 사용자 브라우저의 별도 탭에서 열려면 **새 탭에서 열기** 확인란을 선택합니다.

![URL 메뉴 요소를 추가하려면 이름과 가리킬 URL을 입력하십시오.](./navigation-menu-element-types/images/03.png)

## Liferay Portal 7.4 GA4 및 이전 버전

GA4보다 이전 버전의 Liferay Portal 7.4에는 메뉴에 추가된 디스플레이 페이지(모든 유형의 콘텐츠)에 사용되는 **디스플레이 페이지** 탐색 메뉴 요소 유형도 있습니다.

Liferay 7.4 GA5+ 및 U1+에서 디스플레이 페이지 유형은 디스플레이 페이지: [블로그 항목](#blogs-entries) , [웹 콘텐츠 기사](#web-content-articles) , [문서](#documents) 및 [범주](#categories) 을 사용하는 콘텐츠 유형으로 대체됩니다.

## 관련 주제

* [탐색 메뉴 애플리케이션 사용](./using-the-navigation-menus-application.md)
* [디스플레이 페이지로 콘텐츠 게시](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)
