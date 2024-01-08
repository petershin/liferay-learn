---
toc:
  - ./using-custom-object-apis/object-api-basics.md
  - ./using-custom-object-apis/using-batch-apis.md
  - ./using-custom-object-apis/using-relationship-rest-apis.md
  - ./using-custom-object-apis/using-nestedfields-to-query-related-entries.md
  - ./using-custom-object-apis/using-nestedfields-to-audit-entry-history.md
  - ./using-custom-object-apis/using-aggregation-terms-with-rest-apis.md
---
# 사용자 정의 개체 API 사용

{bdg-secondary}`liferay 7.4+`

사용자 정의 개체 정의를 게시하면 Liferay는 개체 및 해당 데이터와 상호 작용하기 위해 기본 [REST API](../../../headless-delivery/consuming-apis/consuming-rest-services.md) 을 생성합니다. 이러한 API는 개체의 범위(예: 회사 또는 사이트)에 따라 다릅니다. 정의에 관계 또는 독립 실행형 작업이 포함된 경우 Liferay는 이를 호출하기 위한 엔드포인트도 생성합니다.

이러한 헤드리스 서비스의 경로는 `c/[pluralobjectlabel]` 명명 패턴(예: `/o/c/timeoffrequests`)을 따릅니다. `[server]:[port]/o/api`(예: `localhost:8080/o/api`)에서 Liferay API 탐색기를 통해 사용 가능한 개체 API를 보고 테스트할 수 있습니다. API 드롭다운 목록을 보려면 **REST 애플리케이션** 을 클릭하세요.

![Each object appears under REST Applications.](./using-custom-object-apis/images/01.png)

객체가 활성화된 동안 이러한 API를 사용하여 기본 CRUD 작업을 수행하고 [집계 용어](./using-custom-object-apis/using-aggregation-terms-with-rest-apis.md)를 사용하여 복잡한 쿼리를 실행할 수 있습니다. 및 [중첩 필드](./using-custom-object-apis/using-nestedfields-to-query-관련-entries.md), 독립 실행형 작업 트리거, 항목 관계 관리 등을 수행합니다.

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 객체 API 기본 사항
:link: ./using-custom-object-apis/object-api-basics.md
:::

:::{grid-item-card} 배치 API 사용
:link: ./using-custom-object-apis/using-batch-apis.md
:::

:::{grid-item-card} 관계 REST API 사용
:link: ./using-custom-object-apis/using-relationship-rest-apis.md
:::

:::{grid-item-card} NestedField를 사용하여 관련 항목 쿼리
:link: ./using-custom-object-apis/using-nestedfields-to-query-관련-entries.md
:::

:::{grid-item-card} NestedField를 사용하여 항목 기록 감사
:link: ./using-custom-object-apis/using-nestedfields-to-audit-entry-history.md
:::

:::{grid-item-card} REST API로 집계 용어 사용
:link: ./using-custom-object-apis/using-aggregation-terms-with-rest-apis.md
:::
::::

## 기본 회사 범위 REST API

기본 REST API는 모든 회사 범위 개체에 사용할 수 있습니다. Java 메서드의 경우 'ObjectName'을 개체 이름으로 바꿉니다.

