# Salesforce에서 개체 사용

{bdg-link-primary}` [베타 기능](../../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) `

Liferay를 사용하면 [사용자 정의 Salesforce 개체](https://help.salesforce.com/s/) 과 통합되고 Salesforce를 외부 저장소 시스템으로 사용하는 개체를 생성할 수 있습니다. 통합되면 Liferay 개체의 데이터는 Salesforce에만 저장되며 사용자가 두 컨텍스트에서 항목을 추가, 업데이트 또는 삭제할 때마다 두 시스템 모두 자동으로 업데이트됩니다.

이 통합을 사용하려면 표준 또는 사용자 정의 Salesforce 개체와 OAuth가 활성화된 Liferay용 Salesforce 연결 앱이 필요합니다. 자세한 내용은 [Salesforce 준비](#preparing-salesforce) 참조하십시오.

!!! note
이 기능을 사용하려면 Proxy Object(LPS-135430)를 활성화해야 합니다. [기능 플래그](../../../../system-administration/configuring-liferay/feature-flags.md) 

## Salesforce 준비 중

Salesforce [연결된 앱](https://help.salesforce.com/s/articleView?id=sf.connected **app** overview.htm&type=5) 은 외부 응용 프로그램이 API 및 표준 프로토콜(예: SAML, OAuth)을 통해 Salesforce 계정과 통합할 수 있도록 허용하는 프레임워크입니다. 계속하기 전에 [연결된 앱](https://help.salesforce.com/s/articleView?id=sf.connected **app** create.htm&type=5) 생성하여 Liferay 인스턴스가 Salesforce와 통합될 수 있도록 하십시오.

![Create a connected app in Salesforce for connecting with your Liferay server.](./using-objects-with-salesforce/images/01.png)

Salesforce에서 연결된 앱을 설정할 때 Liferay와의 API 통합을 위해 [OAuth를 활성화 및 구성](https://help.salesforce.com/s/articleView?id=sf.connected **app** create **api** integration.htm&type=5) 하세요. 이 과정에서 OAuth 고객 키와 비밀번호를 복사하세요. 이러한 세부 정보는 [Liferay 인스턴스를 구성](#configuring-your-liferay-instance) 할 때 필요합니다.

![Enable OAuth for the Liferay connected app and retrieve the OAuth consumer key and secret for use in your Liferay instance.](./using-objects-with-salesforce/images/02.png)

Liferay 객체를 생성하기 전에 [표준](https://help.salesforce.com/s/articleView?id=sf.extend_click_find_objectmgmt_parent.htm&type=5) 또는 [사용자 정의](https://help.salesforce.com/s/articleView?id=sf.dev_objectedit.htm&type=5) Salesforce 객체에 원하는 필드가 모두 포함되어 있는지 확인하세요. Liferay 개체 필드를 해당 필드에 연결하기 전에 이러한 필드를 정의해야 합니다.

![Ensure the custom Salesforce object includes all desired fields](./using-objects-with-salesforce/images/03.png)

## Liferay 인스턴스 구성

Liferay 인스턴스를 Salesforce에 연결하려면 다음 단계를 따르세요.

1. **전역 메뉴**(![전역 메뉴](../../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 후 **인스턴스를 클릭합니다. 설정** .

1. **타사** 를 클릭하고 **Salesforce 통합** 탭으로 이동합니다.

1. [Liferay 연결된 앱에 대한 Salesforce 로그인 정보와 OAuth 자격 증명을 입력하세요](https://help.salesforce.com/s/articleView?id=sf.connected **app** overview.htm&type=5) .

**로그인 URL** 에는 `https://login.salesforce.com/` 또는 Salesforce 도메인의 로그인 URL을 사용할 수 있습니다.

   ![Enter your Salesforce login and connected app OAuth credentials.](./using-objects-with-salesforce/images/04.png)

1. **저장** 을 클릭하세요.

## Salesforce 저장소 유형을 사용하여 Liferay 개체 만들기

Salesforce에 데이터를 저장하기 위한 Liferay 개체를 만드는 작업은 표준 사용자 정의 개체를 만드는 작업과 동일한 표준 프로세스를 따릅니다. 유일한 차이점은 초안 생성 중에 **Salesforce** 저장소 유형을 선택해야 한다는 것입니다. 그러면 Salesforce를 외부 저장소 시스템으로 사용하도록 개체가 구성됩니다. 자세한 지침은 [객체 생성](../../creating-and-managing-objects/creating-objects.md) 참조하세요.

![Select the Salesforce storage type.](./using-objects-with-salesforce/images/05.png)

!!! note
    현재 Salesforce 스토리지 유형은 사용자 지정 [필드]((../../creating-and-managing-objects/fields.md), [보기](../../creating-and-managing-objects/views.md) 및 [레이아웃](../../creating-and-managing-objects/layouts.md)만 지원합니다.

개체 초안을 만든 후 Salesforce 개체의 각 사용자 정의 필드에 대해 [를 추가](../../creating-and-managing-objects/fields/adding-fields-to-objects.md) . 데이터 손실을 방지하려면 각 필드가 원하는 Salesforce 개체의 사용자 정의 필드에 해당하는지 확인하세요. 그런 다음 각 필드를 편집하고 원하는 Salesforce 필드에 연결되는 외부 참조 코드를 추가합니다. 각 ERC에 대해 해당 사용자 정의 Salesforce 필드의 이름을 사용합니다(예: `Title_c`, `Due_Date__c`).

![Use the Salesforce field name for the external reference code.](./using-objects-with-salesforce/images/06.png)

게시된 Liferay 개체의 데이터는 Salesforce에만 저장됩니다. 사용자가 관계의 어느 쪽에서든 항목을 추가, 업데이트 또는 삭제할 때마다 두 시스템 모두 자동으로 업데이트됩니다.

## 관련 주제

* [객체 생성](../../creating-and-managing-objects/creating-objects.md)
* [필드 추가](../../creating-and-managing-objects/fields/adding-fields-to-objects.md)
