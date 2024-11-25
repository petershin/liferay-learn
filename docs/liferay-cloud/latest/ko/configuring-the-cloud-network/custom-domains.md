# 맞춤 도메인

Liferay Cloud를 사용하면 DNS 공급자를 통해 사용자 정의 도메인을 환경 서비스에 연결할 수 있습니다.

이렇게 하려면 먼저 사용자 환경의 로드 밸런서 IP 주소로 사용자 정의 도메인을 등록하십시오. 그런 다음 Liferay Cloud 콘솔 또는 서비스의 LCP.json 파일을 통해 원하는 서비스에 도메인을 추가합니다.

```{warning}
사용자 지정 도메인에 대한 변경 또는 추가가 전파되는 데 최대 60분이 걸릴 수 있습니다.
```

* [환경 IP에 사용자 지정 도메인 등록](#registering-a-custom-domain-with-an-environment-ip)
* [Liferay 클라우드 서비스에 사용자 지정 도메인 추가](#adding-a-custom-domain-to-a-liferay-cloud-service)
* [사용자 지정 도메인의 상태 확인](#verifying-the-status-of-a-custom-domain)

## 환경 IP에 사용자 지정 도메인 등록

각 프로젝트 환경에는 사용자 지정 도메인을 환경 서비스에 연결하는 데 사용할 수 있는 자체 Ingress Load Balancer IP가 있습니다.

이 IP는 각 환경의 **네트워크** 페이지와 **맞춤 도메인** 아래의 각 서비스 전용 페이지에 나열됩니다.

![그림 1: 환경의 네트워크 페이지에서 환경의 인그레스 로드 밸런서 IP를 찾을 수 있습니다.](./custom-domains/images/01.png)

환경 서비스에 도메인을 추가하기 전에 유형 `A` 레코드로 환경의 전용 IP에 사용자 지정 도메인을 등록합니다. 선택한 도메인 이름 등록 기관을 사용하여 이 작업을 수행할 수 있습니다.

다음 예에서는 Cloudflare를 사용하여 DNS 레코드를 생성합니다.

![그림 2: 이 예에서는 Cloudflare를 도메인 이름 등록 대행자로 사용하여 DNS 레코드를 생성합니다.](./custom-domains/images/02.png)

DNS 전파가 완전히 적용되려면 최대 24-48시간이 걸릴 수 있지만 경우에 따라 몇 분 밖에 걸리지 않습니다.

이 전파 프로세스 동안 한 장치는 업데이트된 주소의 도메인에 도달할 수 있지만 다른 장치는 도달할 수 없습니다. 이것은 장치가 도달하는 DNS 서버에 따라 다릅니다.

준비가 되면 모든 장치에서 도메인에 연결할 수 있으며 Liferay Cloud의 로드 밸런서에서 표준 `기본 백엔드 - 404` 오류를 반환합니다.

## Liferay 클라우드 서비스에 사용자 지정 도메인 추가

도메인이 준비되면 Liferay Cloud 콘솔 또는 `LCP.json` 파일을 통해 환경의 서비스에 도메인을 추가할 수 있습니다.

```{important}
최대 50개의 사용자 지정 도메인을 환경의 서비스에 추가할 수 있습니다.
```

Liferay Cloud 콘솔을 통해 환경 서비스에 사용자 정의 도메인을 추가하려면 다음 단계를 따르십시오.

1. 원하는 환경으로 이동합니다.

1. 사용자 지정 도메인을 추가할 서비스를 선택합니다.

1. **사용자 지정 도메인** 탭을 클릭합니다.

1. 환경에 등록된 사용자 정의 도메인을 **도메인 이름** 필드에 입력하십시오.

    ![그림 3: 서비스의 Custom Domains 탭을 사용하여 도메인을 추가합니다.](./custom-domains/images/03.png)

1. **사용자 지정 도메인 업데이트** 을 클릭하여 추가를 완료합니다.

```{note}
Liferay Cloud 콘솔을 통해 사용자 지정 도메인을 추가하면 [Let's Encrypt](https://letsencrypt.org/) 에서 제공하는 모든 인증서가 자동으로 사용됩니다. 사용자 지정 도메인에 [사용자 지정 SSL 인증서](./load-balancer.md#custom-ssl) 를 사용하려면 대신 웹 서버의 `LCP.json` 파일을 통해 인증서를 추가해야 합니다.
```

### LCP.json을 통해 사용자 지정 도메인 추가

또는 `customDomains` 속성을 `LCP.json` 파일에 추가하여 환경의 서비스가 사용하는 도메인을 바꿀 수 있습니다. 특정 환경에 대한 `환경` 속성 내에 속성을 추가합니다.

```json
{
    "id": "webserver",
    "environments":
    {
        "uat":
        {
            "loadBalancer":
            {
                "customDomains": ["acme.com", "www.acme.com"]
            }
        }
    } 
}
```

```{important}
추가된 각 사용자 지정 도메인에 대해 특정 환경을 정의해야 하며, 여러 환경에서 동일한 사용자 지정 도메인을 사용할 수 없습니다([재해 복구 환경](../../support-and-troubleshooting/troubleshooting/configuring-cross-region-disaster-recovery.md) 다른 지역에서). 이는 Liferay Cloud가 인증서를 올바르게 생성하고 사용자를 올바른 도메인으로 라우팅하는 데 필요합니다.
```

사용자 지정 도메인이 서비스에 추가되고 변경 사항이 배포되면 Liferay Cloud가 라우팅을 처리합니다.

```{note}
사용자 정의 도메인 수는 프로비저닝 프로세스 중에 설정된 할당량으로 제한될 수 있습니다. Liferay Cloud는 자체 로드 밸런서를 50개의 사용자 지정 도메인으로 제한합니다.
```

## 사용자 지정 도메인의 상태 확인

다음 두 가지 방법으로 사용자 지정 도메인의 상태를 확인할 수 있습니다.

* 브라우저를 열고 사용자 정의 도메인을 입력하십시오. 엔드포인트가 준비되면 더 이상 `기본 백엔드 - 404` 오류 또는 보안 경고를 반환하지 않습니다.
* 환경의 **네트워크** 페이지로 이동하여 Liferay Cloud 콘솔을 통해 서비스 도메인의 상태를 확인하십시오.

![그림 4: 네트워크 페이지에서 모든 엔드포인트와 사용자 지정 도메인을 봅니다.](./custom-domains/images/04.png)

백엔드 프로세스로 인해 구성 후 사용자 지정 도메인을 확인하는 데 시간이 걸릴 수 있습니다. 사용자 지정 도메인을 확인할 수 있는 시간에 영향을 미치는 백엔드 프로세스에는 Liferay Cloud의 로드 밸런서에 경로 추가, [Let's Encrypt](https://letsencrypt.org/) 을 통해 SSL 서버 인증서 요청, Let's Encrypt에서 챌린지 수신, 인증서로 로드 밸런서 업데이트가 포함됩니다. 일단 도전을 통과합니다.

```{important}
사용자가 챌린지 프로세스 중에 도메인에 도달하려고 시도하면 브라우저는 무시해도 되는 보안 경고를 표시합니다.
```

백엔드 프로세스가 완료되면 Liferay Cloud의 로드 밸런서가 SSL 서버 인증서로 업데이트되고 서비스에 도달할 수 있고 안전합니다.

하나 이상의 사용자 지정 SSL 인증서를 설정하는 방법을 포함하여 Liferay Cloud의 SSL 인증서에 대한 자세한 내용은 [로드 밸런서](./load-balancer.md) 을 참조하십시오.

## 관련 주제

* [로드 밸런서](./load-balancer.md)
* [LCP.json을 통한 구성](../../reference/configuration-via-lcp-json.md)
