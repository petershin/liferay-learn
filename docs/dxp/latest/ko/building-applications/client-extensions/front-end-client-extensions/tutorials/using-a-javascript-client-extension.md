# JavaScript 클라이언트 확장 사용

{bdg-secondary}`liferay 7.4+`

JavaScript(JS) 클라이언트 확장을 사용하면 Liferay 코드에 대한 종속성이나 테마 개발에 대한 걱정 없이 Liferay의 모든 페이지에서 자신만의 JavaScript를 실행할 수 있습니다. 여기서는 JavaScript 클라이언트 확장( [샘플 작업공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) )으로 시작합니다.

## 전제 조건

클라이언트 확장 개발을 시작하려면,

1. Java(JDK 8 또는 JDK 11)를 설치합니다.

   ```{note}
   지원되는 JDK, 데이터베이스 및 환경에 대해서는 [호환성 매트릭스](https://help.liferay.com/hc/ko/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) 확인하세요. 권장되는 JVM 설정은 [JVM 구성](../../../../installation-and-upgrades/reference/jvm-configuration.md) 참조하세요.
   ```

1. 샘플 작업공간을 다운로드하고 압축을 풉니다.

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

필요한 모든 도구와 JS 클라이언트 확장이 샘플 작업공간에 포함되어 있습니다.

## 클라이언트 확장 검사

JS 클라이언트 확장은 작업 영역의 `client-extensions/liferay-sample-global-js/` 폴더에 있습니다. 이는 `client-extension.yaml` 파일에 정의되어 있습니다:

```yaml
liferay-sample-global-js:
    name: Liferay Sample Global JS
    type: globalJS
    url: global.js
```

클라이언트 확장에는 ID `liferay-sample-global-js`가 있으며 추가할 `type` 및 JavaScript 파일을 포함하여 JS 클라이언트 확장에 대한 주요 구성이 포함되어 있습니다. 속성에 대한 자세한 내용은 [JavaScript YAML 구성 참조](../javascript-yaml-configuration-reference.md) 참조하세요.

여기에는 `assemble` 블록도 포함되어 있습니다:

```yaml
assemble:
    - from: assets
      into: static
```

이는 `assets/` 폴더의 모든 항목이 빌드된 클라이언트 확장 `.zip` 파일에 정적 리소스로 포함되어야 함을 지정합니다. JS 클라이언트 확장의 JavaScript 코드는 Liferay에서 정적 리소스로 사용됩니다.

`assets/global.js` 파일에는 다음 코드 줄이 포함되어 있습니다.

```js
window.alert('Sample Global JS deployed.');
```

페이지를 열면 메시지와 함께 경고 상자가 나타납니다. 이 파일에 추가하여 추가 JavaScript를 실행하십시오.

## Liferay에 클라이언트 확장 배포

```{include} /_snippets/run-liferay-portal.md
```

Liferay가 시작되면 샘플 작업 공간의 클라이언트 확장 폴더에서 다음 명령을 실행합니다.

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

그러면 클라이언트 확장이 빌드되고 zip이 Liferay의 `deploy/` 폴더에 배포됩니다.

```{note}
클라이언트 확장을 Liferay Experience Cloud에 배포하려면 Liferay Cloud [명령줄 도구](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) [명령줄 도구](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment) 실행합니다.
```

```{tip}
워크스페이스에 모든 클라이언트 확장을 동시에 배포하려면 `client-extensions/` 폴더에서 명령을 실행하세요.
```

Liferay 인스턴스 콘솔에서 배포를 확인합니다.

```
STARTED sample-global-js_1.0.0
```

클라이언트 확장이 성공적으로 배포되면 이를 사용하도록 Liferay를 구성하세요.

## 페이지에서 클라이언트 확장 사용

배포된 클라이언트 확장을 사용하도록 Liferay에서 페이지를 구성합니다.

1. 인스턴스의 페이지 상단에 있는 **편집** 아이콘 ![편집 아이콘](../../../../images/icon-edit-pencil.png)을 클릭합니다.

1. 사이드바에서 페이지 디자인 **옵션** 메뉴(![페이지 디자인 옵션 아이콘](../../../../images/icon-format.png))로 이동한 후 **구성** 을 클릭합니다. 메뉴 상단의 아이콘(![구성 아이콘](../../../../images/icon-cog3.png)).

   ![Click the cog wheel icon in the Page Design Options menu to access this client extension's configurations.](./using-a-javascript-client-extension/images/01.png)

1. **고급** 탭을 클릭하고 페이지 하단의 **JavaScript** 섹션을 확장하여 **JavaScript 클라이언트 확장** 구성 섹션을 찾습니다.

1. 페이지 머리글이나 페이지 하단에 새 클라이언트 확장을 추가하려면 **JavaScript 클라이언트 확장 추가** 를 클릭하세요.

   ![JavaScript 클라이언트 확장을 추가합니다. 페이지 머리글에 추가했는지 페이지 하단에 추가했는지에 따라 목록에 나타납니다.](./using-a-javascript-client-extension/images/02.png)

1. **저장** 을 클릭하세요.

1. 선택적으로 편집 모드 외부의 페이지에서 JavaScript가 실행되도록 페이지를 게시합니다.

이제 클라이언트 확장이 구성되어 활성화되었습니다. 구성한 페이지에서 클라이언트 확장 프로그램의 메시지와 함께 경고 창이 팝업되는 것을 볼 수 있습니다.

![This example client extension creates an alert message pop-up when the page is loaded.](./using-a-javascript-client-extension/images/03.png)

```{tip}
처음에 경고 창이 나타나지 않으면 페이지를 강제로 새로 고쳐 브라우저 캐시를 삭제하세요(대부분의 브라우저에서는 'CTRL + SHIFT + R'). 클라이언트 확장을 변경하고 다시 배포하는 경우 변경 사항을 보려면 페이지에서 해당 확장을 제거하고 다시 추가해야 할 수도 있습니다.
```

## 다음 단계

Liferay에서 JS 클라이언트 확장을 성공적으로 사용했습니다. 다음으로 다른 클라이언트 확장 유형을 배포해 보세요.

* [CSS 클라이언트 확장 사용하기](./using-a-css-client-extension.md)
