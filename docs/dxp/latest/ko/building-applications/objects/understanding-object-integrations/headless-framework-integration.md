# 헤드리스 프레임워크 통합

{bdg-secondary}`사용 가능한 Liferay DXP/Portal 7.4+`

사용자 정의 개체 정의를 게시하면 Liferay는 개체 및 해당 데이터와 상호 작용하기 위해 기본 [REST API](../../../headless-delivery/consuming-apis/consuming-rest-services.md) 을 생성합니다. 이러한 API는 개체의 범위(예: 회사 또는 사이트)에 따라 다릅니다. 정의에 관계 또는 독립 실행형 작업이 포함된 경우 Liferay는 이를 호출하기 위한 엔드포인트도 생성합니다.

이러한 헤드리스 서비스의 경로는 `c/[pluralobjectlabel]` 명명 패턴(예: `/o/c/timeoffrequests`)을 따릅니다. `[server]:[port]/o/api` (예: `localhost:8080/o/api`)에서 Liferay API 탐색기를 통해 사용 가능한 개체 API를 보고 테스트할 수 있습니다. **REST 애플리케이션** 클릭하여 API 드롭다운 목록을 확인합니다.

![각 개체는 REST 응용 프로그램 아래에 나타납니다.](./headless-framework-integration/images/01.png)

개체가 활성 상태인 동안 이러한 API를 사용하여 기본 CRUD 작업을 수행하고, [집계 용어](../objects-tutorials/using-apis/using-aggregation-terms-with-rest-apis.md) 및 [중첩 필드](../objects-tutorials/using-apis/using-nested-fields-with-rest-apis.md)를 사용하여 복잡한 쿼리를 실행하고, 독립 실행형 작업을 트리거하고, 항목 관계를 관리하는 등의 작업을 수행할 수 있습니다. 개체 API 자습서는 [API 사용](../objects-tutorials/using-apis.md) 참조하십시오.

## 기본 회사 범위 REST API

기본 REST API는 모든 회사 범위 개체에 사용할 수 있습니다. Java 메서드의 경우 `ObjectName` 을 개체 이름으로 바꿉니다.

| HTTP 방법 | HTTP 끝점                             | 자바 방식                           | 묘사                                                               |
|:------- |:----------------------------------- |:------------------------------- |:---------------------------------------------------------------- |
| 삭제      | `/by-external-reference-code/{erc}` | `deleteByExternalReferenceCode` | 지정된 항목을 삭제하고 작업이 성공하면 204를 반환합니다.                                |
| 얻다      | `/by-external-reference-code/{erc}` | `getByExternalReferenceCode`    | 지정된 항목에 대한 세부 정보를 반환합니다.                                         |
| 반점      | `/by-external-reference-code/{erc}` | `patchByExternalReferenceCode`  | 지정된 항목을 업데이트합니다. API 호출에 포함된 필드만 변경됩니다.                          |
| 놓다      | `/by-external-reference-code/{erc}` | `putByExternalReferenceCode`    | 지정된 항목의 세부 정보를 API 호출에 제공된 세부 정보로 바꿉니다.                          |
| 얻다      | `/`                                 | `getObjectNamePage`             | Liferay 인스턴스의 전체 항목 목록을 반환합니다. 결과를 페이지 매김, 필터링, 검색 및 정렬할 수 있습니다. |
| 우편      | `/`                                 | `postObjectName`                | API 호출에 제공된 세부 정보를 사용하여 새 항목을 만듭니다.                              |
| 삭제      | `/batch`                            | `deleteObjectNameBatch`         | 작업이 성공하면 여러 항목을 삭제하고 204를 반환합니다.                                 |
| 우편      | `/batch`                            | `postObjectNameBatch`           | API 호출에 제공된 세부 정보를 사용하여 여러 항목을 생성합니다.                            |
| 놓다      | `/batch`                            | `putObjectNameBatch`            | API 호출에 제공된 세부 정보를 사용하여 여러 항목을 바꿉니다.                             |
| 삭제      | `/{entryId}`                        | `deleteObjectName`              | 지정된 항목을 삭제하고 작업이 성공하면 204를 반환합니다.                                |
| 얻다      | `/{entryId}`                        | `getObjectName`                 | 지정된 항목에 대한 세부 정보를 반환합니다.                                         |
| 반점      | `/{entryId}`                        | `patchObjectName`               | 지정된 항목을 업데이트합니다. API 호출에 포함된 필드만 변경됩니다.                          |
| 놓다      | `/{entryId}`                        | `putObjectName`                 | 지정된 항목의 세부 정보를 API 호출에 제공된 세부 정보로 바꿉니다.                          |

