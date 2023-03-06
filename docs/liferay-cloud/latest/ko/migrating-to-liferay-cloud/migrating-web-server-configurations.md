# 5단계: 웹 서버 구성 마이그레이션

이제 Liferay 구성 및 사용자 지정이 Liferay Cloud에 배포되었으므로 다음 단계는 웹 서버 구성을 마이그레이션하는 것입니다. 여기에는 웹 서버를 Nginx(필요한 경우)로 마이그레이션하고 모든 Nginx 구성 파일 및 사용자 정의(셸 스크립트 및 정적 콘텐츠)를 Liferay Cloud 환경에 배포하는 작업이 포함됩니다.

## 웹 서버를 Nginx로 마이그레이션

Liferay Cloud는 웹 서버용 Nginx만 지원합니다. 아직 Nginx를 사용하고 있지 않다면 먼저 웹 서버와 구성을 Nginx로 마이그레이션하십시오. 자세한 내용은 [Nginx 사이트](http://nginx.org/en/docs/beginners_guide.html) 을 참조하십시오.

```{tip}
Nginx로 마이그레이션하는 데 도움이 필요한 경우 [Liferay 클라우드 지원](https://help.liferay.com/hc/en-us) 에 문의하십시오.
```

## Nginx 구성 구성

다음으로 Nginx 구성을 리포지토리로 이동하여 Liferay Cloud에 배포할 수 있습니다.

```{note}
구성할 특정 Nginx 구성이 없는 경우 이 단계를 건너뜁니다.
```

[이전에 복제한] 프로젝트 리포지토리에서(./matching-dxp-versions.md#clone-the-liferay-cloud-repository) `webserver/configs/{ENV}/` 폴더로 이동합니다. Liferay Cloud 환경), 다음 패턴에 따라 모든 Nginx 구성 파일을 적절한 환경 폴더에 넣습니다.

* Nginx 구성(`.conf`) 파일을 `webserver/configs/{ENV}/conf.d/`에 넣습니다.
* `var/www/html/` 디렉토리에 대한 재정의를 `webserver/configs/{ENV}/public/`에 넣습니다.
* 다른 재정의( `/etc/nginx/` 디렉토리용)를 `webserver/configs/{ENV}/`에 넣습니다.

```{tip}
`webserver/configs/common/` 폴더에 있는 모든 파일은 배포 시 모든 환경에 적용됩니다.
```

자세한 내용은 [웹 서버 서비스 구성](../platform-services/web-server-service.md#configurations) 을 참조하십시오.

```{tip}
Nginx 구성 파일의 모양을 보려면 예제 구성 [here](../reference/example-configuration-files.md#web-server-service-configuration-nginx-conf) 을 참조하십시오.
```

## 웹 서버 사용자 정의 구성

```{note}
웹 서버에 대한 이러한 사용자 지정 셸 스크립트 또는 정적 콘텐츠가 없는 경우 이 단계를 건너뜁니다.
```

Liferay Cloud 프로젝트 리포지토리에서 모든 사용자 지정 셸 스크립트를 적절한 각 `webserver/configs/{ENV}/scripts/` 환경 폴더에 넣습니다.

모든 정적 콘텐츠를 적절한 각 `webserver/configs/{ENV}/public/` 환경 폴더에 넣습니다.

모든 사용자 지정 콘텐츠를 리포지토리로 정리하면 Liferay Cloud 환경에 변경 사항을 배포할 준비가 된 것입니다.

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
    git commit -m "Liferay Cloud Migration Stage 5"
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

    ![빌드의 작업 메뉴를 사용하여 배포합니다.](./migrating-web-server-configurations/images/01.png)

1. 빌드를 배포할 환경을 선택합니다(예: `acme-dev`).

1. 아래 정보를 읽고 확인 상자를 선택하여 배포 결과를 확인합니다.

    ![확인란을 선택하고 준비가 되면 빌드를 배포합니다.](./migrating-web-server-configurations/images/02.png)

1. **빌드** 배포 를 클릭합니다.

빌드가 선택한 환경에 배포되고 `webserver` 서비스가 다시 시작되면 Nginx 구성 및 사용자 지정이 선택한 환경에 적용됩니다.

## 다음 단계

이제 웹 서버 구성을 Liferay Cloud 환경으로 마이그레이션하는 작업을 마쳤습니다. 다음으로 [Elasticsearch 구성](./migrating-search-configurations.md)을 마이그레이션합니다.
