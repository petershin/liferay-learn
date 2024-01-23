# 새 제품 유형 추가

이 자습서에서는 세 가지 인터페이스( [CPType](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/type/CPType.java) , [ScreenNavigationCategory](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/frontend-taglib/frontend-taglib/src/main/java/com/liferay/frontend/taglib/servlet/taglib/ScreenNavigationCategory.java) 및 [ScreenNavigationEntry](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/frontend-taglib/frontend-taglib/src/main/java/com/liferay/frontend/taglib/servlet/taglib/ScreenNavigationEntry.java) )를 구현하여 새 제품 유형을 추가하는 방법을 보여줍니다.

제품 유형은 유사한 특성을 공유하는 제품을 그룹화하는 데 사용할 수 있습니다. Liferay Commerce는 [단순](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-type-simple/src/main/java/com/liferay/commerce/product/type/simple/internal/SimpleCPType.java) , [그룹화](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-type-grouped-web/src/main/java/com/liferay/commerce/product/type/grouped/web/internal/GroupedCPType.java) 및 [가상](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-type-virtual-web/src/main/java/com/liferay/commerce/product/type/virtual/web/internal/VirtualCPType.java) 의 세 가지 제품 유형을 즉시 제공합니다.

![즉시 사용 가능한 제품 유형](./adding-a-new-product-type/images/01.png "즉시 사용 가능한 제품 유형")

## 개요

