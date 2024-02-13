---
toc:
  - ./building-a-custom-ticketing-system/defining-a-custom-data-schema.md
  - ./building-a-custom-ticketing-system/applying-a-custom-theme.md
  - ./building-a-custom-ticketing-system/deploying-a-custom-application.md
  - ./building-a-custom-ticketing-system/implementing-a-documentation-referral-system.md
  - ./building-a-custom-ticketing-system/ticket-management-with-cron-jobs.md
---
# 맞춤형 티켓팅 시스템 구축

Liferay를 사용하면 디지털 솔루션을 쉽게 구축할 수 있습니다. 예를 들어 비즈니스에 필요한 스타일과 기능을 갖춘 사용자 정의 티켓팅 애플리케이션을 만들 수 있습니다.

![See the custom ticketing system sample.](./building-a-custom-ticketing-system/images/01.png)

여기서는 맞춤형 티켓팅 시스템이 어떻게 작동하는지 알아보세요. 당신은 방법을 배울 것입니다

* 맞춤 데이터 스키마 정의
* 사용자 정의 CSS 테마 적용
* 사용자 정의 애플리케이션 배포
* 문서 추천 시스템 구현

이러한 각 구성 요소는 [클라이언트 확장](../../building-applications/client-extensions.md)을 사용하여 배포할 수 있습니다. 각 클라이언트 확장의 구성은 [`client-extension.yaml`](../../building-applications/client-extensions/working-with-client-extensions.md#configuring-client-extensions) 에 의해 정의됩니다. 파일.

## 전제 조건

시작하기 전에 적절한 파일을 다운로드하고 시스템을 설정하십시오.

1. 예시 작업공간을 다운로드하려면 다음 명령어를 실행하세요.

   ```bash
   curl -o com.liferay.ticket.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content?r=liferay-public-releases&g=com.liferay.workspace&a=com.liferay.ticket.workspace&v=LATEST&p=zip
   ```

1. 명령줄에서 'liferay-ticket-workspace' 폴더로 이동합니다.

   ```bash
   cd liferay-ticket-workspace
   ```

1. 로컬 Liferay 번들을 생성합니다.

   ```bash
   ./gradlew initBundle
   ```

1. Liferay 번들을 실행합니다.

   ```bash
   ./bundles/tomcat-9.0.73/bin/catalina.sh run
   ```

1. 이메일 주소 **test@liferay.com** 및 비밀번호 **test** 를 사용하여 http://localhost:8080 에서 Liferay에 로그인합니다. 메시지가 나타나면 비밀번호를 **learn** 으로 변경하세요.

1. 모든 샘플 프로젝트를 빌드합니다.

   ```bash
   ./gradlew build
   ```

첫 번째 단계에서는 맞춤 데이터 스키마를 정의합니다.

[가자!](./building-a-custom-ticketing-system/defining-a-custom-data-schema.md)
