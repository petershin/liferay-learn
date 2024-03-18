# React 차트에서 객체 데이터 사용하기

여기서는 [개의 개체](../objects.md) , [헤드리스 API](../objects/understanding-object-integrations/using-custom-object-apis.md) 및 [사용자 정의 요소 원격 애플리케이션](../client-extensions/frontend-client-extensions/tutorials/creating-a-basic-custom-element.md) 를 사용하여 데이터 대시보드에 대한 동적 차트를 생성합니다. 먼저 Object API 호출에 대해 [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) 활성화된 새 DXP 인스턴스를 설정합니다. 그런 다음 데이터를 수신하고 저장하기 위한 개체를 만듭니다. REST API를 사용하여 객체에 데이터를 추가한 후 제공된 React [FusionCharts](https://www.fusioncharts.com/dev/getting-started/react/your-first-chart-using-react) 애플리케이션을 다운로드하고 빌드합니다. 코드가 컴파일되면 생성된 `.js` 파일을 Liferay 문서 라이브러리에 호스팅하고 해당 WebDAV URL을 복사합니다. 마지막으로 이 URL을 사용하여 React 차트용 원격 앱을 만들고 이를 페이지 위젯으로 배포합니다.

차트는 5초마다 Headless API를 통해 개체를 호출하도록 구성되어 개체의 데이터를 반환하고 차트를 동적으로 업데이트합니다.

![Use Liferay Objects with React charts to create dynamic visuals for data dashboard.](./using-object-data-with-react-charts/images/01.gif)

## Liferay DXP 설정

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계에 따라 `/o/c/*` URL 패턴을 **기본 포털 CORS 구성** 에 추가하세요.

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **보안 도구** 를 클릭합니다.

1. **포털 CORS(Cross-Origin Resource Sharing**) 탭으로 이동하여 **기본 포털 CORS 구성** 을 클릭합니다.

   ![Click Default Portal CORS Configuration](./using-object-data-with-react-charts/images/02.png)

1. `/o/c/*` 값으로 **URL 패턴** 을 추가하고 **저장** 을 클릭하세요. 이를 통해 모든 객체 API에 대해 CORS가 활성화됩니다.

   ![Add the /o/c/* URL Pattern for Object APIs.](./using-object-data-with-react-charts/images/03.png)

## React 차트용 객체 생성

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **개체** 를 클릭합니다.

1. **추가** 버튼(![추가 버튼](../../images/icon-add.png))을 클릭하고 다음 값을 입력합니다.

   | 분야    | 가치      |
   | :---- | :------ |
   | 라벨    | X3J8-객체 |
   | 복수 라벨 | X3J8-객체 |
   | 이름    | X3J8객체  |

   ```{note}
   제공된 React 앱은 이러한 값을 사용합니다.
   ```

1. 새 **개체** 초안을 선택하고 **필드** 탭을 클릭한 후 다음 **필드** 를 추가하세요.

   | 라벨 | 필드 이름 | 유형 | 요구하는 |
   | :- | :---- | :- | :--- |
   | 라벨 | 라벨    | 원본 | ✔    |
   | 가치 | 가치    | 정수 | ✔    |

1. **세부정보** 탭을 클릭하고 **게시** 를 클릭하세요.

[객체 게시](../objects/creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 은 데이터 수신 및 저장을 위한 새 애플리케이션을 생성하고 활성화합니다. 이제 Liferay UI 또는 Headless API를 통해 액세스할 수 있습니다.

## 헤드리스 API를 사용하여 객체에 데이터 추가

1. Liferay의 **API 탐색기**(예: `localhost:8080/o/api`)를 열고 **REST 응용 프로그램** 드롭다운 메뉴를 클릭한 다음 **c/x3j8objects** 를 클릭합니다.

1. 일괄 `POST` API에 대한 요청 본문에 다음 데이터를 입력합니다.

   ```json
   [
     {
       "label": "FOO",
       "value": "250"
     },
     {
       "label": "BAR",
       "value": "200"
     },
     {
       "label": "GOO",
       "value": "150"
     },
     {
       "label": "BAZ",
       "value": "100"
     },
     {
       "label": "QUX",
       "value": "50"
     }
   ]
   ```

1. **실행** 을 클릭하여 개체에 데이터 항목을 추가합니다.

데이터 추가가 완료되면 제공된 React 서버를 설정할 수 있습니다. 여기에는 X3J8-Object에 대한 API 호출을 만들고 해당 데이터를 표시하는 FusionChart 구현이 포함됩니다.

## React 차트 설정

React 애플리케이션을 다운로드하고 빌드하려면 다음 단계를 따르세요.

1. [React 프로젝트](./liferay-x3j8.zip) 다운로드하고 압축을 푼다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/tutorials/liferay-x3j8.zip -O
   ```

   ```bash
   unzip liferay-x3j8.zip
   ```

   ```bash
   cd liferay-x3j8
   ```

1. `node`와 `yarn`이 설치되어 있는지 확인하세요. 그렇지 않은 경우 다음 명령을 실행하고 프롬프트를 따르십시오.

   ```bash
   ./setup_tutorial.sh
   ```

1. React 애플리케이션 폴더로 이동하여 React 서버를 시작합니다.

   ```bash
   cd x3j8-custom-element
   ```

   ```bash
   yarn start
   ```

   시작되면 `localhost:3000`으로 이동하여 React 차트를 확인하세요. 기본 인증을 사용하여 `c/x3j8objects` 서비스를 호출하고 5초마다 개체의 데이터를 검색합니다.

   ![View the React chart at localhost:3000.](./using-object-data-with-react-charts/images/04.png)

1. React 프로젝트를 빌드합니다.

   ```bash
   yarn build
   ```

   이 명령은 애플리케이션을 원격 앱으로 실행하는 데 필요한 파일이 포함된 최적화된 프로덕션 빌드를 생성합니다.

1. 빌드가 성공했는지 확인하고 애플리케이션의 `.js` 파일을 기록해 둡니다.

   ```bash
   Creating an optimized production build...
   Compiled successfully.

   File sizes after gzip:

     523.77 kB  build/static/js/main.5a6819d5.js
     20 B       build/static/css/main.31d6cfe0.css
   ```

   ```{note}
   이 튜토리얼에서는 `.css` 파일이 필요하지 않습니다.
   ```

코드가 컴파일되면 Liferay 문서 라이브러리에서 애플리케이션의 '.js' 파일을 호스팅하고 해당 WebDAV URL을 복사할 수 있습니다.

## 애플리케이션의 `.js` 파일 호스팅

1. **사이트 메뉴**(![사이트 메뉴](../../images/icon-product-menu.png))를 열고 **콘텐츠 및 데이터** 를 확장한 다음 **문서 및 미디어** 를 클릭합니다.

1. '.js' 파일을 업로드 영역으로 끌어다 놓습니다.

   문서 라이브러리에 업로드되면 파일에는 원격 앱을 만드는 데 사용되는 고유한 WebDAV URL이 할당됩니다.

1. **정보** 아이콘(![정보 아이콘](../../images/icon-information.png))을 클릭하고 **업로드된 파일** 을 선택합니다.

1. 파일의 **WebDAV URL** 을 복사하고 다음 단계에서 사용할 수 있도록 저장하세요.

   예를 들어 `http://localhost:8080/webdav/guest/document_library/main.5a6819d5.js`입니다.

   ![Copy the .js file's WebDAV URL.](./using-object-data-with-react-charts/images/05.png)

## React 차트용 원격 앱 만들기

1. **전역 메뉴**(![전역 메뉴](../../images/icon-applications-menu.png))를 열고 **응용 프로그램** 탭을 클릭한 다음 **원격 앱** 을 선택합니다.

1. **추가** 버튼(![추가 버튼](../../images/icon-add.png))을 클릭합니다.

1. 다음 값을 입력하세요.

   | 분야         | 가치                    |
   | :--------- | :-------------------- |
   | 이름         | X3J8-사용자 정의 요소        |
   | 유형         | 커스텀 엘레멘트              |
   | HTML 요소 이름 | `x3j8-custom-element` |
   | URL        | `.js` 파일의 WebDAV URL  |
   | 포틀릿 분류 이름  | 원격 앱                  |

1. **저장** 을 클릭하세요.

저장되면 Liferay는 사이트 페이지에 배포할 수 있는 원격 앱용 위젯을 생성합니다. 이 위젯은 애플리케이션의 포틀릿 카테고리 이름(예: 이 튜토리얼에서는 **원격 앱**) 아래에 나열됩니다.

![You can deploy the remote app widget to Site Pages.](./using-object-data-with-react-charts/images/06.png)

## 관련 주제

* [개체 개요](../objects.md)
* [헤드리스 프레임워크 통합](../objects/understanding-object-integrations/using-custom-object-apis.md)
* [CORS 설정](../../installation-and-upgrades/securing-liferay/securing-web-services/setting-up-cors.md)
