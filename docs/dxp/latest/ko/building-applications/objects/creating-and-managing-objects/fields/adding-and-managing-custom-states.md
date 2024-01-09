# 사용자 정의 상태 추가 및 관리

{bdg-secondary}`liferay 7.4+`

일부 사용 사례에서는 객체 항목에 여러 상태를 동시에 할당해야 할 수도 있습니다. 예를 들어, 주문 애플리케이션을 구축할 때 동일한 항목에 대해 각각 고유한 흐름 및 관련 비즈니스 논리가 있는 주문, 지불 및 배송 상태를 할당하고 관리해야 할 수 있습니다. 사용자 정의 개체와 함께 Liferay 선택 목록을 사용하면 이 기능을 얻을 수 있습니다.

[선택 목록](../../picklists.md) 사용하면 문자열 목록을 정의하고 이를 개체 필드로 사용하여 항목에 대한 사용자 정의 상태를 정의할 수 있습니다. 개체 정의에 추가되면 각 상태에 대한 흐름을 설계하고 [유효성 검사](../validations/adding-field-validations.md) 및 [작업](../actions/defining-object-actions.md) 을 사용하여 다양한 상태에 대한 비즈니스 논리를 추가할 수 있습니다. 또한 상태는 [워크플로 상태](../../enabling-workflows-for-objects.md) 과 함께 사용되어 보다 복잡한 검토 및 승인 프로세스를 정의할 수도 있습니다.

![Use picklists to add custom states to object definitions.](./adding-and-managing-custom-states/images/01.png)

## 객체 정의에 상태 필드 추가

1. **전역 메뉴**(![전역 메뉴](../../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 후 **선택 목록을 클릭합니다** .

1. 원하는 항목으로 선택 목록을 만듭니다. 이러한 항목은 개체 항목 상태를 정의합니다. 자세한 단계는 [선택 목록 만들기](../../picklists/creating-picklists.md) 참조하세요.

   ```{note}
   언제든지 초안 및 게시된 개체 정의 모두에 대한 선택 목록 항목을 추가, 제거 또는 편집할 수 있습니다.
   ```

   ![Create a picklist with the desired items.](./adding-and-managing-custom-states/images/02.png)

1. **전역 메뉴**(![전역 메뉴](../../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 후 **개체를 클릭합니다.** .

1. 원하는 사용자 정의 개체 편집을 시작합니다.

1. **필드** 탭으로 이동하여 **추가**(![추가 버튼](../../../../images/icon-add.png))를 클릭합니다.

   ![Begin adding a field to the object definition.](./adding-and-managing-custom-states/images/03.png)

1. **레이블** 과 **필드 이름** 을 입력합니다.

1. **선택 목록 유형** 을 선택하고 원하는 목록을 선택합니다.

1. **상태로 표시** 를 전환합니다.

   ```{note}
   상태 필드는 자동으로 *필수*로 설정되며 선택 사항으로 변경할 수 없습니다.
   ```

1. 상태 필드에 대한 **기본값** 을 선택합니다.

   ![Select a picklist, toggle Mark as State, and set a default value for the field.](./adding-and-managing-custom-states/images/04.png)

1. **저장** 을 클릭하세요.

정의에 필드를 추가한 후 [을](#setting-up-a-flow-for-state-fields) 하여 각 상태에 사용할 수 있는 전환을 결정할 수 있습니다.

## 상태 필드에 대한 흐름 설정

기본적으로 각 상태는 다른 모든 상태로 전환될 수 있습니다. 그러나 항목이 원하는 프로세스를 거치도록 전환을 제한할 수 있습니다.

상태 필드에 대한 사용자 정의 흐름을 설정하려면 다음 단계를 따르십시오.

1. 사용자 정의 개체를 편집하는 동안 **상태 관리자** 탭으로 이동하여 원하는 **상태 필드** 를 선택하세요.

   ![Go to the State Manager tab to set up a flow for state fields.](./adding-and-managing-custom-states/images/05.png)

1. 다음 상태에서 드롭다운 메뉴를 클릭하고 상자를 선택하여 각 상태에 사용 가능한 전환을 결정합니다.

   상태에 대해 원하는 만큼의 전환을 선택할 수 있습니다.

   ![Determine the available transitions between states.](./adding-and-managing-custom-states/images/06.png)

1. **저장** 을 클릭하세요.

일단 저장되면 사용자는 정의된 흐름에 따라서만 항목 상태를 전환할 수 있습니다.

![Set up a custom flow determines available transitions for each state.](./adding-and-managing-custom-states/images/07.png)

## 관련 주제

* [선택 목록](../../picklists.md)
* [필드](../fields.md)
* [개체에 필드 추가](../fields/adding-fields-to-objects.md)
