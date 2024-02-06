# 문제 해결 서비스

서비스는 Liferay Cloud 환경의 핵심입니다. 이 문서에서는 Liferay Cloud 서비스에서 발생할 수 있는 문제를 조사하고 해결하는 데 사용할 수 있는 문제 해결 기술을 다룹니다.

## 서비스가 계속해서 다시 시작됩니다.

서비스가 반복적으로 다시 시작되면 해당 서비스에 대한 [또는 준비 프로브](./self-healing.md) 에 문제가 있음을 알릴 수 있습니다. 이 경우 하나의 환경에 대한 개요에서 **활동** 패널의 **일반** 탭에서 이를 확인할 수 있습니다. <!-- Add screenshot if a way to easily reproduce this is available.-->

반복되는 **활동성 프로브 실패** 로 인해 지속적으로 다시 시작되는 서비스는 활동성 프로브가 다시 시작을 트리거하기 전에 시작을 완료하지 못할 수 있습니다. **준비 프로브 실패** 있는 경우 준비 프로브가 여러 번 연속으로 적절한 응답을 받지 못한 것입니다(아마도 서비스가 이미 완전히 시작된 후).

계속해서 다시 시작되는 서비스를 진단하려면 다음 단계를 수행하는 것이 좋습니다.

1. [활성 또는 준비 프로브 실패에 대한 서비스 로그 확인](#check-service-logs-for-liveness-or-readiness-probe-failures)
1. [프로브 구성 검토](#review-probe-configurations)
1. [시작 오류에 대한 서비스 로그 검토](#review-service-logs-for-startup-errors)
1. [프로브 구성 조정](#adjust-probe-configurations)

### 활성 또는 준비 프로브 실패에 대한 서비스 로그 확인

서비스 페이지로 이동하여 첫 번째 탭에서 로그를 확인합니다. 프로브 실패를 나타내는 로그를 찾으려면 최근 로그를 스캔하십시오.

예를 들어 활동성 프로브 실패 메시지는 다음과 같습니다.

```
Liveness probe failed: HTTP probe failed with statuscode: 500
```

### 프로브 구성 검토

환경에 맞게 프로브 구성을 사용자 정의한 경우 잘못된 프로브 구성으로 인해 프로브 실패가 발생할 수 있습니다. 이를 프로브 실패의 원인으로 배제하려면 활성 및 준비 프로브의 구성을 확인하고 환경과 일치하는지 확인하십시오.

문제가 있는 서비스로 이동하고 커서를 상태 아이콘(줄임표 또는 "준비" 아이콘) 위로 가져갑니다.

![프로브 구성에 액세스할 수 있는 팝업을 보려면 서비스 상태 표시기 위로 커서를 가져갑니다.](./troubleshooting-services/images/01.png)

구성을 보려면 해당 프로브를 클릭하십시오.

```
timeoutSeconds: 10
httpGet: path: /c/portal/layout
         port: 8080

initialDelaySeconds: 120
periodSeconds: 15
failureThreshold: 3
successThreshold: 3
```

프로브 구성 값(예: `경로` 또는 `포트` 값)이 환경에 맞지 않으면 프로젝트 리포지토리에 있는 서비스의 `LCP.json` 파일에서 예상 값으로 조정합니다. 서비스에 해당하는 디렉토리(예: `liferay/`)에서 이 파일을 찾은 다음 [변경 사항을 테스트 환경에 배포합니다](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md).

서비스의 `LCP.json` 파일에 아직 프로브 구성이 없는 경우 콘솔에 표시된 구성을 복사하고 변경 사항을 적용하는 동안 JSON 형식으로 변환할 수 있습니다. 예를 들어 `liferay` 서비스에 대한 준비 및 활성 프로브 구성은 다음과 같습니다.

```json
{
"readinessProbe": {
    "httpGet": {
      "path": "/c/portal/layout",
      "port": 8080
    },
    "initialDelaySeconds": 120,
    "periodSeconds": 15,
    "timeoutSeconds": 10,
    "failureThreshold": 3,
    "successThreshold": 3
  },
  "livenessProbe": {
    "tcpSocket": {
      "port": 8080
    },
    "initialDelaySeconds": 300,
    "periodSeconds": 60,
    "timeoutSeconds": 10,
    "failureThreshold": 3,
    "successThreshold": 1
  }
}
```

기본 프로브 구성은 대부분의 환경에서 작동합니다. 프로브 구성을 전혀 변경하지 않은 경우 문제는 잘못된 구성 문제가 아닐 수 있습니다.

### 시작 오류에 대한 서비스 로그 검토

프로브 구성이 올바른 경우 프로브 실패는 서비스 자체에 문제가 있다는 신호일 수 있습니다.

실패한 시작을 나타낼 수 있는 오류 메시지를 찾으려면 로그를 확인하십시오. 시작 로그에서 오류나 문제를 식별할 수 있는 경우 하나 이상의 프로브가 실패하여 서비스 다시 시작을 트리거하는 원인일 수 있습니다.

```{tip}
Liferay 서비스의 경우 재시작 후 첫 번째 로그에 신호를 보내는 이 메시지를 찾으십시오. `[LIFERAY] 이 컨테이너에 SSH로 연결하려면 "docker exec -it liferay-<node-id> /bin/bash"를 실행하십시오.`
```

[Liferay 시작 오류를 처리하는 데 도움이 필요한 경우 지원](https://help.liferay.com/hc/en-us) 에 문의하십시오.

### 프로브 구성 조정

프로브 실패를 유발하는 서비스 시작 로그에 명백한 오류나 문제가 없지만 서비스가 계속 다시 시작되는 경우 프로브 구성을 조정해야 할 수 있습니다.

시작하는 데 오랜 시간이 걸리는 서비스는 활성 프로브 시간 초과로 이어져 서비스 다시 시작을 트리거할 수 있습니다. 프로브가 실패하고 재시작을 트리거할 때 정상적인 시작 로그가 모두 나타나지 않은 경우일 수 있습니다. 서비스가 이미 완전히 시작된 후에 **준비** 프로브 실패인 경우에는 그렇지 않을 수 있습니다.

서비스에서 이러한 일이 발생하면 다음 중 하나를 시도하십시오.

* 프로브가 서비스를 확인하기 전에 더 오래 기다리도록 하려면 `initialDelaySeconds` 값을 늘리십시오.
* `failureThreshold` 증가시켜 서비스 재시작을 트리거하기 전에 프로브가 더 많은 시도를 하도록 합니다.
* 서비스의 응답이 느린 경우 프로브 실패 가능성을 줄이려면 `timeoutSeconds` 값을 늘리십시오.

프로브 구성(서비스의 `LCP.json` 파일)에서 이러한 값 중 하나 이상을 늘리고 속도 저하로 인해 서비스가 다시 시작되는 경우 서비스에 적절하게 변경 사항을 배포합니다. 그러나 이러한 값을 너무 임의로 높게 설정하지 마십시오. 변경 사항은 나중에 서비스를 다시 시작할 때마다 프로브에 적용되기 때문입니다.

자세한 내용은 [프로브 사용 및 구성](./self-healing.md#using-and-configuring-probes) 참조하십시오.

### 클라우드 지원팀에 문의

활성 또는 준비 프로브 실패로 인해 서비스가 다시 시작되지 않거나 이러한 전략이 이를 해결하는 데 도움이 되지 않는 경우 [Liferay Cloud 지원](https://help.liferay.com/hc/en-us) 에 문의하여 추가 지원을 받으십시오.

## CDN으로 사이트에 액세스하면 JavaScript 오류가 발생함

일부 타사 CDN은 쿼리 문자열(예: [Cloudflare](https://www.cloudflare.com/) )을 정렬할 수 있습니다. 맞춤 도메인 이름을 사용하여 사이트에 액세스할 때 정렬하면 문제(예: jQuery 로드 실패)가 발생할 수 있습니다. 이로 인해 다음과 같은 JavaScript 콘솔 오류가 발생할 수 있습니다.

![CDN이 쿼리 문자열을 정렬하는 경우 jQuery가 로드되지 않을 수 있습니다.](./troubleshooting-services/images/02.png)

이 경우 사이트가 제대로 로드되지 않을 수 있습니다. 이러한 오류를 수정하려면 CDN의 쿼리 문자열 정렬을 비활성화하십시오. 정확한 단계는 CDN 문서를 참조하세요(예: [Cloudflare의 쿼리 문자열 정렬 문서](https://support.cloudflare.com/hc/en-us/articles/206776797-Understanding-Query-String-Sort#4bJ4dl4TLlJR8NECznXDnI) ).

정렬이 비활성화된 상태에서 오류가 지속되면 [Liferay Cloud 지원](https://help.liferay.com/hc/en-us) 에 도움을 요청하십시오.
