# 클라이언트 확장 기능으로 작업하기

{bdg-secondary}`라이프레이 7.4 이상 사용 가능`

클라이언트 확장을 사용하면 OSGi 모듈을 배포하지 않고도 Liferay를 확장할 수 있습니다. 기존 모듈 개발과 마찬가지로 클라이언트 확장 기능은 [Liferay Workspace](../tooling/liferay-workspace.md) 에 있습니다. 학습으로 시작하기

- 클라이언트 확장 프로그램 개발을 시작하는 데 필요한 도구
- 구성 파일에서 클라이언트 확장자를 정의하는 방법
- 클라이언트 확장 프로그램을 배포하는 방법

## 필수 도구 및 설정

클라이언트 확장 프로그램 개발을 위한 세 가지 사전 요구 사항을 설치합니다:

1. Java 8 또는 JDK 11.

    ```{note}
    지원되는 JDK, 데이터베이스 및 환경에 대한 정보는 [호환성 매트릭스](https://help.liferay.com/hc/ko/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) 를 참조하세요. 권장 JVM 설정은 [JVM 구성](../../설치-업그레이드/참고자료/jvm-configuration.html) 을 참조하세요.
    ```

1. 라이프레이 작업 공간. 클라이언트 확장 프로젝트 예제가 포함된 워크스페이스를 다운로드하려면 다음을 실행하세요.

    ```bash
    curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
    ```

    클라이언트 확장 프로젝트( `client-extensions/` 디렉터리에 있음)를 자신의 워크스페이스에 복사하거나 샘플 워크스페이스를 직접 사용할 수 있습니다.

