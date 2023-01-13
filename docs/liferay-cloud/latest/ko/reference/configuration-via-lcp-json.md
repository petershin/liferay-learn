# LCP.json을 통한 구성

Liferay Cloud 환경의 각 서비스에는 서비스를 구성하는 데 사용할 수 있는 `LCP.json` 파일이 있습니다. 서비스 ID, 메모리, CPU 수, 환경 변수, 볼륨 등과 같은 속성을 구성할 수 있습니다.

이 표는 `LCP.json`에 추가할 수 있는 속성을 나열하고 설명합니다.

| 분야               | 유형  | 기정값                           | 묘사                                                                                                                                           |
|:---------------- |:--- |:----------------------------- |:-------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`             | 끈   | 무작위의                          | 서비스 ID                                                                                                                                       |
| `심상 화랑 심상`       | 끈   | `""`                          | Docker Hub의 서비스 이미지                                                                                                                          |
| `env`            | 객체  | 확정되지 않는                       | 환경 변수                                                                                                                                        |
| `loadBalancer`   | 객체  | `{}`                          | 노출된 포트 및 도메인 선언                                                                                                                              |
| `cpu`            | 숫자  | `1`                           | CPU 수                                                                                                                                        |
| `스케일`            | 숫자  | `1`                           | 시작 인스턴스 수                                                                                                                                    |
| `기억`             | 숫자  | `512`                         | 메모리 양(MB)                                                                                                                                    |
| `volumes`        | 객체  | 확정되지 않는                       | 데이터를 유지하는 경로                                                                                                                                 |
| `readinessProbe` | 객체  | `{ "timeoutSeconds": 5 }`     | 서비스 준비 상태 확인                                                                                                                                 |
| `livenessProbe`  | 객체  | `{ "timeoutSeconds": 5 }`     | 서비스 활성 확인                                                                                                                                    |
| `dependencies`   | 배열  | `[]`                          | 종속성 배포 순서                                                                                                                                    |
| `kind`           | 끈   | `Deployment`                  | 배포 유형(예: 배포 또는 StatefulSet)                                                                                                                  |
| `strategy`       | 객체  | `{ "type": "RollingUpdate" }` | 배포 전략(예: RollingUpdate 또는 Recreate)                                                                                                          |
| `ports`          | 배열  | `[]`                          | 포트 및 프로토콜 선언                                                                                                                                 |
| `environments`   | 객체  | `{}`                          | 환경별 구성                                                                                                                                       |
| `배치하십시요`         | 불리언 | `여실한`                         | 지정된 환경에 대해 서비스를 배포할지 여부입니다. `환경` 속성 내에서만 이 속성을 사용하십시오. 루트 수준이 아닙니다. 샘플 `LCP.json` 파일을 참조하십시오.                                                |
| `autoscale`      | 객체  | `{ "cpu": 80, "memory": 80 }` | Auto-Scaling에서 CPU 및 메모리의 목표 평균 사용률입니다. Auto-Scaling과 함께 작동하는 방법에 대한 자세한 내용은 [Auto-Scaling](../manage-and-optimize/auto-scaling.md)을 참조하십시오. |

## 용법

다음은 모든 속성을 사용하는 예제 `LCP.json` 파일입니다.

```json
{
  "id": "myservice",
  "image": "liferaycloud/example",
  "env": {
    "DB_USER": "root",
    "DB_PASSWORD": "pass123"
  },
  "loadBalancer": {
    "cdn": true,
    "targetPort": 3000,
    "customDomains": ["example.com"],
    "ssl": {
      "key": "...",
      "crt": "..."
    }
  },
  "cpu": 2,
  "scale": 2,
  "memory": 2048,
  "volumes": {
    "storage": "/opt/storage"
  },
  "livenessProbe": {
    "timeoutSeconds": 5,
    "httpGet": {
      "path": "/status",
      "port": 3000
    },
    "initialDelaySeconds": 40,
    "periodSeconds": 5,
    "successThreshold": 5
  },
  "readinessProbe": {
    "timeoutSeconds": 5,
    "exec": {
      "command": ["cat", "/tmp/healthy"]
    },
    "initialDelaySeconds": 40,
    "periodSeconds": 5
  },
  "dependencies": ["service1", "service2"],
  "kind": "StatefulSet",
  "strategy": {
    "type": "RollingUpdate"
  },
  "ports": [
    {
      "port": 3400,
      "targetPort": 7000,
      "protocol": "TCP"
    },
    {
      "port": 9000,
      "targetPort": 8000,
      "protocol": "TCP",
      "external": true
    }
  ],
  "environments": {
    "prd": {
      "memory": 4096,
      "cpu": 6
    },
    "dev": {
      "deploy": false
    }
  },
  "autoscale": {
    "cpu": 90,
    "memory": 90
  }
}
```
