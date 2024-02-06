# 웹 애플리케이션 방화벽

{bdg-secondary}`liferay 클라우드 5.xx`

Liferay Cloud에는 [ModSecurity](https://github.com/SpiderLabs/ModSecurity) 이라는 웹 애플리케이션 방화벽이 포함되어 있습니다. 사전 정의된 사용자 정의 규칙 세트를 기준으로 웹 서버로 전송된 요청을 검사합니다. 이 단계는 XSS, SQL 주입 및 민감한 정보의 손실로 이어질 수 있는 기타 형태의 하이재킹 시도와 같은 일반적인 웹 애플리케이션 실시간 L7 공격을 방지합니다.

Liferay Cloud에는 [개인 네트워크](../configuring-the-cloud-networkprivate-network.md) , 공용 [로드 밸런서](../configuring-the-cloud-networkload-balancer.md) ( [계층 7](https://www.nginx.com/resources/glossary/layer-7-load-balancing/) ) 및 [CDN](../configuring-the-cloud-networkload-balancer.md#cdn) 포함한 추가 네트워크 보안 기능이 포함되어 있습니다.

![Figure 1: The Web Application Firewall protects against common attacks.](./web-application-firewall/images/01.png)

```{note}
 [공유 클러스터 구독에서는 사용자 정의 방화벽 규칙을 사용할 수 없습니다.](../../reference/platform-limitations.md#security) .
```

## ModSecurity 활성화

ModSecurity는 기본적으로 비활성화되어 있습니다. 이를 활성화하려면 `LCP_WEBSERVER_MODSECURITY` [환경 변수](../../platform-services/web-server-service.md#environment-variables) 프로젝트 저장소의 `webserver/LCP.json` 파일에 추가하세요. 공격 탐지 규칙은 ModSecurity가 활성화된 경우에만 처리됩니다. [자신만의 규칙을 추가해야 합니다](#adding-attack-detection-rules) .

`LCP_WEBSERVER_MODSECURITY`에 허용되는 값은 다음과 같습니다.

* **켜기** : ModSecurity를 활성화합니다. 공격 탐지 규칙이 처리됩니다.

* **끄기** : ModSecurity를 비활성화합니다. 규칙이 처리되지 않습니다.

- **DetectionOnly** : ModSecurity를 활성화합니다. 규칙은 처리되지만 방해가 되는 작업(차단, 거부, 삭제, 허용, 프록시 또는 리디렉션)은 실행되지 않습니다.

```{tip}
`LCP_WEBSERVER_MODSECURITY` 환경 변수는 ModSecurity의 자체 [`SecRuleEngine` 지시문과 동일합니다](https://github.com/SpiderLabs/ModSecurity/wiki/Reference-Manual-%28v3.x%29#SecRuleEngine) .
```

ModSecurity를 활성화하려면 `LCP_WEBSERVER_MODSECURITY` 값을 `On` 또는 `DetectionOnly`로 설정한 다음 [변경 사항 배포](../../build-and-deploy/deploying-changes-via-the-cli-tool.md).

## ModSecurity 구성 변경

기본 ModSecurity 설정을 권장합니다. 기본 구성을 재정의하려면 프로젝트 저장소의 `webserver/configs/{ENV}/modsec/` 디렉토리에 `modsecurity.conf` 파일을 생성하세요. Liferay Cloud의 기본 `modsecurity.conf`를 완전히 재정의하므로 필요한 모든 구성을 제공해야 합니다.

[권장 설정의 이 예](https://github.com/SpiderLabs/ModSecurity/blob/v3/master/modsecurity.conf-recommended) 를 자신만의 `modsecurity.conf` 파일의 시작점으로 복사하세요. 이 파일을 사용하는 경우 `SecRuleEngineDetectionOnly`줄을 다음 줄로 바꾸세요.

```
SecRuleEngine ${LCP_WEBSERVER_MODSECURITY}
```

허용되는 설정에 대한 자세한 내용은 [ModSecurity 참조 매뉴얼](https://github.com/SpiderLabs/ModSecurity/wiki/Reference-Manual-%28v3.x%29) 을 참조하세요.

## 공격 탐지 규칙 추가

공격 탐지 규칙은 기본적으로 제공되지 않습니다. 특정 요구 사항에 따라 규칙을 제공해야 합니다.

### OWASP ModSecurity 핵심 규칙 세트

OWASP Foundation의 ModSecurity 핵심 규칙 세트(CRS)는 Liferay Cloud와 함께 사용하는 것이 좋습니다. OWASP CRS [여기](https://coreruleset.org/installation/) 다운로드할 수 있습니다.

OWASP CRS를 ModSecurity에 추가하려면,

1. 다운로드한 아카이브를 'webserver/configs/{ENV}/modsec/rules/' 저장소 폴더에 압축을 풉니다.

1. `crs-setup.conf.example`을 `webserver/configs/{ENV}/modsec/` 폴더로 이동합니다.

1. `crs-setup.conf.example`의 이름을 `crs-setup.conf`로 바꿉니다.

1. `crs-setup.conf` 파일을 열고 파일의 마지막 줄에 다음을 추가하세요.

```
/etc/nginx/modsec/rules/*.conf
```

1. 파일을 저장소에 커밋하고 변경 사항을 [합니다](../../build-and-deploy/deploying-changes-via-the-cli-tool.md).

[를](#enabling-modsecurity) 하면 규칙 세트가 해석됩니다.

## ModSecurity 감사 로그 사용

[이 활성화되면](#enabling-modsecurity) ModSecurity는 감사 로그를 자동으로 생성하여 모든 트랜잭션에 대한 자세한 정보를 기록합니다. 기록된 정보를 보려면 웹 서버의 `/var/log` 디렉토리에서 `modsec_audit.log` 파일을 엽니다.

자체 `modsecurity.conf` 파일을 제공하여 [ModSecurity를 구성하는 경우](#changing-modsecuritys-configuration) `modsec_audit.log` 대신 웹 서버 콘솔(다운로드할 수 있음)에 정보를 기록할 수 있습니다. `modsecurity.conf` 파일에서 다음 줄을 변경하세요.

```
SecAuditLog /var/log/modsec_audit.log
```

콘솔의 각 트랜잭션에 대한 감사 로그를 인쇄하려면 `/var/log/modsec_audit.log`를 `/dev/stdout`으로 바꾸세요. 변경 사항을 배포하면 감사 로그가 나타납니다.

원하는 경우 `modsecurity.conf` 파일에 한 줄을 추가하여 감사 로그 형식을 JSON으로 변경합니다.

```
SecAuditLogFormat JSON
```

## 관련 주제

* [사설망](../configuring-the-cloud-networkprivate-network.md)
* [로드밸런서](../configuring-the-cloud-networkload-balancer.md)
* [CDN](../configuring-the-cloud-networkload-balancer.md#cdn)