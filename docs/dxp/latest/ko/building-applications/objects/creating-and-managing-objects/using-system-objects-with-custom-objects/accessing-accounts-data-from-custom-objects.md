# 사용자 정의 개체에서 계정 데이터에 액세스

{bdg-secondary}`라이프레이 7.4 U35+/GA35+`

일부 사용 사례에서는 사용자 정의 개체의 계정 데이터에 액세스할 수 있습니다. 예를 들어, 맞춤형 반품 애플리케이션을 구축하는 경우 반품 요청을 생성할 때 사용자에게 원하는 계정과 우편 주소를 선택하라는 메시지를 표시할 수 있습니다. 이 시나리오에서 사용자는 반품 애플리케이션에 있는 동안 기존 계정 및 주소 항목에 액세스해야 합니다.

이를 달성하기 위해 Liferay는 개체 관리에서 계정 및 우편 주소 애플리케이션에 대한 액세스를 제공합니다. 여기에서 개체와 사용자 정의 개체 간의 관계를 정의할 수 있습니다. 일단 정의되면 사용자는 사용자 정의 개체에 생성된 관계 필드를 사용하여 원하는 계정 및 우편 주소 항목을 선택할 수 있습니다.

![Create relationships from the Account and Postal Address objects to your custom object.](./accessing-accounts-data-from-custom-objects/images/01.png)

```{note}
계정 개체는 일반 계정 데이터(예: 이름, 이메일)를 저장하고 우편 주소 개체는 계정에 대한 청구 및 배송 주소를 저장합니다. 우편 주소 항목은 계정 UI에서 생성되며 해당 항목이 생성된 개별 계정으로 범위가 지정됩니다.
```

사용자 정의 개체를 계정 및 우편 주소 시스템 개체에 연결할 때 이러한 관계는 시스템 개체 측에서 정의되어야 하며 일대다 유형을 사용해야 합니다. 사용자 정의 개체는 두 관계의 다측면에 있어야 합니다.

사용자 정의 개체에서 계정 및 우편 주소 항목에 액세스하기 위한 관계를 설정하려면 다음 단계를 따르십시오.

1. **전역 메뉴**(![전역 메뉴](../../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 후 **개체를 클릭합니다.** .

1. **계정** 개체 편집을 시작합니다.

1. **관계** 탭으로 이동하여 **추가** 버튼(![추가 버튼](../../../../images/icon-add.png))을 클릭합니다.

1. **라벨** 과 **이름** 을 입력하세요.

1. 유형으로 **일대다** 를 선택합니다.

1. 개체의 경우 **사용자 정의 개체** 를 선택합니다.

   ![Create a one-to-many relationship from the Account object to your custom object.](./accessing-accounts-data-from-custom-objects/images/02.png)

1. **저장** 을 클릭하세요.

1. 개체 관리 페이지로 돌아가서 **우편 주소** 개체 편집을 시작하세요.

1. **관계** 탭으로 이동하여 **추가**(![추가 버튼](../../../../images/icon-add.png))를 클릭합니다.

1. **라벨** 과 **이름** 을 입력하세요.

1. 유형으로 **일대다** 를 선택합니다.

1. 개체의 경우 이전 관계에서와 동일한 **사용자 정의 개체** 를 선택합니다.

1. 매개 변수에 대해 이전에 생성한 계정 개체와 사용자 정의 개체의 **관계** 를 선택합니다.

    우편 주소 항목의 범위가 특정 계정으로 지정되기 때문에 이는 필요합니다. 매개변수는 사용 가능한 주소가 계정 관계의 필드 값에 따라 달라지는 종속 관계를 설정합니다.

    ![Create a one-to-many relationship from the Postal Address object to your custom object and use the custom object's Account relationship as a parameter.](./accessing-accounts-data-from-custom-objects/images/03.png)

1. **저장** 을 클릭하세요.

1. 사용자 정의 개체의 기본 레이아웃 및 보기에 관계 필드를 추가합니다. 자세한 지침은 [객체 레이아웃 디자인](../layouts/designing-object-layouts.md) 및 [객체 뷰 디자인](../views/designing-object-views.md)을 참조하세요.

    ![Add the relationship fields to the custom object's default layout and view.](./accessing-accounts-data-from-custom-objects/images/04.png)

추가되면 사용자는 사용자 정의 개체에서 사용 가능한 계정과 주소 중에서 선택할 수 있습니다. 사용 가능한 계정 옵션은 사용자의 계정 멤버십에 따라 다르며 사용 가능한 주소는 선택한 계정에 따라 다릅니다.

![Users can select from available accounts and addresses in the custom object.](./accessing-accounts-data-from-custom-objects/images/05.png)

```{tip}
기본적으로 개체는 제목 필드에 항목 ID를 사용합니다. 제목 필드 값에 따라 관계 필드에서 각 항목 옵션이 최종 사용자에게 표시되는 방식이 결정됩니다. 원하는 경우 각 개체가 제목에 다른 필드를 사용하도록 구성하여 가독성을 향상시킬 수 있습니다.

이렇게 하려면 원하는 개체 정의 편집을 시작하고 *세부 사항* 탭으로 이동한 다음 *제목 필드*에 다른 값을 선택합니다. 완료되면 *저장*을 클릭합니다.
```

## 관련 주제

* [계정](../../../../users-and-permissions/accounts.md)
* [시스템 개체 확장](../extending-system-objects.md)
* [객체 관계 정의](../relationships/defining-object-relationships.md)
* [계정별로 객체 데이터 접근 제한](./restricting-access-to-object-data-by-account.md)
