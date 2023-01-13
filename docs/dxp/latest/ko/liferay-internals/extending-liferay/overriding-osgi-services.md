# OSGi 서비스 재정의

Liferay의 OSGi 컨테이너는 필요에 따라 서비스를 추가, 제거 또는 재정의할 수 있는 동적 환경입니다. 이 프레임워크는 OSGi 서비스 레지스트리에 Liferay 구성 요소를 등록하며 각각 고유한 가용성, 순위 및 속성을 가지고 있습니다. 함께 이러한 세부 정보는 구성 요소가 참조하는 서비스에 바인딩되는 방식을 결정합니다.

OSGi 서비스를 재정의하려면 다음 단계를 따르세요.

1. 재정의할 서비스와 이를 참조하는 모든 구성 요소를 식별합니다.

1. 다음 서비스 세부 정보를 수집합니다.

   * **서비스 유형**: 재정의 중인 서비스에 의해 구현된 인터페이스

   * **서비스의 클래스 이름**: 기존 서비스의 전체 이름

1. 해당하는 경우 서비스를 참조하는 구성 요소에 대한 다음 세부 정보를 수집합니다.

   * **구성 요소 이름**: 재정의 중인 서비스를 참조하는 구성 요소의 전체 이름

   * **참조 이름**: 대상 서비스를 참조하는 필드 이름

   * **참조 정책**: 참조 여부 `정적` 또는 `동적`

   * **참조 정책-옵션**: `정책-옵션` 이 `욕심` 또는 `꺼림`

   * **Cardinality**: 참조가 바인딩할 수 있고 바인딩해야 하는 서비스 인스턴스의 수

   서비스의 [참조 정책](https://docs.osgi.org/javadoc/r5/enterprise/org/osgi/service/component/annotations/ReferencePolicy.html), [참조 정책 옵션](https://docs.osgi.org/javadoc/r5/enterprise/org/osgi/service/component/annotations/ReferencePolicyOption.html)및 [카디널리티](https://docs.osgi.org/javadoc/r5/enterprise/org/osgi/service/component/annotations/ReferenceCardinality.html) 는 새 서비스를 채택하기 위한 구성 요소의 조건을 함께 결정합니다.

1. 재정의 중인 서비스에서 구현한 것과 동일한 인터페이스를 사용하는 새 서비스를 만듭니다.

1. 서비스가 재정의하는 서비스보다 더 높은 순위를 부여하십시오.

1. (선택 사항) 필요한 경우 서비스에서 재정의하려는 서비스를 참조하고 호출합니다.

샘플 모듈은 OSGi 서비스를 재정의하는 방법을 보여줍니다. 이러한 모듈에는 새로운 OSGi 서비스 유형을 정의하기 위한 API, 해당 유형의 초기 구현 및 초기 구현을 참조하는 일반 포틀릿이 포함됩니다. 또한 초기 구현을 재정의하는 방법을 보여주는 API의 대체 구현도 포함되어 있습니다.

## 재정의를 위한 샘플 모듈 배포
```{include} /_snippets/run-liferay-portal.md
```

Then, follow these steps:

1. Download and unzip the example modules.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/liferay-internals/extending-liferay/liferay-s1j6.zip -O
   ```

   ```bash
   unzip liferay-s1j6.zip
   ```

1. `s1j6-api`, `s1j6-able-impl`및 `s1j6-web` 하위 폴더에서 다음 `gradlew` 명령을 실행하여 각 모듈을 새 Docker 컨테이너에 개별적으로 빌드하고 배포합니다.

   ```bash
   ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   각 모듈의 JAR은 `build/libs` 폴더(예: `s1j6-api/build/libs/com.acme.s1j6.api-1.0.0.jar`)에 생성됩니다.

   로그 메시지는 Liferay가 처리를 시작하고 각 모듈을 성공적으로 시작할 때를 나타냅니다. 이러한 로그는 각 서비스의 번들 ID도 제공합니다.

   ```bash
   STARTED com.acme.s1j6.api_1.0.0 [1356]
   STARTED com.acme.s1j6.able.impl_1.0.0 [1357]
   STARTED com.acme.s1j6.web_1.0.0 [1358]
   ```

1. Gogo Shell을 통해 모듈이 성공적으로 배포되었는지 확인합니다.

   ```shell
   lb | grep -i "s1j6"
   ```

   성공하면 출력은 다음과 같습니다.

   ```shell
   1356|Active     |   15|Acme S1J6 API (1.0.0)|1.0.0
   1357|Active     |   15|Acme S1J6 Able Implementation (1.0.0)|1.0.0
   1358|Active     |   15|Acme S1J6 Web (1.0.0)|1.0.0
   true
   ```

제공된 `api` 은 제공된 `포틀릿`</code>`의해 구현되는 OSGi 서비스 유형을 정의합니다. 이제 모든 것이 배포되었으므로 재정의 작동 방식을 실험할 수 있습니다.</p>

<h2 spaces-before="0">OSGi 서비스 및 참조 세부 정보 수집</h2>

<p spaces-before="0">재정의하려는 서비스를 식별했으면 <code>scr:info` Gogo Shell 명령을 사용하여 필수 서비스 및 참조 세부 정보를 수집합니다. 이 예에서는</code> `를 재정의하려고 합니다.</p>

<p spaces-before="0">서비스 세부 정보를 수집하려면 다음 명령을 실행합니다.</p>

<pre><code class="shell">scr:info com.acme.s1j6.able.internal.S1J6AbleImpl
`</pre>

```shell
Component Description: com.acme.s1j6.able.internal.S1J6AbleImpl
===============================================================
Class:         com.acme.s1j6.able.internal.S1J6AbleImpl
Bundle:        1357 (com.acme.s1j6.able.impl:1.0.0)
[...]

Component Configuration Id: 8337
--------------------------------
State:        ACTIVE
Service:      17776 [com.acme.s1j6.S1J6]
    Used by bundle 1358 (com.acme.s1j6.web:1.0.0)
Config Props: (2 entries)
  component.id = 8337
  component.name = com.acme.s1j6.able.internal.S1J6AbleImpl
References:   (total 0)
```

이 축약된 출력은 `S1J6AbleImpl`에 대한 다음 서비스 세부 정보를 나열합니다.

* **서비스 유형**: `S1J6AbleImpl` 구현 `S1J6` 인터페이스,`com.acme.s1j6.S1J6`.

* **서비스의 클래스 이름**: 서비스의 전체 이름은 `com.acme.s1j6.able.internal.S1J6AbleImpl`입니다.

또한 서비스가 `com.acme.s1j6.web:1.0.0` 번들 내의 구성 요소에서 사용됨을 나타냅니다. 구성 요소의 참조 구성 세부 정보를 보려면 구성 요소의 전체 이름과 함께 `scr:info` 명령을 실행합니다.

```shell
scr:info com.acme.s1j6.web.internal.portlet.S1J6Portlet
```

```shell
Component Description: com.acme.s1j6.web.internal.portlet.S1J6Portlet
=====================================================================
Class:         com.acme.s1j6.web.internal.portlet.S1J6Portlet
Bundle:        1358 (com.acme.s1j6.web:1.0.0)
[...]

Component Configuration Id: 8338
--------------------------------
[...]
References:   (total 1)
  - _s1j6: com.acme.s1j6.S1J6 SATISFIED 1..1 static+greedy
    target=(*) scope=bundle (1 binding):
    * Bound to [17776] from bundle 1357 (com.acme.s1j6.able.impl:1.0.0)
```

이 축약된 출력에는 다음과 같은 참조 구성 세부 정보가 나열됩니다.

**Reference Name**: `S1J6AbleImpl` 서비스를 참조하는 필드의 이름은 `_s1j6`입니다.

**참조 정책**: 구성 요소의 정책은 `정적` (기본값)입니다.

**참조 정책-옵션**: 구성 요소의 정책 옵션은 `greedy`입니다.

**카디널리티**: 해당 카디널리티는 필수 및 단항입니다(예: `1..1`).

일부 참조 구성은 새롭거나 더 높은 순위의 서비스에 자동으로 바인딩되지만 일부는 서버를 다시 시작해야 합니다. `S1J6Portlet`의 참조 구성은 정적이고 탐욕적이며 필수적이고 단항이므로 새로운 상위 서비스에 바인딩하기 전에 서버를 다시 시작할 필요가 없습니다. 새롭거나 더 높은 순위의 서비스를 사용할 수 있을 때 다양한 참조 구성이 구성 요소의 동작에 미치는 영향에 대한 자세한 내용은 [OSGi 설명서](http://docs.osgi.org/specification/osgi.cmpn/7.0.0/service.component.html#service.component-policy.option.action) 을 참조하십시오.

## 수집된 세부 정보로 OSGi 서비스 만들기

필수 서비스 및 참조 세부 정보를 수집한 후에는 이를 사용하여 대상 서비스를 재정의하고 호출하기 위한 사용자 지정 서비스를 만들 수 있습니다.

1. `@Component` 어노테이션을 사용하여 서비스를 OSGi 프레임워크 내의 컴포넌트로 선언하십시오.

1. 대상 OSGi 서비스와 동일한 인터페이스를 구현하고 `@Component` 주석 내에서 `서비스` 유형을 식별합니다.

1. 인터페이스의 메서드를 재정의합니다.

1. `@Component` 주석 내에 `service.ranking:Integer` 속성을 포함합니다. 순위가 기존 서비스보다 높은지 확인합니다.

1. (선택 사항) 기존 서비스의 `component.name` 을 참조하여 호출합니다.

샘플 `S1J6BakerImpl` 모듈은 `S1J6AbleImpl`을 재정의하기 위해 제공됩니다.

```{literalinclude} overriding-osgi-services/resources/liferay-s1j6.zip/s1j6-baker-impl/src/main/java/com/acme/s1j6/baker/internal/S1J6BakerImpl.java
   :language: java
   :lines: 8-22
```

여기서 `S1J6BakerImpl` 은 `S1J6AbleImpl` (즉, `com.acme.s1j6.S1J6`)과 동일한 서비스 유형을 구현하고 필요한 `@Component` 주석, `서비스` 속성 및 `service.ranking` 속성을 포함합니다. 또한 기존 서비스(예: `component.name=com.acme.s1j6.able.internal.S1J6AbleImpl`)를 참조하고 인터페이스 메서드 재정의의 일부로 위임합니다. 샘플 모듈에는 `S1J6AbleImpl` 및 `S1J6BakerImpl`을 재정의하기 위한 두 개의 다른 S1J6 구현도 포함되어 있습니다.

전체적으로 포함된 구현의 순위는 다음과 같습니다.

* `S1J6AbleImpl`: 순위 없음(기본값은 0)
* `S1J6BakerImpl`: 100
* `S1J6CharlieImpl`: 101
* `S1J6DogImpl`: 101

배포되면 가장 높은 순위의 서비스가 우선 순위를 가지며 `S1J6Portlet`에 바인딩됩니다. 동일한 순위의 서비스가 여러 개일 경우 먼저 등록된 서비스가 우선합니다. 하위 순위 서비스는 무시됩니다.

## 재정의 모듈 및 구성 파일 배포

다음 단계에 따라 `S1J6BakerImpl`, `S1J6CharlieImpl`및 `S1J6DogImpl`를 배포합니다.

1. 콘솔에서 `s1j6-baker-impl` 폴더를 열고 다음 `gradlew` 명령을 실행하여 모듈용 JAR 파일을 빌드하고 Docker 컨테이너에 배포합니다.

   ```bash
   cd ../s1j6-baker-impl
   ```

   ```bash
   ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   로그 메시지는 Liferay가 처리를 시작하고 번들 ID와 함께 모듈을 성공적으로 시작한 시기를 나타냅니다.

   ```bash
   STARTED com.acme.s1j6.baker_1.0.0 [1359]
   ```

1. `S1J6BakerImpl` 이 Gogo Shell을 통해 인스턴스에 성공적으로 배포되고 바인딩되었는지 확인합니다.

   ```shell
   scr:info com.acme.s1j6.web.internal.portlet.S1J6Portlet
   ```

   성공하면 `S1J6Portlet` 은 `S1J6AbleImpl`보다 순위가 높기 때문에 `S1J6BakerImpl`에 바인딩됩니다.

   ```shell
   References:   (total 1)
     - _s1j6: com.acme.s1j6.S1J6 SATISFIED 1..1 static
       target=(*) scope=bundle (1 binding):
       * Bound to [3248] from bundle 1359 (com.acme.s1j6.baker.impl:1.0.0)
   ```

1. `S1J6CharlieImpl` 및 `S1J6DogImpl` 을 `s1j6-liferay`에서 Docker 컨테이너로 동시에 배포합니다.

   ```bash
   cd ..
   ```

   ```bash
   ../gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   ```bash
   STARTED com.acme.s1j6.charlie_1.0.0 [1360]
   STARTED com.acme.s1j6.dog_1.0.0 [1361]
   ```

1. `S1J6CharlieImpl` 및 `S1J6DogImpl` 이 모두 Gogo Shell을 통해 인스턴스에 성공적으로 배포되었는지 확인합니다.

   ```shell
   lb -s | grep -i "s1j6"
   ```

   ```shell
   1356|Active     |   15|com.acme.s1j6.api (1.0.0)|1.0.0
   1357|Active     |   15|com.acme.s1j6.able.impl (1.0.0)|1.0.0
   1358|Active     |   15|com.acme.s1j6.web (1.0.0)|1.0.0
   1359|Active     |   15|com.acme.s1j6.baker.impl (1.0.0)|1.0.0
   1360|Active     |   15|com.acme.s1j6.charlie.impl (1.0.0)|1.0.0
   1361|Active     |   15|com.acme.s1j6.dog.impl (1.0.0)|1.0.0
   ```

1. 어떤 서비스가 `S1J6Portlet`에 바인드되었는지 확인하십시오.

   ```shell
   scr:info com.acme.s1j6.web.internal.portlet.S1J6Portlet
   ```

   ```shell
   References:   (total 1)
     - _s1j6: com.acme.s1j6.S1J6 SATISFIED 1..1 static
       target=(*) scope=bundle (1 binding):
       * Bound to [3249] from bundle 1360 (com.acme.s1j6.charlie.impl:1.0.0)
   ```

   `S1J6CharlieImpl` 과 `S1J6DogImpl` 모두 동일한 순위를 가지므로 먼저 등록된 서비스가 우선 순위를 가지며 `S1J6Portlet`에 바인딩됩니다.

## 추가 정보

* [모듈 프로젝트](../fundamentals/module-projects.md)
* [OSGi 서비스 사용](../fundamentals/using-an-osgi-service.md)
* [OSGi 서비스로서의 API](../fundamentals/apis-as-osgi-services.md)
* [모듈 수명 주기](../architecture/module-lifecycle.md)
