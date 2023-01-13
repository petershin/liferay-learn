---
toc:
- ./apis-with-rest-builder/producing-and-implementing-apis-with-rest-builder.md
---
# REST 빌더가 포함된 API

```{toctree}
:maxdepth: 3

apis-with-rest-builder/producing-and-implementing-apis-with-rest-builder.md
```

REST Builder는 로컬 API를 가져와서 웹에서 사용 가능하게 만드는 코드 생성 도구입니다. [OpenAPI 사양](https://www.openapis.org/) 을 사용하여 REST 및 [GraphQL](https://graphql.org/) API를 생성합니다.

REST 빌더는 `rest-config.yaml` 및 `rest-openapi.yaml` 파일에서 정의한 구성을 사용하여 API가 한 번에 작동하는 데 필요한 대부분의 코드를 생성합니다. 클래스 이름과 코드를 넣을 위치를 구성하면 REST Builder가 필요한 모든 파일을 생성합니다. 그런 다음 구현 논리를 추가합니다.

Liferay 작업 공간의 `impl` 모듈에서 Gradle 작업 `buildREST` 을 사용하여 REST Builder를 실행합니다. 일단 구성되면 모든 스캐폴딩 코드, 인터페이스 및 구현 준비가 된 리소스 클래스까지 생성합니다.

## 다음 단계

- [REST 빌더로 API 생성 및 구현](./apis-with-rest-builder/producing-and-implementing-apis-with-rest-builder.md)
