# Liferay 클라우드 서비스에 로그인

기본적으로 모든 비프로덕션 환경(예: uat)에서 Liferay 및 인프라 서비스용 웹 인터페이스에 액세스하려면 로그인해야 합니다. 일반적으로 로그인 자격 증명은 초기 온보딩 이메일에 나타나지만 Liferay Cloud Console에도 있습니다.

## 로그인 자격 증명 찾기

1. **infra** 환경으로 이동합니다.

1. 왼쪽 메뉴에서 **설정** 클릭합니다.

1. **비밀** 탭을 클릭합니다.

1. **lcp-secret-ci-customer-user** 및 **lcp-secret-ci-customer-password** 암호를 클릭하여 액세스합니다.

   ![lcp-secret-ci-customer-user 및 lcp-secret-ci-customer-password 시크릿에는 로그인 자격 증명이 포함되어 있습니다.](./logging-into-your-liferay-cloud-services/images/01.png)

1. 각 비밀의 페이지에서 **보기** 클릭하여 값을 표시합니다. 표시된 값을 클릭하여 클립보드에 복사합니다.

   ![보기를 클릭하여 비밀 값을 표시합니다.](./logging-into-your-liferay-cloud-services/images/02.png)

## 로그인

1. 선택한 환경(dev, uat 등)으로 이동합니다.

1. 페이지 상단의 **사이트** 방문을 클릭합니다.

   ![사이트 방문 드롭다운에는 환경의 Liferay 인스턴스에 사용 가능한 모든 엔드포인트가 나열됩니다.](./logging-into-your-liferay-cloud-services/images/03.png)

   드롭다운 메뉴에는 기본 `webserver` 서비스 끝점과 환경에 추가한 모든 사용자 지정 도메인을 포함하여 `liferay` 서비스에 사용 가능한 모든 끝점이 나열됩니다.

1. 해당 URL로 Liferay 인스턴스에 액세스하려면 원하는 끝점을 클릭하십시오.

1. 메시지가 표시되면 Liferay Cloud [Jenkins 사용자 이름과 암호](#locating-login-credentials) 입력합니다.

   ![나타나는 팝업에서 인증합니다.](./logging-into-your-liferay-cloud-services/images/04.png)

로그인하면 사용자는 Liferay DXP 7.x 인스턴스(이 예에서는 Liferay DXP 7.2 GA1)로 리디렉션됩니다.

![로그인하면 환경의 Liferay DXP 인스턴스로 이동합니다.](./logging-into-your-liferay-cloud-services/images/05.png)

### 기본 서비스 URL 찾기

서비스 페이지에서 기본 `webserver` 끝점의 URL을 찾을 수 있습니다. `webserver` 로고를 클릭하여 URL을 확장합니다.

![서비스 로고는 클릭 가능한 URL로 확장됩니다.](./logging-into-your-liferay-cloud-services/images/06.png)

이 방법을 통해 Liferay에 액세스할 때 [Jenkins 로그인 자격 증명](#locating-login-credentials) 여전히 필요합니다.

비슷한 단계에 따라 Jenkins CI 웹 인터페이스에 액세스할 수 있습니다. `infra` 환경에서 `ci` 서비스로 이동하여 Jenkins URL을 찾습니다.

![CI 서비스에는 Jenkins CI 웹 인터페이스에 대한 URL이 있습니다.](./logging-into-your-liferay-cloud-services/images/07.png)

## 관련 주제

* [Liferay DXP 서비스 사용](../customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service.md)
* [지속적인 통합](../platform-services/continuous-integration.md)
* [웹 서버 서비스](../platform-services/web-server-service.md)
