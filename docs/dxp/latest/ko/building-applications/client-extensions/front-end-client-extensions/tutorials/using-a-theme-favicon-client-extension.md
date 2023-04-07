# 테마 Favicon 클라이언트 확장 사용

{bdg-secondary}`사용 가능한 Liferay 7.4 U45+/GA45+`

테마 favicon 클라이언트 확장을 사용하면 선택한 페이지에서 테마의 favicon을 재정의할 수 있습니다. [샘플 작업 공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) 로 시작하여 클라이언트 확장을 빌드하고 배치하십시오.

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

이제 첫 번째 테마 favicon 클라이언트 확장을 배포할 수 있는 도구가 있습니다.

## 클라이언트 확장 검사

테마 favicon 클라이언트 확장은 샘플 작업 공간의 `client-extensions/liferay-sample-theme-favicon/` 폴더에 있습니다. `client-extension.yaml` 파일에 정의되어 있습니다.

```yaml
liferay-sample-theme-favicon:
    name: Liferay Sample Theme Favicon
    type: themeFavicon
    url: favicon.ico
```

클라이언트 확장은 ID `liferay-sample-theme-favicon` 가지며 유형 및 추가할 favicon 파일을 포함하여 테마 favicon 클라이언트 확장에 대한 주요 구성을 포함합니다. 사용 가능한 속성에 대한 자세한 내용은 [Theme Favicon YAML 구성 참조](../theme-favicon-yaml-configuration-reference.md) 참조하세요.

또한 `조립` YAML 블록도 포함합니다.

```yaml
assemble:
    - from: assets
      into: static
```

이는 `assets/` 폴더의 모든 항목이 빌드된 클라이언트 확장 `.zip` 파일에 정적 리소스로 포함되어야 함을 지정합니다. 테마 favicon 클라이언트 확장의 favicon 파일은 Liferay에서 정적 리소스로 사용됩니다.

## Liferay에 클라이언트 확장 배포
```{include} /_snippets/run-liferay-portal.md
```

Once Liferay starts, run this command from the client extension's folder in the sample workspace:

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

```bash
STARTED liferay-sample-theme-favicon_1.0.0
```

## 페이지에서 클라이언트 확장 사용

<!-- Should we suggest doing this to the pages of a Site Template? -->
배포된 클라이언트 확장을 사용하도록 Liferay에서 페이지를 구성합니다.

1. 페이지에서 상단의 **편집**(![Edit icon](../../../../images/icon-edit-pencil.png))을 클릭합니다.

1. 사이드바에서 페이지 디자인 옵션 메뉴(![Page Design Options icon](../../../../images/icon-format.png))로 이동하고 메뉴 상단에서 **구성**(![Configuration icon](../../../../images/icon-cog3.png))를 클릭합니다.

1. **Look and Feel** 탭 아래의 **Favicon** 섹션에서 **Change Favicon** 클릭합니다.

1. **Client Extensions** 클릭하고 새로 배치된 favicon인 **Sample Theme Favicon** 을 선택합니다.

   ![샘플 테마 Favicon 클라이언트 확장을 선택하고 저장을 클릭합니다.](./using-a-theme-favicon-client-extension/images/01.gif)

1. 아래로 스크롤하여 **저장** 클릭합니다.

1. 페이지로 돌아갑니다. 새 파비콘이 브라우저 탭에 나타납니다.

![새 파비콘이 브라우저 탭에 나타납니다.](./using-a-theme-favicon-client-extension/images/02.png)

## 다음 단계

Liferay에서 테마 favicon 클라이언트 확장을 성공적으로 사용했습니다. 그런 다음 다른 클라이언트 확장 유형을 배포해 보십시오.

* [CSS 클라이언트 확장 사용](./using-a-css-client-extension.md)
* [JS 클라이언트 확장 사용](./using-a-javascript-client-extension.md)
