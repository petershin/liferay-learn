# 헤드리스 프레임워크 통합

> 사용 가능: Liferay DXP/Portal 7.4+

객체를 게시하면 Liferay가 자동으로 이에 대한 REST API를 생성합니다. 이렇게 하면 사용자 지정 개체에 대한 헤드리스 액세스가 제공되므로 CRUD 작업을 수행할 수 있습니다. 개체에 대해 생성된 API는 해당 범위(예: 회사 또는 사이트)에 따라 다릅니다. <!--TASK: replace first sentence when GraphQL APIs are supported, "When you publish an Object, Liferay automatically generates both REST and [GraphQL](https://graphql.org) APIs for it."--> 

모든 개체는 `c/[pluralobjectlabel]` 명명 패턴(예: `c/timeoffrequests`)을 사용합니다. 각 개체 항목 스키마에는 개체의 모든 필드와 관계가 포함됩니다.

`[server]:[port]/o/api` (예: `localhost:8080/o/api`)에서 Liferay API 탐색기를 통해 개체의 API를 보고 테스트할 수 있습니다. REST API는 **REST 애플리케이션** 아래에 나열됩니다.<!--TASK: uncomment when GraphQL APIs are supported, "Click *GraphQL* to access Liferay's [Graph*i*QL](https://github.com/graphql/graphiql) browser."-->

 관련 개체 자습서는 [API 사용](../objects-tutorials/using-apis.md) 을 참조하십시오.

## 개체 REST API

[REST API](../../../headless-delivery/consuming-apis/consuming-rest-services.md)을 사용하면 개체 항목에 대해 단일 및 일괄 CRUD 작업을 모두 수행할 수 있습니다. [집계 용어](../objects-tutorials/using-apis/using-aggregation-terms-with-rest-apis.md) 및 [중첩 필드](../objects-tutorials/using-apis/using-nested-fields-with-rest-apis.md)을 사용하여 복잡한 쿼리를 실행할 수도 있습니다.

![각 개체는 REST 응용 프로그램 아래에 나타납니다.](./headless-framework-integration/images/01.png)

모든 끝점과 Java 메서드는 개체의 이름을 사용합니다. 다음 예제에서 `ObjectName` 및 `objectName` 을 개체 이름으로 바꿉니다.

```{important}
Liferay DXP 7.4 GA1에서 Picklist 필드 값은 Object API 호출에서 `"samplePicklist": "string"` 형식을 사용해야 합니다. Liferay DXP 7.4 U1부터는 형식이 변경되며 값은 `"samplePicklist": {"key": "string"}` 형식을 사용해야 합니다.
```

### 회사 범위 개체

다음 REST API는 모든 회사 범위 개체에 사용할 수 있습니다.

| HTTP 방법 | HTTP 끝점                                               | 자바 방식                           | 묘사                                                                       |
|:------- |:----------------------------------------------------- |:------------------------------- |:------------------------------------------------------------------------ |
| 삭제      | `/by-external-reference-code/{externalReferenceCode}` | `deleteByExternalReferenceCode` | 외부 참조 코드를 사용하여 지정된 개체 항목을 삭제합니다.                                         |
| 가져 오기   | `/by-external-reference-code/{externalReferenceCode}` | `getByExternalReferenceCode`    | 외부 참조 코드를 사용하여 지정된 개체 항목에 대한 세부 정보를 반환합니다.                               |
| 놓다      | `/by-external-reference-code/{externalReferenceCode}` | `putByExternalReferenceCode`    | 지정된 개체 항목의 세부 정보를 외부 참조 코드를 사용하여 API 호출에 제공된 항목으로 바꿉니다.                  |
| 가져 오기   | `/`                                                   | `getObjectNamePage`             | Liferay 인스턴스의 전체 객체 항목 목록을 반환합니다. 결과에 페이지를 매기고, 필터링하고, 검색하고, 정렬할 수 있습니다. |
| 우편      | `/`                                                   | `postObjectName`                | API 호출에 제공된 세부 정보를 사용하여 새 객체 항목을 생성합니다.                                  |
| 삭제      | `/batch`                                              | `deleteObjectNameBatch`         | 여러 개체 항목을 삭제합니다.                                                         |
| 우편      | `/batch`                                              | `postObjectNameBatch`           | API 호출에 제공된 세부 정보를 사용하여 여러 객체 항목을 생성합니다.                                 |
| 놓다      | `/batch`                                              | `putObjectNameBatch`            | API 호출에 제공된 세부 정보를 사용하여 여러 개체 항목을 바꿉니다.                                  |
| 삭제      | `/{objectNameId}`                                     | `deleteObjectName`              | 지정된 개체 항목을 삭제하고 작업이 성공하면 204를 반환합니다.                                     |
| 가져 오기   | `/{objectNameId}`                                     | `getObjectName`                 | 지정된 개체 항목에 대한 세부 정보를 반환합니다.                                              |
| 반점      | `/{objectNameId}`                                     | `patchObjectName`               | 지정된 객체 항목에 대한 API 호출에 지정된 필드를 업데이트합니다. 다른 필드는 변경되지 않습니다.                 |
| 놓다      | `/{objectNameId}`                                     | `putObjectName`                 | 지정된 개체 항목의 세부 정보를 API 호출에 제공된 세부 정보로 바꿉니다.                               |

