# 4단계: DXP 구성 및 사용자 지정 마이그레이션

이제 데이터베이스 및 문서 라이브러리가 Liferay Cloud 환경에 적용되었으므로 마이그레이션의 다음 단계는 온프레미스 Liferay 설치 구성 및 사용자 지정 코드를 마이그레이션하는 것입니다. 여기에는 배포 전에 속성 파일, OSGi 구성, 사용자 정의 모듈, 테마 및 WAR 파일을 적절한 폴더로 구성하는 작업이 포함됩니다.

## 구성 파일 구성

먼저 마이그레이션하려는 온프레미스 설치에서 Liferay 구성 파일을 구성합니다. 여기에는 사용 중인 [개의 포털 속성 파일](../customizing-liferay-dxp-in-the-cloud/configuring-the-liferay-dxp-service.md#portal-properties) 이 포함됩니다.

```{tip}
Liferay 관련 코드는 [Liferay DXP 작업 영역](https://learn.liferay.com/dxp/latest/en/developing-applications/tooling/liferay_workspace.html) 과 같이 구성된 'liferay' 폴더에 속합니다.
```

이전에 복제한 Liferay Cloud 프로젝트 리포지토리에서 [](./matching-dxp-versions.md#clone-the-liferay-cloud-repository) liferay/configs/ `/{ENV}폴더(Liferay Cloud 환경에 해당)로 이동하고` 모든 `
포털 속성 <a href="../customizing-liferay-dxp-in-the-cloud/configuring-the-liferay-dxp-service.md#portal-properties">파일(예:</a> portal-ext.properties`) 각각의 적절한 환경 폴더에 넣습니다.

[OSGi 구성](../customizing-liferay-dxp-in-the-cloud/configuring-the-liferay-dxp-service.md#osgi-configurations) 파일(예: `.cfg` 또는 `.config` 파일)을 `osgi/`이라는 적절한 환경 폴더의 하위 폴더에 넣습니다.

예를 들어 `dev` 환경의 경우 포털 속성 파일을 `liferay/configs/dev`에 넣고 OSGi 구성 파일을 `liferay/configs/dev/osgi/`에 넣습니다.

```{tip}
`liferay/configs/common/` 폴더에 있는 모든 파일은 배포 시 모든 환경에 적용됩니다.
```

변경 사항이 배포되면 `liferay/configs/` 환경 폴더에 있는 모든 포털 속성 파일이 해당 환경의  `liferay` 서비스 컨테이너 내의 `$LIFERAY_HOME` 폴더에 자동으로 복사됩니다. OSGi 속성은 자동으로 `$LIFERAY_HOME/osgi/configs/` 폴더에 복사됩니다.

## OSGi 모듈 구성

온프레미스 Liferay 설치에 사용되는 사용자 정의 OSGi 모듈이 있는 경우 모든 [OSGi 서비스 재정의](https://learn.liferay.com/dxp/latest/ko/liferay-internals/extending-liferay/overriding-osgi-services.html) 을 적절한 환경의 `liferay/modules/{ENV}/` 폴더(동일한 작업 공간 폴더 구조 포함)에 넣습니다.

변경 사항이 배포되면 사용자 정의 모듈 코드가 자동으로 컴파일된 다음 `liferay` 서비스 컨테이너의 `$LIFERAY_HOME/deploy/` 폴더에 배포됩니다.

## 사용자 지정 테마 구성

다음으로 모든 [환경 설정 및 테마 만들기](https://learn.liferay.com/dxp/latest/ko/site-building/site-appearance/themes/theme-development/getting-started/setting-up-an-environment-and-creating-a-theme.html) 의 소스 코드를 해당 환경의 `liferay/themes/{ENV}/` 폴더에 넣습니다.

변경 사항이 배포되면 사용자 지정 테마가 자동으로 빌드되어 `liferay` 서비스 컨테이너의 `$LIFERAY_HOME/deploy/` 폴더에 배포됩니다.

## WAR 파일 구성

다음으로 Liferay 설치의 [WAR 배포(WAB 생성기)](https://learn.liferay.com/dxp/latest/ko/building-applications/reference/deploying-wars-wab-generator.html) 을 모두 해당 환경의 `liferay/wars/{ENV}/` 폴더에 넣습니다.

변경 사항이 배포되면 적절한 환경에서 `liferay` 서비스 컨테이너 내의 `$LIFERAY_HOME/deploy/` 폴더에 WAR 파일이 자동으로 배포됩니다.

## 빌드 생성 및 배포

다음으로 이러한 변경 사항이 포함된 빌드를 생성하고 배포하여 Liferay Cloud 환경에 적용해야 합니다.

### 변경 사항으로 Jenkins 빌드 생성

Git 명령을 실행하여 Git이 설치된 터미널을 사용하여 변경 사항을 제출하십시오.

1. 변경된 파일을 Git에 추가합니다.

    ```bash
    git add .
    ```

1. 변경 사항과 메시지를 커밋합니다.

    ```bash
    git commit -m "Liferay Cloud Migration Stage 4"
    ```

1. GitHub에 변경 사항을 푸시합니다.

    ```bash
    git push origin master
    ```

프로젝트가 GitHub 리포지토리에 연결되어 있으므로 변경 사항을 푸시하면 자동으로 빌드가 생성됩니다. 진행하기 전에 빌드가 완료될 때까지 기다리십시오.

### 선택한 환경에 빌드 배포

마지막으로 [Liferay Cloud Console](https://console.liferay.cloud/) 을 사용하여 완성된 빌드를 선택한 환경에 배포합니다.

1. Liferay Cloud Console에서 빌드 페이지로 이동합니다(페이지 상단의 링크 사용).

1. 목록에서 이전에 생성한 빌드를 찾고 작업 메뉴에서 **Deploy build to** 을 클릭합니다.

    ![빌드의 작업 메뉴를 사용하여 배포합니다.](./creating-data-backup-files/images/01.png)

1. 빌드를 배포할 환경을 선택합니다(예: `acme-dev`).

1. 아래 정보를 읽고 확인 상자를 선택하여 배포 결과를 확인합니다.

    ![확인란을 선택하고 준비가 되면 빌드를 배포합니다.](./creating-data-backup-files/images/02.png)

1. **빌드** 배포 를 클릭합니다.

빌드가 선택한 환경에 배포되고 `liferay` 서비스가 다시 시작되면 Liferay 구성 및 사용자 지정이 선택한 환경에 적용됩니다.

## 다음 단계

이제 Liferay 구성 및 사용자 정의 마이그레이션을 완료했습니다. 다음으로 [웹 서버 구성](./migrating-web-server-configurations.md)을 마이그레이션합니다.
