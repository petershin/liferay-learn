# 전역 언어 번역 재정의

Liferay DXP/Portal은 언어 번역을 사용하여 기본 로케일 및 기타 여러 로케일에 대한 제목, 레이블 및 메시지를 구현합니다. 모듈의 새 언어 번역 값을 사용하여 모든 로캘에 대해 이러한 번역을 재정의할 수 있습니다.

!!! note
   [Language Override 도구](../../system-administration/configuring-liferay/ changing-translations-with-language-override.md)는 언어 번역을 재정의하는 데 권장되는 접근 방식입니다. 이 도구는 Liferay DXP 7.4 U4(업데이트 4) 이상 또는 Liferay Portal 7.4 GA8 이상에서 사용할 수 있습니다. 이전 방법에 대해 계속 읽으십시오.

## 글로벌 언어 번역 검토

글로벌 언어 번역은 소스 코드와 [DXP/Portal 번들](../../installation-and-upgrades/installing-liferay.md)에 있습니다.

소스에서:

- [`liferay-[dxp|portal]/portal-impl/src/content/Language [_xx_XX].properties`](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-impl/src/content)
- [`liferay-[dxp|portal]/modules/apps/portal-language/portal-language-lang/src/main/resources/content/Language [_xx_XX].properties`](https://github.com/liferay/liferay-portal/tree/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/portal-language/portal-language-lang/src/main/resources/content)

번들:

- `portal-impl.jar#content/Language[_xx_XX].properties`
- `Liferay Foundation - Liferay Portal Language - Impl.lpkg` &rarr; `com.liferay.portal.language.lang-[version].jar#content/Language[_xx_XX].properties`

다른 언어 및 로케일에 대한 언어 번역은 파일 이름 끝으로 식별할 수 있습니다. 예를 들어 `Language_ja.properties` 은 일본어용입니다.

이러한 언어 번역 파일에는 언어 설정 속성과 같이 재정의할 수 있는 속성이 포함되어 있습니다.

```properties
...
lang.user.name.field.names=prefix,first-name,middle-name,last-name,suffix
lang.user.name.prefix.values=Dr,Mr,Ms,Mrs
lang.user.name.required.field.names=last-name
lang.user.name.suffix.values=II,III,IV,Jr,Phd,Sr
...
```

메시지 및 레이블에 대해 재정의할 수 있는 간단한 번역도 많이 있습니다.

```properties
category.admin=Admin
category.alfresco=Alfresco
category.christianity=Christianity
category.cms=Content Management
...
```

## 프로그래밍 방식으로 언어 번역 재정의

Liferay DXP/Portal 7.4+에서는 메타데이터를 사용하여 재정의를 선언할 수 있습니다. 이전 버전에서는 Java 클래스가 재정의를 선언합니다.

버전이 7.4 이전인 경우 [이전 버전에서 재정의](#overriding-in-earlier-versions) 로 건너뜁니다. 그렇지 않으면 계속 읽으십시오.

## 7.4+용 예제 배포

이 예는 `홈` 언어 번역 설정을 다음과 같이 변경합니다.

```{literalinclude} ./overriding-global-language-translations-with-language-properties/resources/liferay-i2f4.zip/i2f4-impl/src/main/resources/content/Language_en_US.properties
:language: properties
```

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 예제를 배포합니다.

1. `liferay-i2f4.zip` 예제 프로젝트를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/liferay-internals/extending-liferay/liferay-i2f4.zip -O
   ```

   ```bash
   unzip liferay-i2f4.zip
   ```

1. 프로젝트 모듈을 빌드하고 배포합니다.

   ```bash
   cd liferay-i2f4
   ```

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   !!! note
      이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

   ```bash
   STARTED com.acme.i2f4.impl_1.0.0 [3209]
   ```

1. 예제 모듈의 사용자 정의를 확인하십시오. 브라우저에서 `https://localhost:8080`로 엽니다.

1. 메뉴 아이콘(![Menu](../../images/icon-menu.png))을 클릭합니다. 홈 아이콘 레이블은 사용자 정의 언어 번역 값을 사용합니다.

   ![홈 아이콘은 이제 사용자 정의 언어 번역 값을 사용합니다.](./overriding-global-language-translations-with-language-properties/images/04.png)

1. 이 예에는 여러 로케일에 대한 사용자 정의 언어 번역 값이 포함되어 있습니다. 예를 들어 언어 선택기를 사용하여 포르투갈어(브라질) 또는 일본어를 선택하면 해당 로케일의 사용자 정의를 볼 수 있습니다. 모듈은 이러한 로케일에 대한 언어 번역도 재정의합니다.

   ![사용자 지정 언어 번역은 브라질 포르투갈어 및 일본어에도 사용됩니다.](./overriding-global-language-translations-with-language-properties/images/05.png)

이제 예제를 보았으므로 작동 방식은 다음과 같습니다.

## 언어 속성 파일 만들기

재정의할 번역을 선택합니다. 예제 모듈은 `홈` 언어 번역을 재정의합니다.

```{literalinclude} ./overriding-global-language-translations-with-language-properties/resources/liferay-i2f4.zip/i2f4-impl/src/main/resources/content/Language_en_US.properties
   :language: properties
```

!!! important
   선언하는 언어 번역 값은 기존 번역 값을 재정의합니다. 다른 모든 기존 언어 번역 설정은 유지됩니다.

재정의할 번역을 결정했으면 모듈의 `src/main/resources/content` 폴더에 언어 속성 파일을 만듭니다. 파일 이름 `Language.properties` 사용하여 기본 로케일의 언어 번역을 대체하십시오. 특정 로케일의 번역을 재정의하려면 언어 속성 파일 명명 규칙을 사용하십시오.

```
Language[_xx_XX].properties
```

예를 들어 일본어를 재정의하는 경우 `Language_ja.properties`사용합니다.

## Bnd 파일에서 재정의 선언

모듈의 `bnd.bnd` 파일에서 언어 리소스 공급자 기능을 지정합니다. 다음은 예제의 `Provide-Capability` 헤더입니다.

```{literalinclude} ./overriding-global-language-translations-with-language-properties/resources/liferay-i2f4.zip/i2f4-impl/bnd.bnd
   :lines: 4-6
```

```{note}
예제는 서비스 순위를 생략합니다---기본 글로벌 리소스 번들 서비스 순위 `-1`보다 높은 OSGi의 기본 순위 `0`을 사용합니다.
```

전역 언어 번역 재정의는 동일한 모듈에 있을 때 가장 쉽게 관리할 수 있습니다.

여러 모듈을 사용하여 전역 언어 번역을 재정의하는 것은 권장하지 않지만 여러 모듈에서 동일한 번역을 재정의하면 서비스 순위가 가장 높은 언어 리소스 공급자가 우선합니다.

예를 들어 모듈의 언어 번역이 서비스 순위가 `1`인 공급자의 번역보다 우선하도록 하려면 순위를 `2` 이상으로 설정합니다.

```properties
Provide-Capability:\
    liferay.language.resources;\
        resource.bundle.base.name="content.Language";\
        service.ranking:Long="2"
```

새 언어 번역 값을 보려면 모듈을 배포하십시오.

## 이전 버전에서 재정의

7.4 이전의 Liferay DXP/Portal 버전에서 전역 언어 번역을 재정의하려면 사용자 지정되는 각 번역에 대해 [언어 속성 파일](#create-a-language-properties-file) 과 `java.util.ResourceBundle` 필요합니다. 다음 예제를 배포하고 해당 코드를 검토하여 자세히 알아보세요.

!!! note
   많은 언어 번역이 전역 언어 번역 파일에 있지만 일부는 특정 응용 프로그램 모듈에 있을 수 있습니다. [이전 버전에서 모듈 언어 번역 재정의](./overriding-module-language-translations.md) 프로세스는 전역 번역 재정의와 다릅니다.

### 이전 버전에 대한 예제 배포

이 예는 `게시` 언어 번역 설정을 다음과 같이 변경합니다.

```{literalinclude} ./overriding-global-language-translations-with-language-properties/resources/liferay-x8f3.zip/x8f3-impl/src/main/resources/content/Language_en_US.properties
   :language: properties
```

예제를 배포하는 방법은 다음과 같습니다.

1. `liferay-x8f3.zip` 예제 프로젝트를 다운로드하고 압축을 풉니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/liferay-internals/extending-liferay/liferay-x8f3.zip -O
   ```

   ```bash
   unzip liferay-x8f3.zip
   ```

1. 프로젝트 모듈을 빌드하고 배포합니다.

   ```bash
   cd liferay-x8f3
   ```

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

   ```bash
   STARTED com.acme.x8f3.impl_1.0.0 [3209]
   ```

1. 브라우저를 `https://localhost:8080` 로 열고 로그인합니다.

1. 사이트 페이지로 이동하고 수정 아이콘(![Edit](../../images/icon-edit.png))을 클릭합니다. 게시 버튼은 사용자 정의 언어 번역을 보여줍니다.

   ![게시 버튼은 이제 사용자 정의 언어 번역을 사용합니다.](./overriding-global-language-translations-with-language-properties/images/06.png)

1. 사용자 정의 언어 번역을 보려면 언어 선택기를 사용하여 브라질 포르투갈어 또는 일본어를 선택하십시오. 모듈은 모듈에 포함된 각 로캘에 대한 언어 번역을 재정의합니다.

   ![사용자 지정 언어 번역은 브라질 포르투갈어 및 일본어에도 사용됩니다.](./overriding-global-language-translations-with-language-properties/images/07.png)

7.4+ 예제와 마찬가지로 이 모듈은 언어 번역 파일에서 사용자 정의 값을 지정합니다. 그러나 재정의를 선언하기 위해 메타데이터( `bnd.bnd` 파일 헤더)를 사용하는 대신 모듈은 `ResourceBundle` 클래스를 사용합니다.

### 리소스 번들 클래스 만들기

재정의하는 각 로케일에는 `java.util.ResourceBundle`을 확장하는 클래스가 필요합니다. 다음은 `en_US` 로케일에 대한 예제 리소스 번들 클래스입니다.

```{literalinclude} ./overriding-global-language-translations-with-language-properties/resources/liferay-x8f3.zip/x8f3-impl/src/main/java/com/acme/x8f3/internal/language/X8F3EnglishResourceBundle.java
   :language: java
   :lines: 10-26
```

클래스의 `_resourceBundle` 필드에는 `ResourceBundle`이 할당됩니다. `ResourceBundle.getBundle` 에 대한 호출에는 두 개의 매개변수가 필요합니다. `content.Language_en_US` 매개변수는 모듈의 `src/main/resources/content` 폴더와 관련된 언어 파일의 정규화된 이름입니다. 두 번째 매개변수는 리소스 번들의 언어 구문을 설정하는 `컨트롤` 입니다. Liferay의 구문과 동일한 언어 구문을 사용하려면 Liferay의 `com.liferay.portal.kernel.language.UTF8Control` 클래스를 가져오고 두 번째 매개변수를 `UTF8Control.INSTANCE`으로 설정합니다.

클래스의 `@Component` 주석은 이를 OSGi `ResourceBundle` 서비스 구성요소로 선언합니다. `language.id` 속성은 `en_US` 로케일을 지정합니다.

```{literalinclude} ./overriding-global-language-translations-with-language-properties/resources/liferay-x8f3.zip/x8f3-impl/src/main/java/com/acme/x8f3/internal/language/X8F3EnglishResourceBundle.java
   :language: java
   :lines: 10
```

이 클래스는 다음 메서드를 재정의합니다.

**`handleGetObject`:** 모듈의 리소스 번들(모듈의 언어 속성 파일을 기반으로 함)에서 번역을 조회하고 키 값을 `Object`로 반환합니다.

**`getKeys`:** 리소스 번들 키의 `열거형` 반환합니다.

리소스 번들 서비스 구성 요소는 기본 언어 번역을 모듈의 언어 번역 재정의로 리디렉션합니다.

여러 로케일에 대한 전역 언어 번역 재정의에는 각 로케일에 대해 별도의 리소스 번들 클래스가 필요합니다. 예를 들어 자습서 코드에는 브라질 포르투갈어, 영어 및 일본어용 코드가 있습니다. 각 리소스 번들은 `language.id` 구성 요소 속성 정의 및 언어 파일 정규화된 이름 매개 변수에서 해당 로케일을 지정해야 합니다. 예를 들어 일본어 로케일의 경우 다음과 같습니다.

구성 요소 정의:

```{literalinclude} ./overriding-global-language-translations-with-language-properties/resources/liferay-x8f3.zip/x8f3-impl/src/main/java/com/acme/x8f3/internal/language/X8F3JapaneseResourceBundle.java
   :language: java
   :lines: 10
```

리소스 번들 할당:

```{literalinclude} ./overriding-global-language-translations-with-language-properties/resources/liferay-x8f3.zip/x8f3-impl/src/main/java/com/acme/x8f3/internal/language/X8F3JapaneseResourceBundle.java
   :dedent: 1
   :language: java
   :lines: 23-24
```

새 언어 번역 값을 보려면 모듈을 배포하십시오.

!!! note
   DXP 7.4+로 업그레이드할 준비가 되면 언어 번역 재정의 모듈을 계속 사용할 수 있습니다. 선택적으로 `ResourceBundle` 클래스를 제거하고 `bnd.bnd` 파일의 `Provide-Capability` 헤더를 설명 [above](#declare-the-override-in-the-bnd-file) 으로 지정하여 모듈을 단순화할 수 있습니다.

## 관련 정보

- [이전 버전에서 모듈 언어 번역 재정의](./overriding-module-language-translations.md)
- [언어 번역 변경](../../system-administration/configuring-liferay/changing-translations-with-language-override.md)