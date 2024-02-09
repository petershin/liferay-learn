# Liferay 서비스에 대한 클러스터링 설정

Delectable Bonsai의 웹사이트는 수백만 건의 조회수를 기록하므로 트래픽을 처리하려면 클러스터링되어야 합니다. 여기에서는 프로덕션 환경의 2노드 클러스터를 구성하는 방법을 알아봅니다.

```{important}
Liferay 서비스를 클러스터링하고 여기에 다른 노드를 추가할 수 있도록 Liferay Cloud 프로젝트의 추가 기능으로 프로비저닝된 추가 Liferay DXP 인스턴스가 있어야 합니다. 자세한 내용은 Liferay 계정 관리자에게 문의하세요.
```

## LCP.json에서 클러스터링 속성 설정

클러스터링을 활성화하고 Liferay 서비스 구성에서 규모 값을 설정합니다.

1. 프로젝트 리포지토리에서 `liferay/` 디렉터리로 이동하여 `LCP.json` 파일을 엽니다.

1. `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED` 환경 변수가 없으면 추가합니다. 값을 `true`로 설정합니다.

   ```json
    {
        "env": {
            "LCP_PROJECT_LIFERAY_CLUSTER_ENABLED": "true"
        }
    }
   ```

1. 값이 `1`인 `척도` 속성을 추가합니다. 이는 나중에 업데이트할 노드 수를 설정합니다.

   ```json
    {
        "kind": "Deployment",
        "id": "liferay",
        "scale": 1
    }
   ```

1. Gradle 작업을 실행하여 Liferay 서비스에 대한 사용자 지정 Dockerfile을 생성합니다.

   ```bash
   ./gradlew clean createDockerfile deploy
   ```

1. 빌드를 배포하기 전에 `LCP.json` 파일을 새로 생성된 `build/docker` 폴더에 복사합니다.

    ```bash
    cp LCP.json build/docker
    ```

    ```bash
    cd build/docker
    ```

1. Liferay 서비스만 배포하려면 CLI 도구의 `lcp 배포` 명령을 사용하세요.

    ```bash
    lcp deploy --project=[project-name] --environment=prd
    ```

Liferay 서비스는 클러스터링이 활성화되고 `스케일` 변수가 초기화되어 다시 시작됩니다. 그러나 규모는 여전히 하나의 노드로만 설정됩니다. 계속해서 원하는 두 노드로 축척을 업데이트합니다.

## 클러스터링 규모 업데이트

이제 클러스터링 규모를 초기화했으므로 이를 두 개의 노드로 업데이트하고 새 빌드를 생성하여 배포합니다.

1. 프로젝트 리포지토리에서 `liferay/` 폴더로 이동하여 `LCP.json` 파일을 엽니다.

1. `스케일` 속성의 값을 `2`으로 업데이트합니다.

   ```json
    {
        "kind": "Deployment",
        "id": "liferay",
        "scale": 2
    }
   ```

1. Git 리포지토리에 변경 사항을 커밋하고 푸시합니다.

   ```bash
   git add liferay/LCP.json
   ```

   ```bash
   git commit -m "Enable clustering and set the clustering scale to 2."
   ```

   ```bash
   git push origin [branch_name]
   ```

이제 업데이트된 클러스터링 구성이 커밋되고 Liferay Cloud 인프라가 자동으로 이를 사용하여 빌드를 생성합니다.

## 구성 배포

이제 클러스터링에 필요한 구성이 준비되었으므로 해당 구성을 환경에 배포합니다.

1. Liferay Cloud 콘솔에 로그인합니다.

1. 화면 오른쪽 상단에서 **빌드** 클릭하여 빌드 페이지에 액세스합니다.

1. 새 변경 사항이 포함된 커밋에 해당하는 빌드에 대해 작업 메뉴 ![Actions menu icon](../../images/icon-actions.png) 을 클릭하고 **빌드 배포...를 선택합니다**

   ![빌드 페이지에서 커밋 메시지와 함께 배포할 빌드를 선택하세요.](./setting-up-clustering-for-the-liferay-service/images/01.png)

1. **환경** 드롭다운 메뉴에서 프로덕션 환경을 선택합니다.

1. 배포의 영향을 확인하는 확인란을 선택합니다.

   ![프로덕션 환경을 선택하고 양식을 작성하여 빌드를 배포합니다.](./setting-up-clustering-for-the-liferay-service/images/02.png)

1. **빌드** 배포를 클릭하세요.

서비스가 다시 시작되면 클러스터링이 활성화되고 Liferay 서비스의 두 노드가 생깁니다.

다음: [필요할 때 더 많은 인스턴스에 대해 자동 크기 조정](./configuring-auto-scaling.md) 수행하도록 Liferay 서비스를 구성합니다.

## 관련 개념

* [Liferay Cloud에서 클러스터링 설정](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/setting-up-clustering-in-liferay-cloud)
* [Liferay DXP 서비스 구성](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/configuring-the-liferay-dxp-service)
* [Liferay 클라우드 콘솔을 통한 변경 사항 배포](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/deploying-changes-via-the-liferay-cloud-console)
* [CLI 도구를 통한 변경 사항 배포](https://learn.liferay.com/w/liferay-cloud/updating-services-in-liferay-paas/deploying-changes-via-the-cli-tool)
* [라이프레이 서비스 환경 변수](https://learn.liferay.com/w/liferay-cloud/customizing-liferay-dxp-in-the-cloud/using-the-liferay-dxp-service/liferay-service-environment-variables)
