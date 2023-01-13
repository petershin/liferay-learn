# 계정별 개체 데이터에 대한 액세스 제한

{bdg-secondary}`사용 가능한 Liferay 7.4 U34+/GA34+`

비즈니스 [계정](../../../../users-and-permissions/accounts.md)이 여러 개인 시나리오에서는 계정별로 개체 항목에 대한 액세스를 제한할 수 있습니다. 이렇게 하려면 사용자 정의 개체가 계정 시스템 개체와 활성 [관계](../defining-object-relationships.md) 을 가져야 하며 입력 데이터를 제한하기 위해 이 관계를 사용하도록 사용자 정의 개체를 구성해야 합니다. 일단 설정되면 사용자 정의 개체에 항목을 추가하는 사람은 계정을 선택해야 합니다. 이 계정이 항목의 소유자가 되므로 계정 구성원만 액세스할 수 있습니다.

![계정별로 사용자 정의 개체 항목에 대한 액세스를 제한합니다.](./restricting-access-to-object-data-by-account/images/01.png)

계정을 사용하여 사용자 정의 개체 항목에 대한 액세스를 제한하려면 다음 단계를 따르십시오.

1. *Global Menu* (![Global Menu](../../../../images/icon-applications-menu.png))을 열고 *Control Panel* 탭으로 이동하여 *Objects*을 클릭합니다.

1. 계정 시스템 개체 편집을 시작합니다.

1. *일대다* 또는 *다대다* 관계를 추가하여 계정 개체를 원하는 사용자 정의 개체에 연결합니다. 자세한 내용은 [객체 관계 정의](../relationships/defining-object-relationships.md) 을 참조하십시오.

   ![계정 시스템 개체를 원하는 사용자 정의 개체에 연결합니다.](./restricting-access-to-object-data-by-account/images/02.png)

1. 개체 페이지로 돌아가서 원하는 사용자 정의 개체 편집을 시작합니다.

1. 세부 정보 탭에서 *계정 제한* 을 활성화로 전환하고 관련 항목에 사용할 *계정 관계* 를 선택합니다.

   ![계정 제한을 활성화로 전환하고 사용하려는 계정 관계를 선택합니다.](./restricting-access-to-object-data-by-account/images/03.png)

1. *저장*을 클릭합니다.

이렇게 하면 새 필수 계정 선택 필드가 개체에 추가되므로 항목을 추가하는 사람은 누구나 계정을 선택해야 합니다. 사용 가능한 옵션은 사용자의 계정 구성원 자격에 따라 결정됩니다. 일단 설정되면 선택한 계정의 구성원만 항목에 액세스할 수 있습니다.

## 추가 정보

* [계정](../../../../users-and-permissions/accounts.md)
* [시스템 개체 확장](../extending-system-objects.md)
* [개체 관계 정의](../relationships/defining-object-relationships.md)
* [사용자 정의 개체에서 계정 데이터에 액세스](./accessing-accounts-data-from-custom-objects.md)
