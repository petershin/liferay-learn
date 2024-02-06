# 환경 변수 정의

환경 변수는 서비스가 환경 내에서 동작하는 방식에 영향을 줄 수 있는 동적 자리 표시자 집합입니다.

Liferay Cloud 콘솔을 통해 또는 각 서비스에 대해 `LCP.json` 파일을 구성하여 환경 변수를 정의할 수 있습니다.

```{note}
Liferay Cloud는 항상 최신 변경 사항을 설정에 적용합니다. LCP.json 파일에 최신 변경 사항이 있는 경우 재시작 시 웹 콘솔에 환경 변수가 반영됩니다. 그러나 웹 콘솔에서 환경 변수가 변경되면 해당 새 구성으로 컨테이너가 다시 시작됩니다.
```

## Liferay Cloud Console을 통해 환경 변수 정의

Liferay Cloud 콘솔을 통해 서비스에 대한 환경 변수를 추가, 변경 또는 제거할 수 있습니다. 이러한 방식으로 서비스를 구성할 때 모든 변수는 변수가 정의된 프로젝트 환경으로 범위가 지정됩니다.

```{warning}
서비스의 환경 변수를 업데이트하면 변경 사항을 적용하기 위해 서비스가 다시 시작됩니다. 다시 시작하는 동안 서비스는 몇 분 동안 요청 수신을 중지하고 변수 값에 따라 다르게 동작할 수 있습니다.
```

Liferay Cloud 콘솔을 통해 서비스에 환경 변수를 추가하려면 다음 단계를 따르십시오.

1. 프로젝트 환경으로 이동합니다.

1. 환경 메뉴에서 **서비스** 을 클릭합니다.

1. 구성하려는 서비스를 클릭합니다.

1. **환경 변수** 탭을 클릭합니다.

   ![그림 1: 서비스의 환경 변수 탭으로 이동합니다.](./defining-environment-variables/images/01.png)

1. 새 환경 변수를 키-값 쌍으로 입력합니다. 다음 예에서는 Liferay 서비스에 대한 클러스터링을 비활성화합니다.

    * **키** : `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED`
    * **값** :  `거짓`

1. **변경 사항 저장** 을 클릭하여 새 환경 변수로 서비스를 다시 시작합니다.

환경 변수가 서비스에 추가되면 서비스의 **환경 변수** 탭에서 언제든지 환경 변수를 제거하거나 해당 값을 변경할 수 있습니다.

변수를 제거하려면 **제거** 버튼( ⨉ )을 클릭합니다.

변수 값을 변경하려면 ** 표시 아이콘을 클릭하고 새 값을 입력합니다.

변수 제거 또는 변경을 마치면 **변경 사항 저장** 을 클릭하여 업데이트된 환경 변수로 서비스를 다시 시작합니다.

![그림 2: 표시 아이콘을 클릭하여 변수 값을 보고 편집합니다.](./defining-environment-variables/images/02.png)

## LCP.json을 통해 환경 변수 정의

`env` 속성을 사용하여 `LCP.json` 파일을 통해 서비스에 대한 환경 변수를 정의할 수 있습니다. 이러한 방식으로 서비스를 구성할 때 모든 환경 또는 선택 환경에서 서비스의 동작을 정의할 수 있습니다.

다음 예에서는 `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED` 변수를 값 `true`으로 정의합니다. 달리 지정하지 않는 한 이 변수는 모든 환경에 기본적으로 적용되는 최상위 속성으로 설정됩니다.

```json
{
  "id": "liferay",
  "image": "liferaycloud/liferay-dxp:7.2-4.0.0",
  "env": {
    "LCP_PROJECT_LIFERAY_CLUSTER_ENABLED": "true"
  }
}
```

다음 예에서는 `dev` 환경에 대해 `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED` 변수를 값 `false` 으로 정의하여 최상위 속성에 대한 예외를 생성합니다.

```json
{
  "environments": {
    "dev": {
      "env": {
        "LCP_PROJECT_LIFERAY_CLUSTER_ENABLED": "false"
      }
    }
  }
}
```

서비스의 `LCP.json` 파일 편집을 마쳤으면 변경 사항을 저장하고 업데이트 환경 변수에 배포합니다. 자세한 내용은 [Liferay 클라우드 배포 워크플로 개요](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) 을 참조하십시오.

## 비밀 환경 변수

일반 환경 변수에는 특별한 보안 조치가 없습니다. Liferay Cloud 프로젝트에 액세스할 수 있는 모든 사용자는 서비스에 대한 변수 값도 볼 수 있습니다.

민감한 변수 값(예: 로그인 자격 증명)을 저장하기 위해 비밀을 사용할 수 있습니다. 비밀은 백엔드에서 암호화되며 **Admin** 역할이 없는 사용자에게는 숨겨집니다. 일반 환경 변수는 값을 보호하기 위해 [참조 비밀](..//tuning-security-settings/managing-secure-environment-variables-with-secrets.md#referencing-secrets-from-environment-variables) 을 사용할 수도 있습니다. 자세한 내용은 [비밀로 보안 환경 변수 관리](..//tuning-security-settings/managing-secure-environment-variables-with-secrets.md) 을 참조하십시오.

## 관련 주제

* [LCP.json을 통한 구성](../reference/configuration-via-lcp-json.md)
* [보안 비밀로 보안 환경 변수 관리](..//tuning-security-settings/managing-secure-environment-variables-with-secrets.md)
* [Liferay 클라우드 배포 워크플로 개요](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)
