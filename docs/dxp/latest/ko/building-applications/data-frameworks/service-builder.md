---
toc:
- ./service-builder/service-builder-basics.md
- ./service-builder/defining-entities.md
- ./service-builder/business-logic-with-service-builder.md
---
# 서비스 빌더

신뢰할 수 있는 비즈니스 로직이나 지속성이 없는 애플리케이션은 전혀 애플리케이션이 아닙니다. 안타깝게도 자체 지속성 코드를 작성하는 데는 종종 많은 시간이 걸립니다. Service Builder는 단일 `xml` 파일에서 모델, 지속성 및 서비스 계층을 생성할 수 있는 개체 관계형 매핑 도구입니다. 코드가 생성되면 완전히 사용자 정의할 수 있습니다. 필요한 경우 사용자 정의 SQL과 함께 고유한 지속성 코드를 작성할 수 있습니다. 지속성 코드를 생성하는 방법에 관계없이 Service Builder를 사용하여 앱의 비즈니스 로직을 구현할 수 있습니다.

여기에서는 Service Builder를 사용하여 다음을 수행하는 방법을 배웁니다.

* 지속성 프레임워크 생성 및 사용자 지정

* 비즈니스 로직 구현

`service.xml` 파일에서 모델과 해당 관계를 구성하고 Service Builder를 실행하면 다음과 같은 코드 레이어가 생성됩니다.

* **모델 레이어:** 은 프로젝트의 엔터티를 나타내는 개체를 정의합니다.

* **지속성 계층:** 은 엔티티를 데이터베이스에 저장하고 데이터베이스에서 엔티티를 검색합니다.

* **서비스 계층:** API 및 비즈니스 로직을 생성할 수 있는 빈 계층입니다.

다음은 몇 가지 주요 기능입니다.

* 맞춤형 비즈니스 로직을 구현하기 위한 스터브 아웃 클래스

* 최대 절전 모드 구성

* 구성 가능한 캐싱 지원

* 사용자 지정 SQL 쿼리 및 동적 쿼리를 추가하기 위한 유연성 및 지원

```{note}
DXP/Portal에서 백엔드 서비스를 위해 Service Builder를 사용할 필요가 없습니다. JPA 또는 Hibernate와 같은 선택한 지속성 프레임워크를 사용하는 것은 전적으로 가능합니다. 내부적으로 Service Builder는 [Hibernate](http://hibernate.org/) 을 사용합니다. 
```

## 구현 클래스를 통한 사용자 지정

Service Builder에서 생성된 엔터티에는 다음과 같은 **구현** 클래스가 포함됩니다.

* **엔터티 구현**(`*Impl.java`): 엔터티 커스터마이징을 담당합니다.

* **로컬 서비스 구현**(`*LocalServiceImpl.java`): 지속성 계층을 호출하여 데이터 엔터티를 검색하고 저장합니다. 로컬 서비스에는 비즈니스 논리가 포함되어 있으며 지속성 계층에 액세스합니다. 동일한 JVM(Java Virtual Machine)에서 실행되는 클라이언트 코드에 의해 호출될 수 있습니다.

* **원격 서비스 구현**(`*ServiceImpl.java`): `service.xml` 가 원격 서비스용으로 구성된 경우 생성됩니다. 원격 서비스에는 일반적으로 권한 확인 코드가 포함되어 있으며 JVM 외부에서 액세스할 수 있습니다. Service Builder는 JSON 또는 SOAP를 통해 원격 서비스를 사용할 수 있도록 하는 코드를 자동으로 생성하며 [REST Builder](../../headless-delivery/apis-with-rest-builder.md)  또는 [JAX-RS](https://help.liferay.com/hc/ko/articles/360031902292-JAX-RS) 을 통해 고유한 원격 API를 생성할 수도 있습니다.

이러한 클래스는 사용자 정의 비즈니스 로직을 구현하는 곳입니다. 사용자 지정을 위해 Service Builder에서 생성되는 유일한 클래스입니다.

## 최대 절전 모드 구성

Service Builder는 개체 관계형 매핑을 위해 Hibernate 지속성 프레임워크를 사용합니다. Service Builder는 동적 쿼리 및 사용자 정의 SQL과 같은 기술에 대한 액세스를 제공하면서 Hibernate의 복잡성을 숨깁니다. Hibernate 환경을 수동으로 설정하거나 구성하지 않고도 프로젝트에서 ORM(Object-Relational Mapping)을 활용할 수 있습니다.

## 캐싱

Service Builder는 **entity** , **finder** 및 **Hibernate** 의 세 가지 수준에서 개체를 캐시합니다. 기본적으로 Liferay는 이러한 각 캐시 수준에 대한 기본 캐시 공급자로 Ehcache를 사용합니다. 그러나 이것은 [포털 속성](../../installation-and-upgrades/reference/portal-properties.md)을 통해 구성할 수 있습니다. 프로젝트에서 엔터티 및 파인더 캐싱을 활성화하려면 `service.xml` 파일에서 엔터티의 `<entity>` 요소의 `cache-enabled=true` 속성을 설정하기만 하면 됩니다. [Liferay 클러스터링](../../installation-and-upgrades/setting-up-liferay/clustering-for-high-availability.md) 은 클러스터의 Liferay 캐싱을 설명합니다.

## 동적 쿼리 및 사용자 지정 SQL 쿼리

Service Builder는 데이터베이스 지속성 코드 생성과 관련된 많은 공통 작업을 자동화하지만 사용자 지정 SQL 쿼리 생성을 방해하지는 않습니다. XML 파일에서 사용자 지정 SQL 쿼리를 정의하고 쿼리를 실행하는 파인더 메서드를 구현할 수 있습니다. 할 일이 있다면 Service Builder가 방해가 되지 않습니다. 또한 동적 쿼리를 사용하여 Hibernate의 기준 API에 액세스할 수 있습니다.

## 다음

Service Builder는 Liferay DXP 및 해당 응용 프로그램 전체에서 독점적으로 사용되므로 충분히 테스트되고 강력합니다. 초기 개발 시간과 프로젝트를 유지 관리, 확장 또는 사용자 지정하는 데 소요되는 시간 모두에서 많은 개발 시간을 절약할 수 있습니다. 시작하려면 [서비스 빌더 기본 사항](./service-builder/service-builder-basics.md) 부터 시작하십시오.
