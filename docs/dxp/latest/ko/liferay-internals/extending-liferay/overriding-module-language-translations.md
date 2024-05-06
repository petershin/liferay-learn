# 이전 버전에서 모듈 언어 번역 재정의

```{important}
Liferay DXP 7.4 U4(업데이트 4) 이상 또는 Liferay Portal 7.4 GA8 이상에서 [언어 재정의 도구](../../system-administration/configuring-liferay/changing-language-translations.md)는 권장 접근 방식. Liferay DXP/Portal 7.4+로 작업하는 경우 [전역 언어 번역 재정의](./overriding-global-language-translations.md)에 대한 지침을 따르십시오.
```

이전 버전에서 Liferay 응용 프로그램별 언어 번역을 재정의하는 것은 이전 버전의 전역 언어 번역을 재정의하는 것과 유사하지만 추가 단계가 있습니다.

## 모듈 언어 번역 검사

모듈의 언어 번역을 재정의하려면 먼저 [Gogo shell](../fundamentals/using-the-gogo-shell.md)에서 모듈에 대한 정보를 수집해야 합니다. 예를 들어 블로그 모듈에서 언어 번역을 재정의하려는 경우 키워드 "블로그"에 대해 `grep` 입니다. Gogo 명령 및 출력은 다음과 같습니다.

 ```
 g! lb | grep Blogs
 Output
 418|Active     |   10|Liferay Collaboration - Liferay Blogs - API (1.0.0)|1.0.0
 419|Active     |   10|Liferay Blogs API (6.4.5)|6.4.5
 420|Active     |   10|Liferay Blogs Item Selector API (4.0.5)|4.0.5
 421|Active     |   10|Liferay Blogs Recent Bloggers API (4.0.5)|4.0.5
 570|Active     |   10|Liferay Adaptive Media Blogs Editor Configuration (4.0.5)|4.0.5
 571|Active     |   10|Liferay Adaptive Media Blogs Item Selector Web (4.0.5)|4.0.5
 572|Active     |   10|Liferay Adaptive Media Blogs Web (4.0.9)|4.0.9
 573|Resolved   |   10|Liferay Adaptive Media Blogs Web Fragment (4.0.6)|4.0.6
 671|Active     |   15|Liferay Sharing Blogs (2.0.6)|2.0.6
 1126|Active     |   10|Liferay Collaboration - Liferay Blogs - Impl (1.0.0)|1.0.0
 1127|Active     |   10|Liferay Blogs Editor Configuration (4.0.8)|4.0.8
 1128|Active     |   15|Liferay Blogs Item Selector Web (5.0.9)|5.0.9
 1129|Active     |   10|Liferay Blogs Layout Prototype (5.0.8)|5.0.8
 1130|Active     |   10|Liferay Blogs Reading Time (3.0.11)|3.0.11
 1131|Active     |   15|Liferay Blogs Recent Bloggers Web (5.0.11)|5.0.11
 1132|Active     |   10|Liferay Blogs Service (4.0.24)|4.0.24
 1133|Active     |   10|Liferay Blogs UAD (5.0.6)|5.0.6
 1134|Active     |   15|Liferay Blogs Web (5.0.36)|5.0.36
 true
 ```

모듈의 ID 번호를 기록해 둡니다. `headers` 명령을 사용하여 번들의 헤더 목록을 가져옵니다. 이 경우 Liferay 블로그 웹 모듈의 경우 1134입니다.

 ```
 g! headers 1134
 Output
 Bundle headers:
 Bnd-LastModified = 1601503219290
 Bundle-ManifestVersion = 2
 Bundle-Name = Liferay Blogs Web
 Bundle-SymbolicName = com.liferay.blogs.web
 Bundle-Vendor = Liferay, Inc.
 Bundle-Version = 5.0.36
 ...
 Web-ContextPath = /blogs-web
 ```

`Bundle-SymbolicName`, `Bundle-Version`및 `Web-ContextPath`에 유의하십시오. `/` 다음의 `Web-ContextPath` 값은 모듈의 컨텍스트 이름입니다.

모듈 고유의 언어 번역을 찾으려면 번들 기호 이름 또는 컨텍스트 이름을 사용하십시오. 모듈의 JAR 파일을 찾아 해당 언어 번역을 검사합니다. Liferay는 이 모듈 JAR 파일 명명 규칙을 따릅니다.

```
[bundle symbolic name]-[version].jar
```

예를 들어 블로그 웹 버전 5.0.36 모듈은 `com.liferay.blogs.web-5.0.36.jar`에 있습니다.

모듈을 찾을 수 있는 사이트는 다음과 같습니다.

