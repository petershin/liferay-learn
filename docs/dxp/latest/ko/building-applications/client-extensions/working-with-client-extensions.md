# 클라이언트 확장 작업

{bdg-secondary}`7.4+`

클라이언트 확장을 사용하면 OSGi 모듈을 배포하지 않고도 Liferay를 확장할 수 있습니다. 기존 모듈 개발과 마찬가지로 클라이언트 확장은 [Liferay Workspace](../tooling/liferay-workspace.md)에 있습니다. 배우기 시작하기

- 클라이언트 확장 개발을 시작하는 데 필요한 도구
- 구성 파일에서 클라이언트 확장을 정의하는 방법
- 클라이언트 확장을 배포하는 방법

## 필수 도구 및 설정

클라이언트 확장 개발을 위한 세 가지 필수 구성 요소를 설치합니다.

1. 자바 8 또는 JDK 11.

    ```{note}
    지원되는 JDK, 데이터베이스 및 환경에 대한 정보는 [호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix)를 확인하세요. 권장 JVM 설정은 [JVM 구성](../../installation-and-upgrades/references/jvm-configuration.html)을 참조하십시오.
    ```

1. 라이프레이 작업 공간. 예제 클라이언트 확장 프로젝트가 있는 작업공간을 다운로드하려면 다음을 실행하십시오.

    ```bash
    curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
    ```

    클라이언트 확장 프로젝트( `client-extensions/` 디렉토리에 있음)를 자신의 작업공간에 복사하거나 샘플 작업공간을 직접 사용할 수 있습니다.

