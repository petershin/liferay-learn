# PunchOut2Go에 대한 Liferay Commerce 커넥터

> 요구되는 기부금

Liferay는 사용자의 기존 PunchOut2Go 인프라와 상거래 통합을 가능하게 하는 PunchOut2Go 커넥터를 제공합니다. 이 커넥터는 [Liferay 도움말 센터](http://customer.liferay.com/downloads) 에서 LPKG 파일로 다운로드할 수 있습니다. <!--!\[Punch Out Flow Diagram\](./liferay-commerce-connector-to-punchout2go/images/01.png) --> ```{important}
PunchOut2Go 커넥터에는 Liferay Commerce 2.1.2 및 Liferay DXP 7.1 FP18+ 또는 7.2 FP6+가 필요합니다.
```

## PunchOut2Go 커넥터 배포

PunchOut2Go 커넥터를 배포하기 전에 충돌을 방지하기 위해 Commerce가 이미 Liferay 서버에 배포되었는지 확인하십시오. 그런 다음 다음 단계에 따라 PunchOut2Go LPKG 커넥터를 배포합니다.

1. [Liferay 도움말 센터](http://customer.liferay.com/downloads)에서 *Commerce Connector를 PunchOut2Go* 로 다운로드하십시오.

1. *PunchOut2Go 커넥터* `LPKG` [`${liferay.home}/deploy`]([Liferay Home](https://learn.liferay.com/dxp/latest/ko/installation-and-upgrades/reference/liferay-home.html)) 폴더에 복사합니다.

1. 애플리케이션 서버 콘솔에 다음 메시지가 표시되는지 확인합니다.

    ```
    2020-07-24 22:10:01.924 INFO  [fileinstall-/../../liferay-portal-7.1.10.1-sp1/osgi/marketplace][LPKGArtifactInstaller:209] The portal instance needs to be restarted to complete the installation of file:/../../liferay-portal-7.1.10.1-sp1/osgi/marketplace/Liferay%20Commerce%20Connector%20to%20PunchOut2Go%20-%20API.lpkg
    2020-07-24 22:10:01.926 INFO  [fileinstall-../../liferay-portal-7.1.10.1-sp1/osgi/marketplace][LPKGArtifactInstaller:209] The portal instance needs to be restarted to complete the installation of file:/../../liferay-portal-7.1.10.1-sp1/osgi/marketplace/Liferay%20Commerce%20Connector%20to%20PunchOut2Go%20-%20Impl.lpkg`
    ```

1. 애플리케이션 서버를 다시 시작하십시오.
<!-- 1. Verify that the following message displays in the application server console:

    ```
     [Success message]
    ```
-->
서버가 다시 시작되면 커넥터가 활성화되고 구성할 준비가 됩니다.

## 커넥터 구성

PunchOut2Go 커넥터는[채널](../../store-management/channels/introduction-to-channels.md) 기준으로 구성됩니다.

사용자는 상점 카탈로그 페이지의 URL을 가지고 있어야 합니다. 이 예에서: `http://localhost:8080/web/everest.com/catalog`.

1. _제어판_ &rarr; _상거래_ &rarr; _채널_로 이동합니다.
1. 원하는 채널을 클릭하세요.
1. _펀치 아웃_ 탭을 클릭합니다.
1. 토글을 _Enabled_로 전환하십시오.
1. 펀치 아웃 시작 URL을 입력합니다.
1. 완료되면 _저장_ 클릭합니다.

### 자동 로그인 펀치 아웃 액세스 토큰 활성화

사용자는 Liferay Commerce 인스턴스에 대한 액세스를 활성화하려면 구매자의 조달 시스템에 대한 Punch Out 액세스 토큰을 활성화해야 합니다. 토큰을 활성화하려면:

1. _제어판_ &rarr; _구성_ &rarr; _시스템 설정_으로 이동합니다.
1. _보안_에서 _API 인증_ 클릭합니다.

    ![인증](./liferay-commerce-connector-to-punchout2go/images/02.png)

1. 왼쪽 메뉴에서 _자동 로그인 펀치 아웃 액세스 토큰_ 클릭합니다.
1. _활성화됨_ 확인란을 선택합니다.

    ![자동 로그인 액세스 토큰을 활성화합니다.](./liferay-commerce-connector-to-punchout2go/images/03.png)

1. _업데이트_ 버튼을 클릭합니다.

자동 로그인 _펀치 아웃_ 토큰이 활성화되고 이제 구매자의 조달 시스템에 로그인할 수 있습니다.

### 펀치 아웃 액세스 토큰 제공자 설정

펀치 아웃 액세스 토큰이 활성화되면 사용자는 펀치 아웃 액세스 토큰 공급자를 구성할 수 있습니다. 특히 토큰의 지속 기간과 토큰의 크기를 설정할 수 있습니다. 아래 단계를 따르십시오.

1. _제어판_ &rarr; _구성_ &rarr; _시스템 설정_으로 이동합니다.
1. _보안_아래에서 _OAuth2_ 클릭하십시오.
1. 다음을 입력:

    * **액세스 토큰 기간**:
    * **액세스 토큰 크기**:

    ![자동 로그인 액세스 토큰을 활성화합니다.](./liferay-commerce-connector-to-punchout2go/images/04.png)

1. 완료되면 _저장_ 클릭합니다.

자동 로그인 _펀치 아웃_ 토큰이 구성됩니다.

## 펀치 아웃 구매자 역할 만들기

모범 사례로 사용자는 Punch Out을 사용하여 공급업체에 대한 역할을 생성해야 합니다. 상거래 역할에 대한 자세한 내용은 [상거래 역할](../../users-and-accounts/roles-and-permissions/commerce-roles-reference.md)을 참조하십시오. DXP의 역할 및 권한에 대한 자세한 내용은 [역할 및 권한 이해]([ロールと権限について](https://learn.liferay.com/w/dxp/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions))참조하십시오.

1. _제어판_ → _사용자_ → _역할_로 이동합니다.
1. _사이트 역할_ 탭을 클릭합니다.
1. _사이트 역할 추가_ 버튼을 클릭합니다.
1. 다음을 입력:
    * **이름**: 펀치 아웃 벤더.
1. _저장_클릭합니다.
1. _권한 정의_클릭합니다.
1. 왼쪽 메뉴에서 _사이트 관리_ 확장합니다.
1. _애플리케이션_ &rarr; _카트 열기_로 이동합니다.
1. 다음 상자를 선택합니다(최소한).

    * **오픈 오더 결제**
    * **오픈 오더 보기**

    ![펀치 아웃 역할 권한](./liferay-commerce-connector-to-punchout2go/images/05.png)

1. 완료되면 _저장_ 클릭합니다.

필요한 최소 권한으로 역할이 생성되었습니다. Punch Out을 사용하는 구매자에게 이 역할을 할당합니다.

## 구매자의 조달 시스템으로 리디렉션 확인

PunchOut2Go에 대한 커넥터가 활성화된 체크아웃 프로세스는 동일한 방식으로 발생합니다. 사용자가 _제출_ 클릭하면 적절한 조달 시스템으로 리디렉션됩니다.

![주문이 제출되면 펀치 아웃 리디렉션.](./liferay-commerce-connector-to-punchout2go/images/06.png)

## 관련 주제

* [기존 Liferay 설치에 Liferay Commerce 배포](../../installation-and-upgrades/installing-commerce-2-1-and-below/deploying-liferay-commerce-to-an-existing-liferay-installation.md)
* [Liferay Commerce Enterprise 활성화](../../installation-and-upgrades/activating-liferay-commerce-enterprise.md)
* [PunchOut2Go 참조 가이드에 대한 Liferay Commerce 커넥터](./liferay-commerce-connector-to-punchout2go-reference-guide.md)
