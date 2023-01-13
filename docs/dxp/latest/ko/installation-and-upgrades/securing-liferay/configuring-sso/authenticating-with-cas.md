# CAS(중앙 인증 서비스)로 인증

```{important}
CAS는 Liferay DXP 7.2에서 더 이상 사용되지 않으며 Liferay DXP 7.4에서 제거되었습니다. 대신 [SAML](./authenticating-with-saml.md)을 사용하십시오. 
```

CAS는 널리 사용되는 오픈 소스 싱글 사인온 솔루션이며 Liferay DXP에서 지원하는 최초의 SSO 제품입니다. Liferay DXP의 CAS 모듈에는 CAS 클라이언트가 포함되어 있으므로 별도로 설치할 필요가 없습니다.

```{note}
Liferay DXP는 CAS 3.3.x를 지원합니다. 이후 버전의 CAS를 사용하는 경우 OpenID Connect 또는 SAML과 같은 표준에 대한 CAS 지원을 사용하여 Liferay DXP와 인터페이스하는 것이 가장 좋습니다.
```

CAS로 Liferay를 실행하는 세 단계가 있습니다.

1. SSL 인증서 생성
1. CAS 설치
1. CAS를 사용하도록 Liferay 구성

## SSL 인증서 생성

CAS 서버 애플리케이션을 사용하려면 서버에 제대로 구성된 SSL(Secure Socket Layer) 인증서가 있어야 합니다. 직접 생성하려면 JDK와 함께 제공되는 `keytool` 유틸리티를 사용하십시오. 먼저 키를 생성한 다음 키를 파일로 내보냅니다. 마지막으로 키를 로컬 Java 키 저장소로 가져옵니다. 공용 인터넷 기반 프로덕션 환경의 경우 공인 인증 기관 또는 Let's Encrypt에서 서명된 키를 구매하거나 공인 인증 기관에서 키에 서명해야 합니다. 인트라넷의 경우 IT 부서에서 인증서에 대한 경고 메시지를 받지 않도록 인증서를 수락하도록 사용자의 브라우저를 미리 구성하도록 해야 합니다.

키를 생성하려면 다음 명령을 사용하십시오.

```bash
keytool -genkey -alias tomcat -keypass changeit -keyalg RSA
```

예의 비밀번호(`changeit`) 대신 기억할 수 있는 비밀번호를 사용하십시오. Tomcat을 사용하지 않는 경우 다른 별칭도 사용할 수 있습니다. 이름과 성에는 `localhost` 또는 서버의 호스트 이름을 입력합니다. IP 주소일 수 없습니다.

키를 파일로 내보내려면 다음 명령을 사용하십시오.

```bash
keytool -export -alias tomcat -keypass changeit -file server.cert
```

마지막으로 키를 Java 키 저장소로 가져오려면 다음 명령을 사용하십시오.

```bash
keytool -import -alias tomcat -file server.cert -keypass changeit -keystore $JAVA_HOME/jre/lib/security/cacerts
```

Windows 시스템을 사용하는 경우 위의 `$JAVA_HOME` 를 `%JAVA_HOME%`로 바꿉니다. 물론 이 모든 작업은 CAS가 실행 중인 시스템에서 수행되어야 합니다.

## CAS를 사용하도록 Liferay DXP 구성

CAS 서버가 가동되고 실행되면 이를 사용하도록 Liferay DXP를 구성하십시오. CAS 구성은 시스템 범위 또는 포털 인스턴스 범위에서 적용할 수 있습니다. 시스템 또는 인스턴스 범위에서 CAS SSO 모듈을 구성하려면 제어판으로 이동하여 *구성* &rarr; *시스템 설정* (또는 *인스턴스 설정*) &rarr; *보안* &rarr; *SSO*를 클릭합니다. 시스템 설정에서 구성된 값은 모든 포털 인스턴스에 대한 기본값을 제공합니다. CAS 인증을 활성화한 다음 CAS 서버를 가리키도록 URL 속성을 수정합니다.

**활성화됨:** CAS 싱글 사인온을 활성화하려면 이 상자를 선택합니다.

