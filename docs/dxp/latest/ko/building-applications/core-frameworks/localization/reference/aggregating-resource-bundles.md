# 리소스 번들 집계

지역화된 메시지를 공유하는 모듈로 작업할 때 bnd 헤더는 모듈과 연결하려는 리소스 번들을 지정해야 합니다. Liferay는 자원 번들을 집계하는 데 필요한 매개변수를 자동으로 지정하는 bnd 명령을 제공합니다.

1. `bnd.bnd` 파일을 엽니다.

1. `-liferay-aggregate-resource-bundles:` bnd 명령을 추가하고 리소스 번들을 현재 모듈과 통합하려는 모듈의 번들 기호 이름을 할당합니다.

    ```properties
    -liferay-aggregate-resource-bundles: \
        [bundle.symbolic.name1],\
        [bundle.symbolic.name2]
    ```

    예를 들어 모듈 `com.acme.able.impl` 및 `com.acme.baker.impl` 의 리소스 번들을 사용하는 모듈은 다음과 같이 구성됩니다.

    ```properties
    -liferay-aggregate-resource-bundles: \
        com.acme.able.impl,\
        com.acme.baker.impl
    ```

현재 모듈의 자원 번들은 나열된 모듈의 자원 번들이 우선합니다.

빌드 시 Liferay의 bnd 플러그인은 bnd 명령을 `Require-Capability` 및 `Provide-Capability` 매개변수로 자동 변환합니다.

```{note}
Liferay의 기본 모듈로 리소스를 집계하려면 매개변수를 수동으로 지정해야 합니다. 
```

## 참조

결과 OSGi 헤더는 jar 파일의 `MANIFEST.MF` 파일에서 찾을 수 있습니다. 예를 들어 모듈의 기호 이름이 `com.acme.web` 이고 `com.acme.able.impl` 및 `com.acme.baker.impl`의 리소스 번들을 사용하려는 경우 `Require-Capability` 은

```properties
Require-Capability: liferay.resource.bundle;filter:="(bundle.symbolic.name=com.acme.able.impl)",liferay.resource.bundle;filter:="(bundle.symbolic.name=com.acme.baker.impl)"
```

`제공 기능` 은 다음과 같습니다.

```properties
Provide-Capability:  liferay.resource.bundle;resource.bundle.base.name="content.Language"\
liferay.resource.bundle;resource.bundle.aggregate="(bundle.symbolic.name=com.acme.web),(bundle.symbolic.name=com.acme.able.impl),(bundle.symbolic.name=com.acme.baker.impl)";\
bundle.symbolic.name="com.acme.web";resource.bundle.base.name="content.Language";\
service.ranking=1,;servlet.context.name="com.acme.web"
```

예제 `Provide-Capability` 헤더에는 두 부분이 있습니다.

1. `liferay.resource.bundle;resource.bundle.base.name="content.Language"` 모듈이 기본 이름이 `content.language`인 리소스 번들을 제공한다고 선언합니다.

1. `liferay.resource.bundle;resource.bundle.aggregate=...` 지시문은 리소스 번들이 집계되는 번들 목록, 대상 번들, 대상 번들의 리소스 번들 이름 및 이 서비스의 순위를 지정합니다.

    * `"(bundle.symbolic.name=com.acme.web),(bundle.symbolic.name=com.acme.able.impl),(bundle.symbolic.name=com.acme.baker.impl)"`: 서비스는 번들 `bundle.symbolic.name=com.acme.web` (현재 모듈)과 `bundle.symbolic.name=com.acme.able.impl` 및 `bundle.symbolic.name=com에서 리소스 번들을 집계합니다. .acme.baker.impl`.

    원하는 만큼 번들을 집계합니다. 나열된 번들은 내림차순으로 우선순위가 지정됩니다.

    * `bundle.symbolic.name=com.acme.web;resource.bundle.base.name="content.Language"`: 이름이 `content.Language`인 `com.acme.web` 번들의 리소스 번들을 재정의합니다.

    * `service.ranking=1`: 리소스 번들의 서비스 순위는 `1`입니다. OSGi 프레임워크는 이 서비스가 `com.acme.web`의 `content.Language` 리소스 번들을 대상으로 하는 다른 모든 리소스 번들 서비스를 능가하는 경우 이 서비스를 적용합니다.

    * `servlet.context.name=com.acme.web`: 대상 리소스 번들은 서블릿 컨텍스트 `com.acme.web`에 있습니다.
