# 첫 번째 CSS 클라이언트 확장 만들기

{bdg-secondary}`사용 가능한 Liferay 7.4 U45+/GA45+`

기본 CSS 클라이언트 확장은 고유한 클라이언트 확장 개발을 시작하기에 좋은 위치입니다. 테마를 개발하거나 Liferay 코드에 의존할 필요 없이 CSS 클라이언트 확장을 사용하여 Liferay의 모든 페이지에서 스타일을 재정의할 수 있습니다. 그 과정에서 [Blade CLI](../../../tooling/blade-cli.md) 을 사용하여 클라이언트 확장을 생성, 빌드 및 배포합니다.

## 전제 조건

클라이언트 확장 작업을 시작하려면 개발 환경에서 다음 요구 사항을 준비해야 합니다.

1. Java(JDK 8 또는 JDK 11)를 설치합니다.

    ```{note}
    지원되는 JDK, 데이터베이스 및 환경에 대한 정보는 [호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix)를 참조하세요. . 권장 JVM 설정은 [JVM 구성](../../../../installation-and-upgrades/references/jvm-configuration.md)을 참조하십시오.
    ```

1. [블레이드 CLI](../../../tooling/blade-cli/installing-and-updating-blade-cli.md)을 설치합니다.

1. 개발 환경을 위한 Liferay Workspace를 준비하십시오. [Blade CLI](../../../tooling/liferay-workspace/creating-a-liferay-workspace.md#creating-a-liferay-workspace-with-blade-cli) 을 사용하여 원하는 버전의 Liferay에 대해 신속하게 설정할 수 있습니다.

1. 또한 클라이언트 확장을 테스트하려면 실행 중인 Liferay 인스턴스가 있어야 합니다. [Docker 이미지로 시작](../../../../getting-started/starting-with-a-docker-image.md)하여 테스트를 위해 Liferay 인스턴스를 빠르게 시작할 수 있습니다.

이제 첫 번째 CSS 클라이언트 확장을 배포하는 데 필요한 모든 도구가 있습니다.

## Blade CLI로 클라이언트 확장 생성

Blade CLI는 CSS 확장을 포함하여 다양한 유형의 클라이언트 확장에 대한 스켈레톤을 생성할 수 있습니다. 시작하려면 다음 단계를 따르세요.

1. Liferay Workspace에서 명령줄을 열고 `client-extensions/` 폴더로 이동합니다.

    ```bash
    cd client-extensions
    ```

1. 이 명령을 실행하여 블레이드 CLI를 호출하고 새 폴더의 이름을 입력합니다.

   ```bash
   blade create -t client-extension [new-folder-name]
   ```

   이 도구는 선택할 수 있는 클라이언트 확장 유형 목록을 표시합니다.

1. 화살표 키를 사용하여 클라이언트 확장 유형 목록에서 `globalCSS` 을 강조 표시하고 Enter 키를 누릅니다. <!--TASK: Confirm Naming-->

   ![제공된 클라이언트 확장 유형 목록에서 globalCSS를 선택합니다.](./creating-your-first-css-client-extension/images/01.png)

1. 프롬프트에서 클라이언트 확장에 대해 원하는 이름을 입력합니다.

Blade CLI 도구는 `client-extensions/`내에 선택한 이름으로 하위 폴더를 생성합니다. 다음 파일이 그 안에 있습니다.

* `client-extension.yaml`: `유형` (`globalCSS`), 선택한 이름 및 생성된 URL을 포함하여 클라이언트 확장의 기본 정의를 포함하는 YAML 파일입니다. 클라이언트 확장에 대한 이 정보를 변경하려면 이 파일을 편집하십시오. *클라이언트 확장 정의를 함께 빌드하고 배포하려는 경우 이 YAML 파일에 더 많은 클라이언트 확장 정의를 추가할 수 있습니다.*

* `src/global.css`: 이 클라이언트 확장을 사용하도록 구성된 경우 페이지의 다른 CSS를 재정의하는 CSS 파일입니다. 이것은 기본적으로 CSS 클라이언트 확장의 유일한 소스 파일입니다.

이제 기본 클라이언트 확장이 있습니다. 다음으로 이 클라이언트 확장이 수행하는 작업과 해당 동작을 조정하는 방법을 살펴보겠습니다.

## 클라이언트 확장 수정 및 배포

기본적으로 `src/global.css` 파일에는 다음 코드가 포함되어 있습니다.

```css
body {
    font-family: cursive;
}
```

이로 인해 클라이언트 확장이 사용될 때 페이지의 모든 텍스트가 필기체 글꼴로 표시됩니다.

먼저 버튼의 배경색에 변경 사항을 추가합니다. `global.css` 파일을 열고 새 CSS 블록을 추가합니다. `.btn-primary` 클래스에 대한 선언 블록과 `background-color`에 대한 선언을 추가합니다.

```css
.btn-primary {
    background-color: purple;
}
```

이제 클라이언트 확장을 Liferay 테스트 인스턴스에 배포하십시오. Docker 컨테이너를 사용하는 경우 클라이언트 확장 프로그램의 루트 폴더에서 다음 명령을 실행합니다.

```bash
blade gw deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

이렇게 하면 클라이언트 확장 프로그램 Liferay의 `deploy/` 폴더가 Docker 컨테이너 내부에 빌드되고 배포됩니다.

```{note}
클라이언트 확장을 Liferay Experience Cloud 환경에 배포하려면 Liferay Cloud[명령줄 도구](https://learn.liferay.com/dxp-cloud/latest/en/reference/command-line- tool.html#) 대신 [`lcp deploy`](https://learn.liferay.com/dxp-cloud/latest/en/reference/command-line-tool.html#deploying-to-your -dxp-cloud-environment) 명령.
```

Liferay 인스턴스의 콘솔에서 배포를 확인합니다.

```
STARTED my-global-css-client-extension_1.0.0
```

이제 클라이언트 확장이 배포되었으므로 이를 사용하도록 Liferay 인스턴스를 구성해야 합니다.

## 페이지에서 클라이언트 확장 사용

배포된 클라이언트 확장을 구체적으로 사용하도록 Liferay 인스턴스에서 페이지를 구성합니다.

1. 실행 중인 Liferay 인스턴스에 로그인합니다.

1. 버튼이 하나 이상 있는 페이지에서 상단의 _편집_ 아이콘 ![Edit icon](../../../../images/icon-edit-pencil.png) 을 클릭하십시오.

1. 사이드바에서 페이지 디자인 옵션 메뉴(![Page Design Options icon](../../../../images/icon-format.png))로 이동하고 메뉴 상단에 있는 구성 아이콘(![Configuration icon](../../../../images/icon-cog3.png))을 클릭합니다.

   ![이 유형의 클라이언트 확장에 대한 구성에 액세스하려면 페이지 디자인 옵션 메뉴에서 톱니바퀴 아이콘을 클릭하십시오.](./creating-your-first-css-client-extension/images/02.png)

1. 페이지 하단의 *CSS 클라이언트 확장* 섹션에서 *CSS 클라이언트 확장 추가*을 클릭합니다.

   ![이 메뉴에서 CSS 클라이언트 확장을 추가합니다. 배포된 모든 CSS 클라이언트 확장 목록에 나타납니다.](./creating-your-first-css-client-extension/images/03.png)

1. 팝업 모달의 목록에서 CSS 클라이언트 확장을 선택하고 *추가*을 클릭합니다.

1. *저장*을 클릭합니다.

이제 클라이언트 확장이 구성되었습니다. 구성한 페이지 편집으로 돌아가서 페이지의 모든 버튼에 대한 배경색을 확인합니다. 이제 버튼의 배경색이 선택한 색상으로 나타납니다. 편집 모드 외부에서 페이지에 적용된 CSS도 보려면 페이지를 게시해야 합니다.

![클라이언트 확장 프로그램의 global.css 파일에서 버튼의 배경색을 변경한 경우 이제 페이지의 모든 버튼이 해당 색상으로 나타납니다.](./creating-your-first-css-client-extension/images/04.png)

```{tip}
페이지의 버튼에 여전히 기본 배경색이 표시되면 페이지를 강제로 새로고침하여 브라우저의 캐시를 삭제해 보세요(대부분의 브라우저에서 'CTRL + SHIFT + R'). 클라이언트 확장을 변경하고 재배포하는 경우 변경 사항을 보려면 페이지 구성에서 제거하고 다시 추가해야 할 수 있습니다.
```

## 다음 단계

축하합니다! Liferay에서 첫 번째 CSS 클라이언트 확장을 성공적으로 만들고 사용했습니다. 그런 다음 다른 클라이언트 확장 유형을 배포해 보십시오.

* [첫 번째 JS 클라이언트 확장 만들기](./creating-your-first-javascript-client-extension.md)