* Liferay의 [넥서스 저장소](https://repository.liferay.com/nexus/content/repositories/liferay-public-releases/com/liferay/)
* `[Liferay Home]/osgi/modules`
* [`liferay-[dxp|portal]/modules/apps`](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps) 의 소스 코드.

언어 속성 파일은 모듈의 `src/main/resources/content` 폴더에 있습니다. `Language[xx_XX].properties` 파일에서 재정의할 언어 번역을 식별합니다.

다른 언어 및 로케일에 대한 언어 번역은 파일 이름 끝으로 식별할 수 있습니다. 예를 들어 `Language_ja.properties` 은 일본어용입니다.

예제는 기본 `블로그 항목 추가` 언어 번역을 사용자 정의 번역으로 변경합니다. 이제 배포할 시간입니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르십시오.

1. `liferay-e6u7.zip`을 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/liferay-internals/extending-liferay/liferay-e6u7.zip -O
    ```

    ```bash
    unzip liferay-e6u7.zip
    ```

1. 모듈 루트에서 빌드 및 배포합니다.

    ```bash
    cd liferay-e6u7
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.e6u7.impl_1.0.0 [1650]
    ```

1. **콘텐츠 & 데이터** &rarr; **블로그** 로 이동합니다. 추가 아이콘(![Add](../../images/icon-add.png)) 위로 커서를 이동합니다. 이제 메시지에 사용자 정의 언어 번역이 표시됩니다.

    ![현재 사용자 정의 언어 번역이 사용되고 있습니다.](./overriding-module-language-translations/images/01.png)

1. 튜토리얼 코드에는 다른 로케일에 대한 예제도 포함되어 있습니다. 예를 들어 언어 선택기를 사용하여 브라질 포르투갈어 또는 일본어를 선택하면 사용자 정의 언어 번역이 표시됩니다. 모듈은 모듈에 포함된 각 로캘에 대한 언어 번역을 재정의합니다.

    ![사용자 지정 언어 번역은 포르투갈어 및 일본어에도 사용됩니다.](./overriding-module-language-translations/images/02.png)

이제 코드가 어떻게 작동하는지 확인할 수 있습니다.

## 언어 속성 파일 만들기

먼저 재정의하려는 번역을 선택하십시오. 예를 들어 자습서 코드는 `블로그 항목 추가` 언어 번역을 재정의합니다.

재정의할 번역을 결정했으면 모듈의 `src/main/resources/content` 폴더에 언어 속성 파일을 만듭니다. 귀하의 파일에서 귀하의 방식으로 번역을 정의하십시오. 파일 이름이 재정의하려는 로케일과 일치하는지 확인하십시오. 예를 들어 일본어인 경우 `Language_ja.properties`사용합니다.

```{literalinclude} ./overriding-module-language-translations/resources/liferay-e6u7.zip/e6u7-impl/src/main/resources/content/Language_ja.properties
:language: properties
```

## 언어 리소스 번들 만들기

모듈에서 재정의하려는 로캘에 대해 `java.util.ResourceBundle` 확장하는 클래스를 만듭니다. 다음은 `en_US` 로케일에 대한 예제 리소스 번들 클래스입니다.

```{literalinclude} ./overriding-module-language-translations/resources/liferay-e6u7.zip/e6u7-impl/src/main/java/com/acme/e6u7/internal/language/E6U7EnglishResourceBundle.java
:language: java
:lines: 10-26
```

클래스의 `_resourceBundle` 필드에는 `ResourceBundle`이 할당됩니다. `ResourceBundle.getBundle` 에 대한 호출에는 두 개의 매개변수가 필요합니다. `content.Language_en_US` 매개변수는 모듈의 `src/main/resources/content` 폴더와 관련된 언어 파일의 정규화된 이름입니다. 두 번째 매개변수는 리소스 번들의 언어 구문을 설정하는 `컨트롤` 입니다. Liferay의 구문과 동일한 언어 구문을 사용하려면 Liferay의 `com.liferay.portal.kernel.language.UTF8Control` 클래스를 가져오고 두 번째 매개변수를 `UTF8Control.INSTANCE`으로 설정합니다.

클래스의 `@Component` 주석은 이를 OSGi `ResourceBundle` 서비스 구성요소로 선언합니다. `language.id` 속성은 `en_US` 로케일을 지정합니다.

```{literalinclude} ./overriding-module-language-translations/resources/liferay-e6u7.zip/e6u7-impl/src/main/java/com/acme/e6u7/internal/language/E6U7EnglishResourceBundle.java
:language: java
:lines: 10
```

이 클래스는 다음 메서드를 재정의합니다.

**`handleGetObject`:** 모듈의 리소스 번들(모듈의 언어 속성 파일을 기반으로 함)에서 번역을 조회하고 키 값을 `Object`로 반환합니다.

**`getKeys`:** 리소스 번들 키의 `열거형` 반환합니다.

리소스 번들 서비스 구성 요소는 기본 언어 번역을 모듈의 언어 번역 재정의로 리디렉션합니다.

**참고:** 여러 로케일에 대한 모듈 언어 번역 재정의에는 각 로케일에 대해 별도의 리소스 번들 클래스가 필요합니다. 예를 들어 자습서 코드에는 영어, 일본어 및 포르투갈어용 코드가 있습니다. 각 리소스 번들은 `language.id` 구성 요소 속성 정의 및 언어 파일 정규화된 이름 매개 변수에서 해당 로케일을 지정해야 합니다. 예를 들어 일본어 로케일의 경우 다음과 같습니다.

구성 요소 정의:

```{literalinclude} ./overriding-module-language-translations/resources/liferay-e6u7.zip/e6u7-impl/src/main/java/com/acme/e6u7/internal/language/E6U7JapaneseResourceBundle.java
:language: java
:lines: 10
```

리소스 번들 할당:

```{literalinclude} ./overriding-module-language-translations/resources/liferay-e6u7.zip/e6u7-impl/src/main/java/com/acme/e6u7/internal/language/E6U7JapaneseResourceBundle.java
:dedent: 1
:language: java
:lines: 23-24
```

## 모듈의 리소스 번들 우선 순위 지정

대상 모듈이 사용자 정의 언어 번역을 사용하려면 OSGI 매니페스트 헤더에 리소스 번들을 지정해야 합니다. 대상 모듈 리소스 번들보다 리소스 번들의 우선 순위를 지정하려면 모듈을 먼저 나열하십시오. 이렇게 하면 두 리소스가 함께 집계됩니다. 다음은 대상 모듈 `com.liferay.blogs.web`의 리소스 번들보다 리소스 번들의 우선 순위를 지정하는 자습서 모듈 `com.acme.e6u7.impl` 의 예입니다.

```{literalinclude} ./overriding-module-language-translations/resources/liferay-e6u7.zip/e6u7-impl/bnd.bnd
:language: properties
:lines: 4-12
```

예제 `Provide-Capability` 헤더에는 두 부분이 있습니다.

1.  `liferay.resource.bundle;resource.bundle.base.name="content.Language"` 모듈이 기본 이름이 `content.Language`인 리소스 번들을 제공한다고 선언합니다.

1. `liferay.resource.bundle;resource.bundle.aggregate:String=...` 지시문은 집계할 리소스 번들이 있는 번들 목록, 대상 번들, 대상 번들의 리소스 번들 이름 및 이 서비스의 순위를 지정합니다.

    * `"(bundle.symbolic.name=com.acme.e6u7.impl),(bundle.symbolic.name=com.liferay.blogs.web)"`: 서비스가 번들 `com.acme.e6u7에서 리소스 번들을 집계합니다. impl` 및 `com.liferay.blogs.web`. 원하는 만큼 번들을 집계합니다. 나열된 번들은 내림차순으로 우선순위가 지정됩니다.
    * `bundle.symbolic.name=com.liferay.blogs.web;resource.bundle.base.name="content.Language"`: `com.liferay.blogs.web` 번들의 리소스 번들 이름 `content.Language`재정의 .
    * `service.ranking:Long="2"`: 리소스 번들의 서비스 순위는 `2`입니다. OSGi 프레임워크는 이 서비스가 `com.liferay.blogs.web`의 `content.Language` 리소스 번들을 대상으로 하는 다른 모든 리소스 번들 서비스를 능가하는 경우 이 서비스를 적용합니다.
    * `servlet.context.name=blogs-web`: 대상 리소스 번들은 서블릿 컨텍스트 `blogs-web`에 있습니다.

```{note}
재정의가 표시되지 않으면 [Gogo 셸](../fundamentals/using-the-gogo-shell.md)을 사용하여 경쟁 리소스 번들 서비스를 확인하세요. 다른 서비스가 귀하의 서비스보다 순위가 높을 수 있습니다. 예를 들어 집계에 `com.liferay.blogs.web`의 리소스 번들을 포함하는 경쟁 리소스 번들 서비스를 확인하려면 다음 Gogo 셸 명령을 실행합니다.

`services "(bundle.symbolic.name=com.liferay.blogs. 웹)"`
```

```{note}
언어 키 이름이 동일한 경우 DXP 7.4+에서 언어 번역 재정의를 계속 사용할 수 있습니다. [`/modules/apps/portal-language/portal-language-lang/src/main/resources/content/Language[_xx_XX].properties`](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-language/portal-language-lang/src/main/resources/content) 파일. 선택적으로 `ResourceBundle` 클래스를 제거하고 `bnd.bnd` 파일의 `Provide-Capability` 헤더를 [Overriding Global Language Translations](./overriding-global-language-translations.md#declare-the-oOverride-in-the-bnd-file) .
```

순위가 높은 리소스 묶음 집합 서비스에 대한 결과를 검색합니다.

## 관련 정보

* [전역 언어 번역 재정의](./overriding-global-language-translations.md)
* [언어 번역 변경](../../system-administration/configuring-liferay/changing-language-translations.md)
