# 첫 번째 JavaScript 클라이언트 확장 만들기

{bdg-secondary}`사용 가능한 Liferay 7.4 U45+/GA45+`

기본 JavaScript 클라이언트 확장은 고유한 클라이언트 확장 개발을 시작하기에 좋은 사이트입니다. JS 클라이언트 확장을 사용하여 Liferay 코드에 대한 종속성이나 테마 개발에 대한 걱정 없이 Liferay의 모든 페이지에서 자체 JavaScript를 실행할 수 있습니다. [블레이드 CLI](../../../tooling/blade-cli.md) 을 사용하여 클라이언트 확장을 생성, 빌드 및 배포합니다.

## 전제 조건

클라이언트 확장 작업을 시작하려면 개발 환경에서 다음 요구 사항을 준비해야 합니다.

1. Java(JDK 8 또는 JDK 11)를 설치합니다.

   ```{note}
   지원되는 JDK, 데이터베이스 및 환경에 대한 정보는 [호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix)를 참조하세요. . 권장 JVM 설정은 [JVM 구성](../../../../installation-and-upgrades/references/jvm-configuration.md)을 참조하십시오.
   ```

1. [블레이드 CLI](../../../tooling/blade-cli/installing-and-updating-blade-cli.md)을 설치합니다.

