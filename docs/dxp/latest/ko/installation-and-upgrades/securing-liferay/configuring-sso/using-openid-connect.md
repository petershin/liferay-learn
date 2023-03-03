---
uuid: af832712-a9a1-46aa-ac8d-754cbd7656af
---

# OpenID 연결 사용

OpenID Connect는 사용자가 다른 시스템에 있는 계정을 사용하여 인증할 수 있는 경량 인증 계층입니다. [OAuth 2.0](../../../headless-delivery/using-oauth2/using-oauth2.md) 인증 프로토콜 위에 구축되었습니다. OpenID Connect를 사용하면 사용자 인증을 다른 공급자에게 *위임* 하므로 기존 계정이 있는 사용자가 Liferay 설치에 쉽게 인증할 수 있습니다.

```{note}
설치에 여러 공급자를 추가할 수 있지만 Liferay DXP는 OpenID Connect 공급자가 될 수 없습니다.
```

OpenID Connect의 토큰 흐름은 기능 위에 구축되었기 때문에 OAuth 2.0과 유사합니다. OAuth 2.0은 인증 프로토콜일 뿐이므로 특정 API에 대한 액세스 권한을 부여하는 *액세스 토큰* 보냅니다. OpenID Connect는 사용자가 인증하고 권한을 부여한 경우 _이름_ 및 _이메일_와 같은 사용자 정보를 전달하는 *ID 토큰* 여기에 추가합니다.

## OpenID Connect 공급자에서 클라이언트 만들기

OpenID Connect를 사용하려면 먼저 공급자에 클라이언트로 등록해야 합니다. 이것은 OAuth 2.0 클라이언트입니다. 프로세스는 공급자에 따라 다릅니다.

1. 공급자의 웹 사이트로 이동하여 클라이언트를 만듭니다.

1. 생성 프로세스 중에 제공자로부터 전송된 토큰을 처리할 수 있는 *승인된 리디렉션 URL* 제공해야 합니다. Liferay DXP의 URL은

    ```
    https://[server.domain]/c/portal/login/openidconnect
    ```

1. 공급자는 여러 정보를 보냅니다. Discovery Endpoint, Authorization Endpoint 또는 Issuer URL과 같은 이들 중 일부는 클라이언트에 관계없이 동일합니다. 요청에 고유한 두 가지 정보는 `client_id` 및 `client_secret`입니다.

공급자로부터 정보를 수집합니다. 공급자 연결을 생성해야 합니다.

## OpenID Connect 공급자 연결 구성

Liferay는 공급자 연결을 위한 새로운 인터페이스에 대한 피드백을 구합니다. 이러한 이유로 연결을 생성하는 방법에는 표준 방식과 새로운 방식의 두 가지가 있습니다.

```{important}
새로운 공급자가 개발될 때 원활한 전환을 제공하기 위해 Liferay는 두 인터페이스 간에 OpenID Connect 구성을 변환하고 동기화합니다. 
```

### OAuth 2.0**을 위한 새로운 OpenID Connect 공급자 연결

