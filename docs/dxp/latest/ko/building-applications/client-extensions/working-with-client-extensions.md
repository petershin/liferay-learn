# 클라이언트 확장 작업

{bdg-secondary}`7.4+`

클라이언트 확장을 사용하면 OSGi 모듈을 배포하지 않고도 Liferay를 확장할 수 있습니다. 기존 모듈 개발과 마찬가지로 클라이언트 확장은 [Liferay Workspace](../tooling/liferay-workspace.md) 에 있습니다. 배우기 시작하기

- 클라이언트 확장 개발을 시작하는 데 필요한 도구
- 구성 파일에서 클라이언트 확장을 정의하는 방법
- 클라이언트 확장을 배포하는 방법

## 필수 도구 및 설정

클라이언트 확장 개발을 시작하려면 다음 항목을 확보하십시오.

1. 자바 8 또는 JDK 11.

    ```{note}
    지원되는 JDK, 데이터베이스 및 환경에 대한 정보는 [호환성 매트릭스](https://help.liferay.com/hc/ko/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) 를 확인하세요. 권장 JVM 설정은 [JVM 구성](../../installation-and-upgrades/references/jvm-configuration.html) 을 참조하십시오.
    ```

1. Liferay 작업 공간. 예제 클라이언트 확장 프로젝트가 있는 작업공간을 다운로드하려면 다음을 실행하십시오.

    ```bash
    curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
    ```

    클라이언트 확장 프로젝트( `client-extensions/` 디렉토리에 있음)를 자신의 작업공간에 복사하거나 샘플 작업공간을 직접 사용할 수 있습니다.

1. Liferay Experience Cloud(LXC)를 사용하는 경우 [명령줄 도구](https://learn.liferay.com/liferay-cloud/latest/ko/reference/command-line-tool.html) 이 있어야 합니다.

## 클라이언트 확장 구성

클라이언트 확장은 다음 속성을 포함하는 `client-extension.yaml` 파일에 정의됩니다.

`name`: Liferay UI에 표시되는 이름을 입력합니다. UI에서 구성할 수 없는 경우 이름 값이 사용되지 않습니다.

`유형`: 클라이언트 확장의 유형을 설정합니다(예: `globalCSS`). 유형은 배포 시 Liferay가 클라이언트 확장을 처리하는 방법을 결정합니다.

`dxp.lxc.liferay.com.virtualInstanceId`: 배포할 가상 인스턴스의 ID를 입력합니다.

각 클라이언트 확장 프로젝트는 작업 공간의 `client-extensions/` 폴더 안에 있는 폴더에 있습니다. 프로젝트에는 하나 이상의 클라이언트 확장을 정의하는 단일 `client-extension.yaml` 파일이 포함되어 있습니다. 예를 들어 [the `iframe-2` 프로젝트의 `client-extension.yaml`](https://github.com/liferay/liferay-portal/blob/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-iframe-2/client-extension.yaml) 는 세 개의 `iframe` 클라이언트 확장인 `Baseball`, `Football`및 `Hockey`정의합니다.

### 추가 소스 파일

클라이언트 확장의 소스 파일은 기본적으로 프로젝트의 `src/` 폴더에 있습니다. `client-extensions.yaml` 파일에서 `assemble` 블록을 사용하여 빌드된 아카이브에 포함할 추가 파일을 지정할 수 있습니다.

```yaml
assemble:
   - from: assets
     include: "**/*"
     into: static
```

어셈블 블록에는 다음과 같은 속성이 있습니다.

`에서`: 클라이언트 확장 프로젝트에 추가 리소스가 있는 폴더를 설정합니다. 클라이언트 확장을 빌드할 때 이러한 리소스는 `.zip` 파일에 포함됩니다. 각각 `에서` 속성을 포함하는 `조립` 블록에서 여러 개의 `에서` 정의를 사용할 수 있습니다.

`include`: 단일 파일 또는 glob 구문을 입력하여 `에서` 디렉토리에서 원하는 파일을 찾습니다.

`into`: 빌드된 `.zip` 파일에서 추가 리소스를 포함할 사이트를 지정합니다. 예를 들어 많은 프런트 엔드 클라이언트 확장(예: JavaScript 또는 CSS 클라이언트 확장)의 소스 파일은 Liferay가 사이트의 정적 리소스로 제공할 수 있도록 `static` 디렉토리에 있어야 합니다.

## Liferay 인스턴스에 배포

클라이언트 확장은 배포 가능한 `.zip` 아카이브에 내장되어 있습니다. 각 클라이언트 확장 아카이브에는 클라이언트 확장의 설정이 포함된 JSON 파일이 포함되어 있습니다.

Liferay 설치를 위한 올바른 사이트에 `.zip` 파일을 배치하여 클라이언트 확장을 배포합니다. 사용할 정확한 명령은 Liferay 인스턴스가 호스팅되는 방식에 따라 다릅니다.

### LXC에 배포

LXC용 클라이언트 확장을 배포하려면

1. 작업 공간의 `client-extensions/` 폴더로 이동하여 다음을 실행합니다.

   ```bash
   ../gradlew clean build
   ```

   컴파일된 `.zip` 파일은 각 프로젝트의 `dist/` 폴더에 생성됩니다. 한 번에 하나의 프로젝트를 빌드하려면 프로젝트 폴더에서 명령을 실행하십시오.

1. 이 명령을 실행하여 선택한 환경에 각 클라이언트 확장을 배포합니다.

   ```bash
   lcp deploy --extension <extension-zip-file>
   ```

   메시지가 표시되면 프로젝트와 배포 환경을 선택합니다. 명령이 완료되면 zip 파일이 LXC 프로젝트에 업로드됩니다.

### 자체 호스팅 Liferay 인스턴스에 배포

Liferay 설치를 온프레미스에서 호스팅하는 경우 작업 영역 번들 zip을 사용하여 클라이언트 확장을 배포합니다.  클라이언트 확장을 빌드하고 배포하려면 작업 영역의 `client-extensions/` 폴더에서 다음 명령을 실행합니다.

```bash
../gradlew clean distBundleZip
```

zip 파일을 수동으로 배포해야 하는 경우 다음을 실행합니다.

```bash
../gradlew clean build
```

그런 다음 각 프로젝트의 `dist/` 폴더에서 서버의 `[Liferay Home]/osgi/client-extensions/` 폴더로 아카이브를 복사합니다.

## 추가 정보

* [프런트 엔드 클라이언트 확장](./front-end-client-extensions.md)
* [JavaScript 클라이언트 확장 사용](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md)
* [CSS 클라이언트 확장 사용](./front-end-client-extensions/tutorials/using-a-css-client-extension.md)