**LDAP에서 가져오기:** 사용자는 CAS에서 인증을 받았지만 Liferay DXP에는 아직 존재하지 않을 수 있습니다. Liferay DXP에 사용자가 없는 경우 LDAP에서 자동으로 사용자를 가져오려면 이것을 선택하십시오. 이것이 작동하려면 LDAP를 활성화해야 합니다.

나머지 설정은 기본값이 포함된 다양한 URL입니다. CAS 서버를 가리키도록 기본값에서 *localhost* 을 변경합니다. 완료되면 *저장*을 클릭합니다. 그런 다음 사용자가 *로그인* 링크를 클릭하면 CAS 서버로 이동하여 Liferay DXP에 로그인합니다.

경우에 따라 디스크의 파일을 통해 시스템 구성을 지정하는 것이 더 편리할 수 있습니다. 이렇게 하려면 다음 파일을 만듭니다.

```bash
[Liferay Home]/osgi/configs/com.liferay.portal.security.sso.cas.configuration.CASConfiguration.config
```

이 파일의 형식은 모든 속성 파일과 동일합니다. 설정할 수 있는 각 속성에 사용할 키는 아래와 같습니다. 리터럴 값으로 Java 기본 유형을 초기화할 때와 동일한 형식으로 값을 입력하십시오.

| 속성 레이블                 | 속성 키                        | 묘사                                                                                                                                                                                                    | 유형        |
|:---------------------- |:--------------------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:--------- |
| **가능하게 하는**            | `enabled`                   | CAS SSO 인증을 활성화하려면 이 확인란을 선택합니다.                                                                                                                                                                      | `boolean` |
| **LDAP에서 가져오기**        | `importFromLDAP`            | Liferay DXP에 존재하지 않는 CAS에서 인증된 사용자는 LDAP에서 가져옵니다. LDAP는 별도로 활성화해야 합니다.                                                                                                                                | `boolean` |
| **로그인URL**             | `loginURL`                  | CAS 서버 로그인 URL을 설정합니다.                                                                                                                                                                                | `String`  |
| **세션 만료 시 로그아웃**       | `logoutOnSessionExpiration` | 선택하면 세션이 만료된 브라우저가 CAS 로그아웃 URL로 리디렉션됩니다.                                                                                                                                                             | `boolean` |
| **로그아웃URL**            | `logoutURL`                 | CAS 서버 로그아웃 URL입니다. Liferay DXP의 로그아웃 기능이 CAS 로그아웃을 트리거하도록 하려면 이것을 설정하십시오.                                                                                                                            | `String`  |
| **서버 이름**              | `serverName`                | Liferay DXP 인스턴스의 이름(예: `liferay.com`). 제공된 이름에 프로토콜(예:`https://`)이 포함된 경우 경로 `/c/portal/login` 과 함께 사용되어 CAS 서버가 티켓을 제공할 URL을 구성합니다. 체계가 제공되지 않으면 일반적으로 Liferay DXP 로그인 페이지에 액세스하는 데 사용되는 체계가 사용됩니다. | `String`  |
| **서버 URL**             | `serviceURL`                | 제공된 경우 CAS 서버가 티켓을 제공하는 URL로 사용됩니다. 이는 위와 같이 서버 이름을 기반으로 구성된 모든 URL을 재정의합니다.                                                                                                                          | `String`  |
| **해당 사용자 리디렉션 URL 없음** | `noSuchUserRedirectURL`     | 사용자가 CAS로 인증할 수 있지만 Liferay DXP에서 찾을 수 없는 경우 사용자를 리디렉션할 URL을 설정합니다. LDAP에서 가져오기가 활성화된 경우 사용자를 찾을 수 없거나 LDAP에서 가져올 수 없으면 사용자가 리디렉션됩니다.                                                                 | `String`  |

특정 포털 인스턴스에 대한 시스템 기본값을 재정의하려면 제어판으로 이동하여 *구성* &rarr; *인스턴스 설정*를 클릭하고 오른쪽에서 *인증* 을 클릭한 다음 상단에서 *CAS* 을 클릭합니다.
