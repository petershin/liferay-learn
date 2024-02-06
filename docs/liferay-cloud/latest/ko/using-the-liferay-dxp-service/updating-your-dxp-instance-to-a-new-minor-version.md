# DXP 인스턴스를 새 마이너 버전으로 업데이트

Liferay DXP 설치를 정기적으로 업데이트하는 것은 Liferay Cloud 환경을 유지 관리하는 데 중요한 부분입니다. [Liferay DXP Docker Hub 페이지](https://hub.docker.com/r/liferay/dxp/tags) 에서 사용 가능한 태그를 사용하여 서비스를 업데이트하고 배포하십시오.

```{note}
새로운 주요 버전(예: Liferay DXP 7.3)으로 업그레이드하려면 더 작은 버전 업데이트와 다른 절차가 필요합니다. 자세한 내용은 [Liferay DXP 인스턴스 업그레이드](./upgrading-your-liferay-dxp-instance.md)를 참조하십시오.
```

```{note}
[hotfix](../../../../dxp/latest/ja/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier.md#hotfixes) , [다음 단계](./deploying-to-the-liferay-service.md#deploying-hotfixes) 를 따릅니다. 대신에.
```

## DXP 7.3+에 대한 모듈 업그레이드 활성화

먼저 DXP 7.3+ 버전을 업데이트하는 경우 필요에 따라 모듈을 업그레이드할 수 있도록 환경 변수를 설정합니다.

1. Liferay Cloud 콘솔에서 원하는 환경의 Liferay 서비스를 클릭합니다.

1. **환경 변수** 탭을 클릭합니다.

1. `LIFERAY_UPGRADE_PERIOD_DATABASE_PERIOD_AUTO_PERIOD_RUN` 변수를 `true`값으로 목록에 추가합니다.

1. 변경 사항 저장 버튼을 클릭합니다.

이렇게 하면 모듈이 DXP의 새 마이너 버전에 필요한 업그레이드를 수행할 수 있습니다. DXP 버전을 새 수정 팩 또는 서비스 팩으로 업데이트할 때마다 모듈 업그레이드를 허용하려는 경우 업데이트 후 이 환경 변수를 유지할 수 있습니다.

## 새 버전의 DXP 업데이트 및 배포

Liferay DXP에 대한 부 버전 업데이트도 프로젝트 저장소를 변경해야 합니다.

```{important}
[클러스터링된 서비스](./setting-up-clustering-in-liferay-cloud.md)를 사용 중이고 Liferay 데이터베이스 스키마를 변경하는 버전(예: [서비스 팩](../.. /../../dxp/latest/en/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7 -3-and-earlier.html#service-packs) ), [다음 단계](#updating-to-a-new-service-pack-with-clustering-enabled) 를 따릅니다.
```

프로젝트 리포지토리에서 변경 사항을 업데이트하고 배포하려면 다음 단계를 수행하십시오.

1. [Docker Hub](https://hub.docker.com/r/liferay/dxp/tags) 에서 업데이트하려는 Liferay 버전의 태그를 찾으십시오.

1. 리포지토리에서 [`liferay/gradle.properties`](../using-the-liferay-dxp-service.md#choosing-a-version) 의 `liferay.workspace.docker.image.liferay` 속성 값을 새 버전의 태그로 변경합니다.

    ```properties
    liferay.workspace.docker.image.liferay=liferay/dxp:7.3.10-ga1
    ```

1. 저장소의 `liferay/LCP.json` 파일에 있는 `env` 블록에 이 환경 변수를 추가합니다.

    ```json
    {
        "LIFERAY_UPGRADE_PERIOD_DATABASE_PERIOD_AUTO_PERIOD_RUN": "true"
    }
    ```

1. [변경](./deploying-to-the-liferay-service.md) 을 원하는 환경의 `liferay` 서비스에 배포합니다.

1. DXP 7.3+ 버전의 경우 향후 새 수정팩 또는 서비스 팩으로 업그레이드할 때 모듈 업그레이드를 허용하지 않으려면 `LIFERAY_UPGRADE_PERIOD_DATABASE_PERIOD_AUTO_PERIOD_RUN` 환경 변수 [이전에 추가한 2 Liferay 서비스의 환경 변수 페이지에](#enabling-module-upgrades-for-dxp-73) 을 제거하십시오. .

변경 사항을 배포하면 `liferay` 서비스가 다시 시작되고 업데이트를 완료하는 데 필요한 모든 업그레이드 단계가 시작됩니다.

## 클러스터링이 활성화된 새 서비스 팩으로 업데이트

데이터베이스 스키마를 변경하는 Liferay DXP 버전으로 업데이트하는 경우 클러스터링된 `liferay` 서비스는 모든 노드가 올바르게 업데이트되도록 업데이트 절차 중에 임시 변경이 필요합니다.

다음과 같이하세요:

1. 리포지토리의 `liferay/LCP.json` 파일에서 `스케일` 속성을 `1`로 설정합니다.

   ```json
   {
       "scale": 1,
   }
   ```

1. [변경](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) 을 `liferay` 서비스에 배포합니다.

1. [Docker Hub](https://hub.docker.com/r/liferay/dxp/tags) 에서 업데이트하려는 Liferay 버전의 태그를 찾으십시오.

1. `liferay/gradle.properties` 의 `liferay.workspace.docker.image.liferay` 속성 값을 새 버전의 태그로 변경합니다.

    ```properties
    liferay.workspace.docker.image.liferay=liferay/dxp:7.3.10-ga1
    ```

1. `liferay/LCP.json`에서 [배포 전략](../updating-services-in-liferay-paas/understanding-deployment-strategies.md)을 `Recreate`로 설정합니다.

    ```json
    {
        "strategy": {
            "type": "Recreate"
        }
    }
    ```

1. [이러한 변경 사항을](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) liferay `서비스에 배포`.

    `liferay` 서비스의 Liferay DXP 설치는 시작할 때 새 버전으로 업데이트됩니다. 그러나 서비스에 대한 임시 변경 사항은 여전히 되돌려야 합니다.

1. `스케일` 속성을 `liferay/LCP.json`에서 원하는 노드 수로 다시 설정합니다.

    ```json
    {
        "scale": 3,
    }
    ```

1. `liferay/LCP.json` 의 배포 전략을 이전 값으로 재설정합니다(또는 버전 업데이트를 위해서만 추가된 경우 속성을 제거합니다).

1. [변경 사항](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) 을 한 번 더 배포합니다.

1. DXP 7.3+ 버전의 경우 향후 새 수정팩 또는 서비스 팩으로 업그레이드할 때 모듈 업그레이드를 허용하지 않으려면 `LIFERAY_UPGRADE_PERIOD_DATABASE_PERIOD_AUTO_PERIOD_RUN` 환경 변수 [이전에 추가한 2 Liferay 서비스의 환경 변수 페이지에](#enabling-module-upgrades-for-dxp-73) 을 제거하십시오. .

업데이트된 `liferay` 서비스는 최종 배포 후 원하는 수의 노드로 백업을 시작합니다.

## 관련 주제

* [Liferay 서비스에 배포](./deploying-to-the-liferay-service.md)
* [핫픽스 설치](./deploying-to-the-liferay-service.md#deploying-hotfixes)
* [Liferay Cloud에서 클러스터링 설정](./setting-up-clustering-in-liferay-cloud.md)
* [Liferay DXP 인스턴스 업그레이드](./upgrading-your-liferay-dxp-instance.md)
