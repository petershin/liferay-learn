# OAuth2로 계정 액세스 권한 부여

애플리케이션이 등록되면 사용자 인증을 시작할 수 있습니다. 그렇게 하려면 인증 서버(Liferay DXP)에 대한 URL을 구성해야 합니다. 인증 서버는 사용자에게 이전 자습서에서 범위로 본 것처럼 정의된 리소스에 대한 요청된 권한을 인증하도록 요청합니다.

## 인증 코드 흐름

가장 일반적인 OAuth 흐름은 웹 애플리케이션에 사용되는 인증 코드 흐름입니다. 이에 대한 URL에는 다음 요청 매개변수가 필요합니다.

* `response_type`
* `client_id`

이 승인을 위한 URL을 구성하려면 다음 패턴을 따르세요.

```
https://[hostname]/o/oauth2/authorize?response_type=code&client_id=[client ID]
```

클라이언트 ID는 애플리케이션 등록에서 가져옵니다. 자동으로 생성됩니다(응용 프로그램을 편집하면 변경할 수 있음).

사용자가 자원에 대해 요청된 권한을 인증하면 인증 서버는 등록된 콜백 URI(AKA)에서 애플리케이션에 인증 코드를 반환합니다. 리디렉션 URI)를 쿼리 문자열 매개변수로 사용합니다.

```
[your callback URI]?code=[authorization server generated code]
```

애플리케이션은 다음 패턴에 따라 POST 요청을 전송하여 이 인증 코드를 액세스 토큰으로 교환해야 합니다.

```
http://localhost:8080/o/oauth2/token
```

```{important}
때때로 "웹 애플리케이션"이라는 문구가 느슨하게 사용되어 위의 URL이 웹 브라우저에서 직접 요청되는 애플리케이션을 암시합니다. 이런 일이 발생하면 클라이언트 암호가 유출되어 권한 부여 흐름과 애플리케이션의 보안이 손상됩니다. 이러한 경우 애플리케이션을 등록할 때 대신 "사용자 에이전트 애플리케이션" 클라이언트 프로필을 선택하십시오. 이렇게 하면 애플리케이션에 사용할 수 있는 안전한 대안이 됩니다. PKCE 확장 인증 코드 흐름(아래 참조).
```

본문에 다음 매개변수를 포함합니다( `application/x-www-form-urlencoded`로 인코딩됨).

```
client_id=[client ID] client_secret=[client secret] grant_type=authorization_code code=[authorization server generated code] redirect_uri=[registered callback URI]
```

이 요청에 대한 HTTP 응답 본문에서 다음과 같은 JSON을 수신합니다.

```json
{
  "access_token": "[authorization server generated access token]",
  "token_type": "Bearer",
  "expires_in": 600,
  "scope": "[the scopes that were authorized by the user]",
  "refresh_token": "[authorization server generated refresh token]"
}
```

여기에서 액세스 토큰을 추출하고 유지해야 합니다. 무기한(위의 예에서 600초 초과) 동안 토큰을 사용하려는 경우 새로 고침 토큰도 필요합니다. 이는 Refresh Token Flow와 함께 사용하여 추가 사용자 인증 없이 동일한 권한을 가진 새 액세스 토큰을 얻을 수 있습니다. 인증 서버는 애플리케이션 등록이 이 흐름에 등록된 경우에만 새로 고침 토큰을 발급합니다.

## PKCE 확장 인증 코드 흐름

이 흐름은 PKCE(Proof Key for Code Exchange)가 추가된 위와 동일합니다. 다른 요청 매개변수인 `code_challenge`이 필요합니다. 이 흐름은 사용자 인증 후 인증 서버에 의해 리디렉션되는 URL(및 요청 매개변수)에 대한 단독 액세스 권한이 없을 수 있는 스마트폰 애플리케이션과 같은 클라이언트를 위한 것입니다. 응답 코드를 읽어 자체적으로 권한을 부여하는 동일한 시스템의 악성 애플리케이션으로부터 보호합니다. 이를 위해 클라이언트 애플리케이션은 인증 요청과 함께 *코드 챌린지* 을 전송합니다. 이 문자열은 자신이 생성했고 알고 있는 문자열입니다. 이 문자열을 생성하려면 먼저 *Code Verifier*이라는 또 다른 비밀 문자열을 만든 다음 변환을 적용해야 합니다. 인증 후 코드 검증자는 인증 코드와 함께 전송되어 클라이언트를 검증합니다.