1. Liferay Experience Cloud(LXC)를 사용하는 경우 [`lcp` CLI 도구](https://learn.liferay.com/en/w/liferay-cloud/reference/command-line-tool) 가 있어야 합니다.

## 클라이언트 확장 프로젝트

클라이언트 확장 프로그램 개발은 **워크스페이스 플러스 프로젝트** 모델을 따릅니다. [Liferay 워크스페이스](../tooling/liferay-workspace.md)에서 `[workspace-root]/client-extensions`에서 클라이언트 확장 프로젝트를 구현합니다. 프로젝트의 `client-extension.yaml` 파일은 클라이언트 확장자를 정의하며, 빌드 프로세스는 각 프로젝트에 대해 단일 출력 세트를 생성합니다. 빌드된 클라이언트 확장 프로젝트는 배포 가능한 `*.zip` 아카이브로, Liferay 범용 파일 형식 아카이브(LUFFA)라고 합니다.

## 프로젝트에서 클라이언트 확장 기능 그룹화

단일 프로젝트에 그룹화된 클라이언트 확장 기능은 빌드 시 배포 가능한 단일 단위로 구성됩니다. 적절한 경우(예: 관련 작업을 수행해야 할 때 효율성을 높이기 위해) 클라이언트 확장 프로그램을 그룹화할 수 있지만 제한 사항이 있습니다.

단일 프로젝트의 모든 클라이언트 확장은 해당 프로젝트의 특정 워크로드를 나타내는 Docker 컨테이너와 연결되므로 특정 종류의 클라이언트 확장만 그룹화할 수 있습니다. 예를 들어, [마이크로서비스 클라이언트 확장](./microservice-client-extensions.md) 은 구성 클라이언트 확장으로만 그룹화할 수 있는데, 이는 마이크로서비스가 Liferay 외부에서 실행되는 워크로드를 나타내기 때문입니다.

다음과 같은 방법으로 클라이언트 확장 프로그램을 그룹화할 수 있습니다:

* 동일한 유형의 클라이언트 확장(예: 여러 배치 클라이언트 확장)
* 일괄 클라이언트 확장을 사용하여 클라이언트 확장 구성하기
* 프런트엔드 클라이언트 확장을 사용하여 클라이언트 확장 구성하기
* 마이크로서비스 클라이언트 확장으로 클라이언트 확장 구성하기

호환되지 않는 클라이언트 확장 그룹(예: 마이크로서비스가 있는 프런트엔드)으로 프로젝트를 빌드하면 오류가 발생하여 실패합니다.

## 클라이언트 확장 구성

클라이언트 확장은 `client-extension.yaml` 파일에 이러한 속성과 함께 정의되어 있습니다:

`이름`: Liferay UI에 표시되는 이름을 그대로 입력합니다. UI에서 구성할 수 없는 경우 `이름` 값은 사용되지 않습니다.

`type`: 클라이언트 확장 프로그램의 유형을 설정합니다(예: `themeCSS`). 유형에 따라 Liferay가 클라이언트 확장을 배포할 때 처리하는 방식이 결정됩니다.

`dxp.lxc.liferay.com.virtualInstanceId`: 배포할 가상 인스턴스 ID를 입력합니다.

각 클라이언트 확장 프로젝트는 워크스페이스의 `client-extensions/` 폴더 안에 자체 폴더가 있습니다. 클라이언트 확장 프로젝트에는 하나 이상의 클라이언트 확장을 정의하는 단일 `client-extension.yaml` 파일이 포함되어 있습니다. [예를 들어, `iframe-2` 프로젝트의 `client-extension.yaml`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-iframe-2/client-extension.yaml) 은 3개의 `iframe` 클라이언트 확장을 정의합니다: `야구`, `축구`, 그리고 `하키`입니다.

### 클라이언트 확장 프로그램 조립

클라이언트 확장자를 빌드하면 파일이 자동으로 생성되고 결과물인 [LUFFA](./packaging-client-extensions.md)에 패키징됩니다. `client-extension.yaml` 파일에 `assemble` 블록을 정의하여 빌드 또는 프로젝트 파일에서 포함할 파일을 구성합니다.

클라이언트 확장 프로젝트 내에서 `gradle build` 또는 `gradle deploy` 를 실행하면 `assembleClientExtension` Gradle 작업이 실행됩니다. 실행 중에 프로젝트의 `assemble` 블록에 지정된 파일은 프로젝트의 `build/liferay-client-extension-build/` 폴더에 배치됩니다. 이 폴더의 모든 항목은 LUFFA를 생성하는 데 사용됩니다(예: `dist/my-client-extension-project.zip`).

`assemble` 블록은 포함할 파일에 대한 여러 지침을 포함할 수 있는 YAML 배열입니다. 각 지침 세트는 이 패턴을 따릅니다:

```yaml
- from: [some folder in your project]
  include: [single file or glob match]
  into: [output location in archive]
```

`assemble` 배열에는 이러한 속성이 있습니다:

* ``: 클라이언트 확장 아카이브에 파일을 복사할 폴더를 지정합니다.

* `include`: from 디렉터리에서 포함할 파일의 하위 집합과 일치하는 단일 파일 또는 글로브를 지정합니다. 정의되지 않은 경우 모든 파일이 재귀적으로 포함됩니다( `**/*`)에 해당).

   필요한 경우 여러 개의 `포함` 패턴 배열을 사용할 수 있습니다:

   ```yaml
   assemble:
       - from: build
         include:
           - "vite/js/*.js"
           - "vite/css/*.css"
         into: static
   ```

* `into`: 결과 LUFFA에서 일치하는 리소스를 복사할 위치를 지정합니다.

   프런트엔드 클라이언트 확장을 위한 정적 리소스는 `static/` 디렉터리에 복사해야 합니다. Liferay는 이러한 리소스를 자체 호스팅 인스턴스에서 정적 리소스로 제공하거나 LXC의 컨테이너에서 제공합니다.

   배치 클라이언트 확장을 위한 JSON 리소스는 `batch/` 디렉터리에 복사해야 합니다.

