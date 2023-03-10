---
toc:
- ./browser-based-client-extensions/tutorials.md
- ./browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md
- ./browser-based-client-extensions/remote-applications-ui-reference.md
---
# 브라우저 기반 클라이언트 확장

```{toctree}
:maxdepth: 3

browser-based-client-extensions/tutorials.md
browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md
browser-based-client-extensions/remote-applications-ui-reference.md
```

{bdg-secondary}`사용 가능한 Liferay 7.4 U45+/GA45+`

Liferay는 페이지를 보강하고 기능을 통합하기 위한 다양한 브라우저 기반 클라이언트 확장을 제공합니다. 이러한 확장 유형에는 CSS, JS, Theme CSS, Theme Favicon, Custom Element 및 IFrame이 포함됩니다.

[Liferay Workspace](../tooling/liferay-workspace/what-is-liferay-workspace.md)에서 이러한 확장을 만들고 배포할 수 있습니다. 이러한 브라우저 기반 클라이언트 확장의 기본 버전을 생성하려면 Liferay 작업 공간에서 [블레이드 CLI](../tooling/blade-cli.md) 을 사용하여 이 명령을 실행하십시오.

```bash
blade create -t client-extension [your-new-folder-name]
```

[사용자 정의 요소](#custom-element-client-extensions) 및 [IFrame](#iframe-client-extensions) 클라이언트 확장 생성에 대한 자세한 내용은 [사용자 정의 요소 및 IFrame 클라이언트 확장 이해](./browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 을 참조하십시오.

```{note}
레이아웃 세트(예: 페이지 세트), 마스터 템플릿, 페이지 템플릿 및 개별 콘텐츠 페이지에 JS, CSS 또는 테마 CSS 클라이언트 확장을 추가할 수 있습니다. 확장을 추가하는 수준에 따라 확장의 코드를 상속하는 엔터티가 결정됩니다. 예를 들어 마스터 템플릿에 확장을 추가하면 마스터 템플릿을 사용하는 모든 페이지 템플릿과 콘텐츠 페이지가 해당 확장을 상속합니다.
```

## JavaScript 클라이언트 확장

JavaScript 클라이언트 확장은 가장 간단하고 쉽게 만들 수 있습니다. Liferay 인스턴스에 JavaScript 클라이언트 확장을 배포하고 이를 사용하도록 페이지를 구성하면 여기에 포함된 JavaScript는 페이지를 방문할 때마다 자동으로 실행됩니다. 이를 통해 OSGi 모듈이나 테마를 사용하지 않고 페이지에 특수 기능을 추가할 수 있습니다.

이 유형으로 작업을 시작하려면 [첫 JavaScript 클라이언트 확장 만들기](./browser-based-client-extensions/tutorials/creating-your-first-javascript-client-extension.md) 을 참조하십시오.

## CSS 클라이언트 확장

CSS 클라이언트 확장은 페이지에서 CSS 스타일을 재정의하는 방법입니다. Liferay 인스턴스에 CSS 클라이언트 확장을 배포하고 이를 사용하도록 페이지를 구성하면 여기에 포함된 CSS가 테마 및 스타일 북 설정을 포함하여 페이지에 있는 스타일을 재정의합니다.

이 유형으로 작업을 시작하려면 [첫 번째 CSS 클라이언트 확장 만들기](./browser-based-client-extensions/tutorials/creating-your-first-css-client-extension.md) 을 참조하십시오.

## 테마 CSS 클라이언트 확장

CSS 클라이언트 확장과 유사하게 전체 테마를 배포하지 않고 [테마](../../site-building/site-appearance/themes/introduction-to-themes.md) 에서와 같은 방식으로 CSS를 추가할 수도 있습니다. 이러한 유형의 클라이언트 확장에는 기본적으로 테마에서 생성되는 동일한 스타일 파일인 `clay.css` 파일과 `main.css` 파일을 사용합니다. Liferay 애플리케이션 메뉴의 **원격 앱** 에서 옵션으로 이 유형의 클라이언트 확장을 추가할 수 있습니다.

![테마 CSS 클라이언트 확장을 추가하여 나머지 테마 자체 없이 테마와 동일한 방식으로 페이지에 CSS를 적용합니다.](./browser-based-client-extensions/images/01.png)

```{note}
이 유형의 클라이언트 확장을 사용하려면 `clay.css` 및 `main.css` 파일을 원격으로 호스팅해야 합니다.
```

## 테마 Favicon 클라이언트 확장

클라이언트 확장을 사용하여 Liferay에서 페이지의 파비콘을 재정의할 수도 있습니다. 테마 파비콘 클라이언트 확장을 배포하면 여기에 포함된 아이콘 파일을 Liferay의 모든 페이지에서 사용할 수 있게 됩니다. 페이지 디자인 옵션 메뉴에서 페이지에 대한 파비콘을 구성할 때 별도의 **클라이언트 확장** 탭에서 액세스할 수 있습니다.

![페이지에 대한 파비콘을 구성할 때 특수 클라이언트 확장 탭에서 클라이언트 확장의 파비콘에 액세스하십시오.](./browser-based-client-extensions/images/02.png)

## 사용자 정의 요소 클라이언트 확장

> 이전에 명명된 사용자 지정 요소 원격 앱

사용자 정의 요소 클라이언트 확장은 Liferay의 프런트 엔드 인프라를 사용하여 외부 애플리케이션을 플랫폼과 통합하고 이를 페이지 위젯으로 렌더링합니다. Liferay 외부에서 액세스할 수 있는 모든 도메인의 애플리케이션을 통합할 수 있습니다.

사용자 정의 요소 클라이언트 확장을 사용하려면 필요한 URL 및 세부 정보를 사용하여 회사 수준에서 항목을 생성하여 Liferay에 등록합니다. 그런 다음 Liferay는 각 항목에 대해 고유한 위젯을 생성하고 애플리케이션을 [사용자 정의 HTML 요소](https://web.dev/custom-elements-v1/) 로 렌더링합니다.

자세한 내용은 [맞춤 요소 및 IFrame 클라이언트 확장 이해](./browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 을 참조하세요.

## IFrame 클라이언트 확장

> 이전 이름은 IFrame 원격 앱

IFrame 클라이언트 확장은 [사용자 정의 요소 클라이언트 확장](#custom-element-client-extensions) 과 유사하게 작동합니다. 그러나 외부 응용 프로그램을 `<iframe>` HTML 요소로 렌더링하여 호스트 페이지에서 제한된 상호 작용을 허용합니다. 자세한 내용은 [맞춤 요소 및 IFrame 클라이언트 확장 이해](./browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md) 을 참조하세요.

## 추가 정보

* [클라이언트 확장 소개](../client-extensions.md)
* [첫 번째 JavaScript 클라이언트 확장 만들기](./browser-based-client-extensions/tutorials/creating-your-first-javascript-client-extension.md)
* [첫 번째 CSS 클라이언트 확장 만들기](./browser-based-client-extensions/tutorials/creating-your-first-css-client-extension.md)
* [사용자 정의 요소 및 IFrame 클라이언트 확장 이해](./browser-based-client-extensions/understanding-custom-element-and-iframe-client-extensions.md)