| HTTP 방법 | HTTP 엔드포인트                          | 자바 방법                           | 묘사                                                                   |
| :------ | :---------------------------------- | :------------------------------ | :------------------------------------------------------------------- |
| 삭제      | `/by-external-reference-code/{erc}` | `deleteByExternalReferenceCode` | 지정된 항목을 삭제하고 작업이 성공하면 204를 반환합니다.                                    |
| 얻다      | `/by-external-reference-code/{erc}` | `getByExternalReferenceCode`    | 지정된 항목에 대한 세부 정보를 반환합니다.                                             |
| 반점      | `/by-external-reference-code/{erc}` | `patchByExternalReferenceCode`  | 지정된 항목을 업데이트합니다. API 호출에 포함된 필드만 변경됩니다.                              |
| 놓다      | `/by-external-reference-code/{erc}` | `putByExternalReferenceCode`    | 지정된 항목의 세부정보를 API 호출에 제공된 세부정보로 바꿉니다.                                |
| 얻다      | `/`                                 | `getObjectNamePage`             | Liferay 인스턴스의 전체 항목 목록을 반환합니다. 결과를 페이지로 매기고, 필터링하고, 검색하고 정렬할 수 있습니다. |
| 우편      | `/`                                 | `postObjectName`                | API 호출에 제공된 세부정보를 사용하여 새 항목을 만듭니다.                                   |
| 삭제      | `/batch`                            | `deleteObjectNameBatch`         | 여러 항목을 삭제하고 작업이 성공하면 204를 반환합니다.                                     |
| 우편      | `/batch`                            | `postObjectNameBatch`           | API 호출에 제공된 세부정보를 사용하여 여러 항목을 만듭니다.                                  |
| 놓다      | `/batch`                            | `putObjectNameBatch`            | API 호출에 제공된 세부정보를 사용하여 여러 항목을 바꿉니다.                                  |
| 삭제      | `/{entryId}`                        | `deleteObjectName`              | 지정된 항목을 삭제하고 작업이 성공하면 204를 반환합니다.                                    |
| 얻다      | `/{entryId}`                        | `getObjectName`                 | 지정된 항목에 대한 세부 정보를 반환합니다.                                             |
| 반점      | `/{entryId}`                        | `patchObjectName`               | 지정된 항목을 업데이트합니다. API 호출에 포함된 필드만 변경됩니다.                              |
| 놓다      | `/{entryId}`                        | `putObjectName`                 | 지정된 항목의 세부정보를 API 호출에 제공된 세부정보로 바꿉니다.                                |

```{note}
일괄 작업은 회사 범위 개체에만 사용할 수 있습니다.
```

## 기본 사이트 범위 REST API

기본 REST API는 모든 사이트 범위 개체에 사용할 수 있습니다. Java 메서드의 경우 'ObjectName'을 개체 이름으로 바꿉니다.

| HTTP 방법 | HTTP 엔드포인트                                            | 자바 방법                                        | 묘사                                                                 |
| :------ | :---------------------------------------------------- | :------------------------------------------- | :----------------------------------------------------------------- |
| 삭제      | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `deleteScopeScopeKeyByExternalReferenceCode` | 지정된 항목을 삭제하고 작업이 성공하면 204를 반환합니다.                                  |
| 얻다      | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `getScopeScopeKeyByExternalReferenceCode`    | 지정된 항목에 대한 세부 정보를 반환합니다.                                           |
| 반점      | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `patchScopeScopeKeyByExternalReferenceCode`  | 지정된 항목을 업데이트합니다. API 호출에 포함된 필드만 변경됩니다.                            |
| 놓다      | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `putScopeScopeKeyByExternalReferenceCode`    | 지정된 항목의 세부정보를 API 호출에 제공된 세부정보로 바꿉니다.                              |
| 얻다      | `/scopes/{scopeKey}`                                  | `getScopeScopeKeyPage`                       | 지정된 범위에 있는 항목의 전체 목록을 반환합니다. 결과를 페이지로 매기고, 필터링하고, 검색하고 정렬할 수 있습니다. |
| 우편      | `/scopes/{scopeKey}`                                  | `postScopeScopeKey`                          | API 호출에 제공된 세부 정보를 사용하여 지정된 범위에 새 항목을 만듭니다.                        |
| 삭제      | `/{entryId}`                                          | `deleteObjectName`                           | 지정된 항목을 삭제하고 작업이 성공하면 204를 반환합니다.                                  |
| 얻다      | `/{entryId}`                                          | `getObjectName`                              | 지정된 항목에 대한 세부 정보를 반환합니다.                                           |
| 반점      | `/{entryId}`                                          | `patchObjectName`                            | 지정된 항목을 업데이트합니다. API 호출에 포함된 필드만 변경됩니다.                            |
| 놓다      | `/{entryId}`                                          | `putObjectName`                              | 지정된 항목의 세부정보를 API 호출에 제공된 세부정보로 바꿉니다.                              |

```{note}
`scopeKey`의 경우 원하는 데이터 범위(예: 사이트 ID 또는 사용자 역할)에 대한 적절한 식별자를 사용합니다.
```

## 관계 REST API

{bdg-secondary}`liferay 7.4 U70+/GA70+`

