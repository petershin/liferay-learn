# Liferay 클라우드 서비스에 로그인

기본적으로 Liferay 및 인프라 서비스의 웹 인터페이스에 직접 액세스하려면 로그인이 필요합니다. 이러한 서비스에 대한 로그인 자격 증명은 일반적으로 초기 온보딩 이메일에 제공되지만 필요한 경우 Liferay Cloud Console에 있을 수 있습니다.

## 로그인 자격 증명 찾기

1. _infra_ 환경으로 이동합니다.
1. 왼쪽 메뉴에서 _서비스_ 을 클릭합니다.
1. _ci_ 서비스를 선택합니다.
1. _환경 변수_ 탭을 클릭합니다.
1. `JENKINS_CUSTOMER_PASSWWORD` 옆에 있는 _표시_ 아이콘을 클릭하여 암호를 검색합니다.
1. `JENKINS_CUSTOMER_USER_NAME` 옆에 있는 _표시_ 아이콘을 클릭하여 사용자 이름을 검색합니다.

![웹 서버](./logging-into-your-liferay-cloud-services/images/01.png)

## 로그인

1. 선택한 환경(_dev_, _prd_등)으로 이동합니다.

1. 페이지 상단의 *사이트* 방문 드롭다운 메뉴를 클릭합니다.

    ![사이트 방문 드롭다운에는 환경의 Liferay 인스턴스에 대해 사용 가능한 모든 엔드포인트가 나열됩니다.](./logging-into-your-liferay-cloud-services/images/02.png)

    드롭다운 메뉴에는 기본 `webserver` 서비스 엔드포인트와 환경에 추가한 사용자 지정 도메인을 포함하여 액세스할 수 있는 `liferay` 서비스에 사용 가능한 모든 엔드포인트가 나열됩니다.

1. 해당 URL로 Liferay 인스턴스에 액세스하려면 원하는 끝점을 클릭하십시오.

1. 메시지가 표시되면 Liferay Cloud [Jenkins 사용자 이름과 암호](#locating-login-credentials) 을 입력합니다.

    ![인증](./logging-into-your-liferay-cloud-services/images/03.png)

1. 이렇게 하면 사용자가 Liferay DXP 7.x 인스턴스(이 예에서는 Liferay DXP 7.2 GA1)로 리디렉션됩니다.

    ![Liferay DXP 7.2 GA1 로그인](./logging-into-your-liferay-cloud-services/images/04.png)

### 기본 서비스 URL 찾기

서비스 페이지로 이동하고 페이지 상단에 있는 `webserver` 로고(URL로 확장됨)를 클릭하여 기본 `webserver` 엔드포인트의 URL을 찾을 수도 있습니다.

![서비스에 적용 가능한 경우 서비스 이름의 로고가 클릭 가능한 URL로 확장됩니다.](./logging-into-your-liferay-cloud-services/images/05.png)

이 방법을 통해 Liferay에 액세스할 때 [Jenkins 로그인 자격 증명](#locating-login-credentials) 이 여전히 필요합니다.

비슷한 단계에 따라 Jenkins CI 웹 인터페이스에 액세스할 수 있습니다. `infra` 환경에서 `ci` 서비스로 이동하여 Jenkins URL을 찾습니다.

![CI 서비스에는 Jenkins CI 웹 인터페이스에 사용할 수 있는 URL도 있습니다.](./logging-into-your-liferay-cloud-services/images/06.png)

## 추가 정보

* [Liferay DXP 서비스 사용](../using-the-liferay-dxp-service.md)
* [지속적인 통합](../platform-services/continuous-integration.md)
* [웹 서버 서비스](../platform-services/web-server-service.md)
