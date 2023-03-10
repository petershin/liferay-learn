# 인증 확인자 사용

인증 확인자는 Liferay Portal API의 원격 호출을 중앙 집중식 및 확장 가능한 방식으로 인증합니다. 두 가지 주요 책임이 있습니다.

1. 등록된 `AuthVerifier` 인스턴스를 사용하여 제공된 자격 증명 확인
1. 검증 결과를 기반으로 포털 인증 컨텍스트 생성

사용 가능한 `AuthVerifier` 이 제공된 자격 증명이 사용자 계정과 일치하는지 확인할 수 없는 경우 게스트 사용자에 대해 인증되지 않은 액세스를 지원하는 권한 부여 컨텍스트가 생성됩니다. 이를 통해 각 API는 단일 API 엔드포인트만 노출할 수 있습니다. 반대로 Liferay Portal의 레거시(6.2 이전) 버전은 각 API에 대해 두 개의 API 끝점을 노출했습니다. `/api/endpoint` URI는 인증되지 않은 액세스용이었고 URI `/api/secure/endpoint` 은 인증된 액세스용이었습니다. .

원격 클라이언트가 HTTP 기본 또는 HTTP 다이제스트 인증을 사용하거나, 요청 매개변수에 자격 증명을 보내거나, 인증된 `JSESSIONID`s를 보내거나, 신뢰를 구축하기 위해 공유 비밀을 사용하는 경우와 같은 가장 일반적인 상황에 대해 내장된 `AuthVerifier` 구현이 있습니다. 다른 `AuthVerifier` 구현은 OSGi 런타임에서 서비스로 등록되는 `AuthVerifier` 인터페이스의 구현을 포함하는 모듈로 배포될 수 있습니다.

```{important}
인증 확인 계층의 초점은 자격 증명 제공이 아니라 인증 확인에 있습니다. 토큰, 자격 증명을 발급하거나 로그인 포틀릿을 표시하지 않습니다. 대신 계층은 기존 자격 증명과 인증된 세션을 확인하고 인증 끝점을 보완합니다. 이전 버전과의 호환성을 보장하기 위해 기본 구현은 사용자 이름 및 암호 자격 증명을 제공하는 요청을 지원합니다. 따라서 인증 확인 계층은 인증과 권한 부여의 경계에 있습니다.
```

## 인증 확인 프로세스

인증 확인자를 구성하려면 **제어판** &rarr; **구성** &rarr; **시스템 설정** &rarr; **보안** &rarr; **API 인증** 으로 이동하십시오.

![인증 확인자 구성 화면](./using-authentication-verifiers/images/01.png)

### 1단계: 요청 자격 증명 확인

이 레이어는 책임 체인 디자인 패턴을 사용하여 기본 제공 및 타사 `AuthVerifier` 구현을 모두 지원합니다. 각 `AuthVerifier` 은 매핑된 URL 및 기타 속성을 지정하는 구성을 제공할 수 있습니다.

들어오는 각 요청은 등록된 모든 `AuthVerifier`s와 일치하여 요청을 처리하는 데 사용되는 `AuthVerifier`s의 최종 목록을 선택합니다. 들어오는 요청 자격 증명을 확인하는 것은 각 `AuthVerifier` 의 책임입니다.

### 2단계: 권한 부여 컨텍스트 생성

요청이 일치하는 모든 `AuthVerifier`s에 의해 처리되면 Liferay DXP는 확인된 사용자에 대한 권한 부여 컨텍스트를 생성합니다.

여기에는 확인된 사용자 ID 설정 `ThreadLocal`s를 확인된 사용자에게 반환하도록 `HttpServletRequest` `remoteUser` 설정이 포함됩니다.

확인된 사용자는 `AuthVerifier` 인스턴스 중 하나에서 반환된 사용자이거나 제공된 자격 증명을 확인할 수 있는 인스턴스가 없는 경우 게스트 사용자일 수 있습니다.

## 내장 인증 확인자 구성

`AuthVerifier`은 개발자가 생성하며 OSGi 런타임에 등록되어 있는 한 자동으로 처리됩니다. 이 계층과 주변 프로세스는 `javax.servlet.Filter` 인터페이스를 구현하는 `AuthVerifierFilter` 클래스에 의해 제공됩니다. 제품과 함께 제공되는 인증 검증기의 구성은 다음과 같습니다.

