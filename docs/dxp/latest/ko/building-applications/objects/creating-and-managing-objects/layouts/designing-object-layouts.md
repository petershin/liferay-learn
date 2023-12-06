# 개체 레이아웃 디자인

{bdg-secondary}`라이프레이 7.4 U31+/GA31+`

레이아웃은 개체 항목을 생성하고 편집할 때 필드와 관계가 표시되는 방식을 정의합니다. 각 레이아웃에는 항목 생성 중 또는 후에 나타나는 다양한 요소가 포함된 여러 탭이 포함될 수 있습니다. 레이아웃을 디자인할 때 두 가지 유형의 탭이 있습니다.

* [필드 탭](#adding-field-tabs) 은 객체 정의에서 직접 생성되었거나 일대다 관계에서 상속된 필드를 표시할 수 있습니다.

* [관계 탭](#adding-relationship-tabs) 은 일대다 또는 다대다 관계의 관계 테이블만 표시할 수 있습니다.

레이아웃을 디자인하는 동안 먼저 필드 탭을 추가해야 하며 그런 다음 다른 탭을 추가할 수 있습니다. 객체 항목 생성 중에는 첫 번째 탭만 나타납니다. 개체 항목을 편집할 때 다른 탭이 나타납니다. 레이아웃 디자인을 마친 후에는 [default](#selecting-a-default-layout) 으로 표시하여 사용하세요.

```{important}
첫 번째 탭은 필드 탭이어야 합니다. 이 탭에는 모든 필수 개체 필드가 포함되어야 합니다. 또한 레이아웃에 필드 탭이 있는 경우에만 관계 탭을 추가할 수 있습니다. 관계 탭은 객체 레이아웃의 첫 번째 탭이 될 수 없습니다.
```

## 레이아웃 추가

1. **전역 메뉴**(![전역 메뉴](../../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 후 **개체를 클릭합니다.** .

1. 원하는 객체 정의 편집을 시작합니다.

   ```{note}
   시스템 객체는 사용자 지정 레이아웃을 지원하지 않습니다. 자세한 내용은 [시스템 객체 확장](../extending-system-objects.md)을 참조하세요.
   ```

1. **레이아웃** 탭으로 이동하여 **추가**(![추가 버튼](../../../../images/icon-add.png))를 클릭합니다.

1. **이름** 을 입력하고 **저장** 을 클릭하세요.

   ![Go to the Layouts tab and click Add.](./designing-object-layouts/images/01.png)

이렇게 하면 [field](#adding-field-tabs) 및 [relationship](#adding-relationship-tabs) 탭을 추가할 수 있는 빈 레이아웃이 생성됩니다.

## 필드 탭 추가

1. **레이아웃** 탭으로 이동하여 **탭 추가** 를 클릭하세요.

   ![Go to the Layout tab and click Add Tab.](./designing-object-layouts/images/02.png)

1. **라벨** 을 입력하고 **필드** 유형을 선택한 다음 **저장** 을 클릭하세요.

   레이블은 Liferay UI에서 탭의 표시 이름을 결정합니다.

   ![Enter a Label, select the Fields type, and click Save.](./designing-object-layouts/images/03.png)

1. **블록 추가** 를 클릭하고 **레이블** 을 입력한 다음 **저장** 을 클릭하세요.

   그러면 필드를 추가하기 위한 하위 섹션이 생성됩니다. 레이블은 Liferay UI에서 섹션의 표시 이름을 결정합니다.

   동일한 탭에 여러 블록을 추가하려면 이 단계를 반복하세요.

   ![Add blocks to the field tab.](./designing-object-layouts/images/04.png)

1. 원하는 블록에 대해 **필드 추가** 를 클릭하고 개체 **필드** 를 선택한 다음 필드의 **크기**(즉, 1개, 2개 또는 3개 열)를 결정하고 **저장** 을 클릭합니다.

   ![Click Add Field, select a field, determine the field's size, and click Save](./designing-object-layouts/images/05.png)

   블록에 더 많은 필드를 추가하려면 이 단계를 반복합니다.

   ![Add fields to the block.](./designing-object-layouts/images/06.png)

1. 토글 스사이트를 사용하여 블록을 접을 수 있게 만듭니다.

   ![Use the toggle switch to make a block collapsible.](./designing-object-layouts/images/07.png)

1. 원하는 탭을 추가한 후 변경 사항을 레이아웃에 저장합니다.

필드 탭을 추가한 후 최종 사용자가 개체 항목에 태그와 범주를 적용할 수 있도록 범주화 도구를 추가할 수 있습니다. 자세한 내용은 [필드 탭에 분류 추가](./adding-categorization-to-fields-tabs.md)를 참조하세요. <!--Add Comments-->

## 관계 탭 추가

1. 원하는 레이아웃을 편집하고 **레이아웃** 탭으로 이동한 다음 **탭 추가** 를 클릭하세요.

   ![Select the desired layout, go to the Layout tab, and click Add Tab.](./designing-object-layouts/images/08.png)

1. **레이블** 을 입력하고 **관계** 유형을 선택한 다음 탭에 표시하려는 **관계 테이블** 을 선택합니다.

   레이블은 Liferay UI에서 탭의 표시 이름을 결정합니다.

   ![For tab type, select Relationships and choose a relationship table to display.](./designing-object-layouts/images/09.png)

1. **저장** 을 클릭하세요.

   ![Add relationship tabs to the layout.](./designing-object-layouts/images/10.png)

1. 원하는 탭을 추가한 후 변경 사항을 레이아웃에 저장합니다.

```{important}
객체 자체에 다대다 관계가 있는 경우 레이아웃에 두 개의 관계 탭을 추가할 수 있습니다. 각 탭은 관계의 한 쪽에 해당합니다. 예를 들어 여러 티켓을 서로 연관시키는 티켓 개체를 생각해 보세요. 티켓과 그 종속성을 추적하기 위해 두 개의 관계 탭을 정의할 수 있습니다. 한 탭에는 현재 티켓이 종속된 모든 티켓이 나열되고, 다른 탭에는 현재 티켓에 종속된 모든 티켓이 나열됩니다. 자세한 내용은 [개체 관계 정의하기](../relationships/defining-object-relationships.md)를 참조하세요.
```

## 기본 레이아웃 선택

레이아웃을 디자인한 후에는 이를 개체의 기본 레이아웃으로 설정할 수 있습니다. 이렇게 하면 객체 항목을 생성하고 편집하는 데 사용됩니다. 그렇지 않으면 개체는 자동 생성된 레이아웃을 사용합니다.

다음과 같이하세요:

1. 원하는 **레이아웃** 을 선택하세요.

1. 기본 세부정보 탭에서 **기본값으로 표시** 를 선택하세요.

   ![Check Mark as Default and click Save.](./designing-object-layouts/images/11.png)

1. **저장** 을 클릭하세요.

이제 개체 항목을 생성하고 편집할 때 레이아웃이 사용됩니다.

![The object uses the default layout for creating and editing entries.](./designing-object-layouts/images/12.png)

## 관련 주제

* [오브젝트 생성](../creating-objects.md)
* [객체에 필드 추가](../fields/adding-fields-to-objects.md)
* [객체 관계 정의](../relationships/defining-object-relationships.md)