개체 간의 일대다 및 다대다 관계를 정의하면 Liferay는 항목 관계를 쿼리하고 관리하기 위한 끝점을 생성합니다. 여기에는 관련 객체 항목을 반환하기 위한 GET 엔드포인트, 항목 관련 PUT 엔드포인트, 관련 항목 연결 해제를 위한 DELETE 엔드포인트가 포함됩니다. 자세한 내용은 [관계 API 사용](./using-custom-object-apis/using-relationship-rest-apis.md) 참조하세요.

HTTP 엔드포인트의 경우 `relationshipName`을 관계 이름(예: `userToTicket`)으로 바꿉니다. 각 관계 API에 대한 Java 메소드는 메소드 + 현재 객체 + 관계 이름 + 관련 객체(예: `getTicketUserToTicketUserPage`, `deleteTicketUserToTicketUser`)라는 이름 지정 패턴을 따릅니다.

| HTTP 방법 | HTTP 엔드포인트                                                        | 묘사                               |
| :------ | :---------------------------------------------------------------- | :------------------------------- |
| 얻다      | `/{entryId}/relationshipName`                                     | 관계를 통해 지정된 항목과 관련된 모든 항목을 반환합니다. |
| 놓다      | `/{entryId}/relationshipName/{relatedEntryId}`                    | 관계를 사용하여 지정된 개체 항목을 연결합니다.       |
| 놓다      | `/by-external-reference-code/{erc}/relationshipName/{relatedERC}` | 관계를 사용하여 지정된 개체 항목을 연결합니다.       |
| 삭제      | `/{entryId}/relationshipName/{relatedEntryId}`                    | 지정된 개체 항목의 연결을 해제합니다.            |

사이트 범위 개체의 경우 ERC 엔드포인트에는 `/scope/{scopeKey}` 접두사(예: `/scope/{scopeKey}/by-external-reference-code/{erc}/relationshipName/{relatedERC}`)가 포함됩니다. 시스템 개체에는 외부 참조 코드 끝점을 사용할 수 없습니다.

```{tip}
전용 관계 API 외에도 객체의 다른 GET API와 함께 'nestedFields' 쿼리 매개변수를 사용하여 관련 항목이 포함된 항목을 반환할 수 있습니다. 이 매개변수를 사용할 때 출력에 포함하려는 관계의 이름을 제공해야 합니다(예: `nestedFields=ticketAssignee`). 자세한 내용과 소개 튜토리얼은 [NestedFields를 사용하여 관련 항목 쿼리](./using-custom-object-apis/using-nestedfields-to-query-related-entries.md) 참조하세요.
```

## 독립형 작업 REST API

{bdg-secondary}`liferay 7.4 U60+/GA60+`

게시된 객체에 대한 독립 실행형 작업을 정의하면 Liferay는 항목에 대한 작업을 트리거하기 위한 두 개의 엔드포인트를 생성합니다. 하나는 항목의 ID를 사용하고 다른 하나는 항목의 외부 참조 코드(ERC)를 사용합니다. 자세한 내용은 [수동 작업 사용](../creating-and-managing-objects/actions/using-manual-actions.md) 참조하세요.

| HTTP 방법 | HTTP 엔드포인트                                                    | 자바 방법                     |
| :------ | :------------------------------------------------------------ | :------------------------ |
| 놓다      | `/by-external-reference-code/{erc}/object-actions/actionName` | `putObjectNameActionName` |
| 놓다      | `/{entryId}/object-actions/actionName`                        | `putObjectNameActionName` |

사이트 범위 객체의 경우 ERC 엔드포인트에는 `/scope/{scopeKey}` 접두사(예: `/scopes/{scopeKey}/by-external-reference-code/{erc}/object-actions/actionName`)가 포함됩니다.

<!--TASK: uncomment when GraphQL APIs are better supported, 
## GraphQL APIs

With the GraphQL APIs, you can both query and mutate object data. All APIs for custom objects are listed under `c` in Liferay's GraphQL schema. You can use Liferay's integrated Graph*i*QL IDE to search object schemas, draft queries, run requests, and more. To access it, go to Liferay's API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`) and click *GraphQL*.

![Use Liferay's GraphiQL explorer to search object schemas and run your requests.](./using-custom-object-apis/images/02.png)

See [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) for more information.
-->

## 관련 주제

* [REST 서비스 사용](../../../headless-delivery/consuming-apis/consuming-rest-services.md)

<!--TASK: * [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) -->