* [기본 인증 헤더](#basic-auth-header) *
* [다이제스트 인증](#digest-auth-header)
* [HTTP 터널 익스텐더](#http-tunnel-extender)
* [이미지 요청](#image-request-authentication-verifier)
* [포털 세션](#portal-sessions-auth-verifiers) *
* [요청 파라미터](#request-parameter)
* [터널 인증](#tunnel-auth)

> *기본적으로 활성화되어 있으며 즉시 사용 가능한 원격 API에 액세스하는 데 사용할 수 있습니다.

### 기본 인증 헤더

이 Auth Verifier를 사용하면 원격 클라이언트가 [HTTP 기본 인증](https://en.wikipedia.org/wiki/Basic_access_authentication) 을 사용하여 인증할 수 있습니다. 이 방식으로 인증해야 하는 URL 경로를 제공하여 구성합니다. **강제 기본 인증** 필드가 선택되면 HTTP 기본 인증이 필요합니다.

웹 서비스의 기본 URL은 `/api/*,/xmlrpc*` 입니다. 매핑은 `/api/liferay*` 을 제외하여 `TunnelServlet`액세스를 방지합니다. 자세한 내용은 터널 인증 확인자를 참조하십시오.

### 다이제스트 인증 헤더

이 Auth Verifier는 원격 클라이언트가 [HTTP 다이제스트 인증](https://en.wikipedia.org/wiki/Digest_access_authentication) 을 사용하여 인증할 수 있도록 합니다. 이 방식으로 인증해야 하는 URL 경로를 제공하여 구성합니다. Force Digest Authentication 필드가 선택되면 HTTP 기본 인증이 필요합니다.

이 Auth Verifier는 기본적으로 활성화되어 있지 않습니다.

### HTTP 터널 익스텐더

Liferay가 모듈성을 수용함에 따라 이 익스텐더는 모듈이 `TunnelServlet`의 일부가 될 수 있도록 작성되었습니다. `TunnelServlet` 및 `TunnelingServletAuthVerifier` 을 모듈 서블릿 컨텍스트에 매핑합니다. 매니페스트에 `Http-Tunnel` 이 있는 모듈은 Tunnel Servlet을 사용할 수 있으며 `/o/_module_/api/liferay/do`을 통해 API를 노출할 수 있습니다.

터널링이 허용된 클라이언트 IP 주소를 설정하여 구성합니다. 자세한 내용은 [속성 설명서](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#HTTP%20Tunneling) 및 [원격 준비](../../../site-building/publishing-tools/staging/configuring-remote-live-staging.md)을 참조하십시오.

이는 원격 API를 내보내는 권장 방법이 아닙니다. JAX-RS 또는 Liferay JSON 웹 서비스 기술을 사용하여 원격 서비스를 노출하는 것이 훨씬 좋습니다.

### 이미지 요청 인증 검증기

LibreOffice/OpenOffice에 연결된 경우 Office 프로세스는 Liferay Portal에서 이미지를 다운로드하여 이미지가 포함된 문서를 렌더링해야 합니다. 이를 위해 이미지에 안전하게 액세스하기 위해 [JWT 토큰](https://jwt.io) 이 생성됩니다.

허용된 호스트, 포함된 URL 및 필요한 경우 제외된 URL을 설정하여 이를 구성합니다.

이 Auth Verifier는 기본적으로 활성화되어 있지 않습니다.

### 포털 세션 인증 검증자

기존 포털 세션을 사용하여 Liferay JSON 웹 서비스에 액세스하기 위해 브라우저에서 JavaScript를 활성화합니다.

기본 구성에서 포함된 URL은 레거시 JSON 원격 서비스 계층에 대한 액세스를 보호합니다. `/api/json*,/api/jsonws*,/c/portal/json_service*`.

### 요청 매개변수 인증 검증자

`RequestParameterAutoLogin` 과의 이전 버전과의 호환성을 위해 HTTP 요청 매개변수 `parameterAutoLoginLogin` 및 `parameterAutoLoginPassword`내의 자격 증명을 사용하여 포털 끝점을 인증하고 액세스할 수 있습니다.

이 Auth Verifier는 기본적으로 활성화되어 있지 않습니다.

### 터널 인증 검증자

`TunnelServlet` 은 포털 원격 서비스에 대한 액세스를 제공하기 위해 `/api/liferay/do` 에 매핑된 레거시 원격 API 끝점입니다. Tunnel Auth Verifier는 사용자를 대신하여 제공된 사용자 ID를 사용하여 신뢰할 수 있는 원격 클라이언트 인증 액세스를 허용합니다.

신뢰할 수 있는 원격 클라이언트의 예로는 스테이징 원격 게시 기능이 있습니다.

신뢰할 수 있는 원격 클라이언트는 포털 속성 `tunneling.servlet.shared.secret`에 저장된 공유 비밀을 사용하여 인증합니다. 기본값은 비어 있으며 모든 액세스를 금지합니다.

기본 구성이 기본적으로 활성화되어 있어도 액세스는 localhost로만 제한됩니다. 터널링이 허용된 클라이언트 IP 주소를 설정하여 구성합니다. 자세한 내용은 [속성 설명서](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#HTTP%20Tunneling) 및 [원격 준비](../../../site-building/publishing-tools/staging/configuring-remote-live-staging.md)을 참조하십시오.

## 관련 항목

[서비스 접근 정책](./setting-service-access-policies.md)