이를 수행하는 방법에 대한 자세한 내용은 [PKCE 사양](https://tools.ietf.org/html/rfc7636) 을 참조하십시오.

이 흐름을 지원하려면 응용 프로그램을 만들 때 PKCE를 허용된 인증 유형으로 정의해야 합니다. 이는 네이티브 애플리케이션 및 사용자 에이전트 애플리케이션 클라이언트 프로필의 일부입니다. PKCE를 사용하여 인증 코드를 요청하려면 `code_challenge` 요청 매개변수가 포함된 URL을 사용하십시오.

```
https://[hostname]/o/oauth2/authorize?response_type=code&client_id=[client ID]&code_challenge=[PKCE code challenge]
```

나머지 프로세스는 액세스 토큰을 얻기 위한 최종 요청을 할 때 다음 매개 변수도 제공해야 한다는 점을 제외하면 권한 부여 코드 흐름과 동일합니다.

```
code_verifier=[Code Verifier that was transformed and sent as code_challenge previously]
```

## 클라이언트 자격 증명 및 리소스 소유자 흐름

덜 사용되는 다른 두 가지 흐름이 있습니다. 두 서버가 사용자 중심이 아닌 합의된 데이터를 교환하는 시나리오가 있는 경우 사용자에 대한 허용/거부 화면을 건너뛰고 클라이언트에 권한을 부여할 수 있습니다. 이를 클라이언트 자격 증명 흐름이라고 하며 다음 URL 패턴을 사용합니다.

```
https://[hostname]/o/oauth2/token?grant_type=client_credentials&client_id=[client ID]&client_secret=[client secret]
```

사용자가 암호로 애플리케이션을 신뢰하는 최종 흐름은 드물지만 가능합니다. 이를 리소스 소유자 암호 흐름이라고 하며 해당 URL 패턴은 다음과 같습니다.

```
https://[hostname]/o/oauth2/token?grant_type=password&client_id=[client ID]&client_secret=[client secret]&username=[user@emailaddress.com]&password=
```

사용자에게 암호를 입력하라는 메시지가 표시되고 성공적으로 로그인하면 인증 코드를 받습니다.

## 토큰 사용

위의 모든 흐름은 권한 부여 서버(Liferay)에서 클라이언트 애플리케이션으로 전송되는 액세스 토큰을 생성합니다. 이 토큰은 향후 데이터 요청과 함께 저장하고 보낼 클라이언트 애플리케이션에 대한 응답으로 전송됩니다.

예를 들어 인증 코드 `946856e2b5ddf0928f6fc55f657bab73` 이 클라이언트 애플리케이션으로 전송되었다고 가정합니다. 클라이언트가 데이터를 요청할 때 이 코드는 각 요청 헤더에서 전송되어야 합니다. Curl과 같은 명령줄 HTTP 클라이언트를 사용하여 다음과 같은 요청을 보낼 수 있습니다.

```
curl -H 'Authorization: Bearer 946856e2b5ddf0928f6fc55f657bab73' 'https://[hostname]/o/api/sample2'
```

OAuth 2.0은 클라이언트 애플리케이션이 자격 증명 정보를 공유하지 않고 사용자가 특정 서비스(범위)에 대한 액세스 권한을 부여할 수 있는 편리한 방법을 제공합니다.

## 액세스 취소

액세스 권한이 부여되면 사용자 또는 관리자는 원할 때마다 자유롭게 액세스 권한을 취소할 수 있습니다. 클라이언트에 이런 일이 발생하면 토큰이 무효화되고 클라이언트는 사용자에게 다시 인증을 요청해야 합니다. 이를 통해 사용자는 자신의 데이터에 액세스할 수 있는 항목을 제어할 수 있으며 언제든지 이 제어를 행사할 수 있습니다.

![사용자는 자신의 계정 프로필에 있는 데이터에 액세스할 수 있는 애플리케이션을 완전히 제어할 수 있습니다.](./authorizing-account-access-with-oauth2/images/01.png)

계정 영역에서 사용자는 *내 연결된 애플리케이션* 을 클릭하고 자신의 계정에 액세스하도록 허용한 애플리케이션 목록을 볼 수 있습니다. 여기에서 조치 메뉴의 *액세스 권한 제거* 항목 또는 애플리케이션의 세부 정보 화면에서 *액세스 권한 제거* 버튼을 클릭하여 접근 권한을 철회할 수 있습니다.

![내 연결된 애플리케이션에서 사용자는 승인된 앱을 보고 액세스를 취소할 수 있습니다.](./authorizing-account-access-with-oauth2/images/02.png)

관리자는 *제어판* &rarr; *구성* &rarr; *OAuth2 관리*에 있는 모든 앱의 권한 탭에서 권한을 볼 수 있습니다. 앱이 신뢰할 수 있거나 내 인증 저장 상자가 선택된 경우 해당 정보가 나타납니다.

![앱에 대한 모든 인증은 앱의 인증 탭에 나타납니다.](./authorizing-account-access-with-oauth2/images/03.png)

나열된 승인에서 *취소* 버튼을 클릭하면 해당 사용자 계정에 대한 해당 애플리케이션의 액세스가 취소됩니다.

## 개요

OAuth 2.0은 자격 증명 정보를 공유할 필요 없이 사용자에게 완전하고 안전한 인증 흐름을 제공합니다. 시스템에서 애플리케이션이 생성되면 보안 토큰은 특정 범위의 정보에 대한 액세스를 제공하며 이 액세스는 언제든지 취소할 수 있으므로 OAuth 2.0은 사용자와 개발자 모두가 필요한 정보에 액세스할 수 있는 편리한 방법입니다.
