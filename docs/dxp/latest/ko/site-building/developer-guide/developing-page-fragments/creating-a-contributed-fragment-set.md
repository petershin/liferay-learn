# 기여 조각 세트 생성

기여 조각 세트는 페이지 조각을 포함하는 배포 가능한 모듈입니다. 제공된 세트의 프래그먼트는 일반 프래그먼트처럼 사용할 수 있지만 데이터베이스에 포함되지 않으며 UI를 통해 직접 수정할 수 없습니다. Liferay 7.3 이상을 실행 중인 경우 압축된 ZIP 세트에서 생성된 [자동 배포 조각](./auto-deploying-fragments.md) 을 사용하는 것이 좋습니다. 자체 도구</a> 또는 [Liferay Fragments Toolkit](./using-the-fragments-toolkit.md)을 사용하여 이러한
을 생성할 수 있으며 UI에서 수정할 수 있고 이미지 리소스를 포함할 수 있습니다.</p> 

이 예제는 Liferay 7.3+에서 실행됩니다.



```{note}
Contributed Fragment Set을 통해 추가된 모든 Fragment는 모든 사이트에서 전역적으로 사용할 수 있습니다.
```


제공된 Fragment Set을 추가하려면 [`BaseFragmentCollectionContributor` Class](https://docs.liferay.com/dxp/apps/fragment/latest/javadocs/com/liferay/fragment/contributor/BaseFragmentCollectionContributor.html)을 확장합니다. 자체적으로 [`FragmentCollectionContributor` 인터페이스](https://docs.liferay.com/dxp/apps/fragment/latest/javadocs/com/liferay/fragment/contributor/FragmentCollectionContributor.html)을 구현합니다.

여기에서는 Fragment Set을 기여하는 방법을 배웁니다.

- [기여 조각 세트 배포](#deploy-a-contributed-fragment-set)
- [Contributed Fragment Set 논리 및 메타데이터](#contributed-fragment-set-logic-and-metadata)
- [조각 리소스 추가](#add-fragment-resources)
- [관련 정보](#related-information)



```{note}
Liferay DXP 7.4+의 경우 조각 컬렉션은 Liferay UI에서 조각 세트라고 합니다.
```




## 기여 조각 세트 배포

```{include} /_snippets/run-liferay-portal.md


```

Then, follow these steps to deploy an example to see what a contributed Fragment Set looks like:

1. Download and unzip the [example](https://learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-l3m9.zip):

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-l3m9.zip -O
    ```




    ```bash
    unzip liferay-l3m9.zip
    ```


1. 모듈 루트에서 제공된 Set의 JAR을 빌드하고 배포합니다. 
   

    ```bash
    cd liferay-l3m9
    ```




    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```




    ```{note}
    Windows에서 테스트하는 경우 먼저 `./gradlew build`로 모듈을 빌드한 다음 배포에 실패하면 JAR을 수동으로 `docker cp docker-container-name:/opt/liferay/osgi/modules`에 직접 복사해야 할 수 있습니다.
    ```


1. Liferay Docker 컨테이너 콘솔에 대한 배포를 확인합니다. 아래 로그 메시지가 Docker 콘솔에 표시되어야 합니다. 
   
   

    ```bash
    INFO  [fileinstall-directory-watcher][BundleStartStopLogger:46] STARTED com.acme.l3m9.impl_1.0.0 [1824]
    ```


1. 제공된 조각 세트를 사용할 수 있는지 확인합니다. *사이트 메뉴* (![Site Menu](../../../images/icon-product-menu.png))을 열고 *디자인* &rarr; *조각*로 이동합니다. 세트가 기본 세트 목록에 나타나야 합니다.
   
   ![제공된 조각 세트가 기본 세트 목록에 나타나는지 확인합니다.](./creating-a-contributed-fragment-set/images/01.png)

엄청난! 제공된 조각 세트를 성공적으로 배포했습니다.

보시다시피 제공된 조각 세트는 기본 조각 세트와 함께 표시되며 조각은 UI에서 수정할 수 없습니다. 세트를 수정하는 유일한 방법은 원래 모듈을 업데이트하거나 Fragment를 다른 Set [에 복사하고](../../creating-pages/page-fragments-and-widgets/using-fragments/managing-fragments.md#managing-individual-page-fragments) 사본을 수정하는 것입니다.



## Contributed Fragment Set 논리 및 메타데이터

Fragment Set 컨트리뷰터는 Set에 대한 정보를 제공하기 위해 `*FragmentCollectionContributor` 클래스의 두 메서드를 재정의합니다.

`getFragmentCollectionKey()` 메서드는 이러한 조각이 제공되는 조각 세트의 키/이름을 반환합니다.



```java
@Override
public String getFragmentCollectionKey() {
    return "l3m9";
}
```


`getServletContext()` 메소드는 기여된 Fragment Set 모듈에 대한 서블릿 컨텍스트를 리턴합니다.



```java
@Override
public ServletContext getServletContext() {
    return _servletContext;
}
```


`ServletContext` 은 Fragment 리소스를 찾을 수 있도록 번들의 기호 이름을 가리킵니다.



```java
@Reference(
  target = "(osgi.web.symbolicname=com.liferay.learn.fragments)"
)
private ServletContext _servletContext;
```


`bnd.bnd` 파일에는 Set에 대해 정의해야 하는 몇 가지 속성이 포함되어 있습니다.

* `osgi.web.symbolicname` 은 `bnd.bnd` 파일의 `Bundle-SymbolicName` 과 일치합니다.
* `Web-ContextPath` 헤더는 Set이 포함된 모듈 폴더를 나타내므로 `ServletContext` 이 올바르게 생성됩니다.
* `-dsannotations-options` 은 Component 클래스의 클래스 계층 구조에 있는 선언적 서비스 주석을 활성화합니다.

이러한 값에 대한 참조는 예제 프로젝트의 [`bnd.bnd`](https://learn.liferay.com/dxp/latest/en/site-building/developer-guide/developing-page-fragments/liferay-l3m9.zip) 을 참조하십시오.

이제 기여한 Set에 다른 Fragment를 포함하도록 프로젝트를 수정합니다.



## 조각 리소스 추가

제공된 조각 세트에 새 패키지 조각을 추가하려면 다음 단계를 따르십시오.

1. 예제의 `l3m9-impl/l3m9-jumbotron` 폴더를 `l3m9-impl/src/main/resources/com/acme/l3m9/internal/fragment/contributor/l3m9/dependencies` 폴더로 이동합니다. 
   
   

    ```bash
    cp -r l3m9-impl/l3m9-jumbotron l3m9-impl/src/main/resources/com/acme/l3m9/internal/fragment/contributor/l3m9/dependencies/
    ```


프래그먼트 생성에 대한 자세한 내용은 [Fragments Toolkit](./using-the-fragments-toolkit.md) 을 사용하여 페이지 프래그먼트 개발을 참조하십시오. 



    ```{note}
    패키징된 Fragments는 `dependencies` 폴더에 들어가며 클래스 패키지 이름과 리소스 패키지 이름이 일치해야 합니다(예: `[class.package.path].dependencies`).
    ```




    ```{note}
    기여 조각 세트는 [포함된 리소스](./include-default-resources-with-fragments.md)를 지원하지 않습니다.
    ```


1. 업데이트된 기여 세트의 JAR을 빌드하십시오. 
   

    ```bash
    cd liferay-l3m9
    ```




    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```




    ```{note}
    Windows에서 배포에 실패하면 [컨테이너에 Liferay 탑재](../../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/providing-files-를 바인딩해야 할 수 있습니다. to-the-container.md), `.\gradlew jar`로 모듈 JAR을 빌드하고 JAR을 적절한 bind-mounted 폴더에 복사합니다.
    ```


1. 업데이트된 Fragment가 제공된 세트에 포함되어 있는지 확인하십시오. 브라우저에서 `https://localhost:8080`을 가리키고 화면 왼쪽의 사이트 메뉴 아래에서 *Design* &rarr; *Fragments*으로 이동합니다. L3M9 Jumbotron Fragment가 L3M9 세트에 나타납니다.
   
   ![커스텀 Jumbotron Fragment는 기부된 세트에 포함되어 있습니다.](./creating-a-contributed-fragment-set/images/02.png)

축하합니다! 이제 기여 Fragment Set을 생성하는 방법을 알고 있고 Liferay에 새로운 기여 Fragment Set를 추가했습니다.



## 관련 정보

* [조각 툴킷 사용](./using-the-fragments-toolkit.md)
* [조각 편집기 사용](./using-the-fragments-editor.md)