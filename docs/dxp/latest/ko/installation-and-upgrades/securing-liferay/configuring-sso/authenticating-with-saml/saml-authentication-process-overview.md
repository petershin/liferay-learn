# SAML 인증 프로세스 개요

IdP와 SP 모두 Single Sign On 프로세스를 시작할 수 있으며 각각에 따라 SSO 흐름이 다릅니다. 시작 방법에 관계없이 SSO는 SP와 IdP 사이의 HTTPS에 대해 구성되므로 모든 전송 수준 통신이 암호화됩니다. SAML 요청은 [SAML 2.0 사양](http://saml.xml.org/saml-specifications) 에 정의된 SAML 웹 브라우저 SSO 프로필을 사용하여 Liferay DXP에 구성된 인증서를 사용하여 서명됩니다. 모든 경우에 응답은 HTTP-POST 또는 HTTP-리디렉션을 사용하여 전송됩니다. HTTP-POST는 브라우저가 처리하기에 URL이 너무 길다는 위험을 줄이기 때문에 선호됩니다.

IdP가 시작한 SSO를 먼저 고려하십시오.

## ID 공급자 시작 SSO

때때로 사용자는 브라우저에서 IdP로 직접 요청을 전송하여 SSO 주기에 들어갑니다.

![ID 공급자 시작 SSO는 직접 인증합니다.](./saml-authentication-process-overview/images/01.png)

### IdP에 대한 SSO 요청

Liferay가 IdP인 경우 IdP는 SSO URL을 시작했습니다.

* 경로를 `/c/portal/saml/sso`로 지정해야 합니다.
* 이전에 구성된 SPC(Service Provider Connection)에 대한 식별자인 `entityId` 매개변수를 포함해야 합니다.
* 인증 성공 시 사용자가 리디렉션되는 URL 인코딩 값을 포함하는 `RelayState` 매개변수를 포함할 수 있습니다. 이 URL은 원하는 SPC의 사이트를 가리켜야 합니다( [SAML 2.0 표준 섹션 3.4.3](https://docs.oasis-open.org/security/saml/v2.0/saml-bindings-2.0-os.pdf) 에 따라 이 값 *는 길이가 80바이트를 초과해서는 안 됩니다*. SSO가 실행된 후 랜딩 페이지를 지정하는 것이 유용합니다.

비Liferay IdP(Siteminder, ADFS 등)의 경우 IdP 시작 SSO URL 구성에 대한 공급업체의 설명서를 참조하십시오.

IdP는 사용자가 인증되지 않았다고 판단하면 적절한 로그인 화면을 사용자에게 표시합니다.

### IdP의 SSO 응답

인증에 성공하면 IdP는 SAML 응답을 구성합니다. 여기에는 지정된 서비스 제공자 연결(SPC; Liferay의 SAML 어댑터에서 SPC 설정에 대한 [인스턴스 레벨](./configuring-saml-at-the-instance-level.md) 에서 SAML 구성 참조)에 구성된 속성 설명이 포함됩니다.

IdP는 어설션 소비자 서비스 URL에 응답을 보냅니다. 요청에는 `SAMLResponse` 및 `RelayState`의 두 매개변수가 포함됩니다.

```{note}
SAML 응답(예: HTTP-POST) 및 어설션 소비자 서비스 URL을 보내는 방법은 일반적으로 SP에서 제공하는 SAML 메타데이터 XML의 일부로 가져옵니다. Liferay DXP에서는 SAML 어댑터의 서비스 공급자 연결 탭에서 SP의 메타데이터를 가져옵니다.
```

### SP에서 SSO 응답 처리

SP는 SAML 응답을 확인하고 처리합니다. Liferay의 SAML 솔루션에는 서명된 `SAMLResponse` 메시지가 필요합니다. 이 서명 프로세스는 IdP에 대한 적절한 식별을 보장하고 잠재적인 SAML 응답 스푸핑을 방지합니다.

* 한 Liferay 인스턴스가 IdP이고 다른 인스턴스가 SP인 경우 SP로 가져온 SAML 메타데이터 XML 파일에 IdP의 인증서가 포함되어 있는지 확인하십시오.
* Liferay가 IdP이고 다른 애플리케이션이 SP인 경우 IdP에서 인증서를 내보내고 SP의 인증서 저장소로 가져옵니다.

`RelayState` 이 SAML 응답에 포함된 경우 사용자는 여기로 리디렉션됩니다. 그렇지 않으면 SP의 홈 페이지가 제공됩니다.

## 서비스 공급자 시작 SSO

대부분의 경우 인증 요청은 서비스 제공자로부터 옵니다.

![Service Provider Initiated SSO는 일반적인 인증 요청 소스입니다.](./saml-authentication-process-overview/images/02.png)

### SP에 대한 SSO 요청

사용자의 브라우저가 SP에서 보호된 리소스 또는 로그인 URL을 요청하면 SP 시작 SSO 프로세스를 트리거합니다. Liferay DXP가 SAML SP인 경우 SSO는 `/c/portal/login` URL 또는 인증이 필요한 보호된 리소스(예: 게스트 역할에서 볼 수 없는 문서)를 요청하여 시작됩니다. 사용자가 보호된 리소스를 요청하면 해당 URL이 `RelayState` 매개변수에 기록됩니다. 사용자가 `/c/portal/login`을 요청한 경우 `리디렉션` 매개변수를 제공하여 `RelayState` 을 설정할 수 있습니다. 그렇지 않고 [포털 속성](http://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html) `auth.forward.by.last.path` 이 `true`로 설정되면 마지막으로 액세스한 경로가 `RelayState`로 설정됩니다. 비 Liferay SP의 경우 SSO 시작에 대한 공급업체 설명서를 참조하십시오.

### IdP에 대한 AuthnRequest

SP는 IdP의 Single Sign On 서비스 URL을 조회하고 `AuthnRequest`을 보냅니다. Liferay가 SP인 경우 구성된 SAML ID 공급자 연결을 조회하고 SAML 메타데이터 XML 문서에 정의된 대로 SAML `AuthnRequest` 을 IdP의 싱글 사인온 서비스 URL로 보냅니다. Liferay는 HTTP-POST 또는 HTTP-리디렉션 바인딩을 사용하여 `AuthnRequest` 송수신을 지원합니다. HTTP-POST가 선호됩니다.

사용자에게 활성 세션이 없거나 SP에서 `ForceAuthn` 을 요청한 경우 사용자는 자격 증명을 제공하여 인증해야 합니다. Liferay가 IdP인 경우 로그인 포틀릿에서 인증이 발생합니다. Liferay는 사용자에게 인증을 요청하기 전에 `AuthnRequest` 을 디코딩하고 확인합니다.

### IdP의 SSO 응답

인증 후 SAML 응답이 구성되어 SP의 어설션 소비자 서비스 URL로 전송되고 확인됩니다. IdP는 SP 메타데이터를 기반으로 자동으로 선택합니다.

Liferay가 IdP로 구성되면 서비스 제공자 연결에 구성된 모든 속성이 응답에 속성 설명으로 포함됩니다. Assertion Consumer Service URL은 SP의 SAML 메타데이터 XML에서 조회됩니다.

Liferay가 SP로 구성되면 응답 및 어설션 서명이 확인됩니다. Liferay는 보낸 사람이 인증을 받아야 합니다. 이는 발급 IdP의 전체 메시지 서명을 통해 수행됩니다. 서명이 없는 응답은 인증되지 않은 것으로 간주되어 응답이 거부됩니다. 비 Liferay SP 또는 IdP 공급업체의 경우 해당 설명서를 참조하십시오.

사용자는 요청된 리소스 또는 `RelayState` 매개 변수에 포함된 URL(예: SSO를 시작하기 전에 사용자가 액세스한 마지막 페이지)로 리디렉션됩니다.

## 단일 로그오프

Single Log Off 요청은 사용자 브라우저에서 IdP 또는 SP로 전송되며 SLO 흐름은 경우마다 다릅니다. 먼저 IdP가 시작한 SLO를 고려하십시오.

## ID 공급자가 시작한 SLO

![ID 공급자 시작 SLO는 사용자의 브라우저에서 IdP로 직접 전송됩니다.](./saml-authentication-process-overview/images/03.png)

### IdP에 대한 SLO 요청

IdP가 시작한 SLO 요청은 사용자의 브라우저에서 IdP로 직접 전송됩니다. Liferay가 IdP인 경우 IdP 시작 SSO URL은 URL 경로를 다음과 같이 지정해야 합니다.

`/c/portal/logout`

사용자가 구성된 SP에 로그인하면 SAML 플러그인이 로그아웃 프로세스를 대신하여 로그인된 모든 서비스를 표시합니다. 단일 로그아웃 화면에는 각 SP의 인증 상태와 로그아웃할 수 없는 SP가 있는지 여부(예: SP가 다운되었거나 SLO를 지원하지 않는 경우)가 표시됩니다. 비 Liferay IdP(Siteinder, ADFS 등)의 경우 IdP 시작 SLO URL 구성에 대한 공급업체의 설명서를 참조하십시오.

IdP는 SAML `LogoutRequest` 을 SP로 보냅니다.

* Liferay가 IdP로 구성된 경우 `LogoutRequest` 은 HTTP-POST, HTTP-리디렉션 또는 SOAP 바인딩을 사용하여 전송됩니다. HTTP-Post 바인딩이 선호되지만 바인딩이 없는 경우 지원되는 바인딩이 있는 사용 가능한 첫 번째 SLO 엔드포인트가 선택됩니다.
* Liferay가 SP로 구성된 경우 `LogoutRequest` 에 대해 지원되는 바인딩은 HTTP-Post, HTTP-Redirect 또는 SOAP입니다.
* 다른 IdP 또는 SP의 경우 공급업체의 설명서를 참조하십시오.

### SP의 SLO 응답

SP는 IdP에 `LogoutResponse` 을 전달합니다.

IdP는 SAML `LogoutRequest` 을 두 번째 SP로 보냅니다.

그런 다음 두 번째 SP는 `LogoutResponse` 을 IdP에 전달합니다. 사용자가 로그인한 모든 SP에 대해 프로세스가 반복됩니다. Liferay가 IdP인 경우 Liferay는 마지막 SP가 `LogoutResponse` 을 전달하거나 시간이 초과된 후 사용자를 로그아웃합니다.

## 서비스 제공업체 시작 SLO

![Service Provider Initiated SLO는 사용자의 브라우저가 SP에 로그아웃 요청을 보낼 때 발생합니다.](./saml-authentication-process-overview/images/04.png)

### SP에 대한 SLO 요청

SP 시작 SLO에서 사용자의 브라우저는 SP에 직접 로그아웃 요청을 보냅니다. Liferay가 SP로 구성되면 다음 로그아웃 URL을 요청하여 SLO가 시작됩니다.

    /c/portal/logout

다른 SP의 경우 SLO 시작에 대한 공급업체 설명서를 참조하십시오.

SAML `LogoutRequest` 이 IdP의 싱글 로그아웃 서비스 URL로 전송됩니다.

* Liferay가 SP 역할을 하는 경우 `LogoutRequest` 은 SAML 공급자의 IdP 연결 탭에서 구성한 IdP로 전송되고(IdP 연결을 설정하려면 [Liferay를 ID 공급자로 설정](./saml-admin.md) 참조) 정의된 SLO 서비스 URL SAML 메타데이터에서.

* Liferay가 IdP인 경우 사용자가 다른 SP에 로그온한 경우 사용자에게 각 SP 로그아웃 상태가 포함된 단일 로그아웃 화면이 표시되고 로그아웃할 수 없는 항목에 플래그가 지정됩니다(일부 SP는 SLO를 지원하지 않을 수 있음). 또는 현재 다운됨). 로그아웃할 다른 SP가 없으면 SAML 세션이 종료되고 IdP가 해당 세션을 삭제합니다.

### SP의 SLO 응답

사용자가 추가 SP(시작 SP 외에)에 로그인한 경우 IdP는 각각에 SAML `LogoutRequest` 을 보냅니다. Liferay가 IdP인 경우 `LogoutResponse` 은 HTTP-Post, HTTP-Redirect 또는 SOAP 바인딩을 사용하여 전송됩니다.

각 SP는 `LogoutResponse` 을 IdP에 전달합니다. Liferay가 SP인 경우 `LogoutResponse` 은 HTTP-Post, HTTP-Redirect 또는 SOAP 요청에 대한 직접 응답을 사용하여 전송됩니다.

모든 추가 SP가 `LogoutResponse`을 IdP에 전달한 후 IdP는 SSO 세션을 삭제합니다. Liferay가 IdP인 경우 마지막 SP가 `LogoutResponse` 을 전달하거나 시간이 초과되면 IdP는 Liferay 세션을 삭제하고 사용자를 로그아웃합니다.

마지막으로 IdP는 SLO를 시작한 SP에 `LogoutResponse` 을 보냅니다. 시작 SP가 SAML 세션을 종료하고 사용자를 로그아웃합니다.
