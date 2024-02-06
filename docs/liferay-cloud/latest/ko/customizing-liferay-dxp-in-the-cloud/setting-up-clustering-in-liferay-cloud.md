# Liferay Cloud에서 클러스터링 설정

이 문서에서는 Liferay Cloud에서 Liferay DXP 인스턴스에 대한 클러스터링을 구성하는 데 필요한 단계를 설명합니다.

**컨텐츠:**

1. [클러스터링 환경 변수 활성화](#enable-the-clustering-environment-variable)
1. [클러스터링 스케일 설정](#set-the-clustering-scale)
1. [클러스터링 포털 속성 추가](#add-clustering-portal-properties)
1. [배포 및 확인](#deploy-and-verify)

## 클러스터링 환경 변수 활성화

Liferay Cloud Console의 원하는 환경에서 시작하십시오. 그런 다음 `Services`아래에서 `liferay`으로 이동한 다음 `Environment Variables`를 클릭합니다. `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED` 변수가 `true`으로 설정되었는지 확인합니다. 이는 이미지 시작 프로세스에 클러스터링 구성을 Liferay DXP에 추가하도록 지시합니다.

![Setting LCP_PROJECT_LIFERAY_CLUSTER_ENABLED](./setting-up-clustering-in-liferay-cloud/images/01.png)

## 클러스터링 스케일 설정

클러스터링 환경의 노드 수는 Liferay 서비스의 `LCP.json` 파일( `liferay/` 폴더)에 있는 `scale` 속성에 의해 결정됩니다. Liferay 서비스를 처음으로 배포하거나 `LCP.json` 파일에 `scale` 속성이 아직 설정되지 않은 경우 먼저 값을 `1` 로 설정한 다음 [서비스를 배포해야 합니다.](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md#deploy) .

```json
{
  "kind": "Deployment",
  "id": "liferay",
  "image": "liferaycloud/liferay-dxp:7.2-4.0.1",
  "memory": 8192,
  "cpu": 8,
  "scale": 1,
}
```

`척도` 속성이 `1`으로 설정된 상태로 Liferay 서비스가 배포되면 이 값을 원하는 노드 수로 업데이트합니다.

```{warning}
데이터베이스 스키마에 변경 사항이 있는 경우(예: 패치를 설치하는 경우) 클러스터 환경의 여러 노드가 서로 충돌할 수 있습니다. 이 경우 먼저 배율을 다시 1로 변경하고 Liferay 서비스를 재배포하여 충돌하는 스키마 문제를 방지하십시오. 그런 다음 스케일을 다시 올바른 노드 수로 변경하고 서비스를 다시 배포하십시오.
```

```{note}
Liferay DXP 인스턴스의 노드 수를 늘리면 프로젝트에 할당된 CPU 코어 수가 늘어날 수 있습니다. 증가된 CPU 코어 수가 계획의 최대 [quota](../manage-and-optimize/quotas.md)을 초과하면 배포가 실패할 수 있습니다.
```

### 자동 크기 조정

Auto-scaling은 `LCP.json`의 `scale` 속성과 함께 작동합니다. 자동 크기 조정이 활성화된 경우 `크기` 속성이 초기 인스턴스 수를 결정합니다. 인스턴스 수는 수요에 따라 증가합니다. 자세한 내용은 [자동 크기 조정](../manage-and-optimize/auto-scaling.md) 을 참조하십시오.

## 클러스터링 포털 속성 추가

기본적으로 Liferay Cloud에서 클러스터링을 활성화하기 위해 추가 포털 속성이 필요하지 않습니다. 클러스터링을 설정하는 데 필요한 구성은 Liferay DXP 서비스가 시작될 때 Docker 이미지의 `portal-clu.properties` 및 `unicast.xml` 파일에 이미 복사됩니다.

그러나 클러스터링을 위한 추가 포털 속성이 필요한 경우 해당 속성을 저장소에 계속 추가할 수 있습니다. 선택한 환경에 적합한 `config` 폴더 내의 `portal-clu.properties` 파일에 추가하여 클러스터링 특정 포털 속성을 재정의할 수 있습니다. Liferay 서비스 구성 배포에 대한 자세한 내용은 [Liferay DXP 서비스 구성](./configuring-the-liferay-dxp-service.md) 을 참조하십시오.

## 배포 및 확인

선택한 환경에 구성 변경 사항을 배포하여 클러스터링이 활성화되었는지 확인합니다. 자세한 내용은 [Liferay 클라우드 배포 워크플로 개요](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) 을 참조하십시오.

클러스터링이 올바르게 작동하는지 확인하려면 `JGroupsReceiver` 클래스의 `Accepted View` 메시지에 대한 Liferay DXP 인스턴스의 로그를 확인하십시오.

다음은 클러스터링을 사용한 성공적인 배포 로그의 예입니다.

```shell
Aug 26 09:42:22.778 build-90 [liferay-68b8f6b48d-hdj9t] [dxp] INFO  [Incoming-2,liferay-channel-transport-0,liferay-68b8f6b48d-hdj9t-23003][JGroupsReceiver:91] Accepted view [liferay-68b8f6b48d-r8r5f-1292|8] (3) [liferay-68b8f6b48d-r8r5f-1292, liferay-68b8f6b48d-gzsg4-15389, liferay-68b8f6b48d-hdj9t-23003]
Aug 26 09:42:22.779 build-90 [liferay-68b8f6b48d-hdj9t] [dxp] INFO  [Incoming-1,liferay-channel-control,liferay-68b8f6b48d-hdj9t-17435][JGroupsReceiver:91] Accepted view [liferay-68b8f6b48d-r8r5f-29669|8] (3) [liferay-68b8f6b48d-r8r5f-29669, liferay-68b8f6b48d-gzsg4-48301, liferay-68b8f6b48d-hdj9t-17435]
```

`승인된 보기 [liferay-68b8f6b48d-r8r5f-1292|8]` 은 `liferay-68b8f6b48d-r8r5f-1292` 이 마스터 노드임을 나타냅니다.

`(3) [liferay-68b8f6b48d-r8r5f-29669, liferay-68b8f6b48d-gzsg4-48301, liferay-68b8f6b48d-hdj9t-17435]` 은 `(3)` 노드가 클러스터의 일부임을 나타냅니다. 노드. 이 목록에는 슬레이브 노드 외에 마스터 노드가 포함됩니다.

## 관련 주제

* [자동 크기 조정](../manage-and-optimize/auto-scaling.md)
* [Liferay DXP 서비스 소개](../customizing-liferay-dxp-in-the-cloud.md)
* [Liferay DXP 서비스 구성](./configuring-the-liferay-dxp-service.md)
