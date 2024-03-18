---
toc:
  - ./frontend-client-extensions/tutorials.md
  - ./frontend-client-extensions/javascript-yaml-configuration-reference.md
  - ./frontend-client-extensions/css-yaml-configuration-reference.md
  - ./frontend-client-extensions/theme-css-yaml-configuration-reference.md
  - ./frontend-client-extensions/theme-favicon-yaml-configuration-reference.md
  - ./frontend-client-extensions/theme-sprite-map-yaml-configuration-reference.md
  - ./frontend-client-extensions/custom-element-yaml-configuration-reference.md
  - ./frontend-client-extensions/iframe-yaml-configuration-reference.md
  - ./frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md
  - ./frontend-client-extensions/client-extensions-ui-reference.md
---
# 프런트엔드 클라이언트 확장

{bdg-primary}`Liferay Self-Hosted`
{bdg-primary}`Liferay SaaS`
{bdg-warning}`Liferay PaaS`

{bdg-secondary}`Liferay 7.4+`

프런트 엔드 클라이언트 확장은 페이지를 확장하고 새로운 기능을 통합합니다. 사용 가능한 유형에는 CSS, JavaScript, 테마 CSS, 테마 파비콘, 사용자 정의 요소 및 IFrame이 포함됩니다.

[Liferay Workspace](../tooling/liferay-workspace/what-is-liferay-workspace.md) 에서 이러한 확장을 생성하고 배포할 수 있습니다.

