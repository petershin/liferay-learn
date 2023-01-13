# 자동 크기 조정

Liferay Cloud의 자동 확장 기능은 성능을 최적화하기 위해 필요에 따라 Liferay 서비스의 인스턴스를 자동으로 생성하고 제거합니다. 이렇게 하면 서버 트래픽 증가, 메모리 누수 또는 기타 문제와 같은 갑작스러운 변화를 해결할 수 있습니다. 기본적으로 이 기능은 모든 Liferay Cloud 계정에서 *비활성화* 입니다.

서비스는 이 기능을 사용하여 Liferay DXP 인스턴스 수를 [정의된 최대값](#setting-the-maximum-number-of-instances)(기본적으로 10)으로 자동으로 늘리거나(업스케일) 다음으로 줄입니다(다운스케일). [`LCP.json`](../reference/configuration-via-lcp-json.md)의 `scale` 속성에 지정된 숫자입니다. `scale` 속성은 실행할 최소 인스턴스 수를 지정합니다.

```json
  "scale": 2,
```

```{note}
자동 크기 조정은 프로덕션 환경의 Liferay DXP 서비스에만 사용할 수 있습니다. 자동 크기 조정이 활성화되면 서비스의 각 추가 인스턴스에 시간당 요금이 부과됩니다. Auto-Scaling 요금 부과 방식에 대한 자세한 내용은 [Auto-Scaling 요금 부과 방식](https://help.liferay.com/hc/en-us/articles/360030843592-How-Auto-Scaling-is-charged)을 참조하십시오. -).
```

## JVM 메모리 구성

자동 크기 조정이 제대로 작동하려면 Liferay 이미지의 JVM에 적절한 메모리 할당을 설정하는 것이 중요합니다. 이 할당은 서버의 로드에 따라 메모리 사용량이 확장되거나 축소되도록 하는 데 필요합니다.

`liferay` 서비스의 `LIFERAY_JVM_OPTS` 환경 변수를 설정하여 `-Xms` 및 `-Xmx` 플래그를 사용하여 메모리를 할당합니다. `-Xms` 플래그는 서비스 시작 시 초기 메모리 할당을 설정하고 `-Xmx` 플래그는 JVM에 대한 최대 메모리 할당을 결정합니다. 예를 들어 이 서비스에 총 16GB를 프로비저닝하고 사용할 수 있는 경우 속성을 다음과 같이 설정할 수 있습니다.

```
-Xms4096m -Xmx12288m
```

```{note}
여전히 `3.xx` 버전 서비스를 사용 중인 경우 `LIFERAY_JVM_OPTS` 대신 `LIFERAY_JAVA_OPTS`를 사용하여 JVM 옵션을 지정하십시오. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해하기](../reference/understanding-service-stack-versions.md)를 참조하십시오.
```

권장되는 구성은 사용 가능한 메모리의 25%를 사용하여 `-Xms` 플래그를 설정하고 사용 가능한 메모리의 75%를 사용하여 `-Xmx` 플래그를 설정하는 것입니다. `liferay` 서비스에 사용할 수 있는 다양한 메모리 수준에 대한 권장 값에 대한 참조는 다음 표를 참조하십시오.

| **사용 가능한 메모리** | **권장 LIFERAY_JAVA_OPTS** |
|:-------------- |:-------------------------- |
| 8GB            | -Xms2048m -Xmx6144m        |
| 16 기가 바이트      | -Xms4096m -Xmx12288m       |
| 24GB           | -Xms6144m -Xmx18432m       |
| 32GB           | -Xms8192m -Xmx24576m       |
| 64GB           | -Xms16384m -Xmx49152m      |

```{note}
`LIFERAY_JAVA_OPTS` 변수는 때때로 `-Xms` 및 `-Xmx` 외에도 다른 플래그와 함께 사용될 수 있습니다. 다른 플래그가 있는 경우 다른 플래그를 제거하지 않고 메모리 인수로 환경 변수를 업데이트합니다.
```

이 환경 변수를 `liferay` 서비스에 추가하는 데 도움이 필요하면 [환경 변수 정의](../reference/defining-environment-variables.md) 을 참조하십시오.

## 자동 크기 조정 관리

Liferay Cloud Console에서 자동 크기 조정을 활성화 또는 비활성화하려면 다음 단계를 따르십시오.

1. 프로덕션 환경으로 이동합니다.
1. *Services* &rarr; *Liferay* &rarr; *Scale*로 이동합니다.
1. Auto-Scaling이 비활성화된 경우 *Auto Scaling 활성화* 을 클릭하여 활성화합니다. Auto Scaling이 이미 활성화되어 있으면 *Auto Scaling 비활성화* 을 클릭하여 비활성화합니다.

자동 크기 조정이 활성화되면 Liferay Cloud는 서비스를 모니터링하고 사전 정의된 임계값에 따라 자동으로 크기를 조정합니다.

![그림 1: 서비스의 Scale 탭에서 자동 크기 조정을 활성화 또는 비활성화합니다.](./auto-scaling/images/01.png)

## 목표 평균 사용률 지정

시스템 관리자는 *목표 평균 사용률*을 지정할 수 있습니다. 이 값은 Liferay DXP 서비스 전체의 평균 메모리 및 CPU 사용량입니다. Auto-Scaling이 트리거되기 전에 해당 값 임계값을 초과해야 합니다.

예를 들어 3개의 서비스 인스턴스가 각각 메모리의 70%, 90% 및 95%를 사용하는 경우 평균 메모리 사용률은 85%입니다. 목표 평균 사용률이 90으로 설정된 경우 업스케일링이 필요하지 않습니다. 이 상황에서 업스케일링은 평균 메모리 사용률이 목표를 초과하는 경우에만 발생합니다.

사용 가능한 총 메모리는 [LCP.json](../reference/configuration-via-lcp-json.md)를 통한 구성에서 참조된 대로 `LCP.json`의 `메모리` 속성으로 지정됩니다.

서비스의 `LCP.json`의 `autoscale` 속성에서 대상 평균 사용률을 지정합니다.

```json
"autoscale": {
    "cpu": 80,
    "memory": 90
}
```

`자동 크기 조정` 속성이 설정되지 않은 경우 대상 평균 사용률은 CPU 및 메모리 사용률 모두에 대해 기본적으로 80입니다.

## 최대 인스턴스 수 설정

기본적으로 자동 크기 조정은 `liferay` 서비스의 인스턴스 수를 최대 10개까지 늘릴 수 있습니다. 그러나 필요한 경우 더 많은 인스턴스를 사용하도록 이 기본값을 재정의할 수 있습니다. 서비스가 기본 10개 이상의 인스턴스를 사용하도록 허용하려면 두 위치에서 기본값을 재정의해야 합니다.

1. `liferay` 서비스의 `LCP.json` 파일 내에서 기본 10개 이상이 필요한 경우 원하는 최대 인스턴스를 지정합니다. [`autoscale` 객체](#specifying-target-average 내에서 `maxInstances` 필드를 설정합니다. -이용):
   
   1 `liferay` 서비스의 `LCP.json` 파일 내에서 기본 10개 이상이 필요한 경우 원하는 최대 인스턴스를 지정합니다. [`autoscale` 객체](#specifying-target-average-utilization)내에서 `maxInstances` 필드를 설정합니다. 

    ```json
    "autoscale": {
        "cpu": 80,
        "memory": 80,
        "maxInstances": 15
    }
    ```

이 두 구성을 모두 업데이트하면 자동 크기 조정이 필요에 따라 새로 정의된 최대값까지 `liferay` 서비스의 인스턴스를 늘립니다.

## 자동 크기 조정 및 DXP 활성화 키

온프레미스에서 Liferay DXP를 사용하려면 일반적으로 활성화 키를 배포하고 검증해야 합니다. Auto-scaling이 활성화된 경우 Liferay Cloud에서 Liferay Cloud 팀은 DXP 활성화 키 문제를 해결하고 필요에 따라 활성화 키를 추가 및 제거합니다.
