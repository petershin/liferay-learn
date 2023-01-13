# OAuth 2 범위

OAuth 2.0에서는 애플리케이션에 사용자 데이터의 제한된 하위 집합에 대한 액세스 권한이 부여됩니다. 이를 *범위* 이라고 합니다(Liferay 범위와 혼동하지 말 것). 두 가지 방법으로 생성됩니다.

* 관리자가 범위에 대한 서비스 액세스 정책을 생성합니다.

* 개발자가 JAX-RS 엔드포인트를 생성합니다. 기본적으로 범위는 JAX-RS 엔드포인트에서 지원하는 HTTP 동사를 기반으로 생성됩니다. 특수 주석이 이 동작을 재정의하고 특정 범위를 등록합니다.

## JSONWS 서비스에 대한 범위 생성

범위를 생성하는 가장 일반적인 방법은 `OAUTH2_`접두사가 붙은 [서비스 액세스 정책](../../installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies.md) 을 생성하는 것입니다. 이 이름 지정 규칙으로 인해 정책이 OAuth 애플리케이션 구성 화면에 범위로 표시됩니다.

예를 들어 애플리케이션이 이메일 주소를 검색하기 위해 사용자의 프로필 정보에 액세스해야 한다고 가정해 보겠습니다. 이에 대한 애플리케이션 액세스 권한을 부여하려면 *Control Panel* &rarr; *Configuration* &rarr; *Service Access Policy*로 이동하여 아래 그림과 같은 정책을 만듭니다.

![서비스 액세스 정책은 OAuth 2.0 애플리케이션의 범위를 정의합니다.](./oauth2-scopes/images/01.png)

이 정책은 기본 정책이 아니며 `UserService`의 한 가지 방법에만 액세스 권한을 부여합니다. Service Builder에서 생성한 JSONWS 웹 서비스입니다. 다음 URL에서 설치 시 사용 가능한 모든 서비스 목록을 볼 수 있습니다.

```
http://[host]:[port]/api/jsonws/
```

정책을 만들고 `OAUTH2_` 접두사로 이름을 지정하면 OAuth2 관리의 *범위* 탭에 나타납니다.

![적절한 접두사로 이름이 지정된 범위는 애플리케이션 구성의 범위 탭에 나타납니다.](./oauth2-scopes/images/02.png)

이제 그것을 선택하고 응용 프로그램을 저장할 수 있습니다.

## 승인 페이지 만들기

이 단계는 선택 사항입니다. 사용자는 자신의 계정에 대한 액세스 권한을 부여하기 위한 인터페이스가 필요하며 자동으로 제공됩니다. 그러나 페이지를 사용자 지정하려는 경우 사이트에서 인증 페이지를 만들 수 있습니다.

1. *글로벌 메뉴* (![Global Menu](../../images/icon-applications-menu.png))을 열고 *제어판* 탭을 클릭한 다음 *인스턴스 설정* &rarr; *보안* &rarr; *OAuth 2* &rarr; *인증 화면*로 이동합니다.

   이 화면에는 기본값 `/?p_p_id=com_liferay_oauth2_provider_web_internal_portlet_OAuth2AuthorizePortlet&p_p_state=maximized`와 함께 인증 화면 URL 필드가 표시됩니다. 이것은 내부 포틀릿에 해당합니다.

   ![OAuth 2 인증 화면을 구성합니다.](./oauth2-scopes/images/03.png)

1. 인증 화면에 대해 원하는 URL을 설정합니다(예: `/인증`).

1. 원하는 사이트로 이동하여 *사이트 메뉴* (![Site Menu](../../images/icon-product-menu.png))을 열고 *사이트 빌더*를 확장한 다음 *페이지*을 클릭합니다.

1. ** 추가 버튼(![추가 버튼](../../images/icon-add.png)) 버튼을 누르고 *Page*을 선택합니다.

   ```{note}
   Liferay DXP 7.3 및 이전 버전의 경우 비공개 페이지를 생성합니다. 인증된 사용자만 비공개 페이지에 액세스할 수 있습니다.
   ```

1. *Full Page Application* 유형을 선택합니다.

1. 2단계에서 구성한 것과 동일한 이름을 페이지에 지정합니다.

1. *탐색 메뉴 위젯에서 숨김* 스위치를 켭니다. 사이트 탐색에 이 페이지가 표시되는 것을 원하지 않습니다.

1. 다음에 표시되는 페이지에서 친숙한 URL이 2단계에서 구성한 URL과 일치하는지 확인합니다.

1. *Full Page Application*에서 *Application Authorization Request*를 선택합니다.

1. *저장*을 클릭합니다.

훌륭한! 사용자는 디자인의 기본 또는 UI를 사용하여 인증 프로세스를 진행할 수 있습니다. 이제 UI가 있고 범위를 이해했으므로 애플리케이션에서 권한 부여 프로세스가 발생하도록 할 차례입니다.
