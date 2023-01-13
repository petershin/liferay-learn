# 1단계: DXP 버전 일치

마이그레이션의 첫 번째 단계는 마이그레이션하려는 설치와 동일한 버전을 실행하도록 Liferay Cloud에서 실행되는 Liferay 서비스를 구성하는 것입니다.

이를 위해서는 Liferay Cloud 리포지토리를 복제하고 버전 변경을 구성한 다음 빌드를 배포하여 이러한 업데이트를 Liferay Cloud에 다시 적용해야 합니다.

## Liferay 버전 정보 찾기

먼저 마이그레이션하려는 Liferay DXP 설치의 버전 번호와 설치된 패치를 찾으십시오. Liferay Cloud에서 Liferay 서비스를 올바르게 구성하려면 이러한 값이 필요합니다.

이러한 값을 찾으려면 패치 도구를 사용하십시오.

1. [여기](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/maintaining-a-liferay-installation/reference/installing-the-patching-tool.html) 의 지침에 따라 마이그레이션하려는 설치에 패치 도구를 설치합니다.

1. 명령줄 도구를 사용하여 패치 도구 폴더로 이동합니다.

    ```bash
    cd $LIFERAY_HOME/patching-tool
    ```

1. 패치 도구를 사용하여 설치 버전 정보를 얻으십시오.

    ```bash
    ./patching-tool.sh info
    ```

패치 도구는 빌드 버전, 설치된 모든 수정 팩 및 핫픽스를 포함한 패치 및 버전 정보를 표시합니다.

![패치 도구는 Liferay 서비스를 구성하는 데 필요한 관련 정보를 표시합니다.](./matching-dxp-versions/images/01.png)

향후 단계를 위해 이 정보를 기록해 두십시오.

## Liferay 클라우드 리포지토리 복제

