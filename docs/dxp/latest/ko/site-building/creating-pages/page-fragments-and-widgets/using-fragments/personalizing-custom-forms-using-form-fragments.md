# 양식 조각을 사용하여 사용자 지정 양식 개인화하기

양식 조각은 사용자 지정 개체를 기반으로 양식을 자동 생성합니다. Liferay의 기본 제공 양식 조각이 사용 사례를 만족시키지 못하는 경우 사용자 지정 양식 조각을 만들고 [에서 사용자 지정 양식 조각을 필드 유형](#map-custom-form-fragments-to-form-fields)에 매핑하여 양식의 스타일을 변경할 수 있습니다.

사용자 지정 양식 조각은 HTML, CSS 및 JavaScript 코드를 사용하여 사용자 지정 스타일과 기능을 갖춘 요소를 만듭니다. 이렇게 하면 기존 디자인 시스템 및/또는 컴포넌트 라이브러리를 사용하여 양식을 사용자 지정할 수 있습니다. 자세한 내용은 [양식 조각 만들기](../../../developer-guide/developing-page-fragments/creating-form-fragments.md) 를 참조하세요.

```{important}
양식 조각은 사용자 지정 개체와 함께만 사용할 수 있습니다. Liferay는 게시된 개체가 하나 이상 있을 때까지 양식 구성 요소 조각 집합을 숨깁니다. 게시되면 개체에 액세스할 수 있는 사용자는 양식 구성 요소 조각을 보고 사용할 수 있습니다. 자세한 내용은 [객체 만들기](../../../../building-applications/objects/creating-and-managing-objects/creating-objects.md)를 참조하세요.
```

## 사용자 지정 양식 조각을 양식 필드에 매핑하기

양식 필드의 기본 스타일 및 기능을 변경하려면 [사용자 지정 양식 조각](../../../developer-guide/developing-page-fragments/creating-form-fragments.md) 을 필드 유형에 매핑하면 됩니다:

1. *사이트 메뉴* ( ![Site Menu icon](../../../../images/icon-menu.png) )를 열고 *디자인* &rarr; *조각*을 클릭합니다.

1. 조각 애플리케이션에서 *옵션* ( ![Options Icon](../../../../images/icon-options.png) ) 애플리케이션 표시줄에서 &rarr; *구성*을 클릭합니다.

   ![조각의 구성 메뉴를 통해 조각을 필드에 매핑할 수 있습니다.](./personalizing-custom-forms-using-form-fragments/images/01.png)

1. 필드 유형(왼쪽 열)에 적용할 *양식 조각* (오른쪽 열)을 선택합니다.

   ![필드 유형에 사용자 지정 양식 조각을 적용합니다.](./personalizing-custom-forms-using-form-fragments/images/02.png)

1. 사이트 탭에서 조각 세트를 선택합니다. 호환되는 필드 유형을 가진 조각이 나타납니다.

1. 적용하려는 사용자 지정 양식 조각을 선택합니다.

   ![필드와 호환되는 옵션을 선택할 수 있습니다.](./personalizing-custom-forms-using-form-fragments/images/03.png)

콘텐츠 또는 템플릿 페이지에 양식을 추가하여 사용자 지정 조각이 필드 유형에 적용되는지 확인할 수 있습니다. 조각을 사용하여 양식 작성에 대해 자세히 알아보려면 [조각을 사용하여 양식 작성](../../../../building-applications/objects/using-fragments-to-build-forms.md) 을 참조하세요.

필드 유형에 사용자 지정 양식 조각을 적용하면 기본 스타일(오른쪽)이 아닌 새 스타일(왼쪽)이 필드 유형에 적용됩니다.

![사용자 지정 양식 조각에 매핑된 필드(왼쪽)는 기본 제공 조각으로 만든 필드(오른쪽)와 다르게 보입니다.](./personalizing-custom-forms-using-form-fragments/images/04.png)

## 관련 주제

* [조각 구성](./configuring-fragments.md)
* [양식 조각 만들기](../../../developer-guide/developing-page-fragments/creating-form-fragments.md)
* [페이지 조각 개발](../../../developer-guide/developing-page-fragments.md)
* [양식 컴포넌트](./default-fragments-reference.md#form-components)
* [양식 조각 옵션](./configuring-fragments/general-settings-reference.md#form-fragment-options)
* [조각을 사용하여 양식 작성](../../../../building-applications/objects/using-fragments-to-build-forms.md)

