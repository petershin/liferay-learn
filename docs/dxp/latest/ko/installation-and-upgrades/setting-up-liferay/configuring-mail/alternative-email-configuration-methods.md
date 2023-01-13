# 대체 이메일 구성 방법

메일 서버에 연결하도록 Liferay DXP를 구성하는 방법에는 여러 가지가 있습니다. 시작하는 가장 간단한 방법은 [서버 관리 UI](../configuring-mail.md)를 통해 메일을 구성하는 것입니다. 이 문서에서는 메일을 구성하는 다른 방법에 대해 설명합니다. 포털 속성을 사용하거나 애플리케이션 서버의 메일 세션을 사용합니다.

## 포털 속성을 사용하여 내장 메일 세션 구성

메일 세션을 오프라인으로 구성하거나 DXP를 배포하기 전에 구성하려면:

1. [`Portal-ext.properties` 파일](../../reference/portal-properties.md) 을 만듭니다(파일이 아직 없는 경우).

1. 이러한 기본 속성 설정을 `portal-ext.properties` 파일에 복사합니다.

    ```properties
    mail.session.mail=false
    mail.session.mail.pop3.host=pop.gmail.com
    mail.session.mail.pop3.password=*******
    mail.session.mail.pop3.port=110
    mail.session.mail.pop3.user=joe.bloggs
    mail.session.mail.smtp.auth=true
    mail.session.mail.smtp.host=smtp.gmail.com
    mail.session.mail.smtp.password=*******
    mail.session.mail.smtp.port=465
    mail.session.mail.smtp.user=joe.bloggs
    mail.session.mail.store.protocol=pop3
    mail.session.mail.transport.protocol=smtp
    ```

1. 기본 메일 세션 값을 자신의 값으로 바꿉니다.

1. `portal-ext.properties` 파일을 [Liferay Home](../../reference/liferay-home.md)에 넣습니다.

DXP는 다음에 시작할 때 메일 세션에 연결합니다.

## 애플리케이션 서버의 메일 세션에 연결

사용자는 애플리케이션 서버를 사용하여 DXP용 메일 세션을 구성하도록 선택할 수 있습니다.

1. 애플리케이션 서버에서 메일 세션을 생성합니다. 응용 프로그램 서버 설명서를 참조하십시오.

1. _제어판_을 사용하는 경우 _제어판 &rarr; 구성 &rarr; 서버 관리 &rarr; 메일_으로 이동합니다.

1. _JavaMail 속성_ 필드에 값을 입력합니다.

    ![자바메일](./alternative-email-configuration-methods/images/01.png)

1. _저장_을 클릭합니다. 이렇게 하면 DXP가 애플리케이션 서버의 메일 세션을 가리킵니다.

메일 서버가 DXP에 연결되었고 알림을 보낼 준비가 되었습니다.

```{note}
다음 속성을 [portal-ext.properties](../../reference/portal-properties.md)으로 설정하고 서버를 다시 시작하면 제어판에서 `mail.session.jndi.name=mail/ 값을 설정하는 것과 동일한 효과가 있습니다. 메일세션`
```

## 추가 정보

* [Tomcat 관리 메일 세션 구성](../../installing-liferay/installing-liferay-on-an-application-server/installing-on-tomcat.md#mail-configuration)
* [WebSphere 관리 메일 세션 구성](../../installing-liferay/installing-liferay-on-an-application-server/installing-on-websphere.md#mail-configuration)
* [Apache Tomcat 9 JavaMail 세션](https://tomcat.apache.org/tomcat-9.0-doc/jndi-resources-howto.html#JavaMail_Sessions)