[사용자 정의 요소](#custom-element-client-extensions) 및 [IFrame](#iframe-client-extensions) 클라이언트 확장 생성에 대한 자세한 내용은 [사용자 정의 요소 및 IFrame 클라이언트 확장 이해](./frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 참조하세요.

```{note}
레이아웃 세트(예: 페이지 세트), 마스터 템플릿, 페이지 템플릿 및 개별 콘텐츠 페이지에 JavaScript, CSS 또는 테마 CSS 클라이언트 확장을 추가할 수 있습니다. 확장을 추가하는 수준에 따라 확장의 코드를 상속하는 엔터티가 결정됩니다. 예를 들어 마스터 템플릿에 확장을 추가하면 마스터 템플릿을 사용하는 모든 페이지 템플릿과 콘텐츠 페이지가 해당 확장을 상속합니다.
```

## JavaScript 클라이언트 확장

JavaScript 클라이언트 확장은 Liferay 인스턴스 전반에 걸쳐 글로벌 JavaScript 라이브러리와 논리를 제공합니다. JavaScript 클라이언트 확장을 배포하고 이를 사용하도록 페이지를 구성하면 페이지를 방문할 때마다 해당 JavaScript가 자동으로 실행됩니다(페이지의 머리글 또는 바닥글).

`client-extension.yaml` 파일에 JavaScript 클라이언트 확장을 지정합니다.

```yaml
type: globalJS
```

시작하려면 [JavaScript 클라이언트 확장 사용](./frontend-client-extensions/tutorials/using-a-javascript-client-extension.md) 을 참조하세요.

## CSS 클라이언트 확장

CSS 클라이언트 확장은 페이지에 새로운 CSS 스타일을 도입합니다. 페이지에 배포된 CSS 클라이언트 확장은 테마 및 스타일 북 설정을 포함하여 페이지의 기존 스타일에 추가됩니다.

`client-extension.yaml` 파일에 CSS 클라이언트 확장을 지정합니다.

```yaml
type: globalCSS
```

시작하려면 [CSS 클라이언트 확장 사용](./frontend-client-extensions/tutorials/using-a-css-client-extension.md) 을 참조하세요.

## 테마 CSS 클라이언트 확장

[CSS 클라이언트 확장](#css-client-extensions) 페이지에 스타일을 추가하는 반면, 테마 CSS 클라이언트 확장은 사이트의 [테마](../../site-building/site-appearance/themes/introduction-to-themes.md) 을 포함하여 페이지의 스타일을 재정의합니다. 클라이언트 확장 프로그램은 `clay.css` 파일과 `main.css` 파일을 사용하여 사이트 테마에 일반적으로 사용되는 동일한 이름의 파일을 대체합니다.

Liferay 응용 프로그램 메뉴의 **클라이언트 확장** 에서 이 유형의 클라이언트 확장을 옵션으로 추가할 수 있습니다.

![Add a theme CSS client extension to replace CSS provided by your site's theme.](./frontend-client-extensions/images/01.png)

```{note}
이 유형의 클라이언트 확장을 사용하려면 `clay.css` 및 `main.css` 파일을 원격으로 호스팅해야 합니다.

이 클라이언트 확장은 테마에 포함된 기본 CSS를 완전히 대체하므로 Liferay에서 사용하는 기본 위젯에 대해 [Clay 스타일링](https://clayui.com/docs/css/index.html) 제공해야 합니다. 또는 특정 Liferay 위젯의 스타일을 수정하려면 컨테이너 요소의 고급 탭 아래에 `cadmin` CSS 클래스가 포함된 컨테이너에 위젯을 래핑하세요.
```

`client-extension.yaml` 파일에 테마 CSS 클라이언트 확장을 지정합니다.

```yaml
type: themeCSS
```

## 테마 Favicon 클라이언트 확장

Liferay에서 페이지의 파비콘을 재정의하세요. 배포되면 제공된 아이콘 파일을 Liferay의 모든 페이지에서 사용할 수 있게 됩니다. 페이지 디자인 옵션 메뉴에서 페이지에 대한 파비콘을 구성할 때 별도의 **클라이언트 확장** 탭에서 액세스할 수 있습니다.

![When you configure the favicon for a page, access the favicon from your client extension from a special Client Extensions tab.](./frontend-client-extensions/images/02.png)

## 테마 스프라이트 맵 클라이언트 확장

테마 스프라이트 맵 클라이언트 확장은 사이트 페이지의 스프라이트 맵을 재정의합니다. 스프라이트 맵을 '.svg' 이미지로 정의하면 사이트의 현재 테마에서 사용되는 이미지를 대체합니다.

`client-extension.yaml` 파일에 테마 스프라이트 맵 클라이언트 확장을 지정합니다.

```yaml
type: themeSpritemap
```

## 사용자 정의 요소 클라이언트 확장

> 이전 이름은 Custom Element Remote App입니다.

사용자 정의 요소 클라이언트 확장은 Liferay의 프런트 엔드 인프라를 사용하여 외부 애플리케이션을 플랫폼과 통합하고 이를 페이지 위젯으로 렌더링합니다. Liferay 외부에서 액세스할 수 있는 모든 도메인의 애플리케이션을 통합할 수 있습니다.

사용자 정의 요소 클라이언트 확장을 사용하려면 Liferay에 등록하는 데 필요한 URL 및 세부 정보가 포함된 회사 수준의 항목을 생성합니다. 그런 다음 Liferay는 각 항목에 대해 고유한 위젯을 생성하고 애플리케이션을 [정의 HTML 요소](https://web.dev/custom-elements-v1/) 로 렌더링합니다.

`client-extension.yaml` 파일에 사용자 정의 요소 클라이언트 확장을 지정하십시오.

```yaml
type: customElement
```

자세한 내용은 [사용자 정의 요소 및 IFrame 클라이언트 확장 이해](./frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 을 참조하세요.

## IFrame 클라이언트 확장

> 이전에는 IFrame 원격 앱으로 명명되었습니다.

IFrame 클라이언트 확장은 [맞춤 요소 클라이언트 확장](#custom-element-client-extensions) 처럼 작동합니다. 그러나 외부 애플리케이션을 `<iframe>` HTML 요소로 렌더링하므로 호스트 페이지와의 제한된 상호 작용이 허용됩니다. 다른 프런트 엔드 클라이언트 확장과 달리 이러한 확장은 **정적 리소스를 제공하지 않습니다** .

`client-extension.yaml` 파일에 IFrame 클라이언트 확장을 지정합니다.

```yaml
type: iframe
```

자세한 내용은 [사용자 정의 요소 및 IFrame 클라이언트 확장 이해](./frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 을 참조하세요.

## 프런트 엔드 클라이언트 확장 속성

프런트 엔드 클라이언트 확장의 `client-extension.yaml` 파일에서 다음 속성을 설정합니다.

| 이름              | 데이터 유형                                                  | 기정값                                                    | 묘사                                                                                             |
| :-------------- | :------------------------------------------------------ | :----------------------------------------------------- | :--------------------------------------------------------------------------------------------- |
| `baseURL`       | 끈                                                       | **사이트 URL에서 따옴** | 클라이언트 확장에 정의된 모든 리소스가 제공되는 기본 경로입니다.                                                           |
| `description`   | 끈                                                       |                                                        | 클라이언트 확장의 설명입니다.                                                                               |
| `name`          | 끈                                                       |                                                        | 클라이언트 확장 이름(UI에 표시되는 이름)입니다. 프런트 엔드 클라이언트 확장에는 이름이 필요합니다.                   |
| `sourceCodeURL` | URL                                                     | https\://www\.liferay.com                              | 클라이언트 확장의 소스 저장소에 대한 주소입니다.                                                                    |
| `typeSettings`  | 끈[] | [] | Liferay의 'UnicodeProperties' 구문으로 처리되는 문자열 목록입니다. 유형별 클라이언트 확장 속성은 클라이언트 확장이 빌드될 때 자동으로 복사됩니다. |

자세한 내용은 `client-extension.yaml` [에서 클라이언트 확장 구성](./working-with-client-extensions.md#configuring-client-extensions-in-client-extension-yaml) 참조하세요.

## 관련 주제

* [클라이언트 확장 소개](../client-extensions.md)
* [사용자 정의 요소 및 IFrame 클라이언트 확장 이해](./frontend-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)
* [JavaScript 클라이언트 확장 사용](./frontend-client-extensions/tutorials/using-a-javascript-client-extension.md)
* [CSS 클라이언트 확장 사용하기](./frontend-client-extensions/tutorials/using-a-css-client-extension.md)
