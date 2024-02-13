---
toc:
- ./defining-entities/configuring-global-service-options.md
- ./defining-entities/defining-entity-columns.md
- ./defining-entities/modifying-database-fields-in-development.md
- ./defining-entities/defining-entity-relationships.md
- ./defining-entities/sorting-entity-instances.md
- ./defining-entities/defining-entity-finder-methods.md
- ./defining-entities/adding-model-hints.md
---
# 엔터티 정의

엔터티는 서비스의 핵심이자 영혼입니다. Java의 모델 개체와 데이터베이스 필드 및 테이블 간의 맵을 나타냅니다. [서비스 빌더](../service-builder.md) 은 Java 모델을 사용자가 정의한 엔터티에 자동으로 매핑하여 Java 개체를 유지하기 위한 기능을 제공합니다. [모델, 지속성 및 서비스 코드 생성](./service-builder-basics/generating-model-persistence-and-service-code.md) 에 있는 Y7G4 샘플 프로젝트를 고려하십시오. 엔터티의 요약은 다음과 같습니다.

* **이름:** `Y7G4Entry`
* **로컬 서비스:** **예**
* **원격 서비스:** **아니오**

엔터티를 정의하는 방법은 다음과 같습니다.

```xml
<entity local-service="true" name="Y7G4Entry" remote-service="false">
</entity>
```

엔터티의 데이터베이스 테이블 이름에는 네임스페이스가 접두사로 붙은 엔터티 이름이 포함됩니다. Y7G4 예제는 `Y7G4_Y7G4Entry`이라는 하나의 데이터베이스 테이블을 생성합니다.

**Local Service**( `local-service` 속성)을 `true` 로 설정하면 엔티티 서비스에 대한 로컬 인터페이스가 생성됩니다. 로컬 서비스는 배포된 Liferay 서버에서만 호출할 수 있습니다.

**Remote Service**( `remote-service` 속성)을 `true` 로 설정하면 서비스에 대한 JSON 기반 원격 인터페이스가 생성됩니다. 이들은 REST 서비스가 아닙니다. 이를 위해서는 [REST Builder](../../../headless-delivery/apis-with-rest-builder/producing-and-implementing-apis-with-rest-builder.md)을 사용해야 합니다. 엔터티 로컬 서비스를 `true` 로 설정하고 원격 서비스를 `false`으로 설정하여 원격 서비스를 생성하지 않고 완전한 기능을 갖춘 애플리케이션을 구축할 수 있습니다. 그러나 애플리케이션 서비스에 대한 원격 액세스를 활성화하려면 로컬 서비스와 원격 서비스를 모두 `true`로 설정하십시오.

```{tip}
JPA와 같은 다른 프레임워크를 사용하여 구축된 엔터티에 대한 기존 DAO(Data Access Object) 서비스가 있는 경우 로컬 서비스를 ``false``로, 원격 서비스를 ``true``로 설정하면 원격 ``-Impl`` 클래스는 기존 DAO의 메서드를 호출할 수 있습니다. 이를 통해 Liferay의 권한 확인 시스템과 쉽게 통합할 수 있으며 Service Builder에서 생성된 웹 서비스 API에 대한 액세스를 제공합니다. 이것은 매우 편리하고 강력하며 자주 사용되는 Liferay의 기능입니다.
```
