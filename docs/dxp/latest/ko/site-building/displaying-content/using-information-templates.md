# 정보 템플릿 사용

{bdg-secondary}`가능 7.4+`

정보 템플릿을 사용하면 Info Framework를 구현하는 모든 항목 유형에 대한 [FreeMarker](https://freemarker.apache.org/) 템플릿을 만들 수 있습니다. 지원되는 항목 유형에는 웹 콘텐츠, 문서, 자산, 블로그, 범주 및 개체가 포함됩니다. 일단 생성되면 조각 필드를 템플릿에 매핑하여 콘텐츠 페이지 및 디스플레이 페이지에서 항목이 렌더링되는 방식을 결정할 수 있습니다. 이렇게 하면 사이트에 일관된 스타일을 구현하는 데 도움이 됩니다.

```{important}
정보 템플릿은 조각에서만 사용할 수 있으며 위젯에서는 사용할 수 없습니다. 위젯에 표시되는 웹 콘텐츠용 FreeMarker 템플릿을 디자인하려면 [웹 콘텐츠 템플릿](../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md).
```

## 정보 템플릿 생성

정보 템플릿을 만들려면 다음 단계를 따르세요.

1. **사이트 메뉴**(![Site Menu](../../images/icon-product-menu.png))을 열고 **디자인** &rarr; **템플릿** &rarr; **정보 템플릿** 으로 이동합니다.

1. **추가** 버튼(![Add Button](../../images/icon-add.png))을 클릭합니다.

1. **이름** 을 입력하고 **항목 유형** 을 선택하고 (해당되는 경우)**항목 하위 유형** 를 선택하십시오.
   
   ![이름을 입력하고 항목 유형 및 항목 하위 유형을 선택합니다.](./using-information-templates/images/01.png)

1. **저장** 을 클릭합니다. 이렇게 하면 템플릿 디자인 페이지로 리디렉션됩니다.

1. (선택 사항) `.ftl` 파일에서 기존 FreeMarker 스크립트를 [가져오기](#importing-and-exporting-scripts) 합니다.

1. FreeMarker를 사용하여 템플릿을 디자인합니다.
   
   **요소** 측면 패널(![Elements](../../images/icon-list-ul.png))에서 선택한 항목 유형의 구조에서 사용 가능한 필드에 빠르게 액세스할 수 있습니다.
   
   ![FreeMarker 및 요소 측면 패널에서 사용 가능한 필드를 사용하여 템플릿을 디자인합니다.](./using-information-templates/images/02.png) 

   ```{note}
   요소 측면 패널에는 템플릿 기반 필드(예: 저널 기사 템플릿, 정보 템플릿)가 포함되지 않습니다. 이는 무한 루프를 방지하기 위한 것입니다.
   ```

1. (선택 사항) 속성 측면 패널(![Properties](../../images/icon-cog3.png))의 템플릿에 **설명** 또는 **이미지** 을 추가합니다.

1. 완료되면 **저장** 을 클릭합니다.

생성된 정보 템플릿은 텍스트 및 서식 있는 텍스트와 같이 매핑할 수 있는 [개의 하위 요소](../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md) 이 있는 콘텐츠 표시 조각 및 기타 조각에서 사용할 수 있습니다. 선택한 경우 콘텐츠 페이지 및 표시 페이지 템플릿에서 항목이 렌더링되는 방식을 결정합니다.

## 스크립트 가져오기 및 내보내기

정보 템플릿을 편집할 때 다른 컨텍스트에서 재사용하기 위해 FreeMarker 스크립트를 가져오고 내보낼 수 있습니다.

1. **사이트 메뉴**(![Site Menu](../../images/icon-product-menu.png))을 열고 **디자인** &rarr; **템플릿** &rarr; **정보 템플릿** 으로 이동합니다.

1. 원하는 정보 템플릿을 선택합니다.

1. 응용 프로그램 표시줄에서 **작업** 버튼 ![Actions Button](../../images/icon-actions.png) 을 클릭하고 **스크립트 내보내기** 또는 **스크립트 가져오기** 을 선택합니다.
   
   ![스크립트 내보내기 또는 스크립트 가져오기를 선택합니다.](./using-information-templates/images/03.png)

내보낼 때 현재 FreeMarker 스크립트는 `script.ftl` 파일로 저장됩니다.

가져올 때 선택한 파일이 템플릿의 현재 FreeMarker 스크립트를 대체합니다.

## 정보 템플릿 관리

템플릿 애플리케이션에서 모든 기존 정보 템플릿을 보고 관리할 수 있습니다. 각각의 기존 템플릿은 해당 유형(예: 웹 콘텐츠 기사) 및 하위 유형(예: 기본 웹 콘텐츠)과 함께 나열됩니다. 템플릿에 대해 **작업** 버튼(![Actions Button](../../images/icon-actions.png))을 클릭하여 다음 옵션에 액세스할 수 있습니다.

| 액션 | 묘사                         |
|:-- |:-------------------------- |
| 수정 | 템플릿을 편집합니다.                |
| 사본 | 선택한 템플릿의 내용으로 새 템플릿을 만듭니다. |
| 권한 | 템플릿에 대한 기본 권한을 관리합니다.      |
| 삭제 | 템플릿을 삭제합니다.                |


![작업 버튼을 클릭하여 관리 옵션에 액세스합니다.](./using-information-templates/images/04.png)

여기에서 [내보내기](#exporting-templates) 및 [가져오기](#importing-templates) 정보 템플릿을 LAR 파일로 가져와 사이트와 환경 간에 공유할 수도 있습니다. 이렇게 하려면 애플리케이션 표시줄에서 **작업** 버튼을 클릭하고 **내보내기/가져오기** 를 선택합니다.

![템플릿을 LAR 파일로 내보내고 가져옵니다.](./using-information-templates/images/05.png)

```{note}
기본적으로 정보 템플릿 내보내기에는 위젯 템플릿이 포함됩니다. 그러나 LAR 파일에 포함되는 템플릿을 구성할 수 있습니다.
```

## 추가 정보

* [위젯 템플릿 만들기](../creating-pages/using-widget-pages/styling-widgets/creating-a-widget-template.md)
* [웹 콘텐츠 템플릿 만들기](../../content-authoring-and-management/web-content/web-content-templates/creating-web-content-templates.md)
* [조각에 웹 콘텐츠 템플릿 매핑](../../content-authoring-and-management/web-content/web-content-templates/mapping-web-content-templates-to-fragments.md)
