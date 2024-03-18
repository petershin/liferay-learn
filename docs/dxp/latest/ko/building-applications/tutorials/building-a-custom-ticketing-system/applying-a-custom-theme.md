# 사용자 정의 테마 적용

다양한 [프론트 엔드 클라이언트 확장](../../../building-applications/client-extensions/frontend-client-extensions.md)을 사용하여 사이트의 모양과 느낌을 사용자 지정할 수 있습니다. 특히, [테마 CSS 유형](../../../building-applications/client-extensions/frontend-client-extensions.md#theme-css-client-extensions) 클라이언트 확장을 [사용자 정의 테마 구축](../../../site-building/site-appearance/themes/introduction-to-themes.md)의 대안.

`liferay-ticket-theme-css` 클라이언트 확장을 배포합니다.

1. 다음 명령을 실행하십시오.

   ```bash
   ./gradlew :client-extensions:liferay-ticket-theme-css:deploy
   ```

1. Liferay에서 **제품 메뉴**(![제품 메뉴](../../../images/icon-product-menu.png))를 선택하고 **사이트 빌더** &rarr; **페이지** 로 이동합니다.

1. 글로벌 메뉴 옆 오른쪽 상단의 **옵션**(![옵션 아이콘](../../../images/icon-options.png))을 클릭한 후 **구성** 을 클릭하세요.

1. 테마 CSS 클라이언트 확장 섹션까지 아래로 스크롤하고 **추가**(![아이콘 추가](../../../images/icon-plus.png))를 클릭합니다.

1. 배포된 티켓 테마 CSS를 선택합니다.

   ![Select the ticket theme css client extension.](./applying-a-custom-theme/images/01.png)

1. 아래로 스크롤하여 **저장** 을 클릭하세요. 제품 메뉴에서 **홈** 을 클릭하세요. 맞춤 테마가 적용되었습니다.

## 사용자 정의 테마 CSS 코드 검사

`client-extension.yaml` 파일의 `assemble` 블록 섹션은 다음과 같습니다:

```yaml
assemble:
    - from: build/buildTheme/img
      into: static/img
```

이 `liferay-ticket-theme-css`는 [테마 CSS](../../../building-applications/client-extensions/frontend-client-extensions.md#theme-css-client- 확장) 클라이언트 확장을 입력합니다. 이는 다음과 같이 정의됩니다:

```yaml
liferay-ticket-theme-css:
    clayURL: css/clay.css
    mainURL: css/main.css
    name: Tickets Theme CSS
    type: themeCSS
```

설명은 [테마 CSS YAML 구성 참조](../../../building-applications/client-extensions/frontend-client-extensions/theme-css-yaml-configuration-reference.md)를 참조하세요. 각 속성.

테마의 사용자 정의 내용은 `/src/css` 폴더에 있는 두 파일에 나타납니다.

`_clay_variables.scss` 파일은 덮어쓸 CSS 클레이 변수를 제공합니다.

`_custom.scss` 파일은 CSS 사용자 정의를 제공합니다.

변수 및 맞춤설정에 대한 자세한 내용은 [Clay CSS](https://clayui.com/docs/css/index.html) 문서를 참조하세요. 그리고 [테마 CSS 클라이언트 확장 사용](../../../building-applications/client-extensions/frontend-client-extensions/tutorials/using-a-theme-css-client-extension. md) 다른 클라이언트 확장 예를 확인하세요.

다음: [사용자 정의 티켓팅 애플리케이션 배포](./deploying-a-custom-application.md).

## 관련 개념

* [테마 소개](../../../site-building/site-appearance/themes/introduction-to-themes.md)
* [프런트엔드 클라이언트 확장](../../../building-applications/client-extensions/frontend-client-extensions.md)
