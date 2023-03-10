# 시스템 특성

Liferay DXP/Portal은 애플리케이션 서버의 JVM에서 실행됩니다. 시스템 속성은 `-D[name1]=[value1]` 형식의 `java` 에 대한 인수로 JVM에 직접 전달되거나 DXP 시스템 속성 파일을 사용하여 로드될 수 있습니다. 시스템 특성은 애플리케이션 서버 및 모든 해당 애플리케이션에서 사용할 수 있기 때문에 [포털 특성](./portal-properties.md) 과 다릅니다.

응용 프로그램 서버의 규정된 스크립트는 시스템 속성을 추가/수정하기에 가장 안전한 장소입니다. 시스템 속성을 중앙 집중화하는 데 사용할 수 있습니다. 모든 속성을 JVM 인수로 전달하면 애플리케이션 서버 시작 시 모든 속성을 설정하여 타이밍 문제가 제거됩니다. 애플리케이션 서버, DXP 및 기타 모든 웹 애플리케이션은 속성을 즉시 사용할 수 있습니다.

그러나 DXP는 필요한 속성을 설정하는 데 편의를 위해 [`portal-impl.jar/system.properties`](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/system.properties.html) 파일을 사용합니다. `system.properties` 파일은 `system-ext.properties` 파일을 사용하여 확장하거나 재정의할 수 있습니다. 시스템 특성 파일은 애플리케이션 서버 시작 후 포털 애플리케이션 클래스 로더에 의해 로드됩니다. 다음은 DXP가 시스템 속성을 사용하여 구성하는 몇 가지 기능입니다.

* 파일 인코딩
* 벌채 반출
* 기본 XML 파서 구성
* JAXB 컨텍스트 팩토리
* JRuby 네이티브 확장 활성화

DXP는 다음과 같은 방식으로 시스템 속성 파일을 사용합니다.

* DXP **은 시스템 속성 `system.properties.set` 이 `false`가 아닌 한 `system.properties` (및 `system-ext.properties`)의 새 속성을 사용하여** 속성을 확장합니다.
* DXP **은 시스템 속성 `system.properties.set.override` 이 `false`가 아닌 한 `system.properties` (및 `system-ext.properties`)의 새 값을 사용하여** 속성을 재정의합니다.

```{warning}
응용 프로그램 서버 시작 후 시스템 속성 설정 또는 재설정에는 위험이 있습니다.

* 응용 프로그램 서버에서 권한이 활성화된 경우 시스템 값 변경을 금지할 수 있습니다.
* 시스템 속성은 변경할 수 없는 것으로 취급됩니다. 응용 프로그램 서버의 다른 프로세스는 DXP가 값을 재설정하기 전에 초기 속성 값을 캐시할 수 있습니다. 이 경우 시스템은 동일한 속성에 대해 다른 값으로 작동하려고 시도합니다.
```

다음은 시스템 속성을 지정하는 두 가지 방법을 보여줍니다.

* [시스템 속성 직접 설정](#setting-system-properties-directly)
* [`system-ext.properties` 파일 사용](#using-a-system-ext-properties-file)

## 시스템 속성 직접 설정

시스템 속성을 설정하기 위한 응용 프로그램 서버의 규정된 스크립트는 속성을 추가하고 수정하기 위해 권장되는 사이트입니다.

1. 애플리케이션 서버 스크립트에서 다음 시스템 속성을 JVM 인수로 설정하여 `system.properties` 및 `system-ext.properties` 파일 사용을 비활성화합니다.

    ```
    -Dsystem.properties.set=false -Dsystem.properties.set.override=false
    ```

1. 다음 형식을 사용하여 각각의 새 속성을 JVM 인수로 추가합니다.

    ```
    -D[name]=[value]
    ```

1. 기존 속성을 수정합니다.

1. 애플리케이션 서버를 다시 시작하십시오.

애플리케이션 서버와 DXP는 새로운 시스템 속성을 사용하고 있습니다.

## `system-ext.properties` 파일 사용

DXP의 `system.properties` 파일을 사용하고 시스템 속성을 확장/재정의하려면 `system-ext.properties` 파일을 사용하십시오. 단계는 다음과 같습니다.

1. 애플리케이션 서버를 중지하십시오.

1. `system-ext.properties`이라는 파일에 속성을 추가합니다.

1. `system-ext.properties` 파일을 DXP의 클래스 경로에 추가합니다. DXP의 `WEB-INF/classes` 폴더가 클래스 경로에 있으므로 해당 폴더에 `system-ext.properties` 파일을 추가할 수 있습니다. 다음 두 가지 방법으로 추가할 수 있습니다.

    DXP가 확장된 웹 응용 프로그램으로 응용 프로그램 서버에 설치되는 경우 DXP 응용 프로그램의 `WEB-INF/classes` 폴더에 `system-ext.properties` 을 추가합니다.

    DXP가 애플리케이션 서버에 WAR 파일로 설치되는 경우 WAR 파일 내용을 추출하고 `system-ext.properties` 파일을 `WEB-INF/classes` 폴더에 추가합니다. 그런 다음 내용을 WAR 파일로 다시 패키지하십시오.

1. 애플리케이션 서버를 시작하십시오.

1. DXP 웹 애플리케이션을 배포합니다. 자세한 내용은 [응용 프로그램 서버에 설치](../installing-liferay/installing-liferay-on-an-application-server.md) 지침을 참조하십시오.
   
   Liferay DXP는 시스템 속성을 유연한 방식으로 처리하므로 시스템을 가장 적합하게 구성할 수 있습니다.

## 추가 정보

* [문맥 재산](./portal-properties.md)