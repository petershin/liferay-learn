# 패키지 가져오기

다른 모듈에서 제공하는 기능이 필요한 사이트에 있는 경우가 많습니다. 이 기능에 액세스하려면 다른 모듈에서 모듈의 클래스 경로로 패키지를 가져와야 합니다. 이를 위해서는 다른 모듈이 원하는 기능이 포함된 패키지를 이미 [내보낸](./exporting-packages.md) 패키지가 있어야 합니다. OSGi 프레임워크는 패키지를 가져오기 모듈의 클래스 경로에 연결합니다. 모듈 JAR의 `META-INF/MANIFEST.MF` 파일은 `Import-Package` OSGi 헤더를 사용하여 패키지를 가져옵니다.

```properties
Import-Package: javax.portlet,com.liferay.portal.kernel.util
```

가져오기 패키지는 때때로 수동으로 지정해야 하지만 항상 그런 것은 아닙니다. 편리하게도 [Workspace](../../building-applications/tooling/liferay-workspace/what-is-liferay-workspace.md)기반 모듈 프로젝트는 필요한 패키지를 자동으로 감지하여 모듈 매니페스트의 패키지 가져오기 목록에 추가합니다. 가져오기 패키지는 때때로 수동으로 지정해야 합니다.

두 가지 다른 패키지 가져오기 시나리오가 있습니다.

