# Kerberos로 인증

Kerberos를 사용하여 Liferay DXP로 Microsoft Windows&trade; 계정을 인증할 수 있습니다. 이것은 Liferay DXP의 LDAP 지원과 Kerberos 프로토콜을 지원하는 웹 서버의 조합을 사용하여 수행됩니다.

보안 취약성이 지속되기 때문에 이 구성은 [NTLM](https://portal.liferay.dev/docs/7-1/deploy/-/knowledge_base/d/ntlm-single-sign-on-authentication) 보다 선호됩니다.

## 전제 조건

Windows&trade; 서버에서 Kerberos 및 Active Directory를 설정하는 방법을 설명하는 것은 이 문서의 범위를 벗어나지만 Liferay 인증을 설정하기 위한 최소 전제 조건을 설명할 수 있습니다.

1. Windows&trade; AD 서버와 Liferay DXP가 네트워크에서 서로를 확인할 수 있도록 Active Directory 및 DNS가 설정된 서버. 즉, *이름으로* 서로 ping할 수 있어야 합니다.

1. AD Liferay DXP의 관리 사용자는 AD에 바인딩하는 데 사용할 수 있습니다.

1. Liferay DXP 서버가 AD에 바인딩하는 데 필요한 암호화 정보가 포함된 `ktpass` 명령을 통해 내보낸 Kerberos keytab 파일.

1. Apache, NGNIX 또는 IIS와 같은 Kerberos를 지원하는 Liferay DXP 앞의 웹 서버. 웹 서버는 Liferay DXP 구성에서 토큰으로 사용할 헤더 삽입도 지원해야 합니다(아래 참조).

1. 다른 서버의 이름으로도 확인할 수 있는 Liferay DXP 설치. Active Directory 서버와 동일한 서버에서 실행하면 안 됩니다.

이러한 사전 요구 사항이 모두 준비되면 Kerberos 인증을 구성할 준비가 된 것입니다.

## Kerberos 인증 작동 방식

전제 조건에서 SSO가 Kerberos와 함께 작동하는 방식에 몇 가지 움직이는 부분이 있음을 추측할 수 있습니다.

![Kerberos 인증에는 Liferay DXP 서버 앞에 웹 서버가 필요합니다.](./authenticating-with-kerberos/images/01.png)

먼저 적절하게 구성된 웹 브라우저는 암호화된 Windows 사용자 데이터를 사용하여 협상 요청을 보냅니다. 이를 구성하려면 브라우저가 해당 사이트를 신뢰할 수 있는 사이트로 인식해야 합니다(아래 설명 참조). 웹 서버의 Kerberos 모듈은 keytab 파일을 사용하여 Kerberos 프로토콜을 통해 AD에 바인딩하고 사용자 정보를 확인합니다. 이것이 작동하면 AD 서버는 유효한 응답으로 연결을 확인합니다.

선택한 웹 서버는 Kerberos 프로토콜과 Liferay DXP가 나중에 읽을 수 있는 요청에 사용자 지정 헤더 삽입을 모두 지원해야 합니다. 웹 서버가 요청을 Liferay DXP로 전달할 때 헤더를 읽어 사용자 데이터를 얻고 사용자를 인증합니다.

다음으로 이 모든 작업을 수행하는 방법을 배웁니다.

## Kerberos 인증 구성

구성할 네 가지 구성 요소가 있습니다.

1. Active Directory의 사용자 키탭
1. 애플리케이션 서버 앞의 웹 서버
1. Liferay DXP
1. Windows&trade; 클라이언트.

### 1단계: 사용자 Keytab 만들기

1. Liferay DXP가 Active Directory에 바인딩할 수 있도록 사용자를 생성합니다.

1. `ktpass`을 사용하여 Kerberos keytab 파일을 생성합니다.

    ```bash
    ktpass -princ HTTP/[web server host name]@[domain] -mapuser [user name]@[domain] -crypto ALL -ptype KRB5_NT_PRINCIPAL -pass [password] -out c:\kerberos.keytab
    ```

    예를 들어:

    ```bash
    ktpass -princ HTTP/mywebserver.intdomain.local@INTDOMAIN.LOCAL -mapuser Marta@INTDOMAIN.LOCAL -crypto ALL -ptype KRB5_NT_PRINCIPAL -pass password-for-Marta -out c:\kerberos.keytab
    ```

1. AD 도메인 컨트롤러와 웹 서버가 DNS 구성 또는 `호스트` 파일을 통해 네트워크에서 서로를 볼 수 있는지 확인하십시오.

### 2단계: 웹 서버 구성

1. Kerberos 인증을 구성합니다. Linux에서 여기에는 `krb5` 을 설치하고 Active Directory에 대해 이미 구성된 영역과 일치하도록 구성하는 작업이 포함됩니다. 위의 2단계에서 구성된 사용자의 예제 도메인은 다음과 같습니다.

    ```ini
    [libdefaults]
        default_realm = INTDOMAIN.LOCAL

    [domain_realm]
        mywebserver.intdomain.local = INTDOMAIN.LOCAL intdomain.local = INTDOMAIN.LOCAL .intdomain.local = INTDOMAIN.LOCAL

    [realms]
    INTDOMAIN.LOCAL = { admin_server = winserver.intdomain.local kdc = winserver.intdomain.local
    }
    ```

1. AD 서버에서 생성한 keytab 파일을 웹 서버에 복사합니다.

1. 웹 서버를 구성하여 올바른 서버 이름, Kerberos 서비스 이름, Kerberos 인증 영역 및 keytab 파일 경로를 설정했는지 확인하십시오. 예를 들어 Apache HTTP 서버를 사용하는 경우 구성은 다음과 같습니다.

    ```apache
    LoadModule headers_module /usr/lib/apache2/modules/mod_headers.so
    LoadModule rewrite_module /usr/lib/apache2/modules/mod_rewrite.so
    LoadModule proxy_module /usr/lib/apache2/modules/mod_proxy.so
    LoadModule proxy_http_module /usr/lib/apache2/modules/mod_proxy_http.so
    LoadModule proxy_ajp_module /usr/lib/apache2/modules/mod_proxy_ajp.so
    LoadModule auth_kerb_module /usr/lib/apache2/modules/mod_auth_kerb.so

    <VirtualHost *:10080>
        <Proxy *>
            Order deny,allow
            Allow from all
        </Proxy>
        ProxyRequests     Off
        ProxyPreserveHost On
        ProxyPass / ajp://localhost:8009/
        ProxyPassReverse / ajp://localhost:8009/
        ServerName mywebserver.intdomain.local
        <Location />
                    Order allow,deny
                    Allow from all
                    AuthType Kerberos
                    KrbServiceName HTTP/mywebserver.intdomain.local@INTDOMAIN.LOCAL
                    AuthName "Domain login"
                    KrbAuthRealms INTDOMAIN.LOCAL
                    Krb5KeyTab /etc/apache2/kerberos.keytab
                    require valid-user
                    KrbMethodNegotiate  On
                    KrbMethodK5Passwd   Off
                    #KrbLocalUserMapping On

                    # Below directives put logon name of authenticated user into http header X-User-Global-ID
                    RequestHeader unset X-User-Global-ID
                    RewriteEngine On
                    RewriteCond   %{LA-U:REMOTE_USER} (.+)
                    RewriteRule   /.* - [E=RU:%1,L,NS]
                    RequestHeader set X-User-Global-ID %{RU}e

                    # Remove domain suffix to get the simple logon name
                    # RequestHeader edit X-User-Global-ID "@INTDOMAIN.LOCAL$" ""

        </Location>
    </VirtualHost>
    Listen 10080
    ```

마지막 줄은 사용자 기본 설정에 따라 주석 처리됩니다. Liferay DXP에 저장할 때 사용자 이름에서 도메인을 제거하려면 주석을 제거하십시오. 그렇지 않으면 사용자 이름으로 도메인을 저장하도록 주석 처리된 상태로 두십시오.

### 3단계: LDAP를 통해 Liferay DXP를 Active Directory에 연결

1. 마지막으로 LDAP 프로토콜을 통해 Active Directory에 액세스하도록 Liferay DXP를 구성합니다. 구성 &rarr; 인스턴스 설정 &rarr; 인증 &rarr; 일반에서 선택하여 화면 이름으로 인증을 변경하십시오.

1. 구성 &rarr; 인스턴스 설정 &rarr; 인증 &rarr; LDAP로 이동하고 LDAP 서버를 추가하여 LDAP를 통해 Liferay DXP를 AD에 연결합니다. 설치에 적합한 정보를 제공하십시오.

   | 설정            | 묘사                                                                                 |
   |:------------- |:---------------------------------------------------------------------------------- |
   | **공급자URL**    | 적절한 포트의 AD 서버.                                                                     |
   | **기초DN**      | 귀하의 도메인 구성. 위의 예는 `DC=INTDOMAIN.DC=LOCAL`수 있습니다.                                   |
   | **교장/자격 증명**  | keytab 파일로 내보낸 사용자의 자격 증명을 제공합니다.                                                  |
   | **입증 수색 여과기** | 사용자 개체를 반환하려면 적절한 검색 필터를 제공하십시오. 예: `(&(objectCategory=사람)(sAMAccountName=*))` |
   | **UUID**      | `sAMAccountName`과 같이 사용자를 고유하게 식별하는 것을 제공하십시오.                                     |
   | **사용자 이름**    | `sAMAccountName`과 같이 Liferay DXP의 화면 이름 필드에 매핑되어야 하는 필드를 제공합니다.                    |
   | **암호**        | `userPassword`과 같이 사용자 비밀번호가 포함된 필드를 제공하십시오.                                       |

1. 연결을 테스트하고 저장한 다음 구성을 활성화합니다.

1. 마지막으로 구성 &rarr; 시스템 설정 &rarr; 보안 &rarr; SSO &rarr; 토큰 기반 SSO에서 Single Sign-On용 토큰을 구성합니다. 사용자 토큰 이름이 웹 서버에서 구성한 토큰과 정확히 *,* 과 일치하는지 확인하십시오. *활성화됨* 및 *LDAP에서 가져오기* 상자를 클릭하고 *저장*을 클릭합니다.

    ![인스턴스 설정 메뉴에서 SSO를 활성화합니다.](authenticating-with-kerberos/images/02.png)

훌륭한! 서버를 구성했습니다. 남은 것은 클라이언트를 구성하는 것입니다.

### 4단계: 클라이언트 구성

컴퓨터를 도메인에 로그인하고 Liferay DXP 서버를 신뢰할 수 있는 인터넷 사이트로 구성하는 두 가지 작업을 수행해야 합니다.

1. 컴퓨터를 도메인에 가입시키십시오. 위의 예에 따라 컴퓨터를 `INTDOMAIN.LOCAL` 도메인의 구성원으로 만듭니다.

1. 해당 도메인의 사용자로 로그인합니다.

1. Internet Explorer, Edge 및 Chrome은 신뢰할 수 있는 사이트에 대해 Windows&trade; 설정을 사용합니다. 이러한 브라우저를 사용하는 경우 인터넷 옵션 &rarr; 보안 &rarr; 로컬 인트라넷 사이트로 이동하여 Liferay DXP 서버의 URL을 추가하십시오. 예를 들어 `http://mywebserver.intdomain.local:10080`을 추가합니다.

1. Firefox는 주소 표시줄에 `about:config` 을 입력하여 구성할 수 있습니다. 아래 두 가지 기본 설정을 검색하고 Liferay DXP 서버의 URL을 둘 다에 대한 값으로 추가합니다.

   * `network.negotiate-auth.delegation-uris`
   * `network.negotiate-auth.trusted-uris`

이러한 사항을 구성한 후 웹 서버의 URL을 통해 Liferay DXP에 액세스하여 구성을 테스트하십시오. 클라이언트 시스템에 이미 로그인되어 있으므로 사용자/암호 프롬프트 없이 자동으로 Liferay DXP에 로그인해야 합니다.

Liferay DXP로 Kerberos를 구성한 것을 축하합니다!
