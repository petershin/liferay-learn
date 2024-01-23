# 사용자 정의 체크아웃 단계 구현

이 자습서에서는 [CommerceCheckoutStep](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-api/src/main/java/com/liferay/commerce/util/CommerceCheckoutStep.java) 인터페이스를 구현하여 사용자 정의 체크아웃 단계를 추가하는 방법을 보여줍니다.

결제 단계는 고객의 결제 프로세스 중 한 화면을 나타냅니다. Liferay Commerce는 [결제 방법](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-checkout-web/src/main/java/com/liferay/commerce/checkout/web/internal/util/PaymentMethodCommerceCheckoutStep.java) 단계 및 [주문 확인](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-checkout-web/src/main/java/com/liferay/commerce/checkout/web/internal/util/OrderConfirmationCommerceCheckoutStep.java) 단계와 같은 필수 단계를 포함하여 기본적으로 여러 체크아웃 단계를 제공합니다.

![즉시 사용 가능한 결제 단계](./implementing-a-custom-checkout-step/images/01.png "즉시 사용 가능한 결제 단계")

## 개요

1. [**예제 배포**](#deploy-an-example)
1. [**예제 살펴보기**](#walk-through-the-example)
1. [**추가 정보**](#additional-information)

## 예제 배포

이 섹션에서는 Liferay Commerce 인스턴스에서 실행되는 체크아웃 단계의 예를 살펴보겠습니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. [Acme Commerce 결제 단계](./liferay-n8n6.zip) 를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/sales/liferay-n8n6.zip -O
    ```

    ```bash
    unzip liferay-n8n6.zip
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
    STARTED com.acme.n8n6.web_1.0.0
    ```

1. 예시 결제 단계가 추가되었는지 확인합니다. 브라우저를 `https://localhost:8080` 로 열고 Liferay Commerce 사이트의 카탈로그로 이동합니다. 카트에 항목을 추가하고 카트를 본 다음 "체크아웃"을 클릭합니다. 새로운 "N8N6 Commerce 결제 단계"가 결제 단계 목록에 표시됩니다.

![새로운 결제 단계](./implementing-a-custom-checkout-step/images/02.png "새로운 결제 단계")

축하합니다. `CommerceCheckoutStep`을 구현하는 새 체크아웃 단계를 성공적으로 구축하고 배포했습니다.

다음으로 더 자세히 알아보기 위해 더 깊이 들어가 보겠습니다.

## 예제 살펴보기

이 섹션에서는 배포한 예제를 검토합니다. 먼저 OSGi 등록을 위해 클래스에 주석을 달겠습니다. 둘째, `CommerceCheckout1` 인터페이스를 검토합니다. 셋째, `CommerceCheckoutStep`구현을 완료합니다.

```{note}
`CommerceCheckoutStep` 구현을 단순화하기 위해 기본 기능에 대해 `BaseCommerceCheckoutStep`을 확장합니다.
```

### OSGi 등록을 위해 클래스에 주석 달기

```java
@Component(
    property = {
    "commerce.checkout.step.name=n8n6",
    "commerce.checkout.step.order:Integer=21"
    },
    service = CommerceCheckoutStep.class
)
public class N8N6CommerceCheckoutStep extends BaseCommerceCheckoutStep {
```

> 결제 단계 이름은 Liferay Commerce가 결제 단계를 기존 결제 단계와 구별할 수 있도록 고유한 값이어야 합니다.
> 
> `commerce.checkout.step.order` 값은 체크아웃 단계가 표시되는 체크아웃 프로세스의 정도를 나타냅니다. 예를 들어 [배송 방법 결제 단계](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-checkout-web/src/main/java/com/liferay/commerce/checkout/web/internal/util/ShippingMethodCommerceCheckoutStep.java) 의 값은 20입니다. 결제 단계에 값 21을 지정하면 배송 방법 단계 직후에 표시됩니다.

### `CommerceCheckout1` 인터페이스 검토

기본 클래스를 확장하는 것 외에도 다음 메서드를 구현합니다.

```java
public String getName();
```

> 이 메서드는 결제 단계의 이름을 반환합니다. 이 이름은 UI에 표시될 이름에 해당하는 [언어 키](https://help.liferay.com/hc/ko/articles/360028746692-Localizing-Your-Application) 수 있습니다.

```java
public void processAction(
        ActionRequest actionRequest, ActionResponse actionResponse)
    throws Exception;
```

> `processAction` 메서드는 백엔드 처리가 필요한 경우 `ActionRequest` 을 통해 전달된 정보로 비즈니스 로직을 구현하는 데 사용할 수 있습니다.

```java
public void render(
        HttpServletRequest httpServletRequest,
        HttpServletResponse httpServletResponse)
    throws Exception;
```

> 여기에서 체크아웃 단계에 대한 사용자 지정 화면을 렌더링하는 코드를 추가합니다.

### 결제 단계 완료

결제 단계는 모든 입력을 처리하기 위한 사용자 정의 화면과 백엔드 로직으로 구성됩니다. 다음을 수행하십시오.

* [모듈에 대해 `ServletContext` 을 구성합니다.](#configure-the-servletcontext-for-the-module)
* [`렌더링` 메서드를 구현합니다.](#implement-the-render-method)
* [`processAction`에 비즈니스 로직을 추가합니다.](#add-business-logic-to-processaction)
* [사용자 정의 화면을 렌더링하기 위해 JSP를 추가하십시오.](#add-a-jsp-to-render-the-custom-screen)
* [언어 키를 `Language.properties`에 추가하십시오.](#add-the-language-key-to-language-properties)

#### 모듈에 대한 `ServletContext` 구성

모듈에서 JSP를 찾을 수 있도록 번들의 기호 이름을 사용하여 `ServletContext` 을 정의합니다.

```java
@Reference(target = "(osgi.web.symbolicname=com.acme.n8n6.web)")
private ServletContext _servletContext;
```

> `osgi.web.symbolicname` 에 설정한 값은 [bnd.bnd 파일](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/sales/implementing-a-custom-checkout-step/resources/liferay-n8n6.zip/n8n6-web/bnd.bnd) 의 `Bundle-SymbolicName` 값과 일치합니다. 이러한 값은 JSP를 찾으려면 `ServletContext` 과 일치해야 합니다.
> 
> 또한 `ServletContext` 이 올바르게 생성되도록 bnd.bnd 파일에서 `Web-ContextPath` 에 대한 고유한 값을 선언해야 합니다. 이 예에서 `Web-ContextPath` 은 `/n8n6-web`으로 설정됩니다. 이 값에 대한 참조는 [bnd.bnd](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/sales/implementing-a-custom-checkout-step/resources/liferay-n8n6.zip/n8n6-web/bnd.bnd) 을 참조하십시오.

#### `렌더링` 메서드 구현

```java
@Override
public void render(
        HttpServletRequest httpServletRequest,
        HttpServletResponse httpServletResponse)
    throws Exception {

    _jspRenderer.renderJSP(
        _servletContext, httpServletRequest, httpServletResponse,
        "/terms_and_conditions.jsp");
}

@Reference
private JSPRenderer _jspRenderer;

@Reference(target = "(osgi.web.symbolicname=com.acme.n8n6.web)")
private ServletContext _servletContext;
```

> `JSPRenderer` 을 사용하여 체크아웃 단계에 대한 JSP를 렌더링합니다(이 경우 [terms_and_conditions.jsp](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/sales/implementing-a-custom-checkout-step/resources/liferay-n8n6.zip/n8n6-web/src/main/resources/META-INF/resources/terms_and_conditions.jsp) ). `ServletContext` 을 매개변수로 제공하여 생성한 JSP를 찾습니다.

#### `processAction`에 비즈니스 로직 추가

우리의 예는 사용자 지정 화면에 텍스트를 표시하며 `processAction` 구현에서 백엔드 처리가 필요하지 않습니다.

#### 사용자 지정 화면을 렌더링하는 JSP 추가

이 예에서는 자리 표시자 텍스트를 추가합니다. [terms_and_conditions.jsp](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/sales/implementing-a-custom-checkout-step/resources/liferay-n8n6.zip/n8n6-web/src/main/resources/META-INF/resources/terms_and_conditions.jsp) 에서 구현을 볼 수 있습니다.

#### `Language.properties`에 언어 키 추가

모듈 내의 [Language.properties](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/sales/implementing-a-custom-checkout-step/resources/liferay-n8n6.zip/n8n6-web/src/main/resources/content/Language.properties) 파일에 언어 키와 해당 값을 추가합니다.

```properties
n8n6-commerce-checkout-step=N8N6 Commerce Checkout Step
```

> 자세한 내용은 [응용 프로그램 지역화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application) 을 참조하십시오.

## 결론

축하합니다! 이제 `CommerceCheckoutStep` 인터페이스를 구현하기 위한 기본 사항을 알고 있으며 Liferay Commerce에 새로운 결제 단계를 추가했습니다.

## 관련 주제

* [점검](../../creating-store-content/commerce-storefront-pages/checkout.md)
* [애플리케이션 현지화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application)
