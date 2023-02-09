# REST 빌더로 API 생성 및 구현

REST Builder를 사용하면 빌드하려는 API를 정의할 수 있으며 REST Builder는 프레임워크와 엔드포인트를 제공합니다.

## 예제 REST API 배포

작동 중인 REST 빌더를 보려면 카탈로그에서 해당 ID로 더미 제품을 검색하는 예제 API를 배포할 수 있습니다. 이 간단한 예제의 작동 방식을 이해하면 자체 애플리케이션용 API를 생성할 수 있습니다.

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르세요.

1. [Acme Foo API](./liferay-r3b2.zip)가 포함된 `.zip` 아카이브를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/headless-delivery/apis-with-rest-builder/liferay-r3b2.zip -O
    ```

    ```bash
    unzip liferay-r3b2.zip
    ```

1. 예제 빌드 및 배포:

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 배포된 jar를 Docker 컨테이너의 /opt/liferay/osgi/modules에 복사하는 것과 동일합니다.
    ```

1. `api` 및 `impl` 번들 모두에 대해 Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```
    STARTED com.acme.headless.r3b2.api_1.0.0 
    STARTED com.acme.headless.r3b2.impl_1.0.0
    ```

1. DXP 인스턴스에 로그인하고 _전역 메뉴_ ( ![Global Menu icon](../../images/icon-applications-menu.png) ) &rarr; _제어판_ &rarr; _Gogo Shell로 이동합니다._

1. Gogo Shell 프롬프트에서 다음 명령을 입력합니다.

    ```
    jaxrs:check
    ```

    이 페이지에는 새로 배포된 API인 `Liferay.Headless.R3B2`을 포함하여 설치된 모든 JAX-RS 번들이 나열됩니다. 이제 API가 배포되었으며 호출할 준비가 되었습니다.

    ![새로 배포된 API(Liferay.Headless.R3B2)가 명령의 결과로 나열되고 사용할 준비가 되었습니다.](./producing-and-implementing-apis-with-rest-builder/images/01.png)

1. 터미널에서 다음 명령을 실행하고 `{fooId}`를 1에서 3 사이의 숫자로 대체하여 API를 테스트합니다.

    ```bash
    curl -u 'test@liferay.com:learn' "http://localhost:8080/o/headless-r3b2/v1.0/foo/{fooId}"
    ```

    쿼리는 JSON 개체에 래핑된 해당 제품의 ID, 이름 및 설명을 반환합니다.

    ```json
   {
     "description": "Universal truth must be transcendental.",
     "id": 1,
     "name": "Truth"
   }
    ```

축하합니다. 새 REST API를 성공적으로 배포하고 사용했습니다.

REST Builder로 생성된 API를 보았으므로 이제 작동 방식을 이해할 차례입니다.

## 초기 설정

Liferay 작업 공간 프로젝트에서 `impl` 및 `api` 모듈을 생성하여 시작하십시오. `impl` 모듈의 `build.gradle` 파일은 REST Builder를 플러그인으로 설치하고 적용해야 합니다.

```
buildscript {
    dependencies {
        classpath group: "com.liferay", name: "com.liferay.gradle.plugins.rest.builder", version: "1.1.32"
    }

    repositories {
        maven {
            url "https://repository-cdn.liferay.com/nexus/content/groups/public"
        }
    }
}

apply plugin: "com.liferay.portal.tools.rest.builder"

dependencies {
    compileOnly group: "com.liferay.portal", name: "release.portal.api"
    compileOnly project(":headless-r3b2-api")
}
```

두 모듈의 `build.gradle` 파일도 포털 릴리스에 대한 종속성을 선언해야 합니다.

## YAML 구성

첫 번째 단계는 REST Builder 구성 파일을 만드는 것입니다. `impl` 모듈의 루트 폴더에 두 개의 파일( `rest-config.yaml` 및 `rest-openapi.yaml`)을 추가합니다. 이러한 파일에는 REST Builder가 API에 대한 스캐폴딩 코드를 생성하는 데 필요한 모든 정보가 포함되어 있어야 합니다.

### REST 빌더 구성 추가

REST 빌더 구성은 `rest-config.yaml` 파일에 속합니다. 다음 필드를 정의합니다.

`apiDir`: Java 소스 코드 폴더

`apiPackagePath`: REST Builder가 모든 모듈에서 코드를 생성하는 시작 Java 패키지 경로

`baseURI`: 이 프로젝트의 모든 API에 대한 컨텍스트 URL

`className`: 루트 리소스 클래스의 Java 클래스 이름(JAX-RS에서 사용)

`name`: API의 JAX-RS 이름

이 구조를 사용하여 다음 필드를 정의합니다.

