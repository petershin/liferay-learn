# 문서 추천 시스템 구현

티켓팅 시스템은 문서 추천 시스템을 통해 더욱 향상될 수 있습니다. 시스템은 티켓의 내용과 설명을 기반으로 관련 문서를 자동으로 검색하므로 고객 지원 워크플로가 향상됩니다.

추천 시스템을 활성화하고 배포하려면 다음 단계를 따르세요.

1. 이전 `liferay-ticket-batch-object-definition` 클라이언트 확장의 `/batch/object-defintion.batch-engine-data.json` 파일로 이동합니다. 36행의 `objectActions` 섹션에서 `active` 값을 `false`에서 `true`로 변경합니다.

1. 다음 명령을 사용하여 `liferay-ticket-batch-object-definition` 클라이언트 확장을 다시 배포합니다.

   ```bash
   ./gradlew :client-extensions:liferay-ticket-batch-object-definition:deploy
   ```

   [객체 작업](../../../building-applications/objects/creating-and-managing-objects/actions.md)은 UI에서도 활성화할 수 있습니다. Liferay에서 **Control Panel** &rarr; **Objects** 로 이동합니다. **Ticket** 개체를 클릭하고 **Actions** 탭을 클릭합니다. 작업이 '활성'인지 확인하세요.

   ![Object action is active.](./implementing-a-documentation-referral-system/images/01.png)

1. 그런 다음 다음 명령을 실행합니다.

   ```bash
   ./gradlew :client-extensions:liferay-ticket-etc-spring-boot:deploy
   ```

   성공적인 배포를 확인하려면 로그를 확인하세요.

1. 그런 다음 다음 명령을 실행하여 스프링 부트 애플리케이션을 시작합니다.

   ```bash
   ./gradlew :client-extensions:liferay-ticket-etc-spring-boot:bootRun
   ```

   현재 문서 조회 시스템이 실행 중입니다.

1. 티켓팅 시스템 사이트 페이지로 다시 이동하세요. **새 티켓 생성** 을 클릭하세요. 새로운 티켓이 생성됩니다.

1. **글로벌 메뉴** &rarr; **제어판 &rarr;** J3Y7 티켓 **으로 이동하세요. 티켓 목록 오른쪽으로 스크롤하세요. 방금 생성된 티켓에 대해** 옵션 (**![옵션 아이콘](../../../images/icon-options.png))을 클릭하고** 보기_를 클릭하세요.

   제안 필드까지 아래로 스크롤합니다. 추천 시스템에 관련 문서에 대한 링크가 포함되어 있는지 확인하세요.

   ![See that the referral system has included links to relevant documentation.](./implementing-a-documentation-referral-system/images/02.png)

## 추천 시스템 코드 검사

문서 참조 시스템은 [microservice](../../../building-applications/client-extensions/microservice-client-extensions.md) 유형 클라이언트 확장입니다. 특히 이 샘플은 `BootJar`로 빌드된 Spring Boot 애플리케이션입니다. `client-extension.yaml`의 `assemble` 블록 섹션은 이를 다음과 같이 식별합니다.

조립:
- fromTask: bootJar

자세한 내용은 [클라이언트 확장 조립](../../../building-applications/client-extensions/working-with-client-extensions#assembling-client-extensions) 을 참조하세요.

마이크로서비스 클라이언트 확장은 Liferay와 상호 작용하기 위해 OAuth2 사용자 에이전트 구성이 필요합니다. 따라서 `client-extension.yaml` 파일에는 `oAuthApplicationUserAgent` 유형 클라이언트 확장과 `objectAction` 유형 클라이언트 확장이 모두 포함되어 있습니다.

'liferay-ticket-etc-spring-boot-oauth-application-user-agent' 클라이언트 확장은 추천 시스템 애플리케이션이 인증에 사용할 수 있도록 Liferay 내에서 OAuth2 애플리케이션을 생성합니다. 이는 다음과 같이 정의됩니다:

```yaml
liferay-ticket-etc-spring-boot-oauth-application-user-agent:
    .serviceAddress: localhost:58081
    .serviceScheme: http
    name: Liferay Ticket Etc Spring Boot OAuth Application User Agent
    scopes:
        - C_J3Y7Ticket.everything
    type: oAuthApplicationUserAgent
```

`C_J3Y7Ticket.everything` 헤드리스 API에 액세스 권한이 부여되는 방식에 유의하세요. 'serviceAddress' 매개변수는 서비스가 로컬에서 실행되는 사이트를 정의합니다.

다음으로 `liferay-ticket-etc-spring-boot-object-action-ticket` 클라이언트 확장은 객체 작업이 발생할 때 마이크로서비스 코드를 트리거하는 `objectAction` 유형 클라이언트 확장입니다. 이는 다음과 같이 정의됩니다:

```yaml
liferay-ticket-etc-spring-boot-object-action-ticket:
    name: Liferay Ticket Etc Spring Boot Object Action Ticket
    oAuth2ApplicationExternalReferenceCode: liferay-ticket-etc-spring-boot-oauth-application-user-agent
    resourcePath: /object/action/ticket
    type: objectAction
```

'resourcePath' 매개변수는 마이크로서비스가 실행되는 엔드포인트를 정의합니다. 'oAuth2ApplicationExternalReferenceCode' 매개변수는 이전 OAuth2 애플리케이션 구성을 참조합니다.

각 속성에 대한 설명은 [객체 작업 Yaml 구성](../../../building-applications/client-extensions/microservice-client-extensions/object-action-yaml-configuration-reference.md)을 참조하세요.

애플리케이션의 관련 Spring Boot 파일은 `/src` 폴더에 포함되어 있습니다. Java 코드에 대한 전체 설명은 이 튜토리얼의 범위를 벗어나지만 몇 가지 참고할 사항이 있습니다.

* `ObjectActionTicketRestController.java` 파일에서 `@PostMapping` 주석은 위의 YAML 파일에서 참조된 리소스 경로와 일치합니다. 새 티켓 개체가 생성되면 개체 작업이 이 경로에서 마이크로서비스를 트리거하고 추천 결과가 Liferay로 반환됩니다.

* 추천 검색 로직은 이 `ObjectActionTicketRestController.java` 파일에도 있습니다. 로직에서는 [learn.liferay.com](https://learn.liferay.com) 의 관련 기사를 찾아 티켓 개체 항목에 추가합니다.

다음: [Cron 작업을 통한 티켓 관리](./ticket-management-with-cron-jobs.md).

## 관련 개념

* [Java 웹 애플리케이션 개발](../../../building-applications/developing-a-java-web-application.md)
* [마이크로서비스 클라이언트 확장](../../../building-applications/client-extensions/microservice-client-extensions.md)
