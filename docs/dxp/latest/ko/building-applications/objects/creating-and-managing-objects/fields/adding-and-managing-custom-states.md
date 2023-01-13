# 사용자 정의 상태 추가 및 관리

{bdg-secondary}`사용 가능한 Liferay 7.4 U41+/GA41+`

일부 사용 사례에서는 객체 항목에 동시에 여러 상태를 할당해야 할 수 있습니다. 예를 들어 주문 애플리케이션을 구축할 때 각각 고유한 흐름과 관련 비즈니스 로직이 있는 동일한 항목에 대한 주문, 결제 및 배송 상태를 할당하고 관리해야 할 수 있습니다. 사용자 지정 개체와 함께 Liferay 선택 목록을 사용하면 이 기능을 수행할 수 있습니다.

선택 목록 [](../../picklists.md)를 사용하면 문자열 목록을 정의하고 개체 필드로 사용하여 항목에 대한 사용자 정의 상태를 정의할 수 있습니다. 개체 정의에 추가되면 각 상태에 대한 흐름을 설계하고 [유효성 검사](../validations/adding-custom-validations.md) 및 [작업](../actions/defining-object-actions.md) 을 사용하여 다른 상태에 대한 비즈니스 논리를 추가할 수 있습니다. 상태는 [워크플로 상태](../../enabling-workflows-for-objects.md) 과 함께 사용하여 더 복잡한 검토 및 승인 프로세스를 정의할 수도 있습니다.

![선택 목록을 사용하여 개체 정의에 사용자 정의 상태를 추가합니다.](./adding-and-managing-custom-states/images/01.png)

## 개체 정의에 상태 필드 추가

1. *글로벌 메뉴* (![Global Menu](../../../../images/icon-applications-menu.png))을 열고 *제어판* 탭으로 이동하여 *선택 목록*을 클릭합니다.

1. 원하는 항목으로 선택 목록을 만듭니다. 이러한 항목은 개체 항목 상태를 정의합니다. 자세한 단계는 [선택 목록 만들기](../../picklists/using-picklists.md#creating-a-picklist) 을 참조하십시오.

   ```{note}
   초안 및 게시된 개체 정의 모두에 대한 선택 목록 항목을 언제든지 추가, 제거 또는 편집할 수 있습니다.
   ```

   ![원하는 항목으로 선택 목록을 만듭니다.](./adding-and-managing-custom-states/images/02.png)

1. *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png))을 열고 *Control Panel* 탭으로 이동하여 *Objects*을 클릭합니다.

1. 원하는 사용자 정의 개체 편집을 시작합니다.

1. *Fields* 탭으로 이동하여 *Add* (![Add Button](../../../../images/icon-add.png))를 클릭합니다.

   ![개체 정의에 필드 추가를 시작합니다.](./adding-and-managing-custom-states/images/03.png)

1. *레이블* 및 *필드 이름*을 입력합니다.

1. *선택 목록 유형* 을 선택하고 원하는 목록을 선택합니다.

1. *상태*로 표시를 전환합니다.

   ```{note}
   상태 필드는 자동으로 *필수*로 설정되며 선택 사항으로 변경할 수 없습니다.
   ```

1. 상태 필드에 대해 *기본값* 을 선택합니다.

   ![선택 목록을 선택하고 상태로 표시를 토글하고 필드의 기본값을 설정합니다.](./adding-and-managing-custom-states/images/04.png)

1. *저장*을 클릭합니다.

필드를 정의에 추가</a> 후 흐름을
하여 각 상태에 사용할 수 있는 전환을 결정할 수 있습니다.</p> 



## 상태 필드에 대한 흐름 설정

기본적으로 각 상태는 다른 모든 상태로 전환할 수 있습니다. 그러나 항목이 원하는 프로세스를 거치도록 전환을 제한할 수 있습니다.

상태 필드에 대한 사용자 정의 흐름을 설정하려면 다음 단계를 따르십시오.

1. 사용자 정의 개체를 편집하는 동안 *상태 관리자* 탭으로 이동하여 원하는 *상태 필드*를 선택합니다.
   
   ![상태 필드에 대한 흐름을 설정하려면 상태 관리자 탭으로 이동합니다.](./adding-and-managing-custom-states/images/05.png)

1. 다음 상태에서 드롭다운 메뉴를 클릭하고 상자를 선택하여 각 상태에 대해 사용 가능한 전환을 결정합니다.
   
   상태에 대한 전환 수를 원하는 만큼 선택할 수 있습니다.
   
   ![상태 간에 사용 가능한 전환을 결정합니다.](./adding-and-managing-custom-states/images/06.png)

1. *저장*을 클릭합니다.

일단 저장되면 사용자는 정의된 흐름에 따라서만 항목의 상태를 전환할 수 있습니다.

![사용자 정의 흐름을 설정하면 각 상태에 대해 사용 가능한 전환이 결정됩니다.](./adding-and-managing-custom-states/images/07.png)



## 추가 정보

* [선택목록](../../picklists.md)
* [분야](../fields.md)
* [개체에 필드 추가](../fields/adding-fields-to-objects.md)
