# React 차트에서 개체 데이터 사용

여기에서 [개 개체](../../objects.md), [헤드리스 API](../understanding-object-integrations/headless-framework-integration.md)및 [사용자 지정 요소 원격 애플리케이션](../../client-extensions/front-end-client-extensions/tutorials/creating-a-basic-custom-element.md) 를 사용하여 데이터 대시보드용 동적 차트를 생성합니다. 먼저 개체 API 호출에 대해 [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) 활성화된 새 DXP 인스턴스를 설정합니다. 그런 다음 데이터를 수신하고 저장하기 위한 개체를 만듭니다. REST API를 사용하여 개체에 데이터를 추가한 후 제공된 React [FusionCharts](https://www.fusioncharts.com/dev/getting-started/react/your-first-chart-using-react) 애플리케이션을 다운로드하고 빌드합니다. 코드가 컴파일되면 생성된 `.js` 파일을 Liferay 문서 라이브러리에 호스팅하고 해당 WebDAV URL을 복사합니다. 마지막으로 이 URL을 사용하여 React 차트용 원격 앱을 만들고 이를 페이지 위젯으로 배포합니다.

차트는 5초마다 헤드리스 API를 통해 개체를 호출하도록 구성되어 개체의 데이터를 반환하고 차트를 동적으로 업데이트합니다.

![React 차트와 함께 Liferay 개체를 사용하여 데이터 대시보드를 위한 동적 시각적 개체를 만듭니다.](./using-object-data-with-react-charts/images/01.gif)

## Liferay DXP 설정

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계에 따라 `/o/c/*` URL 패턴을 **기본 포털 CORS 구성** 에 추가합니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../../../images/icon-applications-menu.png)를 열고 **제어판** 탭으로 이동한 다음 **보안 도구** 를 클릭합니다.

1. **Portal CORS(Cross-Origin Resource Sharing**) 탭으로 이동하고 **Default Portal CORS Configuration** 을 클릭합니다.

    ![기본 포털 CORS 구성 클릭](./using-object-data-with-react-charts/images/02.png)

