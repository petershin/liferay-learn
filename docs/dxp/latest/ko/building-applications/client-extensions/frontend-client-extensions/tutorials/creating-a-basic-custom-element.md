# 기본 맞춤 요소 만들기

{bdg-secondary}`liferay 7.4+`

사용자 정의 요소 클라이언트 확장은 Liferay의 프런트 엔드 인프라를 사용하여 Liferay 플랫폼에 외부 원격 애플리케이션을 등록하고 이를 위젯으로 렌더링합니다.

```{warning}
다른 유형의 클라이언트 확장과 같은 사용자 정의 요소 또는 IFrame을 배포하는 것은 Liferay 7.4의 **베타 기능**입니다. 이 튜토리얼은 사용자 정의 요소 원격 애플리케이션을 다르게 배포하며 향후 업데이트까지 여전히 권장되는 접근 방식입니다.
```

여기에서는 Liferay의 [`create_custom_element.sh`](https://raw.githubusercontent.com/liferay/liferay-portal/master/tools/create_custom_element.sh) 스크립트를 사용하여 기본 원격 애플리케이션을 생성합니다. 애플리케이션이 생성된 후 해당 코드를 컴파일하고 `.js` 및 `.css` 파일을 호스팅합니다. 호스팅되면 각 파일의 URL을 복사하여 이를 사용하여 맞춤 요소를 만듭니다. 마지막으로 애플리케이션을 사이트 페이지에 위젯으로 배포할 수 있습니다.

![Use the create_custom_element.sh script to create a simple React application.](./creating-a-basic-custom-element/images/01.png)

```{note}
사용자 정의 요소 클라이언트 확장은 구축, 패키지 또는 호스팅 방법에 관계없이 모든 기술을 사용할 수 있습니다. 이 튜토리얼에서는 React를 사용하는 샘플 사용자 정의 요소 애플리케이션만 제공합니다.
```

`create_custom_element.sh`를 실행하려면 [버전의 Node.JS](https://nodejs.org/) , [NPM](https://www.npmjs.com/) 및 [YARN](https://classic.yarnpkg.com/) 가 필요합니다. 계속하기 전에 이러한 도구가 설치되어 있는지 확인하십시오.

## `create_custom_element.sh` 스크립트 실행

`create_custom_element.sh`를 호출할 때 유효한 HTML 요소 이름을 제공하고 원하는 JavaScript 프레임워크(예: React 또는 Vue)를 지정해야 합니다.

다음 명령을 실행하여 React 애플리케이션의 코드를 생성하세요.

```bash
curl -Ls https://github.com/liferay/liferay-portal/raw/master/tools/create_custom_element.sh | bash -s h5v7-custom-element react
```

이는 사용자 정의 HTML 요소 이름(`h5v7-custom-element`)과 원하는 JavaScript 프레임워크(`react`)라는 두 가지 인수를 사용하여 스크립트를 호출합니다.

실행이 완료되면 스크립트는 `h5v7-custom-element`라는 폴더에 다음 요소가 포함된 새 React 애플리케이션을 자동으로 생성합니다.

```bash
h5v7-custom-element
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
│       │   ├── components
│       │   └── pages
│       │       └── HelloBar.js
│       ├── hello-foo
│       │   ├── components
│       │   └── pages
│       │       └── HelloFoo.js
│       └── hello-world
│           ├── components
│           └── pages
│               └── HelloWorld.js
└── yarn.lock
```

### `index.js` 파일 이해

```{literalinclude} ./creating-a-basic-custom-element/resources/liferay-h5v7.zip/h5v7-custom-element/src/index.js
    :language: js
```

생성된 `index.js` 파일에는 애플리케이션을 Liferay 사용자 정의 요소 원격 애플리케이션으로 사용하는 데 필요한 두 가지 사용자 정의가 포함되어 있습니다.

* `WebComponent`: 21행에서 애플리케이션은 Liferay의 프레임워크에 연결할 수 있도록 `WebComponent`로 선언됩니다.
* `ELEMENT_ID`: 30행에서 `ELEMENT_ID`는 기존 `<div id="root" />`대신 `h5v7-custom-element`로 설정됩니다. 이는 원격 애플리케이션의 HTML 요소 이름이 애플리케이션의 `ELEMENT_ID` 와 일치해야 하며 `<div id="root" />` 은 이 용도로 작동하지 않기 때문입니다.

### React 경로 이해

생성된 코드에는 `hello-world`(기본값), `hello-foo`, `hello-bar`라는 세 가지 경로가 포함되어 있습니다. 경로는 애플리케이션을 실행할 때 사용할 수 있는 대체 코드 세트입니다. 기본 예는 [사용자 정의 요소와 함께 경로 사용](./using-routes-with-custom-elements.md) 참조하세요.

## React 애플리케이션 구축

`create_custom_element.sh`를 실행한 후 새 `h5v7-custom-element` 폴더로 이동하여 애플리케이션을 빌드합니다.

```bash
cd h5v7-custom-element
```

```bash
yarn build
```

이 명령은 애플리케이션 실행에 필요한 `.js` 및 `.css` 파일을 포함하는 최적화된 프로덕션 빌드를 생성합니다.

계속하기 전에 코드가 성공적으로 컴파일되었는지 확인하고 애플리케이션의 `.js` 및 `.css` 파일을 기록해 두세요.

```
최적화된 프로덕션 빌드 생성 중...
성공적으로 컴파일되었습니다.

gzip 이후 파일 크기:

  43.51 kB build/static/js/main.114dde4a.js
  121 B build/static/css/main.9877909d.css
```

이러한 파일은 Liferay에 액세스할 수 있는 사이트
에 [호스팅](#hosting-the-application-files) 되어야 합니다. 원격 서버 또는 정적 리소스 제공에 최적화된 데이터 스토리지 시스템에서 호스팅될 수 있습니다. 데모 목적으로 이 예에서는 Liferay의 문서 라이브러리에 업로드하고 WebDAV URL을 사용하여 호스팅합니다.

```{tip}
모든 빌드에 대해 고유한 파일 이름이 생성됩니다. 사용자 정의 애플리케이션을 테스트할 때 빌드 후에 `.js` 및 `.css` 파일을 업데이트하는 것을 잊지 마세요.
```

## 애플리케이션 파일 호스팅

데모 목적으로 이 튜토리얼은 Liferay의 문서 라이브러리에서 애플리케이션의 정적 리소스를 호스팅합니다. 프로덕션 환경에서는 정적 리소스 호스팅에 최적화된 서버에서 애플리케이션 파일을 호스팅해야 합니다.

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르세요.

1. **사이트 메뉴**(![사이트 메뉴](../../../../images/icon-product-menu.png))를 열고 **콘텐츠 및 데이터** 를 확장한 다음 **문서 및 미디어** .

1. **추가**(![추가 버튼](../../../../images/icon-add.png))를 클릭하고 **여러 파일 업로드** 를 선택합니다.

1. `.js` 및 `.css` 파일을 업로드 영역으로 끌어다 놓습니다.

   또는 **파일 선택** 을 사용하여 업로드하세요.

   ![Upload the .js and .css files to the Liferay Document Library.](./creating-a-basic-custom-element/images/02.png)

1. **게시** 를 클릭하세요.

그러면 문서 라이브러리에 파일이 추가되고 원격 애플리케이션을 만드는 데 사용할 고유한 URL이 할당됩니다.

각 파일의 URL을 보려면 **정보** 아이콘(![정보 아이콘](../../../../images/icon-information.png))을 클릭하고 파일을 선택하세요. 각 파일의 **WebDAV URL** 을 복사하고 다음 단계에서 사용할 수 있도록 저장하세요.

![Copy each file's WebDAV URL.](./creating-a-basic-custom-element/images/03.png)

예를 들어,

* `http://localhost:8080/webdav/guest/document_library/main.114dde4a.js`
* `http://localhost:8080/webdav/guest/document_library/main.9877909d.css`

## Liferay에 애플리케이션 등록

1. **글로벌 메뉴**(![글로벌 메뉴](../../../../images/icon-applications-menu.png))를 열고 **애플리케이션** 탭을 클릭한 다음 **원격 앱**으로 이동합니다.

1. **추가**(![추가 버튼](../../../../images/icon-add.png))를 클릭합니다.

1. 다음 값을 입력하세요.

   | 분야         | 가치                    |
   | :--------- | :-------------------- |
   | 이름         | H5V7-맞춤 요소            |
   | 유형         | 커스텀 엘레멘트              |
   | HTML 요소 이름 | `h5v7-custom-element` |
   | URL        | `.js` 파일의 WebDAV URL  |
   | CSS URL    | `.css` 파일의 WebDAV URL |
   | 포틀릿 분류 이름  | 원격 앱                  |

1. **저장** 을 클릭하세요.

일단 저장되면 Liferay는 H5V7-Custom-Element라는 위젯을 생성합니다. 이 위젯은 다른 페이지 위젯처럼 사이트 페이지에 배포할 수 있습니다. 이 위젯은 선택한 포틀릿 카테고리 이름 아래에 나타납니다.

![Deploy the H5V7-Custom-Element widget to site pages.](./creating-a-basic-custom-element/images/04.png)

## 관련 주제

* [프런트엔드 클라이언트 확장](../../frontend-client-extensions.md)
* [사용자 정의 요소 및 IFrame 클라이언트 확장 이해](../understanding-custom-element-and-iframe-client-extensions.md)
* [사용자 정의 요소와 함께 경로 사용](./using-routes-with-custom-elements.md)
* [원격 애플리케이션 UI 참조](../client-extensions-ui-reference.md)
