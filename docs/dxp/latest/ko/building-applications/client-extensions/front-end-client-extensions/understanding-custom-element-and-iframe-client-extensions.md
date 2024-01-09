# 맞춤 요소 및 IFrame 클라이언트 확장 이해

사용자 정의 요소 및 IFrame 클라이언트 확장은 Liferay에 애플리케이션을 등록하고 사이트 페이지에 위젯으로 렌더링합니다.

이러한 프런트 엔드 확장 중 하나를 생성하면 Liferay는 위젯을 생성하고 OSGi 서비스 레지스트리에 추가합니다. 항목 또는 위젯 범위에서 추가 속성을 설정하여 애플리케이션이 렌더링되는 방식을 구성할 수 있습니다.

사용자 정의 요소와 IFrame 애플리케이션은 다르게 호스팅되고, 다르게 렌더링되며, Liferay 서비스 및 런타임 데이터에 대한 액세스 수준이 다릅니다.

```{tip}
 [사용자 정의 요소](#using-the-custom-element-type) 유형은 Liferay 플랫폼과의 더 큰 통합을 제공하고 더 복잡한 시나리오를 지원합니다.
```

## 맞춤 요소 유형 사용

사용자 정의 요소 클라이언트 확장 유형은 외부 애플리케이션 코드를 별도의 HTML `<custom-element>`으로 렌더링하고 Liferay 호스트 페이지와의 완전한 통합을 제공합니다. 사용자 정의 요소 애플리케이션의 아키텍처에는 Liferay 서버, Liferay 호스트 페이지, 애플리케이션 코드를 저장하는 서버의 세 가지 주요 부분이 포함됩니다. Liferay는 이러한 파일을 사용하여 브라우저에서 애플리케이션을 생성합니다.

![The custom element architecture includes an entry in the Liferay server, application code stored on a server, and the Liferay page with the client extension's unique widget.](./understanding-custom-element-and-iframe-client-extensions/images/02.png)

각 맞춤 요소 항목에는 HTML 요소 이름과 필요한 JavaScript 및 CSS 파일에 대한 URL이 포함되어 있습니다. 런타임 시 애플리케이션으로 렌더링되는 속성도 포함될 수 있습니다.

페이지에 추가되면 Liferay는 `<script>` 및 `<link>` 요소를 통해 클라이언트 확장의 JavaScript 및 CSS 파일을 페이지에 직접 삽입합니다. JavaScript는 애플리케이션을 선언하고 인스턴스화하며 CSS 파일은 애플리케이션의 스타일을 지정합니다.

```{important}
애플리케이션의 코드는 사용자 정의 요소를 선언하고 원격 앱 항목의 이름과 일치하는 HTML 요소 이름을 제공해야 합니다. 이러한 이유로 앱 코드가 로드되자마자 브라우저에서 맞춤 요소 선언이 실행되도록 하려면 [IIFE](https://developer.mozilla.org/en-US/docs/Glossary/IIFE) 을 사용해야 합니다.
```

원격 앱의 위젯이 페이지에 추가되면 먼저 제공된 HTML 요소 이름으로 태그를 생성한 다음 요소 코드에 정의된 로직을 실행하여 애플리케이션 마크업을 렌더링합니다. 항목 또는 위젯 인스턴스에 속성이 포함된 경우 생성된 사용자 정의 요소 마크업(`<custom-element (+props)/>`)에 추가됩니다.

일단 렌더링되면 애플리케이션은 Liferay 페이지에 완전히 통합되므로 Liferay의 공개 JavaScript API를 사용할 수 있고 호스트 페이지에서 이미 사용 가능한 스타일 클래스를 재사용할 수 있습니다. 그러나 사용자 정의 요소를 구축하는 방법과 스타일 규칙을 적용하는 사이트
에 따라 이를 변경할 수 있습니다. 예를 들어 애플리케이션의 마크업이 [Shadow DOM](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_shadow_DOM) 사용하는 경우 맞춤 요소의 스타일과 호스트 페이지가 서로 격리될 수 있습니다.

```{note}
사용자 정의 요소 위젯의 여러 인스턴스가 페이지에 추가되면 Liferay는 애플리케이션의 URL만 한 번만 포함합니다.
```

## IFrame 유형 사용

IFrame 클라이언트 확장 유형은 외부 애플리케이션을 별도의 `<iframe>` 요소로 렌더링하여 Liferay의 클라이언트 SDK API를 사용하여 호스트 페이지와의 제한된 상호 작용을 허용합니다. IFrame 애플리케이션의 아키텍처에는 Liferay 서버, Liferay 호스트 페이지, 애플리케이션을 호스팅하는 외부 서버라는 세 가지 주요 부분이 포함됩니다.

![The IFrame architecture includes an entry in the Liferay server, an application hosted on an external server, and the Liferay Page with the client extension's unique widget.](./understanding-custom-element-and-iframe-client-extensions/images/01.png)

각 IFrame 항목은 일반적으로 외부 서버에서 제공되는 애플리케이션에 연결되는 IFrame URL을 저장합니다. 결과적으로 애플리케이션은 마크업, 스크립트, 스타일 및 (선택적으로) 클라이언트 SDK를 포함하는 HTML 문서를 제공해야 합니다.

클라이언트 확장의 위젯을 페이지에 추가하면 Liferay는 항목의 URL을 사용하여 외부 애플리케이션의 콘텐츠로 채워진 `<iframe>` 태그를 렌더링합니다. 항목 또는 위젯 인스턴스에 속성이 포함된 경우 해당 속성은 추가 URL 속성(`<iframe (+properties)/>`)으로 애플리케이션에 전달되므로 앱이 프로그래밍 방식으로 액세스할 수 있습니다.

```{note}
IFrame 앱은 서버에 배포되어야 자체 마크업을 조합하고 이를 브라우저로 보내 위젯의 `<iframe>` 요소. 대조적으로, [맞춤 요소 앱](#using-the-custom-element-type) 은 마크업을 생성하는 데 서버가 필요하지 않습니다. 브라우저는 앱의 위젯과 JavaScript 코드를 통해 필요한 로직을 실행하기 때문에 URL을 통해 애플리케이션의 코드를 사용할 수 있어야 합니다.
```

기본적으로 모든 브라우저는 호스트 페이지와 외부 애플리케이션 간의 정보 흐름을 방지하기 위해 IFrame 애플리케이션에 '동일 출처' 정책을 적용합니다. Liferay는 IFrame 요소와 Liferay 페이지 간의 제한된 통신을 허용하는 클라이언트 SDK 스크립트를 제공합니다. `postMessage()` API를 통해 페이지와의 통신 프로토콜을 구현하여 작동합니다. 이 스크립트를 사용하려면 애플리케이션의 마크업에 포함되어야 합니다.

IFrame 앱이 클라이언트 SDK를 사용하는 경우 Liferay 페이지는 현재 로그인된 사용자로서 애플리케이션을 대신하여 특정 작업을 수행하라는 지침을 받습니다. 여기에는 DXP 서버에 대한 서비스 호출 및 상태 세부 정보 액세스(예: 호스트 페이지에서 토스트 열기, 헤드리스 API 호출, GraphQL 쿼리 실행, 스타일 속성 액세스)가 포함됩니다.

## 관련 주제

* [클라이언트 확장 소개](../../client-extensions.md)
* [기본 맞춤 요소 만들기](./tutorials/creating-a-basic-custom-element.md)
* [원격 애플리케이션 UI 참조](./client-extensions-ui-reference.md)
