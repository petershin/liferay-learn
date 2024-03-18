# 클라이언트 확장 패키징

{bdg-primary}`Liferay Self-Hosted`
{bdg-primary}`Liferay SaaS`
{bdg-warning}`Liferay PaaS`

{bdg-secondary}`Liferay 7.4`

클라이언트 확장 프로젝트는 `.zip` 확장자를 가진 **Liferay Universal File Format Archives**(LUFFA)라는 배포 가능한 아카이브로 구축됩니다. 각 LUFFA에는 특정 구조가 있으며 프로젝트에서 제공되지 않는 경우 자동으로 생성되는 특정 구성 요소 파일을 정의합니다. Liferay 작업 공간은 클라이언트 확장 프로젝트를 빌드할 때 패키지화합니다. 클라이언트 확장을 [하거나](./working-with-client-extensions.md#assembling-client-extensions) 다른 프로세스로 LUFFA를 생성하려면 패키징 작동 방식을 이해하는 것이 중요합니다.

LUFFA의 구조는 다음과 같습니다.

```bash
.
├── batch
│   └── **/*.batch-engine-data.json
├── *.client-extension-config.json
├── Dockerfile
├── LCP.json
├── static
│   └── **/*
├── WEB-INF
│   └── liferay-plugin-package.properties
└── [microservice resources]
```

## `batch`

```{note}
`batch` 폴더는 [배치 클라이언트 확장 프로젝트에만 필요합니다](./batch-client-extensions.md).
```

배치 클라이언트 확장의 데이터 엔터티는 빌드된 LUFFA의 `batch/` 폴더 내에 있는 `*.batch-engine-data.json` 파일입니다. 이러한 파일은 `batch/` 폴더 내의 모든 폴더 구조에 있을 수 있습니다.

무제한 깊이의 디렉터리 구조를 사용하여 루트 수준 `batch/` 디렉터리 아래에 원하는 수의 `*.batch-engine-data.json` 파일을 배치할 수 있습니다. 프로젝트의 `client-extension.yaml` 파일에서 배치 확장을 정의하지 못하면 Liferay는 이러한 파일을 무시합니다.

## `*.client-extension-config.json`

```{note}
각 LUFFA에는 하나 이상의 `*.client-extension-config.json` 파일이 필요합니다.
```

LUFFA의 루트에는 하나 이상의 `*.client-extension-config.json`( [OSGi 구성 리소스 형식](https://docs.osgi.org/specification/osgi.cmpn/7.0.0/service.configurator.html#d0e131566) ) 파일이 있습니다. 이는 아카이브에서 클라이언트 확장이 구성되는 방식을 정의합니다. 일반적으로 이러한 파일은 `client-extension.yaml` 파일 내용을 기반으로 빌드 프로세스 중에 생성됩니다. YAML에서 JSON으로의 변환은 [Liferay 작업 공간 플러그인](https://repo1.maven.org/maven2/com/liferay/com.liferay.gradle.plugins.workspace/) 에 의해 지정되며 1:1 매핑이 아닙니다.

## `Dockerfile`

```{note}
각 LUFFA에는 하나 이상의 Dockerfile이 필요합니다.
```

빌드 프로세스는 [배치](./batch-client-extensions.md) , [구성](./configuration-client-extensions.md) 및 [프런트 엔드](./frontend-client-extensions.md) 클라이언트 확장에 대한 'Dockerfile'을 자동으로 생성하고 패키징합니다.

[마이크로서비스 클라이언트 확장](./microservice-client-extensions.md) 을 위해 프로젝트에 [`Dockerfile`](https://docs.docker.com/engine/reference/builder/) 제공해야 합니다. 프로젝트의 루트에 추가하면 프로젝트를 빌드할 때 LUFFA에 복사됩니다. `Dockerfile`이 프로젝트에서 마이크로서비스 클라이언트 확장을 실행할 수 있는지 확인하세요. 예를 들어 `Dockerfile`은 마이크로서비스 코드를 실행하는 데 필요한 특정 도구를 설치해야 할 수 있습니다.

### 클라이언트 확장을 수동으로 패키징

LUFFA를 직접 패키징하는 경우 배치, 구성 및 프런트 엔드 클라이언트 확장에는 특정 `Dockerfile` 규칙이 필요합니다. Liferay는 아래 이미지에서 이를 제공합니다.

배치 클라이언트 확장의 경우 'liferay/batch:latest' 이미지를 사용하세요.

```Dockerfile
FROM liferay/batch:latest
COPY /batch /batch
```

구성 클라이언트 확장의 경우 'liferay/noop:latest' 이미지를 사용하세요.

```Dockerfile
FROM liferay/noop:latest
```

프런트엔드 클라이언트 확장의 경우 'liferay/caddy:latest' 이미지를 사용하세요.

```Dockerfile
FROM liferay/caddy:latest
COPY static/ /public_html/
```

마이크로서비스 클라이언트 확장의 `Dockerfile`은 전적으로 특정 컨텍스트에 따라 달라지므로 사전 구성된 이미지를 제공할 수 없습니다.

## `LCP.json`

```{note}
각 LUFFA에는 `LCP.json` 파일이 필요합니다.
```

빌드 프로세스는 [배치](./batch-client-extensions.md) , [구성](./configuration-client-extensions.md) 및 [프런트엔드](./frontend-client-extensions.md) 에 대한 `LCP.json` 파일을 자동으로 생성하고 패키징합니다.

[마이크로서비스 클라이언트 확장](./microservice-client-extensions.md) 에 대한 프로젝트에 `LCP.json` 파일을 제공해야 합니다. 프로젝트의 루트에 추가하면 프로젝트가 빌드될 때 LUFFA에 복사됩니다. 이 'LCP.json' 파일은 Liferay Experience Cloud에 배포될 때 마이크로서비스에 사용되는 컨테이너를 구성합니다.

LUFFA를 직접 패키징하는 경우 각 클라이언트 확장에는 'LCP.json'에 대한 서로 다른 사양 제안이 제공됩니다.

| 클라이언트 확장                                                          | 상당한 자원 필요 | 친절한 | 주                                                                                                                                                                                                                                                                                    |
| :---------------------------------------------------------------- | :-------- | :-- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [배치](#example-batch-client-extension-lcp-json)         | ✘         | 직업  | <ul><li>환경 변수 `LIFERAY_BATCH_OAUTH_APP_ERC`는 배치 클라이언트 확장의 'oAuthApplicationHeadlessServer' 속성 값으로 설정되어야 합니다. 이는 보간을 통해 제공될 수 있습니다.</li><li>'cpu', 'memory' 및 'scale'에 대해 작은 값을 지정할 수 있습니다.</li></ul>                                                                                 |
| [구성](#example-configuration-client-extension-lcp-json) | ✘         | 직업  | <ul><li>일괄 확장보다 메모리 사용량이 훨씬 적습니다.</li><li>`cpu`, `memory` 및 `scale`에 매우 작은 값을 지정할 수 있습니다.</li></ul>                                                                                                                                                                                  |
| [프런트엔드](#example-frontend-client-extension-lcp-json)  | ✘         | 전개  | <ul><li>`targetPort`를 `80`으로 설정하여 `loadBalancer` 속성을 지정해야 합니다.</li><li>치유를 위해 [자가 치유](https://learn.liferay.com/w/liferay-cloud/troubleshooting/self-healing) 지정해야 합니다.</li><li>`cpu`, `memory` 및 `scale`에 대해 작은 값을 지정할 수 있습니다.</li></ul> |

### 배치 클라이언트 확장 예 LCP.json

```json
{
   "cpu": 0.2,
   "env": {
       "LIFERAY_BATCH_OAUTH_APP_ERC": "__batch.oAuthApplicationHeadlessServer__"
   },
   "id": "__CLIENT_EXTENSION_ID__",
   "kind": "Job",
   "memory": 50,
   "scale": 1
}
```

### 구성 클라이언트 확장 예 LCP.json

```json
{
    "cpu": 0.1,
    "id": "__CLIENT_EXTENSION_ID__",
    "kind": "Job",
    "memory": 10,
    "scale": 1
}
```

### 예제 프런트 엔드 클라이언트 확장 LCP.json

```json
{
    "cpu": 0.2,
    "id": "__CLIENT_EXTENSION_ID__",
    "kind": "Deployment",
    "livenessProbe": {
        "httpGet": {
            "path": "/",
            "port": 80
        }
    },
    "loadBalancer": {
        "cdn": true,
        "targetPort": 80
    },
    "memory": 50,
    "readinessProbe": {
        "httpGet": {
            "path": "/",
            "port": 80
        }
    },
    "scale": 1
}
```

자세한 내용은 [LCP.json을 통한 구성](https://learn.liferay.com/w/liferay-cloud/reference/configuration-via-lcp-json) 을 참조하세요.

## `static`

```{note}
`static` 디렉터리는 [프런트 엔드 클라이언트 확장 프로젝트에만 필요합니다](./frontend-client-extensions.md).
```

빌드된 LUFFA의 루트 레벨 `static/` 디렉토리에 정적 리소스 파일을 원하는 만큼 배치할 수 있습니다. `static/` 폴더 내에서 원하는 폴더 구조를 사용하세요. 프로젝트의 `client-extension.yaml` 파일에 정의된 프런트 엔드 클라이언트 확장이 없으면 이러한 파일은 무시됩니다.

## 마이크로서비스 리소스

다른 필수 파일과 충돌하지 않는 한 마이크로서비스 클라이언트 확장 프로젝트에 대해 빌드된 LUFFA에 추가 리소스를 포함할 수 있습니다.

## 관련 주제

* [클라이언트 확장 작업](./working-with-client-extensions.md)
* [liferay 작업공간](../tooling/liferay-workspace/what-is-liferay-workspace.md)
