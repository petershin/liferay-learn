# 계정 생성 자동화

온보딩 흐름을 완료하기 위해 Delectable Bonsai는 관리자가 승인된 애플리케이션에 대한 비즈니스 계정을 쉽게 만들 수 있도록 하려고 합니다. 각 계정의 이름은 애플리케이션의 `businessName` 따라 지정되어야 하며 신청자는 계정 관리자 역할이 있는 계정에 자동으로 할당되어야 합니다. 여기서는 개체 작업 [클라이언트 확장](https://learn.liferay.com/web/guest/w/dxp/building-applications/client-extensions) 을 사용하여 이를 달성합니다.

![배포자 응용 프로그램 개체에 계정 설정 작업을 추가합니다.](./automating-account-creation/images/01.png)

## 클라이언트 확장 설정

<!--FINISH: Fix commands and client extension names once BChan merges code!!! -->

워크플로에 대한 `liferay-course-etc-spring-boot` 프로젝트를 [배포](./adding-an-approval-workflow.md#deploying-the-client-extensions) 할 때 사용자 정의 개체 작업도 배포했습니다.

계속하기 전에 Spring Boot 애플리케이션이 실행 중인지 확인하세요. 그렇지 않은 경우 `liferay-course-etc-spring-boot` 프로젝트 폴더로 이동하여 다음 명령을 실행합니다.

```bash
./../../gradlew bootRun
```

그런 다음 `http://localhost:58081/ready` 로 이동하여 애플리케이션이 성공적으로 시작되었는지 확인하세요.

## 코드 검토

제공된 개체 작업 클라이언트 확장은 다음 작업을 수행합니다.

1. 승인된 신청서에서 `businessName` 사용하여 비즈니스 계정을 만듭니다.

1. `지원자 이메일` 필드를 사용하여 지원자를 계정과 연결합니다.

1. 지원자에게 계정 관리자 역할을 할당합니다.

### 요청 본문 수신 및 변수 설정

```java
   @PostMapping
   public ResponseEntity<String> post(
      @AuthenticationPrincipal Jwt jwt, @RequestBody String json) {

      log(jwt, _log, json);

      JSONObject payload = new JSONObject(json);

      JSONObject jsonApplicationDTO = payload.getJSONObject("objectEntryDTODistributorApplication");

      JSONObject jsonProperties = jsonApplicationDTO.getJSONObject("properties");

      String accountName = jsonProperties.getString("businessName");

      String accountERC = "ACCOUNT_" + accountName.toUpperCase().replace(" ", "_");

      String email = jsonProperties.getString("applicantEmail");
   ...
   }
```

`ObjectAction1RestController` 의 게시 메소드에는 HTTP 호출을 인증하기 위한 JWT(JSON 웹 토큰)와 JSON 형식의 문자열로 수신되는 요청 본문이라는 두 개의 매개변수가 있습니다.

요청 본문을 기록한 후 JSON 요청 페이로드를 구문 분석하고 궁극적으로 `businessName` 및 `reporterEmail` 값을 추출합니다. 이 값은 `accountName` 및 `email` 변수에 저장되며 `accountName` 는 `accountERC` 변수를 설정하는 데 사용됩니다.

### POST 요청 실행

```java
      try {
         WebClient.Builder builder = WebClient.builder();

         WebClient webClient = builder.baseUrl(
            ...
         ).defaultHeader(
            ...
         ).defaultHeader(
            ...
         ).build();

         createBusinessAccount(
            webClient, jwt, accountERC, accountName
         ).doOnSuccess(
            responseEntity -> logResponse(responseEntity, "Account Created")
         ).then(
            associateUserWithAccount(webClient, jwt, accountERC, email)
         ).doOnSuccess(
            responseEntity -> logResponse(responseEntity, "User Assigned")
         ).then(
            getRoleId(webClient, jwt, accountERC)
         ).flatMap(
            accountRoleId -> {
               return assignAccountRoleToUser(
                  webClient, jwt, accountERC, accountRoleId, email
               ).doOnSuccess(
                  responseEntity -> logResponse(responseEntity, "Role Assigned")
               );
            }
         ).subscribe();
      }
```

요청 본문(`json`)을 사용하여 변수를 정의한 후 코드는 기본 URL과 헤더를 결정하여 `WebClient` 을 초기화하고 구성합니다. 그런 다음 `createBusinessAccount`, `AssociateUserWithAccount`, `getRoleId`및 `할당AccountRoleToUser` 메소드를 함께 연결합니다. 이러한 방법을 함께 사용하면 비즈니스 계정을 생성하고, 신청자를 여기에 연결하고, 계정 관리자 ID를 검색하고, 신청자에게 역할을 할당합니다.

### 계정 만들기

```java
   private Mono<ResponseEntity<String>> createBusinessAccount(
      WebClient webClient, Jwt jwt, String accountERC, String accountName) {

      return webClient.post(
      ).uri(
         "o/headless-admin-user/v1.0/accounts"
      ).bodyValue(
         "{\"externalReferenceCode\": \"" + accountERC + "\", \"name\": \"" + accountName + "\", \"type\": \"business\"}"
      ).header(
         HttpHeaders.AUTHORIZATION, "Bearer " + jwt.getTokenValue()
      )
      ...
   }
```

이 메소드는 초기화된 `WebClient` 사용하여 `headless-admin-user` 엔드포인트에 대한 비동기 POST 요청을 수행하고 `accountERC` 및 `accountName` 변수를 사용하여 비즈니스 계정을 생성하여 각각 `externalReferenceCode` 및 `name` 필드를 채웁니다. 마지막으로 응답 엔터티를 반환하고 HTTP 상태를 기록합니다.

### 지원자와 계정 연결

```java
   private Mono<ResponseEntity<String>> associateUserWithAccount(
      WebClient webClient, Jwt jwt, String accountERC, String email) {

      return webClient.post(
      ).uri(
         "o/headless-admin-user/v1.0/accounts/by-external-reference-code/{externalReferenceCode}/user-accounts/by-email-address/{emailAddress}", accountERC, email
      ).header(
         HttpHeaders.AUTHORIZATION, "Bearer " + jwt.getTokenValue()
      )
      ...
   }
```

이 메소드는 초기화된 `WebClient` 사용하여 `headless-admin-user` 엔드포인트에 대한 비동기 POST 요청을 수행하고 `accountERC` 및 `email` 변수를 사용하여 사용자를 계정과 연결합니다. 마지막으로 응답 엔터티를 반환하고 HTTP 상태를 기록합니다.

### 계정 관리자 역할 할당

```java
   private Mono<ResponseEntity<String>> assignAccountRoleToUser(
      WebClient webClient, Jwt jwt, String accountERC, Integer accountRoleId, String email) {
    
      return webClient.post(
      ).uri(
         "o/headless-admin-user/v1.0/accounts/by-external-reference-code/{externalReferenceCode}/account-roles/{accountRoleId}/user-accounts/by-email-address/{emailAddress}", accountERC, accountRoleId, email
      ).header(
         HttpHeaders.AUTHORIZATION, "Bearer " + jwt.getTokenValue()
      )
      ...
   }
```

이 메소드는 초기화된 `WebClient` 사용하여 `headless-admin-user` 엔드포인트에 대한 비동기 POST 요청을 수행하고 `accountERC`, `accountRoleId` 및 `email` 변수를 사용하여 사용자에게 계정 역할을 할당합니다. 역할 ID는 `getRoleId` 메소드를 사용하여 추출됩니다. 마지막으로 응답 엔터티를 반환하고 HTTP 상태를 기록합니다.

### 역할 ID 검색

```java
   private Mono<Integer> getRoleId(WebClient webClient, Jwt jwt, String accountERC) {
      return webClient.get(
      ).uri(
         uriBuilder -> uriBuilder.path(
            "o/headless-admin-user/v1.0/accounts/by-external-reference-code/{externalReferenceCode}/account-roles"
         ).queryParam(
            "filter", "name eq 'Account Administrator'"
         ).build(
            accountERC
         )
      ).header(
         HttpHeaders.AUTHORIZATION, "Bearer " + jwt.getTokenValue()
      ).retrieve(
      ).bodyToMono(
         String.class
      ).map(
         json -> new JSONObject(
            json
         ).getJSONArray(
            "items"
         ).getJSONObject(
            0
         ).getInt(
            "id"
         )
      );
   }
```

이 메서드는 `headless-admin-user` 엔드포인트에 대한 GET 요청을 수행하고 정수를 반환합니다. URI를 작성할 때 요청은 계정 관리자 역할만 포함하도록 응답을 필터링합니다. 그런 다음 역할의 `id`을 추출하고 반환합니다.

## 개체 작업 추가

1. **Distributor Application** 개체 편집을 시작합니다.

1. **작업** 탭으로 이동하여 **추가**( ![Add Button](../../images/icon-add.png) )을 클릭합니다.

1. 기본 정보 탭에 다음 값을 입력하세요.

   | 분야    | 가치                                 |
   |:----- |:---------------------------------- |
   | 액션 라벨 | 계정 설정                              |
   | 액션 이름 | 계정 설정                              |
   | 묘사    | 독립 실행형, 승인된 신청서에 대한 비즈니스 계정을 만듭니다. |
   | 활성    | 여실한                                |

   ![계정 설정 작업을 만듭니다.](./automating-account-creation/images/02.png)

1. **Action Builder** 탭으로 이동하여 다음 값을 설정합니다.

   | 분야     | 가치                                                                                |
   |:------ |:--------------------------------------------------------------------------------- |
   | 트리거    | 독립형                                                                               |
   | 액션     | `object-action-executor[function#liferay-course-etc-spring-boot-object-action-1]` |
   | 오류 메세지 | 비즈니스 계정을 생성하지 못했습니다.                                                              |

   ![사용자 정의 작업을 선택합니다.](./automating-account-creation/images/03.png)

1. **저장** 클릭하세요.

저장되면 Liferay는 해당 작업을 각 응용 프로그램의 작업 메뉴에 옵션으로 추가하므로 배포자 응용 프로그램 페이지에서 수동으로 트리거할 수 있습니다.

![Liferay는 각 애플리케이션의 작업 메뉴에 작업을 옵션으로 추가합니다.](./automating-account-creation/images/04.png)

Liferay는 또한 독립 실행형 작업을 트리거하기 위해 두 개의 헤드리스 API를 생성합니다.

![Liferay는 독립형 작업을 트리거하기 위해 두 개의 헤드리스 API를 생성합니다.](./automating-account-creation/images/05.png)

마지막으로 Liferay는 어떤 사용자가 작업을 실행할 수 있는지 제어하기 위한 권한을 추가합니다. 다음으로 이 권한을 비즈니스 개발 관리자 역할에 할당합니다.

## 계정 설정 권한 할당

1. **전역 메뉴**( ![Global Menu](../../images/icon-applications-menu.png) )을 열고 **제어판** 탭으로 이동한 다음 **역할** 클릭합니다.

1. **비즈니스 개발 관리자** 역할을 편집합니다.

1. **권한 정의** 탭으로 이동합니다.

1. `배포자 애플리케이션: action.setUpAccount` 권한을 추가합니다.

   ![계정 설정 권한을 추가합니다.](./automating-account-creation/images/06.png)

1. **저장** 클릭하세요.

이제 비즈니스 관리자는 배포자 애플리케이션 페이지를 통해 또는 헤드리스 API를 사용하여 작업을 트리거할 수 있습니다.

## 계정 설정 작업 트리거

1. 대리점 신청 페이지로 이동합니다.

1. 항목에 대해 **작업**( ![Actions Button](../../images/icon-actions.png) )을 클릭하고 **계정 설정** 선택합니다.

1. **Accounts** 애플리케이션을 열고 계정이 생성되었는지 확인하세요.

   ![계정이 생성되었는지 확인합니다.](./automating-account-creation/images/07.png)

1. **사용자** 탭으로 이동하여 신청자가 계정과 연결되어 있고 계정 관리자 역할이 할당되었는지 확인합니다.

   ![신청자가 계정과 연결되어 있고 계정 관리자 역할이 할당되었는지 확인합니다.](./automating-account-creation/images/08.png)

## 결론

축하해요! Distributor Application 개체에 필요한 비즈니스 로직을 성공적으로 추가했습니다. 이제 Liferay의 페이지 빌더 기능을 사용하여 사용자 인터페이스를 디자인할 수 있습니다.

모듈 3: [사용자 인터페이스 디자인](../designing-user-interfaces.md)

## 관련 개념
