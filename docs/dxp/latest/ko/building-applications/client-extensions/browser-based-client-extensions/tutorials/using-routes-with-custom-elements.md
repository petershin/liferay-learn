# 사용자 지정 요소와 함께 경로 사용

{bdg-secondary}`사용 가능한 Liferay 7.4+`

사용자 정의 요소는 Liferay의 프런트 엔드 인프라를 사용하여 외부 애플리케이션을 Liferay 플랫폼에 등록하고 이를 위젯으로 렌더링하는 클라이언트 확장 유형입니다. 여러 경로를 포함하는 애플리케이션의 경우(예: [React Router](https://reactrouter.com/) ) 원격 애플리케이션 속성을 정의하여 런타임 시 위젯에 사용되는 경로를 결정할 수 있습니다. 이러한 속성은 Liferay의 원격 앱 메뉴 또는 배포된 위젯의 구성 옵션을 통해 애플리케이션에 대해 설정할 수 있습니다.

```{warning}
다른 유형의 클라이언트 확장과 동일한 방식으로 배포되는 사용자 지정 요소 또는 IFrame은 Liferay 7.4의 **베타 기능**입니다. 이 자습서에서는 사용자 지정 요소 원격 애플리케이션을 배포하는 데 다른 방법을 사용하며 향후 업데이트까지 여전히 권장되는 접근 방식입니다.
```

이 자습서에서는 `hello-world`, `hello-foo`, `hello-bar`의 세 가지 경로가 있는 샘플 앱을 생성하는 Liferay의 `create_custom_element.sh` 스크립트를 사용하여 기본 React 애플리케이션을 만듭니다. 애플리케이션을 컴파일하고 `.js` 및 `.css` 파일을 호스팅한 후 애플리케이션을 Liferay에 등록하고 페이지 위젯으로 배포합니다. 마지막으로 각각의 대체 경로를 사용하도록 구성합니다.

![대체 경로를 사용하여 기본 사용자 지정 요소 원격 응용 프로그램을 만들고 경로 속성을 사용하여 렌더링되는 항목을 구성합니다.](./using-routes-with-custom-elements/images/01.png)

```{note}
사용자 정의 요소 클라이언트 확장은 애플리케이션 구축, 패키징 및 호스팅 방식과 관련하여 불가지론적입니다. 이 자습서에서는 기본 라우팅을 사용하여 샘플 사용자 지정 요소 애플리케이션을 만드는 편리한 방법만 제공합니다.
```

`create_custom_element.sh` 을 실행하려면 최신 버전 [Node.JS](https://nodejs.org/), [NPM](https://www.npmjs.com/), [YARN](https://classic.yarnpkg.com/)이 필요합니다. 계속하기 전에 이러한 도구가 설치되어 있는지 확인하십시오.

## React 애플리케이션 생성, 구축 및 호스팅

1. 새 Liferay DXP 7.4+ 컨테이너를 시작합니다. 컨테이너가 시작되는 동안 다음 단계를 계속할 수 있습니다.

   ```docker
   docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_DXP_DOCKER_IMAGE$]
   ```

1. 별도의 터미널에서 이 명령을 실행하여 React 애플리케이션을 생성합니다.

   ```bash
   curl -Ls https://github.com/liferay/liferay-portal/raw/master/tools/create_custom_element.sh | bash -s j1v3-custom-element react
   ```

1. 애플리케이션이 성공적으로 생성되었는지 확인합니다.

   스크립트는 다음 요소를 포함하는 `j1v3-custom-element` 이라는 새 React 애플리케이션을 생성해야 합니다.

   ```bash
   j1v3-custom-element
   ├── node_modules
   ├── README.md
   ├── package.json
   ├── public
   │   └── index.html
   ├── src
   │   ├── common
   │   │   ├── services
   │   │   │   └── liferay
   │   │   │       ├── api.js
   │   │   │       └── liferay.js
   │   │   └── styles
   │   │       ├── hello-world.scss
   │   │       ├── index.scss
   │   │       └── variables.scss
   │   ├── index.js
   │   └── routes
   │       ├── hello-bar
   │       │   └── pages
   │       │       └── HelloBar.js
   │       ├── hello-foo
   │       │   └── pages
   │       │       └── HelloFoo.js
   │       └── hello-world
   │           └── pages
   │               └── HelloWorld.js
   └── yarn.lock
   ```

1. 새 `j1v3-custom-element` 폴더로 이동하고 애플리케이션을 빌드합니다.

   ```bash
   cd j1v3-custom-element
   ```

   ```bash
   yarn build
   ```

1. 빌드가 성공했는지 확인하고 애플리케이션의 `.js` 및 `.css` 파일을 기록해 둡니다.

   ```bash
   Creating an optimized production build...
   Compiled successfully.

   File sizes after gzip:

   43.51 kB  build/static/js/main.114dde4a.js
   121 B     build/static/css/main.9877909d.css
   ```

1. 이메일 주소 **test@liferay.com** 와 암호 **test** 을 사용하여 `<http://localhost:8080>` 에서 Liferay에 로그인합니다. 프롬프트가 표시되면 비밀번호를 **learn** 로 변경하십시오.

1. **사이트 메뉴**(![Site Menu](../../../../images/icon-product-menu.png))을 열고 **콘텐츠 & 데이터** 를 확장한 다음 **문서 및 미디어** 로 이동합니다.

1. **추가** 버튼(![Add Button](../../../../images/icon-add.png))을 클릭하고 **여러 파일** 를 선택합니다.

1. `.js` 및 `.css` 파일을 업로드 영역으로 끌어다 놓습니다.

   ![.js 및 .css 파일을 Liferay 문서 라이브러리에 업로드합니다.](./using-routes-with-custom-elements/images/02.png)

1. **게시** 을 클릭합니다.

이렇게 하면 파일이 Liferay 문서 라이브러리에 추가되고 원격 애플리케이션을 만드는 데 사용할 고유한 WebDAV URL이 할당됩니다.

```{tip}
이 자습서는 데모 목적으로 Liferay의 문서 라이브러리에서 응용 프로그램의 정적 리소스를 호스팅합니다. 프로덕션 환경에서는 정적 리소스 호스팅에 최적화된 서버에서 애플리케이션 파일을 호스팅해야 합니다.
```

각 파일의 URL을 보려면 **정보** 아이콘(![Info Icon](../../../../images/icon-information.png))을 클릭하고 한 번에 파일 중 하나를 선택하십시오. 각 파일의 **WebDAV URL** 을 복사하고 다음 단계에서 사용할 수 있도록 저장합니다.

![각 파일의 WebDAV URL을 복사합니다.](./using-routes-with-custom-elements/images/03.png)

예를 들어,

* `http://localhost:8080/webdav/guest/document_library/main.114dde4a.js`
* `http://localhost:8080/webdav/guest/document_library/main.9877909d.css`

## 애플리케이션 등록 및 배포

1. **글로벌 메뉴**(![Global Menu](../../../../images/icon-applications-menu.png))을 열고 **애플리케이션** 탭을 클릭한 다음 **원격 앱** 으로 이동합니다.

1. **추가** 버튼(![Add Button](../../../../images/icon-add.png))을 클릭합니다.

1. 다음 값을 입력합니다.

   | 분야         | 가치                    |
   |:---------- |:--------------------- |
   | 이름         | J1V3-원격 앱             |
   | 유형         | 커스텀 엘레멘트              |
   | HTML 요소 이름 | `j1v3-custom-element`     |
   | URL        | `.js` 파일의 WebDAV URL  |
   | CSS URL    | `.css` 파일의 WebDAV URL |
   | 인스턴스 가능    | &#10004;              |
   | 포틀릿 분류 이름  | 원격 앱                  |

1. **저장** 을 클릭합니다.

저장되면 Liferay는 J1V3-Custom-Element이라는 위젯을 생성합니다. 이 위젯은 다른 페이지 위젯처럼 사이트 페이지에 배포할 수 있습니다. 선택한 포틀릿 범주 이름 아래에 나타납니다.

J1V3-Custom-Element은 인스턴스화할 수 있으므로 각각 고유한 독립적인 구성을 가진 많은 앱을 페이지에 추가할 수 있습니다. 이 자습서에서는 페이지에 위젯을 두 번 추가합니다.

![J1V3-Custom-Element 위젯의 두 인스턴스를 배포합니다.](./using-routes-with-custom-elements/images/04.png)

## `경로` 속성 사용

자동 생성된 앱에는 `hello-world`, `hello-foo`, `hello-bar`의 세 가지 경로가 포함됩니다. 기본적으로 애플리케이션은 `hello-world` 경로를 사용합니다. 그러나 원격 애플리케이션 속성을 사용하여 대체 경로를 사용하도록 구성할 수 있습니다. [원격 앱 메뉴](#defining-a-route-property-via-the-remote-apps-menu) 또는 [위젯의 구성 옵션](#defining-a-route-property-via-widget-configuration) 을 통해 이러한 속성을 설정할 수 있습니다.

### 원격 앱 메뉴를 통해 경로 속성 정의

1. **글로벌 메뉴**(![Global Menu](../../../../images/icon-applications-menu.png))을 열고 **애플리케이션** 탭을 클릭한 다음 **원격 앱** 으로 이동합니다.

1. **J1V3-Custom-Element** 을 선택합니다.

   ![J1V3-Custom-Element을 선택합니다.](./using-routes-with-custom-elements/images/05.png)

1. 속성 필드에 `route=hello-foo` 을 입력합니다.

   ![속성 필드에 route=hello-foo를 입력합니다.](./using-routes-with-custom-elements/images/06.png)

1. **게시** 을 클릭합니다.

1. 배포된 두 위젯이 모두 `HelloFoo` 경로를 사용하는지 확인합니다.

   ![두 위젯 모두 HelloFoo 경로를 사용하는지 확인합니다.](./using-routes-with-custom-elements/images/07.png)

### 위젯 구성을 통해 경로 속성 정의

1. J1V3-Custom-Element 위젯이 포함된 페이지를 편집합니다.

1. 위젯 중 하나에 대해 **옵션** 버튼(![Options Button](../../../../images/icon-actions.png))을 클릭하고 **구성** 를 선택합니다.

   ![옵션 버튼을 클릭하고 구성을 선택합니다.](./using-routes-with-custom-elements/images/08.png)

1. 속성 필드에 `route=hello-bar` 을 입력합니다.

   ![속성 필드에 route=hello-bar를 입력합니다.](./using-routes-with-custom-elements/images/09.png)

1. **저장** 을 클릭합니다.

1. 구성된 위젯이 `hello-bar` 경로를 사용하는 반면 다른 위젯은 여전히 `hello-foo` 경로를 사용하는지 확인합니다.

   ![구성된 위젯이 HelloBar 경로를 사용하는지 확인합니다.](./using-routes-with-custom-elements/images/10.png)

## 경로 코드 분석

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/index.js
    :language: js
    :lines: 1-34
```

이 `index.js` 파일은 `HTMLElement` 인터페이스를 확장하는 `WebComponent` 클래스를 생성합니다. 이 클래스는 `App` 를 매개변수로 [`ReactDOM.render`](https://reactjs.org/docs/react-dom.html#render) 을 호출하는 인터페이스의 [`connectedCallback()`](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_custom_elements#using_the_lifecycle_callbacks) 함수를 구현합니다. `App` 이 호출되면 정의된 `"경로"` 속성을 확인하고 해당 값을 사용 가능한 경로와 비교합니다. `hello-foo` 또는 `hello-bar`과 일치하면 해당 경로를 반환하고 렌더링합니다. 그렇지 않으면 `hello-world`을 반환하고 렌더링합니다.

각 경로는 `경로` 폴더에서 `index.js` 파일로 가져옵니다.

```bash
routes
├── hello-bar
│   └── pages
│       └── HelloBar.js
├── hello-foo
│   └── pages
│       └── HelloFoo.js
└── hello-world
    └── pages
        └── HelloWorld.js
```

### HelloWorld.js

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/routes/hello-world/pages/HelloWorld.js
    :language: js
    :lines: 1-9
```

### HelloFoo.js

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/routes/hello-foo/pages/HelloFoo.js
    :language: js
    :lines: 1-9
```

### HelloBar.js

```{literalinclude} ./using-routes-with-custom-elements/resources/liferay-j1v3.zip/j1v3-custom-element/src/routes/hello-bar/pages/HelloBar.js
    :language: js
    :lines: 1-9
```

## 추가 정보

* [브라우저 기반 클라이언트 확장](../../browser-based-client-extensions.md)
* [사용자 정의 요소 및 IFrame 클라이언트 확장 이해](../understanding-custom-element-and-iframe-client-extensions.md)
* [기본 맞춤 요소 만들기](./creating-a-basic-custom-element.md)
* [원격 애플리케이션 UI 참조](../remote-applications-ui-reference.md)