```yaml
apiDir: "../headless-r3b2-api/src/main/java"
apiPackagePath: "com.acme.headless.r3b2"
application:
    baseURI: "/headless-r3b2"
    className: "HeadlessR3B2Application"
    name: "Liferay.Headless.R3B2"
author: "Jonah the son of Amittai"
clientDir: "../headless-r3b2-client/src/main/java"
testDir: "../headless-r3b2-test/src/testIntegration/java"
```

### OpenAPI 구성에 정보 블록 추가

다음으로 `rest-openapi.yaml` 파일을 열어 API 구성을 시작합니다.

추가할 첫 번째 섹션은 정보 블록입니다.

```yaml
info:
    description:
        "API to return a Foo."
    license:
        name: "Apache 2.0"
        url: "http://www.apache.org/licenses/LICENSE-2.0.html"
    title: "Headless R3B2"
    version: v1.0
openapi: 3.0.1
```

```{important}
여기에 정의된 `version` 필드는 API 경로가 Liferay 인스턴스 내에서 노출될 때 URL의 일부가 됩니다.
```

### 필요한 스키마 정의

다음으로 `구성 요소` 블록에서 엔터티에 대한 스키마를 정의합니다. REST Builder는 여기에서 정의한 것을 사용하여 이러한 엔티티를 나타내는 해당 Java Bean을 작성합니다. <!-- Add reference to overview article elaborating a bit more on how REST Builder represents Java Objects with schemas. -->

표현하려는 각 엔터티에 대해 `스키마` 블록을 정의합니다.

```yaml
components:
    schemas:
        Foo:
            properties:
                description:
                    type: string
                id:
                    format: int64
                    type: integer
                name:
                    type: string
            type: object
        Goo:
            properties:
                description:
                    type: string
                fooId:
                    format: int64
                    type: integer
                id:
                    format: int64
                    type: integer
                name:
                    type: string
```

