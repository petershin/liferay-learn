---
toc:
  - ./front-end-client-extensions/tutorials.md
  - ./front-end-client-extensions/javascript-yaml-configuration-reference.md
  - ./front-end-client-extensions/theme-js-yaml-configuration-reference.md
  - ./front-end-client-extensions/css-yaml-configuration-reference.md
  - ./front-end-client-extensions/theme-css-yaml-configuration-reference.md
  - ./front-end-client-extensions/theme-favicon-yaml-configuration-reference.md
  - ./front-end-client-extensions/theme-sprite-map-yaml-configuration-reference.md
  - ./front-end-client-extensions/custom-element-yaml-configuration-reference.md
  - ./front-end-client-extensions/iframe-yaml-configuration-reference.md
  - ./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md
  - ./front-end-client-extensions/remote-applications-ui-reference.md
---
# 프런트엔드 클라이언트 확장

```{toctree}
:maxdepth: 3

front-end-client-extensions/tutorials.md
front-end-client-extensions/javascript-yaml-configuration-reference.md
front-end-client-extensions/theme-js-yaml-configuration-reference.md
front-end-client-extensions/css-yaml-configuration-reference.md
front-end-client-extensions/theme-css-yaml-configuration-reference.md
front-end-client-extensions/theme-favicon-yaml-configuration-reference.md
front-end-client-extensions/theme-sprite-map-yaml-configuration-reference.md
front-end-client-extensions/custom-element-yaml-configuration-reference.md
front-end-client-extensions/iframe-yaml-configuration-reference.md
front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md
front-end-client-extensions/remote-applications-ui-reference.md
```

{bdg-secondary}`사용 가능 Liferay 7.4`

프런트엔드 클라이언트 확장은 페이지를 보강하고 새로운 기능을 통합합니다. 사용 가능한 유형에는 CSS, JavaScript, 테마 CSS, 테마 JS, 테마 파비콘, 사용자 정의 요소 및 IFrame이 있습니다.

이러한 확장을 만들고 배포할 수 있습니다 [Liferay Workspace](../tooling/liferay-workspace/what-is-liferay-workspace.md).