1. 개발 환경을 위한 Liferay Workspace를 준비하십시오. [Blade CLI](../../../tooling/liferay-workspace/creating-a-liferay-workspace.md#creating-a-liferay-workspace-with-blade-cli) 을 사용하여 원하는 버전의 Liferay에 대해 빠르게 설정할 수 있습니다.

1. 또한 클라이언트 확장을 테스트하려면 실행 중인 Liferay 인스턴스가 있어야 합니다. [Docker 이미지로 시작](../../../../getting-started/starting-with-a-docker-image.md)하여 테스트를 위해 Liferay 인스턴스를 빠르게 시작할 수 있습니다.

이제 첫 번째 JS 클라이언트 확장을 배포하는 데 필요한 모든 도구가 있습니다.

## Blade CLI로 클라이언트 확장 생성

Blade CLI는 JS 확장을 포함하여 다양한 유형의 클라이언트 확장에 대한 스켈레톤을 생성합니다.

1. Liferay Workspace에서 명령줄을 열고 `client-extensions/` 폴더로 이동합니다.

    ```bash
    cd client-extensions
    ```

1. 이 명령을 실행하여 블레이드 CLI를 호출하고 생성할 새 폴더에 대해 원하는 이름을 입력합니다.

   ```bash
   blade create -t client-extension [new-folder-name]
   ```

   이 도구는 클라이언트 확장 유형 목록을 표시합니다.

1. 화살표 키를 사용하여 클라이언트 확장 유형 목록에서 `globalJS` 을 강조 표시하고 Enter 키를 누릅니다.

    ![제공된 클라이언트 확장 유형 목록에서 globalJS를 선택합니다.](./creating-your-first-javascript-client-extension/images/01.png)

1. 프롬프트에서 클라이언트 확장에 대해 원하는 이름을 입력합니다.

Blade CLI 도구는 `client-extensions/`내에 선택한 이름으로 하위 폴더를 생성합니다. 다음 파일이 그 안에 있습니다.

* `client-extension.yaml`: `유형` (`globalJS`), 선택한 이름 및 생성된 URL을 포함하여 클라이언트 확장의 기본 정의를 포함하는 YAML 파일입니다. 클라이언트 확장에 대한 이 정보를 변경하려면 이 파일을 편집하십시오. *클라이언트 확장 정의를 함께 빌드하고 배포하려는 경우 이 YAML 파일에 더 많은 클라이언트 확장 정의를 추가할 수 있습니다.*

* `src/global.js`: 이 클라이언트 확장을 사용하도록 페이지를 구성할 때 자동으로 실행되는 JS 파일입니다. 이것은 기본적으로 JS 클라이언트 확장의 유일한 소스 파일입니다.

이제 기본 클라이언트 확장이 있습니다. 다음으로 이 클라이언트 확장이 수행하는 작업과 해당 동작을 조정하는 방법을 확인합니다.

## 클라이언트 확장 검사 및 배포

기본적으로 `src/global.js` 파일에는 다음 코드 줄이 포함되어 있습니다.

```js
window.alert('Global JavaScript deployed.');
```

이로 인해 페이지를 열 때 주어진 메시지와 함께 경고 상자가 나타납니다. 실행하려는 추가 JavaScript를 이 파일에 추가하십시오.

그런 다음 클라이언트 확장을 Liferay 테스트 인스턴스에 배포합니다. Docker 컨테이너에서 Liferay를 실행하는 경우 클라이언트 확장 프로그램의 루트 폴더에서 다음 명령을 실행합니다.

```bash
blade gw deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

이렇게 하면 클라이언트 확장이 빌드되어 Docker 컨테이너 내의 Liferay의 `deploy/` 폴더에 배포됩니다.

```{note}
클라이언트 확장을 Liferay Experience Cloud 환경에 배포하려면 Liferay Cloud[명령줄 도구](https://learn.liferay.com/dxp-cloud/latest/en/reference/command-line- tool.html#) 대신 [`lcp deploy`](https://learn.liferay.com/dxp-cloud/latest/en/reference/command-line-tool.html#deploying-to-your -dxp-cloud-environment) 명령.
```

Liferay 인스턴스의 콘솔에서 배포를 확인합니다.

```
STARTED my-global-js-client-extension_1.0.0
```

이제 클라이언트 확장이 성공적으로 배포되었으므로 이를 사용하도록 Liferay 인스턴스를 구성해야 합니다.

## 페이지에서 클라이언트 확장 사용

배포된 클라이언트 확장을 사용하려면 Liferay 인스턴스에서 페이지를 구성해야 합니다. 사용 중인 JS를 보려면 다음 단계를 따르세요.

1. 실행 중인 Liferay 인스턴스에 로그인합니다.

1. 아무 페이지에서나 맨 위에 있는 *편집* 아이콘 ![Edit icon](../../../../images/icon-edit-pencil.png) 을 클릭합니다.

1. 사이드바에서 페이지 디자인 *옵션* 메뉴(![Page Design Options icon](../../../../images/icon-format.png))로 이동하고 메뉴 상단에 있는 *구성* 아이콘(![Configuration icon](../../../../images/icon-cog3.png))을 클릭합니다.

   ![이 유형의 클라이언트 확장에 대한 구성에 액세스하려면 페이지 디자인 옵션 메뉴에서 톱니바퀴 아이콘을 클릭하십시오.](./creating-your-first-javascript-client-extension/images/02.png)

1. *Advanced* 탭을 클릭하고 *JavaScript* 섹션을 페이지 하단으로 확장하여 *JavaScript Client Extensions* 구성 섹션을 찾습니다.

1. *JavaScript 클라이언트 확장 추가* 버튼을 클릭하여 새 클라이언트 확장을 추가합니다(페이지 헤드 또는 페이지 하단에).

   ![이 메뉴에서 JavaScript 클라이언트 확장을 추가하십시오. 페이지 헤드 또는 페이지 하단에 추가했는지 여부에 따라 목록에 나타납니다.](./creating-your-first-javascript-client-extension/images/03.png)

1. *저장*을 클릭합니다.

1. 필요에 따라 편집 모드 외부의 페이지에서 실행할 JavaScript 페이지를 게시합니다.

이제 클라이언트 확장이 구성되었으며 실제로 작동하는 것을 볼 수 있습니다. 구성한 페이지로 다시 이동하면 클라이언트 확장 프로그램의 메시지와 함께 경고 창이 팝업되는 것을 볼 수 있습니다. 편집 모드 외부에서 페이지를 볼 때 JavaScript도 실행되도록 하려면 페이지를 게시해야 합니다.

![이 예제 클라이언트 확장은 페이지가 로드될 때 경고 메시지 팝업을 생성합니다.](./creating-your-first-javascript-client-extension/images/04.png)

```{tip}
처음에 경고 창이 나타나지 않으면 페이지를 강제로 새로고침하여 브라우저의 캐시를 지우십시오(대부분의 브라우저에서 'CTRL + SHIFT + R'). 클라이언트 확장을 변경하고 재배포하는 경우 변경 사항을 보려면 페이지의 재구성에서 제거하고 다시 추가해야 할 수 있습니다.
```

## 다음 단계

축하합니다! Liferay에서 첫 번째 JS 클라이언트 확장을 성공적으로 만들고 사용했습니다. 그런 다음 다른 클라이언트 확장 유형을 배포해 보십시오.

* [첫 번째 CSS 클라이언트 확장 만들기](./creating-your-first-css-client-extension.md)
