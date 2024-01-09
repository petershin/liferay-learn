# Cloud Console에서 마이크로서비스 문제 해결

이전에는 피드백 항목이 Liferay에 제출될 때 기록하기 위해 [마이크로서비스 클라이언트 확장](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions#object-action-client-extensions) 을 사용하여 테스트했습니다. 이제 Kyle은 총 항목 수를 기록하기 위해 Spring Boot 애플리케이션에 간단한 카운터 변수를 추가하려고 합니다.

여기에서는 [이전에 배포한](./deploying-and-managing-a-microservice-client-extension-project.md) 샘플 클라이언트 확장 프로젝트를 수정하고 문제가 발생하면 Cloud Console에서 문제를 해결합니다.

## 개체 작업 REST 컨트롤러에 카운터 추가

[샘플 Spring Boot 클라이언트 확장](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot) `ObjectAction1RestController.java` 파일을 사용하여 Liferay에서 받은 객체 데이터를 기록합니다. Kyle은 각각의 새로운 피드백 항목을 계산하고 이를 새 로그 메시지에 대한 기존 항목 수에 추가하는 간단한 변수를 추가하려고 합니다.

이 동작을 구현하려면 몇 가지 추가 코드를 추가하세요.

1. [에 Spring Boot 프로젝트를 배포한 `liferay-sample-etc-spring-boot` 폴더에서](./deploying-and-managing-a-microservice-client-extension-project.md#download-the-sample-workspace) `src/main/java/com/liferay/sample/ObjectAction1RestController.java` 파일을 엽니다.

1. `카운트` 변수를 클래스의 필드로 추가합니다. 

   ```java
   public class ObjectAction1RestController extends BaseRestController {

   private int count = 0;

   ...
   ```

1. 기존 항목의 값을 삽입하려면 다른 필드를 추가하세요. 

   ```java
   @Value("${EXISTING_FEEDBACK}")
   protected int existingFeedback;
   ```

1. 이 값 주입이 작동하려면 상단의 `import` 문에 추가 줄을 추가하세요. 

   ```java
   import org.springframework.beans.factory.annotation.Value;
   ```

1. 추가 로깅을 추가하려면 이러한 새 변수를 사용하십시오. `post` 메서드의 `return` 문 앞에 다음 줄을 추가합니다. 

   ```java
   count++;

   int total = count + existingFeedback;

   _log.info("Total feedback so far: " + total);
   ```

이제 최소한의 카운터 구현을 위한 충분한 코드가 생겼습니다.

## 업데이트된 프로젝트 배포

이제 `liferay-sample-etc-spring-boot/` 폴더에서 명령줄을 열어 프로젝트를 다시 빌드하고 배포합니다.

1. 새로운 배포 가능한 LUFFA에 프로젝트를 빌드합니다. 

   ```bash
   ../../gradlew clean build
   ```

1. CLI 도구를 사용하여 빌드된 LUFFA를 배포합니다. 

   ```bash
   lcp deploy --extension dist/liferay-sample-etc-spring-boot.zip
   ```

메시지가 표시되면 UAT 클라이언트 확장 환경에 해당하는 번호를 선택합니다.

클라이언트 확장 프로젝트가 배포되고 지연 후 Cloud Console에 표시됩니다.

## 마이크로서비스 확인

Cloud 콘솔에 `liferaysampleetcspringboot` 서비스가 나타나는데, 잠시 기다려도 "Ready" 상태가 나타나지 않는 것 같습니다.

![liferaysampleetcspringboot 서비스가 있지만 준비 상태가 되는 데 훨씬 더 오랜 시간이 걸립니다.](./troubleshooting-a-microservice-in-the-cloud-console/images/01.png)

이전과 동일한 방식으로 개체 작업을 트리거해 보세요.

1. UAT Liferay 인스턴스에 로그인하십시오.

1. 양식에서 **제출** 클릭하여 새 개체 항목을 생성하고 작업을 트리거합니다.

1. Cloud 콘솔로 돌아가서 `liferaysampleetcspringboot` 서비스를 클릭합니다.

잠시 기다려도 로그에는 추가한 새 메시지가 표시되지 않으며 새 항목에 대한 로깅도 표시되지 않습니다. 위의 오류 메시지도 볼 수 있습니다.

![서비스 로그에 예상한 새 로깅이 표시되지 않습니다.](./troubleshooting-a-microservice-in-the-cloud-console/images/02.png)

좀 더 기다리면 이러한 오류로 인해 서비스가 계속해서 다시 시작되는 것을 확인할 수 있습니다. 새 코드에 문제가 있는 것 같습니다.

## 애플리케이션 로그 검색

Liferay Cloud 콘솔에서 애플리케이션 로그를 검색하여 마이크로서비스에 문제가 있는 징후를 찾으세요. 필터링 및 검색 도구를 사용하여 관련 정보를 찾을 수 있도록 로그 페이지를 사용하십시오.

1. 왼쪽 메뉴에서 **로그** 선택합니다.

1. 로그 페이지의 화면 상단에 있는 드롭다운 메뉴에서 **애플리케이션 로그** 선택되어 있는지 확인하세요.
   
   클라이언트 확장 서비스는 하나만 실행되므로 서비스별로 필터링할 필요가 없습니다.

1. "피드백"이라는 용어를 검색하여 추가한 새 변수와 관련된 단서를 찾으세요.
   
   ![오류 메시지나 전체 스택 추적을 찾으려면 "피드백" 용어를 검색하세요.](./troubleshooting-a-microservice-in-the-cloud-console/images/03.png)

로그는 전체 스택 추적으로 필터링됩니다. 여기서 루트 `예외` 삽입을 통해 추가한 변수와 명확하게 관련되어 있습니다.

```
Caused by: java.lang.IllegalArgumentException: Could not resolve placeholder 'EXISTING_FEEDBACK' in value "${EXISTING_FEEDBACK}"
```

이제 Kyle은 문제를 깨달았습니다. Spring Boot는 어디에서나 `EXISTING_FEEDBACK` 의 값을 찾을 수 없습니다!

## 누락된 환경 변수 추가

Spring Boot는 컨테이너에 동일한 이름을 가진 환경 변수의 값을 주입할 수 있습니다. 서비스의 환경 변수로 `EXISTING_FEEDBACK` 값을 추가해 보세요.

1. 왼쪽 메뉴에서 **서비스** 클릭하여 `liferaysampleetcspringboot` 서비스가 나타나는 사이트로 돌아갑니다.

1. `liferaysampleetcspringboot` 서비스를 클릭합니다.

1. **환경 변수** 탭을 클릭합니다.

1. 일반 변수 목록에 새 환경 변수를 추가합니다. 키로 `EXISTING_FEEDBACK` 사용하고 값으로 `2` 추가합니다(지금까지 생성한 두 항목에 대해).
   
   ![Spring Boot가 값 주입에 사용할 수 있는 EXISTING_FEEDBACK 환경 변수를 추가합니다.](./troubleshooting-a-microservice-in-the-cloud-console/images/04.png)

1. **변경 사항 저장** 클릭합니다.

1. 화면 상단의 **Actions** 메뉴( ![Actions menu](../../images/icon-actions.png) )를 클릭하고 **Restart Service** 클릭하면 새 변수가 제대로 초기화됩니다.

새 환경 변수로 인해 지연된 후 서비스가 다시 시작됩니다.

## 환경 변수가 있는지 확인

셸을 사용하여 변수가 Spring Boot에서 감지할 수 있는 환경에 있는지 확인하세요. 콘솔에서 셸에 액세스하면 마이크로서비스가 실행되는 컨테이너에 직접 액세스할 수 있습니다.

1. 서비스 페이지에 있는 동안 **Shell** 탭을 클릭하세요.

1. `printenv` 명령을 사용하여 새 환경 변수가 있는지 확인합니다.

```bash
printenv | grep "EXISTING"
```

![printenv를 사용하여 새 환경 변수가 올바르게 초기화되었는지 확인하세요.](./troubleshooting-a-microservice-in-the-cloud-console/images/05.png)

환경 변수는 Spring Boot가 사용할 수 있는 곳에 존재합니다.

## 새 로깅을 다시 테스트하세요.

새로운 변경 사항을 한 번 더 테스트해 보세요.

1. UAT Liferay 인스턴스로 돌아가서 로그인했는지 확인하세요.

1. 입력 개체 양식에서 **제출** 클릭합니다.

1. Cloud 콘솔로 다시 돌아가서 `liferaysampleetcspringboot` 서비스 페이지로 이동하여 로그를 확인하세요.

![개체 작업 클라이언트 확장이 작동하고 새 로깅이 예상한 사이트에 표시됩니다.](./troubleshooting-a-microservice-in-the-cloud-console/images/06.png)

이제 개체 작업 클라이언트 확장이 다시 작동하는 것을 볼 수 있으며 새 로그 메시지가 기존 로깅과 함께 표시됩니다. Liferay 인스턴스에 더 많은 값을 제출하면 카운터 값이 매번 증가합니다.

축하해요! Liferay Experience Cloud를 다루는 최종 모듈을 완료했습니다. 나머지 과정에서는 Liferay Experience Cloud 자체 관리에 중점을 둡니다. 

다음: [클라우드 구성](../cloud-configuration.md). 

## 관련 개념

* [마이크로서비스 클라이언트 확장](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions#object-action-client-extensions)
* [Liferay 클라우드 서비스 로그 읽기](https://learn.liferay.com/w/liferay-cloud/troubleshooting/reading-liferay-cloud-service-logs)
* [셸 액세스](https://learn.liferay.com/w/liferay-cloud/troubleshooting/shell-access)
* [문제 해결 서비스](https://learn.liferay.com/w/liferay-cloud/troubleshooting/troubleshooting-services)
* [자가 치유](https://learn.liferay.com/w/liferay-cloud/troubleshooting/self-healing)
* [환경 변수 정의](https://learn.liferay.com/w/liferay-cloud/reference/defining-environment-variables#defining-environment-variables-via-the-liferay-cloud-console)
