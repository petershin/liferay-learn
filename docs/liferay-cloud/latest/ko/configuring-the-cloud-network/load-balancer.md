# 로드 밸런서

Ingress 로드 밸런서는 TLS(1.0~1.2) 프로토콜을 사용하여 프록시된 HTTP(S) 연결을 통해 환경 서비스에 대한 인터넷 액세스를 제공합니다. 각 로드 밸런서에는 사용자 지정 도메인을 설정하는 데 사용할 수 있는 정적 IP가 있습니다.

![사용자 정의 도메인으로 환경의 로드 밸런서를 구성할 수 있습니다.](./load-balancer/images/01.png)

전용 로드 밸런서가 있으면 포트 구성, 사용자 지정 SSL 인증서 및 CDN과 같은 수많은 향상된 기능을 제공합니다. 이러한 기능은 서비스의 `LCP.json` 파일에서 구성할 수 있습니다.

```json
{
  "id": "webserver",
  "loadBalancer": {
    "cdn": true,
    "targetPort": 80,
    "customDomains": ["acme.liferay.cloud"],
    "ssl": {
      "key": "...",
      "crt": "..."
    }
  }
}
```

## CDN

Liferay의 CDN(Content Delivery Network)은 Liferay Cloud의 기본 제공 기능입니다. 백엔드 서버(인스턴스)로 콘텐츠를 보내는 대신 사용자에게 더 가까운 POP(Point-of-Presence)에서 콘텐츠를 캐싱하고 제공하는 클라이언트와 원본 서버 사이의 프록시 역할을 합니다.

캐시 가능한 콘텐츠에 대한 DDoS 공격이 발생하는 경우 요청이 원본 서버 대신 전 세계적으로 분산된 POP로 전송되어 공격을 흡수할 수 있는 더 많은 사이트를 제공합니다. 글로벌 정적 콘텐츠를 캐싱하면 전송 속도도 크게 향상됩니다.

기본적으로 CDN은 `dev` 환경을 제외한 모든 환경에서 활성화됩니다. `loadbalancer` 개체 내에서 `cdn` 값을 설정하여 서비스( `LCP.json` 파일에서)에 대한 CDN을 활성화하거나 비활성화할 수 있습니다.

```json
{
    "loadBalancer": {
        "cdn": true
    }
}
```

![CDN의 상태는 네트워크 페이지에서 볼 수 있습니다.](./load-balancer/images/02.png)

```{note}
CDN은 현재 두바이/UAE 북부 지역에서 지원되지 않습니다.
```

### CDN 캐시 지우기

CDN은 정적 콘텐츠를 사용자에게 전달하기 위한 대기 시간을 줄여 성능을 향상시킵니다. 그러나 콘텐츠가 더 이상 유효하지 않은 경우 캐시가 업데이트되기 전에 이 콘텐츠 중 일부가 사용자에게 전달될 수 있습니다.

콘텐츠를 강제로 다시 검색하기 위해 CDN 캐시를 지워야 하는 경우 Liferay Cloud 콘솔에서 수동으로 지울 수 있습니다.

1. Liferay Cloud 콘솔에 로그인하고 적절한 환경으로 이동합니다.

1. 왼쪽 메뉴에서 **네트워크** 을 클릭합니다.

1. **CDN** 섹션에서 **CDN 캐시 지우기...를 클릭합니다.**

    ![사용자 환경의 네트워크 페이지에서 CDN 캐시 지우기 버튼을 클릭합니다.](./load-balancer/images/03.png)

1. CDN 캐시 지우기 페이지에서 모든 확인란을 선택하여 캐시 지우기 결과를 이해하고 있으며 CDN이 활성화된 모든 서비스에 적용된다는 것을 확인합니다.

    ![CDN 캐시 지우기 페이지.](./load-balancer/images/04.png)

1. **캐시 정리 요청** 을 클릭하십시오.

버튼을 클릭하면 캐시를 지우라는 요청이 전송됩니다. 캐시가 지워지는 데 최대 30분이 소요됩니다.

```{warning}
CDN 캐시를 너무 자주 지우면 서버 성능에 부정적인 영향을 미칠 수 있습니다. 그렇지 않으면 캐시가 제공했을 서비스에 대한 요청이 단기적으로 급증할 수 있기 때문입니다. 이 영향을 완화하려면 캐시 지우기를 예외적인 상황으로 제한하십시오.
```

## 항구

