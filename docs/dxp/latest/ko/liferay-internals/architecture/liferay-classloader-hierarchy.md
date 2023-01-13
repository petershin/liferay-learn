# Liferay 클래스로더 계층

모든 Liferay DXP/Portal 애플리케이션은 OSGi 컨테이너에 상주합니다. DXP/Portal은 애플리케이션 서버에 배포된 웹 애플리케이션입니다. 모듈 프레임워크 번들(모듈)은 OSGi 컨테이너에 있으며 클래스 로더가 있습니다. Java의 Bootstrap 클래스 로더에서 번들 클래스 및 JSP용 클래스 로더에 이르는 모든 클래스 로더는 계층 구조의 일부입니다.

DXP의 클래스 로더에는 계층 구조가 있으며 다음 컨텍스트에서 이해할 수 있습니다.

* 앱 서버에 배포된 Liferay DXP와 같은 웹 애플리케이션
* 모듈 프레임워크에 배포된 OSGi 번들

다음 다이어그램은 Liferay DXP의 클래스 로더 계층 구조를 보여줍니다.

![그림 1.0: 다음은 Liferay의 클래스로더 계층 구조입니다.](./liferay-classloader-hierarchy/images/01.png)

다음은 클래스 로더 설명입니다.

* **부트스트랩**: JRE의 클래스(패키지 `java.*`에서) 및 Java 확장 클래스( `$JAVA_HOME/lib/ext`에서). 컨텍스트에 관계없이 모든 `java.*` 클래스 로드는 부트스트랩 클래스 로더에 위임됩니다.

* **시스템**: `CLASSPATH` 에 구성되거나 애플리케이션 서버의 Java 클래스 경로(`-cp` 또는 `-classpath`) 매개변수를 통해 전달된 클래스.

* **공통**: 응용 프로그램 서버의 웹 응용 프로그램에 전역적으로 액세스할 수 있는 클래스입니다.

* **웹 애플리케이션(예: DXP/Portal)**: 애플리케이션의 `WEB-INF/classes` 폴더 및 `WEB-INF/lib/*.jar`의 클래스.

    DXP/Portal 웹 애플리케이션이 상호 작용하는 유일한 Liferay 클래스는 Liferay의 *Shielded Container* JAR 파일에 있습니다.

    * `com.liferay.shielded.container.api.jar`
    * `com.liferay.shielded.container.impl.jar`

* **차폐 컨테이너**: 클래스 `WEB-INF/shielded-container-lib/*.jar`.

* **모듈 프레임워크**: Liferay의 OSGi 모듈 프레임워크 클래스로더는 모듈 프레임워크 번들에 대해 제어된 격리를 제공합니다.

* **번들**: 번들의 패키지 또는 다른 번들에서 내보낸 패키지의 클래스입니다.

* **JSP**: 다음 번들 및 클래스 로더를 집계하는 클래스 로더:

    * JSP의 클래스로더를 포함하는 번들
    * JSP 서블릿 번들의 클래스로더
    * Javax Expression Language(EL) 구현 번들의 클래스로더
    * Javax JSTL 구현 번들의 클래스로더

* **서비스 빌더**: 서비스 빌더 클래스

사용되는 클래스 로더는 컨텍스트에 따라 다릅니다. 클래스로딩 규칙은 애플리케이션 서버마다 다릅니다. 웹 애플리케이션과 OSGi 번들의 클래스 로딩도 다릅니다. 그러나 모든 컨텍스트에서 부트스트랩 클래스 로더는 `java.*` 패키지에서 클래스를 로드합니다.

다음은 웹 애플리케이션 관점에서 클래스로딩입니다.

## 웹 애플리케이션 클래스로딩 관점

애플리케이션 서버는 Liferay DXP와 같은 웹 애플리케이션이 클래스와 리소스를 검색하는 위치와 순서를 지정합니다. [Apache Tomcat](https://tomcat.apache.org/tomcat-9.0-doc/class-loader-howto.html) 과 같은 애플리케이션 서버는 다음과 같은 기본 검색 순서를 적용합니다.

1. 부트스트랩 클래스
1. 웹앱의 `WEB-INF/classes`
1. 웹 앱의 `WEB-INF/lib/*.jar`
1. 시스템 클래스 로더
1. 공통 클래스 로더

먼저 웹 애플리케이션이 Bootstrap을 검색합니다. 클래스/리소스가 없으면 웹 애플리케이션은 자체 클래스와 JAR을 검색합니다. 클래스/자원이 여전히 발견되지 않으면 시스템 클래스 로더를 확인한 다음 공통 클래스 로더를 확인합니다. 자체 클래스 및 JAR을 확인하는 웹 응용 프로그램을 제외하고는 부모 우선 순서로 계층 구조를 검색합니다.

[Oracle WebLogic](https://docs.oracle.com/cd/E19501-01/819-3659/beadf/index.html) 및 IBM WebSphere와 같은 애플리케이션 서버에는 추가 클래스로더가 있습니다. 또한 클래스 로더 계층 구조와 검색 순서가 다를 수 있습니다. 클래스 로딩 세부사항은 애플리케이션 서버의 문서를 참조하십시오.

## 다른 클래스로딩 관점

[번들 클래스로딩 흐름](./bundle-classloading-flow.md) 은 OSGi 번들 관점에서 클래스로딩을 설명합니다.

JSP 및 Service Builder 클래스의 클래스로딩은 웹 애플리케이션 및 OSGi 번들 클래스의 클래스로딩과 유사합니다.

이제 클래스 로딩 계층 구조를 알고 웹 애플리케이션의 컨텍스트에서 이해하고 다른 클래스 로딩 관점에 대한 정보에 대한 참조를 갖게 되었습니다.

## 추가 정보

* [번들 클래스 로딩 흐름](./bundle-classloading-flow.md)