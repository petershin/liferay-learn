# Liferay를 헤드리스 플랫폼으로 사용

Liferay는 웹 인터페이스에서 사용할 수 있는 것과 동일한 종류의 작업을 수행하는 API 제품군을 제공합니다. 이는 예를 들어 모바일 애플리케이션, 사용자 정의 웹 애플리케이션 또는 자동화된 프로세스를 작성할 때 기계가 읽을 수 있는 형식으로 데이터를 가져와야 하는 경우에 필수적입니다. 즉시 사용 가능한 인터페이스보다 더 많은 노력을 기울이면서도 작업을 완료하는 데 훨씬 더 강력한 기능이 제공됩니다.

## 연결 방법

클라이언트가 웹 API를 통해 Liferay DXP에 연결할 수 있는 세 가지 접근 방식이 있습니다.
* [__OpenAPI 사양을 준수하는 헤드리스 REST API__](#headless-rest-apis)
* GraphQL 사양을 준수하는 [__GraphQL API__](#graphql-api)
* [__일반 웹/REST 서비스__](#plain-webrest-services), Service Builder에서 생성

### 헤드리스 REST API

Liferay의 헤드리스 API는 Liferay DXP 리소스와 [RESTful](https://www.w3.org/TR/2004/NOTE-ws-arch-20040211/#relwwwrest) 상호 작용을 허용합니다. 이러한 API는 REST 인터페이스의 표준을 정의하는 [OpenAPI 사양](https://swagger.io/docs/specification/about/)을 따르므로 보다 간단한 구현 및 사용이 가능합니다.

`[server][:port]/o/api`에서 실행 중인 Liferay DXP 인스턴스의 정의에 액세스하여 이러한 API에 대한 자세한 정보를 찾을 수 있습니다. 가장 관련 있는 문서는 원시 형식으로 `[server][:port]/o/[api-name]/[api-version]/openapi.[yaml 또는 json]` 에서도 사용할 수 있습니다. 설명서는 [SwaggerHub](https://app.swaggerhub.com/apis/liferayinc/)에서 사용할 수 있지만 실행 중인 버전과 일치하지 않을 수 있습니다.

### GraphQL API

[GraphQL](https://graphql.org/) API는 헤드리스 REST API와 유사한 상호 작용을 지원하지만 유연성이 약간 더 높은 쿼리 언어입니다. Liferay DXP는 `[server][:port]/o/graphql`에서 이 API를 노출합니다.

[GraphQL 클라이언트](https://graphql.org/graphql-js/graphql-clients/)을 통해 API 또는 해당 설명서를 탐색하여 자세한 정보를 찾을 수 있습니다. Liferay에는 실행 중인 인스턴스의 `[server][:port]/o/api` (오른쪽 상단에서 _GraphQL_ 선택)에서 찾을 수 있는 내장 클라이언트가 포함되어 있습니다.

### 일반 웹/REST 서비스

Liferay의 웹 서비스는 이전 프레임워크의 일부이며 여전히 DXP에서 지원하지만 복잡한 헤드리스 작업에는 더 이상 권장되지 않습니다. 이러한 API는 Liferay DXP의 내부 작업과 밀접하게 연결되어 있으므로 최신 헤드리스 옵션이 제공하는 기능과 유연성이 부족합니다.

그러나 웹 서비스는 특정 작업을 실행하는 더 간단한 방법을 제공할 수 있습니다. 사용 방법은 [Service Builder Web Services](../building-applications/data-frameworks/service-builder.md) 을 참조하십시오.

## 특징

### 모든 클라이언트와 작업

Liferay의 헤드리스 API는 웹을 통해 데이터를 제공하므로 웹 호출을 할 수 있는 모든 애플리케이션이 클라이언트 역할을 할 수 있습니다. 이러한 API는 기본적으로 JSON 콘텐츠로 응답하지만 기본적으로 XML도 지원합니다. 확장 프로그램은 필요한 다른 방식으로 콘텐츠를 제공할 수 있습니다. 자세한 내용은 [API 헤더 참조](./consuming-apis/api-headers-reference.md#accept) 을 참조하십시오.

### 안전하게 연결

Liferay의 웹 인터페이스와 마찬가지로 헤드리스 API를 통한 모든 상호 작용은 특정 사용자 계정(또는 게스트)을 사용하여 이루어집니다. Liferay의 API는 기본 인증, OAuth 토큰 및 쿠키를 통한 세 가지 인증 방법을 지원합니다. 이를 수행하는 방법은 [API 헤더 참조](./consuming-apis/api-headers-reference.md#authorization) 을 참조하십시오. 게스트로 API 요청을 하는 것도 가능합니다. 자세한 내용은 [인증되지 않은 요청 만들기](./consuming-apis/making-unauthenticated-requests.md) 을 참조하십시오.

### 데이터 크기를 관리 가능한 상태로 유지

대량의 데이터 세트로 작업하는 것은 클라이언트가 처리하기에 빠르게 부담이 될 수 있습니다. 성능 문제는 사용자를 좌절시키고 대역폭은 비쌀 수 있습니다. Liferay의 헤드리스 API는 컬렉션을 관리 가능한 청크로 분해하고 원하는 정확한 데이터를 검색하는 방법을 제공합니다.

요청에 `페이지` 및 `페이지 크기` 매개변수를 전달하면 한 번에 원하는 정보의 양과 주어진 요청에서 원하는 정보의 하위 집합을 API에 알릴 수 있습니다. `정렬` 매개변수는 페이징된 응답과 함께 사용할 때도 효과적이므로 먼저 반환되어야 하는 요소를 지정할 수 있습니다.

`검색` 매개변수는 키워드 검색을 실행하여 항목의 일부에 해당 키워드를 포함하는 요소를 생성합니다. `필터` 매개변수는 유사한 검색을 실행하지만 콘텐츠가 포함되어야 하는 항목의 정확한 위치를 지정합니다.

`개의 fields` 매개변수는 응답의 각 요소에 열거할 특정 필드만 요청하고, 반대로 `limitsFields` 매개변수는 반환에서 지정된 필드를 제외합니다.

`flatten` 매개변수는 계층적 API에 대해 계층적 컨텍스트에서 요청을 실행합니다. 이를 통해 예를 들어 관련 조직을 찾기 위해 조직도를 탐색할 필요 없이 "마케팅"이라는 조직을 검색할 수 있습니다.

이러한 매개변수를 사용하는 방법에 대한 자세한 내용은 [API 헤더 참조](./consuming-apis/api-headers-reference.md)을 참조하십시오.

## 관련 정보

- [휴식 서비스 이용](../headless-delivery/consuming-apis/consuming-rest-services.md)
- [GraphQL API 사용](../headless-delivery/consuming-apis/consuming-graphql-apis.md)
