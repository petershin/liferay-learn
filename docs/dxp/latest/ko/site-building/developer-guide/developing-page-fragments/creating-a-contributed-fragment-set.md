# 기여한 조각 세트 만들기

기여 조각 세트는 페이지 조각을 포함하는 배포 가능한 모듈입니다. 제공된 세트의 프래그먼트는 일반 프래그먼트처럼 사용할 수 있지만 데이터베이스에 포함되지 않으며 UI를 통해 직접 수정할 수 없습니다. Liferay 7.3 이상을 실행 중인 경우 압축된 ZIP 세트로 생성된 [자동으로 배포된 Fragments](./auto-deploying-fragments.md)를 사용하는 것이 좋습니다. [자체 도구](./using-the-fragments-toolkit.md#fragment-set-structure) 또는 [Liferay Fragments Toolkit](./using-the-fragments-toolkit.md)으로 이러한 항목을 만들 수 있습니다. UI에서 수정할 수 있으며 이미지 리소스를 포함할 수 있습니다.

이 예제는 Liferay 7.3 이상에서 실행됩니다.

```{note}
기여된 조각 세트를 통해 추가된 모든 조각은 모든 사이트에서 전 세계적으로 사용할 수 있습니다.
```

기여한 조각 집합을 추가하려면 [`BaseFragmentCollectionContributor` 클래스](https://docs.liferay.com/dxp/apps/fragment/latest/javadocs/com/liferay/fragment/contributor/BaseFragmentCollectionContributor.html) 를 확장하고, 이 클래스는 자체적으로 [`FragmentCollectionContributor` 인터페이스](https://docs.liferay.com/dxp/apps/fragment/latest/javadocs/com/liferay/fragment/contributor/FragmentCollectionContributor.html) 를 구현합니다.

여기서는 조각 집합을 기여하는 방법을 알아봅니다:

- [기여한 조각 세트 배포](#deploy-a-contributed-fragment-set)
- [기여한 조각 세트 로직 및 메타데이터](#contributed-fragment-set-logic-and-metadata)
- [조각 리소스 추가](#add-fragment-resources)
- [관련 정보](#related-information)

```{note}
Liferay DXP 7.4+의 경우, 조각 컬렉션은 Liferay UI에서 조각 세트라고 합니다.
```

## 기여한 조각 세트 배포

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 예제를 배포하여 제공된 조각 세트가 어떻게 보이는지 확인합니다.

1. [예제](https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-l3m9.zip) 를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-l3m9.zip -O
    ```

    ```bash
    unzip liferay-l3m9.zip
    ```

1. 모듈 루트에서 기여한 세트의 JAR을 빌드하고 배포합니다. 

    ```bash
    cd liferay-l3m9
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    Windows에서 테스트하는 경우, 먼저 './gradlew build'를 사용하여 모듈을 빌드한 다음 배포에 실패하면 JAR을 `docker cp docker-container-name:/opt/liferay/osgi/modules`에 직접 수동으로 복사해야 할 수 있습니다.
    ```

1. Liferay Docker 컨테이너 콘솔에 배포를 확인합니다. 아래 로그 메시지가 Docker 콘솔에 표시되어야 합니다: 

    ```bash
    INFO  [fileinstall-directory-watcher][BundleStartStopLogger:46] STARTED com.acme.l3m9.impl_1.0.0 [1824]
    ```

1. 기여한 조각 집합을 사용할 수 있는지 확인합니다. *사이트 메뉴* (![Site Menu](../../../images/icon-product-menu.png))를 열고 *디자인* &rarr; *조각*으로 이동합니다. 세트가 기본 세트 목록에 나타나야 합니다.
   
   ![기여한 조각 세트가 기본 세트 목록에 표시되는지 확인합니다.](./creating-a-contributed-fragment-set/images/01.png)

좋아요! 기여한 조각 집합을 성공적으로 배포했습니다.

보시다시피, 기여한 조각 세트는 기본 조각 세트와 함께 표시되며, UI에서 조각을 수정할 수 없습니다. 세트를 수정하는 유일한 방법은 해당 모듈을 업데이트하거나 [조각을 다른 세트(](../../creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md#managing-individual-page-fragments) )로 복사한 후 조각 복사본을 수정하는 것입니다.

## 기여한 조각 세트 로직 및 메타데이터

조각 집합 기여자는 집합에 대한 정보를 제공하기 위해 `*FragmentCollectionContributor` 클래스에서 두 가지 메서드를 재정의합니다.

`getFragmentCollectionKey()` 메서드는 이러한 조각이 기여한 조각 집합의 키/이름을 반환합니다:

```java
@Override
public String getFragmentCollectionKey() {
    return "l3m9";
}
```

`getServletContext()` 메서드는 기여한 조각 집합 모듈에 대한 서블릿 컨텍스트를 반환합니다:

```java
@Override
public ServletContext getServletContext() {
    return _servletContext;
}
```

`ServletContext` 는 프래그먼트 리소스를 찾을 수 있도록 번들의 심볼릭 이름을 가리킵니다:

```java
@Reference(
  target = "(osgi.web.symbolicname=com.liferay.learn.fragments)"
)
private ServletContext _servletContext;
```

`bnd.bnd` 파일에는 세트에 대해 정의해야 하는 몇 가지 속성이 포함되어 있습니다:

* `osgi.web.symbolicname` 은 `bnd.bnd` 파일에 있는 `Bundle-SymbolicName` 과 일치합니다.
* `Web-ContextPath` 헤더는 세트가 포함된 모듈 폴더를 나타내므로 `ServletContext` 가 올바르게 생성됩니다.
* `-dsannotations-옵션` 은 컴포넌트 클래스의 클래스 계층 구조에 있는 선언적 서비스 어노테이션을 활성화합니다.

이러한 값에 대한 참조는 예제 프로젝트의 [`bnd.bnd`](https://resources.learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-l3m9.zip) 을 참조하세요.

이제 기여한 세트에 다른 조각을 포함하도록 프로젝트를 수정합니다.

## 조각 리소스 추가

기여한 조각 세트에 새 패키지 조각을 추가하려면 다음 단계를 따르세요:

1. 예제의 `l3m9-impl/l3m9-jumbotron` 폴더를 `l3m9-impl/src/main/resources/com/acme/l3m9/internal/fragment/contributor/l3m9/dependencies` 폴더로 이동합니다. 

    ```bash
    cp -r l3m9-impl/l3m9-jumbotron l3m9-impl/src/main/resources/com/acme/l3m9/internal/fragment/contributor/l3m9/dependencies/
    ```

[조각 생성에 대한 자세한 내용은 조각 툴킷으로 페이지 조각 개발하기](./using-the-fragments-toolkit.md) 을 참조하세요. 

    ```{note}
    패키지 조각은 '의존성' 폴더에 들어가며, 클래스 패키지 이름과 리소스 패키지 이름이 일치해야 합니다(예: `[class.package.path].dependencies`).
    ```

    ```{note}
    기여한 조각 세트는 [포함된 리소스](./include-default-resources-with-fragments.md)를 지원하지 않습니다.
    ```

1. 업데이트된 기여한 세트의 JAR을 빌드합니다. 

    ```bash
    cd liferay-l3m9
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    Windows에서 배포에 실패한 경우, [컨테이너에 Liferay를 바인딩 마운트](../../../설치-업그레이드/설치-라이프레이/사용-라이프레이-도커-이미지/제공-파일-더-컨테이너.md)하고, '.\gradlew jar'로 모듈 JAR을 빌드한 다음, 해당 바인드 마운트된 폴더에 JAR을 복사해야 할 수도 있습니다.
    ```

1. 업데이트된 조각이 기여한 세트에 포함되어 있는지 확인합니다. 브라우저에서 `https://localhost:8080`로 이동한 다음 화면 왼쪽의 사이트 메뉴에서 *디자인* &rarr; *조각*으로 이동합니다. L3M9 점보트론 조각은 L3M9 세트에 나타납니다.
   
   ![커스텀 점보트론 조각은 기여한 세트에 포함되어 있습니다.](./creating-a-contributed-fragment-set/images/02.png)

축하합니다! 이제 기여한 조각 집합을 만드는 방법을 알았고, Liferay에 새로운 기여한 조각 집합을 추가했습니다.

## 관련 정보

* [조각 툴킷 사용](./using-the-fragments-toolkit.md)
* [조각 편집기 사용](./using-the-fragments-editor.md)
