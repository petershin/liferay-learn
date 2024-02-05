# 웹 서버 서비스(Nginx)

Nginx 웹 서버는 개방형 인터넷에서 Liferay Cloud 서비스로의 게이트웨이 역할을 합니다. 사용자의 모든 트래픽을 처리하고 고성능 웹 서버 역할을 합니다.

![The web server is one of several services available in Liferay Cloud.](./web-server-service/images/01.png)

자세한 내용은 [웹 서버 서비스 제한 사항](../reference/platform-limitations.md#web-server-service) 섹션을 참조하세요.

## 구성

Liferay Cloud의 서비스는 기본적으로 잘 작동하도록 미세 조정되어 있지만 Nginx를 추가로 구성해야 할 수도 있습니다. 이렇게 하려면 `configs/{ENV}/conf.d/` 폴더 안에 구성(`.conf`) 파일을 포함하면 됩니다. 변경 사항을 배포하면 파일이 자동으로 서비스에 삽입되고 기본 구성을 덮어씁니다. 다음은 해당 디렉터리 내에 구성 파일이 있는 폴더 구조의 예입니다.

```
webserver
├── configs
│   └── common
│       └── conf.d
│           └── nginx.conf
└── LCP.json
```

`/webserver/configs/{ENV}/`의 파일은 Liferay Cloud의 웹 서버 컨테이너에 있는 `/etc/nginx/`에 재정의로 복사됩니다. `/webserver/configs/{ENV}/public/`의 파일은 `var/www/html/`에 재정의로 복사됩니다.

## 자동 로그 회전

{bdg-secondary}`웹서버 버전 5.3.0+`

Nginx의 액세스 및 오류 로그(기본적으로 Nginx 컨테이너의 `/var/log/nginx/` 디렉토리에 저장됨)는 개별 파일이 너무 커서 읽을 수 없게 되는 것을 방지하기 위해 자동으로 순환됩니다. 정기적으로(기본적으로 UTC 기준 매 자정) 현재 액세스 및 오류 로그 파일이 교체되고 새 파일로 대체됩니다. 파일이 특정 최대 크기 임계값(기본적으로 50MB)에 도달하는 경우에도 자동 회전이 발생합니다.

회전 후 최신 파일은 파일 이름에 접미사 `.0`을 붙여 생성되며, 이후의 오래된 파일에는 순차적으로 접미사가 붙습니다(`.1`, `.2` 등). 회전은 원활하게 처리되며 Nginx 또는 서비스의 일반 기능을 방해하지 않습니다.

웹 서버 서비스에서 다음 환경 변수를 정의하여 회전 동작을 조정할 수 있습니다.

* `LCP_LOGROTATE_SCHEDULE`: 자동 교체 일정을 정의합니다(UTC±00 단위의 Cron 일정 구문 사용).

* `LCP_LOGROTATE_FILE_SIZE`: 로그 파일이 자동으로 회전되기 전의 최대 크기를 정의합니다.

* `LCP_LOGROTATE_FILE_COUNT`: 컨테이너에 보관할 순환된 로그 파일의 최대 수를 정의합니다.

## 환경 변수

웹 서버 서비스에 사용할 수 있는 환경 변수는 다음과 같습니다.

| 이름                                        | 기본값         | 묘사                                                                                                                                                                                                                      |
| :---------------------------------------- | :---------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `LCP_HAPROXY_RESOLVER_HOLD_TIME`          | `10`        | HAProxy 로드 밸런서에 대해 ['hold' 구성](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-hold) 을 구성합니다. 이 구성은 '유효' 상태에 대한 것입니다.                                                                    |
| `LCP_HAPROXY_RESOLVER_RETRIES`            | `3`         | HAProxy 로드 밸런서에 대해 [`resolve_retries` 구성](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-resolve_retries) 을 구성합니다(세션이 포기하기 전에 서버 연결을 시도하는 재시도 횟수).                   |
| `LCP_HAPROXY_RESOLVER_TIMEOUT_RESOLVE`    | `1`         | HAProxy 로드 밸런서에 대해 ['timeout' 구성](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-timeout) 을 구성합니다(이벤트 시간 초과에 대한 초 수). 이 구성은 `resolve` 이벤트를 위한 것입니다.                  |
| `LCP_HAPROXY_RESOLVER_TIMEOUT_RETRY`      | `1`         | HAProxy 로드 밸런서에 대해 ['timeout' 구성](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-timeout) 을 구성합니다(이벤트 시간 초과에 대한 초 수). 이 구성은 `retry` 이벤트를 위한 것입니다.                    |
| `LCP_HAPROXY_SERVER_TEMPLATE_BACKEND_NUM` | `10`        | 모든 서비스의 최대 인스턴스 수를 재정의합니다. [자동 크기 조정](../manage-and-optimize/auto-scaling.md) 사용하려는 경우 이 값을 필요한 가장 높은 값으로 설정하세요.                                                                                              |
| `LCP_LOGROTATE_FILE_COUNT`                | `52`        | [자동 회전](#automatic-log-rotation) 이후 (각각에 대해) 보관할 Nginx 액세스 및 오류 로그의 최대 수입니다. 이 제한을 초과하면 가장 오래된 파일이 제거됩니다.                                                                                  |
| `LCP_LOGROTATE_FILE_SIZE`                 | `50M`       | Nginx 액세스 또는 오류 로그가 자동 로그 회전을 [하기 전에 도달할 수 있는 최대 크기](#automatic-log-rotation) .                                                                                                                               |
| `LCP_LOGROTATE_SCHEDULE`                  | `0 0 * * *` | 자동 Nginx 로그 로테이션](#automatic-log-rotation)이 발생하는 시점에 대한 Cron 스케줄입니다.                                                                                                                                           |
| `LCP_WEBSERVER_LOG_FORMAT`                |             | Nginx 로깅 형식을 사용자 정의합니다. [공식 Nginx 문서를 참조하세요](https://docs.nginx.com/nginx/admin-guide/monitoring/logging/#setting-up-the-access-log) .                                                                        |
| `LCP_WEBSERVER_MODSECURITY`               | `Off`       | ModSecurity를 활성화하거나 비활성화합니다. 규칙을 활성화하고 처리하려면 이 값을 'On'으로 설정하고, 중단 작업을 실행하지 않고 규칙을 처리하려면 'DetectionOnly'로 설정하세요. [웹 응용 프로그램 방화벽](..//tuning-security-settings/web-application-firewall.md) 참조하세요. |

[Ingress Load Balancer](../infrastructure-and-operations/networking/load-balancer.md) 도 웹 서버 서비스를 통해 구성됩니다. 이 서비스에 환경 변수를 추가하여 로드 밸런서 및 사용자 지정 도메인을 구성할 수 있습니다. 자세한 내용은 [로드 밸런서 환경 변수 참조](../infrastructure-and-operations/networking/load-balancer.md#environment-variables-reference) 를 참조하세요.

Nginx에 대한 모든 환경 변수 및 기타 구성 형태는 [공식 Nginx 문서](https://docs.nginx.com/) 에 있습니다. 이러한 구성은 `configs/{ENV}/` 디렉터리에서 설정하고 환경 변수는 서비스의 `LCP.json` 파일에서 설정할 수 있습니다.

## 스크립트

보다 광범위한 사용자 정의를 위해 스크립트를 사용할 수 있지만 그렇게 할 때는 주의해야 합니다. 이는 웹 서버 서비스를 사용자 정의하는 가장 강력한 방법이며 원하지 않는 부작용을 일으킬 수 있습니다.

`configs/{ENV}/scripts/` 폴더에 있는 모든 `.sh` 파일은 서비스를 시작하기 전에 실행됩니다. 예를 들어 다음 디렉터리 구조에 스크립트를 배치하여 모든 로그 파일을 제거할 수 있습니다.

```
webserver
├── configs
│   └── common
│       └── scripts
│           └── remove-log-files.sh
└── LCP.json
```
