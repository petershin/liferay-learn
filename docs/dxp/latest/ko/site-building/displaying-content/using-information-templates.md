# 정보 템플릿 사용

{bdg-secondary}`7.4+ 사용 가능`

정보 템플릿을 사용하면 정보 프레임워크를 구현하는 모든 항목 유형에 대해 [FreeMarker](https://freemarker.apache.org/) 템플릿을 생성할 수 있습니다. 지원되는 항목 유형에는 웹 콘텐츠, 문서, 자산, 블로그, 카테고리 및 개체가 포함됩니다. 생성된 후에는 조각 필드를 템플릿에 매핑하여 콘텐츠 페이지 및 표시 페이지에서 항목이 렌더링되는 방식을 결정할 수 있습니다. 이는 사이트에 일관된 스타일을 구현하는 데 도움이 될 수 있습니다.

```{important}
정보 템플릿은 조각으로만 사용할 수 있으며 위젯에서는 사용할 수 없습니다. 위젯에 표시되는 웹 콘텐츠용 FreeMarker 템플릿을 디자인하려면 [웹 콘텐츠 템플릿](../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md) 을 사용하세요.
```

## 정보 템플릿 생성

정보 템플릿을 만들려면 다음 단계를 따르세요.

1. _사이트 메뉴_(![사이트 메뉴](../../images/icon-product-menu.png))를 열고 _디자인_ &rarr; _템플릿_ &rarr; _정보 템플릿_으로 이동합니다.

1. _추가_ 버튼(![추가 버튼](../../images/icon-add.png))을 클릭합니다.

1. _이름_을 입력하고 _항목 유형_을 선택한 다음 (해당되는 경우) _항목 하위 유형_을 선택합니다.

   ![Enter a name and select an Item Type and Item Subtype.](./using-information-templates/images/01.png)

1. _저장_을 클릭하세요. 그러면 템플릿 디자인 페이지로 리디렉션됩니다.

1. (선택 사항) [`.ftl` 파일에서 기존 FreeMarker 스크립트를](#importing-and-exporting-scripts) 옵니다.

1. FreeMarker를 사용하여 템플릿을 디자인하세요.

   자동 완성 기능을 사용하려면 편집기에 `${`를 입력할 수 있습니다.

   _요소_ 측면 패널(![요소](../../images/icon-list-ul.png))에서는 선택한 항목 유형의 구조에서 사용 가능한 필드에 빠르게 액세스할 수 있습니다.

   ![Design your template using FreeMarker and available fields in the Elements side panel.](./using-information-templates/images/02.png)

   ```{note}
   요소 측면 패널에는 템플릿(예: 저널 기사 템플릿, 정보 템플릿) 기반 필드가 포함되지 않습니다. 무한루프를 방지하기 위함입니다.
   ```

1. (선택 사항) 속성 측면 패널(![속성](../../images/icon-cog3.png))의 템플릿에 _설명_ 또는 _이미지_를 추가합니다.

1. 완료되면 _저장_을 클릭하세요.

일단 생성되면 정보 템플릿은 콘텐츠 표시 조각과 텍스트 및 서식 있는 텍스트와 같이 매핑할 수 있는 하위 요소 [하위 요소](../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md) 없는 기타 조각에서 사용할 수 있습니다. 선택하면 콘텐츠 페이지 및 표시 페이지 템플릿에서 항목이 렌더링되는 방식이 결정됩니다.

Liferay의 [Headless](../../headless-delivery/using-liferay-as-a-headless-platform.md) API 서비스는 `restClient` 객체를 통해 템플릿 편집기에서 사용할 수 있습니다. 사용법에 대한 자세한 내용은 [템플릿 편집기에서 헤드리스 API 호출](../creating-pages/page-fragments-and-widgets/using-widgets/styling-widgets/creating-a-widget-template.md#calling-headless-apis-in-the-template-editor) 참조하세요.

## 스크립트 가져오기 및 내보내기

정보 템플릿을 편집할 때 FreeMarker 스크립트를 가져오고 내보내어 다른 컨텍스트에서 재사용할 수 있습니다.

1. _사이트 메뉴_(![사이트 메뉴](../../images/icon-product-menu.png))를 열고 _디자인_ &rarr; _템플릿_ &rarr; _정보 템플릿_으로 이동합니다.

1. 원하는 정보 템플릿을 선택하세요.

1. 응용 프로그램 표시줄에서 _작업_ 버튼 ![작업 버튼](../../images/icon-actions.png)을 클릭하고 _스크립트 내보내기_ 또는 _스크립트 가져오기_를 선택합니다.

   ![Select Export Script or Import Script.](./using-information-templates/images/03.png)

내보낼 때 현재 FreeMarker 스크립트는 `script.ftl` 파일로 저장됩니다.

가져올 때 선택한 파일은 템플릿의 현재 FreeMarker 스크립트를 대체합니다.

## 정보 템플릿 관리

템플릿 애플리케이션에서는 기존의 모든 정보 템플릿을 보고 관리할 수 있습니다. 각 기존 템플릿은 해당 유형(예: 웹 콘텐츠 기사) 및 하위 유형(예: 기본 웹 콘텐츠)과 함께 나열됩니다. 템플릿의 _작업_ 버튼(![작업 버튼](../../images/icon-actions.png))을 클릭하여 다음 옵션에 액세스할 수 있습니다.

| 액션 | 묘사                         |
| :- | :------------------------- |
| 수정 | 템플릿을 편집합니다.                |
| 사본 | 선택한 템플릿의 콘텐츠로 새 템플릿을 만듭니다. |
| 권한 | 템플릿에 대한 기본 권한을 관리합니다.      |
| 삭제 | 템플릿을 삭제합니다.                |

![Click the Actions button to access management options.](./using-information-templates/images/04.png)

여기에서 [내보내기](#exporting-templates) 및 [가져오기](#importing-templates) 정보 템플릿을 LAR 파일로 가져와 사이트와 환경 간에 공유할 수도 있습니다. 이렇게 하려면 응용 프로그램 표시줄에서 _작업_ 버튼을 클릭하고 _내보내기/가져오기_를 선택하세요.

![Export and Import templates as LAR files.](./using-information-templates/images/05.png)

```{note}
기본적으로 정보 템플릿 내보내기에는 위젯 템플릿이 포함됩니다. 그러나 LAR 파일에 포함되는 템플릿을 구성할 수 있습니다.
```

## 관련 주제

* [위젯 템플릿 만들기](../creating-pages/page-fragments-and-widgets/using-widgets/styling-widgets/creating-a-widget-template.md)
* [웹 콘텐츠 템플릿 생성](../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)
* [웹 콘텐츠 템플릿을 조각에 매핑](../../content-authoring-and-management/web-content/web-content-templates/mapping-web-content-templates-to-fragments.md)
