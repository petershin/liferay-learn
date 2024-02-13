---
toc:
- ./securing-web-services/setting-service-access-policies.md
- ./securing-web-services/using-authentication-verifiers.md
- ./securing-web-services/setting-up-cors.md
---
# 웹 서비스 보안

Liferay DXP는 웹 서비스를 위한 네 가지 보안 계층을 제공합니다.

**IP 권한 레이어:** 웹 서비스 호출 요청이 시작된 IP 주소는 포털 속성 파일에서 화이트리스트에 있어야 합니다. 화이트리스트에 없는 IP 주소에서 오는 웹 서비스 호출은 자동으로 실패합니다.

**서비스 액세스 정책 레이어:** 웹 서비스 호출 요청에 해당하는 메서드는 유효한 각 서비스 액세스 정책에 의해 화이트리스트에 추가되어야 합니다. 와일드카드를 사용하여 명시적으로 화이트리스트에 추가해야 하는 서비스 클래스 및 메서드의 수를 줄일 수 있습니다.

**인증/검증 계층(브라우저 전용):** 웹 서비스 호출 요청이 브라우저에서 오는 경우 요청에 인증 토큰이 포함되어야 합니다. 이 인증 토큰은 `p_auth` URL 매개변수의 값입니다. 토큰은 Liferay DXP에서 생성되며 브라우저 세션과 연결됩니다. `p_auth` 매개변수는 JSON 웹 서비스 API 페이지 또는 `Liferay.Service(...)`를 사용하는 JavaScript를 통해 Liferay DXP 웹 서비스를 호출할 때 자동으로 제공됩니다. Liferay DXP가 호출자의 인증 토큰을 사용자와 연결할 수 없는 경우 웹 서비스 호출 요청이 실패합니다.

**사용자 권한 계층:** 제대로 구현된 웹 서비스에는 권한 검사가 있습니다. 웹 서비스를 호출하는 사용자는 서비스를 호출할 수 있는 권한이 있어야 합니다.

## 인증

Liferay DXP에는 여러 조정 가능한 인증 계층이 포함되어 있습니다.

* Liferay DXP의 Java 서블릿에 대한 액세스를 제한하기 위한 원격 IP 및 HTTPS 전송 확인
* 포털 서비스 관련 인증 검사를 수행하기 위한 확장 가능한 액세스 제어 정책 계층
* 확장 가능 [역할 기반 권한 프레임워크](../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) Liferay 자산(데이터베이스 또는 다른 사이트에 저장됨)
* 포틀릿 액세스를 제어하는 포틀릿 컨테이너 보안 검사
* 원격 API 인증 방법에 대한 원격 IP 확인
* [원격 API에 대한 액세스를 제어하기 위한 서비스 액세스 정책](./securing-web-services/setting-service-access-policies.md)
* [제공된 자격 증명을 확인하는 인증 확인자](./securing-web-services/using-authentication-verifiers.md).
* [Cross-Origin Resource Sharing](./securing-web-services/setting-up-cors.md) 구성은 신뢰할 수 있는 소스에서만 리소스 검색을 활성화할 수 있습니다.
