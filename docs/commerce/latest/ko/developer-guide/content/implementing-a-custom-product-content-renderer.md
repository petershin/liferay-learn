# 맞춤형 제품 콘텐츠 렌더러 구현

이 자습서에서는 [CPContentRenderer](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-content-api/src/main/java/com/liferay/commerce/product/content/render/CPContentRenderer.java) 인터페이스를 구현하여 사용자 지정 제품 콘텐츠 렌더러를 추가하는 방법을 보여줍니다.

제품 콘텐츠 렌더러는 제품을 표시할 수 있는 다양한 위젯에서 특정 제품 유형에 대한 제품 세부 정보를 표시하는 스타일을 제공합니다. Liferay Commerce는 간단한 제품의 경우 [SimpleCPContentRenderer](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-type-simple/src/main/java/com/liferay/commerce/product/type/simple/internal/SimpleCPContentRenderer.java) 과 같은 각 기본 제품 유형에 대한 제품 콘텐츠 렌더러를 제공합니다.

![즉시 사용 가능한 제품 콘텐츠 렌더러](./implementing-a-custom-product-content-renderer/images/01.png "즉시 사용 가능한 제품 콘텐츠 렌더러")

## 개요

1. [**예제 배포**](#deploy-an-example)
1. [**예제 살펴보기**](#walk-through-the-example)
1. [**추가 정보**](#additional-information)

## 예제 배포

이 섹션에서는 Liferay Commerce 인스턴스에서 예제 제품 콘텐츠 렌더러를 시작하고 실행합니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. [Acme Commerce 제품 콘텐츠 렌더러](./liferay-q4f7.zip) 를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/commerce/latest/en/developer-guide/content/liferay-q4f7.zip -O
    ```

    ```bash
    unzip liferay-q4f7.zip
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
    STARTED com.acme.q4f7.web_1.0.0
    ```

1. 예제 제품 콘텐츠 렌더러가 추가되었는지 확인합니다. 브라우저를 `https://localhost:8080` 로 열고 Liferay Commerce의 제품이 있는 카탈로그로 이동합니다. 제품을 클릭하여 제품 세부정보 위젯을 본 다음 위젯에 대해 **구성** 을 클릭합니다.

**Custom Renderer** 섹션에서 **Simple** 을 선택합니다. **단순 상거래 제품 유형 렌더러 키** 드롭다운 아래에서 새 렌더러("Q4F7 Commerce 제품 콘텐츠 렌더러")를 선택합니다.

    ![새 제품 콘텐츠 렌더러](./implementing-a-custom-product-content-renderer/images/02.png "새 제품 콘텐츠 렌더러")

1. 제품을 선택하면 새 렌더러에 제품의 SKU, 가격, 가용성 및 재고 수량만 표시됩니다.

    ![다음은 새 렌더러를 사용하여 표시되는 제품 세부 정보입니다.](./implementing-a-custom-product-content-renderer/images/03.png "새 렌더러를 사용하여 표시되는 세부 정보")

축하합니다. `CPContentRenderer`을 구현하는 새로운 사용자 지정 제품 콘텐츠 렌더러를 성공적으로 빌드하고 배포했습니다.

다음으로 더 자세히 알아보기 위해 더 깊이 들어가 보겠습니다.

## 예제 살펴보기

이 섹션에서는 배포한 예제를 검토합니다. 먼저 OSGi 등록을 위해 클래스에 주석을 달겠습니다. 둘째, `CPContentRenderer` 인터페이스를 검토합니다. 셋째, `CPContentRenderer`구현을 완료합니다.

### OSGi 등록을 위해 클래스에 주석 달기

```java
@Component(
    property = {
        "commerce.product.content.renderer.key=q4f7",
        "commerce.product.content.renderer.order=1",
        "commerce.product.content.renderer.type=" + SimpleCPTypeConstants.NAME
    },
    service = CPContentRenderer.class
)
public class Q4F7CPContentRenderer implements CPContentRenderer {
```

> Liferay Commerce가 제품 콘텐츠 렌더러 레지스트리 [에서 새 렌더러를 다른 렌더러와 구별할 수 있도록 제품 콘텐츠 렌더러에 고유한 키를 제공하는 것이 중요](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-content-web/src/main/java/com/liferay/commerce/product/content/web/internal/render/CPContentRendererRegistryImpl.java) . 이미 사용 중인 키를 재사용하면 기존의 연결된 렌더러가 재정의됩니다.
> 
> `commerce.product.content.renderer.order` 속성은 Commerce가 UI에 렌더러를 나열하는 데 사용하는 정수 값입니다. 렌더러는 오름차순으로 나열됩니다. 예를 들어 [SimpleCPContentRenderer](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-type-simple/src/main/java/com/liferay/commerce/product/type/simple/internal/SimpleCPContentRenderer.java) 은 이 속성을 최소 정수 값으로 설정하므로 단순 유형 제품에 대한 다른 렌더러가 목록에서 그 뒤에 나타납니다.
> 
> `commerce.product.content.renderer.type` 속성은 이 렌더러를 사용할 수 있는 제품 유형을 결정합니다. 이 예제에서는 단순 유형을 사용하므로 렌더러가 UI의 단순 범주 아래에 나타납니다.

### `CPContentRenderer` 인터페이스 검토

다음 방법을 구현합니다.

```java
public String getKey();
```

> 이 메서드는 제품 콘텐츠 렌더러 레지스트리에서 제품 콘텐츠 렌더러에 대한 고유 식별자를 제공합니다. 이 키는 레지스트리에서 렌더러를 가져오는 데 사용할 수 있습니다. 이미 사용 중인 키를 재사용하면 기존의 연결된 렌더러가 재정의됩니다.

```java
public String getLabel(Locale locale);
```

> 제품 콘텐츠 렌더러를 설명하는 텍스트 레이블을 반환합니다. 언어 키를 사용하여 레이블 검색에 대한 참조는 [Q4F7CPContentRenderer.java](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/content/implementing-a-custom-product-content-renderer/resources/liferay-q4f7.zip/q4f7-web/src/main/java/com/acme/q4f7/web/internal/commerce/product/content/renderer/Q4F7CPContentRenderer.java) 의 구현을 참조하십시오.

```java
public void render(
        CPCatalogEntry cpCatalogEntry,
        HttpServletRequest httpServletRequest,
        HttpServletResponse httpServletResponse)
    throws Exception;
```

> 여기에서 제품 콘텐츠 렌더러에 대한 사용자 지정 보기를 렌더링하는 코드를 추가합니다.
> 
> 보기를 정의하는 방법에는 JSP, Freemarker 템플릿 또는 Soy 템플릿 등 여러 가지가 있습니다. 이 예에서는 JSP를 사용합니다.

### 제품 콘텐츠 렌더러 완료

제품 콘텐츠 렌더러는 우리가 정의하고 렌더링하는 사용자 정의 보기로 구성됩니다. 다음을 수행하십시오.

* [모듈에 대해 `ServletContext` 을 구성합니다.](#configure-the-servletcontext-for-the-module)
* [`렌더링` 메서드를 구현합니다.](#implement-the-render-method)
* [사용자 정의 보기에 대한 JSP를 추가하십시오.](#add-a-jsp-for-the-custom-view)
* [언어 키를 `Language.properties`에 추가하십시오.](#add-the-language-key-to-languageproperties)

#### 모듈에 대한 `ServletContext` 구성

모듈에서 JSP를 찾을 수 있도록 번들의 기호 이름을 사용하여 `ServletContext` 을 정의합니다.

```java
@Reference(target = "(osgi.web.symbolicname=com.acme.q4f7.web)")
private ServletContext _servletContext;
```

> `osgi.web.symbolicname` 에 설정한 값은 [bnd.bnd 파일](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/content/implementing-a-custom-product-content-renderer/resources/liferay-q4f7.zip/q4f7-web/bnd.bnd) 의 `Bundle-SymbolicName` 값과 일치합니다. JSP를 찾으려면 이 값이 `ServletContext` 과 일치해야 합니다.
> 
> 또한 `ServletContext` 이 올바르게 생성되도록 bnd.bnd 파일에서 `Web-ContextPath` 에 대한 고유한 값을 선언해야 합니다. 이 예에서 `Web-ContextPath` 은 `/q4f7-web`으로 설정됩니다. 이 값에 대한 참조는 [bnd.bnd](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/content/implementing-a-custom-product-content-renderer/resources/liferay-q4f7.zip/q4f7-web/bnd.bnd) 을 참조하십시오.

#### `렌더링` 메서드 구현

```java
@Override
public void render(
        CPCatalogEntry cpCatalogEntry,
        HttpServletRequest httpServletRequest,
        HttpServletResponse httpServletResponse)
    throws Exception {

    _jspRenderer.renderJSP(
        _servletContext, httpServletRequest, httpServletResponse,
        "/view.jsp");
}
```

> `JSPRenderer` 을 사용하여 제품 콘텐츠 렌더러용 JSP를 렌더링합니다(이 경우 [view.jsp](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/content/implementing-a-custom-product-content-renderer/resources/liferay-q4f7.zip/q4f7-web/src/main/resources/META-INF/resources/view.jsp) ). `ServletContext` 을 매개변수로 제공하여 생성한 JSP를 찾습니다.

#### 사용자 정의 보기용 JSP 추가

```jsp
<%
CPContentHelper cpContentHelper = (CPContentHelper)request.getAttribute(CPContentWebKeys.CP_CONTENT_HELPER);

CPSku cpSku = cpContentHelper.getDefaultCPSku(cpContentHelper.getCPCatalogEntry(request));
%>
```

> [CPContentHelper](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-content-web/src/main/java/com/liferay/commerce/product/content/web/internal/util/CPContentHelperImpl.java) 은 특정 제품에 대한 정보를 검색하는 클래스입니다.
> 
> [CPCatalogEntry](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/catalog/CPCatalogEntry.java) 은 표시된 제품 자체를 나타냅니다. [CPSku](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-service/src/main/java/com/liferay/commerce/product/internal/catalog/CPSkuImpl.java) 개체에 포함된 기본 SKU를 사용하여 제품에 대한 자세한 정보를 얻습니다.

```jsp
<c:if test="<%= cpSku != null %>">
    SKU: <%= cpSku.getSku() %><br />
    Price: <%= cpSku.getPrice() %><br />
    Availability: <%= cpContentHelper.getAvailabilityLabel(request) %><br />
    Stock Quantity: <%= cpContentHelper.getStockQuantityLabel(request) %>
</c:if>

<liferay-util:dynamic-include key="com.liferay.commerce.product.content.web#/add_to_cart#" />
```

> Liferay Commerce의 [add_to_cart_button.jsp](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-cart-content-web/src/main/resources/META-INF/resources/dynamic **include/add** to **cart** button.jsp) 을 사용하여 "장바구니에 추가" 기능을 보기에 삽입합니다.

#### `Language.properties`에 언어 키 추가

모듈 내의 [Language.properties](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/content/implementing-a-custom-product-content-renderer/resources/liferay-q4f7.zip/q4f7-web/src/main/resources/content/Language.properties) 파일에 언어 키와 해당 값을 추가합니다.

```properties
q4f7-commerce-product-content-renderer=Q4F7 Commerce Product Content Renderer
```

> 자세한 내용은 [응용 프로그램 지역화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application) 을 참조하십시오.

## 결론

축하합니다! 이제 `CPContentRenderer` 인터페이스를 구현하기 위한 기본 사항을 알고 있으며 Liferay Commerce에 새 제품 콘텐츠 렌더러를 추가했습니다.

## 관련 주제

* [애플리케이션 현지화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application)
