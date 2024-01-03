# 탐색 메뉴 요소 유형

탐색 메뉴에는 원하는 계층 구조에 추가하고 정렬할 수 있는 다양한 요소 유형이 있습니다. 이러한 유형에는 [특정 페이지](#pages) , [어휘](#vocabularies) , 특정 콘텐츠 유형에 대한 표시 페이지 또는 사용자 정의 [자리 표시자](#submenus) 또는 [URL](#urls) 포함됩니다. 이러한 요소가 포함된 탐색 메뉴를 추가하는 방법에 대한 자세한 내용은 [여기](./using-the-navigation-menus-application.md) 참조하세요.

## 페이지

특정 페이지는 탐색 메뉴에 사용되는 가장 일반적인 요소 중 일부입니다. 사이트의 페이지 세트에서 게시된 페이지를 메뉴에 추가할 수 있습니다.

## 하위 메뉴

하위 메뉴는 탐색 메뉴에 추가하여 특정 페이지나 콘텐츠 없이도 그 아래에 추가 메뉴 요소를 그룹화할 수 있는 자리 표시자 요소입니다. 페이지에서 사용되는 경우 하위 메뉴 요소에는 클릭 가능한 링크가 없지만 사용자가 해당 항목 위로 마우스를 가져가면 하위 요소가 표시되도록 확장됩니다.

![Submenu elements in the Navigation Menu are not clickable, but their contained child elements are.](./navigation-menu-element-types/images/01.png)

탐색 메뉴용 기본 애플리케이션 표시 템플릿을 사용하면 하위 메뉴에 그 아래에 구성된 다른 요소가 없으면 해당 하위 메뉴가 사용자의 탐색 메뉴에 표시되지 않습니다.

## 블로그 항목

[블로그 항목](../../content-authoring-and-management/blogs/adding-blog-entries.md) 해당 항목의 [표시 페이지](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) 에 연결되는 독립 메뉴 요소로 추가할 수 있습니다. 탐색 메뉴용 기본 애플리케이션 표시 템플릿을 사용하여 표시 페이지가 없는 블로그 항목을 추가하면 링크가 없으므로 메뉴에서 사용자에게 숨겨집니다. 다른 응용 프로그램 표시 템플릿을 사용하는 경우 이 동작이 변경될 수 있습니다.

## 웹 콘텐츠 기사

기사의 [표시 페이지](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) 에 링크되는 독립 메뉴 요소로 [웹 콘텐츠 기사](../../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md) 추가할 수 있습니다. 탐색 메뉴용 기본 애플리케이션 표시 템플릿을 사용하여 표시 페이지가 없는 웹 콘텐츠 기사가 추가되면 링크가 없으므로 메뉴에서 사용자에게 숨겨집니다. 다른 응용 프로그램 표시 템플릿을 사용하는 경우 이 동작이 변경될 수 있습니다.

## 문서 도서관

[문서](../../content-authoring-and-management/documents-and-media.md) 문서의 [표시 페이지](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) 에 연결되는 독립 메뉴 요소로 추가할 수 있습니다. 탐색 메뉴용 기본 응용 프로그램 표시 템플릿을 사용하여 표시 페이지가 없는 문서를 추가하면 링크가 없으므로 메뉴에서 사용자에게 숨겨집니다. 다른 응용 프로그램 표시 템플릿을 사용하는 경우 이 동작이 변경될 수 있습니다.

## 분류

카테고리의 [디스플레이 페이지](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md) 에 연결되는 메뉴 요소로 [카테고리](../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#defining-categories) 추가할 수 있습니다. 탐색 메뉴용 기본 애플리케이션 표시 템플릿을 사용하여 표시 페이지가 없는 카테고리를 추가하면 링크가 없으므로 메뉴에서 사용자에게 숨겨집니다. 다른 응용 프로그램 표시 템플릿을 사용하는 경우 이 동작이 변경될 수 있습니다.

Liferay 7.4 버전 U9+ 및 GA13+에서는 한 번에 여러 카테고리를 선택할 수 있습니다. 카테고리를 하위 카테고리와 함께 추가하면 탐색 메뉴의 올바른 계층 구조에 배치됩니다.

```{note}
탐색 메뉴 요소로 추가된 범주에 하위 범주가 포함된 경우 하위 범주에 대한 변경 사항이 탐색 메뉴 계층 구조에 자동으로 반영되지 않습니다. 탐색 메뉴를 자동으로 업데이트하기 위해 하위 범주를 변경하려면 동적 [어휘](#vocabularies) 요소를 대신 사용할 수 있습니다.
```

## 어휘

{bdg-secondary}`liferay 포털 7.4 GA26+, DXP 7.4 U26+`

[개의 어휘](../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#defining-vocabularies) 전체를 메뉴 요소로 추가할 수 있습니다. 어휘는 동적으로 업데이트되어 어휘 내 카테고리 및 해당 계층에 대한 모든 변경 사항이 탐색 메뉴 자체에 반영됩니다. 그러나 포함된 카테고리의 계층 구조를 재정렬하거나 변경할 수는 없습니다. 카테고리의 다른 계층 구조를 생성하려면 대신 어휘 [외부에 카테고리를 개별적으로 추가](#categories) .

기본적으로 어휘를 메뉴 요소로 추가하면 메뉴는 페이지에 표시될 때 해당 요소를 모든 최상위 범주로 대체합니다. 그러나 탐색 메뉴를 편집하는 동안 어휘 요소를 선택하면 _표시 이름을 첫 번째 수준으로 표시_ 확인란을 선택하여 어휘 자체가 메뉴에(클릭할 수 없는 요소로) 나타나도록 할 수도 있습니다. 그것.

![Check Display Name as First Level to make the Vocabulary appear as an element in the Navigation Menu.](./navigation-menu-element-types/images/02.png)

탐색 메뉴용 기본 애플리케이션 표시 템플릿(다른 애플리케이션 표시 템플릿을 사용하는 경우 변경될 수 있음)을 사용하면 어휘의 각 최상위 범주가 탐색 메뉴에 나타나도록 구성된 표시 페이지가 있어야 합니다. 메뉴에 표시된 카테고리에는 자체 표시 페이지 유무에 관계없이 여전히 모든 하위 카테고리가 표시됩니다. 그러나 표시 페이지가 없는 하위 카테고리에는 클릭 가능한 링크가 없으며 그 아래에 자체 하위 카테고리가 표시되지 않습니다.

## URLs

특정 콘텐츠에 연결할 필요가 없는 사용자 정의 URL을 사용하여 탐색 메뉴 요소를 추가할 수도 있습니다. 탐색 메뉴에 URL 요소를 추가할 때 메뉴 요소의 표시 이름과 해당 요소가 클릭 시 가리키는 URL을 입력해야 합니다. URL이 사용자 브라우저의 별도 탭에서 열리도록 하려면 _새 탭에서 열기_ 확인란을 선택하세요.

![To add a URL menu element, enter the name and the URL to point to.](./navigation-menu-element-types/images/03.png)

## Liferay Portal 7.4 GA4 이상

GA4보다 이전 버전의 Liferay Portal 7.4에는 메뉴에 추가된 모든 디스플레이 페이지(모든 유형의 콘텐츠에 대해)에 사용되는 _디스플레이 페이지_ 탐색 메뉴 요소 유형도 있습니다.

Liferay 7.4 GA5+ 및 U1+에서는 표시 페이지 유형이 표시 페이지를 사용하는 콘텐츠 유형( [블로그 항목](#blogs-entries) , [웹 콘텐츠 기사](#web-content-articles), [문서](#documents) 및 [카테고리](#categories) 으로 대체되었습니다.

## 관련 주제

* [탐색 메뉴 애플리케이션 사용하기](./using-the-navigation-menus-application.md)
* [디스플레이 페이지로 콘텐츠 게시](../displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)
