# CSS 클라이언트 확장 사용

{bdg-secondary}`사용 가능한 Liferay 7.4 U45+/GA45+`

CSS 클라이언트 확장을 사용하면 Liferay 코드에 대한 테마 또는 종속성 없이 페이지 스타일을 재정의할 수 있습니다. 클라이언트 확장으로 시작하십시오( [샘플 작업 공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) 에서).

## 전제 조건

클라이언트 확장 프로그램 개발을 시작하려면

1. Java(JDK 8 또는 JDK 11)를 설치합니다.

   ```{note}
   지원되는 JDK, 데이터베이스 및 환경에 대한 [호환성 매트릭스](https://help.liferay.com/hc/ko/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) 를 확인하세요. 권장 JVM 설정은 [JVM 구성](../../../../installation-and-upgrades/reference/jvm-configuration.md)을 참조하십시오.
   ```

1. 샘플 작업 공간을 다운로드하고 압축을 풉니다.

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

이제 첫 번째 CSS 클라이언트 확장을 배포할 수 있는 도구가 있습니다.

## 클라이언트 확장 검사 및 수정

CSS 클라이언트 확장은 샘플 작업공간의 `client-extensions/sample-global-css/` 폴더에 있습니다. `client-extension.yaml` 파일에 정의되어 있습니다.

```yaml
sample-global-css:
    name: Sample Global CSS
    type: globalCSS
    url: global.css
```

클라이언트 확장은 ID `sample-global-css` 가지며 `유형` 및 추가할 CSS 파일을 포함하여 CSS 클라이언트 확장에 대한 주요 구성을 포함합니다. 사용 가능한 속성에 대한 자세한 내용은 [CSS YAML 구성 참조](../css-yaml-configuration-reference.md) 을 참조하세요.

또한 `조립` 블록도 포함합니다.

```yaml
assemble:
    - from: assets
      include: "**/*"
      into: static
```

이는 `assets/` 폴더의 모든 항목이 빌드된 클라이언트 확장 `.zip` 파일에 정적 리소스로 포함되어야 함을 지정합니다. CSS 클라이언트 확장의 CSS 파일은 Liferay에서 정적 리소스로 사용됩니다.

`assets/global.css` 파일에는 다음 CSS가 포함되어 있습니다.

```css
body {
    color: #0054f0;
}
```

클라이언트 확장이 활성화된 경우 페이지의 `본문` 색상을 수정합니다.

버튼의 배경색을 수정하려면 CSS를 추가하십시오. `global.css` 파일을 열고 `.btn-primary` 클래스에 대한 선언을 추가하고 `background-color`지정합니다.

```css
.btn-primary {
    background-color: purple;
}
```

이제 클라이언트 확장을 배포합니다.

## Liferay에 클라이언트 확장 배포

```{include} /_snippets/run-liferay-portal.md
```

Liferay가 시작되면 샘플 작업 공간의 클라이언트 확장 폴더에서 이 명령을 실행합니다.

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

이렇게 하면 클라이언트 확장이 빌드되고 zip이 Liferay의 `deploy/` 폴더에 배포됩니다.

```{note}
클라이언트 확장을 Liferay Experience Cloud에 배포하려면 Liferay Cloud [명령줄 도구](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) 를 사용하여 [`lcp 배포`](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment) .
```

```{tip}
작업 공간의 모든 클라이언트 확장을 동시에 배포하려면 `client-extensions/` 폴더에서 명령을 실행합니다.
```

Liferay 인스턴스의 콘솔에서 배포를 확인합니다.

```
STARTED sample-global-css_1.0.0
```

이제 클라이언트 확장이 배포되었으므로 이를 사용하도록 Liferay를 구성합니다.

## 페이지에서 클라이언트 확장 사용

배포된 클라이언트 확장을 사용하도록 Liferay에서 페이지를 구성합니다.

1. 버튼이 하나 이상 있는 페이지에서 상단의 **편집** 아이콘 ![Edit icon](../../../../images/icon-edit-pencil.png) 을 클릭합니다.

1. 사이드바에서 페이지 디자인 옵션 메뉴(![Page Design Options icon](../../../../images/icon-format.png))로 이동하고 메뉴 상단에 있는 구성 아이콘(![Configuration icon](../../../../images/icon-cog3.png))을 클릭합니다.

   ![이 클라이언트 확장의 구성에 액세스하려면 페이지 디자인 옵션 메뉴에서 톱니바퀴 아이콘을 클릭하십시오.](./using-a-css-client-extension/images/01.png)

1. 페이지 하단의 **CSS 클라이언트 확장** 섹션에서 **CSS 클라이언트 확장 추가** 을 클릭합니다.

   ![목록에서 CSS 클라이언트 확장을 추가합니다.](./using-a-css-client-extension/images/02.png)

1. 팝업 모달에서 CSS 클라이언트 확장을 선택하고 **추가** 클릭합니다.

1. **저장** 클릭합니다.

이제 클라이언트 확장이 구성되었습니다. 페이지 편집기에서 버튼의 배경색은 이제 CSS에서 지정하는 색상입니다. 편집 모드 외부에서 페이지에 적용된 CSS를 보려면 페이지를 게시해야 합니다.

![클라이언트 확장 프로그램의 global.css 파일에서 배경색을 변경한 경우 페이지의 모든 버튼이 변경되었습니다.](./using-a-css-client-extension/images/03.png)

```{tip}
페이지의 버튼이 여전히 기본 배경색을 표시하는 경우 페이지를 강제로 새로고침하여 브라우저의 캐시를 지웁니다(대부분의 브라우저에서 'CTRL + SHIFT + R'). 클라이언트 확장을 변경하고 재배포하는 경우 변경 사항을 보려면 페이지에서 제거하고 다시 추가해야 할 수 있습니다.
```

## 다음 단계

Liferay에서 CSS 클라이언트 확장을 성공적으로 사용했습니다. 그런 다음 다른 클라이언트 확장 유형을 배포해 보십시오.

* [JS 클라이언트 확장 사용](./using-a-javascript-client-extension.md)
