# 웹 서버 서비스(Nginx)

Nginx 웹 서버는 개방형 인터넷에서 Liferay 클라우드 서비스로의 게이트웨이 역할을 합니다. 사용자의 모든 트래픽을 처리하고 고성능 웹 서버 역할을 합니다.

![웹 서버는 Liferay Cloud에서 사용할 수 있는 여러 서비스 중 하나입니다.](./web-server-service/images/01.png)

자세한 내용은 [웹 서버 서비스 제한](../reference/platform-limitations.md#web-server-service) 섹션을 참조하세요.

## 구성

Liferay Cloud의 서비스는 기본적으로 잘 작동하도록 미세 조정되어 있지만, Nginx를 추가로 구성해야 할 수도 있습니다. 이렇게 하려면 `configs/{ENV}/conf.d/` 폴더에 구성(`.conf`) 파일을 포함시키면 됩니다. 변경 사항을 배포하면 파일이 서비스에 자동으로 삽입되고 기본 구성을 덮어씁니다. 다음은 해당 디렉터리 내에 구성 파일이 있는 폴더 구조의 예시입니다: 

    webserver
    ├── configs
    │   └── common
    │       └── conf.d
    │           └── nginx.conf
    └── LCP.json

`/webserver/configs/{ENV}/` 의 파일은 Liferay Cloud의 웹 서버 컨테이너에 있는 `/etc/nginx/` 에 오버라이드로 복사됩니다. `/webserver/configs/{ENV}/public/` 에 있는 파일이 `var/www/html/`에 오버라이드로 복사됩니다.

## 자동 로그 로테이션

{bdg-secondary}`사용 가능한 웹 서버 버전 5.3.0 이상`

Nginx의 액세스 및 오류 로그(기본적으로 Nginx 컨테이너의 `/var/log/nginx/` 디렉터리에 저장됨)는 개별 파일이 너무 커져서 읽을 수 없게 되는 것을 방지하기 위해 자동으로 회전합니다. 일정한 간격(기본값은 UTC 자정마다)으로 현재 액세스 및 오류 로그 파일이 교체되고 새 파일로 교체됩니다. 파일이 특정 최대 크기 임계값(기본값은 50MB)에 도달하면 자동 회전도 수행됩니다.

로테이션 후 가장 최신 파일은 파일 이름에 `.0` 포스트픽스를 추가하여 생성되며, 이후 오래된 파일은 순차적으로 포스트픽스를 추가합니다(`.1`, `.2`등). 로테이션은 원활하게 처리되며 Nginx 또는 서비스의 일반 기능을 중단하지 않습니다.

웹 서버 서비스에서 이러한 환경 변수를 정의하여 회전 동작을 조정할 수 있습니다:

* `LCP_LOGROTATE_SCHEDULE`: 자동 로테이션 일정을 정의합니다(Cron 일정 구문 사용, UTC±00 기준).

* `LCP_LOGROTATE_FILE_SIZE`: 로그 파일이 자동으로 회전되기 전의 최대 크기를 정의합니다.

* `LCP_LOGROTATE_FILE_COUNT`: 컨테이너에 보관할 회전된 로그 파일의 최대 개수를 정의합니다.

## 환경 변수

이러한 환경 변수는 웹 서버 서비스에서 사용할 수 있습니다:

| 이름                                        | 기본값         | 묘사                                                                                                                                                                                                       |
|:----------------------------------------- |:----------- |:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `LCP_HAPROXY_RESOLVER_HOLD_TIME`          | `10`        | HAProxy 로드밸런서에 대해 [`hold` 구성](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-hold) 을 구성합니다. 이 구성은 `유효한` 상태용입니다.                                                                     |
| `LCP_HAPROXY_RESOLVER_RETRIES`            | `3`         | HAProxy 로드밸런서에 대해 [`resolve_retries` 구성](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-resolve_retries) (세션이 서버 연결을 포기하기 전에 시도하는 재시도 횟수)을 구성합니다.                                   |
| `LCP_HAPROXY_RESOLVER_TIMEOUT_RESOLVE`    | `1`         | HAProxy 로드밸런서에 대한 [`timeout` 구성](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-timeout) (이벤트 타임아웃 시간(초)을 구성합니다. 이 구성은 `resolve` 이벤트용입니다.                                           |
| `LCP_HAPROXY_RESOLVER_TIMEOUT_RETRY`      | `1`         | HAProxy 로드밸런서에 대한 [`timeout` 구성](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html#5.3.2-timeout) (이벤트 타임아웃 시간(초)을 구성합니다. 이 구성은 `다시 시도` 이벤트용입니다.                                             |
| `LCP_HAPROXY_SERVER_TEMPLATE_BACKEND_NUM` | `10`        | 모든 서비스의 최대 인스턴스 수를 재정의합니다. [자동 스케일링](../manage-and-optimize/auto-scaling.md)을 사용하려는 경우 필요한 가장 높은 값으로 설정합니다.                                                                                              |
| `LCP_LOGROTATE_FILE_COUNT`                | `52`        | [자동 회전](#automatic-log-rotation)이후 보관할 최대 Nginx 액세스 및 오류 로그 수(각각). 가장 오래된 파일은 이 제한을 초과하여 제거됩니다.                                                                                                          |
| `LCP_LOGROTATE_FILE_SIZE`                 | `50M`       | [자동 로그 로테이션을 강제하기 전에 Nginx 액세스 또는 오류 로그가 도달할 수 있는 최대 크기](#automatic-log-rotation).                                                                                                                       |
| `LCP_LOGROTATE_SCHEDULE`                  | `0 0 * * *` | [자동 Nginx 로그 회전](#automatic-log-rotation) 이 발생하는 시점에 대한 Cron 일정입니다.                                                                                                                                      |
| `LCP_WEBSERVER_LOG_FORMAT`                |             | Nginx 로깅 형식을 사용자 정의합니다. [공식 Nginx 문서](https://docs.nginx.com/nginx/admin-guide/monitoring/logging/#setting-up-the-access-log)를 참조하세요.                                                                    |
| `LCP_WEBSERVER_MODSECURITY`               | `Off`       | 모드 보안을 활성화 또는 비활성화합니다. 이 값을 `On` 으로 설정하여 규칙을 활성화하고 처리하거나 `DetectionOnly` 로 설정하여 방해 행위를 실행하지 않고 규칙을 처리합니다. [웹 애플리케이션 방화벽](../infrastructure-and-operations/security/web-application-firewall.md)을 참조하십시오. |

[인그레스 로드 밸런서](../infrastructure-and-operations/networking/load-balancer.md) 도 웹 서버 서비스를 통해 구성됩니다. 이 서비스에 환경 변수를 추가하여 로드 밸런서 및 사용자 지정 도메인을 구성할 수 있습니다. 자세한 내용은 [로드 밸런서 환경 변수 참조](../infrastructure-and-operations/networking/load-balancer.md#environment-variables-reference) 를 참조하세요.

모든 환경 변수 및 기타 형태의 Nginx 구성은 [공식 Nginx 문서](https://docs.nginx.com/)에 나와 있습니다. 이러한 구성은 `configs/{ENV}/` 디렉터리에서 설정할 수 있으며, 환경 변수는 서비스의 `LCP.json` 파일에서 설정할 수 있습니다.

## 스크립트

스크립트를 사용하여 보다 광범위한 사용자 지정을 할 수 있지만 이 경우 주의해야 합니다. 이는 웹 서버 서비스를 사용자 정의하는 가장 강력한 방법이지만 원치 않는 부작용이 발생할 수 있습니다.

`configs/{ENV}/scripts/` 폴더에 있는 `.sh` 파일은 서비스를 시작하기 전에 실행됩니다. 예를 들어 이 디렉토리 구조에 스크립트를 배치하여 모든 로그 파일을 제거할 수 있습니다:

    webserver
    ├── configs
    │   └── common
    │       └── scripts
    │           └── remove-log-files.sh
    └── LCP.json