* `fromTask`: `from` 대신 어셈블리 단계 전에 실행할 Gradle 작업을 프로젝트에서 지정할 수 있습니다.

예를 들어 Spring Boot를 사용하는 `microservice` 클라이언트 확장 프로젝트에서 Gradle 작업 `bootJar`는 애플리케이션과 모든 종속성을 포함하는 `.jar` 파일을 생성합니다. 이 경우 'fromTask' 속성을 사용하여 프로젝트의 'bootJar' Gradle 작업 실행을 트리거한 다음 결과 LUFFA의 루트에 작업의 출력(즉, 빌드된 '.jar' 파일)을 포함합니다.

   ```yaml
   assemble:
       - fromTask: bootJar
   ```

### 예시 `조립` 블록

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

이 예에서는 `[project-root]/somewhere/기타` 의 `*.ico` 파일을 LUFFA의 `static` 폴더에 배치합니다.

```yaml
assemble:
    - from: somewhere/else
      include: "*.ico"
      into: static
```

루파의 생성, 구조 및 내용에 대한 자세한 내용은 [패키징 클라이언트 확장](./packaging-client-extensions.md)을 참조하세요.

## Liferay 인스턴스에 배포하기

클라이언트 확장 프로그램은 배포 가능한 `.zip` 아카이브에 내장되어 있습니다. 각 클라이언트 확장 프로그램 아카이브에는 클라이언트 확장 프로그램의 설정이 포함된 JSON 파일이 포함되어 있습니다.

`.zip` 파일을 Liferay 설치에 맞는 올바른 위치에 배치하여 클라이언트 확장을 배포합니다. 사용할 정확한 명령은 Liferay 인스턴스가 호스팅되는 방식에 따라 다릅니다.

### LXC에 배포

LXC용 클라이언트 확장 프로그램을 배포합니다,

1. 워크스페이스의 `client-extensions/` 폴더로 이동하여 다음을 실행합니다.

   ```bash
   ../gradlew clean build
   ```

   컴파일된 `.zip` 파일은 각 프로젝트의 `dist/` 폴더에 생성됩니다. 한 번에 하나의 프로젝트를 빌드하려면 프로젝트 폴더에서 명령을 실행하세요.

1. 이 명령을 실행하여 각 클라이언트 확장 프로그램을 선택한 환경에 배포합니다:

   ```bash
   lcp deploy --extension [extension-zip-file]
   ```

   메시지가 표시되면 프로젝트와 배포 환경을 선택합니다. 명령이 완료되면 zip 파일이 LXC 프로젝트에 업로드됩니다.

### 자체 호스팅 Liferay 인스턴스에 배포하기

Liferay 설치를 자체 호스팅하는 경우 워크스페이스 번들 zip을 사용하여 클라이언트 확장 기능을 배포하세요. 클라이언트 확장 프로그램을 빌드하고 배포하려면 워크스페이스의 `client-extensions/` 폴더에서 이 명령을 실행하세요:

```bash
../gradlew clean distBundleZip
```

zip 파일을 수동으로 배포해야 하는 경우 다음을 실행합니다.

```bash
../gradlew clean build
```

그런 다음 각 프로젝트의 `dist/` 폴더에 있는 아카이브를 서버의 `[Liferay Home]/osgi/client-extensions/` 폴더에 복사합니다.

## 관련 주제

* [일괄 클라이언트 확장](./batch-client-extensions.md)
* [클라이언트 확장 구성](./configuration-client-extensions.md)
* [프런트엔드 클라이언트 확장](./front-end-client-extensions.md)
* [마이크로서비스 클라이언트 확장](./microservice-client-extensions.md)
* [클라이언트 확장 패키징](./packaging-client-extensions.md)

## 튜토리얼

* [자바스크립트 클라이언트 확장 프로그램 사용](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md)
* [CSS 클라이언트 확장 사용](./front-end-client-extensions/tutorials/using-a-css-client-extension.md)
