# 모델 리스너 만들기

모델 수신기는 지정된 모델(예: `업데이트` 또는 `추가` 메서드)에 대한 변경 사항을 알리는 지속성 메서드 호출을 수신합니다. 모델 리스너가 사용하는 대부분의 메서드는 DXP의 [`BasePersistenceImpl`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/service/persistence/impl/BasePersistenceImpl.java) 클래스에서 호출됩니다. 기본 엔터티(예: `JournalArticle` 또는 `AssetEntry`) 또는 자체 엔터티에 대한 모델 리스너를 정의할 수 있습니다.

모델 수신기를 추가하려면 [`ModelListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/model/ModelListener.java) 인터페이스를 구현합니다.

여기에서는 모델 리스너를 만드는 방법을 배웁니다.

1. [실행 중인 모델 리스너 검사](#examine-a-running-model-listener)
1. [모델 클래스 및 이벤트 식별](#identify-a-model-class-and-event)
1. [모델 선언](#declare-the-model)
1. [이벤트 선언](#declare-the-event)
1. [비즈니스 로직 구현](#implement-your-business-logic)
1. [배포 및 테스트](#deploy-and-test)

## 실행 중인 모델 리스너 검사

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 `JournalArticle` 모델에 대한 예제 모델 수신기를 배포합니다.

1. 'Acme Model Listener'를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/liferay-internals/extending-liferay/liferay-n4g6.zip -O
    ```

    ```bash
    unzip liferay-n4g6.zip
    ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 배포된 jar를 Docker 컨테이너의 /opt/liferay/osgi/modules에 복사하는 것과 동일합니다.
    ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```
    STARTED com.acme.n4g6.impl_1.0.0
    ```

1. 추가된 로그 메시지를 보고 예제 모델 수신기가 추가되었는지 확인합니다. 브라우저를 `https://localhost:8080` 로 열고 사이트 메뉴 → _콘텐츠 & 데이터_ → _웹 콘텐츠_으로 이동합니다.

   ![웹 콘텐츠 관리 페이지는 웹 콘텐츠를 만들기 위한 인터페이스입니다.](./creating-a-model-listener/images/01.png)

   추가를 클릭하십시오 ![추가](../../images/icon-add.png) 버튼을 클릭한 다음 _기본 웹 콘텐츠_ 을 클릭하여 새 기사를 추가합니다. 제목과 내용을 작성하십시오. 그런 다음 _게시_을 클릭합니다. 콘솔에 경고 메시지가 나타납니다.

   ```
   2020-03-17 23:14:56.301 WARN  [http-nio-8080-exec-5][N4G6ModelListener:23] Added journal article 20478.
   ```

축하합니다! `ModelListener`을 구현하는 새 모델 리스너를 성공적으로 구축하고 배포했습니다.

보시다시피 모델 리스너는 특정 *모델*에서 *이벤트* 을 수신합니다. 이 리스너의 경우 이벤트는 `onAfterCreate`입니다. 콘텐츠가 생성되면 리스너는 이벤트를 "듣고" 이벤트가 발생하면 작업이 시작됩니다.

이제 다른 이벤트를 수신하도록 예제를 수정합니다.

## 모델 클래스 및 이벤트 식별

Liferay DXP의 모델 클래스는 [Service Builder](../../building-applications/data-frameworks/service-builder.md)에서 생성됩니다. 모델 인터페이스는 모든 애플리케이션의 `-api` 모듈에서 찾을 수 있습니다. 예를 들어 메시지 보드 메시지에 대한 모델 인터페이스를 찾으려면 Liferay DXP의 소스 코드에서 [`module/apps/message-boards/message-boards-api`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/message-boards/message-boards-api) 프로젝트를 살펴보십시오.

이 규칙의 예외는 핵심 모델입니다. `User`과 같은 핵심 클래스에 대한 모델 리스너를 생성하려는 경우 Liferay DXP 소스 코드의 [`Portal-kernel`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel) 폴더에서 해당 인터페이스를 찾을 수 있습니다.

생성할 모델 리스너는 Message Boards 메시지용입니다. 메시지가 삭제되면 보고서 로그에 인쇄하는 메시지를 트리거합니다. 가능한 이벤트 목록은 [BaseModelListener](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/model/BaseModelListener.html)에 대한 Javadoc을 참조하십시오.

## 모델 리스너 동작

모델 리스너는 특정 엔티티에 대한 [`ModelListener`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/model/ModelListener.java) 인터페이스를 구현합니다. 모델 리스너는 해당 엔터티가 생성, 업데이트 또는 제거되기 전이나 후에 실행할 코드를 가질 수 있습니다. 이러한 모든 메서드는 `BasePersistenceImpl` 클래스에서 호출됩니다. 생성되거나 업데이트된 엔터티에 대한 코드는 `BasePersistenceImpl`의 `업데이트` 메서드에서 호출되고 제거된 엔터티에 대한 코드는 `BasePersistenceImpl`의 `제거` 메서드에서 호출됩니다.

모델 수신기에는 다른 종류의 관련 엔터티가 추가되거나 제거되기 전이나 후에 실행할 코드가 있을 수도 있습니다. 이러한 메소드는 [`TableMapperImpl`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/internal/service/persistence/TableMapperImpl.java)의 `_addTableMapping` 메소드에서 호출됩니다.

이제 `MBMessage` 클래스 및 `onBeforeRemove` 이벤트에서 작동하도록 프로젝트를 수정합니다.

## 모델 선언

1. 텍스트 편집기 또는 IDE에서 `N4G6ModelListener` 클래스를 엽니다.

1. 클래스 선언을 찾습니다.
    ```java
    @Component(service = ModelListener.class)
    public class N4G6ModelListener extends BaseModelListener<JournalArticle> {
    ```

    `BaseModelListener`을 확장할 때 리스너가 이벤트를 수신 대기하는 모델 클래스를 정의합니다(이 예에서는 `JournalArticle`).

1. 모델 클래스를 `MBMessage`로 수정합니다.

   ```java
   @Component(service = ModelListener.class)
   public class N4G6ModelListener extends BaseModelListener<MBMessage> {
   ```

   이 모델 수신기가 등록되면 정의된 모델에 대한 이벤트를 수신합니다. 모델은 기본 엔터티 또는 사용자 지정 엔터티일 수 있습니다. `BaseModelListener` 클래스를 확장하면 `ModelListener`메서드 각각에 대한 기본 빈 구현이 제공되므로 코드가 깔끔하게 유지되고 필요한 이벤트에 대한 재정의만 포함됩니다.

## 이벤트 선언

다음으로 원하는 이벤트에 대한 구현을 재정의합니다.

1. `onAfterCreate` 메서드를 찾습니다.

   ```java
   public void onAfterCreate(JournalArticle journalArticle)
   ```

1. `onBeforeRemove` 을 재정의하고 `MBMessage` 을 `model`라는 매개변수로 전달하도록 메서드를 변경합니다.

   ```java
   public void onBeforeRemove(MBMessage model)
   ```

## 비즈니스 로직 구현

특정 작업을 트리거하는 것은 특정 모델 이벤트를 수신 대기하는 일반적인 이유입니다. 이 예는 일을 단순하게 유지합니다. Message Boards 메시지가 삭제될 때 메시지 제목을 로그에 보고하려고 합니다.

1. 새로운 `onBeforeRemove` 메서드에서 `if` 문을 다음 문으로 바꿉니다.

   ```java
   if (_log.isWarnEnabled()) {
       _log.warn("Warning! Message " + model.getSubject() + " was just removed.");
   }
   ```

1. `MBMessage` 에 대한 새 가져오기를 파일 맨 위에 있는 가져오기 섹션에 추가하십시오.

   ```java
   import com.liferay.message.boards.model.MBMessage;
   ```

   `JournalArticle`에 대해 사용하지 않는 가져오기를 제거합니다.

1. 새 모델 수신기를 저장합니다.

## 배포 및 테스트

위와 같이 모델 수신기를 빌드하고 배포할 수 있습니다.

```bash
./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

게시판 메시지를 추가한 다음 삭제하여 수신기를 테스트합니다.

1. Go to *제품 메뉴* &rarr; *콘텐츠 & 데이터* &rarr; *게시판*.

1. ![Add](../../images/icon-add.png) 추가 버튼을 클릭하고 제목과 본문을 입력한 다음 *게시*를 클릭합니다.

1. 메뉴에서 *게시판* 을 다시 클릭하면 메시지를 볼 수 있습니다. 동작 ![Action](../../images/icon-actions.png) 버튼을 클릭하고 *휴지통*로 이동을 선택합니다. 메시지가 재활용되기만 했기 때문에 아직 로그에 메시지가 표시되지 않습니다.

1. 제품 메뉴에서 *휴지통* 을 클릭하면 메시지가 표시됩니다.

1. 작업 ![Action](../../images/icon-actions.png) 버튼을 클릭하고 *삭제*를 선택합니다. 삭제를 확인합니다.

1. 로그를 확인하십시오. 메시지가 나타납니다:

   ```
   2020-04-17 21:10:31.080 WARN  [http-nio-8080-exec-5][N4G6ModelListener:19] Warning! Message This is a Test Message was just removed.
   ```

## 결론

축하합니다! 이제 `ModelListener` 인터페이스를 구현하는 방법을 알고 Liferay DXP에 새 모델 리스너를 추가했습니다.

## 관련 항목

[모델 리스너 Javadoc](https://learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/model/BaseModelListener.html)

[서비스 빌더](../../building-applications/data-frameworks/service-builder.md)