1. [**예제 배포**](#deploy-an-example)
1. [**예제 살펴보기**](#walk-through-the-example)
1. [**추가 정보**](#additional-information)

## 예제 배포

이 섹션에서는 Liferay Commerce 인스턴스에서 예제 제품 유형을 시작하고 실행합니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. [Acme Commerce 제품 유형](./liferay-c1n4.zip) 을 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/catalog/liferay-c1n4.zip -O
    ```

    ```bash
    unzip liferay-c1n4.zip
    ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.c1n4.web_1.0.0
    ```

1. 예제 제품 유형이 추가되었는지 확인합니다. 브라우저에서 `https://localhost:8080`로 엽니다. 응용 프로그램 메뉴(![Applications Menu](../../images/icon-applications-menu.png))를 클릭하고 **Commerce** → **Products** 로 이동합니다. 그런 다음 (+) 아이콘을 클릭하여 새 제품을 추가합니다. 새 제품 유형("예")이 선택할 수 있는 유형 목록에 표시됩니다.

```{note}
Liferay Commerce 2.1 및 이전 버전에서는 *제어판* → *상거래* → *제품*으로 이동하여 제품 페이지를 찾습니다.
```

![새 제품 유형](./adding-a-new-product-type/images/02.png "새 제품 유형")

축하합니다. `CPType`을 구현하는 새 제품 유형을 성공적으로 빌드하고 배포했습니다.

다음으로 더 자세히 알아보기 위해 더 깊이 들어가 보겠습니다.

## 예제 살펴보기

이 섹션에서는 배포한 예제를 검토합니다. 제품 유형 클래스와 사용자 지정 화면에 대한 화면 탐색 항목 클래스의 두 가지 클래스를 만듭니다. 다음을 살펴보십시오.

* [OSGi 등록을 위해 제품 유형 클래스에 주석 달기](#annotate-the-product-type-class-for-osgi-registration)
* [`CP유형` 인터페이스 검토](#review-the-cptype-interface)
* [OSGi 등록을 위해 화면 탐색 항목 클래스에 주석 달기](#annotate-the-screen-navigation-entry-class-for-osgi-registration)
* [`ScreenNavigationCategory` 인터페이스 검토](#review-the-screennavigationcategory-interface)
* [`ScreenNavigationEntry` 인터페이스 검토](#review-the-screennavigationentry-interface)
* [제품 유형을 완성하십시오](#complete-the-product-type)

### OSGi 등록을 위해 제품 유형 클래스에 주석 달기

제품 유형 클래스는 `CPType` 인터페이스를 구현합니다.

```java
@Component(
    property = {
    "commerce.product.type.display.order:Integer=16",
    "commerce.product.type.name=c1n4"
    },
    service = CPType.class
)
public class C1N4CPType implements CPType {
```

> 제품 유형 이름은 Liferay Commerce가 당사 제품 유형을 기존 제품 유형과 구별할 수 있도록 고유한 값이어야 합니다.
> 
> `commerce.product.type.display.order` 값은 제품 유형이 UI에 표시되는 제품 유형 목록의 범위를 나타냅니다. 예를 들어 [가상 제품 유형](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-type-virtual-web/src/main/java/com/liferay/commerce/product/type/virtual/web/internal/VirtualCPType.java) 의 값은 15입니다. 제품 유형에 값 16을 지정하면 가상 유형 바로 뒤에 표시됩니다.

### `CP유형` 인터페이스 검토

제품 유형 클래스에서 `CPType` 의 다음 메서드를 구현합니다.

```java
public void deleteCPDefinition(long cpDefinitionId) throws PortalException;
```

> 이 메서드는 제품 유형에 대한 사용자 지정 삭제 논리가 추가되는 사이트입니다.

```java
public String getLabel(Locale locale);
```

> 그러면 제품 유형을 설명하는 텍스트 레이블이 반환됩니다. 언어 키를 사용하여 레이블 검색에 대한 참조는 [C1N4CPType.java](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/catalog/adding-a-new-product-type/resources/liferay-c1n4.zip/c1n4-web/src/main/java/com/acme/c1n4/web/internal/commerce/product/type/C1N4CPType.java) 의 구현을 참조하십시오.

```java
public String getName();
```

> 제품 유형의 이름을 반환합니다. 이 이름은 UI에 표시될 이름에 해당하는 언어 키일 수 있습니다.

### OSGi 등록을 위해 화면 탐색 항목 클래스에 주석 달기

화면 탐색 항목 클래스는 `ScreenNavigationCategory` 및 `ScreenNavigationEntry` 인터페이스를 모두 구현합니다.

```java
@Component(
    property = {
    "screen.navigation.category.order:Integer=11",
    "screen.navigation.entry.order:Integer=11"
    },
    service = {ScreenNavigationCategory.class, ScreenNavigationEntry.class}
)
public class C1N4ScreenNavigationEntry
    implements ScreenNavigationCategory, ScreenNavigationEntry<CPDefinition> {
```

> Liferay Commerce가 기존 화면과 별도의 화면으로 구분할 수 있도록 내비게이션 화면 클래스에 고유한 키를 제공하는 것이 중요합니다. 이미 사용 중인 키를 재사용하면 기존의 연결된 내비게이션 화면이 무시됩니다.
> 
> `screen.navigation.category.order` 및 `screen.navigation.entry.order` 값은 이 화면이 나타날 제품 유형 화면의 사이트를 결정합니다. 예를 들어, 세부 정보 화면 클래스</a> 의 에는 이러한 값이 10으로 설정되어 있습니다. 11로 설정하면 사용자 지정 화면이 목록에서 그 뒤에 나타납니다.</p> </blockquote> 
> 
> ### `ScreenNavigationCategory` 인터페이스 검토
> 
> 화면 탐색 항목 클래스에서 다음 메소드를 구현하십시오.
> 
> ```java
> public String getCategoryKey();
> ```
> 
> > 화면 탐색 항목에 사용되는 범주의 고유 식별자를 반환합니다.
> 
> ```java
> public String getLabel(Locale locale);
> ```
> 
> > UI에 표시될 화면 탐색 항목의 텍스트 레이블을 반환합니다. 언어 키를 사용하여 레이블 검색에 대한 참조는 [C1N4ScreenNavigationEntry.java](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/catalog/adding-a-new-product-type/resources/liferay-c1n4.zip/c1n4-web/src/main/java/com/acme/c1n4/web/internal/frontend/taglib/servlet/taglib/C1N4ScreenNavigationEntry.java) 의 구현을 참조하십시오.
> 
> ```java
> public String getScreenNavigationKey();
> ```
> 
> > 이것은 Liferay에서 화면이 나타나야 하는 사이트를 나타내는 키를 반환합니다. 제품의 다른 화면에 제대로 표시되도록 문자열 값 `"cp.definition.general"` 을 반환합니다.
> 
> ### `ScreenNavigationEntry` 인터페이스 검토
> 
> 다음 메서드를 사용하여 화면 탐색 항목 클래스에서 계속 빌드합니다.
> 
> ```java
> String getCategoryKey();
> ```
> 
> > 화면에서 사용하는 화면 탐색 카테고리의 고유 식별자를 반환합니다.
> 
> ```java
> String getEntryKey();
> ```
> 
> > 화면 탐색 항목에 대한 고유 식별자를 반환합니다. `getCategoryKey`과 같은 값을 반환합니다.
> 
> ```java
> String getScreenNavigationKey();
> ```
> 
> > 이것은 `ScreenNavigationCategory` 인터페이스에 대한 `getScreenNavigationKey` 과 동일한 방법입니다. 문자열 값 `"cp.definition.general"`을 반환하여 이 메서드를 구현했습니다.
> 
> ```java
> public void render(
>         HttpServletRequest httpServletRequest,
>         HttpServletResponse httpServletResponse)
>     throws IOException;
> ```
> 
> > 여기에서 제품 유형에 대한 사용자 지정 화면을 렌더링하는 코드를 추가합니다.
> 
> ### 제품 유형을 완성하십시오
> 
> 상품 유형은 상품 삭제를 위한 백엔드 로직, 내비게이션 메뉴에서 화면을 렌더링하는 로직, 커스텀 화면 자체로 구성됩니다. 다음을 수행하십시오.
> 
> * [모듈에 대해 `ServletContext` 을 구성합니다.](#configure-the-servletcontext-for-the-module)
> * [`ScreenNavigationEntry`의 `렌더링` 메서드를 구현합니다.](#implement-the-screennavigationentrys-render-method)
> * [`ScreenNavigationEntry`의 `isVisible` 메서드를 재정의합니다.](#override-the-screennavigationentrys-isvisible-method)
> * [`deleteCPDefinition`에 제품 유형 삭제 논리를 추가합니다.](#add-the-product-type-deletion-logic-to-deletecpdefinition)
> * [사용자 정의 화면을 렌더링하기 위해 JSP를 추가하십시오.](#add-a-jsp-to-render-the-custom-screen)
> * [언어 키를 `Language.properties`에 추가하십시오.](#add-the-language-key-to-languageproperties)
> 
> #### 모듈에 대한 `ServletContext` 구성
> 
> 모듈에서 JSP를 찾을 수 있도록 번들의 기호 이름을 사용하여 `ScreenNavigationEntry` 클래스에서 `ServletContext` 을 정의합니다.
> 
> ```java
> @Reference(target = "(osgi.web.symbolicname=com.acme.c1n4.web)")
> private ServletContext _servletContext
> ```
> 
> > `osgi.web.symbolicname` 에 설정한 값은 [bnd.bnd 파일](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/catalog/adding-a-new-product-type/resources/liferay-c1n4.zip/c1n4-web/bnd.bnd) 의 `Bundle-SymbolicName` 값과 일치합니다. 이러한 값은 JSP를 찾으려면 `ServletContext` 과 일치해야 합니다.
> > 
> > 우리는 bnd.bnd 파일에서 `Web-ContextPath` 에 대한 고유한 값을 선언하므로 `ServletContext` 이 올바르게 생성됩니다. 이 예에서 `Web-ContextPath` 은 `/c1n4-web`으로 설정됩니다. 이 값에 대한 참조는 [bnd.bnd](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/catalog/adding-a-new-product-type/resources/liferay-c1n4.zip/c1n4-web/bnd.bnd) 을 참조하십시오.
> 
> #### `ScreenNavigationEntry`의 `렌더링` 메서드 구현
> 
> ```java
> @Override
> public void render(
>         HttpServletRequest httpServletRequest,
>         HttpServletResponse httpServletResponse)
>     throws IOException {
> 
>     _jspRenderer.renderJSP(
>         _servletContext, httpServletRequest, httpServletResponse,
>         "/c1n4.jsp");
> }
> ```
> 
> > `JSPRenderer` 을 사용하여 제품 유형의 사용자 지정 화면에 대한 JSP를 렌더링합니다(예제에서는 [c1n4.jsp](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/catalog/adding-a-new-product-type/resources/liferay-c1n4.zip/c1n4-web/src/main/resources/META-INF/resources/c1n4.jsp) ). `ServletContext` 을 매개변수로 제공하여 생성한 JSP를 찾습니다.
> 
> #### `ScreenNavigationEntry`의 `isVisible` 메서드 재정의
> 
> ```java
> @Override
> public boolean isVisible(User user, CPDefinition cpDefinition) {
>     if (cpDefinition == null) {
>         return false;
>     }
> 
>     return Objects.equals(
>         cpDefinition.getProductTypeName(), getCategoryKey());
> }
> ```
> 
> > 사용자 지정 화면을 표시할 시기를 결정하는 논리를 여기에서 구현합니다. 이 예제에서는 `CPDefinition` 의 제품 유형이 예제 제품 유형과 일치하는지 여부만 확인합니다.
> 
> #### `deleteCPDefinition`에 제품 유형 삭제 논리 추가
> 
> 이 예에서는 `deleteCPDefinition`에 추가할 논리가 필요하지 않습니다.
> 
> #### 사용자 지정 화면을 렌더링하는 JSP 추가
> 
> 이 예제에서는 "Hello C1N4."를 인쇄하는 JSP를 추가합니다.
> 
> ```jsp
> <h1>Hello C1N4.</h1>
> ```
> 
> > 양식 또는 MVC 작업 명령과 같이 여기에서 사용자 지정 화면에 원하는 다른 입력 또는 작업을 구현합니다. JSP에서 액세스할 수 있는 MVC 작업 명령 추가에 대한 자세한 내용은 [MVC 작업 명령](https://help.liferay.com/hc/ko/articles/360018165091-MVC-Action-Command) 을 참조하십시오.
> 
> #### `Language.properties`에 언어 키 추가
> 
> 모듈 내의 [Language.properties](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/catalog/adding-a-new-product-type/resources/liferay-c1n4.zip/c1n4-web/src/main/resources/content/Language.properties) 파일에 언어 키와 해당 값을 추가합니다.
> 
> ```properties
> c1n4-commerce-product-type=C1N4 Commerce Product Type
> c1n4-screen-navigation-entry=C1N4 Screen Navigation Entry
> ```
> 
> > 자세한 내용은 [응용 프로그램 지역화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application) 을 참조하십시오.
> 
> ## 결론
> 
> 축하합니다! 이제 `CPType` 인터페이스를 구현하기 위한 기본 사항을 알고 있고 Liferay Commerce에 자체 사용자 정의 화면이 있는 새로운 제품 유형을 구현했습니다.
> 
> ## 관련 주제
> 
> * [애플리케이션 현지화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application)
