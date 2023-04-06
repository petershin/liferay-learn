---
toc:
- ./architecture/liferay-classloader-hierarchy.md
- ./architecture/the-benefits-of-modularity.md
- ./architecture/osgi-and-modularity.md
- ./architecture/module-lifecycle.md
- ./architecture/bundle-classloading-flow.md
- ./architecture/ui-architecture.md
---

# 건축학

```{toctree}
:maxdepth: 3

architecture/liferay-classloader-hierarchy.md
architecture/the-benefits-of-modularity.md
architecture/osgi-and-modularity.md
architecture/module-lifecycle.md
architecture/bundle-classloading-flow.md
architecture/ui-architecture.md
```

Liferay DXP/Portal 아키텍처는 세 부분으로 구성됩니다.

1. **코어:** 부트스트랩 DXP 및 해당 프레임워크 [개](../building-applications/core-frameworks.md). Core는 서비스, UI 구성 요소 및 사용자 지정을 관리하기 위한 런타임 환경을 제공합니다.

1. **서비스:** Java API 및 웹 API를 통해 DXP 기능 및 사용자 지정 기능을 노출합니다.

1. **UI:** 포털, 사이트, 페이지, 위젯 및 콘텐츠를 추가하기 위한 선택적 웹 애플리케이션 UI입니다.

UI와 서비스를 함께 사용하거나 [REST API](../headless-delivery/consuming-apis/consuming-rest-services.md) 또는 [GraphQL API](../headless-delivery/consuming-apis/consuming-graphql-apis.md)을 통해 서비스 사용에만 집중할 수 있습니다.

![사이트에는 콘텐츠와 위젯이 포함되어 있습니다. DXP는 "헤드리스"---UI 없이도 사용할 수 있습니다.](./architecture/images/01.png)

아키텍처는 다음 요구 사항을 충족합니다.

* 공통 개발 기술 사용 지원
* 개발 표준 활용
* 부품 교환 용이
* 빠르게 시작하고 잘 수행합니다.
* 런타임은 구성 및 검사가 쉽습니다.

Core는 UI 및 서비스 배포를 지원하고 이들을 함께 연결하도록 오케스트레이션합니다.

## 핵심

DXP는 애플리케이션 서버에서 실행되는 웹 애플리케이션입니다. Core는 애플리케이션과 [프레임워크를 부트스트랩합니다](../building-applications/core-frameworks.md).

다음과 같은 것들을 위한 프레임워크가 있습니다.

* 어댑티브 미디어
* 애플리케이션 설정
* 애플리케이션 보안
* 자산
* 캐시
* 데이터 범위
* 의존성 주입
* 확장/맞춤 속성
* 파일 관리
* 지역화
* 벌채 반출
* 메시지 버스
* 일정잡이
* 검색
* 세분화 및 개인화
* 서비스 빌더
* 테스트
* 업그레이드 프로세스
* 바이러스 방지
* 워크플로우

Core는 프레임워크, 서비스 및 UI에 대한 구성 요소 런타임 환경을 제공합니다. 다음은 몇 가지 구성 요소의 예입니다.

* [서비스](./fundamentals/apis-as-osgi-services.md)
* [서비스 맞춤화](./extending-liferay/overriding-osgi-services.md)
* [언어 키 \(현지화된 메시지\)](../building-applications/developing-a-java-web-application/using-mvc/sharing-localized-messages.md)
* [JavaScript 애플리케이션 \(템플릿, 라우터 및 리소스\)](../building-applications/developing-a-javascript-application/using-react.md)
* [JSP 사용자 정의](./extending-liferay/customizing-jsps.md)
* [포틀릿 \(템플릿, 컨트롤러 및 리소스\)](../building-applications/developing-a-java-web-application/reference/portlets.md)
* [포틀릿 필터](./extending-liferay/auditing-portlet-activity-with-a-portlet-filter.md)
* [주제](../site-building/site-appearance/themes/introduction-to-themes.md)

다음 그림은 런타임 환경에서 이러한 구성 요소 유형을 보여줍니다.

![Core는 여기에 있는 것과 같은 구성 요소에 대한 런타임 환경을 제공합니다. 새로운 구성 요소 구현은 기존 구현을 동적으로 확장하거나 대체할 수 있습니다.](./architecture/images/02.png)

런타임 환경은 즉각적인 구성 요소 추가, 교체 및 사용자 정의를 지원합니다. 이는 다음과 같은 시나리오를 가능하게 합니다.

**교체:** `ServiceC Impl 2` 구성 요소가 기존 구성 요소 `ServiceC Impl 1`보다 순위가 높으면 `ServiceC Impl 2` 이 사용됩니다.

