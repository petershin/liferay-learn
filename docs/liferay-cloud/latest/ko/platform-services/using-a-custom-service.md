# 맞춤 서비스 사용

Liferay Cloud를 사용하면 즉시 제공되는 표준 서비스 세트 이상을 실행할 수 있습니다. Liferay Cloud 인프라 내에서 새로운 프로세스를 실행하기 위해 맞춤형 서비스를 생성 및 배포할 수도 있습니다. Liferay Cloud 환경에서 사용자 지정 서비스를 사용하려는 고객은 먼저 영업 담당자에게 연락하여 이 기능을 활성화하고 그에 따라 환경이 프로비저닝되었는지 확인해야 합니다.

```{note}
사용자 지정 서비스를 추가할 수 있으려면 충분한 하드웨어 리소스가 프로비저닝되어 있어야 합니다. 프로비저닝 프로세스 중에 사용자 지정 서비스에 대한 추가 리소스를 할당할 수 있습니다.
```

Liferay Cloud는 Docker 이미지를 서비스의 기반으로 사용합니다. 이러한 서비스를 로컬에서 실행하려면 로컬 시스템에 [Docker를 설치](https://docs.docker.com/get-docker/) 하세요.

자세한 내용은 [맞춤 서비스 제한 사항](../reference/platform-limitations.md#custom-services) 을 참조하세요.

## 맞춤 서비스 추가

다음 단계를 사용하여 Liferay Cloud의 빌드에 사용자 정의 서비스를 추가하십시오.

1. 맞춤 서비스를 Docker 이미지로 만들거나 찾습니다. 프로젝트의 작업 공간에 직접 추가하는 Dockerfile 또는 [Docker Hub](https://hub.docker.com/) 과 같은 공용 리포지토리의 이미지를 사용할 수 있습니다.

1. `LCP.json` 파일이 있는 다른 서비스 디렉토리(예: `liferay` 및 `database`)와 함께 서비스에 대한 새 디렉토리를 추가하십시오. 

    ```
    ├── backup
    ├── ci
    ├── database
    ├── liferay
    ├── search
    ├── webserver
    └── myCustomService
        └── LCP.json
    ```

이 파일에 구성을 추가하는 방법에 대한 자세한 내용은 [LCP.json을 통한 구성](../reference/configuration-via-lcp-json.md) 을 참조하십시오. 

    ```{warning}
    새 사용자 지정 서비스로 빌드를 트리거하지만 새 서비스에 대해 프로비저닝된 리소스가 충분하지 않은 경우 다른 서비스에 할당된 리소스를 방해할 수 있습니다.

    LCP.json 파일에서 새 서비스에 대한 메모리 및 CPU 할당을 직접 설정하여 올바른 양의 하드웨어 리소스를 가져오도록 합니다.
    ```

1. `LCP.json`에서 사용자 지정 서비스를 적용할 환경을 지정합니다. 새 서비스에 대해 프로비저닝한 리소스 수에 따라 달라질 수 있습니다.
   
   예를 들어 빌드를 `prd` 환경에만 적용하려면 `LCP.json`에 다음 속성을 추가합니다.

    ```json
    {
      "environments": {
          "prd": {
            "deploy": true
          }
      }
    }
    ```

이러한 속성이 지정되지 않은 경우 기본적으로 서비스는 모든 환경에 대한 사용자 지정 서비스를 구축하려고 시도합니다.

1. Docker 이미지를 새 서비스에 적용합니다. Docker 이미지를 추가하는 데 사용하는 방법은 공용 리포지토리에 업로드된 이미지를 사용하는지 아니면 로컬 Dockerfile을 사용하는지에 따라 다릅니다.

    * **공용 리포지토리의 Docker 이미지를 사용하는 경우:** 이미지 이름을 `LCP.json`내의 `image` 속성에 추가합니다. 

      ```
      "image": "mydockerimages/myservice:1.0.0"
      ```

    * **로컬 Dockerfile을 사용하는 경우:** Dockerfile을 사용자 지정 서비스의 디렉터리에 추가합니다. 서비스가 빌드되면 Dockerfile의 Docker 이미지가 자동으로 서비스 이미지로 선택됩니다.

      ```{note}
      Dockerfile은 자동으로 서비스의 이미지로 사용됩니다. 결과적으로 LCP.json의 모든 "이미지" 속성은 무시됩니다.
      ```

1. 버전 제어에서 브랜치에 다음 변경 사항을 커밋합니다. 

    ```bash
    git add my-custom-service/
    git commit -m "Add custom service"
    ```

1. 지점을 확장하고 Liferay Cloud에서 새 빌드를 시작하여 배포하십시오. 빌드 배포에 대한 도움말은 [Liferay Cloud 배포 개요](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow#deploy) 에서 배포에 대한 정보를 참조하십시오.

변경 사항으로 CI에서 새 빌드를 트리거한 후에는 Liferay Cloud 콘솔에서 **빌드** 화면으로 이동하여 빌드를 볼 수 있습니다. **서비스** 열에 나열된 서비스에는 다른 서비스와 함께 새 서비스가 포함됩니다.

이 빌드를 환경 중 하나에 배포하는 경우(작업 메뉴에서 **빌드를** 에 배포 클릭) 해당 환경의 **서비스** 페이지로 이동하여 여기에 나열된 사용자 지정 서비스를 볼 수도 있습니다.

![다른 서비스와 함께 배포되는 새로운 "customservice".](./using-a-custom-service/images/01.png)

## 관련 주제

* [Liferay 클라우드 배포 워크플로 개요](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow)
