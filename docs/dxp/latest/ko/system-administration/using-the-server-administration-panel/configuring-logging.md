# 로깅 구성

서버 관리 패널의 로그 수준 탭에서 Liferay DXP 클래스 계층 구조의 클래스 및 패키지에 대한 로깅 수준을 설정하고 서버 관리 로깅 UI를 사용하여 유사하게 관리할 사용자 정의 개체를 추가할 수 있습니다. 클래스 계층 구조의 최상위 근처(예: `com.liferay`)에서 로그 수준을 변경하면 해당 계층 아래의 모든 클래스에 대한 로그 수준도 변경됩니다. 계층 구조에서 불필요하게 높은 수정은 유용하기에는 너무 많은 메시지를 생성합니다.

```{tip}
변경 사항이 더 많은 로그 메시지를 생성하는 경우 가능한 한 구체적으로 만드십시오.
```

각 로깅 구성을 범주라고 합니다.

## 로그 수준 사용자 인터페이스에 클래스 또는 패키지 추가

카테고리를 추가하려면,

1. 제어판 &rarr; 구성 &rarr; 서버 관리로 이동하고 _로그 수준_ 탭을 클릭합니다.

1. 추가 버튼 ![Add](../../images/icon-add.png)을 클릭하여 범주 추가 양식을 엽니다.

1. 양식을 작성하고 *저장*을 클릭하십시오.

1. _저장_을 클릭합니다.

*로거 이름*: 서버에 배포된 클래스, 예: `com.liferay.portal.workflow.kaleo.runtime.internal.notification.TemplateNotificationMessageGenerator`

*로그 수준*: 보고 싶은 로그 수준을 선택합니다: OFF, FATAL, ERROR, WARN, INFO, DEBUG, TRACE 또는 ALL.

![로깅 수준 범주에 배포된 자체 클래스를 추가할 수 있습니다.](./configuring-logging/images/01.png)

로깅 레벨에 대한 설명은 [Apache의 Log4j `레벨` 클래스 Javadoc](https://logging.apache.org/log4j/1.2/apidocs/org/apache/log4j/Level.html) 을 참조하십시오.

## 기존 범주의 로그 수준 변경

기존 로깅 구성의 로그 수준을 변경하려면

1. 제어판 &rarr; 구성 &rarr; 서버 관리로 이동하고 _로그 수준_ 탭을 클릭합니다.

1. 구성할 범주를 찾아보거나 검색합니다.

1. 선택기를 사용하여 레벨을 변경하십시오.

1. _저장_을 클릭합니다.

![가능한 문제를 디버깅하기 위해 기록할 수 있는 클래스의 로깅 수준을 변경할 수 있습니다.](./configuring-logging/images/02.png)