**사용자 지정:** `PortletA 필터` `PortletA`에 대한 요청과 응답을 가로채고 수정하여 콘텐츠 `PortletA` 표시에 영향을 미칩니다.

구성 요소 WAR 및 [모듈 JAR 프로젝트](./fundamentals/module-projects.md) [OSGi 번들](https://www.osgi.org/) (모듈)로 설치됩니다. Liferay의 OSGi 프레임워크는 모듈 수명 주기를 정의하고, 종속성을 적용하고, 클래스 로딩 구조를 정의하고, 모듈 및 구성 요소를 관리하기 위한 API 및 CLI([Felix Gogo Shell](./fundamentals/using-an-osgi-service.md))를 제공합니다. Core는 [포털 속성 파일](../installation-and-upgrades/reference/portal-properties.md) 및 [시스템 설정](../system-administration/configuring-liferay/system-settings.md)을 통해 구성됩니다.

서비스 구성 요소는 비즈니스 기능을 제공합니다.

## 서비스

비즈니스 논리는 구성 요소 런타임 환경에 배포된 서비스에서 구현됩니다. 기본 제공 핵심 서비스 및 프레임워크 서비스는 [사용자](../users-and-permissions/users/understanding-users.md), [역할](../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md), [웹 콘텐츠](../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md), [문서 및 미디어](../content-authoring-and-management/documents-and-media.md)등과 같은 모델에서 작동합니다. 맞춤형 서비스를 통해 새로운 모델과 기능을 도입할 수 있습니다. 서비스 구성 요소는 종속성 주입을 통해 서로 액세스할 수 있습니다.

프런트 엔드 애플리케이션은 작업을 수행하기 위해 서비스를 호출합니다. Java API를 사용하여 직접 서비스를 호출하는 Java 기반 애플리케이션을 배포할 수 있습니다. DXP에 배포되었는지 여부에 [없이 모든 웹 기반(Java 및 비 Java) 애플리케이션은 OpenAPI](https://swagger.io/docs/specification/about/) 표준을 준수하는 [REST API](../headless-delivery/consuming-apis/consuming-rest-services.md) , [GraphQL API](../headless-delivery/consuming-apis/consuming-graphql-apis.md)및 일반 웹/REST를 포함한 웹 API를 사용할 수 있습니다. 서비스. 다음 그림은 Liferay 서비스를 호출하는 애플리케이션 및 외부 클라이언트를 보여줍니다.

![로컬 및 원격 애플리케이션은 REST 웹 API를 통해 서비스를 호출할 수 있습니다. Java 기반 포틀릿은 Java API를 통해 서비스를 호출할 수도 있습니다.](./architecture/images/03.png)

Liferay 서비스는 [서비스 빌더](../building-applications/data-frameworks/service-builder.md) 사용하여 구축되고 [REST Builder](../headless-delivery/apis-with-rest-builder.md)사용하여 REST-ful을 만듭니다. 서비스는 [재정의 및 확장](./extending-liferay/overriding-osgi-services.md) 도 쉽습니다.

웹 기반 UI를 통해 브라우저에서 콘텐츠 및 서비스 기능을 사용할 수 있습니다.

## UI

UI는 사람들이 일하고, [](../collaboration-and-social/collaboration-and-social-overview.md)작업하고, 콘텐츠를 즐기는 데 도움이 됩니다. UI 구성은 다음과 같습니다.

* [DXP 애플리케이션](../site-building/introduction-to-site-building.md): 포털, 사이트, 사용자, 페이지, 위젯 등을 관리하기 위한 웹 애플리케이션입니다.

* [애플리케이션](../building-applications/developing-a-java-web-application.md): 이미 배포된 서비스에 대한 사용자 인터페이스를 제공하는 위젯.

* [테마](../site-building/site-appearance/themes/introduction-to-themes.md): 사이트를 독특한 모양과 느낌으로 스타일링하기 위한 플러그인입니다.

[UI 아키텍처](./architecture/ui-architecture.md) 기사는 UI 구성 요소 개발 및 사용자 지정에 대해 자세히 설명합니다.

보시다시피 아키텍처는 개발 서비스, UI 구성 요소 및 사용자 지정을 지원합니다. 아키텍처 섹션에서는 코어, 서비스 및 UI 주제를 다룹니다. 다음으로 코어에 대해 자세히 알아보고 클래스 로딩, 모듈성 등을 알아보세요. 그러나 원하는 경우 모든 서비스 또는 [UI 아키텍처](./architecture/ui-architecture.md) 주제로 바로 이동할 수 있습니다. 건축물 탐험을 즐기세요!
