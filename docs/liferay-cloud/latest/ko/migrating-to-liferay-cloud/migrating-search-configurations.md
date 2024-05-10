# 6단계: 검색 구성 마이그레이션

이제 웹 서버 구성이 Liferay Cloud에 배포되었으므로 마이그레이션의 다음 단계는 검색 구성을 마이그레이션하는 것입니다. 여기에는 검색 엔진을 Elasticsearch로 마이그레이션하고(필요한 경우) 모든 Elasticsearch 구성 파일 및 플러그인을 Liferay Cloud 환경에 배포하는 작업이 포함됩니다.

## 검색 엔진을 Elasticsearch로 마이그레이션

온프레미스 환경에서 Elasticsearch를 사용하지 않는 경우 계속하기 전에 Elasticsearch로 마이그레이션하십시오.

Elasticsearch로 마이그레이션하려면 Liferay 설치를 설치한 다음 여기에 연결해야 합니다. 자세한 내용은 [Elasticsearch 시작하기](https://learn.liferay.com/w/dxp/using-search/installing-and-upgrading-a-search-engine/elasticsearch/getting-started-with-elasticsearch) 을 참조하십시오.

```{tip}
Elasticsearch로 마이그레이션하는 데 도움이 필요한 경우 [Liferay Cloud 지원](https://help.liferay.com/hc/en-us) 에 문의하십시오.
```

## 구성 및 셸 스크립트 구성

```{note}
구성할 특정 Elasticsearch 구성 또는 스크립트가 없는 경우 이 단계를 건너뜁니다.
```

[이전에 복제한](./matching-dxp-versions.md#clone-the-liferay-cloud-repository) 프로젝트 리포지토리에서 `search/configs/{ENV}/` 폴더(Liferay Cloud 환경에 해당)로 이동하고 모든 Elasticsearch 구성 파일과 셸 스크립트를 적절한 환경 폴더에 넣습니다. , 다음 패턴을 따릅니다.

* Elasticsearch 구성 파일을 `search/configs/{ENV}/config/`에 넣습니다.
* 모든 사용자 지정 셸 스크립트를 `search/configs/{ENV}/scripts/`에 넣습니다.

해당 폴더의 모든 사용자 지정 셸 스크립트는 `검색` 서비스가 재배포될 때마다 실행됩니다.

```{tip}
Elasticsearch 구성 파일의 모양을 보려면 예제 구성 [여기](../reference/example-configuration-files.md#search-service-configuration-elasticsearch-yml) 을 참조하십시오.
```

## 추가 검색 플러그인 추가

```{note}
추가할 추가 플러그인이 없으면 이 단계를 건너뜁니다.
```

먼저 기본적으로 Liferay Cloud에 이미 설치된 플러그인 목록을 검토합니다.

1. Liferay Cloud 환경에서 프로덕션(`prd`) 환경으로 이동합니다.

    ![콘솔 화면 상단의 드롭다운을 사용하여 프로덕션 환경으로 이동합니다.](./migrating-search-configurations/images/01.png)

    프로덕션 환경에는 사전 설치된 모든 Elasticsearch 플러그인이 포함되어 있습니다.

1. `검색` 서비스로 이동하고 `Shell` 탭을 클릭합니다.

1. 셸에서 다음 명령을 실행합니다.

    ```bash
    bin/elasticsearch-plugin list
    ```

셸은 명령을 실행할 때 사전 설치된 모든 Elasticsearch 플러그인을 나열합니다.

나열되지 않은 추가 검색 플러그인이 있는 경우 Liferay Cloud 프로젝트의 리포지토리에 추가하십시오.

1. 리포지토리에서 `search/LCP.json` 파일을 엽니다.

1. 사전 설치된 플러그인에 추가해야 하는 쉼표로 구분된 검색 플러그인 목록과 함께 `LCP_SERVICE_SEARCH_ES_PLUGINS` 이라는 [환경 변수](../reference/defining-environment-variables.md) 을 추가합니다.

    예를 들어 `analysis-kuromoji` 플러그인을 설치하려면 다음 환경 변수를 추가합니다.

    ```
    "env: {
        "LCP_SERVICE_SEARCH_ES_PLUGINS": "analysis-kuromoji"
    }
    ```

## 빌드 생성 및 배포

그런 다음 이러한 변경 사항이 포함된 빌드를 생성하고 배포하여 Liferay Cloud 환경에 적용합니다.

### 변경 사항으로 Jenkins 빌드 생성

Git 명령을 실행하여 Git이 설치된 터미널을 사용하여 변경 사항을 제출하십시오.

1. 변경된 파일을 Git에 추가합니다.

    ```bash
    git add .
    ```

1. 변경 사항과 메시지를 커밋합니다.

    ```bash
    git commit -m "Liferay Cloud Migration Stage 6"
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

    ![빌드의 작업 메뉴를 사용하여 배포합니다.](./migrating-search-configurations/images/02.png)

1. 빌드를 배포할 환경을 선택합니다(예: `acme-dev`).

1. 아래 정보를 읽고 확인 상자를 선택하여 배포 결과를 확인합니다.

    ![확인란을 선택하고 준비가 되면 빌드를 배포합니다.](./migrating-search-configurations/images/03.png)

1. **빌드** 배포 를 클릭합니다.

빌드가 선택한 환경에 배포되고 `검색` 서비스가 다시 시작되면 Elasticsearch 구성, 셸 스크립트 및 플러그인이 선택한 환경에 적용됩니다.

## 다음 단계

이제 Elasticsearch 구성을 Liferay Cloud 환경으로 마이그레이션하는 작업을 완료했습니다. 다음으로 [VPN 서버 구성 및 연결](./connecting-the-vpn.md)을 수행합니다.