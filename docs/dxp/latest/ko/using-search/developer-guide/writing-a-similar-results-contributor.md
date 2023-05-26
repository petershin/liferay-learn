# 유사한 결과 위젯에 사용자 지정 콘텐츠 제공

> **가입자**

> **가용성:** 이 기능은 Liferay DXP 7.3+와 함께 번들로 제공되는 서비스 공급자 인터페이스(SPI)에 의존합니다. [Liferay Marketplace](https://web.liferay.com/marketplace/-/mp/application/172465398) 의 유사한 결과 위젯 설치를 통해 Fix Pack 5+의 Liferay DXP 7.2에서 사용할 수 있습니다.

`SimilarResultsContributor`을 구현하여 [유사한 결과 위젯](../search-pages-and-widgets/similar-results.md) 에 애플리케이션의 사용자 정의 콘텐츠를 표시할 수 있습니다. 기여자가 작동하려면 유사한 결과 위젯이 콘텐츠를 페이지의 주요 자산으로 감지할 수 있어야 합니다. 즉, 지원되는 Liferay DXP 자산(예: 블로그 항목 및 위키 페이지)과 같이 "디스플레이 위젯"의 URL을 통해 표시할 수 있어야 합니다. 유사한 결과 위젯은 사용자 지정 기여자가 없어도 Lifery DXP의 Asset Publisher에 표시된 모든 콘텐츠와 함께 이미 사용할 수 있습니다.
<!-- I'd like to see the image highlight what someone should be noticing in this image because it is not immediately obvious. -->
![The Blogs display widget works with Similar Results because of its contributor.](./writing-a-similar-results-contributor/images/01.png "Blogs Similar Results")

기술 자료 응용 프로그램은 기본적으로 KB 기사에 대해 `SimilarResultsContributor` 을 구현하지 않으므로 이 예제에서는 하나를 구현합니다. 간단하게 여기에서는 응용 프로그램의 루트 폴더에 있는 KB 기사만 다룹니다.

## 개요

1. [**예제 배포**](#deploy-an-example)
1. [**예제 살펴보기**](#walk-through-the-example)
1. [**추가 정보**](#additional-information)

## 예제 배포

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계에 따라 Liferay DXP 인스턴스에서 예시 `SimilarResultsContributor`를 시작하고 실행합니다.

1. [Acme 유사한 결과 기여자](./liferay-r1s1.zip) 를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/using-search/developer-guide/liferay-r1s1.zip -O
    ```

    ```bash
    unzip liferay-r1s1.zip
    ```

1. 모듈 루트에서 빌드 및 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 배포된 jar를 Docker 컨테이너의 /opt/liferay/osgi/modules에 복사하는 것과 동일합니다.
    ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.r1s1.impl_1.0.0 [1009]
    ```

1. 예제 기여자가 작동하는지 확인합니다. 브라우저를 `https://localhost:8080`로 열어 시작합니다.

1. **사이트 메뉴** &rarr; **콘텐츠** &rarr; **기술 자료** 에 일부 KB 기사 추가 .

    유사한 **Title** 및 **Content** 필드가 있는지 확인하십시오. 이 문자열을 사용하여 세 개의 기사를 만들 수 있습니다(제목과 내용에 동일한 문자열 사용).

**테스트 KB 기사 1**

**테스트 KB 기사 2**

**테스트 KB 기사 3**

1. Knowledge Base Display 위젯을 페이지에 추가한 다음 유사한 결과 위젯을 추가합니다.

1. 유사한 결과 위젯의 위젯 구성을 열고 다음 설정에 대해 값을 **1** 로 설정했는지 확인합니다.

    최소 기간 빈도: 1 최소 문서 빈도: 1

1. KB 문서 중 하나를 클릭하여 기본 자산으로 표시하도록 선택합니다.

    이제 유사한 결과 위젯에 다른 관련 KB 기사가 표시됩니다.
<!-- This image could be a bit larger and also have some sort of highlighting to indicate the element that we want to draw the readers attention towards. -->
![The Similar Results widget can display KB Articles.](./writing-a-similar-results-contributor/images/02.png "KB Similar Results")

이제 예제가 제대로 작동하는지 확인했으므로 작동 방식을 알아봅니다.

## 예제 살펴보기

배포된 예를 검토합니다. 여기에는 유사한 결과 위젯에 대한 사용자 정의 콘텐츠를 활성화하는 기여자라는 하나의 클래스만 포함됩니다.

* [OSGi 등록을 위해 기여자 클래스에 주석 달기](#annotate-the-contributor-class-for-osgi-registration)
* [`SimilarResultsContributor` 인터페이스 검토](#review-the-similarresultscontributor-interface)

### OSGi 등록을 위해 기여자 클래스에 주석 달기

`R1S1SimilarResultsContributor` 은 `SimilarResultsContributor` 인터페이스를 구현합니다.

```java
@Component(service = SimilarResultsContributor.class)
public class R1S1SimilarResultsContributor implements SimilarResultsContributor {
```

`서비스` 구성 요소 속성은 구현을 `SimilarResultsContributor` 서비스로 등록합니다.

### `SimilarResultsContributor` 인터페이스 검토

인터페이스에서 세 가지 방법을 구현합니다.

```java
public void detectRoute(RouteBuilder routeBuilder, RouteHelper routeHelper);
```

`detectRoute` 을 구현하여 엔티티 URL 패턴의 고유한 부분을 제공하여 유사한 결과 위젯이 기여자를 호출해야 하는지 감지할 수 있도록 합니다. URL 패턴은 `RouteBuilder` 객체의 속성으로 추가됩니다. `RouteHelper` 은 구문 분석을 위해 전체 URL 문자열을 검색하는 데 유용합니다.

```{note}
각 표시 위젯에 대해 하나의 `SimilarResultsContributor`만 지원됩니다.
```

```java
public void resolveCriteria(
    CriteriaBuilder criteriaBuilder, CriteriaHelper criteriaHelper);
```

페이지의 기본 엔터티를 사용하여 해당 검색 엔진 문서를 조회하려면 `resolveCriteria` 을 구현합니다. 이는 감지된 경로가 귀하의 기여자가 적절한 것으로 나타나면 호출됩니다.

```java
public void writeDestination(
    DestinationBuilder destinationBuilder,
    DestinationHelper destinationHelper);
```

사용자가 유사한 결과 위젯에서 링크를 클릭할 때 기본 자산을 업데이트하려면 `writeDestination` 을 구현하십시오.

### 유사한 결과 기여자를 완료하십시오.

#### `detectRoute` 메서드 구현

```java
@Override
public void detectRoute(
    RouteBuilder routeBuilder, RouteHelper routeHelper) {

    String[] pathParts = StringUtil.split(
        _http.getPath(routeHelper.getURLString()),
        Portal.FRIENDLY_URL_SEPARATOR);

    String[] parameters = StringUtil.split(
        pathParts[pathParts.length - 1], CharPool.FORWARD_SLASH);

    if (!parameters[0].matches("knowledge_base")) {
        throw new RuntimeException(
            "Knowledge base article was not detected");
    }

    routeBuilder.addAttribute("urlTitle", parameters[1]);
}
```

`detectRoute` 을 구현하여 엔터티 URL 패턴의 고유한 부분에 대한 논리 검사를 삽입합니다. 유사 결과 위젯은 이 확인을 사용하여 올바른 `SimilarResultsContributor`을 찾습니다. 엔티티의 표시 URL이 감지되면 나중에 사용할 수 있도록 URL 경로에 하나 이상의 속성을 추가하십시오. 여기에서는 친숙한 URL에서 `"knowledge_base"` 을 확인하고 감지된 경우 메서드 서명에 전달된 `RouteBuilder` 에 속성으로 `"urlTitle"` 을 추가합니다.

`routeHelper.getUrlString` 호출은 가상 인스턴스 내에서 감지된 자산의 상대 URL을 검색하는 데 사용될 수 있으므로 중요합니다. 예를 들어,

```sh
/web/guest/page-title/-/knowledge_base/kb-article-url-title
```

`RouteBuilder` 에 속성으로 추가되는 ID는 `resolveCriteria` 메소드에서 엔티티 및 해당 검색 엔진 문서를 가져오는 데 사용됩니다.

#### `resolveCriteria` 메서드 구현

```java
@Override
public void resolveCriteria(
    CriteriaBuilder criteriaBuilder, CriteriaHelper criteriaHelper) {

    String urlTitle = (String)criteriaHelper.getRouteParameter("urlTitle");

    KBArticle kbArticle = _kbArticleLocalService.fetchKBArticleByUrlTitle(
        criteriaHelper.getGroupId(),
        KBFolderConstants.DEFAULT_PARENT_FOLDER_ID, urlTitle);

    if (kbArticle == null) {
        return;
    }

    AssetEntry assetEntry = _assetEntryLocalService.fetchEntry(
        criteriaHelper.getGroupId(), kbArticle.getUuid());

    if (assetEntry == null) {
        return;
    }

    String uidField = String.valueOf(kbArticle.getPrimaryKeyObj());

    if (ReleaseInfo.getBuildNumber() ==
            ReleaseInfo.RELEASE_7_2_10_BUILD_NUMBER) {

        uidField = String.valueOf(kbArticle.getResourcePrimKey());
    }

    criteriaBuilder.uid(Field.getUID(assetEntry.getClassName(), uidField));
}
```

페이지의 표시된 엔터티에 해당하는 검색 엔진 문서를 찾습니다. `criteriaBuilder.uid` 메서드에 적절한 검색 엔진 문서의 `uid` 필드 값을 제공해야 합니다(이는 일반적으로 문서의 Elasticsearch 지정 `_id` 필드와 동일함). Liferay DXP 인덱스에서 이 필드는 항목 클래스 이름과 클래스 기본 키의 구성입니다. 둘 다 문자열로 `Field.getUID` 에 전달하여 값을 얻습니다. 이 예는 `detectRoute` 메서드( `urlTitle`)의 속성에 추가한 ID를 사용하여 모델 엔터티를 가져온 다음 이를 사용하여 자산 항목을 검색하는 것으로 시작합니다.

```{important}
Liferay DXP 7.2와 Liferay DXP 7.3 사이에는 차이가 있으므로 각각에 대한 논리와 함께 버전을 확인하는 조건이 여기에 제공됩니다. Liferay DXP 7.3에서는 'getPrimaryKeyObj'가 클래스 이름과 함께 사용되지만 Liferay DXP 7.2에서는 'getResourcePrimKey'가 필요합니다.
```

이제 일치하는 문서를 찾을 수 있으므로 유사한 결과가 업데이트되도록 대상 URL을 작성합니다.

#### `writeDestination` 메서드 구현

```java
@Override
public void writeDestination(
    DestinationBuilder destinationBuilder,
    DestinationHelper destinationHelper) {

    String urlTitle = (String)destinationHelper.getRouteParameter(
        "urlTitle");

    AssetRenderer<?> assetRenderer = destinationHelper.getAssetRenderer();

    KBArticle kbArticle = (KBArticle)assetRenderer.getAssetObject();

    destinationBuilder.replace(urlTitle, kbArticle.getUrlTitle());
}
```

사용자가 유사한 결과 위젯에서 링크를 클릭할 때 기본 자산을 업데이트하려면 `writeDestination` 을 구현하십시오. More Like This 쿼리가 검색 엔진으로 다시 전송되고 유사한 결과 목록이 새 기본 자산과 일치하도록 다시 렌더링됩니다. KB 기사의 경우 전체 작업은 원래 URL(주 자산용)의 `urlTitle` 을 일치하는 엔터티의 `urlTitle` 으로 바꾸는 것입니다.

`destinationHelper.getRouteParameter` 호출이 중요합니다. 사전 검색 연산자인 `DestinationHelper` 의 유일한 방법으로 기본 자산 또는 유사한 결과 링크를 다시 렌더링하기 전에 항상 현재 선택된 기본 자산의 데이터를 반환합니다. 여기에 표시된 다른 하나인 `getAssetRenderer`을 포함하여 나머지 `개의 DestinationHelper` 메서드는 일치하는 자산에 대한 데이터를 반환합니다. 이 메서드는 각 일치 결과에 대해 반복적으로 실행됩니다.

#### 서비스 종속성 선언

이 코드는 OSGi 컨테이너에 배포된 서비스( `AssetEntryLocalService`, `KBArticleLocalService`및 `Http`)에 의존합니다. `org.osgi.service.component.annotations.Reference`에서 제공하는 Declarative Services `@Reference` 주석을 사용하여 필요를 선언하십시오. 비공개 필드로 설정합니다.

```java
@Reference
private AssetEntryLocalService _assetEntryLocalService;

@Reference
private Http _http;

@Reference
private KBArticleLocalService _kbArticleLocalService;
```

## 관련 주제

엔터티 URL의 각 구현은 크게 다를 수 있으므로 자신의 애플리케이션 기여자를 작성할 때 더 많은 영감이 필요한 경우 GitHub의 `SimilarResultsContributor` [인터페이스](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/dxp/apps/portal-search-similar-results/portal-search-similar-results-web-spi/src/main/java/com/liferay/portal/search/similar/results/web/spi/contributor/SimilarResultsContributor.java) 및 번들 [구현](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/dxp/apps/portal-search-similar-results/portal-search-similar-results-web/src/main/java/com/liferay/portal/search/similar/results/web/internal/contributor) 을 참조하십시오.

유사한 결과 위젯에 애플리케이션의 맞춤 콘텐츠를 제공하는 데 관련된 대부분의 작업은 표시 URL을 사용하는 작업입니다. Liferay의 자체 자산이 표시 URL을 생성하는 방법을 알아보려면 엔티티의 `*AssetRenderer` 클래스의 `getURLView` 메서드를 검사하십시오.

* [`JournalArticleAssetRenderer#getURLView`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/journal/journal-web/src/main/java/com/liferay/journal/web/internal/asset/model/JournalArticleAssetRenderer.java#L352-L383) , Liferay DXP 7.3.2 GA3
* [`WikiPageAssetRenderer#getURLView`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/wiki/wiki-web/src/main/java/com/liferay/wiki/web/internal/asset/model/WikiPageAssetRenderer.java#L232-L249) , 라이프레이 DXP 7.3.2 GA3
* [`BlogsEntryAssetRenderer#getURLView`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/blogs/blogs-web/src/main/java/com/liferay/blogs/web/internal/asset/model/BlogsEntryAssetRenderer.java#L202-L218) , Liferay DXP 7.3.2 GA3
* [`DLFileEntryAssetRenderer#getURLView`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/document-library/document-library-web/src/main/java/com/liferay/document/library/web/internal/asset/model/DLFileEntryAssetRenderer.java#L280-L297) , 라이프레이 DXP 7.3.2 GA3

앞서 언급했듯이 이 예제는 애플리케이션의 루트 폴더에서 KB 기사와 함께 작동할 `SimilarResultsModelDocumentContributor` 생성을 보여줍니다. KB 폴더에 대한 지원을 추가하는 것이 가능하며 의욕이 있는 독자에게는 흥미로운 연습입니다. 영감을 얻으려면 [`DocumentLibrarySimilarResultsContributor`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/dxp/apps/portal-search-similar-results/portal-search-similar-results-web/src/main/java/com/liferay/portal/search/similar/results/web/internal/contributor/document/library/DocumentLibrarySimilarResultsContributor.java) 의 소스 코드를 살펴보십시오.

### 문제 해결: 자산 UID 아키텍처

`uid` 은 Liferay DXP 7.3부터 표준 방식으로 구성됩니다. `com.liferay.portal.search.internal.model.uid.UIDFactoryImpl` 클래스는 Liferay의 인덱싱 아키텍처에 의해 제어되는 모든 문서에 대해 `uid` 을 설정하는 역할을 합니다. 이제 표준화되었으므로 추측할 필요가 없습니다.

마찬가지로 버전 7.2 및 7.1에서 엔티티가 Composite Indexer API로 인덱싱된 경우(즉, `ModelDocumentContributor` 클래스가 있는 경우) `uid` 은 Liferay의 구현에 의해 설정되고 표준화됩니다.

그러나 레거시 인덱서 API로 인덱싱된 엔터티(즉, 엔터티에는 Liferay의 `BaseIndexer`를 확장하는 `*Indexer` 클래스가 있음)는 `uid`를 설정하는 논리를 재정의했을 수 있으므로 엔터티의 인덱싱 구현을 살펴볼 가치가 있습니다.

## 결론

`SimilarResultsContributor`을 구현하면 유사한 결과 위젯에 표시할 사용자 지정 콘텐츠를 제공할 수 있습니다.
