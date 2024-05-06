---
toc:
  - ./architecture/liferay-classloader-hierarchy.md
  - ./architecture/the-benefits-of-modularity.md
  - ./architecture/osgi-and-modularity.md
  - ./architecture/module-lifecycle.md
  - ./architecture/bundle-classloading-flow.md
  - ./architecture/ui-architecture.md
---
# 아키텍처

Liferay DXP/포탈 아키텍처는 세 부분으로 구성됩니다:

1. **Core:** 부트스트랩 DXP 및 해당 [프레임워크](../building-applications/core-frameworks.md). 코어는 서비스, UI 구성 요소 및 사용자 지정을 관리하기 위한 런타임 환경을 제공합니다.

1. **서비스:** Java API 및 웹 API를 통해 DXP 기능 및 사용자 지정 기능을 노출합니다.

1. **UI:** 포털, 사이트, 페이지, 위젯 및 콘텐츠를 추가하기 위한 웹 애플리케이션 UI(선택 사항)입니다.

[REST API](../headless-delivery/consuming-apis/consuming-rest-services.md) 또는 [GraphQL API](../headless-delivery/consuming-apis/consuming-graphql-apis.md)를 통해 UI와 서비스를 함께 사용하거나 서비스 사용에만 집중할 수 있습니다.

![사이트에는 콘텐츠와 위젯이 포함되어 있습니다. "헤드리스"---UI 없이도 DXP를 사용할 수 있습니다.](./architecture/images/01.png)

이 아키텍처는 이러한 요구 사항을 충족합니다:

* 공통 개발 기술 사용 지원
* 개발 표준 활용
* 구성 요소 교체 용이
* 빠른 시작과 우수한 성능
* 구성 및 검사가 간편한 런타임

코어는 UI 및 서비스 배포를 지원하고 함께 배선하는 것을 오케스트레이션합니다.

## 핵심

DXP는 애플리케이션 서버에서 실행되는 웹 애플리케이션입니다. 코어는 애플리케이션과 해당 [프레임워크](../building-applications/core-frameworks.md)를 부트스트랩합니다.

이러한 것들을 위한 프레임워크 등이 있습니다:

* 적응형 미디어
* 애플리케이션 설정
* 애플리케이션 보안
* 자산
* 캐시
* 데이터 범위
* 종속성 주입
* 확장/사용자 지정 속성
* 파일 관리
* 지역화
* 로깅
* 메시지 버스
* 일정잡이
* 검색
* 세분화 및 개인화
* 서비스 빌더
* 테스트
* 업그레이드 프로세스
* 바이러스 보호
* 워크플로우

코어는 프레임워크, 서비스, UI를 위한 컴포넌트 런타임 환경을 제공합니다. 다음은 몇 가지 구성 요소 예시입니다:

* [서비스](./fundamentals/apis-as-osgi-services.md)
* [서비스 사용자 지정](./extending-liferay/overriding-osgi-services.md)
* [언어 키 \(현지화된 메시지\)](../liferay-development/building-applications/developing-a-java-web-application/using-mvc/using-localized-messages-in-an-mvc-portlet/sharing-localized-messages.md)
* [JavaScript 애플리케이션 \(템플릿, 라우터 및 리소스\)](../building-applications/developing-a-javascript-application/using-react.md)
* [JSP 사용자 지정](./extending-liferay/customizing-jsps.md)
* [포틀릿 \(템플릿, 컨트롤러 및 리소스\)](../building-applications/developing-a-java-web-application/reference/portlets.md)
* [포틀릿 필터](./extending-liferay/auditing-portlet-activity-with-a-portlet-filter.md)
* [주제](../site-building/site-appearance/themes/introduction-to-themes.md)

다음 그림은 런타임 환경에서 이러한 컴포넌트 유형을 보여줍니다.

![코어는 여기와 같은 컴포넌트를 위한 런타임 환경을 제공합니다. 새로운 컴포넌트 구현은 기존 구현을 동적으로 확장하거나 대체할 수 있습니다.](./architecture/images/02.png)

런타임 환경은 구성 요소를 즉시 추가, 교체 및 사용자 지정할 수 있도록 지원합니다. 이를 통해 다음과 같은 시나리오가 가능합니다:

**교체:** 기존 컴포넌트 `ServiceC Impl 1`, `ServiceC Impl 2` 보다 높은 순위의 `ServiceC Impl 2` 컴포넌트가 사용되는 경우.

**사용자 지정:** `포틀렛 필터` 는 `포틀렛`의 요청과 응답을 가로채고 수정하여 `포틀렛` 이 표시하는 콘텐츠에 영향을 줍니다.

