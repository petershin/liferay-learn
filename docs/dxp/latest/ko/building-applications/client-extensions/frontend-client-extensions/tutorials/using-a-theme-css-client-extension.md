# 테마 CSS 클라이언트 확장 사용

{bdg-secondary}`liferay 7.4+`

테마 CSS 클라이언트 확장을 사용하면 현재 테마의 CSS 파일(`main.css` 및 `clay.css`)을 재정의하여 페이지의 모양과 느낌을 변경할 수 있습니다. [샘플 작업공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) 에서 클라이언트 확장으로 시작합니다.

## 전제 조건

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

이제 첫 번째 테마 CSS 클라이언트 확장을 배포할 수 있는 도구가 생겼습니다.

## 테마 스타일이 어떻게 재정의되는지 살펴보세요.

테마 CSS 클라이언트 확장은 샘플 작업 영역의 `client-extensions/liferay-sample-theme-css-1/` 폴더에 있습니다. 이는 `client-extension.yaml` 파일에 정의되어 있습니다.

```yaml
liferay-sample-theme-css-1:
    clayURL: css/clay.css
    mainURL: css/main.css
    name: Liferay Sample Theme CSS 1
    type: themeCSS
```

클라이언트 확장에는 'liferay-sample-theme-css-1' ID가 있으며 두 CSS 리소스 파일의 유형 및 경로를 포함하여 테마 CSS 클라이언트 확장에 대한 주요 구성이 포함되어 있습니다. 사용 가능한 속성에 대한 자세한 내용은 테마 [테마 CSS YAML 구성 참조](../theme-css-yaml-configuration-reference.md) 참조하세요.

여기에는 `assemble` YAML 블록도 포함되어 있습니다.

```yaml
assemble:
    - from: build/buildTheme/img
      into: static/img
```

이는 테마를 빌드한 후 `build/buildTheme/img/` 폴더의 모든 항목이 빌드된 클라이언트 확장 `.zip` 파일에 정적 리소스로 포함되어야 함을 지정합니다. 테마 CSS 클라이언트 확장에 포함된 이미지 파일은 Liferay에서 정적 리소스로 사용됩니다.

`package.json` 파일에는 다음 코드가 포함되어 있습니다.

```json
{
   "dependencies": {
      "sassy-inputs": "1.0.6"
   },
   "liferayDesignPack": {
      "baseTheme": "styled"
   },
   "main": "package.json",
   "name": "@liferay/liferay-sample-theme-css-1",
   "version": "1.0.0"
}
```

`종속성` 섹션에는 `sassy-inputs` 라이브러리가 포함되어 있습니다. 이는 예제에서는 사용되지 않지만 테마 CSS 클라이언트 확장에서 npm 모듈을 가져와 사용하는 방법을 보여줍니다. `liferayDesignPack` 섹션은 스타일에 사용되는 기본 테마를 선언합니다. 'styled' 테마를 사용하면 페이지, 조각 및 위젯에 지정된 기존 스타일이 영향을 받지 않습니다. 다른 필드 'main', 'name' 및 'version'은 필수 메타데이터를 제공합니다.

```{note}
기본 테마를 `styled` 또는 `unstyled`로 설정할 수 있습니다. 스타일이 지정되지 않은 테마에는 기본 스타일 세트가 포함되어 있으며 '스타일이 지정된' 테마에는 추가 스타일과 함께 '스타일이 지정되지 않은' 테마의 모든 스타일이 포함되어 있습니다. Liferay의 모든 테마는 '스타일 없음' 또는 '스타일 있음' 테마를 기본으로 사용합니다. 

다른 테마를 사용하는 페이지에 테마 CSS 클라이언트 확장을 적용하면 클라이언트 확장의 스타일이 테마의 스타일을 **대체**합니다. 원래 테마에 사용자 정의 스타일이 있는 경우 해당 스타일을 `_custom.scss` 파일에 추가하여 클라이언트 확장을 적용할 때 해당 요소가 영향을 받지 않도록 하세요.

이미 테마 CSS 클라이언트 확장을 사용하는 페이지의 테마를 변경하면 클라이언트 확장이 제거됩니다.
```

`src/css/_custom.scss` 파일에는 다음 SCSS가 포함되어 있습니다.

```css
@import 'sassy-inputs/sass/main';

header {
   background-image: url(../img/header_bg.jpg); 
}
```

첫 번째 줄은 `package.json`에 추가된 npm 모듈을 가져옵니다. CSS는 이미지를 배경으로 사용하도록 헤더를 수정합니다.

```{note}
귀하의 코드는 `_custom.scss` 내부에 있고 `client-extension.yaml` 파일은 `clay.css` 및 `main.css`를 가리킵니다. 이는 테마 CSS 클라이언트 확장이 전체 Clay CSS 빌드 프로세스를 실행하여 `_custom.scss`에서 컴파일된 CSS 코드도 포함하는 컴파일된 `clay.css` 및 `main.css` 파일을 생성하기 때문입니다.
```

## 테마 CSS 수정

CSS를 추가하여 모든 이미지에 호버 효과를 만듭니다. `_custom.scss` 파일을 열고 `img:hover`에 대한 선언을 추가합니다.

```css
img:hover{
   border: 2px solid red;
   border-radius: 10%;
}
```

이는 이미지를 '2px' 빨간색 테두리와 마우스 오버 시 둥근 모서리로 정의합니다.

이제 클라이언트 확장을 배포합니다.

## 테마 CSS 클라이언트 확장 배포

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

```bash
STARTED liferay-sample-theme-css-1_1.0.0
```

## 페이지의 테마 재정의

새 테마 CSS를 사용하도록 페이지를 구성합니다.

1. 페이지 상단의 **편집**(![편집 아이콘](../../../../images/icon-edit-pencil.png))을 클릭하세요.

1. 사이드바에서 **페이지 디자인 옵션** 메뉴(![페이지 디자인 옵션 아이콘](../../../../images/icon-format.png))로 이동하여 **구성**(![구성 아이콘]을 클릭합니다. (../../../../images/icon-cog3.png)) 메뉴 상단에 있습니다.

1. 룩앤필 탭 아래 테마 CSS 클라이언트 확장 섹션에서 **추가**(![추가](../../../../images/icon-duplicate.png))를 클릭합니다.

1. 새로 배포된 클라이언트 확장인 **Liferay 샘플 테마 CSS 1** 을 선택합니다.

   ![Select the Sample Theme CSS client extension and click Save.](./using-a-theme-css-client-extension/images/01.png)

1. 아래로 스크롤하여 **저장** 을 클릭하세요.

페이지 편집기에서 헤더의 배경은 이미지이며, 마우스를 올려놓은 모든 링크의 배경과 텍스트 색상이 변경되었습니다. 편집 모드 외부에서 페이지에 적용된 변경 사항을 보려면 페이지를 게시해야 합니다.

![The new theme appears on the selected page.](./using-a-theme-css-client-extension/images/02.gif)

## 다음 단계

Liferay에서 테마 CSS 클라이언트 확장을 성공적으로 사용했습니다. 다음으로 다른 클라이언트 확장 유형을 배포해 보세요.

* [CSS 클라이언트 확장 사용하기](./using-a-css-client-extension.md)
* [JS 클라이언트 확장 사용하기](./using-a-javascript-client-extension.md)
* [테마 Favicon 클라이언트 확장 사용하기](./using-a-theme-favicon-client-extension.md)
* [테마 스프라이트 맵 클라이언트 확장 사용하기](./using-a-theme-spritemap-client-extension.md)