```{note}
일괄 작업은 회사 범위 개체에만 사용할 수 있습니다.
```

## 기본 사이트 범위 REST API

기본 REST API는 모든 사이트 범위 개체에 사용할 수 있습니다. Java 메서드의 경우 `ObjectName` 을 개체 이름으로 바꿉니다.

| HTTP 방법 | HTTP 끝점                                               | 자바 방식                                        | 묘사                                                             |
|:------- |:----------------------------------------------------- |:-------------------------------------------- |:-------------------------------------------------------------- |
| 삭제      | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `deleteScopeScopeKeyByExternalReferenceCode` | 지정된 항목을 삭제하고 작업이 성공하면 204를 반환합니다.                              |
| 얻다      | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `getScopeScopeKeyByExternalReferenceCode`    | 지정된 항목에 대한 세부 정보를 반환합니다.                                       |
| 반점      | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `patchScopeScopeKeyByExternalReferenceCode`  | 지정된 항목을 업데이트합니다. API 호출에 포함된 필드만 변경됩니다.                        |
| 놓다      | `/scopes/{scopeKey}/by-external-reference-code/{erc}` | `putScopeScopeKeyByExternalReferenceCode`    | 지정된 항목의 세부 정보를 API 호출에 제공된 세부 정보로 바꿉니다.                        |
| 얻다      | `/scopes/{scopeKey}`                                  | `getScopeScopeKeyPage`                       | 지정된 범위에 있는 항목의 전체 목록을 반환합니다. 결과를 페이지 매김, 필터링, 검색 및 정렬할 수 있습니다. |
| 우편      | `/scopes/{scopeKey}`                                  | `postScopeScopeKey`                          | API 호출에 제공된 세부 정보를 사용하여 지정된 범위에 새 항목을 만듭니다.                    |
| 삭제      | `/{entryId}`                                          | `deleteObjectName`                           | 지정된 항목을 삭제하고 작업이 성공하면 204를 반환합니다.                              |
| 얻다      | `/{entryId}`                                          | `getObjectName`                              | 지정된 항목에 대한 세부 정보를 반환합니다.                                       |
| 반점      | `/{entryId}`                                          | `patchObjectName`                            | 지정된 항목을 업데이트합니다. API 호출에 포함된 필드만 변경됩니다.                        |
| 놓다      | `/{entryId}`                                          | `putObjectName`                              | 지정된 항목의 세부 정보를 API 호출에 제공된 세부 정보로 바꿉니다.                        |

```{note}
`scopeKey`의 경우 원하는 데이터 범위에 대한 적절한 식별자(예: 사이트 ID 또는 사용자 역할)를 사용하십시오.
```

## 관계 REST API

{bdg-secondary}`사용 가능한 Liferay 7.4 U70+/GA70+`

개체 간의 일대다 및 다대다 관계를 정의할 때 Liferay는 항목 관계를 쿼리하고 관리하기 위한 엔드포인트를 생성합니다. 여기에는 관련 개체 항목을 반환하기 위한 GET 끝점, 관련 항목을 위한 PUT 끝점 및 관련 항목의 연결을 해제하기 위한 DELETE 끝점이 포함됩니다. 자세한 내용은 [관계 API 사용](../objects-tutorials/using-apis/using-relationship-rest-apis.md) 참조하십시오.

