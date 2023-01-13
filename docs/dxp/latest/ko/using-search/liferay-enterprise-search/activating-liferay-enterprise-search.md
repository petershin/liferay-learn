# Liferay 엔터프라이즈 검색 활성화

Liferay DXP 7.4부터 Liferay Enterprise Search(LES) 애플리케이션이 모든 Liferay DXP 번들 및 Docker 컨테이너에 포함됩니다. LES 사용을 시작하려면 LES 애드온 구독을 구입하십시오. Liferay 영업 담당자에게 연락하거나 <https://www.liferay.com/contact-sales>을 방문하여 시작하십시오.

LES는 기본적으로 활성화되어 있으며 추가 설치 단계가 필요하지 않습니다. 그러나 공식 Liferay 지원 및 추가 혜택을 받으려면 LES 애드온 구독을 구매해야 합니다. LES 응용 프로그램에 대한 유지 관리 및 업데이트는 수정 팩 및 서비스 팩 릴리스를 통해 제공됩니다. LES에 가입하지 않은 경우 아래 설명된 단계에 따라 액세스를 완전히 비활성화할 수 있습니다.

```{note}
[LES 검색 경험](./search-experiences.md)이 Liferay DXP 7.4 업데이트 5의 DXP 번들에 추가되었습니다. Search Experiences는 고객 포털을 통해 Liferay DXP 7.3에서 애드온 애플리케이션으로 제공됩니다.
```

## 로컬 번들: LES 비활성화

LES 애플리케이션은 모든 Liferay DXP 7.4+ 번들에서 기본적으로 활성화됩니다. LES를 사용하기 위한 구독 및 동반 라이선스가 없는 경우 `enterprise.product.enterprise.search.enabled` [포털 속성](../../installation-and-upgrades/reference/portal-properties.md) 을 `false`로 설정하여 비활성화합니다.

```properties
enterprise.product.enterprise.search.enabled=false
```

## 도커: LES 비활성화

LES 애플리케이션은 모든 Liferay DXP 7.4+ Docker 이미지에서 기본적으로 활성화됩니다. LES를 사용하기 위한 구독 및 함께 제공되는 라이센스가 없는 경우 다음 두 가지 방법 중 하나로 비활성화하십시오.

1. 속성 파일을 사용하여 컨테이너를 구성하는 경우 `enterprise.product.enterprise.search.enabled`을 설정하여 비활성화합니다. [포털 속성](../../installation-and-upgrades/reference/portal-properties.md) ~ `거짓`:

    ```properties
    enterprise.product.enterprise.search.enabled=false
    ```

1. 대신 환경 변수에서 포털 속성을 재정의하려면 다음을 설정합니다.

    ```properties
    LIFERAY_ENTERPRISE_PERIOD_PRODUCT_PERIOD_ENTEPRISE_PERIOD_SEARCH_PERIOD_ENABLED=false
    ```

자세한 내용은 [컨테이너 구성](../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md) 을 참조하십시오.
