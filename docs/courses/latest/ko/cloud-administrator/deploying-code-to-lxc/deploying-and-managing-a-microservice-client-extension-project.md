# 마이크로서비스 클라이언트 확장 프로젝트 배포 및 관리

Kyle은 사용자가 제출한 피드백을 추적하는 데 도움이 되도록 [마이크로서비스 클라이언트 확장](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions#object-action-client-extensions) 을 사용하여 사용자 정의 애플리케이션 개발을 시작하려고 합니다.

여기에서는 [Liferay의 샘플 작업공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) 에서 [Spring Boot](https://spring.io/projects/spring-boot) 사용하여 샘플 마이크로서비스 클라이언트 확장을 시험해 보는 것부터 시작하겠습니다.

## 샘플 작업공간 다운로드

컴퓨터에서 클라이언트 확장에 대한 샘플 작업공간을 다운로드하고 압축을 풉니다.

```bash
curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
```

```bash
unzip com.liferay.sample.workspace-latest.zip
```

작업 공간의 압축을 푼 후 `client-extensions/liferay-sample-etc-spring-boot/` 폴더를 열어 계속 진행합니다.

## 샘플 Spring Boot 프로젝트 구성

샘플 Spring Boot 프로젝트는 `application.properties` 파일을 사용하여 대상 Liferay 인스턴스의 도메인을 포함한 중요한 값을 등록합니다. 배포하기 전에 Spring Boot 프로젝트를 구성하세요.

1. 다운로드한 샘플 Spring Boot 프로젝트에서 `src/main/resources/application.properties` 파일을 엽니다.

1. UAT 사이트의 도메인을 사용하여 `com.liferay.lxc.dxp.domains` 및 `com.liferay.lxc.dxp.mainDomain` 에 대한 속성을 추가합니다(예: `uat.delectablebonsai.com`).

   ```properties
   com.liferay.lxc.dxp.domains=YOUR DOMAIN
   com.liferay.lxc.dxp.mainDomain=YOUR DOMAIN
   ```

1. `https` 프로토콜에 대한 다른 속성을 추가합니다.

   ```properties
   com.liferay.lxc.dxp.server.protocol=https
   ```

이제 프로젝트가 LXC 인스턴스에 맞게 올바르게 구성되었으며 배포할 준비가 되었습니다.

## 프로젝트 빌드 및 배포

샘플 Spring Boot 프로젝트 폴더에서 LXC 인스턴스에 프로젝트를 빌드하고 배포합니다.

1. 이 명령을 실행하여 배포 가능한 [클라이언트 확장 패키징](https://learn.liferay.com/w/dxp/building-applications/client-extensions/packaging-client-extensions) 에 프로젝트를 빌드합니다.

   ```bash
   ../../gradlew clean build
   ```

   빌드는 먼저 `bootJar` Gradle 작업을 실행합니다( [`client-extension.yaml` 파일에 정의되어 있기 때문입니다](https://learn.liferay.com/w/dxp/building-applications/client-extensions/working) . -with-client-extensions#assembling-client-extensions)), 'dist/' 폴더에 배포에 필요한 모든 구성 요소가 포함된 LUFFA를 생성합니다.

1 CLI 도구를 사용하여 빌드된 LUFFA를 배포합니다. 

   ```bash
   lcp deploy --extension dist/liferay-sample-etc-spring-boot.zip
   ```

   메시지가 표시되면 UAT 클라이언트 확장 환경에 해당하는 번호를 선택합니다.

![프로젝트를 배포하려면 UAT 클라이언트 확장 환경의 번호를 입력하세요.](./deploying-and-managing-a-microservice-client-extension-project/images/01.png)

클라이언트 확장 프로그램은 UAT 환경에 배포되고 지연 후 Cloud 콘솔에 표시됩니다. 서비스 컨테이너가 실행 중이고 Spring Boot 애플리케이션이 시작되면 준비 상태가 나타납니다.

![콘솔을 확인하여 Spring Boot 서버가 시작되었는지 확인하세요.](./deploying-and-managing-a-microservice-client-extension-project/images/02.png)

## 객체 데이터 추가

[개체](https://learn.liferay.com/w/dxp/building-applications/objects) 은 클라이언트 확장을 사용하여 Liferay에서 데이터를 유지하고 조작하는 이상적인 방법입니다.

배포한 프로젝트에서 [마이크로서비스 클라이언트 확장](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions#object-action-client-extensions) 중 하나를 호출하는 [액션](https://learn.liferay.com/w/dxp/building-applications/objects/creating-and-managing-objects/actions) 을 사용하여 개체 정의를 만듭니다.

### 객체 정의 생성

1. UAT Liferay 인스턴스에 로그인하십시오.

1. 응용 프로그램 메뉴 열기( ![Applications menu](../../images/icon-applications-menu.png) ) &rarr; **제어판** &rarr; **개체** .

1. 개체 페이지에서 **Add**( ![Add icon](../../images/icon-actions.png) )을 클릭하고 새 사용자 정의 개체 양식을 작성합니다.

   * **라벨** : 피드백 입력

   * **복수형 라벨** : 피드백 입력

   * **객체 이름** : `FeedbackInput`
     
     ![피드백 입력 개체 정의에 대한 기본 정보 양식을 작성합니다.](./deploying-and-managing-a-microservice-client-extension-project/images/03.png)

1. **저장** 클릭하세요.
   
   개체 정의는 초안으로 생성되지만 개체 작업 클라이언트 확장을 사용하려면 여전히 필드와 작업이 필요합니다.

### 부울 필드 추가

1. 편집하려면 개체 목록에서 **피드백 입력 개체 정의** 클릭하세요.

1. **필드** 탭을 클릭합니다.

1. **Add**( ![Add icon](../../images/icon-add.png) )을 클릭하고 새 필드 양식을 작성합니다.

   * **라벨** : 도움이 되었나요?

   * **필드 이름** : `도움이 됨`

   * **유형** : 부울

1. **저장** 클릭하세요.

### 클라이언트 확장을 호출하는 작업 추가 및 게시

1. **작업** 탭을 클릭합니다.

1. ** 추가( ![Add icon](../../images/icon-add.png) )를 클릭합니다.

1. 작업에 대한 기본 정보 양식을 작성합니다.

   * **작업 라벨** : 새로운 피드백

   * **작업 이름** : `NewFeedback`

1. **Action Builder** 탭을 클릭합니다.

1. 작업 드롭다운 메뉴에서 'object-action-executor[function#liferay-sample-etc-spring-boot-object-action-1]'을 선택합니다.
  
  ![첫 번째 Spring Boot 개체 작업 클라이언트 확장에 대한 개체 작업 실행자 항목을 선택합니다.](./deploying-and-managing-a-microservice-client-extension-project/images/04.png)

1. **저장** 클릭하세요.

1. 개체 정의의 세부 정보 탭으로 다시 이동하여 **게시** 를 클릭합니다.

이제 객체 정의가 게시되었으며 이를 사용하여 객체 데이터를 제출할 수 있습니다.

### 일부 객체 데이터 제출

이제 새 개체 정의를 사용하여 양식을 추가하면 개체 작업을 테스트할 수 있습니다.

1. 사이트의 홈 페이지로 다시 이동합니다.

1. 페이지 상단에서 **편집**( ![Edit icon](../../images/icon-edit.png) )을 클릭하세요.

1. 화면 왼쪽의 조각 목록에서 **Form Container** 조각을 페이지로 드래그합니다.
   
   ![양식 컨테이너 조각을 페이지로 끌어 개체 정의에 매핑할 수 있는 양식을 만듭니다.](./deploying-and-managing-a-microservice-client-extension-project/images/05.png)

1. 양식 컨테이너의 드롭다운 메뉴에서 새로운 **피드백 입력 개체 정의** 선택합니다.

1. 페이지 상단에서 **게시** 클릭하세요.
   
   ![객체의 "유용한" 입력은 이제 간단한 형태의 체크박스입니다.](./deploying-and-managing-a-microservice-client-extension-project/images/06.png)
   
   양식이 페이지에 "이 정보가 도움이 되었나요?"라는 문구와 함께 표시됩니다. 체크박스.

1. **제출** 버튼을 클릭하세요.

양식을 제출하면 개체 항목이 생성되고 배포한 개체 작업 클라이언트 확장이 호출됩니다.

## Cloud Console에서 결과 검토

이제 개체 작업을 트리거했으므로 Spring Boot 애플리케이션의 로깅을 확인하여 호출이 성공했는지 확인하세요.

1. Cloud 콘솔에 로그인하고 UAT 환경으로 이동합니다.

1. 배포된 마이크로서비스의 전체 목록을 보려면 **서비스** 을 클릭하세요.

1. `liferaysampleetcspringboot` 서비스를 선택합니다.

로그 탭은 서비스 페이지에 기본적으로 표시되며 Liferay가 전송한 개체 데이터를 인쇄하는 Spring Boot 애플리케이션 로그를 볼 수 있습니다.

![개체 작업 클라이언트 확장을 트리거하는 Liferay의 결과를 보려면 로그를 확인하세요.](./deploying-and-managing-a-microservice-client-extension-project/images/07.png)

이제 개체 작업이 성공적으로 작동하는 것을 볼 수 있습니다.

## 마이크로서비스 삭제

Kyle은 이 개체 작업을 사용자 정의할 계획이지만, 무엇을 추가할지 파악하는 동안 UAT 환경에 이 버전을 배포할 필요는 없습니다.

샘플 마이크로서비스 사용이 완료되었으므로 이제 콘솔에서 서비스를 삭제하세요.

1. 해당 서비스 페이지 오른쪽 상단의 **작업**( ![Actions menu](../../images/icon-actions.png) )을 클릭하고, **서비스 삭제** 클릭하세요.

1. 삭제의 영향을 확인하려면 `liferaysampleetcspringboot` 입력합니다.
   
   ![서비스 이름을 입력하면 버튼을 통해 삭제할 수 있습니다.](./deploying-and-managing-a-microservice-client-extension-project/images/08.png)

1. **서비스 삭제** 클릭하십시오.
   
   클라이언트 확장 서비스를 삭제하면 개체 정의 작업에 대한 링크도 끊어집니다. 일반적으로 현재 사용하지 않는 개체 동작도 제거하지만 이 경우에는 다음 연습을 위해 다시 만드는 단계를 저장하기 위해 그대로 둡니다. 

지연 후 서비스가 삭제되고 Cloud Console에서 사라집니다.

이제 UAT에서 샘플 Spring Boot 애플리케이션을 성공적으로 테스트했습니다. 

다음: [콘솔에서 문제를 해결하세요](./troubleshooting-a-microservice-in-the-cloud-console.md).

## 관련 개념

* [클라이언트 확장 작업](https://learn.liferay.com/w/dxp/building-applications/client-extensions/working-with-client-extensions)
* [마이크로서비스 클라이언트 확장](https://learn.liferay.com/w/dxp/building-applications/client-extensions/microservice-client-extensions)
