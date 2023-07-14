# `nestedFields` 사용하여 항목 기록 감사

{bdg-secondary}`사용 가능한 Liferay 7.4 U72+/GA72+`

개체 정의에 대한 항목 기록 [](../../creating-and-managing-objects/auditing-object-definition-events.md#enabling-entry-history) 활성화하면 REST API와 함께 `nestedFields` 매개변수를 사용하여 항목 이벤트를 감사할 수 있습니다. GET 요청 경로에 `nestedFields=auditEvents` 추가합니다(예: `http://localhost:8080/o/c/tickets/?nestedFields=auditEvents`).

시작하려면 새 Liferay 7.4 인스턴스를 [설정](#setting-up-a-liferay-instance) 하고 제공된 자습서 코드를 [준비](#preparing-the-sample-code) 하십시오. 그런 다음 [스크립트를 실행](#using-the-sample-code) 하여 항목을 만들고 업데이트하고 `nestedFields` 매개변수를 사용하여 해당 변경 사항을 쿼리합니다.

```{important}
REST API를 사용하여 항목의 기록을 보려면 항목에 대한 '보기' 및 '객체 항목 기록' 권한이 모두 필요합니다. [권한 프레임워크 통합](../../understanding-object-integrations/permissions-framework-integration.md)을 참조하십시오.
```

## Liferay 인스턴스 설정

```{include} /_snippets/run-liferay-portal.md
```

다음으로 Liferay의 영구 감사 메시지 프로세서를 활성화합니다. 그런 다음 개체 정의를 만들고 게시합니다.

### 영구 감사 메시지 프로세서 활성화

1. **전역 메뉴**(![전역 메뉴](../../../../images/icon-applications-menu.png)))를 엽니다. **제어판** 탭, &rarr; **환경 설정** .

1. 보안에서 **감사** 를 클릭하고 **영구 메시지 감사 메시지 프로세서** 탭으로 이동합니다.

1. **활성화** 를 체크합니다.

1. **저장** 을 클릭합니다.

    ![Persistent Message Audit Message Processor 탭으로 이동하여 Enabled를 확인합니다.](./using-nestedfields-to-audit-entry-history/images/01.png)

### 개체 정의 만들기

1. **글로벌 메뉴**(![글로벌 메뉴](../../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 클릭 **사물** .

1. [만들기](../../creating-and-managing-objects/creating-objects.md#creating-object-drafts) 개체 초안을 만듭니다.

    | 필드 | 가치 |
    | :--- | :--- |
    | 라벨 | '가능' |
    | 복수 라벨 | '에이블스' |
    | 이름 | '가능' |

1. 이 필드를 초안에 추가합니다.

    | 라벨 | 필드 이름 | 유형 | 필수 |
    | :--- | :--- | :--- | :--- |
    | `이름` | `이름` | 텍스트 | &#10004; |

1. 세부 정보 탭에서 **Enable Entry History** 를 토글합니다.

1. 개체를 [게시](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 합니다.

게시되면 Headless API를 통해 개체에 액세스할 수 있습니다.

## 샘플 코드 준비

샘플 코드를 다운로드하고 압축을 풉니다.

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/using-apis/liferay-g4m3.zip -O
```

```bash
unzip liferay-g4m3.zip
```

샘플 코드에는 개체 항목을 생성, 업데이트 및 쿼리하기 위한 셸 스크립트가 포함되어 있습니다.

```{tip}
사이트 및 회사 개체에 대해 생성된 API의 전체 목록은 [Objects Headless Framework Integration](../../understanding-object-integrations/headless-framework-integration.md)을 참조하세요. `[server]:[port]/o/api`(예: `localhost:8080/o/api`)에서 Liferay API 탐색기를 통해 사용자 정의 개체 API를 보고 테스트할 수 있습니다. *REST 애플리케이션*을 클릭하고 API를 선택합니다.
```

## 샘플 코드 사용

1. `liferay-g4m3` 프로젝트의 `curl` 폴더로 이동합니다.

   ```bash
   cd liferay-g4m3/curl
   ```

1. `Able_POST_ToCompany` 실행하여 3개의 `Able` 항목을 만듭니다.

   ```bash
   ./Able_POST_ToCompany.sh
   ```

   ```json
   {
     ...
     "externalReferenceCode" : "able-one",
     "id" : 47512,
     ...
     "name" : "Able 1 - Foo"
   }

   {
     ...
     "externalReferenceCode" : "able-two",
     "id" : 47514,
     ...
     "name" : "Able 2 - Foo"
   }

   {
     ...
     "externalReferenceCode" : "able-three",
     "id" : 47516,
     ...
     "name" : "Able 3 - Foo"
   }
   ```

1. `Able_PATCH_ByExternalReferenceCode` `able-one` ERC와 함께 실행합니다.

   ```bash
   ./Able_PATCH_ByExternalReferenceCode.sh able-one
   ```

   이렇게 하면 항목의 이름 필드가 두 번 업데이트됩니다.

   ```json
   {
     ...
     "externalReferenceCode" : "able-one",
     "id" : 47512,
     ...
     "name" : "Able 1 - Bar"
   }

   {
     ...
     "externalReferenceCode" : "able-one",
     "id" : 47512,
     ...
     "name" : "Able 1 - Goo"
   }
   ```

1. `Able_GET_ByExternalReferenceCode` `able-one` ERC와 함께 실행합니다.

   ```bash
   ./Able_GET_ByExternalReferenceCode.sh able-one
   ```

   가장 최근 이벤트에서 시작하여 항목 생성으로 끝나는 항목 이벤트의 기록인 `auditEvents` 배열과 함께 `-one` 항목을 반환합니다.

   ```json
   {
     ...
     "auditEvents" : [ {
       "auditFieldChanges" : [ {
         "name" : "name",
         "newValue" : "Able 1 - Goo",
         "oldValue" : "Able 1 - Bar"
       } ],
       "dateCreated" : "2023-05-04T05:44:41Z",
       "eventType" : "UPDATE"
     }, {
       "auditFieldChanges" : [ {
         "name" : "name",
         "newValue" : "Able 1 - Bar",
         "oldValue" : "Able 1 - Foo"
       } ],
       "dateCreated" : "2023-05-04T05:44:40Z",
       "eventType" : "UPDATE"
     }, {
       "auditFieldChanges" : [ {
         "name" : "name",
         "newValue" : "Able 1 - Foo"
       } ],
       "dateCreated" : "2023-05-04T05:44:37Z",
       "eventType" : "ADD"
     } ],
     ...
     "externalReferenceCode" : "able-one",
     "id" : 47512,
     ...
     "name" : "Able 1 - Goo"
   }
   ```

   `auditEvents` 배열에는 다음 요소가 포함됩니다.

   * `auditFieldChanges`: 새 값과 이전 값으로 업데이트된 필드입니다.
   * `dateCreated`: 이벤트의 시간과 날짜입니다.
   * `eventType`: 이벤트 유형(예: `ADD`, `UPDATE`, `DELETE`).

1. `Ables_GET_FromCompany`실행합니다.

   ```bash
   ./Ables_GET_FromCompany.sh able-one
   ```

   가장 최근 이벤트부터 시작하여 해당 이벤트 감사와 함께 모든 Able 항목을 반환합니다.

   ```json
   {
     ...
     "items" : [ {
       ...
       "auditEvents" : [ {
         "auditFieldChanges" : [ {
           "name" : "name",
           "newValue" : "Able 2 - Foo"
         } ],
         "dateCreated" : "2023-05-04T06:15:50Z",
         "eventType" : "ADD"
       } ],
       ...
       "externalReferenceCode" : "able-two",
       "id" : 47514,
       ...
       "name" : "Able 2 - Foo"
     }, {
       ...
       "auditEvents" : [ {
         "auditFieldChanges" : [ {
           "name" : "name",
           "newValue" : "Able 3 - Foo"
         } ],
         "dateCreated" : "2023-05-04T06:15:51Z",
         "eventType" : "ADD"
       } ],
       ...
       "externalReferenceCode" : "able-three",
       "id" : 47516,
       ...
       "name" : "Able 3 - Foo"
     }, {
       ...
       "auditEvents" : [ {
         "auditFieldChanges" : [ {
           "name" : "name",
           "newValue" : "Able 1 - Goo",
           "oldValue" : "Able 1 - Bar"
         } ],
         "dateCreated" : "2023-05-04T06:16:25Z",
         "eventType" : "UPDATE"
       }, {
         "auditFieldChanges" : [ {
           "name" : "name",
           "newValue" : "Able 1 - Bar",
           "oldValue" : "Able 1 - Foo"
         } ],
         "dateCreated" : "2023-05-04T06:16:24Z",
         "eventType" : "UPDATE"
       }, {
         "auditFieldChanges" : [ {
           "name" : "name",
           "newValue" : "Able 1 - Foo"
         } ],
         "dateCreated" : "2023-05-04T06:15:49Z",
         "eventType" : "ADD"
       } ],
       ...
       "externalReferenceCode" : "able-one",
       "id" : 47512,
       ...
       "name" : "Able 1 - Goo"
     } ],
     "lastPage" : 1,
     "page" : 1,
     "pageSize" : 20,
     "totalCount" : 3
   }
   ```

## GET 요청 검사

이러한 GET 요청에는 URL에 `nestedFields=auditEvents` 매개변수가 포함됩니다.

### `Able_GET_ByExternalReferenceCode`

```{literalinclude} ./using-nestedfields-to-audit-entry-history/resources/liferay-g4m3.zip/curl/Able_GET_ByExternalReferenceCode.sh
   :language: bash
```

### `Ables_GET_FromCompany`

```{literalinclude} ./using-nestedfields-to-audit-entry-history/resources/liferay-g4m3.zip/curl/Ables_GET_FromCompany.sh
   :language: bash
```

## 관련 항목

* [개체 정의 이벤트 감사](../../creating-and-managing-objects/auditing-object-definition-events.md)
* [`nestedFields` 사용하여 관련 항목 쿼리](./using-nestedfields-to-query-related-entries.md)
