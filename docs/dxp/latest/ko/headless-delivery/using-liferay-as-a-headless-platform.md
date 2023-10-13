# 라이프 레이를 헤드리스 플랫폼으로 사용

Liferay는 웹 인터페이스에서 사용할 수 있는 것과 동일한 종류의 작업을 수행하는 API 제품군을 제공합니다. 이는 모바일 애플리케이션, 사용자 지정 웹 애플리케이션 또는 자동화된 프로세스를 작성할 때와 같이 기계가 읽을 수 있는 형식으로 데이터를 가져와야 하는 경우에 필수적입니다. 기본 제공 인터페이스보다 더 많은 노력이 필요하지만 작업을 완료하는 데는 훨씬 더 강력한 기능이 제공됩니다.

## 연결 방법

클라이언트가 웹 API를 통해 Liferay DXP에 연결할 수 있는 세 가지 접근 방식이 있습니다:
* [__헤드리스 REST API__](#headless-rest-apis) , OpenAPI 사양 준수
* GraphQL 사양을 준수하는 [**_** GraphQL API **_**](#graphql-api)
* [__일반 웹/REST 서비스__](#plain-webrest-services) , 서비스 빌더에 의해 생성됨

### 헤드리스 REST API

Liferay의 헤드리스 API를 사용하면 [RESTful](https://www.w3.org/TR/2004/NOTE-ws-arch-20040211/#relwwwrest) Liferay DXP 리소스와 상호 작용할 수 있습니다. 이러한 API는 REST 인터페이스에 대한 표준을 정의하는 [OpenAPI 사양](https://swagger.io/docs/specification/about/) 을 따르므로 보다 간단하게 구현하고 사용할 수 있습니다.

이러한 API에 대한 자세한 정보를 보려면 브라우저를 사용하여 Liferay의 API 탐색기( `[server]:[port]/o/api` (예: http://localhost:8080/o/api)에 접속하세요. 또는 명령줄에서 cURL을 사용하여 전체 목록에 액세스합니다. 예를 들어

```
curl \
    "http://localhost:8080/o/api" \
    -u "test@liferay.com:learn"
```

가장 관련성이 높은 문서는 `[server]:[port]/o/[api-name]/[api-version]/openapi.[yaml 또는 json]` (원시 형식)에서도 확인할 수 있습니다. 설명서는 [SwaggerHub](https://app.swaggerhub.com/search?owner=liferayinc) 에서도 확인할 수 있지만 이전 버전을 실행 중인 경우 일치하지 않을 수 있습니다.

모든 API에 대한 OpenAPI 사양을 보려면 브라우저를 사용하여 `[server]:[port]/o/api?endpoint=[server]:[port]/o/openapi/openapi.json`에 액세스하세요. (예: http://localhost:8080/o/api?endpoint=http://localhost:8080/o/openapi/openapi.json). 또는 cURL을 사용하여 전체 목록을 JSON 형식 또는 YAML 형식으로 다운로드하세요. 예를 들어

```bash
curl \
    "http://localhost:8080/o/openapi/openapi.json" \
    -o "openapi.json" \
    -u "test@liferay.com:learn"
```

```bash
curl \
    "http://localhost:8080/o/openapi/openapi.yaml" \
    -o "openapi.yaml" \
    -u "test@liferay.com:learn"
```

```{note}
이 전체 `openapi.[json|yaml]` 파일 다운로드는 Liferay DXP 7.4 U69/Liferay Portal 7.4 GA69 이상에서 사용할 수 있습니다.
```

### GraphQL API

[GraphQL](https://graphql.org/) API는 헤드리스 REST API와 유사한 상호 작용을 지원하지만 조금 더 유연하게 사용할 수 있는 쿼리 언어입니다. Liferay DXP는 이 API를 `[server][:port]/o/graphql`에 노출합니다.

자세한 정보는 [GraphQL 클라이언트](https://graphql.org/graphql-js/graphql-clients/) 를 통해 API 또는 해당 설명서를 탐색하여 확인할 수 있습니다. Liferay에는 실행 중인 인스턴스에서 `[server][:port]/o/api` (오른쪽 상단에서 **GraphQL** 선택)에서 찾을 수 있는 기본 제공 클라이언트가 포함되어 있습니다.

### 일반 웹/REST 서비스

Liferay의 웹 서비스는 구형 프레임워크의 일부로, 여전히 DXP에서 지원되지만 복잡한 헤드리스 작업에는 더 이상 권장되지 않습니다. 이러한 API는 Liferay DXP의 내부 작업과 밀접하게 연결되어 있으므로 최신 헤드리스 옵션이 제공하는 성능과 유연성이 부족합니다.

그러나 웹 서비스는 특정 작업을 실행하는 더 간단한 방법을 제공할 수 있습니다. 사용 방법은 [서비스 빌더 웹 서비스](../building-applications/data-frameworks/service-builder.md) 을 참조하세요.

## 특징

### 모든 클라이언트와 협업

Liferay의 헤드리스 API는 웹을 통해 데이터를 제공하므로 웹 호출이 가능한 모든 애플리케이션이 클라이언트 역할을 할 수 있습니다. 이러한 API는 기본적으로 JSON 콘텐츠로 응답하지만 기본적으로 XML도 지원합니다. 확장 프로그램은 필요한 다른 방식으로 콘텐츠를 제공할 수 있습니다. 자세한 내용은 [API 헤더 참조](./consuming-apis/api-headers-reference.md#accept) 를 참조하세요.

### 안전하게 연결

Liferay의 웹 인터페이스와 마찬가지로 헤드리스 API를 통한 모든 상호 작용은 특정 사용자 계정(또는 게스트)을 사용하여 이루어집니다. Liferay의 API는 기본 인증, OAuth 토큰, 쿠키를 통한 세 가지 인증 방법을 지원합니다. 이를 구현하는 방법은 [API 헤더 참조](./consuming-apis/api-headers-reference.md#authorization) 를 참조하세요. 게스트 자격으로 API 요청을 할 수도 있습니다. 자세한 내용은 [인증되지 않은 요청 만들기](./consuming-apis/making-unauthenticated-requests.md) 를 참조하세요.

### 관리 가능한 데이터 크기 유지

대량의 데이터로 작업하면 클라이언트가 감당하기 벅차고, 성능 문제로 인해 사용자가 불편을 겪으며, 대역폭에 대한 비용이 많이 들 수 있습니다. Liferay의 헤드리스 API는 컬렉션을 관리 가능한 청크로 분류하고 원하는 데이터를 정확하게 검색할 수 있는 방법을 제공합니다.

요청에 `page` 및 `pageSize` 매개 변수를 전달하면 한 번에 원하는 정보의 양과 특정 요청에서 원하는 정보의 하위 집합을 API에 알려줄 수 있습니다. `sort` 매개 변수는 페이징 응답과 함께 사용하면 어떤 요소를 먼저 반환할지 지정할 수 있습니다.

`검색` 매개변수는 키워드 검색을 실행하여 해당 키워드가 포함된 요소를 항목의 일부에 표시합니다. `필터` 매개변수는 유사한 검색을 실행하지만 콘텐츠가 포함되어야 하는 항목의 위치를 정확히 지정합니다.

`fields` 매개 변수는 응답의 각 요소에서 특정 필드만 열거하도록 요청하고, 반대로 `restrictFields` 매개 변수는 지정된 필드를 반환 대상에서 제외합니다.

`flatten` 매개 변수는 계층적 API의 경우 계층적 컨텍스트에서 요청을 실행합니다. 예를 들어, 관련 조직을 찾기 위해 조직도를 탐색할 필요 없이 '마케팅'이라는 조직을 검색할 수 있습니다.

이러한 매개변수 사용 방법에 대한 자세한 내용은 [API 헤더 참조](./consuming-apis/api-headers-reference.md)를 참조하세요.

## 관련 정보

* [휴식 서비스 사용](../headless-delivery/consuming-apis/consuming-rest-services.md)
* [GraphQL API 사용](../headless-delivery/consuming-apis/consuming-graphql-apis.md)