* [자동 패키지 가져오기](#automatic-package-imports)
* [수동 패키지 가져오기](#manual-package-imports)

이러한 시나리오에서 패키지 가져오기가 지정되는 방법을 알아보려면 아래를 읽으십시오.

## 자동 패키지 가져오기

[자습서 예제( [모듈 프로젝트](./module-projects.md)참조)의 Workspace](../../building-applications/tooling/liferay-workspace/what-is-liferay-workspace.md)기반 프로젝트 또는 [Blade CLI](../../building-applications/tooling/blade-cli/generating-projects-with-blade-cli.md) 또는 Liferay Developer Studio 사용 [Bnd](http://bnd.bndtools.org/) 을 사용하여 만든 프로젝트. Gradle 플러그인은 Bnd를 호출하여 Gradle 종속성을 읽고 가져오기를 해결할 수 있습니다. 프로젝트의 JAR을 빌드할 때 Bnd는 모듈이 사용하는 패키지를 감지하고 `META-INF/MANIFEST.MF` 파일을 생성하며 패키지를 `Import-Package` 헤더에 할당합니다. 그런 의미에서 빌드 스크립트라는 한 곳에서만 종속성을 정의해야 하므로 패키지 가져오기는 자동입니다.

```{note}
Liferay의 프로젝트 템플릿은 [타사 Gradle 플러그인](https://github.com/TomDmitriev/gradle-bundle-plugin) 을 사용하여 Bnd를 호출합니다.
```

예를 들어 [Gogo Command Sample](https://github.com/liferay/liferay-blade-samples/tree/7.3/liferay-workspace/extensions/gogo) 의 `build.gradle`은 `com.liferay.portal.kernel` 및 `org.osgi.service.component.annotations`의 패키지를 사용합니다. 다음은 샘플의 `build.gradle` 파일입니다.

```groovy
dependencies {
    compileOnly group: "com.liferay.portal", name: "com.liferay.portal.kernel"
    compileOnly group: "org.osgi", name: "org.osgi.service.component.annotations"
}
```

다음은 Bnd가 샘플 JAR `META-INF/MANIFEST.MF` 파일에서 생성하는 `Import-Package` 헤더입니다.

```properties
Import-Package: com.liferay.portal.kernel.service;version="[4.3,5)"
```

빌드 파일은 종속성을 지정합니다. Bnd는 모듈이 사용하는 패키지를 가져오기 위해 모듈 클래스 경로를 검사합니다. 검사에는 클래스 경로에서 발견된 모든 클래스가 포함됩니다. 포함된 [타사 라이브러리 JARs](./configuring-dependencies/resolving-third-party-library-package-dependencies.md)의 클래스도 포함됩니다.

```{note}
플러그인 WAR 프로젝트의 경우 Liferay의 [WAB Generator](../../building-applications/reference/deploying-wars-wab-generator.md)는 WAR의 JSP, 설명자 파일 및 클래스(` WEB-INF/classes` 및 포함된 JAR). 또한 WAB 생성기는 `web.xml`, `liferay-web.xml`, `portlet.xml`, `liferay-portlet.xml` 및 `liferay-hook.xml` 설명자 파일을 검색합니다. 플러그인의 `WEB-INF/classes` 폴더나 포함된 JAR에서 찾을 수 없는 클래스에 대한 패키지 가져오기를 추가합니다.
```

## 수동 패키지 가져오기

모듈이 다음 사이트에서만 클래스를 참조하는 경우 수동으로 패키지 가져오기를 추가해야 합니다.

* 인식할 수 없는 설명자 파일
* 사용자 지정 또는 인식되지 않는 설명자 요소 또는 속성
* 반사 코드
* 클래스로더 코드

패키지를 수동으로 가져오는 방법은 다음과 같습니다.

1. 모듈의 `bnd.bnd` 파일을 엽니다.

1. `Import-Package` 헤더를 추가합니다.

1. 헤더의 패키지 목록에 패키지를 추가합니다.

```properties
Import-Package: [... existing package list,][add the package here]
```

```{note}
플러그인 WAR 프로젝트에서 패키지를 수동으로 가져오려면 위와 같은 `Import-Package` 헤더를 프로젝트의 `WEB-INF/liferay-plugin-package.properties` 파일에 추가하십시오.
```

### 자바 API 패키지

Java Portlet과 같은 Java API용 패키지는 [의미상 버전 관리](./semantic-versioning.md)가 아니지만 [이식 가능한 Java 계약](https://www.osgi.org/portable-java-contract- 정의/) . 각 API의 계약은 만족하는 JSR을 지정합니다. 이러한 API를 사용하는 모듈은 API 계약에 대한 요구 사항을 지정해야 합니다. 계약 요구 사항은 가져온 API 패키지와 모듈의 관계를 정의합니다. 실행 중인 시스템이 정확한 계약을 제공하지 *않으면* 모듈이 확인되지 않습니다. 누락된 패키지를 해결하는 것이 실행 중에 비호환성 오류를 처리하는 것보다 낫습니다.

[Workspace](../../building-applications/tooling/liferay-workspace/what-is-liferay-workspace.md)기반 프로젝트는 Portable Java Contracts를 자동으로 지정합니다! 예를 들어 모듈이 Java Portlet API를 사용하고 Java Portlet 2.0 아티팩트에 대해 컴파일하는 경우 패키지에 대한 계약 요구 사항이 모듈의 매니페스트에 추가됩니다.

```{note}
WAR 프로젝트는 Bnd를 사용하지 않으며 `WEB-INF/liferay-plugin-package.properties` 파일에 계약을 지정해야 합니다. 예를 들어, `JavaPortlet` 2.0에 대해 지정된 계약은 다음과 같습니다. `Import-Package: javax.portlet Require-Capability: osgi.contract;filter:=(&(osgi.contract=JavaPortlet)(version=2.0))`
```

축하합니다! 이제 모듈에서 사용할 모든 종류의 패키지를 가져올 수 있습니다.

## 추가 정보

* [종속성 구성](./configuring-dependencies.md)
* [블레이드 CLI](../../building-applications/tooling/blade-cli/generating-projects-with-blade-cli.md)
* [작업 공간](../../building-applications/tooling/liferay-workspace/what-is-liferay-workspace.md)
* [시맨틱 버전 관리](./semantic-versioning.md)
* [WAR 배포 \(WAB 생성기\)](../../building-applications/reference/deploying-wars-wab-generator.md)