로드 밸런서의 서비스 엔드포인트가 라우팅하는 내부 포트(`targetPort`)를 설정할 수 있습니다. Liferay Cloud는 제공하는 서비스에 대해 올바른 포트를 자동으로 구성합니다.

```json
"targetPort": 3000
```

![로드 밸런서는 포트 구성을 보여줍니다.](./load-balancer/images/05.png)

## 맞춤형 SSL

서비스에 대한 로드 밸런서 속성을 지정하면 다음 이름 지정 패턴을 사용하여 서비스 엔드포인트가 추가됩니다.

- `<SERVICE-NAME>-<PROJECT-NAME>-<ENVIRONMENT-NAME>.lfr.cloud`

`.lfr.cloud` 에서 Liferay Cloud의 인프라에 의해 생성된 도메인은 네트워크 페이지의 SSL 인증서 섹션에 표시되지 않는 와일드카드 인증서로 덮여 있습니다.

콘솔을 통해 추가된 모든 사용자 지정 도메인 또는 `LCP.json`에 대해 Liferay Cloud는 자동으로 갱신되고 생성한 모든 사용자 지정 도메인을 다루는 인증서를 위해 [Let's Encrypt](https://letsencrypt.org/) 에 도달합니다.

### 사용자 지정 SSL 인증서 추가

또한 자신이 만든 모든 사용자 지정 도메인을 보호하기 위해 자신의 SSL 인증서를 추가할 수 있습니다. Let's Encrypt에서 제공하는 SSL 인증서(Liferay Cloud 콘솔을 통해 추가된 사용자 정의 도메인용)를 사용하거나 `webserver` 서비스의 `LCP.json` 파일에서 비밀 값을 참조하여 하나 이상의 사용자 정의 인증서를 정의할 수 있습니다. 인증서가 두 사이트 모두에 있는 경우 `LCP.json` 파일에 정의된 모든 사용자 지정 인증서가 우선합니다.

사용자 지정 인증서를 생성할 때 Liferay Cloud는 캡슐화 경계를 포함해야 하는 [Base64](https://tools.ietf.org/html/rfc4648#section-4) 인코딩이 있는 적절한 PEM 형식의 키와 인증서만 허용한다는 점에 유의하십시오.

`LCP.json` 파일에 단일 SSL 인증서를 추가하려면:

1. 인증서의 `키` 및 `crt` 값에 대해 선택한 환경에 [개의 비밀 변수](../tuning-security-settings/managing-secure-environment-variables-with-secrets.md#adding-a-new-secret) 을 추가합니다.

1. 프로젝트 리포지토리의 `webserver/LCP.json` 파일에서 `loadbalancer` 객체 내부에 `ssl` 객체를 추가하고 추가한 비밀에 대한 키를 [참조하는 `키` 및 `crt` 값을 사용하여](../tuning-security-settings/managing-secure-environment-variables-with-secrets.md#adding-secret-variables-via-lcp-json) :

```json
{
    "loadbalancer": {
        "ssl": {
            "key": "@ssl-key-secret",
            "crt": "@ssl-crt-secret"
        }
    }
}
```

`LCP.json` 파일에서 `ssl` 개체를 사용하면 이 환경에서 사용되는 모든 사용자 지정 도메인에 매핑되는 단일 사용자 지정 SSL 인증서가 생성됩니다.

### 여러 SSL 인증서를 사용자 지정 도메인에 매핑

또한 `ssl` 개체 대신 `certs` 속성을 사용하여 서로 다른 SSL 인증서를 여러 사용자 지정 도메인에 매핑할 수 있습니다.

웹 서버의 `LCP.json` 파일에서 `certs` 속성을 사용하여 사용할 수 있는 인증서 목록을 만듭니다. 각 인증서에 대한 `키` 및 `crt` 값을 매핑할 사용자 지정 도메인과 함께 그룹화합니다.

```json
{
    "loadbalancer": {
        "certs": [
            {
                "customDomains": ["acme.liferay.cloud"],
                "key": "...",
                "crt": "..."
            },
            {
                "customDomains": ["acme2.liferay.cloud"],
                "key": "...",
                "crt": "..."
            }
        ]
    }
}
```

```{note}
여러 SSL 인증서를 사용자 지정 도메인에 매핑하려면 `webserver` 서비스의 `LCP.json` 파일에 `certs` 속성을 추가해야 합니다. 대신 Liferay Cloud 콘솔을 통해 사용자 정의 도메인을 추가하면 모든 사용자 정의 도메인이 단일 인증서에 매핑됩니다.
```

### SSL 인증서 생성

키를 생성할 때 RSA-2048 또는 ECDSA P-256 암호화 알고리즘을 사용해야 하며 암호로 보호된 키를 사용하지 않아야 합니다.

사용자 지정 인증서가 만들어지면 사용자는 이를 관리할 책임이 있습니다(예: 새 사용자 지정 도메인이 추가되면 업데이트하고 만료되면 갱신).

아직 인코딩되지 않은 경우 인증서와 키 파일 모두 다음 스니펫과 같은 텍스트를 포함할 수 있습니다(각각 시작/종료 태그에 `CERTIFICATE` 또는 `KEY` 포함).

```xml
-----BEGIN CERTIFICATE-----
base64encodedcertificate
-----END CERTIFICATE-----
```

이러한 파일의 내용을 인코딩하고 사용하려면 다음 단계를 수행하십시오.

1. `키` 및 `인증서` 콘텐츠에 대한 새 파일을 만듭니다.

    ```bash
    touch originalkeyfile.key
    ```

    ```bash
    touch originalcertfile.crt
    ```

1. `key` 파일을 열고 **시작 및 종료 키 태그 사이 및 포함** 모든 내용을 복사한 다음 생성된 새 파일에 복사합니다(이 예에서는 `originalkeyfile.key`). . 파일을 저장합니다.

1. `cert` 파일을 열고 **시작 및 종료 cert 태그 사이 및 포함** 모든 내용을 복사한 다음 이를 위해 생성된 새 파일(이 예에서는 `originalcertfile.crt`)에 복사합니다. . 파일을 저장합니다.

1. 다음 명령을 실행하거나 다른 기본 인코딩 방법을 사용하여 파일을 base64 인코딩을 사용하여 새 파일로 변환합니다.

    ```bash
    openssl base64 -in originalkeyfile.key -out base64keyfile.key
    ```

    ```bash
    openssl base64 -in originalcertfile.crt -out base64certfile.crt
    ```

1. 새로 인코딩된 `key` 파일(이 예에서는 `base64keyfile.key`)에서 모든 콘텐츠를 복사하여 `webserver` 서비스의 `LCP.json` 파일에 있는 `key` 변수에 붙여넣습니다.

1. 새로 인코딩된 `cert` 파일(이 예에서는 `base64certfile.crt`)에서 모든 콘텐츠를 복사하여 `webserver` 서비스의 `LCP.json` 파일에 있는 `crt` 변수에 붙여넣습니다.

이제 `키` 및 `인증서` 값이 인코딩되어 웹 서버 구성에서 사용할 수 있습니다.

```{tip}
인증서를 단일 문자열로 연결한 다음 결과를 'crt' 필드에 대해 base-64로 인코딩하여 'cert'에 대한 여러 값을 포함할 수 있습니다.
```

네트워크 페이지에는 서비스당 최대 1개의 사용자 지정 인증서가 표시됩니다. 자세한 내용은 [사용자 정의 도메인](./custom-domains.md)을 참조하십시오.

![Liferay Cloud는 맞춤형 도메인을 다루는 SSL 인증서의 상태를 보여줍니다.](./load-balancer/images/06.png)

## 환경 변수 참조

| 이름              | 가치                                 | 묘사                                                                                                                                                                       |
|:--------------- |:---------------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `cdn`           | 틀린                                 | CDN은 기본적으로 비활성화되어 있습니다. `true`로 설정하여 활성화할 수 있습니다.                                                                                                                        |
| `customDomains` | ["example.com", "www.example.com"] | 사용자 지정 도메인의 이름입니다. 둘 이상을 나열할 수 있습니다.                                                                                                                                     |
| `targetPort`    | 3000                               | 로드 밸런서의 포트 번호                                                                                                                                                            |
| `열쇠`            |                                    | Base64 형식의 SSL 인증서 키입니다. 이것을 [`ssl`](#adding-custom-ssl-certificates) 개체 또는 [`certs`](#mapping-multiple-ssl-certificates-to-custom-domains) 개체로 그룹화합니다(여러 인증서를 나열하기 위해). |
| `crt`           |                                    | Base64 형식의 SSL 인증서 crt. 이것을 [`ssl`](#adding-custom-ssl-certificates) 개체 또는 [`certs`](#mapping-multiple-ssl-certificates-to-custom-domains) 개체로 그룹화합니다(여러 인증서를 나열하기 위해).  |

## 관련 주제

* [개인 네트워크](./private-network.md)
* [VPN 통합 개요](./vpn-integration-overview.md)
* [맞춤 도메인](./custom-domains.md)