이 인터페이스는 클라이언트 연결을 세밀하게 제어하려는 사용자를 위한 것입니다. 모든 구성은 [OpenID Connect 구성 사양](https://openid.net/specs/openid-connect-discovery-1_0.html#ProviderConfigurationRequest) 에 정의된 대로 공급자의 Well-Known Configuration Endpoint를 통해 수행됩니다.

1. 전역 메뉴 &rarr; 제어판 &rarr; 보안 &rarr; OAuth 클라이언트 관리로 이동합니다.

1. 두 개의 탭이 있습니다. 첫 번째는 인증 서버에 대한 클라이언트를 생성합니다. 두 번째는 잘 알려진 URI가 없는 인증 서버용입니다. 항상 첫 번째 탭을 사용합니다. 두 번째 탭은 URI가 없는 서버에 대해 "의사" 잘 알려진 URI를 만드는 데만 사용합니다.

**잘 알려진 URI가 없는 경우**

1. 두 번째 탭으로 이동하여 *추가* (![Add Button](../../../images/icon-add.png))을 클릭합니다.

1. 공급자의 인증 서버 메타데이터를 입력합니다. `issuer` 필드에 JSON 값이 있는지 확인하십시오. 이렇게 하면 저장을 클릭할 때 잘 알려진 "로컬" URI가 생성됩니다.

1. *저장*클릭합니다. 생성된 URI를 볼 수 있는 OAuth 클라이언트 관리 페이지로 돌아갑니다. 이 URI를 클립보드에 복사합니다. 다음 단계에서 이 URI를 사용합니다.

**잘 알려진 URI가 있는 경우**

1. 첫 번째 탭에서 *추가* (![Add Button](../../../images/icon-add.png))을 클릭합니다.

1. 인증 서버의 잘 알려진 URI를 잘 알려진 URI 필드에 붙여넣습니다. 예를 들어 Google은 https://accounts.google.com/.well-known/openid-configuration입니다. 위와 같이 생성했다면 여기에 붙여넣으세요.

1. 대부분의 경우 이 작업만 수행하면 됩니다. 잘 알려진 URI가 없는 경우 아래 필드를 사용하여 연결을 구성하십시오. 완료되면 *저장*클릭합니다.

양식의 다른 필드는 공급자로 생성된 특정 구성을 위한 것입니다.

**OAuth 클라이언트 정보:** [RFC-7591](https://www.rfc-editor.org/rfc/rfc7591.html) JSON 형식에 따라 클라이언트 구성 정보를 추가합니다. 잘 알려진 URI를 사용한 경우 여기에 아무 것도 추가할 필요가 없습니다.

**OAuth 클라이언트 기본 인증 요청 매개변수:** 자체를 지정하지 않는 Liferay 애플리케이션이 있는 경우 [인증 요청 매개변수](https://www.iana.org/assignments/oauth-parameters) 여기에서 이 OAuth 클라이언트를 사용하기 위한 JSON 형식의 기본 매개변수를 지정하십시오. 맞춤 매개변수 값은 문자열의 JSON 배열이어야 합니다.

**OAuth 클라이언트 기본 토큰 요청 매개변수:** 토큰 요청 매개변수 [자체](https://www.iana.org/assignments/oauth-parameters) 지정하지 않는 Liferay 애플리케이션이 있는 경우 여기에서 이 OAuth 클라이언트를 사용하기 위한 JSON 형식의 기본 매개변수를 지정하십시오. 맞춤 매개변수 값은 문자열의 JSON 배열이어야 합니다.

### 표준 OpenID Connect 공급자 연결

*Control Panel* &rarr; *Configuration* &rarr; *Instance Settings* &rarr; *Security* &rarr; *SSO* 이동하여 *System Scope*에서 ***OpenID Connect Provider*** 을 선택합니다.

![시스템 설정 메뉴에서 OpenID 구성 찾기.](using-openid-connect/images/01.png)

다음과 같이하세요:

1. *추가* 버튼을 클릭하여 공급자를 추가합니다.

1. 제공자로부터 받은 정보를 사용하여 양식을 작성하십시오.

   | 분야                          | 묘사                                                                                                                                                              |
   |:--------------------------- |:--------------------------------------------------------------------------------------------------------------------------------------------------------------- |
   | **제공자 이름**                  | 이 이름은 사용자가 OpenID Connect를 사용하여 로그인할 때 로그인 포틀릿에 나타납니다.                                                                                                          |
   | **OpenID 클라이언트 ID**         | 공급자로부터 받은 OAuth 2.0 클라이언트 ID를 제공합니다.                                                                                                                            |
   | **OpenID Connect 클라이언트 암호** | 공급자로부터 받은 OAuth 2.0 클라이언트 암호를 제공합니다.                                                                                                                            |
   | **범위**                      | 사용자 이름과 이메일을 요청하는 기본값을 그대로 둡니다. 귀하의 공급자는 다른 범위의 사용자 정보를 제공할 수 있습니다.                                                                                             |
   | **탐색 엔드포인트**                | 다른 URL은 이 URL에서 얻을 수 있으며 공급자에 따라 다릅니다.                                                                                                                          |
   | **탐색 엔드포인트 캐시 (밀리초)**       | 이 시간 동안 검색된 끝점(URL)을 캐시합니다.                                                                                                                                     |
   | **인증 엔드포인트**                | 이 URL은 사용자 인증(즉, 사용자 로그인)을 위한 공급자의 URL을 가리킵니다.                                                                                                                  |
   | **Issuer URL**              | 사용자 정보를 발급하는 공급자에 대한 정보를 가리키는 공급자의 URL입니다.                                                                                                                      |
   | **JWKS URI**                | 제공자의 토큰을 확인할 수 있는 공개 키가 포함된 제공자의 JSON 웹 키 세트를 가리키는 URL입니다.                                                                                                      |
   | **ID 토큰 서명 알고리즘**           | 지원되는 ID 토큰 알고리즘을 수동으로 설정하십시오. 일반적으로 이는 검색 끝점에서 "검색"됩니다. 필요한 만큼 추가할 수 있습니다.                                                                                      |
   | **주제 유형**                   | 주체 식별자는 공급자가 사용자가 누구인지 확인하는 데 사용하는 고유하고 절대 재할당되지 않는 식별자이며 클라이언트(예: Liferay DXP)에서 사용합니다. public(모든 클라이언트에 동일한 값 제공) 및 private(각 클라이언트에 다른 값 제공)의 두 가지 유형이 있습니다. |
   | **토큰 끝점**                   | 토큰을 요청할 수 있는 공급자의 URL입니다.                                                                                                                                       |
   | **밀리초 단위의 토큰 연결 시간 초과**     | 시간이 초과되기 전에 유효성 검사를 위해 토큰을 요청할 때 이 시간 동안 기다립니다. `0` 값은 영원히 대기한다는 의미이므로 권장하지 않습니다.                                                                               |
   | **사용자 정보 엔드포인트**            | 사용자 정보를 얻을 수 있는 OAuth 2.0 보호 URL입니다.                                                                                                                            |

양식을 작성한 후 *저장*클릭하면 OpenID Connect 인증을 사용할 준비가 된 것입니다.

내보낸 구성은 다음 시스템 설정 구성 파일을 생성합니다.

```
com.liferay.portal.security.sso.openid.connect.internal.configuration.OpenIdConnectProviderConfiguration-[name].config
```

여기서 `[name]` 설명적이지만 고유한 이름입니다(예 `provider1`.

## OpenID Connect 인증 활성화

1. *Control Panel* &rarr; *Configuration* &rarr; *Instance Settings* &rarr; *Security* &rarr; *SSO* 으로 이동하여 ***OpenID Connect*** under *Virtual Instance Scope*를 선택합니다.

    ![인스턴스 설정에서 OpenID Connect 인증 활성화](using-openid-connect/images/02.png)

1. *활성화됨* 확인란을 클릭한 다음 *저장*클릭합니다.

내보낸 구성은 다음 시스템 설정 구성 파일을 생성합니다.

```
com.liferay.portal.security.sso.openid.connect.configuration.OpenIdConnectConfiguration.config
```

이제 사용자는 OpenID Connect로 로그인할 수 있습니다.

## OpenID Connect로 로그인

OpenID Connect로 로그인하기 위한 새 링크가 로그인 포틀릿에 나타납니다.

1. 로그인 포틀릿에서 하단의 OpenID Connect 링크를 클릭합니다.

1. 공급자를 선택하고 *로그인*클릭하십시오.

1. 그러면 공급자의 로그인 페이지로 이동합니다. 자격 증명을 입력하고 로그인합니다.

1. 인증에 성공하면 인증된 상태의 Liferay DXP로 다시 리디렉션됩니다.
