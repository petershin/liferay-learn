# 사이트 도메인 구성

이제 Delectable Bonsai 사이트가 실행되고 있으므로 도메인 이름에 연결할 수 있습니다.

여기에서는 사이트에 대한 사용자 정의 도메인을 등록하고 구성합니다.

```{important}
이 연습에서는 도메인 등록 서비스를 사용하여 자신만의 맞춤 도메인을 예약했다고 가정합니다. 
```

## 수신 로드 밸런서 IP 주소 찾기

먼저 프로덕션 환경의 Ingress 로드 밸런서 IP 주소를 찾으세요.

1. Liferay Cloud 콘솔에서 프로덕션 환경으로 이동하고 왼쪽 메뉴에서 **Network** 클릭합니다.

1. 네트워크 페이지에서 로드 밸런서의 IP 주소가 수신 엔드포인트 섹션에 표시됩니다.

![로드 밸런서의 IP 주소는 네트워크 페이지의 수신 엔드포인트 섹션 하단에 표시됩니다.](./configuring-your-sites-domain/images/01.png)

## 사용자 정의 도메인 등록

원하는 도메인 등록 서비스를 이용하여 프로덕션 환경에 맞는 IP 주소로 원하는 도메인을 등록하세요. 자신의 사이트에 사용할 도메인 이름을 선택하세요. 도메인을 유형 `A` 레코드로 등록합니다.

다른 환경에 대해 추가 사용자 지정 도메인 또는 하위 도메인을 구성하려는 경우 해당 환경의 **네트워크** 페이지에서 IP 주소를 찾아 도메인 등록에 사용하세요.

도메인 등록 및 IP 주소 지정에 대한 자세한 내용은 선택한 도메인 등록 서비스 설명서를 참조하세요.

## 웹 서버 서비스 구성

마지막으로 등록한 사용자 지정 도메인을 사용하도록 웹 서버 서비스를 구성합니다.

1. Liferay Cloud 콘솔에서 프로덕션 환경으로 이동합니다.

1. 왼쪽 메뉴에서 **서비스** 클릭하세요.

1. `웹서버` 서비스를 선택하세요.

1. **사용자 정의 도메인** 탭을 클릭합니다.

1. 등록한 도메인으로 **Domain Names** 목록에 새 항목을 추가합니다.

   ![www.delectablebonsai.com을 사용하여 이 예와 같이 도메인 이름을 구성하십시오.](./configuring-your-sites-domain/images/02.png)

1. **사용자 정의 도메인 업데이트** 을 클릭하십시오.

웹 서버는 구성한 새 도메인 이름을 사용합니다. 추가 도메인 또는 하위 도메인을 등록한 경우 동일한 프로세스에 따라 UAT 환경의 웹 서버 서비스를 구성하십시오.

![추가 도메인이나 하위 도메인이 등록된 경우 UAT 환경도 구성하세요.](./configuring-your-sites-domain/images/03.png)

## 사용자 정의 도메인 확인

사용자 정의 도메인을 지정하면 Liferay Cloud는 [Let's Encrypt](https://letsencrypt.org/) 을 통해 도메인에 대한 SSL 인증서를 자동으로 생성합니다. 이 작업을 완료하는 데는 1시간 미만 또는 여러 시간이 걸릴 수 있습니다.

```{note}
도메인에 대한 SSL 인증서를 사용하여 로드 밸런서를 보호하고 업데이트하는 것은 일반적으로 사이트에 대한 경로를 업데이트하는 것보다 시간이 더 걸립니다. 인증서 업데이트가 완료되기 전에 사용자 지정 도메인으로 사이트에 액세스하려고 하면 업데이트가 완료될 때까지 브라우저에 보안 경고가 표시됩니다.
```

프로세스가 완료되면 브라우저에서 선택한 도메인에 액세스하여 Liferay 인스턴스로 라우팅되는지 확인하세요. 귀하의 브라우저에는 연결이 Let's Encrypt에 의해 보안되고 확인되었음을 표시합니다.

![로드 밸런서가 새 SSL 인증서로 업데이트되면 브라우저는 보안 연결을 사용하고 있는지 확인합니다.](./configuring-your-sites-domain/images/04.png)

다음: [더 많은 트래픽을 처리하기 위해 Liferay 서비스](./setting-up-clustering-for-the-liferay-service.md) 에 대한 클러스터링을 활성화합니다.

## 관련 개념

* [맞춤 도메인](https://learn.liferay.com/w/liferay-cloud/configuring-the-cloud-network/custom-domains)
* [로드 밸런서](https://learn.liferay.com/w/liferay-cloud/configuring-the-cloud-network/load-balancer#custom-ssl)
* [VPN 통합 개요](https://learn.liferay.com/w/liferay-cloud/configuring-the-cloud-network/vpn-integration-overview)
