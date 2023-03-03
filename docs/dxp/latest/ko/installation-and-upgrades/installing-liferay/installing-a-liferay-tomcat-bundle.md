# Liferay-Tomcat 번들 설치

Tomcat 번들에는 Liferay DXP/Portal이 사전 배포된 Apache Tomcat 애플리케이션 서버가 포함되어 있습니다. 온프레미스에 Liferay를 설치하는 가장 쉽고 빠른 방법입니다.

```{note}
이미 다음 응용 프로그램 서버 중 하나를 사용하고 있는 경우 사용 중인 서버의 이름을 클릭하여 Liferay 배포 지침을 확인하십시오. [Tomcat](./installing-liferay-on-an-application-server/installing- on-tomcat.md), [WildFly](./installing-liferay-on-an-application-server/installing-on-wildfly.md), [JBoss EAP](./installing-liferay-on-an-application-server /installing-on-jboss-eap.md), [WebLogic](./installing-liferay-on-an-application-server/installing-on-weblogic.md) 또는 [WebSphere](./installing-liferay-on-an- application-server/installing-on-websphere.md).
```

```{note}
둘러보기 또는 데모 목적으로 인스턴스를 빠르게 시작하려면 [Docker 이미지로 시작](../../getting-started/starting-with-a-docker-image.md)을 참조하세요.
```

## 전제 조건

Java JDK 8 또는 11이 필요합니다. JDK를 선택하려면 [호환성 매트릭스](https://help.liferay.com/hc/ko/articles/360049238151) 을 참조하십시오. 권장 설정은 [JVM 구성](../reference/jvm-configuration.md) 을 참조하십시오.

## 다운로드

1. [도움말 센터](https://help.liferay.com/hc) (구독) 또는 [커뮤니티 다운로드](https://www.liferay.com/downloads-community) 로 이동합니다.

1. 원하는 Liferay DXP/Portal 버전으로 이동합니다.

1. Tomcat 번들 다운로드:

| 파일                   | 묘사                          |
|:-------------------- |:--------------------------- |
| Tomcat 번들(`.tar.gz`) | 모든 OS에 설치되는 GZipped 번들 아카이브 |
| Tomcat 번들(`.7z`)     | 모든 OS에 설치되는 7-Ziped 번들 아카이브 |

## 설치하십시요

번들을 호스트의 사이트로 추출하십시오. 이 사이트를 [Liferay Home](../reference/liferay-home.md) 이라고 합니다.

축하합니다! Liferay를 설치했습니다. 이를 위해 데이터베이스를 구성할 때입니다.

## 다음 단계

* [데이터베이스 구성](./configuring-a-database.md)