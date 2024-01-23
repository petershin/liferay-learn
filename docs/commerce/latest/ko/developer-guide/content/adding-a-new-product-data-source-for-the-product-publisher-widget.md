# 제품 게시자 위젯에 대한 새 제품 데이터 소스 추가

이 자습서에서는 `CPDataSource` 인터페이스를 구현하여 새 제품 데이터 소스를 추가하는 방법을 보여줍니다.

제품 데이터 소스는 관련된 제품을 검색하는 고유한 방법을 제공합니다. Liferay Commerce는 [제품 관계별로](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-service/src/main/java/com/liferay/commerce/product/internal/data/source/CPDataSourceDefinitionLinkTypeImpl.java) 및 [카테고리별](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-service/src/main/java/com/liferay/commerce/product/internal/data/source/CPDataSourceAssetCategoriesImpl.java) .

![즉시 사용 가능한 제품 데이터 소스](./adding-a-new-product-data-source-for-the-product-publisher-widget/images/01.png "즉시 사용 가능한 제품 데이터 소스")

## 개요

1. [**예제 배포**](#deploy-an-example)
1. [**예제 살펴보기**](#walk-through-the-example)
1. [**추가 정보**](#additional-information)

## 예제 배포

이 섹션에서는 Liferay Commerce 인스턴스에서 예제 제품 데이터 소스를 시작하고 실행합니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. [Acme Commerce 제품 데이터 소스](./liferay-m5x7.zip) 를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/commerce/latest/en/developer-guide/content/liferay-m5x7.zip -O
    ```

    ```bash
    unzip liferay-m5x7.zip
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
    STARTED com.acme.m5x7.impl_1.0.0
    ```

1. 예제 제품 데이터 소스가 추가되었는지 확인합니다. 브라우저를 `https://localhost:8080` 로 열고 Product Publisher 위젯이 있는 페이지로 이동합니다. 제품 게시자에 대해 **구성** 을 클릭한 다음 **제품 선택** 섹션에서 **데이터 소스** 을 선택합니다. 새 제품 데이터 소스("동일한 단어로 끝나는 제품")는 아래의 **데이터 소스** 드롭다운 아래에 표시됩니다.

![새 제품 데이터 소스](./adding-a-new-product-data-source-for-the-product-publisher-widget/images/02.png "새 제품 데이터 소스")

축하합니다. `CPDataSource`을 구현하는 새로운 제품 데이터 소스를 성공적으로 구축하고 배포했습니다.

다음으로 더 자세히 알아보기 위해 더 깊이 들어가 보겠습니다.

## 예제 살펴보기

이 섹션에서는 배포한 예제를 검토합니다. 먼저 OSGi 등록을 위해 클래스에 주석을 달겠습니다. 둘째, `CPDataSource` 인터페이스를 검토합니다. 셋째, `CPDataSource`구현을 완료합니다.

### OSGi 등록을 위해 클래스에 주석 달기

```java
@Component(
    property = "commerce.product.data.source.name=m5x7",
    service = CPDataSource.class
)
public class M5X7CPDataSource implements CPDataSource {
```

> 제품 데이터 소스 이름은 Liferay Commerce가 새 데이터를 기존 데이터 소스와 구별할 수 있도록 고유한 값이어야 합니다.

### `CPDataSource` 인터페이스 검토

다음 방법을 구현합니다.

```java
public String getLabel(Locale locale);
```

> 이 메서드는 제품 데이터 소스가 관련 제품을 검색하는 방법을 설명하는 텍스트 레이블을 반환합니다. 언어 키로 레이블 검색에 대한 참조는 [M5X7CPDataSource.java](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/content/adding-a-new-product-data-source-for-the-product-publisher-widget/resources/liferay-m5x7.zip/m5x7-impl/src/main/java/com/acme/m5x7/internal/commerce/product/data/source/M5X7CPDataSource.java) 의 구현을 참조하십시오.

```java
public String getName();
```

> 이것은 제품 데이터 소스의 이름을 반환합니다.

```java
public CPDataSourceResult getResult(
        HttpServletRequest httpServletRequest, int start, int end)
    throws Exception;
```

> 여기에서 관련 제품 검색을 수행하기 위해 비즈니스 로직을 추가합니다. `HttpServletRequest` 에는 결과가 어떤 식으로든 관련되어야 하는 특정 제품에 대한 참조가 포함되어 있습니다.
> 
> 이 메서드는 검색 결과 목록을 포함하는 `CPDataSourceResult`을 반환합니다. [CPDataSourceResult.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-api/src/main/java/com/liferay/commerce/product/data/source/CPDataSourceResult.java) 에서 구현을 참조하십시오.

### 제품 데이터 소스 완성

제품 데이터 원본은 관련 제품 검색을 수행하는 논리로 구성됩니다. 다음을 수행하십시오.

* [`getResult`에 검색 논리를 추가합니다.](#add-the-search-logic-to-getresult)
* [언어 키를 `Language.properties`에 추가하십시오.](#add-the-language-key-to-languageproperties)

#### 검색 로직을 `에 추가 getResult`

```java
@Override
public CPDataSourceResult getResult(
        HttpServletRequest httpServletRequest, int start, int end)
    throws Exception {

    CPCatalogEntry cpCatalogEntry =
        (CPCatalogEntry)httpServletRequest.getAttribute(
            CPWebKeys.CP_CATALOG_ENTRY);

    if (cpCatalogEntry == null) {
        return new CPDataSourceResult(new ArrayList<>(), 0);
    }

    return _cpDefinitionHelper.search(
        _portal.getScopeGroupId(httpServletRequest),
        new SearchContext() {
            {
                setAttributes(
                    HashMapBuilder.<String, Serializable>put(
                        Field.STATUS, WorkflowConstants.STATUS_APPROVED
                    ).put(
                        "excludedCPDefinitionId",
                        cpCatalogEntry.getCPDefinitionId()
                    ).build());
                setCompanyId(_portal.getCompanyId(httpServletRequest));
                setKeywords(
                    StringPool.STAR + _getLastWordOfName(cpCatalogEntry));
            }
        },
        new CPQuery(), start, end);
}
```

> [CPDefinitionHelper](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/commerce/commerce-product-service/src/main/java/com/liferay/commerce/product/internal/util/CPDefinitionHelperImpl.java) 을 사용하여 검색을 수행합니다. `CPDefinitionHelper` 은 제품 정의에 특정한 논리를 `BaseIndexer`의 검색 기능과 결합합니다. 자세한 내용은 [BaseIndexer.java](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/search/BaseIndexer.java) 를 참조하십시오.
> 
> 제품 정의의 ID를 `"excludedCPDefinitionId"` 속성 값으로 `SearchContext`에 추가합니다. 이렇게 하면 결과에서 원래 제품이 생략됩니다. 이 예에서는 검색할 제품 이름의 마지막 단어도 지정합니다. 자세한 내용은 예제 `M5X7CPDataSource.java` 파일의 `_getLastWordOfName` 메서드에서 검색 논리 구현을 참조하세요.

#### `Language.properties`에 언어 키 추가

모듈 내의 [Language.properties](https://github.com/liferay/liferay-learn/blob/master/docs/commerce/latest/en/developer-guide/content/adding-a-new-product-data-source-for-the-product-publisher-widget/resources/liferay-m5x7.zip/m5x7-impl/src/main/resources/content/Language.properties) 파일에 언어 키와 해당 값을 추가합니다.

```properties
products-ending-in-the-same-word=Products Ending in the Same Word
```

> 자세한 내용은 [응용 프로그램 지역화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application) 을 참조하십시오.

## 결론

축하합니다! 이제 `CPDataSource` 인터페이스를 구현하기 위한 기본 사항을 알고 있으며 Liferay Commerce에 새 제품 데이터 소스를 추가했습니다.

## 관련 주제

* [애플리케이션 현지화](https://help.liferay.com/hc/ko/articles/360018168251-Localizing-Your-Application)
* [관련 제품, 상향 판매 및 교차 판매](../../product-management/creating-and-managing-products/products/related-products-up-sells-and-cross-sells.md)