Liferay Cloud는 프로젝트와 함께 [GitHub](https://github.com/) 에 리포지토리를 제공합니다. 프로젝트의 일부 파일(예: 각 서비스의 [LCP.json 파일](../reference/configuration-via-lcp-json.md))을 구성하려면 리포지토리 복제본이 로컬에 있어야 합니다.

리포지토리를 아직 복제하지 않은 경우 Git이 설치된 [터미널](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) 을 사용하여 로컬로 복제합니다.

```bash
git clone https://github.com/dxpcloud/acme
```

## 리포지토리에서 Liferay DXP 이미지 업데이트

다음으로 이전에 복제한 저장소에서 [DXP 이미지를 업데이트](#clone-the-liferay-cloud-repository). 이를 위해서는 Liferay 설치 버전 정보와 호환되는 Docker 이미지를 찾아야 합니다.

1. Docker Hub에서 [Liferay DXP 이미지](https://hub.docker.com/r/liferay/dxp/tags) 페이지로 이동합니다.

1. *Filter Tags* 필드를 사용하여 [이전에 찾은](#find-liferay-version-information) 주 버전 및 수정 팩 번호를 사용하여 이미지 목록을 필터링합니다(예: `7.2.10- dxp-5`). 이 Docker 이미지 이름을 복사합니다.

     ![필터 태그 필드를 사용하여 Liferay DXP 이미지 목록을 찾고 있는 주 버전으로 좁힐 수 있습니다.](./matching-dxp-versions/images/02.png)

     ```{tip}
     여러 Docker 이미지를 찾은 경우 최신 일치 항목을 복사합니다. 최신순으로 정렬된 목록을 사용하면 이름에 타임스탬프가 추가된 경우에도 최신 Liferay DXP 이미지가 맨 위에 나열됩니다.
     ```

1. 리포지토리에서 `liferay/gradle.properties` 파일을 엽니다.

1. `liferay.workspace.docker.image.liferay` 값을 이전에 복사한 Docker 이미지 이름으로 설정합니다.

    예를 들어 Liferay DXP 이미지 이름이 `7.2.10-dxp-5`인 경우 `gradle.properties`에서 설정합니다.

    ```
    liferay.workspace.docker.image.liferay=liferay/dxp:7.2.10-dxp-5
    ```

이렇게 하면 Liferay Cloud 환경에서 올바른 버전의 Liferay DXP를 실행하여 데이터를 성공적으로 업로드할 수 있습니다.

## 리포지토리에서 Liferay 서비스 이미지 업데이트

다음으로 리포지토리에 있는 Liferay 서비스의 `LCP.json` 파일에서 Liferay 서비스 이미지를 업데이트합니다. 이를 위해서는 Liferay 설치 버전과 호환되는 최신 Docker 이미지를 찾아야 합니다.

1. Liferay Cloud의 [서비스 변경 로그](https://help.liferay.com/hc/en-us/sections/360006251311-Services-Changelog) 페이지로 이동합니다.

1. 목록 상단에서 최신 서비스 업데이트를 클릭합니다.

    ![최신 서비스 업데이트 링크를 클릭하여 환경을 최신 상태로 유지하십시오.](./matching-dxp-versions/images/03.png)

1. 페이지에 나열된 **Liferay** 서비스 이미지를 찾으십시오. 온프레미스 Liferay 설치의 *주 버전* 과 일치하는 이미지 이름을 복사합니다.

    ![나열된 Liferay 서비스 이미지에서 Liferay 설치의 주 버전과 일치하는 이미지를 선택합니다.](./matching-dxp-versions/images/04.png)

1. 리포지토리에서 `liferay/LCP.json` 파일을 엽니다.

1. `이미지` 필드의 값을 이전에 복사한 Docker 이미지 이름으로 설정합니다.

    예를 들어 Liferay 서비스 이미지 이름이 `liferaycloud/liferay-dxp:7.2-4.0.4`인 경우 `LCP.json`에서 다음과 같이 설정합니다.

    ```
    "image": "liferaycloud/liferay-dxp:7.2-4.0.4"
    ```

이렇게 하면 Liferay 서비스가 최신 버전이고 Liferay DXP 버전과 호환되는 버전을 사용할 수 있습니다.

## 핫픽스 정보 추가

CI 서비스의 `LCP.json` 파일에 [온프레미스 설치에 설치된 패치](#find-liferay-version-information)에 대한 핫픽스 정보도 추가해야 합니다.

1. 설치된 패치 목록을 확인하려면 `$LIFERAY_HOME/patching-tool` 폴더에서 `./patching-tool.sh info` 명령을 다시 실행하십시오.
   
   ![현재 설치된 패치의 최신 핫픽스로 LCP.json을 업데이트해야 합니다.](./matching-dxp-versions/images/05.png)
   
   설치에 현재 설치된 핫픽스(또는 "패치")의 이름을 복사합니다. 핫픽스 이름이 여러 개 나타나면 사용 가능한 최신 핫픽스 이름을 복사합니다.

1. 리포지토리에서 `ci/LCP.json` 파일을 엽니다.

1. 이전에 복사한 핫픽스 이름을 `LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON`이라는 새 [환경 변수](../reference/defining-environment-variables.md) 로 추가합니다. 

    ```
    "env": {
        "LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON": "dxp-5-7210"
    }
    ```

```{important}
`LCP_CI_LIFERAY_DXP_HOTFIXES_COMMON`에 정의된 핫픽스와 해당 종속성이 다운로드되어 Jenkins 빌드 프로세스의 일부로 통합됩니다.
```

## 빌드 생성 및 배포

이제 리포지토리의 버전 정보를 업데이트했으므로 빌드의 환경에 배포해야 합니다.

### 변경 사항으로 Jenkins 빌드 생성

Git 명령을 실행하여 Git이 설치된 터미널을 사용하여 변경 사항을 제출하십시오.

1. 변경된 파일을 Git에 추가합니다. 

    ```bash
    git add .
    ```

1. 변경 사항과 메시지를 커밋합니다. 

    ```bash
    git commit -m "Liferay Cloud Migration Stage 1"
    ```

1. GitHub에 변경 사항을 푸시합니다. 

    ```bash
    git push origin master
    ```

프로젝트가 GitHub 리포지토리에 연결되어 있으므로 변경 사항을 푸시하면 자동으로 빌드가 생성됩니다. 진행하기 전에 빌드가 완료될 때까지 기다리십시오.

### 선택한 환경에 빌드 배포

마지막으로 [Liferay Cloud Console](https://console.liferay.cloud/) 을 사용하여 완성된 빌드를 선택한 환경에 배포합니다.

1. Liferay Cloud Console에서 빌드 페이지로 이동합니다(페이지 상단의 링크 사용).

1. 목록에서 이전에 생성한 빌드를 찾고 작업 메뉴에서 *Deploy build to*을 클릭합니다.
   
   ![빌드의 작업 메뉴를 사용하여 배포합니다.](./matching-dxp-versions/images/06.png)

1. 빌드를 배포할 환경을 선택합니다(예: `acme-dev`).

1. 아래 정보를 읽고 확인 상자를 선택하여 배포 결과를 확인합니다.
   
   ![확인란을 선택하고 준비가 되면 빌드를 배포합니다.](./matching-dxp-versions/images/07.png)

1. *빌드*배포 를 클릭합니다.

빌드가 선택한 환경에 배포되고 서비스가 시작될 때 올바른 버전이 적용됩니다.

```{note}
배포를 완료하고 서비스를 준비하는 데 약간의 시간이 걸립니다. 해당 환경에 대한 첫 번째 배포인 경우 프로세스가 평소보다 오래 걸릴 수 있습니다.
```

## 다음 단계

이제 올바른 Liferay DXP 버전 정보가 모두 포함된 선택한 환경에 배포할 수 있습니다. 다음으로 인스턴스 데이터에 대한 백업 파일을 생성하여 [Cloud를 준비](./creating-data-backup-files.md).
