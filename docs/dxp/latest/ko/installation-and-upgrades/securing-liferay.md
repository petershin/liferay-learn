---
toc:
- ./securing-liferay/authentication-basics.md
- ./securing-liferay/configuring-sso.md
- ./securing-liferay/multi-factor-authentication.md
- ./securing-liferay/using-antisamy.md
- ./securing-liferay/securing-web-services.md
---
# 라이프레이 확보

Liferay DXP는 보안을 염두에 두고 제작되었습니다. 여기에는 [OWASP Top 10](https://www.owasp.org/index.php/Top_10_2013-Top_10) 및 [CWE/SANS Top 25](https://www.sans.org/top25-software-errors/) 에서 설명한 것과 같은 일반적인 보안 취약성 및 익스플로잇의 완화가 포함됩니다.

호스팅 환경, 데이터베이스, 검색 공급자, 응용 프로그램 서버 및 Liferay DXP 자체에 대한 최상의 보안 사례를 따르는 것을 포함하되 이에 국한되지 않는 Liferay 설치 보안에는 여러 가지 측면이 있습니다.

```{note}
예를 들어 Liferay DXP는 HTTP 헤더에서 CRLF를 삭제하기 위해 응용 프로그램 서버에 의존합니다. 애플리케이션 서버에서 이것이 올바르게 구성되었는지 확인해야 합니다. 이 구성을 건너뛰면 Veracode와 같은 보안 확인 제품이 보안 보고서에서 오탐지에 플래그를 지정할 수 있습니다.
```

여기서는 Liferay DXP를 보호하기 위한 기본 요소를 배웁니다. 여기에는 사용자가 Liferay DXP 설치에 인증하는 방법 구성, 사용자에게 권한 부여, Liferay DXP 웹 서비스에 대한 보안 액세스 구성, 필요에 따라 보안 기능 미세 조정이 포함됩니다.

```{important}
고객은 보안 패치가 출시되면 배포하는 것이 좋습니다. 커뮤니티 및 CE 설치의 경우 항상 이전 보안 패치가 모두 포함된 최신 커뮤니티 릴리스를 사용하는 것이 좋습니다.
```

## 인증

Liferay DXP 인증은 유연합니다. 기본적으로 사용자는 데이터베이스를 사용하여 사용자를 인증하는 **로그인** 위젯을 사용하여 Liferay DXP에 로그인합니다. 기본적으로 게스트는 로그인 위젯을 사용하여 기본 권한으로 계정을 생성할 수 있습니다. 기본 인증 환경의 거의 모든 요소는 관리자가 변경할 수 있습니다. 예를 들어,

* [다단계 인증](./securing-liferay/multi-factor-authentication/using-multi-factor-authentication.md)을 구성할 수 있습니다.
* [SSO를 사용하여](./securing-liferay/configuring-sso.md) 인증을 관리할 수 있습니다.
* Liferay는 [LDAP와 통합](../users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory.md)하여 포털을 사용하는 대신 사용자를 검증할 수도 있습니다. 데이터 베이스.
* 게스트 계정 생성은 [해제](./securing-liferay/authentication-basics.md#disabling-guest-account-creation) 할 수 있습니다.

자세한 내용은 [인증 기본 사항](./securing-liferay/authentication-basics.md)을 참조하십시오.

## 권한

Liferay DXP에는 강력한 역할 기반 액세스 제어(RBAC) 시스템이 있습니다. 사이트, 팀, 사용자 그룹 또는 조직에 사용자를 할당할 수 있습니다. 사용자 정의 역할을 생성할 수 있고, 이러한 역할에 권한을 할당할 수 있으며, 해당 역할을 사용자에게 할당할 수 있습니다. 역할은 사이트, 조직 또는 전역과 같은 특정 컨텍스트에서만 적용되도록 범위가 지정됩니다. 자세한 내용은 [역할 및 권한](../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 을 참조하십시오.

## 웹 서비스 보안

Liferay 웹 서비스에는 보안 및 인증에 대한 다층적이고 구성 가능한 접근 방식이 있습니다.

* [서비스 액세스 정책](./securing-liferay/securing-web-services/setting-service-access-policies.md) 은 원격 API에 대한 액세스를 제어합니다.
* [인증 확인자](./securing-liferay/securing-web-services/using-authentication-verifiers.md) 은 제공된 자격 증명을 확인합니다.
* [Cross-Origin Resource Sharing](./securing-liferay/securing-web-services/setting-up-cors.md) 구성은 신뢰할 수 있는 소스에서만 리소스 검색을 활성화할 수 있습니다.

자세한 내용은 [웹 서비스 보안 소개](./securing-liferay/securing-web-services.md) 을 참조하십시오.

## 미세 조정 보안

추가 보안 기능을 미세 조정하거나 비활성화하는 방법에는 여러 가지가 있습니다.

* Liferay Portal의 HTTPS [웹 서버](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 주소를 구성합니다.
* 사용자가 [될 수 있는 허용된 서버 목록을 구성](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) .
* 모든 페이지에서 액세스할 수 있는 [포틀릿](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 목록을 구성합니다.
* 업로드 및 다운로드가 허용되는 파일 형식을 구성합니다.

이러한 기능은 [포털 속성](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 을 사용하여 구성할 수 있습니다.

```{warning}
Liferay Portal의 철학은 "기본적으로 보안"입니다. 보안 관련 기본값 또는 화이트리스트를 수정할 때 상당한 주의를 기울이십시오. 이러한 작업은 잘못된 보안 구성 및 안전하지 않은 배포로 이어질 수 있습니다.
```

## 관련 주제

Liferay Portal 설치 보안에 대한 자세한 내용은 [보안 설명](https://www.liferay.com/security) , [커뮤니티 보안 팀](https://portal.liferay.dev/people/community-security-team) 및 해당 페이지에 나열된 리소스를 참조하십시오.

[Liferay Marketplace](https://www.liferay.com/marketplace) 에서 사용할 수 있는 추가 보안 플러그인이 있습니다.

## 다음 단계

* [인증 기본 사항](./securing-liferay/authentication-basics.md)
* [보안 웹 서비스 소개](./securing-liferay/securing-web-services.md)
