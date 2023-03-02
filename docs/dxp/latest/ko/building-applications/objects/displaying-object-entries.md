---
uuid: bf481358-5a1a-45af-ab98-a03bddd3044a
---

# 개체 항목 표시

{bdg-secondary}`가능 7.4+`

Liferay 객체를 사용하면 기존 DXP 프레임워크를 사용하여 객체 항목을 사이트에 동적으로 표시할 수 있습니다. 여기에는 여러 항목에 대한 컬렉션 표시와 개별 항목에 대한 표시 페이지가 포함됩니다.

개체가 게시되면 Liferay는 여러 개체 항목을 표시하기 위해 [컬렉션 디스플레이 조각](../../site-building/displaying-content/additional-content-display-options/displaying-collections.md#adding-a-collection-display-fragment-to-a-page) 과 함께 사용할 컬렉션 공급자를 생성합니다. 컬렉션의 스타일을 지정하고 필터링하고 페이지를 매기도록 조각을 구성할 수도 있습니다. 게시된 개체는 Info 프레임워크와 통합되므로 [디스플레이 페이지 템플릿](../../site-building/displaying-content/using-display-page-templates.md)에 대한 콘텐츠 유형으로 선택할 수 있습니다. 선택하면 개체가 템플릿의 매핑 소스로 설정되므로 조각 필드를 개체 필드에 쉽게 매핑하여 개별 개체 항목에 대한 유연한 페이지 표시를 만들 수 있습니다.

또한 FreeMarker를 사용하여 [개체용 정보 템플릿](#creating-information-templates-for-objects)을 만들 수 있습니다. 일단 생성되면 조각 필드를 템플릿에 매핑하여 콘텐츠 페이지 및 디스플레이 페이지에서 항목이 렌더링되는 방식을 결정할 수 있습니다.

```{note}
정보 템플릿은 콘텐츠 표시 조각 및 [sub-elements](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub- elements-reference.md)(예: 텍스트, 서식 있는 텍스트)를 개체에 매핑할 수 있습니다.
```

이러한 통합을 통해 사용자는 개인화된 사용자 경험을 제공하면서 Liferay의 WYSIWYG 페이지 구축 기능을 활용할 수 있습니다.

## 개체에 대한 컬렉션 공급자 사용

객체를 게시한 후 다음 단계에 따라 컬렉션 표시 조각을 사용하여 객체의 항목을 표시합니다.

1. 새 [콘텐츠 페이지](../../site-building/creating-pages/using-content-pages.md) 또는 [표시 페이지 템플릿](../../site-building/displaying-content/using-display-page-templates/creating-and-managing-display-page-templates.md)만들기 . 또는 *편집*(![편집 버튼](../../images/icon-edit-pencil.png)) 기존 것. 

   ```{note}
   컬렉션 공급자를 사용하여 컬렉션 페이지를 만들 수도 있습니다. 자세한 내용은 [컬렉션 및 컬렉션 페이지](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)를 참조하세요.
   ```

1. *Collection Display* 조각을 *조각 및 위젯* (![Fragments and Widgets](../../images/icon-plus.png)) 사이드바에서 페이지 또는 템플릿으로 끌어다 놓습니다.
   
   ![컬렉션 표시 조각을 페이지 또는 템플릿으로 끌어다 놓습니다.](./displaying-object-entries/images/01.png)

1. *Collection Display Fragment* 선택하여 구성 옵션에 액세스하고 *General 탭에서 Select Collection* 클릭합니다.
   
   ![조각을 선택하고 컬렉션 선택을 클릭합니다.](../objects/displaying-object-entries/images/02.png)

1. 모달 창에서 *Collection Providers* 탭을 클릭하고 *Object's provider*선택합니다.
   
   ![컬렉션 공급자 탭에서 개체의 공급자를 선택합니다.](./displaying-object-entries/images/03.png)

1. (선택 사항) 표시되는 개체 항목을 필터링합니다. 개체의 모든 선택 목록 또는 부울 필드로 필터링할 수 있습니다.
   
   이렇게 하려면 *컬렉션 옵션* 버튼(![Collection Options Button](../../images/icon-actions.png))을 클릭하고 *필터 컬렉션*선택합니다.
   
   ![컬렉션 옵션 버튼을 클릭하고 필터 컬렉션을 선택합니다.](./displaying-object-entries/images/04.png)
   
   그런 다음 원하는 *필터* 을 선택하고 *적용*클릭합니다.
   
   ![적용할 필터를 선택합니다.](./displaying-object-entries/images/05.png)

원하는 공급자를 선택한 후 추가 조각 옵션을 사용하여 *List Style* 및 *Pagination*을 포함하여 개체 항목이 표시되는 방식을 결정합니다.

![조각 옵션을 사용하여 개체 항목이 표시되는 방식을 결정합니다.](./displaying-object-entries/images/06.png)

## 개체에 대한 표시 페이지 템플릿 만들기

생성될 때 각 개체 항목에는 `server-address/l/objectEntryId` (예: `https://mysite.com/l/44337`) 패턴을 사용하는 친숙한 전용 URL이 자동으로 할당됩니다. 해당 URL에서 항목을 보려면 먼저 개체에 대한 표시 페이지 템플릿을 만들어야 합니다.

다음과 같이하세요:

1. *사이트 메뉴* (![Site Menu](../../images/icon-menu.png))을 열고 *디자인*확장한 다음 *페이지 템플릿*으로 이동합니다.

1. *디스플레이 페이지 템플릿* 탭을 클릭합니다.

1. *Add* 버튼(![Add Button](../../images/icon-add.png))을 클릭하고 *Blank* 템플릿을 선택합니다.
   
   그러면 모달 창이 열립니다.

1. *이름* 을 입력하고 콘텐츠 유형에 대해 원하는 *개체* 선택합니다.
   
   ![이름을 입력하고 콘텐츠 유형에 대해 원하는 개체를 선택합니다.](./displaying-object-entries/images/07.png)

1. *저장*클릭합니다.
   
   이렇게 하면 선택한 객체를 기본 매핑 소스로 사용하여 빈 템플릿이 생성되고 템플릿 편집 페이지로 리디렉션됩니다.

1. 페이지 조각 및 위젯을 사용하여 개체 항목에 대한 유연하고 동적인 디스플레이를 만듭니다. 자세한 내용은 [표시 페이지 템플릿 사용](../../site-building/displaying-content/using-display-page-templates.md) 참조하십시오.
   
   ![조각 요소를 개체 필드에 매핑하여 개별 항목에 대한 디스플레이 페이지를 동적으로 채웁니다.](./displaying-object-entries/images/08.png)

1. 최종 사용자가 항목 표시 페이지에 댓글을 달 수 있도록 페이지 댓글 위젯을 추가합니다.   

   ```{note}
   개체 정의에 대한 주석을 활성화해야 합니다. 그렇지 않으면 위젯이 디스플레이 페이지에서 숨겨집니다.
   ```

1. 완료되면 *게시*클릭합니다.

1. 템플릿에 대한 *작업* 버튼(![Actions Button](../../images/icon-actions.png))을 클릭하고 *기본으로 표시*를 선택합니다.
   
   이제 이 템플릿은 사용자가 친숙한 URL을 방문할 때마다 개체 항목을 렌더링하는 데 사용됩니다.
   
   ![템플릿에 대한 작업 버튼을 클릭하고 기본값으로 표시를 선택합니다.](./displaying-object-entries/images/09.png)

### 주석 활성화

1. *Global Menu* (![Global Menu](../../images/icon-applications-menu.png))을 열고 *Control Panel* 탭으로 이동하여 *Objects*클릭합니다.

1. 개체 정의를 편집합니다.

1. 세부 정보 탭에서 주석을 활성화하고 *저장*클릭합니다.
   
   ![댓글을 활성화합니다.](./displaying-object-entries/images/10.png)

## 개체에 대한 정보 템플릿 생성

1. *사이트 메뉴* (![Site Menu](../../images/icon-product-menu.png))을 열고 *디자인* &rarr; *템플릿* &rarr; *정보 템플릿*으로 이동합니다.

1. 클릭 *추가* (![Add Button](../../images/icon-add.png))

1. *이름* 입력하고 원하는 *객체*선택합니다.
   
   ![이름을 입력하고 원하는 개체를 선택합니다.](./displaying-object-entries/images/11.png)

1. *저장*클릭합니다. 이렇게 하면 템플릿 디자인 페이지로 리디렉션됩니다.

1. (선택 사항) 응용 프로그램 표시줄에서 작업(![Actions Button](../../images/icon-actions.png))을 클릭하고 *가져오기 스크립트*선택한 다음 가져올 `.ftl` 파일을 선택합니다. 이렇게 하면 현재 템플릿이 파일의 FreeMarker 스크립트로 대체됩니다.
   
   ![.ftl 파일에서 스크립트를 가져옵니다.](./displaying-object-entries/images/12.png)

1. [FreeMarker](https://freemarker.apache.org) 사용하여 템플릿을 디자인하십시오.
   
   *요소* 측면 패널(![Elements](../../images/icon-list-ul.png))에서 선택한 개체의 구조에서 사용 가능한 필드에 액세스할 수 있습니다.
   
   ![개체 구조의 사용 가능한 필드에서 선택합니다.](./displaying-object-entries/images/13.png)

1. (선택 사항) 속성 측면 패널(![Properties](../../images/icon-cog3.png))에서 템플릿에 설명 또는 이미지를 추가합니다.
   
   ![속성 패널에서 설명이나 이미지를 추가합니다.](./displaying-object-entries/images/14.png)

1. 완료되면 *저장* 클릭합니다.

이제 개체 항목을 조각 필드에 매핑할 때 템플릿에서 선택할 수 있습니다.

![조각 요소를 매핑할 때 템플릿을 선택합니다.](./displaying-object-entries/images/15.png)

## 탐색 메뉴에 항목 추가

Objects는 정보 프레임워크와 통합되므로 탐색 메뉴에 Object 항목을 추가하여 빠른 액세스를 제공할 수 있습니다. 게시된 모든 객체는 자동으로 메뉴 요소의 사용 가능한 소스로 나타납니다. 자세한 내용은 [탐색 메뉴 사용 애플리케이션](../../site-building/site-navigation/using-the-navigation-menus-application.md) 을 참조하십시오.

## 추가 정보

* [개체 만들기](./creating-and-managing-objects/creating-objects.md)
* [컬렉션 및 컬렉션 페이지 정보](../../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)
* [표시 페이지 템플릿 사용](../../site-building/displaying-content/using-display-page-templates.md)
