# CSS 클라이언트 확장 사용

{bdg-secondary}`사용 가능 Liferay 7.4`

CSS 클라이언트 확장 기능을 사용하면 테마나 Liferay 코드에 대한 종속성 없이 페이지 스타일을 재정의할 수 있습니다. 클라이언트 확장 프로그램( [샘플 워크스페이스](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace))에서 시작하세요.

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

이제 첫 번째 CSS 클라이언트 확장 프로그램을 배포할 수 있는 도구가 생겼습니다.

## 클라이언트 확장 프로그램 검토 및 수정

CSS 클라이언트 확장 프로그램은 샘플 워크스페이스의 `client-extensions/liferay-sample-global-css/` 폴더에 있습니다. `client-extension.yaml` 파일에 정의되어 있습니다:

```yaml
liferay-sample-global-css:
    name: Liferay Sample Global CSS
    type: globalCSS
    url: global.css
```

클라이언트 확장 프로그램의 ID는 `liferay-sample-global-css` 이며, `유형` 및 추가할 CSS 파일 등 CSS 클라이언트 확장 프로그램의 주요 구성이 포함되어 있습니다. 사용 가능한 속성에 대한 자세한 내용은 [CSS YAML 구성 참조](../css-yaml-configuration-reference.md) 를 참조하세요.

또한 `assemble` 블록이 포함되어 있습니다:

```yaml
assemble:
    - from: assets
      into: static
```

이는 `assets/` 폴더의 모든 항목이 빌드된 클라이언트 확장자 `.zip` 파일에 정적 리소스로 포함되도록 지정합니다. CSS 클라이언트 확장자의 CSS 파일은 Liferay에서 정적 리소스로 사용됩니다.

`assets/global.css` 파일에 이 CSS가 포함되어 있습니다:

```css
.logo::after {
   color: #0054f0;
   content: 'Liferay Sample Global CSS';
   margin-left: 2rem;
}
```

클라이언트 확장이 활성화된 경우 홈페이지의 Liferay 로고 색상이 변경됩니다.

CSS를 추가하여 버튼의 배경색을 수정합니다. `global.css` 파일을 열고 `.btn-primary` 클래스에 대한 선언을 추가한 다음 `background-color`를 지정합니다:

```css
.btn-primary {
    background-color: purple;
}
```

이제 클라이언트 확장 프로그램을 배포합니다.

## Liferay에 클라이언트 확장 프로그램 배포
```{include} /_snippets/run-liferay-portal.md
```

Once Liferay starts, run this command from the client extension's folder in the sample workspace:

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

이렇게 하면 클라이언트 확장 프로그램이 빌드되고 Liferay의 `deploy/` 폴더에 zip이 배포됩니다.

```{note}
클라이언트 확장을 Liferay Experience Cloud에 배포하려면 Liferay Cloud [명령줄 도구](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool)를 사용하여 [`lcp deploy`](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment)를 실행합니다.
```

```{tip}
워크스페이스에 모든 클라이언트 확장 프로그램을 동시에 배포하려면 `client-extensions/` 폴더에서 명령을 실행하세요.
```

Liferay 인스턴스의 콘솔에서 배포를 확인합니다:

```
STARTED sample-global-css_1.0.0
```

이제 클라이언트 확장 프로그램이 배포되었으므로 이를 사용하도록 Liferay를 구성합니다.

## 페이지에서 클라이언트 확장 프로그램 사용

배포된 클라이언트 확장 프로그램을 사용하도록 Liferay에서 페이지를 구성합니다:

1. 버튼이 하나 이상 있는 페이지에서 상단의 _수정_ 아이콘 ![Edit icon](../../../../images/icon-edit-pencil.png) 을 클릭합니다.

1. 사이드바에서 페이지 디자인 옵션 메뉴(![Page Design Options icon](../../../../images/icon-format.png))로 이동하여 메뉴 상단의 구성 아이콘(![Configuration icon](../../../../images/icon-cog3.png))을 클릭합니다.

   ![페이지 디자인 옵션 메뉴에서 톱니바퀴 아이콘을 클릭하여 이 클라이언트 확장 기능의 구성에 액세스합니다.](./using-a-css-client-extension/images/01.png)

1. 페이지 하단의 *CSS 클라이언트 확장 기능* 섹션에서 *CSS 클라이언트 확장 기능 추가*를 클릭합니다.

   ![목록에서 CSS 클라이언트 확장자를 추가합니다.](./using-a-css-client-extension/images/02.png)

1. 팝업 모달에서 CSS 클라이언트 확장자를 선택하고 *추가*를 클릭합니다.

1. *저장*을 클릭합니다.

이제 클라이언트 확장이 구성되었습니다. 페이지 편집기에서 버튼의 배경색은 이제 CSS에서 지정한 색상이 됩니다. 편집 모드 외부에서 페이지에 적용된 CSS를 확인하려면 페이지를 게시해야 합니다.

![클라이언트 확장 프로그램의 global.css 파일에서 배경색을 변경한 경우 페이지의 모든 버튼이 변경됩니다.](./using-a-css-client-extension/images/03.png)

```{tip}
페이지의 버튼이 여전히 기본 배경색으로 표시되면 페이지를 새로 고침하여 브라우저의 캐시를 지우세요(대부분의 브라우저에서 `CTRL + SHIFT + R`). 클라이언트 확장을 변경하고 다시 배포하는 경우 변경 사항을 확인하려면 페이지에서 확장을 제거한 후 다시 추가해야 할 수 있습니다.
```

## 다음 단계

Liferay에서 CSS 클라이언트 확장을 성공적으로 사용했습니다. 다음으로 다른 클라이언트 확장 유형을 배포해 보세요.

* [JS 클라이언트 확장 사용](./using-a-javascript-client-extension.md)
