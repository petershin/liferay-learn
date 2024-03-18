# 클라이언트 확장 작업

{bdg-primary}`Liferay Self-Hosted`
{bdg-primary}`Liferay SaaS`
{bdg-warning}`Liferay PaaS`

{bdg-secondary}`Liferay 7.4`

클라이언트 확장을 사용하면 OSGi 모듈을 배포하지 않고도 Liferay를 확장할 수 있습니다. 기존 모듈 개발과 마찬가지로 클라이언트 확장은 [Liferay Workspace](../tooling/liferay-workspace.md) 에 있습니다. 학습부터 시작해 보세요

* 클라이언트 확장 개발을 시작하는 데 필요한 도구
* 구성 파일에서 클라이언트 확장을 정의하는 방법
* 클라이언트 확장을 배포하는 방법

## 필수 도구 및 설정

클라이언트 확장 개발을 위한 세 가지 필수 구성 요소를 설치합니다.

1. 자바 8 또는 JDK 11.

    ```{note}
    지원되는 JDK, 데이터베이스 및 환경에 대한 정보는 [호환성 매트릭스](https://help.liferay.com/hc/ko/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) 확인하세요. 권장되는 JVM 설정은 [JVM 구성](../../installation-and-upgrades/reference/jvm-configuration.md) 참조하세요.
    ```

1. liferay 작업공간. 예제 클라이언트 확장 프로젝트가 포함된 작업공간을 다운로드하려면 다음을 실행하세요.

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   클라이언트 확장 프로젝트(`client-extensions/` 디렉토리에 있음)를 자신의 작업공간에 복사하거나 샘플 작업공간을 직접 사용할 수 있습니다.

