# 업로드된 파일에 대한 바이러스 백신 검사 활성화

> 사용 가능: DXP 7.3 SP 1+, Portal 7.3 GA7+ 및 DXP 7.2 FP 9+

```{note}
이 기능은 현재 Portal 7.2 및 이전 버전에서 사용할 수 없습니다.
```

<!-- TODO: LRDOCS-9341 - Antivirus can be enabled for older versions (7.2 and below) but requires use of portal properties and a local install of ClamAV server which we do not recommend. -->

바이러스에 대해 Liferay에 업로드된 모든 파일을 자동으로 검사할 수 있습니다. 바이러스 백신 스캐너를 활성화하면 [문서 및 미디어](../../content-authoring-and-management/documents-and-media.md) , [Message Boards](../../collaboration-and-social/message-boards/user-guide/getting-started-with-message-boards.md)등과 같은 Liferay 애플리케이션에 업로드할 때 파일을 확인합니다. 바이러스가 발견되면 사용자가 거부하도록 보고됩니다.

![스캐너는 문서 및 미디어 및 기타 Liferay 응용 프로그램에 업로드할 때 바이러스에 감염된 파일을 감지합니다.](./enabling-antivirus-scanning-for-uploaded-files/images/01.png)

Liferay는 [ClamAV Daemon](https://www.clamav.net/documents/scanning#clamd) (Clamd)과 통합됩니다. 최상의 성능을 위해 별도의 서버에서 Clamd를 실행하십시오.

바이러스 백신 검사를 활성화하는 방법은 다음과 같습니다.

1. 별도의 서버에서 [Clamd](https://www.clamav.net/documents/scanning#clamd) 을 구성하고 시작합니다.

    ```{important}
    Clamd를 시작하기 전에 ClamAV 데이터베이스를 로드하십시오.
    ```

1. 다음 [포털 속성](../../installation-and-upgrades/reference/portal-properties.md) 또는 [Docker 환경 변수](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md)를 설정하여 [파일 저장소](../../system-administration/file-storage.md) (문서 라이브러리)에 대한 바이러스 백신을 활성화합니다.

    포털 속성:

    ```properties
    dl.store.antivirus.enabled=true
    ```

    도커 환경 변수:

    ```properties
    -e LIFERAY_DL_PERIOD_STORE_PERIOD_ANTIVIRUS_PERIOD_ENABLED=true
    ```

1. Liferay 서버를 시작하십시오.

1. **제어판** &rarr; **시스템 설정** 로 이동하여 보안 카테고리에서 **안티바이러스** 을 선택합니다.

1. 메뉴에서 **Antivirus Clamd Scanner** 을 선택합니다.

    ![바이러스 백신 Clamd 스캐너 구성](./enabling-antivirus-scanning-for-uploaded-files/images/02.png)

1. Clamd 서버의 호스트 이름 또는 IP 주소, 포트 및 연결 제한 시간(밀리초)을 입력합니다.

1. **저장** 을 클릭합니다.

이제 파일을 Liferay 애플리케이션에 업로드할 때 스캔합니다. 업로드 중인 파일에서 바이러스가 감지되면 스캐너는 감염된 파일을 보고하므로 파일 저장을 거부해야 합니다.

![다음은 바이러스 탐지 메시지입니다.](./enabling-antivirus-scanning-for-uploaded-files/images/03.png)

```{important}
바이러스에 감염된 파일은 절대 저장하지 마세요. 현재 작업을 취소하여 파일을 거부합니다.
```

## 관련 주제

* [파일 스토리지](../file-storage.md)
* [Liferay 구성](../configuring-liferay.md)
* [시스템 설정](../configuring-liferay/system-settings.md)