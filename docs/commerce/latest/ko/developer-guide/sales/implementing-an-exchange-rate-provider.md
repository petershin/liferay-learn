# 사용자 지정 환율 제공자 구현

이 자습서에서는 [ExchangeRateProvider](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-currency-api/src/main/java/com/liferay/commerce/currency/util/ExchangeRateProvider.java) 인터페이스를 구현하여 사용자 지정 환율 공급자를 추가하는 방법을 보여줍니다.

환율 공급자는 데이터 소스를 사용하여 통화 간 환율 계산을 수행합니다. Liferay Commerce는 하나의 기본 환율 공급자인 [ECBExchangeRateProvider](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-currency-service/src/main/java/com/liferay/commerce/currency/internal/util/ECBExchangeRateProvider.java) 을 제공합니다.

![즉시 사용 가능한 환율 공급자](./implementing-an-exchange-rate-provider/images/01.png "즉시 사용 가능한 환율 공급자")

## 개요

1. [**예제 배포**](#deploy-an-example)
1. [**예제 살펴보기**](#walk-through-the-example)
1. [**추가 정보**](#additional-information)

## 예제 배포

이 섹션에서는 Liferay Commerce 인스턴스에서 예제 환율 공급자를 시작하고 실행합니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. [Acme Commerce Exchange Rate Provider](./liferay-f2y1.zip) 를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/sales/liferay-f2y1.zip -O
    ```

    ```bash
    unzip liferay-f2y1.zip
    ```

1. `liferay-f2y1`로 이동합니다.

    ```bash
    cd liferay-f2y1
    ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.f2y1.impl_1.0.0
    ```

1. 예제 환율 공급자가 추가되었는지 확인합니다. 브라우저에서 `https://localhost:8080`로 엽니다. 그런 다음 애플리케이션 메뉴(![Applications Menu](../../images/icon-applications-menu.png))를 클릭하고 **상거래** → **통화** 로 이동합니다. 새 환율 제공자("f2y1")는 **Exchange Rate Provider** 드롭다운 아래에 표시됩니다.

```{note}
Liferay Commerce 2.1 및 이전 버전에서는 *제어판* → *상거래* → *설정* → *통화* → *환율*로 이동하여 환율을 찾습니다. 새 환율 제공자("f2y1")는 *Exchange Rate Provider* 드롭다운 아래에 표시됩니다.
```

![새로운 환율 공급자](./implementing-an-exchange-rate-provider/images/02.png "새 환율 공급자")

축하합니다. `ExchangeRateProvider`을 구현하는 새로운 환율 공급자를 성공적으로 구축하고 배포했습니다.

다음으로 더 자세히 알아보기 위해 더 깊이 들어가 보겠습니다.

## 예제 살펴보기

이 섹션에서는 배포한 예제를 검토합니다. 먼저 OSGi 등록을 위해 클래스에 주석을 달겠습니다. 둘째, `ExchangeRateProvider` 인터페이스를 검토합니다. 셋째, `ExchangeRateProvider`구현을 완료합니다.

### OSGi 등록을 위해 클래스에 주석 달기

```java
@Component(
    property = "commerce.exchange.provider.key=f2y1",
    service = ExchangeRateProvider.class
)
public class F2Y1ExchangeRateProvider implements ExchangeRateProvider {
```

> Liferay Commerce가 환율 공급자 레지스트리 [에서 새 환율 공급자를 다른 공급자와 구별할 수 있도록 환율 공급자에게 고유한 키를 제공하는 것이 중요](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-currency-service/src/main/java/com/liferay/commerce/currency/internal/util/ExchangeRateProviderRegistryImpl.java) . 이미 사용 중인 키를 재사용하면 기존에 연결된 환율 공급자가 재정의됩니다.

### `ExchangeRateProvider` 인터페이스 검토

다음 방법을 구현합니다.

```java
@Override
public BigDecimal getExchangeRate(
        CommerceCurrency primaryCommerceCurrency,
        CommerceCurrency secondaryCommerceCurrency)
    throws Exception;
```

> 이 메서드는 통화 간의 환율을 계산하기 위해 호출됩니다. 요율에 대해 선택한 데이터 소스는 Liferay Commerce 인스턴스에서 사용할 수 있는 모든 통화를 처리할 수 있어야 합니다.

### 환율 공급자 완료

환율 공급자는 두 통화 간의 환율을 계산하는 논리로 구성됩니다. 다음을 수행하십시오.

* [환율 계산 논리를 구현합니다.](#implement-the-exchange-rate-calculation-logic)

#### 환율 계산 논리 구현

```java
@Override
public BigDecimal getExchangeRate(
        CommerceCurrency primaryCommerceCurrency,
        CommerceCurrency secondaryCommerceCurrency)
    throws Exception {

    return new BigDecimal(
        _getExchangeRate(secondaryCommerceCurrency) /
            _getExchangeRate(primaryCommerceCurrency));
}

private Double _getExchangeRate(CommerceCurrency commerceCurrency) {
    String code = StringUtil.toUpperCase(commerceCurrency.getCode());

    return _exchangeRates.get(code);
}

private Map<String, Double> _exchangeRates = new HashMap<String, Double>() {
    {
        put("AUD", 1.9454);
        put("BRL", 5.15262);
        put("CAD", 1.84981);
        put("CHF", 1.36562);
        put("CLP", 947.813);
        put("CNY", 9.49073);
        put("CZK", 31.0599);
        put("DKK", 9.04642);
        put("EUR", 1.21177);
        put("GBP", 1.09733);
        put("HKD", 10.9628);
        put("HUF", 390.23);
        put("IDR", 19698.8);
        put("ILS", 5.12143);
        put("INR", 98.562);
        put("JPY", 150.862);
        put("KRW", 1567.74);
        put("MXN", 26.7972);
        put("MYR", 5.72459);
        put("NOK", 11.8138);
        put("NZD", 2.05827);
        put("PHP", 73.2097);
        put("PKR", 194.073);
        put("PLN", 5.22207);
        put("RUB", 93.4562);
        put("SEK", 12.4178);
        put("SGD", 1.88797);
        put("THB", 44.6128);
        put("USD", 1.39777);
        put("ZAR", 19.3996);
    }
};
```

> 이 예에서는 환율 지도를 사용합니다. 보다 실용적인 사용 사례는 [ECBExchangeRateProvider](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-currency-service/src/main/java/com/liferay/commerce/currency/internal/util/ECBExchangeRateProvider.java) 을 참조하십시오. [F2Y1ExchangeRateProvider.java](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/sales/implementing-an-exchange-rate-provider/resources/liferay-f2y1.zip/f2y1-impl/src/main/java/com/acme/f2y1/internal/commerce/currency/util/F2Y1ExchangeRateProvider.java) 를 방문하여 `_getStaticExchangeRates` 및 `_getRateForCode` 을 참조하십시오.
> 
> 두 통화에 대해 `CommerceCurrency` 개체를 사용하여 통화 코드와 같은 필요한 정보를 가져옵니다. [CommerceCurrency.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-currency-api/src/main/java/com/liferay/commerce/currency/model/CommerceCurrency.java) 및 [CommerceCurrencyModel.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-currency-api/src/main/java/com/liferay/commerce/currency/model/CommerceCurrencyModel.java) 을 참조하여 `CommerceCurrency` 객체와 함께 사용할 수 있는 더 많은 방법을 찾으십시오.

## 결론

축하합니다! 이제 `ExchangeRateProvider` 인터페이스를 구현하기 위한 기본 사항을 알고 있으며 Liferay Commerce에 새로운 환율 공급자를 추가했습니다.

## 관련 주제

* [새 통화 추가](../../store-management/currencies/adding-a-new-currency.md)
* [환율 관리](../../store-management/currencies/managing-exchange-rates.md)