1. Liferay Experience Cloud(LXC)를 사용하는 경우 [명령줄 도구](https://learn.liferay.com/ko/w/liferay-cloud/reference/command-line-tool) 이 있어야 합니다.

## 클라이언트 확장 프로젝트

클라이언트 확장 개발은 **작업 공간과 프로젝트** 모델을 따릅니다. [Liferay 작업 공간](../tooling/liferay-workspace.md) 내에서 `[workspace-root]/client-extensions` 아래에 클라이언트 확장 프로젝트를 구현합니다. 프로젝트의 `client-extension.yaml` 파일은 클라이언트 확장을 정의하며, 빌드 프로세스는 각 프로젝트에 대한 단일 출력 세트를 생성합니다. 빌드된 클라이언트 확장 프로젝트는 Liferay Universal File Format Archive(LUFFA)라고 하는 배포 가능한 `*.zip` 아카이브입니다.

## 프로젝트에서 클라이언트 확장 그룹화

단일 프로젝트로 그룹화된 클라이언트 확장은 구축 시 배포 가능한 단일 단위로 구성됩니다. 적절한 경우(예: 관련 작업을 수행해야 할 때 효율성을 높이기 위해) 클라이언트 확장을 그룹화할 수 있지만 제한 사항이 있습니다.

단일 프로젝트의 모든 클라이언트 확장은 해당 프로젝트의 특정 작업 부하를 나타내는 Docker 컨테이너와 연결되므로 특정 종류의 클라이언트 확장만 그룹화와 호환됩니다. 예를 들어, [마이크로서비스 클라이언트 확장](./microservice-client-extensions.md) 구성 클라이언트 확장으로만 그룹화될 수 있습니다. 마이크로서비스는 Liferay 외부에서 실행되는 워크로드를 나타내기 때문입니다.

다음과 같은 방법으로 클라이언트 확장을 그룹화할 수 있습니다.

* 동일한 유형의 클라이언트 확장(예: 여러 일괄 클라이언트 확장)
* 일괄 클라이언트 확장이 포함된 구성 클라이언트 확장
* 프런트 엔드 클라이언트 확장이 포함된 구성 클라이언트 확장
* 마이크로서비스 클라이언트 확장이 포함된 구성 클라이언트 확장

호환되지 않는 클라이언트 확장 그룹(예: 마이크로서비스가 있는 프런트엔드)이 포함된 프로젝트 빌드는 오류와 함께 실패합니다.

## 클라이언트 확장 구성

클라이언트 확장은 다음 속성을 사용하여 `client-extension.yaml` 파일에 정의됩니다.

`name`: Liferay UI에 표시되는 이름을 입력합니다. UI에서 구성할 수 없는 경우 `name` 값은 사용되지 않습니다.

`type`: 클라이언트 확장의 유형을 설정합니다(예: `themeCSS`). 유형에 따라 Liferay가 배포될 때 클라이언트 확장을 처리하는 방법이 결정됩니다.

`dxp.lxc.liferay.com.virtualInstanceId`: 배포할 가상 인스턴스 ID를 입력합니다.

각 클라이언트 확장 프로젝트에는 작업공간의 `client-extensions/` 폴더 내에 자체 폴더가 있습니다. 클라이언트 확장 프로젝트에는 하나 이상의 클라이언트 확장을 정의하는 단일 `client-extension.yaml` 파일이 포함되어 있습니다. 예를 들어, [`iframe-2` 프로젝트의 `client-extension.yaml`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-iframe-2/client-extension.yaml) `Baseball`, `Football` 및 `Hockey`라는 세 가지 `iframe` 클라이언트 확장을 정의합니다.

### 클라이언트 확장 조립

클라이언트 확장을 빌드하면 파일이 자동으로 생성되어 결과 [LUFFA](./packaging-client-extensions.md) 에 패키징됩니다. 빌드 또는 프로젝트 파일에서 포함할 파일을 구성하려면 `client-extension.yaml` 파일에 `assemble` 블록을 정의하세요.

`assembleClientExtension` Gradle 작업은 클라이언트 확장 프로젝트 내에서 `gradle 빌드` 또는 `gradle 배포`를 실행할 때 실행됩니다. 실행 중에 프로젝트의 `assemble` 블록에 지정된 파일은 프로젝트의 `build/liferay-client-extension-build/` 폴더에 배치됩니다. 이 폴더의 모든 내용은 LUFFA를 생성하는 데 사용됩니다(예: `dist/my-client-extension-project.zip`).

```{note}
클라이언트 확장 프로젝트에 `build` 스크립트가 정의된 `package.json` 파일이 포함되어 있는 경우 프로젝트를 빌드할 때 스크립트가 자동으로 실행됩니다. 빌드의 이 부분은 파일이 복사되기 *전에* 발생하므로 `assemble` 블록에서 작업의 출력 사이트
를 지정할 수 있습니다.
```

`assemble` 블록은 포함할 파일에 대한 여러 명령을 포함할 수 있는 YAML 배열입니다. 각 지침 세트는 다음 패턴을 따릅니다.

```yaml
- from: [some folder in your project]
  include: [single file or glob match]
  into: [output location in archive]
```

`assemble` 배열에는 다음과 같은 속성이 있습니다:

* `from`: 클라이언트 확장 아카이브에 파일을 복사할 폴더를 지정합니다.

* `include`: from 디렉터리에서 포함할 파일의 하위 집합과 일치하는 단일 파일 또는 glob을 지정합니다. 정의하지 않으면 모든 파일이 반복적으로 포함됩니다(`**/*`와 동일).

  필요한 경우 여러 `include` 패턴의 배열을 사용할 수 있습니다.

  ```yaml
  assemble:
      - from: build
        include:
          - "vite/js/*.js"
          - "vite/css/*.css"
        into: static
  ```

* `into`: 결과 LUFFA에서 일치하는 리소스를 복사할 사이트
를 지정합니다.

  프런트 엔드 클라이언트 확장을 위한 정적 리소스는 `static/` 디렉터리에 복사되어야 합니다. Liferay는 이를 자체 호스팅 인스턴스 또는 LXC의 컨테이너에서 정적 리소스로 제공합니다.

  배치 클라이언트 확장을 위한 JSON 리소스는 `batch/` 디렉터리에 복사되어야 합니다.

* `fromTask`: `from` 대신 어셈블리 단계 전에 실행할 프로젝트에서 Gradle 작업을 지정할 수 있습니다.

  예를 들어 Spring Boot를 사용하는 `microservice` 클라이언트 확장 프로젝트에서 Gradle 작업 `bootJar`는 애플리케이션과 모든 해당 종속성을 포함하는 `.jar` 파일을 생성합니다. 이 경우 `fromTask` 속성을 사용하여 프로젝트의 `bootJar` Gradle 작업 실행을 트리거한 다음 결과 LUFFA의 루트에 작업의 출력(예: 빌드된 `.jar` 파일)을 포함합니다.

  ```yaml
  assemble:
      - fromTask: bootJar
  ```

  프로젝트의 `build.gradle` 파일에 [Gradle exec task](https://docs.gradle.org/current/dsl/org.gradle.api.tasks.Exec.html) 정의하여 빌드의 일부로 `fromTask`를 사용하여 다른 명령을 실행할 수 있습니다(예: 다른 프로그래밍 언어로 작성된 빌드 코드).

### 예제 `조립` 블록

`assemble` 블록에 여러 `from` 항목을 포함할 수 있습니다.

```yaml
assemble:
    - from: build/folder/aaa
      include: "css/*.css"
      into: folder/aaa
    - from: build/folder/bbb
      include: "css/*.css"
      into: folder/bbb
```

다음과 같이 빌드되지 않은 프로젝트의 리소스를 포함할 수도 있습니다.

```yaml
assemble:
    - from: assets
      into: static
```

이 예에서는 `[project-root]/somewhere/else`의 `*.ico` 파일을 LUFFA의 `static` 폴더에 배치합니다.

```yaml
assemble:
    - from: somewhere/else
      include: "*.ico"
      into: static
```

LUFFA의 생성, 구조 및 내용에 대한 자세한 내용은 [패키징 클라이언트 확장](./packaging-client-extensions.md) 을 참조하세요.

## Liferay 인스턴스에 배포

클라이언트 확장은 배포 가능한 `.zip` 아카이브에 내장되어 있습니다. 각 클라이언트 확장 아카이브에는 클라이언트 확장 설정이 포함된 JSON 파일이 포함되어 있습니다.

Liferay 설치를 위한 올바른 사이트
에 `.zip` 파일을 배치하여 클라이언트 확장을 배포합니다. 사용하게 될 정확한 명령은 Liferay 인스턴스가 호스팅되는 방식에 따라 다릅니다.

### LXC에 배포

```{warning}
이 방법을 사용하면 클라이언트 확장을 자체 관리형 인스턴스(LXC-SM)에 배포할 수 없습니다.
```

LXC용 클라이언트 확장을 배포하려면,

1. 작업공간의 `client-extensions/` 폴더로 이동하여 다음을 실행하세요.

   ```bash
   ../gradlew clean build
   ```

   컴파일된 `.zip` 파일은 각 프로젝트의 `dist/` 폴더에 생성됩니다. 한 번에 하나의 프로젝트를 빌드하려면 프로젝트 폴더에서 명령을 실행하세요.

1. 선택한 환경에 각 클라이언트 확장을 배포하려면 다음 명령을 실행하세요.

   ```bash
   lcp deploy --extension [extension-zip-file]
   ```

   메시지가 표시되면 프로젝트와 배포 환경을 선택합니다. 명령이 완료되면 zip 파일이 LXC 프로젝트에 업로드됩니다.

### 자체 호스팅 Liferay 인스턴스에 배포

Liferay 설치를 자체 호스팅하는 경우 작업 공간 번들 zip을 사용하여 클라이언트 확장을 배포하세요. 클라이언트 확장을 빌드하고 배포하려면 작업 영역의 `client-extensions/` 폴더에서 다음 명령을 실행하세요.

```bash
../gradlew clean distBundleZip
```

zip 파일을 수동으로 배포해야 하는 경우 다음을 실행합니다.

```bash
../gradlew clean build
```

그런 다음 각 프로젝트의 `dist/` 폴더에 있는 아카이브를 서버의 `[Liferay Home]/osgi/client-extensions/` 폴더에 복사합니다.

## 상황에 맞는 정보

클라이언트 확장은 이식 가능합니다. 도메인 이름, 네트워크 주소 또는 Liferay 도메인과 같은 환경별 세부 정보를 하드 코딩해서는 안 됩니다. 클라이언트 확장은 런타임 시 해당 컨텍스트에 대한 상황에 맞는 정보를 찾을 수 있습니다.

모든 클라이언트 확장 워크로드에는 상황에 맞는 중요한 메타데이터가 자동으로 포함된 **경로** 세트가 제공됩니다. 이 경로 기반 접근 방식을 사용하면 애플리케이션 논리는 호출 사이트
에 관계없이 상황에 맞는 정보를 균일하게 검색할 수 있습니다. 클라이언트 확장 프로젝트에서 이를 가리키기만 하면 됩니다.

### 노선

**경로** 는 키/값 쌍 집합을 포함하는 디렉터리 구조입니다. 파일 이름은 키이고 파일 내용은 값입니다. 디렉터리 구조는 무시되며 디렉터리 경로는 환경 변수의 값입니다. [Kubernetes configMaps](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#add-configmap-data-to-a-volume) 과 동일한 패턴을 따릅니다.

사용하는 환경 변수는 두 가지 유형의 경로 중 하나를 가리킬 수 있습니다.

1. `LIFERAY_ROUTES_DXP`: 배포된 **Liferay 가상 인스턴스** 에 대한 상황에 맞는 메타데이터가 있는 경로에 대한 디렉터리 경로입니다.

   다음은 `LIFERAY_ROUTES_DXP` 경로의 예입니다.

   ```properties
   .
   # A newline-separated list of every domain belonging to the DXP virtual instance
   ├── com.liferay.lxc.dxp.domains
   # The primary domain ("Virtual Host" field) of the DXP virtual instance
   ├── com.liferay.lxc.dxp.main.domain
   # The protocol with which to communicate with DXP virtual instance (http or https)
   └── com.liferay.lxc.dxp.server.protocol
   ```

1. `LIFERAY_ROUTES_CLIENT_EXTENSION`: **클라이언트 확장 프로젝트** 자체에 대한 상황에 맞는 메타데이터가 포함된 경로에 대한 디렉터리 경로입니다.

   예제는 [OAuth 헤드리스 서버 클라이언트 확장](configuration-client-extensions.md#oauth-headless-server-client-extensions) 및 [OAuth 사용자 에이전트 클라이언트 확장](configuration-client-extensions.md#oauth-user-agent-client-extensions) 을 참조하세요.

### Liferay Experience Cloud의 경로 지정

Liferay Experience Cloud의 컨테이너에는 이러한 환경 변수가 자동으로 설정됩니다. 경로는 환경 변수가 정의한 경로의 컨테이너에 자동으로 마운트됩니다.

### 자체 호스팅 환경에서 경로 가리키기

Liferay Workspace의 `Exec`, `JavaExec` 및 `NodeExec` Gradle 작업을 사용하는 경우 이러한 환경 변수에는 자동으로 기본값이 제공됩니다. 다음과 같은 기본값을 사용합니다.

| **환경 변수** | **기본값** |
| :-------------------------------- | :-------------------------------------------------------------- |
| `LIFERAY_ROUTES_DXP`              | `[Liferay Home]/routes/default/dxp`                             |
| `LIFERAY_ROUTES_CLIENT_EXTENSION` | `[Liferay Home]/routes/default/[Client extension project name]` |

환경 변수는 Liferay 홈 디렉터리에 대한 Liferay 작업 공간의 `liferay.workspace.home.dir` 속성을 사용하고, `default`는 기본 Liferay 가상 인스턴스를 나타냅니다. 대신 `기본값` 대신 특정 가상 인스턴스 ID를 사용하여 이러한 환경 변수를 정의하여 이를 가리키도록 합니다.

```{note}
Liferay 작업 공간 버전이 9.0.2 이전인 경우 동일한 형식에 따라 이러한 환경 변수를 직접 정의해야 합니다*.
```

메타데이터에 액세스하기 위해 호출될 때 클라이언트 확장 프로세스에 이러한 두 환경 변수를 제공해야 합니다.

## 관련 주제

* [배치 클라이언트 확장](./batch-client-extensions.md)
* [구성 클라이언트 확장](./configuration-client-extensions.md)
* [프런트엔드 클라이언트 확장](./frontend-client-extensions.md)
* [마이크로서비스 클라이언트 확장](./microservice-client-extensions.md)
* [클라이언트 확장 패키징](./packaging-client-extensions.md)

## 튜토리얼

* [JavaScript 클라이언트 확장 사용](./frontend-client-extensions/tutorials/using-a-javascript-client-extension.md)
* [CSS 클라이언트 확장 사용하기](./frontend-client-extensions/tutorials/using-a-css-client-extension.md)
