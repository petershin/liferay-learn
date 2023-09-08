# 테마 파비콘 클라이언트 확장 사용

{bdg-secondary}`사용 가능 Liferay 7.4`

테마 파비콘 클라이언트 확장 기능을 사용하면 선택한 페이지에서 테마의 파비콘을 재정의할 수 있습니다. [샘플 워크스페이스](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) 에서 시작하여 클라이언트 확장 프로그램을 빌드하고 배포하세요.

## 전제 조건

클라이언트 확장 프로그램 개발을 시작하려면,

1. Java(JDK 8 또는 JDK 11)를 설치합니다.

    ```{note}
    지원되는 JDK, 데이터베이스 및 환경은 [호환성 매트릭스](https://help.liferay.com/hc/ko/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix) 에서 확인하세요. 권장 JVM 설정은 [JVM 구성](../../../../설치-업그레이드/참조/jvm-configuration.md)을 참조하세요.
    ```

1. 샘플 워크스페이스를 다운로드하여 압축을 풉니다:

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

이제 첫 번째 테마 파비콘 클라이언트 확장 프로그램을 배포할 수 있는 도구가 생겼습니다.

## 클라이언트 확장 프로그램 검토

테마 파비콘 클라이언트 확장 프로그램은 샘플 워크스페이스의 `client-extensions/liferay-sample-theme-favicon/` 폴더에 있습니다. `client-extension.yaml` 파일에 정의되어 있습니다:

```yaml
liferay-sample-theme-favicon:
    name: Liferay Sample Theme Favicon
    type: themeFavicon
    url: favicon.ico
```

클라이언트 확장 프로그램의 ID는 `liferay-sample-theme-favicon` 이며 추가할 유형 및 파비콘 파일 등 테마 파비콘 클라이언트 확장 프로그램의 주요 구성이 포함되어 있습니다. 사용 가능한 속성에 대한 자세한 내용은 [테마 파비콘 YAML 구성 참조](../theme-favicon-yaml-configuration-reference.md) 를 참조하세요.

또한 `assemble` YAML 블록이 포함되어 있습니다:

```yaml
assemble:
    - from: assets
      into: static
```

이는 `assets/` 폴더의 모든 항목이 빌드된 클라이언트 확장자 `.zip` 파일에 정적 리소스로 포함되도록 지정합니다. 테마 파비콘 클라이언트 확장에 있는 파비콘 파일은 Liferay에서 정적 리소스로 사용됩니다.

## Liferay에 클라이언트 확장 프로그램 배포

```{include} /_snippets/run-liferay-portal.md
```

Liferay가 시작되면 샘플 작업공간의 클라이언트 확장 폴더에서 다음 명령을 실행합니다.

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

이렇게 하면 클라이언트 확장 프로그램이 빌드되고 Liferay의 `deploy/` 폴더에 zip이 배포됩니다.

```{note}
클라이언트 확장을 Liferay Experience Cloud에 배포하려면 Liferay Cloud [명령줄 도구](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool) 를 사용하여 [`lcp deploy`](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment) 를 실행합니다.
```

```{tip}
워크스페이스에 모든 클라이언트 확장 프로그램을 동시에 배포하려면 `client-extensions/` 폴더에서 명령을 실행하세요.
```

Liferay 인스턴스의 콘솔에서 배포를 확인합니다:

```bash
STARTED liferay-sample-theme-favicon_1.0.0
```

## 페이지에서 클라이언트 확장 프로그램 사용

<!-- Should we suggest doing this to the pages of a Site Template? -->
배포된 클라이언트 확장 프로그램을 사용하도록 Liferay에서 페이지를 구성합니다:

1. 페이지에서 상단의 **수정**(![Edit icon](../../../../images/icon-edit-pencil.png))을 클릭합니다.

1. 사이드바에서 페이지 디자인 옵션 메뉴(![Page Design Options icon](../../../../images/icon-format.png))로 이동하여 메뉴 상단에 있는 **구성**(![Configuration icon](../../../../images/icon-cog3.png))을 클릭합니다.

1. **파비콘** 섹션의 **룩앤필** 탭에서 **파비콘 변경** 을 클릭합니다.

1. **클라이언트 확장 프로그램** 을 클릭하고 새로 배포된 파비콘(**샘플 테마 파비콘**)을 선택합니다.

   ![샘플 테마 파비콘 클라이언트 확장을 선택하고 저장을 클릭합니다.](./using-a-theme-favicon-client-extension/images/01.gif)

1. 아래로 스크롤하여 **저장** 을 클릭합니다.

1. 페이지로 돌아갑니다. 새 파비콘이 브라우저 탭에 나타납니다.

![새 파비콘이 브라우저 탭에 나타납니다.](./using-a-theme-favicon-client-extension/images/02.png)

## 다음 단계

Liferay에서 테마 파비콘 클라이언트 확장을 성공적으로 사용했습니다. 다음으로 다른 클라이언트 확장 유형을 배포해 보세요.

* [CSS 클라이언트 확장 사용](./using-a-css-client-extension.md)
* [JS 클라이언트 확장 사용](./using-a-javascript-client-extension.md)
