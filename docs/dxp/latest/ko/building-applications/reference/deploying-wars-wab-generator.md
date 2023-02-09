# WAR 배포(WAB 생성기)

애플리케이션을 Java EE 스타일 WAR(Web Application ARchive) 아티팩트 또는 JAR(Java ARchive) OSGi 번들 아티팩트로 생성할 수 있습니다. Bean 포틀릿, PortletMVC4Spring 포틀릿 및 JSF 포틀릿은 해당 프레임워크가 WAR 레이아웃을 예상하고 `WEB-INF/web.xml` 설명자와 같은 Java EE 리소스가 필요하기 때문에 WAR로 패키지되어야 합니다.

Liferay는 이러한 WAR 스타일 플러그인이 Liferay의 OSGi 런타임에 의해 OSGi 모듈처럼 배포되고 처리되는 방법을 제공합니다. *WAB*로 변환할 수 있습니다.

Liferay DXP는 Java EE 스타일 WAR 배포를 위한 OSGi 웹 애플리케이션 번들(WAB) 표준을 지원합니다. WAB는 WAR 레이아웃이 있고 `Bundle-SymbolicName` OSGi 지시어가 있는 `META-INF/MANIFEST.MF` 파일을 포함하는 아카이브입니다. WAB는 OSGi 번들입니다. 프로젝트 소스에 WAR 레이아웃이 있지만 아티팩트 파일 이름은 `.jar` 또는 `.war` 확장자로 끝날 수 있습니다.

## WAB 생성기가 WAR을 변환하는 방법

Liferay는 WAB 생성기에 의해 자동 생성된 WAB의 사용만 지원합니다. WAB 생성기는 배포 중에 기존 WAR 스타일 플러그인을 WAB로 변환합니다. 그렇다면 WAB Generator는 WAR 파일을 WAB로 변환하기 위해 정확히 어떤 작업을 수행합니까?

WAB 생성기는 플러그인 WAR의 JSP, 설명자 파일 및 클래스( `WEB-INF/classes` 및 포함된 JAR)에서 참조되는 패키지를 감지합니다. 디스크립터 파일에는 `web.xml`, `liferay-web.xml`, `portlet.xml`, `liferay-portlet.xml`및 `liferay-hook.xml`가 포함됩니다. WAB 생성기는 감지된 패키지가 플러그인의 `WEB-INF/classes` 폴더에 있는지 또는 `WEB-INF/lib` 폴더에 포함된 JAR에 있는지 확인합니다. 두 사이트에서 찾을 수 없는 패키지는 WAB의 `META-INF/MANIFEST.MF` 파일에 있는 `Import-Package` OSGi 헤더에 추가됩니다.

다음 유형의 사이트에서만 참조되는 패키지를 가져오려면 `Import-Package` OSGi 헤더를 플러그인의 `WEB-INF/liferay-plugin-package.properties` 파일에 추가하고 패키지를 해당 헤더의 값 목록:

* 인식할 수 없는 설명자 파일
* 사용자 지정 또는 인식되지 않는 설명자 요소 또는 속성
* 반사 코드
* 클래스 로더 코드

## WAR 대 WAB 구조

WAB 폴더 구조와 WAR 폴더 구조는 다릅니다. WAR 스타일 포틀릿의 다음 폴더 구조를 고려하십시오.

**WAR**

* `my-war-portlet`
    * `src`
        * `main`
            * `java`
            * `webapp`
                * `WEB-INF`
                    * `classes`
                    * `lib`
                    * `resources`
                    * `views`
                    * `liferay-display.xml`
                    * `liferay-plugin-package.properties`
                    * `liferay-portlet.xml`
                    * `portlet.xml`
                    * `web.xml`

WAR 스타일 포틀릿이 Liferay에 배포되고 WAB 생성기에 의해 처리되면 포틀릿의 폴더 구조가 변환됩니다.

**WAB**

* `my-war-portlet-that-is-now-a-wab`
    * `META-INF`
        * `MANIFEST.MF`
    * `WEB-INF`
        * `classes`
        * `lib`
        * `resources`
        * `views`
        * `liferay-display.xml`
        * `liferay-plugin-package.properties`
        * `liferay-portlet.xml`
        * `portlet.xml`
        * `web.xml`

주요 차이점은 `META-INF/MANIFEST.MF` 파일이 추가되었다는 것입니다. WAB 생성기는 OSGi 지원 매니페스트 파일을 자동으로 생성합니다. 매니페스트 파일의 내용에 영향을 미치려면 Bnd 지시문 및 OSGi 헤더를 플러그인의 `liferay-plugin-package.properties` 파일에 직접 배치할 수 있습니다.

```{note}
생성된 WAB는 수동으로 추가된 `bnd.bnd` 파일 또는 빌드 타임 플러그인(예: `bnd-maven-plugin`)을 사용할 수 없습니다.
```

## WAR 배포

WAR 플러그인을 기반으로 WAB를 배포하려면 WAR 플러그인을  [`[Liferay Home]`](../../installation-and-upgrades/reference/liferay-home.md)에 있는 Liferay 인스턴스의 `deploy/` 폴더에 복사합니다.

## WAB 사본 저장

선택적으로 WAB를 로컬 폴더에 저장합니다. 이렇게 하면 생성된 WAB를 검사할 수 있습니다. 생성된 WAB를 저장하려면 다음 [포털 속성](../../installation-and-upgrades/reference/portal-properties.md) 을 `[Liferay Home]/portal-ext.properties` 파일에 추가합니다. 그런 다음 Liferay 서버를 다시 시작합니다.

```properties
module.framework.web.generator.generated.wabs.store=true
module.framework.web.generator.generated.wabs.store.dir=${module.framework.base.dir}/wabs
```

이러한 속성은 생성된 WAB를 설치의 `osgi/wabs/` 폴더에 저장하도록 WAB 생성기에 지시합니다. 생성된 WAB는 위의 예제 WAB 구조와 동일한 구조를 갖습니다. [모듈 프레임워크 웹 애플리케이션 번들](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Module%20Framework%20Web%20Application%20Bundles) 속성 섹션에서 자세한 내용을 설명합니다.

엄청난! WAR 플러그인을 WAB로 배포할 수 있으며 WAB 사본을 저장하여 검사하는 방법을 알고 있습니다!

## 추가 정보

* [WAB에서 제외된 JAR](./jars-excluded-from-wabs.md)
* [타사 라이브러리 패키지 종속성 해결](../../liferay-internals/fundamentals/configuring-dependencies/resolving-third-party-library-package-dependencies.md)
* [모듈 수명 주기](../../liferay-internals/architecture/module-lifecycle.md)