# IFrame 클라이언트 확장 사용

{bdg-secondary}`라이프레이 7.4 이상 사용 가능`

IFrame 클라이언트 확장은 Liferay의 프런트엔드 인프라를 사용하여 외부 애플리케이션을 `<iframe>` HTML 요소로 등록합니다. Liferay 페이지에 위젯으로 추가됩니다. 다른 프런트엔드 클라이언트 확장 프로그램과 달리 IFrame은 정적 리소스를 제공하지 않습니다.

```{warning}
IFrame 클라이언트 확장은 개발 중이며 현재 Liferay 7.4에서는 지원되지 않습니다.
```

[샘플 워크스페이스](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace)에서 클라이언트 확장으로 시작하세요.


## 전제 조건

클라이언트 확장 프로그램 개발을 시작하려면,

1. Java(JDK 8 또는 JDK 11)를 설치합니다.

   ```{note}
   지원되는 JDK, 데이터베이스 및 환경은 [호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix)에서 확인하세요. 권장 JVM 설정은 [JVM 구성](../../../../설치-업그레이드/참조/jvm-configuration.md)을 참조하세요.
   ```

1. 샘플 워크스페이스를 다운로드하여 압축을 풉니다:

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

이제 IFrame 클라이언트 확장 프로그램을 배포할 수 있는 도구가 생겼습니다.

## 로드할 IFrame 클라이언트 확장 프로그램의 URL을 지정합니다.

`client-extensions/liferay-sample-iframe-1/client-extension.yaml` 파일은 샘플 작업 영역에서 IFrame 클라이언트 확장 프로젝트를 정의합니다:

```yaml
liferay-sample-iframe-1-counter-app:
    name: Counter App
    type: iframe
    url: https://arnab-datta.github.io/counter-app
```

이 클라이언트 확장 프로그램의 ID는 `liferay-sample-iframe-1` 이며, `이름`, `유형` 및 IFrame으로 수집할 앱의 URL 등 IFrame 클라이언트 확장 프로그램의 주요 구성이 포함되어 있습니다. 예제의 `URL` 에서 실행되는 [카운터 앱](https://github.com/arnab-datta/counter-app) 은 장바구니에 항목을 추가하는 것을 시뮬레이션하는 기본 React 앱입니다. 클라이언트 확장 프로그램을 배포한 후에는 다른 위젯과 마찬가지로 Liferay의 페이지에 앱을 추가할 수 있습니다.

사용 가능한 속성에 대한 자세한 내용은 [IFrame YAML 구성 참조](../iframe-yaml-configuration-reference.md) 를 참조하세요.

## IFrame 클라이언트 확장 배포

```{note}
클라이언트 확장을 Liferay Experience Cloud에 배포하려면 Liferay Cloud [명령줄 도구](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool)를 사용하여 [`lcp deploy`](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment)를 실행합니다.
```
```{include} /_snippets/run-liferay-portal.md
```

Next, go to the client extension's folder in the sample workspace and run

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

이렇게 하면 클라이언트 확장 프로그램이 빌드되고 Liferay의 `/deploy` 폴더에 zip이 배포됩니다.

```{tip}
워크스페이스에 모든 클라이언트 확장 프로그램을 동시에 배포하려면 `/client-extensions` 폴더에서 명령을 실행하세요.
```

Liferay 인스턴스의 콘솔에서 배포를 확인합니다:

```
STARTED liferay-sample-iframe-1_1.0.0 [1592]
```

이제 클라이언트 확장 프로그램이 배포되었으므로 이를 사용하도록 Liferay를 구성합니다.

## 위젯으로 IFrame 클라이언트 확장 추가하기

IFrame은 페이지에 위젯으로 추가됩니다.

1. 페이지 상단에서 _수정_ (![Edit](../../../../images/icon-edit-pencil.png))을 클릭합니다.

1. 페이지에 위젯을 추가합니다. 조각 및 위젯 사이드바(![Fragments and Widgets](../../../../images/icon-plus.png))에서 _위젯_을 클릭합니다.

1. 클라이언트 확장 프로그램 &rarr; 카운터 앱 위젯을 찾아 페이지로 끌어다 놓습니다. _게시_를 클릭합니다.

   ![카운터 앱을 페이지로 드래그합니다.](./using-an-iframe-client-extension/images/01.png)

몇 가지 항목을 추가하여 카운터 앱이 작동하는지 확인합니다.

## 관련 주제

* [프런트엔드 클라이언트 확장](../../front-end-client-extensions.md)
* [사용자 정의 요소 및 IFrame 클라이언트 확장 이해](../understanding-custom-element-and-iframe-client-extensions.md)
* [클라이언트 확장 프로그램 UI 참조](../remote-applications-ui-reference.md)