### 사이트 범위 개체

다음 REST API는 모든 사이트 범위 개체에 사용할 수 있습니다.

| HTTP 방법 | HTTP 끝점                                                                 | 자바 방식                                        | 묘사                                                                  |
|:------- |:----------------------------------------------------------------------- |:-------------------------------------------- |:------------------------------------------------------------------- |
| 삭제      | `/scopes/{scopeKey}/by-external-reference-code/{externalReferenceCode}` | `deleteScopeScopeKeyByExternalReferenceCode` | 범위 키와 외부 참조 코드를 사용하여 지정된 개체 항목을 삭제합니다.                              |
| 가져 오기   | `/scopes/{scopeKey}/by-external-reference-code/{externalReferenceCode}` | `getScopeScopeKeyByExternalReferenceCode`    | 범위 키와 외부 참조 코드를 사용하여 지정된 개체 항목에 대한 세부 정보를 반환합니다.                    |
| 놓다      | `/scopes/{scopeKey}/by-external-reference-code/{externalReferenceCode}` | `putScopeScopeKeyByExternalReferenceCode`    | 범위 키 및 외부 참조 코드를 사용하여 지정된 개체 항목의 세부 정보를 API 호출에 제공된 세부 정보로 바꿉니다.    |
| 가져 오기   | `/scopes/{scopesKey}`                                                   | `getScopeScopeKeyPage`                       | 사이트에 있는 개체 항목의 전체 목록을 반환합니다. 결과에 페이지를 매기고, 필터링하고, 검색하고, 정렬할 수 있습니다. |
| 우편      | `/scopes/{scopesKey}`                                                   | `postScopeScopeKey`                          | API 호출에 제공된 세부 정보를 사용하여 지정된 사이트에 새 개체 항목을 만듭니다.                     |
| 삭제      | `/{objectNameId}`                                                       | `deleteObjectName`                           | 지정된 개체 항목을 삭제합니다.                                                   |
| 가져 오기   | `/{objectNameId}`                                                       | `getObjectName`                              | 지정된 개체 항목에 대한 세부 정보를 반환합니다.                                         |
| 반점      | `/{objectNameId}`                                                       | `patchObjectName`                            | 지정된 객체 항목에 대한 API 호출에 지정된 필드를 업데이트합니다. 다른 필드는 변경되지 않습니다.            |
| 놓다      | `/{objectNameId}`                                                       | `putObjectName`                              | 지정된 개체 항목의 세부 정보를 API 호출에 제공된 세부 정보로 바꿉니다.                          |

```{note}
API의 `scopesKey` 매개변수의 경우 원하는 데이터 범위(예: 사이트 ID, 사용자 역할)에 대한 적절한 식별자를 사용하십시오.
```

<!--TASK: uncomment when GraphQL APIs are supported, 
## Object GraphQL APIs

With the GraphQL APIs, you can both query and mutate Object data. All APIs for custom Objects are listed under `c` in Liferay's GraphQL schema. You can use Liferay's integrated Graph*i*QL IDE to search Object schemas, draft queries, run requests, and more. To access it, go to Liferay's API Explorer at `[server]:[port]/o/api` (e.g., `localhost:8080/o/api`) and click *GraphQL*.

![Use Liferay's GraphiQL explorer to search Object schemas and run your requests.](./headless-framework-integration/images/02.png)

See [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) for more information.
-->

## 추가 정보

* [REST 서비스 사용](../../../headless-delivery/consuming-apis/consuming-rest-services.md)
* [API 사용](../objects-tutorials/using-apis.md) 
<!--TASK: * [Consuming GraphQL APIs](../../../headless-delivery/consuming-apis/consuming-graphql-apis.md) -->
