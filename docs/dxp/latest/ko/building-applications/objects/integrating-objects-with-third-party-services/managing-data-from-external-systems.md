# 외부 시스템에서 데이터 관리

{bdg-link-primary}` [베타 기능](../../../시스템-관리/설정-라이프웨이/기능-플래그.md#베타-기능-플래그) `

Liferay Objects는 데이터 구조를 모델링하고 Liferay DXP와 통합된 비즈니스 로직을 구현하기 위한 로우 코드 기능을 제공합니다. 이 프레임워크를 사용하면 사용자 지정 워크플로, 유효성 검사, 알림 등이 포함된 사용자 경험을 만들 수 있습니다.

기본적으로 객체 정의는 Liferay 데이터베이스에 항목 데이터를 저장하기 위한 테이블을 생성합니다. 그러나 개체를 프록시로 작동하도록 구성하여 Salesforce와 같은 외부 데이터 소스에서 데이터를 저장하고 검색하는 데 사용할 수 있습니다.

프록시 스토리지 유형은 시스템 간에 데이터를 복제 및 동기화하는 대신 Liferay 외부의 단일 데이터 소스를 사용합니다. 이를 통해 시스템 간의 데이터 불일치 및 충돌을 줄일 수 있습니다. 이 문제에 대한 다른 접근 방식에는 비용이 많이 들고 복잡한 사용자 지정 솔루션이 포함될 수 있습니다. 프록시 오브젝트를 사용하면 라이프레이의 로우코드 기능을 활용하여 일관된 사용자 경험을 보다 쉽게 제공하는 동시에 접점을 간소화하고 데이터 관리를 간소화할 수 있습니다.

프록시 개체에서 필드는 외부 시스템 데이터베이스의 기존 열에 매핑되므로 데이터 작업은 외부 시스템에서 자산을 직접 생성하거나 업데이트합니다. 예를 들어, 사용자가 객체 항목을 생성하면 Liferay는 외부 시스템 API 엔드포인트에 POST 요청을 수행하여 해당 시스템의 데이터베이스에 데이터를 추가합니다.

```{important}
이 데이터는 Liferay의 데이터베이스에 지속되지 않으므로 프록시 객체에는 몇 가지 제한이 적용됩니다. 사용자는 

* 필드 추가 [검증](../creating-and-managing-objects/validations.md)

* 개체 추가 [relationships](../creating-and-managing-objects/relations.md)

* [Index](../.../.../사용-검색/검색 관리 및 튜닝/검색 관리.md#index-actions) Liferay를 통한 데이터

이러한 제한 사항 외에도 프록시 개체는 표준 개체와 동일한 플랫폼 통합을 공유합니다. 자세한 내용은 [객체 통합 이해](../understanding-object-integrations.md)를 참조하세요.
```

## Liferay에서 프록시 개체 데이터와 상호 작용하기

표준 객체 정의와 마찬가지로 Liferay DXP에서 프록시 객체 데이터를 사용하여 동적 사용자 경험을 생성할 수 있습니다. 정의가 완료되면 Liferay의 페이지 빌더 기능, [클라이언트 확장](../../client-extensions.md)등을 사용하여 프록시 객체 데이터에 액세스하고 표시할 수 있습니다.

개체 데이터에 대한 표시 페이지 만들기, 컬렉션 디스플레이에 데이터 표시, 조각 요소에 입력 값 매핑 등이 그 예입니다.

## 프록시 개체에 대해 지원되는 커넥터

현재 Liferay에는 프록시 개체를 위한 Salesforce에 대한 [베타](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags) 커넥터가 포함되어 있습니다. 이를 통해 프록시 개체를 [사용자 지정 Salesforce 개체](https://help.salesforce.com/s/) 와 통합하여 Salesforce를 외부 저장 시스템으로 사용할 수 있습니다.

이 기능을 사용하려면 프록시 오브젝트(LPS-135430) [기능 플래그](../../../system-administration/configuring-liferay/feature-flags.md)를 활성화하세요.

## 관련 주제

* [개체 통합 이해](../understanding-object-integrations.md)
* [베타 기능 플래그](../../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)