1. LXC(Liferay Experience Cloud)를 사용하는 경우 [`lcp` CLI 도구](https://learn.liferay.com/en/w/liferay-cloud/reference/command-line-tool)이 있어야 합니다.

## 클라이언트 확장 프로젝트

클라이언트 확장 개발은 _작업 공간과 프로젝트_ 모델을 따릅니다. [Liferay 작업 공간](../tooling/liferay-workspace.md)내에서 `[workspace-root]/client-extensions`아래에 클라이언트 확장 프로젝트를 구현합니다. 프로젝트의 `client-extension.yaml` 파일은 클라이언트 확장을 정의하고 빌드 프로세스는 각 프로젝트에 대한 단일 출력 집합을 생성합니다. 빌드된 클라이언트 확장 프로젝트는 Liferay Universal File Format Archive(LUFFA)라고 하는 배포 가능한 `*.zip` 아카이브입니다.

## 프로젝트에서 클라이언트 확장 그룹화

단일 프로젝트로 그룹화된 클라이언트 확장은 빌드 시 배포 가능한 단일 단위로 구성됩니다. 의미가 있는 경우(예: 관련 작업을 수행해야 할 때 효율성을 향상시키기 위해) 클라이언트 확장을 그룹화할 수 있지만 제한이 있습니다.

단일 프로젝트의 모든 클라이언트 확장은 해당 프로젝트에 특정한 워크로드를 나타내는 Docker 컨테이너와 연결되기 때문에 특정 종류의 클라이언트 확장만 그룹화와 호환됩니다. 예를 들어 마이크로 서비스는 Liferay 외부에서 실행되는 워크로드를 나타내므로 [마이크로 서비스 클라이언트 확장](./microservice-client-extensions.md) 구성 클라이언트 확장으로만 그룹화할 수 있습니다.

다음과 같은 방법으로 클라이언트 확장을 함께 그룹화할 수 있습니다.

* 동일한 유형의 클라이언트 확장(예: 여러 배치 클라이언트 확장)
* 배치 클라이언트 확장을 사용하여 클라이언트 확장 구성
* 프런트 엔드 클라이언트 확장이 있는 구성 클라이언트 확장
* 마이크로서비스 클라이언트 확장을 사용하여 클라이언트 확장 구성

호환되지 않는 클라이언트 확장 그룹(예: 마이크로 서비스가 포함된 프런트 엔드)을 사용하여 프로젝트를 빌드하면 오류가 발생합니다.

## 클라이언트 확장 구성

클라이언트 확장은 다음 속성을 사용하여 `client-extension.yaml` 파일에 정의됩니다.

`name`: Liferay UI에 표시되는 이름을 입력합니다. UI에서 구성할 수 없는 경우 `이름` 값이 사용되지 않습니다.

`유형`: 클라이언트 확장의 유형을 설정합니다(예: `themeCSS`). 유형은 배포 시 Liferay가 클라이언트 확장을 처리하는 방법을 결정합니다.

`dxp.lxc.liferay.com.virtualInstanceId`: 배포할 가상 인스턴스 ID를 입력합니다.

각 클라이언트 확장 프로젝트에는 작업 공간의 `client-extensions/` 폴더 내에 자체 폴더가 있습니다. 클라이언트 확장 프로젝트에는 하나 이상의 클라이언트 확장을 정의하는 단일 `client-extension.yaml` 파일이 포함되어 있습니다. 예를 들어 [the `iframe-2` 프로젝트의 `client-extension.yaml`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-iframe-2/client-extension.yaml) 는 세 개의 `iframe` 클라이언트 확장인 `Baseball`, `Football`및 `Hockey`정의합니다.

### 클라이언트 확장 조합

클라이언트 확장을 빌드하면 파일이 자동으로 생성되고 결과 [LUFFA](./packaging-client-extensions.md)에 패키징됩니다. `client-extension.yaml` 파일에서 `assemble` 블록을 정의하여 빌드 또는 프로젝트 파일에서 포함할 파일을 구성합니다.

`assembleClientExtension` Gradle 작업은 클라이언트 확장 프로젝트 내에서 `gradle build` 또는 `gradle deploy` 실행할 때 실행됩니다. 실행 중에 프로젝트의 `assemble` 블록에 지정된 파일은 프로젝트의 `build/liferay-client-extension-build/` 폴더에 배치됩니다. 이 폴더의 모든 항목은 LUFFA를 만드는 데 사용됩니다(예: `dist/my-client-extension-project.zip`).

`assemble` 블록은 포함할 파일에 대한 여러 명령을 포함할 수 있는 YAML 배열입니다. 각 지침 세트는 다음 패턴을 따릅니다.

```yaml
- from: [some folder in your project]
  include: [single file or glob match]
  into: [output location in archive]
```

`어셈블` 배열에는 다음과 같은 속성이 있습니다.

* `에서`: 파일을 클라이언트 확장 아카이브로 복사할 폴더를 지정합니다.

* `include`: from 디렉토리에서 포함할 파일의 하위 집합과 일치하는 단일 파일 또는 glob을 지정합니다. 정의되지 않은 경우 모든 파일이 재귀적으로 포함됩니다( `**/*`과 동일).

   필요한 경우 여러 개의 `포함` 패턴 배열을 사용할 수 있습니다.

   ```yaml
   assemble:
       - from: build
         include:
           - "vite/js/*.js"
           - "vite/css/*.css"
         into: static
   ```

* `에서`로 : 결과 LUFFA에서 일치하는 리소스를 복사할 위치를 지정합니다.

   프런트 엔드 클라이언트 확장에 대한 정적 리소스는 `static/` 디렉터리에 복사해야 합니다. Liferay는 이러한 리소스를 자체 호스팅 인스턴스 또는 LXC의 컨테이너에서 정적 리소스로 제공합니다.

   배치 클라이언트 확장에 대한 JSON 리소스는 `배치/` 디렉터리에 복사해야 합니다.

* `fromTask`: `from`대신 어셈블리 단계 전에 실행할 프로젝트의 Gradle 작업을 지정할 수 있습니다.

   예를 들어 Spring Boot를 사용하는 `마이크로서비스` 클라이언트 확장 프로젝트에서 Gradle 작업 `bootJar` 애플리케이션과 모든 종속성을 포함하는 `.jar` 파일을 생성합니다. 이 경우 속성 `fromTask` 사용하여 프로젝트의 `bootJar` Gradle 작업 실행을 트리거한 다음 결과 LUFFA의 루트에 작업의 출력(예: 빌드된 `.jar` 파일)을 포함합니다.

   ```yaml
   assemble:
       - fromTask: bootJar
   ```

### 예 `블록` 개 조립

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

이 예제는 `[project-root]/somewhere/else` 의 `*.ico` 파일을 LUFFA의 `static` 폴더에 배치합니다.

```yaml
assemble:
    - from: somewhere/else
      include: "*.ico"
      into: static
```

LUFFA의 생성, 구조 및 내용에 대한 자세한 내용은 [클라이언트 확장 패키징](./packaging-client-extensions.md)참조하십시오.

## Liferay 인스턴스에 배포

클라이언트 확장은 배포 가능한 `.zip` 아카이브에 내장되어 있습니다. 각 클라이언트 확장 아카이브에는 클라이언트 확장의 설정이 포함된 JSON 파일이 포함되어 있습니다.

Liferay 설치를 위한 올바른 위치에 `.zip` 파일을 배치하여 클라이언트 확장을 배포합니다. 사용할 정확한 명령은 Liferay 인스턴스가 호스팅되는 방식에 따라 다릅니다.

### LXC에 배포

LXC용 클라이언트 확장을 배포하려면

1. 작업 공간의 `client-extensions/` 폴더로 이동하여 다음을 실행합니다.

   ```bash
   ../gradlew clean build
   ```

   컴파일된 `.zip` 파일은 각 프로젝트의 `dist/` 폴더에 생성됩니다. 한 번에 하나의 프로젝트를 빌드하려면 프로젝트 폴더에서 명령을 실행하십시오.

1. 이 명령을 실행하여 선택한 환경에 각 클라이언트 확장을 배포합니다.

   ```bash
   lcp deploy --extension [extension-zip-file]
   ```

   메시지가 표시되면 프로젝트와 배포 환경을 선택합니다. 명령이 완료되면 zip 파일이 LXC 프로젝트에 업로드됩니다.

### 자체 호스팅 Liferay 인스턴스에 배포

Liferay 설치를 자체 호스팅하는 경우 작업 영역 번들 zip을 사용하여 클라이언트 확장을 배포합니다. 클라이언트 확장을 빌드하고 배포하려면 작업 영역의 `client-extensions/` 폴더에서 다음 명령을 실행합니다.

```bash
../gradlew clean distBundleZip
```

zip 파일을 수동으로 배포해야 하는 경우 다음을 실행합니다.

```bash
../gradlew clean build
```

그런 다음 각 프로젝트의 `dist/` 폴더에서 서버의 `[Liferay Home]/osgi/client-extensions/` 폴더로 아카이브를 복사합니다.

## 추가 정보

* [배치 클라이언트 확장](./batch-client-extensions.md)
* [구성 클라이언트 확장](./configuration-client-extensions.md)
* [프런트 엔드 클라이언트 확장](./front-end-client-extensions.md)
* [마이크로서비스 클라이언트 확장](./microservice-client-extensions.md)
* [클라이언트 확장 패키징](./packaging-client-extensions.md)

## 튜토리얼

* [JavaScript 클라이언트 확장 사용](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md)
* [CSS 클라이언트 확장 사용](./front-end-client-extensions/tutorials/using-a-css-client-extension.md)
