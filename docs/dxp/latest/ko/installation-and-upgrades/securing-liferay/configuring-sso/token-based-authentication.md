# 토큰 기반 Single Sign On 인증

토큰 기반 SSO 인증은 Shibboleth, SiteMinder, Oracle OAM 및 다음 메커니즘 중 하나를 통해 토큰을 전파하여 작동하는 모든 SSO 제품에 대한 지원을 표준화하기 위해 Liferay Portal 7.0에 도입되었습니다.

* HTTP 요청 매개변수
* HTTP 요청 헤더
* HTTP 쿠키
* 세션 속성

이러한 공급자에는 이러한 매개 변수, 헤더, 쿠키 또는 특성을 읽고 설정하는 내장 웹 서버 모듈이 있으므로 토큰 SSO 구성을 사용해야 합니다.

인증 토큰에는 특정 회사(포털 인스턴스)에 사용하도록 구성된 사용자의 화면 이름 또는 이메일 주소가 포함됩니다. Liferay Portal은 세 가지 인증 방법을 지원합니다.

* 이메일 주소로
* 화면 이름으로
* 사용자 ID별

토큰 기반 인증은 이메일 주소와 대화명만 지원합니다. 토큰 기반 인증을 시도할 때 사용자 ID가 구성된 경우 `TokenAutoLogin` 클래스는 다음 경고를 기록합니다.

```
Incompatible setting for: company.security.auth.type
```

또한 인증 메커니즘을 위한 모듈 또는 플러그인이 있는 Apache와 같은 프론팅 웹 서버와 같은 Liferay Portal 외부의 보안 메커니즘을 사용해야 합니다. 리버스 프록시를 사용하면 클라이언트의 웹 브라우저에서 Liferay Portal의 앱 서버로 HTTP 요청을 직접 전송하여 악의적인 사용자 가장을 방지할 수 있습니다.

## 토큰 기반 인증 구성

토큰 기반 인증은 기본적으로 비활성화되어 있습니다. 토큰 기반 SSO 인증을 관리하려면 제어판 &rarr; *시스템 설정*, &rarr; *보안* &rarr; *SSO*로 이동합니다.

![SSO 구성은 시스템 설정의 보안 섹션에 있습니다.](token-based-authentication/images/01.png)

다음은 토큰 기반 SSO 모듈의 구성 옵션입니다.

| 설정                | 묘사                                                           |
|:----------------- |:------------------------------------------------------------ |
| **가능하게 하는**       | 토큰 기반 SSO 인증을 활성화하려면 이 확인란을 선택합니다.                           |
| **LDAP에서 가져오기**   | 사용자가 존재하지 않는 경우 LDAP에서 자동으로 사용자를 가져오려면 이 상자를 선택하십시오.         |
| **사용자 토큰 이름**     | 토큰의 이름과 동일하게 설정하십시오. 이것은 지정된 사이트에서 검색됩니다. (예: `SM_USER`)      |
| **토큰 사이트**         | 사용자 토큰 유형으로 설정: HTTP 요청 매개변수, HTTP 요청 헤더, HTTP 쿠키, 세션 속성     |
| **인증 쿠키**         | 로그아웃 후 제거해야 하는 쿠키 이름으로 설정합니다. (예: `SMIDENTITY`, `SMSESSION`) |
| **로그아웃 리디렉션 URL** | 사용자가 Liferay Portal에서 로그아웃하면 사용자는 이 URL로 리디렉션됩니다.            |

토큰 기반 SSO를 활성화하려면 *저장* 을 클릭해야 합니다.

## 필수 SiteMinder 구성

SiteMinder를 사용하는 경우 Liferay Portal은 때때로 URL에 물결표 문자를 사용합니다. 기본적으로 SiteMinder는 물결표 문자(및 기타 문자)를 잘못된 문자로 취급하고 이러한 문자가 포함된 URL을 처리하는 경우 HTTP 500 오류를 반환합니다. 이 문제를 방지하려면 SiteMinder 구성에서 이 기본 설정을 다음과 같이 변경하십시오.

```
BadUrlChars       //,./,/.,/*,*.,\,%00-%1f,%7f-%ff,%25
```

위의 구성은 `~` 문자가 없는 것을 제외하고는 기본값과 동일합니다. 구성 업데이트를 적용하려면 SiteMinder를 다시 시작하십시오. 자세한 내용은 SiteMinder의 [설명서](https://techdocs.broadcom.com/us/product-content/recommended-reading/technical-document-index/ca-siteminder-informational-documentation-index.html) 을 참조하십시오.

## 개요

Liferay Portal의 토큰 기반 SSO 인증 메커니즘은 매우 유연하며 유효한 Liferay Portal 사용자의 화면 이름 또는 이메일 주소를 제공하는 모든 SSO 솔루션과 호환됩니다. 여기에는 Shibboleth 및 SiteMinder가 포함됩니다.