1. `/o/c/*` 값으로 **URL 패턴** 을 추가하고 **저장** 을 클릭합니다. 이렇게 하면 모든 개체 API에 대해 CORS가 활성화됩니다.

    ![객체 API에 대한 /o/c/* URL 패턴을 추가합니다.](./using-object-data-with-react-charts/images/03.png)

## React 차트용 객체 만들기

1. **Global Menu**(![Global Menu](../../../images/icon-applications-menu.png))를 열고 **Control Panel** 탭으로 이동한 다음 **Objects** 를 클릭합니다.

1. **추가** 버튼(![추가 버튼](../../../images/icon-add.png))을 클릭하고 다음 값을 입력합니다.

    | 필드 | 가치 |
    | :--- | :--- |
    | 라벨 | X3J8-Object |
    | 복수 라벨 | X3J8-Objects |
    | 이름 | X3J8Object |

   ```{note}
   제공된 React 앱은 이러한 값을 사용합니다.
   ```

1. 새 **개체** 초안을 선택하고 **필드** 탭을 클릭한 다음 다음 **필드** 추가합니다.

   | 라벨 | 필드 이름 | 유형 | 요구하는     |
   |:-- |:----- |:-- |:-------- |
   | 라벨 | 라벨    | 원본 | &#10004; |
   | 가치 | 가치    | 정수 | &#10004; |

1. **세부 정보** 탭을 클릭하고 **게시** 클릭합니다.

[Publishing an Object](../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 은 데이터 수신 및 저장을 위한 새로운 애플리케이션을 생성하고 활성화합니다. 이제 Liferay UI 또는 Headless API를 통해 액세스할 수 있습니다.

## 헤드리스 API를 사용하여 개체에 데이터 추가

1. Liferay의 **API Explorer**(예: `localhost:8080/o/api`)을 열고 **REST Applications** 드롭다운 메뉴를 클릭한 다음 **c/x3j8objects** 을 클릭합니다.

1. 배치 `POST` API에 대한 요청 본문에 이 데이터를 입력합니다.

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

1. **실행** 클릭하여 개체에 데이터 항목을 추가합니다.

데이터 추가가 완료되면 제공된 React 서버를 설정할 수 있습니다. 여기에는 X3J8-Object에 대한 API 호출을 수행하고 해당 데이터를 표시하는 FusionChart 구현이 포함됩니다.

## 반응 차트 설정

React 애플리케이션을 다운로드하고 빌드하려면 다음 단계를 따르세요.

1. [React 프로젝트](./liferay-x3j8.zip) 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/liferay-x3j8.zip -O
   ```

   ```bash
   unzip liferay-x3j8.zip
   ```

   ```bash
   cd liferay-x3j8
   ```

1. `노드` 과 `얀` 설치되어 있는지 확인합니다. 그렇지 않은 경우 다음 명령을 실행하고 프롬프트를 따릅니다.

   ```bash
   ./setup_tutorial.sh
   ```

1. React 애플리케이션의 폴더로 이동하여 React 서버를 시작합니다.

   ```bash
   cd x3j8-custom-element
   ```

   ```bash
   yarn start
   ```

   시작되면 `localhost:3000` 로 이동하여 React 차트를 봅니다. 기본 인증을 사용하여 `c/x3j8objects` 서비스를 호출하고 5초마다 객체의 데이터를 검색합니다.

   ![localhost:3000에서 React 차트를 확인하세요.](./using-object-data-with-react-charts/images/04.png)

1. React 프로젝트를 빌드합니다.

   ```bash
   yarn build
   ```

   이 명령은 애플리케이션을 원격 앱으로 실행하는 데 필요한 파일을 포함하는 최적화된 프로덕션 빌드를 생성합니다.

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

코드가 컴파일되면 Liferay 문서 라이브러리에서 애플리케이션의 `.js` 파일을 호스팅하고 해당 WebDAV URL을 복사할 수 있습니다.

## 애플리케이션의 `.js` 파일 호스팅

1. **사이트 메뉴**(![Site Menu](../../../images/icon-product-menu.png))을 열고 **콘텐츠 & 데이터** 확장한 다음 **문서 및 미디어** 클릭합니다.

1. `.js` 파일을 업로드 영역으로 끌어다 놓습니다.

   문서 라이브러리에 업로드하면 원격 앱을 만드는 데 사용할 고유한 WebDAV URL이 파일에 할당됩니다.

1. **정보** 아이콘(![Info Icon](../../../images/icon-information.png))을 클릭하고 **업로드된 파일** 선택합니다.

1. 파일의 **WebDAV URL** 을 복사하고 다음 단계에서 사용할 수 있도록 저장합니다.

   예: `http://localhost:8080/webdav/guest/document_library/main.5a6819d5.js`.

   ![.js 파일의 WebDAV URL을 복사합니다.](./using-object-data-with-react-charts/images/05.png)

## React 차트용 원격 앱 만들기

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **애플리케이션** 탭을 클릭한 다음 **원격 앱** 선택합니다.

1. **추가** 버튼(![Add Button](../../../images/icon-add.png))을 클릭합니다.

1. 다음 값을 입력합니다.

   | 분야         | 가치                    |
   |:---------- |:--------------------- |
   | 이름         | X3J8-Custom-Element            |
   | 유형         | 커스텀 엘레멘트              |
   | HTML 요소 이름 | `x3j8-custom-element` |
   | URL        | `.js` 파일의 WebDAV URL  |
   | 포틀릿 분류 이름  | 원격 앱                  |

1. **저장** 클릭합니다.

일단 저장되면 Liferay는 사이트 페이지에 배포할 수 있는 원격 앱용 위젯을 생성합니다. 이 위젯은 애플리케이션의 포틀릿 범주 이름(예: 이 자습서의 경우 **원격 앱**) 아래에 나열됩니다.

![사이트 페이지에 원격 앱 위젯을 배포할 수 있습니다.](./using-object-data-with-react-charts/images/06.png)

## 추가 정보

* [개체 개요](../../objects.md)
* [헤드리스 프레임워크 통합](../understanding-object-integrations/headless-framework-integration.md)
* [CORS 설정](../../../installation-and-upgrades/securing-liferay/securing-web-services/setting-up-cors.md)
