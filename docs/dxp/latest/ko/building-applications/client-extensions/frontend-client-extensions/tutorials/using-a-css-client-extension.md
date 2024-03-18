# CSS 클라이언트 확장 사용

{bdg-secondary}`liferay 7.4+`

CSS 클라이언트 확장은 페이지에 새로운 CSS 스타일을 도입합니다. 페이지에 배포된 CSS 클라이언트 확장은 테마 및 스타일 북 설정을 포함하여 페이지의 기존 스타일에 추가됩니다. 클라이언트 확장으로 시작합니다( [샘플 작업공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) 에서).

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

이제 첫 번째 CSS 클라이언트 확장을 배포할 수 있는 도구가 생겼습니다.

## 클라이언트 확장 검사 및 수정

CSS 클라이언트 확장은 샘플 작업 공간의 `client-extensions/liferay-sample-global-css/` 폴더에 있습니다. 이는 `client-extension.yaml` 파일에 정의되어 있습니다:

```yaml
liferay-sample-global-css:
    name: Liferay Sample Global CSS
    type: globalCSS
    url: global.css
```

클라이언트 확장에는 ID `liferay-sample-global-css`가 있으며 `type` 및 추가할 CSS 파일을 포함하여 CSS 클라이언트 확장에 대한 주요 구성이 포함되어 있습니다. 사용 가능한 속성에 대한 자세한 내용은 [CSS YAML 구성 참조](../css-yaml-configuration-reference.md) 참조하세요.

여기에는 `assemble` 블록도 포함되어 있습니다:

```yaml
assemble:
    - from: assets
      into: static
```

이는 `assets/` 폴더의 모든 항목이 빌드된 클라이언트 확장 `.zip` 파일에 정적 리소스로 포함되어야 함을 지정합니다. CSS 클라이언트 확장의 CSS 파일은 Liferay에서 정적 리소스로 사용됩니다.

`assets/global.css` 파일에는 다음 CSS가 포함되어 있습니다.

```css
.logo::after {
   color: #0054f0;
   content: 'Liferay Sample Global CSS';
   margin-left: 2rem;
}
```

클라이언트 확장이 활성화되면 홈 페이지의 Liferay 로고 색상이 수정됩니다.

버튼의 배경색을 수정하려면 CSS를 추가하세요. `global.css` 파일을 열고 `.btn-primary` 클래스에 대한 선언을 추가한 후 `배경색`을 지정합니다.

```css
.btn-primary {
    background-color: purple;
}
```

이제 클라이언트 확장을 배포합니다.

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
STARTED sample-global-css_1.0.0
```

이제 클라이언트 확장이 배포되었으므로 이를 사용하도록 Liferay를 구성하세요.

## 페이지에서 클라이언트 확장 사용

배포된 클라이언트 확장을 사용하도록 Liferay에서 페이지를 구성합니다.

1. 버튼이 하나 이상 있는 페이지 상단의 **편집**( ![편집 아이콘](../../../../images/icon-edit-pencil.png) )을 클릭합니다.

1. 사이드바에서 페이지 디자인 옵션 메뉴( ![페이지 디자인 옵션 아이콘](../../../../images/icon-format.png) )로 이동하여 **구성** 아이콘(! 메뉴 상단의 [구성 아이콘](../../../../images/icon-cog3.png) ).

   ![Click the configuration icon in the Page Design Options menu to access this client extension's configurations.](./using-a-css-client-extension/images/01.png)

1. 페이지 하단의 CSS 클라이언트 확장 섹션에서 **CSS 클라이언트 확장 추가** 를 클릭하세요.

   ![Add the CSS client extension from the list.](./using-a-css-client-extension/images/02.png)

1. 팝업 모달에서 CSS 클라이언트 확장을 선택하고 **추가** 를 클릭하세요.

1. **저장** 을 클릭하세요.

이제 클라이언트 확장이 구성되었습니다. 페이지 편집기에서 버튼의 배경색은 이제 CSS가 지정하는 색상입니다. 편집 모드 외부에서 페이지에 적용된 CSS를 보려면 페이지를 게시해야 합니다.

![If you changed the background color in your client extension's global.css file, all buttons on the page were changed.](./using-a-css-client-extension/images/03.png)

```{tip}
페이지의 버튼이 여전히 기본 배경색을 표시하는 경우 페이지를 강제로 새로 고쳐 브라우저 캐시를 삭제하세요(대부분의 브라우저에서는 `CTRL + SHIFT + R`). 클라이언트 확장을 변경하고 다시 배포하는 경우 변경 사항을 보려면 페이지에서 해당 확장을 제거하고 다시 추가해야 할 수도 있습니다.
```

## 다음 단계

Liferay에서 CSS 클라이언트 확장을 성공적으로 사용했습니다. 다음으로 다른 클라이언트 확장 유형을 배포해 보세요.

* [JS 클라이언트 확장 사용하기](./using-a-javascript-client-extension.md)