HTTP 끝점의 경우 `relationName` 관계 이름(예: `userToTicket`)으로 바꿉니다. 각 관계 API에 대한 Java 메서드는 메서드 + 현재 개체 + 관계 이름 + 관련 개체(예: `getTicketUserToTicketUserPage`, `deleteTicketUserToTicketUser`)라는 이름 지정 패턴을 따릅니다.

| HTTP 방법 | HTTP 끝점                                                           | 묘사                               |
|:------- |:----------------------------------------------------------------- |:-------------------------------- |
| 얻다      | `/{entryId}/relationshipName`                                     | 관계를 통해 지정된 항목과 관련된 모든 항목을 반환합니다. |
| 놓다      | `/{entryId}/relationshipName/{relatedEntryId}`                    | 관계를 사용하여 지정된 개체 항목을 관련시킵니다.      |
| 놓다      | `/by-external-reference-code/{erc}/relationshipName/{relatedERC}` | 관계를 사용하여 지정된 개체 항목을 관련시킵니다.      |
| 삭제      | `/{entryId}/relationshipName/{relatedEntryId}`                    | 지정된 개체 항목의 연결을 해제합니다.            |

사이트 범위 개체의 경우 ERC 끝점에는 `/scope/{scopeKey}` 접두사(예: `/scope/{scopeKey}/by-external-reference-code/{erc}/relationshipName/{relatedERC}`)가 포함됩니다. 외부 참조 코드 끝점은 시스템 개체에 사용할 수 없습니다.

```{tip}
전용 관계 API 외에도 객체의 다른 GET API와 함께 `nestedFields` 쿼리 매개변수를 사용하여 관련 항목이 있는 항목을 반환할 수 있습니다. 이 매개변수를 사용할 때 출력에 포함하려는 관계의 이름을 제공해야 합니다(예: `nestedFields=ticketAssignee`). 자세한 내용 및 소개 자습서는 [REST API로 중첩 필드 사용](../objects-tutorials/using-apis/using-nested-fields-with-rest-apis.md)을 참조하세요.
```

## 독립 실행형 작업 REST API

{bdg-secondary}`사용 가능한 Liferay 7.4 U60+/GA60+`

게시된 개체에 대한 독립 실행형 작업을 정의할 때 Liferay는 항목에 대한 작업을 트리거하기 위해 두 개의 엔드포인트를 생성합니다. 하나는 항목의 ID를 사용하고 다른 하나는 항목의 외부 참조 코드(ERC)를 사용합니다. 자세한 내용은 [수동 작업 사용](../creating-and-managing-objects/actions/using-manual-actions.md) 참조하십시오.

| HTTP 방법 | HTTP 끝점                                                       | 자바 방식                     |
|:------- |:------------------------------------------------------------- |:------------------------- |
| 놓다      | `/by-external-reference-code/{erc}/object-actions/actionName` | `putObjectNameActionName` |
| 놓다      | `/{entryId}/object-actions/actionName`                        | `putObjectNameActionName` |

사이트 범위 개체의 경우 ERC 끝점에는 `/scope/{scopeKey}` 접두사(예: `/scopes/{scopeKey}/by-external-reference-code/{erc}/object-actions/actionName`)가 포함됩니다. 외부 참조 코드 끝점은 시스템 개체에 사용할 수 없습니다.

<!--TASK: uncomment when GraphQL APIs are better supported, 
## GraphQL APIs

With the GraphQL APIs, you can both query and mutate object data. All APIs for custom objects are listed under `c` in Liferay's GraphQL schema. You can use Liferay's integrated Graph*i*QL IDE to search object schemas, draft queries, run requests, and more. To access it, go to Liferay's API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`) and click *GraphQL*.

![Use Liferay's GraphiQL explorer to search object schemas and run your requests.](./headless-framework-integration/images/02.png)

See [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) for more information.
-->

## 추가 정보

* [REST 서비스 사용](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
* [API 사용](../objects-tutorials/using-apis.md)
<!--TASK: * [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) -->