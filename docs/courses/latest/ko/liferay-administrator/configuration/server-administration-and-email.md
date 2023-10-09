# 서버 관리 및 이메일

서버 관리 콘솔에서 Liferay 인스턴스를 관리하고 모니터링할 수 있습니다. 예를 들어 현재 시스템 또는 포털 속성을 보거나 로깅 및 로그 수준을 구성할 수 있습니다. 여기에서는 전체 시스템에 대한 이메일 서버를 구성할 수도 있습니다. 자세한 내용은 [서버 관리 패널 사용](https://learn.liferay.com/en/w/dxp/system-administration/using-the-server-administration-panel) 참조하십시오.

이메일 알림(예: 사용자 등록, 비밀번호 관리 등)에 사용되는 메일 서버를 구성합니다. Delectable Bonsai의 메일 서버를 구성하려면 아래 단계를 따르세요.

### LXC에서 메일 구성

아직 구성되지 않은 경우 Liferay Cloud 지원 담당자에게 문의하세요.

### LXC-SM 또는 자체 호스팅에서 메일 구성

실제로는 Liferay에서 사용할 수 있는 메일 서버가 이미 있습니다. 여기서는 하나를 시뮬레이션해 보겠습니다.

1. [FakeSMTP](http://nilhcem.com/FakeSMTP/)다운로드.

1. 파일의 압축을 풉니다. 다음 명령을 사용하여 FakeSMTP 메일 서버를 시작합니다.

   `java -jar fakeSMTP-2.0.jar`

1. 청취 포트를 `2525` 로 설정하고 _서버 시작_클릭하십시오.

   Docker 컨테이너를 사용하는 경우 실행 명령에 다음 env 변수를 포함해야 합니다.

   ```properties
   --env LIFERAY_MAIL_PERIOD_SESSION_PERIOD_MAIL_PERIOD_SMTP_PERIOD_PORT=2525 \
   --env LIFERAY_MAIL_PERIOD_SESSION_PERIOD_MAIL_PERIOD_SMTP_PERIOD_HOST=172.17.0.1 \
   ```


1. Liferay에서 _전역 메뉴_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _서버 관리_로 이동합니다. _메일_ 탭을 클릭합니다.

1. 다음 구성을 설정합니다.

   * 수신 POP 서버: `localhost`
   * 들어오는 포트: `110`
   * 보안 네트워크 연결 사용: 선택됨
   * 사용자 이름: `support@delectablebonsai.com`
   * 비밀번호: `학습`
   * 발신 SMTP 서버: `localhost`
   * 나가는 포트: `2525`
   * 보안 네트워크 연결 사용: 선택됨
   * 사용자 이름: `support@delectablebonsai.com`
   * 비밀번호: `학습`

   ![메일 서버에 대한 설정을 입력합니다.](./server-administration-and-email/images/01.png)

   _저장_클릭하세요.

1. _글로벌 메뉴로 이동_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _인스턴스 설정_. _이메일_클릭하세요.

1. 왼쪽 탐색 메뉴에서 _이메일 보낸 사람_클릭합니다. 아래 옵션을 설정하세요.

   * 이름: `지원`
   * 주소: `support@delectablebonsai.com`

   _저장_클릭하세요.

1. _글로벌 메뉴로 이동_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _사용자 및 조직_. _사용자 추가_ (![Add icon](../../images/icon-add.png))을 클릭합니다.

1. 다음 계정 정보를 입력하세요.

   * 화면 이름: `앨런`
   * 이메일 주소: `alan@delectablebonsai.com`
   * 이름: `앨런`
   * 성: `아담스`
   * 직위: `영업 & 마케팅 관리자`

   _저장_클릭하세요.

1. Liferay가 Alan Adams에게 환영 이메일을 보냈습니다.

   ![Liferay에서 환영 이메일을 보냈습니다.](./server-administration-and-email/images/02.png)

이제 Liferay 환경이 메일 서버로 구성되었습니다. 메일을 추가로 사용자 정의하여 각 인스턴스에 대해 다양한 이메일 발신자와 메시지를 구성할 수 있습니다. 자세한 내용은 [인스턴스 이메일 설정](https://learn.liferay.com/en/w/dxp/system-administration/configuring-liferay/virtual-instances/email-settings) 을 참조하세요.

## 관련 개념

- [서버 관리 패널 사용](https://learn.liferay.com/en/w/dxp/system-administration/using-the-server-administration-panel)
- [메일 구성](https://learn.liferay.com/en/w/dxp/installation-and-upgrades/setting-up-liferay/configuring-mail)
- [이메일 설정](https://learn.liferay.com/en/w/dxp/system-administration/configuring-liferay/virtual-instances/email-settings)
