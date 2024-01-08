# 승인 워크플로 추가

Delectable Bonsai는 'applicationState' 필드를 추가한 후 애플리케이션에 대한 변경 사항을 검토하고 승인하기 위한 워크플로를 구현하려고 합니다. 현재 애플리케이션에 대한 모든 업데이트는 선택한 상태에 관계없이 자동으로 승인됩니다. Delectable Bonsai는 추가 비즈니스 로직을 '승인' 및 '거부' 상태와 연결하므로 워크플로는 'applicationState' 필드를 확인하고 이러한 값 중 하나가 선택된 경우 관리자 검토를 요구해야 합니다. 여기에서는 Liferay [클라이언트 확장](https://learn.liferay.com/web/guest/w/dxp/building-applications/client-extensions) 을 사용하여 이 워크플로 프로세스를 배포하고 설정합니다.

## 클라이언트 확장 배포

<!--FINISH: Fix commands and client extension names once BChan merges code!!! -->

1. 샘플 작업공간을 다운로드하고 압축을 풉니다.

   ```bash
   curl -o https://resources.learn.liferay.com/courses/latest/en/application-development/implementing-business-logic/liferay-c6s3.zip
   ```

   ```bash
   unzip liferay-c6s3.zip
   ```

1. `liferay-c6s3/liferay-course-workspace/client-extensions`로 이동합니다.

   ```bash
   cd liferay-c6s3/liferay-course-workspace/client-extensions
   ```

   여기에는 'liferay-course-batch' 및 'liferay-course-etc-spring-boot'라는 두 개의 클라이언트 확장 프로젝트가 포함됩니다.

1. 다음 명령을 실행하여 클라이언트 확장을 배포하고 Liferay 인스턴스 콘솔에서 배포를 확인합니다.

   ```bash
   ../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```log
   2023-07-20 21:03:07.142 INFO  [Refresh Thread: Equinox Container: 8b6a806c-654e-44f8-8210-75b61d29063c][BundleStartStopLogger:77] STARTED liferaycoursebatch_1.0.0 [1721]
   2023-07-20 21:03:12.408 INFO  [Refresh Thread: Equinox Container: 8b6a806c-654e-44f8-8210-75b61d29063c][BundleStartStopLogger:77] STARTED liferaycourseetcspringboot_1.0.0 [1722]
   ```

1. `liferay-course-etc-spring-boot` 프로젝트로 이동하여 Spring Boot 애플리케이션을 시작합니다.

   ```bash
   cd liferay-course-etc-spring-boot
   ```

   ```bash
   ./../../gradlew bootRun
   ```

1. 애플리케이션이 시작되면 `http://localhost:58081/ready`로 이동합니다. 애플리케이션을 사용할 준비가 되면 페이지에 "READY"라고 표시됩니다.

이제 배포자 응용 프로그램 개체에 대한 워크플로를 활성화할 수 있습니다.

## 코드 검토

제공된 워크플로 작업 클라이언트 확장은 다음 작업을 수행합니다.

1. 애플리케이션의 상태 값을 검색하고 이를 사용하여 워크플로 전환을 결정합니다.

1. 전환에 대한 비동기 HTTP POST 요청을 만듭니다.

### 워크플로 전환 결정

```java
   @PostMapping
   public ResponseEntity<String> post(
      @AuthenticationPrincipal Jwt jwt, @RequestBody String json) {

      log(jwt, _log, json);

      String transition = "auto-approve";

      JSONObject payload = new JSONObject(json);

      JSONObject entryDTO = payload.getJSONObject("entryDTO");

      JSONObject applicationState = entryDTO.getJSONObject("applicationState");

      String applicationStateKey = applicationState.getString("key");

      if (Objects.equals("approved", applicationStateKey) || Objects.equals("denied", applicationStateKey)) {
         transition = "review";
      }
      ...
   }
```

'WorkflowAction1RestController'의 게시 메서드에는 JWT(JSON 웹 토큰)와 요청 본문이라는 두 가지 매개 변수가 있습니다. 토큰은 HTTP 호출을 인증하고 요청 본문에는 JSON 형식의 문자열로 데이터가 포함됩니다.

요청 본문을 기록한 후 코드는 `transition` 변수를 초기화하고 해당 값을 `auto-approve`로 설정합니다.

그런 다음 `JSONObject()` 생성자와 `.getJSONObject()` 메서드를 사용하여 `applicationState` 필드의 `key` 값을 추출하고 해당 키를 `applicationStateKey` 변수에 저장합니다.

마지막으로 상태 키가 '승인됨' 또는 '거부됨'인 경우 '전환' 변수를 '검토'로 업데이트하는 조건부 블록을 정의합니다.

### POST 요청하기

```java
      try {
         WebClient.Builder builder = WebClient.builder();

         WebClient webClient = builder.baseUrl(
            lxcDXPServerProtocol + "://" + lxcDXPMainDomain
         ).defaultHeader(
            HttpHeaders.ACCEPT, MediaType.APPLICATION_JSON_VALUE
         ).defaultHeader(
            HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE
         ).build();

         webClient.post(
         ).uri(
            payload.getString("transitionURL")
         ).bodyValue(
            "{\"transitionName\": \"" + transition + "\"}"
         ).header(
            HttpHeaders.AUTHORIZATION, "Bearer " + jwt.getTokenValue()
         ).exchangeToMono(
            clientResponse -> {
               HttpStatus httpStatus = clientResponse.statusCode();

               if (httpStatus.is2xxSuccessful()) {
                  return clientResponse.bodyToMono(String.class);
               }
               else if (httpStatus.is4xxClientError()) {
                  return Mono.just(httpStatus.getReasonPhrase());
               }

               Mono<WebClientResponseException> mono =
                  clientResponse.createException();

               return mono.flatMap(Mono::error);
            }
         ).doOnNext(
            output -> {
               if (_log.isInfoEnabled()) {
                  _log.info("Output: " + output);
               }
            }
         ).subscribe();
      }
```

워크플로 전환을 결정한 후 코드는 비동기 HTTP POST 요청을 진행합니다. 먼저 `WebClient`를 초기화하고 구성하여 기본 URL과 헤더를 결정한 다음 `WebClient`에서 `post()` 메서드를 호출합니다.

이 POST 요청은 `uri()`에 대한 원래 응답 본문의 `transitionURL` 값을 사용합니다. 그런 다음 `bodyValue()`를 사용하여 워크플로 작업의 `transitionName`을 `transition` 변수의 값으로 업데이트합니다. 요청은 JWT를 사용하여 인증되고 응답의 HTTP 상태 코드에 따라 기록됩니다.

## 배포자 애플리케이션을 위한 워크플로 활성화

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **응용 프로그램** 탭으로 이동한 다음 **프로세스 빌더** 를 클릭합니다.

1. 기계 승인자 프로세스가 나타나는지 확인합니다.

   ![Confirm the Machine Approver process appears.](./adding-an-approval-workflow/images/01.png)

   이 프로세스는 일괄 클라이언트 확장에 의해 추가되었으며 시작, 컴퓨터 검토, 관리자 검토, 업데이트 및 승인의 5개 노드를 정의합니다.

   Machine Review 노드는 워크플로 작업 클라이언트 확장을 사용하여 각 애플리케이션의 상태 필드를 확인합니다. 값이 '승인됨' 또는 '거부됨'인 경우 응용 프로그램은 비즈니스 개발 관리자의 승인을 위해 관리자 검토 노드로 이동됩니다. 그렇지 않으면 Machine Review 노드가 자동으로 응용 프로그램을 승인된 노드로 보냅니다.

   ![This process includes five nodes: Start, Machine Review, Manager Review, Update, and Approved.](./adding-an-approval-workflow/images/02.png)

1. **구성** 탭으로 이동합니다.

1. Distributor Application에 대해 **Edit** 를 클릭하고 **Machine Approver** 를 선택한 다음 **Save** 를 클릭합니다.

## 워크플로 테스트

1. 배포자 응용 프로그램을 열고 항목 편집을 시작합니다.

1. 상태를 **검토중** 으로 설정하고 **저장** 을 클릭합니다.

1. 항목 상태를 확인하세요. 승인되어야 합니다.

   ![The entry's status should be Approved.](./adding-an-approval-workflow/images/03.png)

1. 항목 상태를 **승인됨** 으로 변경합니다.

1. 항목 상태를 확인하세요. **보류 중** 이어야 합니다.

   ![The entry's status should be Pending.](./adding-an-approval-workflow/images/04.png)

1. **개인 메뉴** 를 열고 **알림** 으로 이동한 다음 새 **워크플로 알림** 을 클릭하세요.

   ![View the workflow notification.](./adding-an-approval-workflow/images/05.png)

1. 자신에게 검토 작업을 할당하고 승인하세요.

   ![Approve the change.](./adding-an-approval-workflow/images/06.png)

1. 항목 상태를 확인하세요. 승인되어야 합니다.

   ![The entry's status should be Approved.](./adding-an-approval-workflow/images/07.png)

엄청난! 신청에 대해 관리자의 검토가 필요한 승인 워크플로를 설정했습니다.

이제 Delectable Bonsai는 신청서 제출, 승인, 거부에 대한 알림을 자동화해야 합니다.

다음: [알림 템플릿 추가하기](./adding-notification-templates.md) 

## 관련 개념

* [워크플로 디자이너](https://learn.liferay.com/web/guest/w/dxp/process-automation/workflow/designing-and-managing-workflows/workflow-designer/workflow-designer-overview)
* [개체에 대한 워크플로 활성화](https://learn.liferay.com/web/guest/w/dxp/building-applications/objects/enabling-workflows-for-objects)
* [마이크로서비스 클라이언트 확장](https://learn.liferay.com/web/guest/w/dxp/building-applications/client-extensions/microservice-client-extensions)
* [배치 클라이언트 확장](https://learn.liferay.com/web/guest/w/dxp/building-applications/client-extensions/batch-client-extensions)
