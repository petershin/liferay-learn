# 웹 서버 서비스(Nginx)

Nginx 웹 서버는 개방형 인터넷에서 Liferay Cloud 서비스로 연결되는 게이트웨이 역할을 합니다. 사용자의 모든 트래픽을 처리하고 고성능 웹 서버 역할을 합니다.

![웹 서버는 Liferay Cloud에서 사용할 수 있는 여러 서비스 중 하나입니다.](./web-server-service/images/01.png)

자세한 내용은 [웹 서버 서비스 제한](../reference/platform-limitations.md#web-server-service) 섹션을 참조하십시오.

## 구성

Liferay Cloud의 서비스는 기본적으로 제대로 작동하도록 미세 조정되어 있지만 Nginx를 추가로 구성해야 할 수도 있습니다. 이를 위해 `configs/{ENV}/conf.d/` 폴더 안에 CONF 파일을 포함할 수 있습니다. 변경 사항을 배포하면 파일이 자동으로 서비스에 삽입되고 기본 구성을 덮어씁니다. 다음은 해당 디렉토리에 있는 이러한 파일의 폴더 구조 예입니다. 

    webserver
    ├── configs
    │   └── common
    │       └── conf.d
    │           └── nginx.conf
    └── LCP.json

`/webserver/configs/{ENV}/` 에 있는 파일은 Liferay Cloud의 웹 서버 컨테이너에서 /etc/nginx/에 재정의로 복사됩니다. `/webserver/configs/{ENV}/public/` 의 파일은 재정의로 var/www/html/에 복사됩니다.

```{note}
버전 3.xx 서비스를 사용하는 경우 Nginx 구성은 대신 적절한 `lcp/webserver/config/{ENV}/` 디렉토리에 속합니다. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해하기](../reference/understanding-service-stack-versions.md)를 참조하십시오.
```

## 환경 변수

다음 환경 변수는 웹 서버 서비스에 사용할 수 있습니다.

| 이름                                        | 기본값  | 묘사                                                                                                                                                                                                              |
|:----------------------------------------- |:---- |:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `LCP_HAPROXY_RESOLVER_HOLD_TIME`          | `10` | HAProxy 로드 밸런서에 대한 [`hold` 구성](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-hold) 을 구성합니다. 이 구성은 `유효` 상태용입니다.                                                                            |
| `LCP_HAPROXY_RESOLVER_RETRIES`            | `3`  | HAProxy 로드 밸런서에 대한 [`resolve_retries` 구성](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-resolve_retries) 을 구성합니다(포기하기 전에 세션이 서버에 연결을 시도하는 재시도 횟수).                                        |
| `LCP_HAPROXY_RESOLVER_TIMEOUT_RESOLVE`    | `1`  | HAProxy 로드 밸런서에 대한 [`시간 초과` 구성](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-timeout) 을 구성합니다(이벤트 시간 초과 시간(초)). 이 구성은 `해결` 이벤트용입니다.                                                      |
| `LCP_HAPROXY_RESOLVER_TIMEOUT_RETRY`      | `1`  | HAProxy 로드 밸런서에 대한 [`시간 초과` 구성](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-timeout) 을 구성합니다(이벤트 시간 초과 시간(초)). 이 구성은 `재시도` 이벤트용입니다.                                                     |
| `LCP_HAPROXY_SERVER_TEMPLATE_BACKEND_NUM` | `10` | 모든 서비스의 최대 인스턴스 수를 재정의합니다. [자동 크기 조정](../manage-and-optimize/auto-scaling.md) 을 사용하려는 경우 필요한 가장 높은 값으로 설정합니다.                                                                                                |
| `LCP_WEBSERVER_LOG_FORMAT`                |      | Nginx 로깅 형식을 사용자 지정합니다. [공식 Nginx 문서](https://docs.nginx.com/nginx/admin-guide/monitoring/logging/#setting-up-the-access-log) 를 참조하십시오.                                                                          |
| `LCP_WEBSERVER_MOD_SECURITY`              | `끔`  | ModSecurity를 활성화 또는 비활성화합니다. 규칙을 활성화하고 처리하려면 이 값을 `On` 로 설정하고 중단 작업을 실행하지 않고 규칙을 처리하려면 `DetectionOnly` 으로 설정합니다. [웹 애플리케이션 방화벽](../infrastructure-and-operations/security/web-application-firewall.md)을 참조하십시오. |

[수신 로드 밸런서](../infrastructure-and-operations/networking/load-balancer.md) 도 웹 서버 서비스를 통해 구성됩니다. 이 서비스에 환경 변수를 추가하여 로드 밸런서 및 사용자 지정 도메인을 구성할 수 있습니다. 자세한 내용은 [로드 밸런서 환경 변수 참조](../infrastructure-and-operations/networking/load-balancer.md#environment-variables-reference) 을 참조하십시오.

Nginx에 대한 모든 환경 변수 및 기타 구성 형식은 [공식 Nginx 문서](https://docs.nginx.com/) 에 있습니다. `configs/{ENV}/` 디렉터리에서 이러한 구성을 설정하고 서비스의 `LCP.json` 파일에서 환경 변수를 설정할 수 있습니다.

## 스크립트

보다 광범위한 사용자 정의를 위해 스크립트를 사용할 수 있습니다. 그러나 그렇게 할 때는 하십시오. 이것은 웹 서버 서비스를 사용자 정의하는 가장 강력한 방법이며 은 원하지 않는 부작용을 일으킬 수 있습니다.

`configs/{ENV}/scripts/` 폴더에 있는 `.sh` 파일은 서비스를 시작하기 전에 실행됩니다. 예를 들어 모든 로그 파일을 제거하는 스크립트를 포함하려면 다음 디렉토리 구조에 배치할 수 . 

    webserver
    ├── configs
    │   └── common
    │       └── scripts
    │           └── remove-log-files.sh
    └── LCP.json

```{note}
버전 3.xx 서비스를 사용하는 경우 웹 서버 스크립트는 대신 적절한 `lcp/webserver/script/{ENV}/` 디렉토리에 속합니다. 버전 확인에 대한 자세한 내용은 [서비스 스택 버전 이해하기](../reference/understanding-service-stack-versions.md)를 참조하십시오.
```
