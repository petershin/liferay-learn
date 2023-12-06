# Cron 작업을 통한 티켓 관리

Cron 작업을 사용하여 티켓 관리를 자동화하세요. 예를 들어, 해결 유형이 '중복' 또는 '완료'인 티켓을 삭제하기 위해 정기적인 일정에 따라 실행되는 작업이 있습니다.

크론 작업을 활성화하고 배포하려면 다음 단계를 따르세요.

1. **티켓팅 시스템** 사이트 페이지로 다시 이동하세요. 해결 유형이 '중복' 또는 '완료'인 티켓이 하나 이상 생길 때까지 **새 티켓 생성** 을 여러 번 클릭하세요.

   ![Verify that you have a ticket that has a duplicate or done resolution type.](./ticket-management-with-cron-jobs/images/01.png)

1. 명령줄을 열고 다음 명령을 실행합니다.

   ```bash
   ./gradlew :client-extensions:liferay-ticket-etc-cron:deploy
   ```

   성공적인 배포를 확인하려면 로그를 확인하세요.

1. 그런 다음 다음 명령을 실행하여 스프링 부트 애플리케이션을 시작합니다.

   ```bash
   ./gradlew :client-extensions:liferay-ticket-etc-cron:bootRun
   ```

   이제 크론 작업이 실행 중입니다. 로그를 확인하거나 **티켓팅 시스템** 사이트 페이지를 새로 고쳐 티켓이 삭제되었는지 확인하세요.

   ![티켓팅 시스템 사이트 페이지를 새로고침하세요. 티켓이 삭제되었는지 확인하세요.](./ticket-management-with-cron-jobs/images/02.png)

## 크론 작업 코드 검사

이 크론 작업은 [microservice](../../../building-applications/client-extensions/microservice-client-extensions.md) 유형 클라이언트 확장입니다. 특히 이전 문서 참조 시스템 클라이언트 확장과 마찬가지로 Spring Boot 애플리케이션입니다. 따라서 `client-extension.yaml` 파일에는 이전과 동일한 `assemble` 블록 섹션과 `oAuthApplicationUserAgent` 섹션이 포함되어 있습니다.

애플리케이션의 관련 Spring Boot 파일은 `/src` 폴더에 포함되어 있습니다. Java 코드에 대한 전체 설명은 이 튜토리얼의 범위를 벗어나지만 몇 가지 참고할 사항이 있습니다.

* `TicketSpringBootApplication.java` 파일은 OAuth 인증을 수행합니다.

* 주요 로직은 `TicketCommandLineRunner.java` 파일에 있습니다. 티켓의 해결 결과가 '중복' 또는 '완료'인 경우 티켓이 삭제됩니다.

맞춤형 티켓팅 시스템 구축에 대한 이 솔루션 튜토리얼을 완료한 것을 축하합니다.

## 관련 개념

* [Java 웹 애플리케이션 개발](../../../building-applications/developing-a-java-web-application.md)
* [마이크로서비스 클라이언트 확장](../../../building-applications/client-extensions/microservice-client-extensions.md)
