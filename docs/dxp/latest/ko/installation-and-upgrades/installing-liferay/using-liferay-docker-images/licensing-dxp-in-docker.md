# Docker에서 DXP 라이센싱

만료 예정인 DXP 평가판 라이선스를 사용 중이거나 설치해야 하는 새 라이선스(활성화 키)가 있는 경우 컨테이너의 기존 라이선스를 교체할 수 있습니다.

다음은 라이센스 만료 로그 메시지의 예입니다.

```
ERROR [fileinstall-directory-watcher][LicenseManager:?] DXP Development license is expired
```

```{note}
각 DXP Docker 이미지에는 이미지가 생성된 후 한 달 후에 만료되는 임시 평가판 라이선스(`trial-dxp-license-[id-number])가 포함되어 있습니다.
```

라이센스를 교체하는 방법은 다음과 같습니다.

1. 컨테이너에서 Bash 셸을 엽니다.

    ```bash
    docker exec -it [container] bash
    ```

1. 기존 라이선스 파일을 제거합니다.

    ```bash
    rm /opt/liferay/data/license/*
    ```

1. OSGi 모듈 폴더에서 모든 평가판 라이센스 및 활성화 키 파일을 제거하십시오.

    ```bash
    rm /opt/liferay/osgi/modules/*license*.xml /opt/liferay/osgi/modules/*activation*.xml
    ```

1. Bash 셸을 종료합니다.

    ```bash
    exit
    ```

1. 새 라이선스/키 파일을 컨테이너에 복사합니다.

    ```bash
    docker cp [license file] [container]:/opt/liferay/deploy
    ```

    또는 [바인드 마운트](./providing-files-to-the-container.md) 을 컨테이너와 연결한 경우 라이선스/키 파일을 `/mnt/liferay/deploy`에 매핑된 폴더에 복사할 수 있습니다.

    자세한 내용은 [컨테이너](./providing-files-to-the-container.md) 에 파일 제공을 참조하십시오.

DXP는 라이선스 설치를 기록합니다. 예를 들어,

```
INFO  [fileinstall-directory-watcher][LicenseManager:?] License registered for DXP Development
INFO  [com.liferay.portal.kernel.deploy.auto.AutoDeployScanner][AutoDeployDir:?] Processing trial-dxp-license-123.xml
INFO  [fileinstall-directory-watcher][LicenseManager:?] DXP Development license validation passed
INFO  [fileinstall-directory-watcher][LicenseManager:?] License registered for DXP Development
```

DXP 라이선스 업데이트를 축하합니다!

## 추가 정보

* [Liferay DXP 활성화](../../setting-up-liferay/activating-liferay-dxp.md)
* [컨테이너에 파일 제공](./providing-files-to-the-container.md)
* [새 Docker 이미지로 업그레이드](./upgrading-to-a-new-docker-image.md)