[사용자 정의 요소 및 IFrame 클라이언트 확장 이해](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 를 참조하여 [사용자 정의 요소](#custom-element-client-extensions) 및 [IFrame](#iframe-client-extensions) 클라이언트 확장을 만드는 방법에 대해 자세히 알아보세요.

```{note}
레이아웃 세트(예: 페이지 세트), 마스터 템플릿, 페이지 템플릿 및 개별 콘텐츠 페이지에 JavaScript, CSS 또는 테마 CSS 클라이언트 확장 기능을 추가할 수 있습니다. 확장 기능을 추가하는 수준에 따라 확장 기능의 코드를 상속하는 엔티티가 결정됩니다. 예를 들어 마스터 템플릿에 확장자를 추가하면 마스터 템플릿을 사용하는 모든 페이지 템플릿 및 콘텐츠 페이지가 해당 확장자를 상속합니다.
```

## 자바스크립트 클라이언트 확장

{bdg-secondary}`Liferay Experience Cloud 및 Liferay DXP 7.4+(온프레미스)`

JavaScript 클라이언트 확장은 Liferay 인스턴스 전체에 글로벌 JavaScript 라이브러리와 로직을 제공합니다. JavaScript 클라이언트 확장 프로그램을 배포하고 이를 사용하도록 페이지를 구성하면 페이지를 방문할 때마다 페이지의 머리글 또는 바닥글에서 해당 JavaScript가 자동으로 실행됩니다.

`client-extension.yaml` 파일에서 JavaScript 클라이언트 확장자를 지정합니다:

```yaml
type: globalJS
```

시작하려면 [자바스크립트 클라이언트 확장 프로그램 사용](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md) 을 참조하세요.

## CSS 클라이언트 확장

{bdg-secondary}`Liferay Experience Cloud 및 Liferay DXP 7.4+(온프레미스)`

CSS 클라이언트 확장은 페이지에 새로운 CSS 스타일을 도입합니다. 페이지에 배포된 CSS 클라이언트 확장은 테마 및 스타일북 설정을 포함하여 페이지의 기존 스타일링에 추가됩니다.

`client-extension.yaml` 파일에서 CSS 클라이언트 확장자를 지정합니다:

```yaml
type: globalCSS
```

시작하려면 [CSS 클라이언트 확장 프로그램 사용](./front-end-client-extensions/tutorials/using-a-css-client-extension.md) 을 참조하세요.

## 테마 자바스크립트 클라이언트 확장

{bdg-secondary}`Liferay Experience Cloud 및 Liferay DXP 7.4+(온프레미스)`

[자바스크립트 클라이언트 확장](#javascript-client-extensions)과 마찬가지로 사이트의 [테마](../../site-building/site-appearance/themes/introduction-to-themes.md)에서 제공하는 것을 대체하는 자바스크립트 라이브러리 및 로직을 추가할 수 있습니다.

`client-extension.yaml` 파일에서 테마 자바스크립트 클라이언트 확장자를 지정합니다:

```yaml
type: themeJS
```

## 테마 CSS 클라이언트 확장

{bdg-secondary}`Liferay Experience Cloud 및 Liferay DXP 7.4+(온프레미스)`

[CSS 클라이언트 확장](#css-client-extensions) 은 페이지에 스타일을 추가하지만, 테마 CSS 클라이언트 확장은 사이트의 [테마](../../site-building/site-appearance/themes/introduction-to-themes.md)를 포함하여 페이지의 스타일을 재정의합니다. 클라이언트 확장자는 `clay.css` 파일과 `main.css` 파일을 사용하여 사이트 테마에서 일반적으로 사용되는 동일한 이름의 파일을 대체합니다.

이 유형의 클라이언트 확장은 Liferay 애플리케이션 메뉴의 *클라이언트 확장* 에서 옵션으로 추가할 수 있습니다.

![테마 CSS 클라이언트 확장을 추가하여 사이트 테마에서 제공하는 CSS를 대체할 수 있습니다.](./front-end-client-extensions/images/01.png)

```{note}
이 유형의 클라이언트 확장자를 사용하려면 `clay.css` 및 `main.css` 파일을 원격으로 호스팅해야 합니다.
```

`client-extension.yaml` 파일에서 테마 CSS 클라이언트 확장자를 지정합니다:

```yaml
type: themeCSS
```

## 테마 파비콘 클라이언트 확장

{bdg-secondary}`Liferay Experience Cloud 및 Liferay DXP 7.4+(온프레미스)`

Liferay에서 페이지의 파비콘을 재정의합니다. 배포가 완료되면 제공된 아이콘 파일을 Liferay의 모든 페이지에서 사용할 수 있게 됩니다. 페이지 디자인 옵션 메뉴에서 페이지의 파비콘을 구성할 때 별도의 *클라이언트 확장 기능* 탭에서 액세스할 수 있습니다.

![페이지의 파비콘을 구성할 때는 특별한 클라이언트 확장 탭에서 클라이언트 확장 프로그램의 파비콘에 액세스합니다.](./front-end-client-extensions/images/02.png)

## 테마 스프라이트 맵 클라이언트 확장

{bdg-secondary}`Liferay Experience Cloud 및 Liferay DXP 7.4+(온프레미스)`

테마 스프라이트 맵 클라이언트 확장은 사이트 페이지의 스프라이트 맵을 재정의합니다. 스프라이트 맵을 `.svg` 이미지로 정의하면 사이트의 현재 테마에서 사용하는 이미지로 대체됩니다.

`client-extension.yaml` 파일에서 테마 스프라이트 맵 클라이언트 확장자를 지정합니다:

```yaml
type: themeSpritemap
```

## 사용자 지정 요소 클라이언트 확장

{bdg-secondary}`Liferay Experience Cloud 및 Liferay DXP 7.4+(온프레미스)`

> 이전 명칭: 사용자 지정 요소 원격 앱

사용자 지정 요소 클라이언트 확장은 Liferay의 프런트엔드 인프라를 사용하여 외부 애플리케이션을 플랫폼과 통합하고 이를 페이지 위젯으로 렌더링합니다. Liferay 외부에서 액세스할 수 있는 모든 도메인의 애플리케이션을 통합할 수 있습니다.

사용자 지정 요소 클라이언트 확장을 사용하려면 회사 수준에서 필요한 URL과 세부 정보가 포함된 항목을 생성하여 Liferay에 등록합니다. 그런 다음 Liferay는 각 항목에 대해 고유한 위젯을 생성하고 애플리케이션을 [사용자 지정 HTML 요소](https://web.dev/custom-elements-v1/)로 렌더링합니다.

`client-extension.yaml` 파일에서 사용자 지정 요소 클라이언트 확장자를 지정합니다:

```yaml
type: customElement
```

자세한 내용은 [사용자 지정 요소 및 IFrame 클라이언트 확장 이해](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 를 참조하세요.

## IFrame 클라이언트 확장

{bdg-secondary}`Liferay Experience Cloud 및 Liferay DXP 7.4+(온프레미스)`

> 이전 명칭: IFrame 원격 앱

IFrame 클라이언트 확장은 [사용자 지정 요소 클라이언트 확장](#custom-element-client-extensions)과 같이 작동합니다. 그러나 외부 애플리케이션을 `<iframe>` HTML 요소로 렌더링하므로 호스트 페이지에서 제한된 상호 작용만 허용합니다. 다른 프런트엔드 클라이언트 확장 프로그램과 달리 *은 정적 리소스*를 제공하지 않습니다.

`client-extension.yaml` 파일에서 IFrame 클라이언트 확장자를 지정합니다:

```yaml
type: iframe
```

자세한 내용은 [사용자 지정 요소 및 IFrame 클라이언트 확장 이해](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 를 참조하세요.

## 프런트엔드 클라이언트 확장 속성

프런트엔드 클라이언트 확장 프로그램의 `client-extension.yaml` 파일에서 이러한 속성을 설정합니다:

| 이름              | 데이터 유형   | 기정값                     | 묘사                                                                                                   |
|:--------------- |:-------- |:----------------------- |:---------------------------------------------------------------------------------------------------- |
| `baseURL`       | 문자열      | *사이트 URL에서 파생*          | 클라이언트 확장에 정의된 모든 리소스가 제공되는 기본 경로입니다.                                                                 |
| `description`   | 문자열      |                         | 클라이언트 확장 프로그램의 설명입니다.                                                                                |
| `name`          | 문자열      |                         | 클라이언트 확장 프로그램의 이름(UI에 표시되는 이름)입니다. 프런트엔드 클라이언트 확장에는 이름이 필요합니다.                                       |
| `sourceCodeURL` | URL      | https://www.liferay.com | 클라이언트 확장 프로그램의 소스 리포지토리 주소입니다.                                                                       |
| `typeSettings`  | String[] | []                      | Liferay의 `UnicodeProperties` 구문으로 처리되는 문자열 목록입니다. 클라이언트 확장을 빌드할 때 유형별 클라이언트 확장 프로퍼티가 자동으로 여기에 복사됩니다. |

자세한 내용은 [에서 클라이언트 확장 구성하기 `client-extension.yaml`](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml) 를 참조하세요.

## 관련 주제

* [클라이언트 확장 프로그램 소개](../client-extensions.md)
* [사용자 정의 요소 및 IFrame 클라이언트 확장 이해](./front-end-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)
* [자바스크립트 클라이언트 확장 프로그램 사용](./front-end-client-extensions/tutorials/using-a-javascript-client-extension.md)
* [CSS 클라이언트 확장 사용](./front-end-client-extensions/tutorials/using-a-css-client-extension.md)
