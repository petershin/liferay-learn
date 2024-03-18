# 테마 Favicon 클라이언트 확장 사용

{bdg-secondary}`liferay 7.4+`

테마 파비콘 클라이언트 확장을 사용하면 선택한 페이지에서 테마의 파비콘을 재정의할 수 있습니다. 클라이언트 확장을 빌드하고 배포하려면 [샘플 작업공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) 부터 시작하세요.

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

이제 첫 번째 테마 파비콘 클라이언트 확장을 배포할 수 있는 도구가 생겼습니다.

## 클라이언트 확장 검사

테마 파비콘 클라이언트 확장은 샘플 작업 공간의 `client-extensions/liferay-sample-theme-favicon/` 폴더에 있습니다. 이는 `client-extension.yaml` 파일에 정의되어 있습니다.

```yaml
liferay-sample-theme-favicon:
    name: Liferay Sample Theme Favicon
    type: themeFavicon
    url: favicon.ico
```

클라이언트 확장에는 `liferay-sample-theme-favicon` ID가 있으며 추가할 유형 및 파비콘 파일을 포함하여 테마 파비콘 클라이언트 확장에 대한 주요 구성이 포함되어 있습니다. 사용 가능한 속성에 대한 자세한 내용은 [Theme Favicon YAML 구성 참조](../theme-favicon-yaml-configuration-reference.md) 참조하세요.

여기에는 `assemble` YAML 블록도 포함되어 있습니다.

```yaml
assemble:
    - from: assets
      into: static
```

이는 `assets/` 폴더의 모든 항목이 빌드된 클라이언트 확장 `.zip` 파일에 정적 리소스로 포함되어야 함을 지정합니다. 테마 파비콘 클라이언트 확장의 파비콘 파일은 Liferay에서 정적 리소스로 사용됩니다.

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
작업 공간에 모든 클라이언트 확장을 동시에 배포하려면 `client-extensions/` 폴더에서 명령을 실행하세요.
```

Liferay 인스턴스 콘솔에서 배포를 확인합니다.

```bash
STARTED liferay-sample-theme-favicon_1.0.0
```

## 페이지에서 클라이언트 확장 사용

<!-- Should we suggest doing this to the pages of a Site Template? -->

배포된 클라이언트 확장을 사용하도록 Liferay에서 페이지를 구성합니다.

1. 페이지 상단의 **편집**(![편집 아이콘](../../../../images/icon-edit-pencil.png))을 클릭하세요.

1. 사이드바에서 페이지 디자인 옵션 메뉴(![페이지 디자인 옵션 아이콘](../../../../images/icon-format.png))로 이동하고 메뉴 상단에 있는 **configuration**(![구성 아이콘](../../../../images/icon-cog3.png))을 클릭합니다.

1. **Look and Feel** 탭 아래 **Favicon** 섹션에서 **Favicon 변경** 을 클릭하세요.

1. **클라이언트 확장** 을 클릭하고 새로 배포된 파비콘인 **샘플 테마 파비콘** 을 선택합니다.

   ![Select the Sample Theme Favicon client extension and click Save.](./using-a-theme-favicon-client-extension/images/01.gif)

1. 아래로 스크롤하여 **저장** 을 클릭하세요.

1. 페이지로 돌아갑니다. 새 파비콘이 브라우저 탭에 나타납니다.

![The new favicon appears on the browser tab.](./using-a-theme-favicon-client-extension/images/02.png)

## 다음 단계

Liferay에서 테마 파비콘 클라이언트 확장을 성공적으로 사용했습니다. 다음으로 다른 클라이언트 확장 유형을 배포해 보세요.

* [CSS 클라이언트 확장 사용하기](./using-a-css-client-extension.md)
* [JS 클라이언트 확장 사용하기](./using-a-javascript-client-extension.md)
