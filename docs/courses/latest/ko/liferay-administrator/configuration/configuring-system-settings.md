# 시스템 설정 구성

{bdg-secondary}`LXC-SM 또는 자체 호스팅`

시스템 설정은 인스턴스, 사이트 또는 위젯 전체에 적용됩니다. 여기에서 지정한 설정은 전체 환경에 적용됩니다. 이들 중 일부는 낮은 범위에서 변경할 수 없으며(예: 바이러스 백신 구성) 일부는 낮은 범위에서 재정의할 수 있는 기본값이 됩니다. 자세한 내용은 [시스템 설정](https://learn.liferay.com/ko/w/dxp/system-administration/configuring-liferay/system-settings) 을 참조하세요.

### LXC의 시스템 설정

LXC에서는 시스템 설정에 접근할 수 없습니다. 시스템 설정을 구성하려면 Liferay Cloud 지원팀에 문의하세요.

### LXC-SM 및 자체 호스팅의 시스템 설정

Liferay는 오픈 소스 바이러스 백신 솔루션인 [ClamAV](https://www.clamav.net/) 을 지원합니다. 시스템 설정에서 ClamAV 바이러스 백신 소프트웨어를 구성할 수 있습니다.

```{note}
Liferay 환경에서 사용하려는 플랫폼에 ClamAV를 설치하고 실행하려면 [ClamAV 설명서](https://docs.clamav.net/) 를 따르세요.
```

1. **글로벌 메뉴로 이동**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **시스템 설정** .

1. 보안에서 **바이러스 백신** 클릭하세요.

1. 왼쪽 탐색에서 **Antivirus Clamd Scanner** 을 클릭합니다.

1. 설정을 입력하세요.

   * 호스트 이름 또는 IP 주소 - ClamAV 서비스를 실행하는 서버 이름 또는 주소입니다.
   * 포트 - ClamAV 서비스의 포트 번호입니다.
   * 소켓 연결 SO 시간 초과 시간 - 연결이 유효하지 않게 된 후의 시간(밀리초)입니다.

   ![ClamAV 환경의 설정을 입력하세요.](./configuring-system-settings/images/01.png)

1. **업데이트** 을 클릭합니다. 이제 Liferay 환경은 ClamAV를 사용하여 업로드된 파일을 검사합니다. 이것이 어떻게 작동하는지 보려면 아래의 관련 개념을 참조하세요.

다음 단계는 [가상 인스턴스 구성](./configuring-virtual-instances.md)입니다.

## 관련 개념

* [시스템 설정](https://learn.liferay.com/ko/w/dxp/system-administration/configuring-liferay/system-settings)
* [업로드된 파일에 대한 바이러스 백신 검사 활성화](https://learn.liferay.com/ko/w/dxp/system-administration/file-storage/enabling-antivirus-scanning-for-uploaded-files)