컴포넌트 WAR 및 [모듈 JAR 프로젝트](./fundamentals/module-projects.md) 설치는 [OSGi 번들](https://www.osgi.org/) (모듈)로 합니다. Liferay의 OSGi 프레임워크는 모듈 수명 주기를 정의하고, 종속성을 적용하며, 클래스 로딩 구조를 정의하고, 모듈 및 컴포넌트 관리를 위한 API와 CLI([Felix Gogo Shell](./fundamentals/using-an-osgi-service.md))를 제공합니다. 코어는 [포털 속성 파일](../installation-and-upgrades/reference/portal-properties.md) 및 [시스템 설정](../system-administration/configuring-liferay/system-settings.md)을 통해 구성됩니다.

서비스 구성 요소는 비즈니스 기능을 제공합니다.

## 서비스

비즈니스 로직은 컴포넌트 런타임 환경에 배포된 서비스에서 구현됩니다. 기본 제공 핵심 서비스 및 프레임워크 서비스는 [사용자](../users-and-permissions/users/understanding-users.md), [역할](../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md), [웹 콘텐츠](../content-authoring-and-management/web-content/web-content-articles/adding-a-basic-web-content-article.md), [문서 및 미디어](../content-authoring-and-management/documents-and-media.md)등과 같은 모델에서 작동합니다. 사용자 지정 서비스를 통해 새로운 모델과 기능을 도입할 수 있습니다. 서비스 컴포넌트는 종속성 주입을 통해 서로 액세스할 수 있습니다.

프런트엔드 애플리케이션은 서비스를 호출하여 작업을 수행합니다. Java API를 사용하여 서비스를 직접 호출하는 Java 기반 애플리케이션을 배포할 수 있습니다. DXP에 배포되었는지 여부에 관계없이 모든 웹 기반(Java 및 비 Java) 애플리케이션은 [OpenAPI](https://swagger.io/docs/specification/about/) 표준을 준수하는 [REST API](../headless-delivery/consuming-apis/consuming-rest-services.md) , [GraphQL API](../headless-delivery/consuming-apis/consuming-graphql-apis.md), 일반 웹/REST 서비스 등 웹 API를 사용할 수 있습니다. 다음 그림은 Liferay 서비스를 호출하는 애플리케이션과 외부 클라이언트를 보여줍니다.

![로컬 및 원격 애플리케이션은 REST 웹 API를 통해 서비스를 호출할 수 있습니다. Java 기반 포틀릿은 Java API를 통해 서비스를 호출할 수도 있습니다.](./architecture/images/03.png)

Liferay 서비스는 [서비스 빌더](../building-applications/data-frameworks/service-builder.md) 를 사용하여 빌드하고 [REST 빌더](../headless-delivery/apis-with-rest-builder.md)를 사용하여 REST-ful로 만들었습니다. 이 서비스는 [재정의 및 확장](./extending-liferay/overriding-osgi-services.md) 도 쉽게 사용할 수 있습니다.

웹 기반 UI는 브라우저에서 콘텐츠와 서비스 기능을 사용할 수 있게 해줍니다.

## UI

이 UI는 사람들이 업무를 수행하고 [공동 작업](../collaboration-and-social/collaboration-and-social-overview.md), 콘텐츠를 즐길 수 있도록 도와줍니다. UI의 구성은 다음과 같습니다:

* [DXP 애플리케이션](../site-building/getting-started-with-site-building.md): 포털, 사이트, 사용자, 페이지, 위젯 등을 관리하기 위한 웹 애플리케이션입니다.

* [애플리케이션](../building-applications/developing-a-java-web-application.md): 이미 배포된 서비스에 대한 사용자 인터페이스를 제공하는 위젯입니다.

* [테마](../site-building/site-appearance/themes/introduction-to-themes.md): 독특한 모양과 느낌의 사이트 스타일링용 플러그인입니다.

[UI 아키텍처](./architecture/ui-architecture.md) 문서에서 UI 컴포넌트 개발 및 사용자 지정에 대해 자세히 알아보세요.

보시다시피 이 아키텍처는 서비스, UI 구성 요소 및 사용자 지정 개발을 지원합니다. 아키텍처 섹션에서는 코어, 서비스 및 UI 주제를 다룹니다. 다음으로 코어에 대해 자세히 알아보고 클래스 로딩, 모듈성 등에 대해 알아보세요. 하지만 원하는 경우 모든 서비스 또는 [UI 아키텍처](./architecture/ui-architecture.md) 주제로 건너뛸 수 있습니다. 건축물을 탐험해 보세요!
