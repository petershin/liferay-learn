# 테마 기여자를 통해 독립적인 UI 리소스 번들링

테마 기여자는 CSS 및 JavaScript 리소스를 포함하고 모든 페이지에 적용하는 모듈입니다. 특정 테마와 독립적이며 테마 또는 서로 간에 특정 스타일을 재정의하도록 구성할 수 있습니다. 페이지에 별도의 UI 리소스를 포함하고 특정 테마에 포함하려면 대신 [themelet](./bundling-and-installing-resources-into-your-theme-via-themelets.md) 을 사용하십시오.

Liferay Portal/DXP의 많은 메뉴는 [Site Menu](../../../../../getting-started/navigating-dxp.md#site-menu) 과 같은 테마 기여자로 패키징됩니다.

![사이트 메뉴는 테마 기여자 모듈로 구현됩니다.](./bundling-independent-ui-resources-via-theme-contributors/images/01.png)

사이트 메뉴와 같은 표준 UI 구성 요소를 편집하거나 스타일을 지정하려면 테마 기여자와 함께 변경 사항을 배포해야 합니다. 테마 기여자를 사용하여 새 UI 구성요소 또는 스타일을 추가할 수도 있습니다.

## 간단한 테마 기여자 배포

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계에 따라 예제 테마 기여자를 배포합니다.

1. 예제를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://learn.liferay.com/dxp/latest/en/site-building/site-appearance/themes/theme-development/bundling-resources/bundling-independent-ui-resources-via-theme-contributors/liferay-w9m6.zip -O
    ```

    ```bash
    unzip liferay-w9m6.zip
    ```

1. 예제를 빌드하고 배포합니다.

    ```bash
    cd liferay-w9m6
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 모듈 JAR을 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.
    ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```
    STARTED com.acme.w9m6.web_1.0.0
    ```

1. 테마 제공자가 사이트의 배경색을 변경했는지 확인하십시오. 브라우저를 `https://localhost:8080` 로 열고 Liferay 홈 페이지의 배경이 이제 파란색인지 확인합니다.

![예제 테마 기여자는 페이지의 배경을 파란색으로 바꿉니다.](./bundling-independent-ui-resources-via-theme-contributors/images/02.png)

축하합니다. 새 테마 기여자를 성공적으로 구축하고 배포했습니다.

다음으로 사용자 지정 CSS 변경 사항을 사용하여 테마 기여자가 어떻게 보이는지 알아봅니다.

## 예제 테마 기여자 검토

테마 기여자는 OSGi 모듈이며 `bnd.bnd` 파일에 속성이 있어야 합니다. 그런 다음 사용자 지정이 `리소스` 폴더에 추가됩니다. 예제 테마 기여자는 `custom.css` 파일을 사용하여 각 페이지의 배경색을 변경합니다.

### 테마 기여자 속성 검사

테마 제공자의 프로젝트에는 구성을 위해 필요한 속성이 `bnd.bnd` 파일에 추가되어 있습니다.

```{literalinclude} ./bundling-independent-ui-resources-via-theme-contributors/resources/liferay-w9m6.zip/w9m6-web/bnd.bnd
```

테마 제공자의 `bnd.bnd` 파일이 작동하려면 다음과 같은 속성이 있어야 합니다.

`Web-ContextPath`: 테마 기여자의 리소스에 대한 컨텍스트를 설정합니다. 예제 모듈에서 컨텍스트 경로는 `w9m6-web`입니다.

`Liferay-Theme-Contributor-Type`: 모듈이 테마 기여자를 추가함을 나타냅니다. 이 속성은 임의의 값이 될 수 있습니다. 예제 모듈은 `CSS` 값을 사용합니다.

`Liferay-Theme-Contributor-Weight`: 다른 기여자와 비교하여 테마 기여자의 스타일 가중치를 구성합니다. 다른 기여자의 스타일을 재정의하기 위해 값이 낮을수록 우선 순위가 높아집니다. 예제 모듈은 '1'의 가중치를 사용하여 스타일이 테마 기여자 중 가장 높은 우선순위를 갖도록 보장합니다.

`bnd.bnd` 파일에 필요한 속성이 있으면 모듈에 원하는 사용자 정의만 있으면 됩니다.

### 스타일 사용자 정의 검토

원하는 CSS 또는 JavaScript 파일을 모듈 내의 하위 폴더에 추가해야 합니다. CSS 파일은 `src/main/resources/META-INF/resources/css/` 하위 폴더에 속하고 JavaScript 파일은 `src/main/resources/META-INF/resources/js/` 하위 폴더에 속합니다.

예제 테마 기여자는 간단한 CSS 스타일 변경을 사용하여 각 페이지의 배경을 파란색으로 만듭니다. 이것은 [`custom.css`](./bundling-independent-ui-resources-via-theme-contributors/resources/liferay-w9m6.zip/w9m6-web/src/main/resources/META-INF /resources/custom.css) `src/main/resources/META-INF/resources/` 파일:

```css
body, #wrapper {
    background: blue;
}
```

원하는 모든 CSS 또는 JavaScript 파일이 올바른 하위 폴더에 추가되면 모듈을 배포하면 모든 페이지에 적용됩니다.

## 배경색 변경

이제 테마 제공자가 페이지에 미치는 영향을 보려면 배경색을 변경해 보십시오.

1. 프로젝트에서 `src/main/resources/META-INF/resources/css/custom.css` 을 엽니다.

1. `background` color 속성을 `orange`과 같은 다른 색상으로 변경합니다.

    ```css
    body, #wrapper {
        background: orange;
    }
    ```

1. 실행 중인 Docker 컨테이너에 예제를 다시 빌드하고 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

1. Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```
    STARTED com.acme.w9m6.web_1.0.0
    ```

1. 테마 제공자가 사이트의 배경을 새 색상으로 변경했는지 확인하십시오. 브라우저를 `https://localhost:8080` 로 열어 변경 사항을 확인합니다.

![CSS 파일의 배경색을 변경하면 배포할 때 모든 페이지에 영향을 미칩니다.](./bundling-independent-ui-resources-via-theme-contributors/images/03.png)

## 결론

축하합니다! CSS 스타일 변경으로 테마 기여자를 만들었습니다. [Style Books](../../../style-books/using-a-style-book-to-standardize-site-appearance.md)을 사용하여 사이트 페이지에 특정 스타일 변경 사항을 적용할 수도 있습니다.

## 관련 주제

* [테마렛을 통해 리소스를 테마에 번들링 및 설치](./bundling-and-installing-resources-into-your-theme-via-themelets.md)
* [테마 소개](../../introduction-to-themes.md)
* [Style Book을 사용하여 사이트 모양 표준화](../../../style-books/using-a-style-book-to-standardize-site-appearance.md)