이 예제에서 `Foo` 이라는 스키마는 이 API를 사용하기 위한 중요한 데이터를 나타냅니다. `Goo` 엔티티는 `fooId`를 사용하여 `Foo` 에 연결됩니다.  스키마에 대해 지원되는 데이터 유형 목록은 [OpenAPI 사양](https://swagger.io/docs/specification/data-models/data-types/) 을 참조하십시오.

스키마 정의는 리소스 파일의 스캐폴딩 및 템플릿을 포함하여 REST Builder가 생성하는 클래스의 이름을 결정합니다. 위의 스키마는 `Foo` 및 `Bar`이라고 하므로 구현 논리는 `FooResourceImpl` 및 `GooResourceImpl` 클래스에 속합니다.

### API 정의

마지막으로 `paths` 블록을 추가합니다. 여기에는 REST 빌더로 구현하려는 모든 API가 포함되어야 합니다. 다음은 paths 블록의 작은 스니펫입니다.

```yaml

paths:
    "/foo":
        get:
        # operations for get and post go here. See the project for full source code.
        # ...

    "/foo/{fooId}":
        get:
            operationId: getFoo
            # ...

            responses:
                200:
                    content:
                        application/json:
                            schema:
                                $ref: "#/components/schemas/Foo"
                        application/xml:
                            schema:
                                $ref: "#/components/schemas/Foo"
        # Place other operations, such as get, patch, and put here. See the project for full source code.

    "/foo/{fooId}/goos":
        get:
            operationId: getFooGoosPage
            # This is the relationship between Foos and Goos. 
            # Place your get and post operations here. 
            # ...

    "/goo/{gooId}":
        delete:
            operationId: deleteGoo

            # Place operations on other entities as needed.
```

```{tip}
`get`, `post`, `put`, `patch` 및 `delete`를 포함하여 다양한 종류의 요청에 대한 경로를 추가할 수 있습니다.
```

경로(`foo/{fooId}`)는 URL 끝에 경로 문자열을 추가하여 이 API(`getFoo`)에 도달할 수 있음을 지정합니다(`baseURI` 및 `version` 값도 포함). rest-config.yaml` 파일). 예를 들어 이 예제 API는 전체 URL인 `localhost:8080/o/headless-r3b2/v1.0/foo/{fooId}`를 통해 액세스됩니다.

`fooId` 을 대체하는 값이 일치하는 이름의 매개변수로 사용됩니다.

각 경로에는 적어도 성공적인 호출에 대한 응답( `200` 응답으로 표시됨)을 정의하는 `매개변수` 블록 아래(및 `get` 블록 내) `응답` 블록이 있습니다.

이 `응답` 블록은 성공적인 호출이 `Product`을 반환하도록 지정합니다. 문자열 `#/components/schemas/Foo` 은 이전에 동일한 파일에서 정의된 스키마를 참조하여 REST Builder가 이 API의 반환 유형으로 `Foo` 스키마를 사용할 수 있도록 합니다.

마지막으로 이 경로에 대한 `태그` 정의를 `응답` 블록 아래에 추가합니다.

```yaml
tags: ["Foo"]
```

이 태그는 REST Builder가 스캐폴딩 코드에 주석을 달 때 생성된 문서에 추가되는 정보를 지정합니다. 태그 이름은 스키마 이름을 반영해야 합니다.

완전한 참조를 위해 이전에 다운로드한 `rest-openapi.yaml` 파일을 참조하십시오.

관계를 수행하는 방법을 보여 주는 `Goo` 개체도 있습니다. Goos는 `fooId`과 연결되어 있다는 점에서 Foos와 관련이 있습니다.

## REST 빌더 실행

이제 REST Builder가 대부분의 작업을 수행하는 데 필요한 모든 구성을 추가했으므로 `impl` 모듈 내에서 다음 명령을 실행하여 `buildREST` Gradle 작업을 실행합니다.

```bash
../gradlew buildREST
```

REST Builder는 구성을 사용하고 스캐폴딩 코드로 `api` 및 `impl` 클래스와 구현 논리를 추가할 수 있는 Java 클래스를 채웁니다.

GraphQL 엔드포인트 코드와 JAX-RS 애플리케이션 코드는 각각 `graphql` 및 `jaxrs` 패키지에서 생성됩니다. 자체 API 구현이 `리소스` 패키지의 적절한 `*ResourceImpl` 클래스에 추가됩니다.

## 구현 로직 추가

마지막 단계는 정의한 각 API에 대한 논리를 정의하는 것입니다. `impl` 모듈 내에서 `rest-openapi.yaml` 에서 정의한 스키마 이름(이 예에서는 `FooResourceImpl.java` 및 `GooResourceImpl.java`)을 기반으로 구현이 진행되는 Java 자원 클래스를 찾으십시오.

```{tip}
구현을 위한 클래스의 사이트는 `rest-config.yaml` 파일에서 `apiPackagePath`에 대해 정의한 값에 따라 다릅니다. 해당 경로를 따른 다음 그 안에 있는 `internal/resource/<version>/`로 이동합니다. 이 예제와 동일한 경로를 사용한 경우 파일은 `src/main/java/com/acme/headless/r3b2/internal/resource/v1_0/`에 있습니다.
```

구현 클래스(`[SchemaName]ResourceImpl`)는 기본 클래스(`Base[SchemaName]ResourceImpl`) 옆에 있습니다. 구현 클래스를 여십시오. 이것은 단지 예일 뿐이므로 이 구현은 미리 채워진 `HashTable`을 사용하고 `getFoo` 메서드는 일치하는 `fooId`을 사용하여 `HashTable` 에서 제품을 반환합니다. 전체 구현은 프로젝트의 `FooResourceImpl.java` 을 참조하십시오.

```java
    @Override
    public Foo getFoo(Integer fooId) {
        return _foos.get(fooId);
    }
```

이 메서드는 특수 JAX-RS 주석을 사용하여 정의된 기본 클래스(`Base[SchemaName]ResourceImpl`)에 정의된 기본 메서드를 재정의합니다.

모든 비즈니스 논리를 추가하여 요청을 완료할 수 있습니다. REST Builder는 스키마에서 정의한 객체에 대한 기본 생성자만 생성합니다. 이 예제 비즈니스 로직은 객체를 생성하고 객체에 값을 추가합니다( `매개변수` in `rest-openapi.yaml`정의 방법에 따라).

```java
   Foo foo1 = new Foo() {
      {
         description = "Universal truth must be transcendental.";
         id = 1L;
         name = "Truth";
      }
   };
```

`Goo` 논리는 유사하지만 이 경우 `Foo` 객체가 여러 `Goo`을 포함할 수 있기 때문에 여러 개의 `Goo`이 반환됩니다. 객체 컬렉션을 반환할 때 `Page`이라는 페이지 매김 친화적인 객체를 사용해야 합니다.

```java
    @Override
    public Page<Goo> getFooGoosPage(Long fooId) {
        List<Goo> goos = new ArrayList<>();

        for (Goo goo : _goos.values()) {
            if (Objects.equals(fooId, goo.getFooId())) {
                goos.add(goo);
            }
        }

        return Page.of(goos);
    }
```

## 결론

축하합니다! 이제 REST Builder로 새 API를 구현하는 기본 사항을 알고 DXP에 새 API를 추가했습니다.

<!-- Add links to the overview and other articles as additional information when available. -->
