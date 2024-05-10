# 새 세금 엔진 구현

이 자습서에서는 [CommerceTaxEngine](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/tax/CommerceTaxEngine.java) 인터페이스를 구현하여 새 세금 엔진을 추가하는 방법을 보여줍니다.

세금 엔진은 거래가 이루어질 때 세금 계산을 수행합니다. Liferay Commerce는 고정 요율용 [FixedCommerceTaxEngine](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-tax-engine-fixed-service/src/main/java/com/liferay/commerce/tax/engine/fixed/internal/engine/FixedCommerceTaxEngine.java) 과 주소별 세금 계산용 [ByAddressCommerceTaxEngine](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-tax-engine-fixed-service/src/main/java/com/liferay/commerce/tax/engine/fixed/internal/engine/ByAddressCommerceTaxEngine.java) 의 두 가지 기본 세금 엔진을 제공합니다.

![즉시 사용 가능한 세금 엔진](./implementing-a-new-tax-engine/images/01.png "즉시 사용 가능한 세금 엔진")

## 개요

1. [**예제 배포**](#deploy-an-example)
1. [**예제 살펴보기**](#walk-through-the-example)
1. [**추가 정보**](#additional-information)

## 예제 배포

이 섹션에서는 Liferay Commerce 인스턴스에서 예제 세금 엔진을 시작하고 실행합니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르십시오.

1. [Acme Commerce Tax Engine](./liferay-q4b9.zip) 을 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/sales/liferay-q4b9.zip -O
    ```

    ```bash
    unzip liferay-q4b9.zip
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
    STARTED com.acme.q4b9.impl_1.0.0
    ```

1. 예제 세금 엔진이 추가되었는지 확인합니다. 브라우저에서 `https://localhost:8080`로 엽니다. 그런 다음 애플리케이션 메뉴(![Applications Menu](../../images/icon-applications-menu.png))를 클릭하고 **상거래** → **채널** 로 이동합니다. 채널을 편집합니다. 새 세금 엔진("Q4B9 Commerce Tax Engine")이 표시된 목록에 표시됩니다.

```{note}
Commerce 2.1 및 이전 버전에서는 *사이트 관리* → *상거래* → *설정* → *세금* → *세금 계산*으로 이동하여 세금 엔진을 찾습니다.
```

![새로운 세금 엔진](./implementing-a-new-tax-engine/images/02.png "새로운 세금 엔진")

축하합니다. `CommerceTaxEngine`을 구현하는 새 세금 엔진을 성공적으로 구축하고 배포했습니다.

다음으로 더 자세히 알아보기 위해 더 깊이 들어가 보겠습니다.

## 예제 살펴보기

이 섹션에서는 배포한 예제를 검토합니다. 먼저 OSGi 등록을 위해 클래스에 주석을 달겠습니다. 둘째, `CommerceTaxEngine` 인터페이스를 검토합니다. 셋째, `CommerceTaxEngine`구현을 완료합니다.

### OSGi 등록을 위해 클래스에 주석 달기

```java
@Component(
    property = "commerce.tax.engine.key=q4b9", service = CommerceTaxEngine.class
)
```

> Liferay Commerce가 [세금 엔진 레지스트리](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-service/src/main/java/com/liferay/commerce/internal/util/CommerceTaxEngineRegistryImpl.java) 에서 새 엔진을 다른 엔진과 구별할 수 있도록 세금 엔진에 고유한 키를 제공하는 것이 중요합니다. 이미 사용 중인 키를 재사용하면 기존 관련 세금 엔진이 재정의됩니다.

### `CommerceTaxEngine` 인터페이스 검토

다음 방법을 구현합니다.

```java
public CommerceTaxValue getCommerceTaxValue(
        CommerceTaxCalculateRequest commerceTaxCalculateRequest)
    throws CommerceTaxEngineException;
```

> 이 메서드는 세금 엔진에 대한 비즈니스 논리가 구현되는 사이트입니다. 자세한 내용은 [CommerceTaxValue](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/tax/CommerceTaxValue.java) 참조하십시오.

```java
public String getDescription(Locale locale);
```

> 그러면 세금 엔진에 대한 간략한 설명이 반환됩니다. 언어 키로 설명 검색에 대한 참조는 [Q4B9CommerceTaxEngine.java](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/sales/implementing-a-new-tax-engine/resources/liferay-q4b9.zip/q4b9-impl/src/main/java/com/acme/q4b9/internal/commerce/tax/Q4B9CommerceTaxEngine.java) 의 구현을 참조하십시오.

```java
public String getName(Locale locale);
```

> 그러면 세금 엔진의 이름이 반환됩니다. `getDescription` 메소드와 유사하게 작동합니다.

### 세금 엔진 완료

세금 엔진은 세금 계산을 수행하는 논리로 구성됩니다. 다음을 수행하십시오.

* [`getCommerceTaxValue`에 비즈니스 로직을 추가합니다.](#add-business-logic-to-getcommercetaxvalue)
* [언어 키를 `Language.properties`에 추가하십시오.](#add-the-language-keys-to-languageproperties)

#### 비즈니스 로직을 `에 추가 getCommerceTaxValue`

```java
@Override
public CommerceTaxValue getCommerceTaxValue(
        CommerceTaxCalculateRequest commerceTaxCalculateRequest)
    throws CommerceTaxEngineException {

    BigDecimal flatTaxValue = _ONE_POINT_FIVE_ZERO;

    if (commerceTaxCalculateRequest.isPercentage()) {
        flatTaxValue = _ONE_POINT_FIVE_ZERO.divide(new BigDecimal(100.0));

        flatTaxValue = flatTaxValue.multiply(
            commerceTaxCalculateRequest.getPrice());
    }

    return new CommerceTaxValue(
        "q4b9", "q4b9-commerce-tax-engine", flatTaxValue);
}

private static final BigDecimal _ONE_POINT_FIVE_ZERO = new BigDecimal(
    "1.50");
```

> `CommerceTaxCalculateRequest` 매개변수에는 계산에 필요한 정보가 포함되어 있습니다. 이 예에서는 `CommerceTaxCalculateRequest`의 가격과 요율을 백분율로 적용할지 여부를 나타내는 값을 사용합니다. [CommerceTaxCalculateRequest.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/tax/CommerceTaxCalculateRequest.java) 참조하여 `CommerceTaxCalculateRequest`과 함께 사용할 수 있는 더 많은 방법을 찾으십시오.

#### `Language.properties`에 언어 키 추가

모듈 내의 [Language.properties](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/sales/implementing-a-new-tax-engine/resources/liferay-q4b9.zip/q4b9-impl/src/main/resources/content/Language.properties) 파일에 언어 키와 해당 값을 추가합니다.

```properties
q4b9-commerce-tax-engine=Q4B9 Commerce Tax Engine
this-tax-engine-serves-a-fixed-x-percent-flat-tax-rate=This tax engine serves a fixed {0} percent flat tax rate.
```

> 자세한 내용은 [MVC 포틀릿에서 지역화된 메시지 사용](https://learn.liferay.com/w/dxp/building-applications/developing-a-java-web-application/using-mvc/using-localized-messages-in-an-mvc-portlet) 참조하십시오.

## 결론

축하해요! 이제 `CommerceTaxEngine` 인터페이스를 구현하기 위한 기본 사항을 알고 있으며 Liferay Commerce에 새 세금 엔진을 추가했습니다.

## 관련 주제

* [MVC 포틀릿에서 지역화된 메시지 사용](https://learn.liferay.com/w/dxp/building-applications/developing-a-java-web-application/using-mvc/using-localized-messages-in-an-mvc-portlet)
* [세금 계산을 위한 세율 설정](../../pricing/configuring-taxes/setting-rates-for-tax-calculations.md)
