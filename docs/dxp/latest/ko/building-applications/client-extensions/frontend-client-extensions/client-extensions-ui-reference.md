# 클라이언트 확장 UI 참조

Liferay의 위젯 클라이언트 확장 [(사용자 정의 요소 및 iframe)](./client-extensions-ui-reference.md#widget-client-extensions) Liferay에 애플리케이션을 등록하여 사이트 페이지에 위젯으로 추가합니다. 또한 스타일 클라이언트 확장 [클라이언트 확장 스타일링](./client-extensions-ui-reference.md#styling-client-extensions) 생성하여 새 테마를 배포하지 않고도 페이지 스타일을 지정할 수 있습니다.

이러한 확장 프로그램을 추가하고 관리하려면

1. **전역 메뉴**(![전역 메뉴](../../../images/icon-applications-menu.png))를 열고 **응용 프로그램** 탭 &rarr; **클라이언트 확장** 으로 이동합니다.

1. 오른쪽의 **추가**(![아이콘 추가](../../../images/icon-add.png))를 클릭합니다.

1. 클라이언트 확장 유형을 선택하세요.

![Client extensions' user interface page for viewing, editing, and adding client extensions to the site](./client-extensions-ui-reference/images/01.png)

## 위젯 클라이언트 확장

[사용자 정의 요소](./understanding-custom-element-and-iframe-client-extensions.md#using-the-custom-element-type) 및 [iframe](./understanding-custom-element-and-iframe-client-extensions.md#using-the-iframe-type) 클라이언트 확장은 Liferay의 프런트 엔드 인프라를 사용하여 JavaScript 애플리케이션을 등록하고 이를 페이지 위젯으로 렌더링합니다.

위젯 확장을 생성하거나 편집할 때 선택한 클라이언트 확장 유형에 따라 다음 필드를 사용할 수 있습니다.

| 분야                                         | 묘사                                                                                                                                                                                                                                       |
| :----------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 이름                                         | 클라이언트 확장 항목 및 해당 위젯에 사용되는 표시 이름입니다. 요구하는.                                                                                                                                                                                                |
| 묘사                                         | 클라이언트 확장 항목에 대한 설명입니다.                                                                                                                                                                                                                   |
| 소스 코드 URL                                  | 편의를 위해 외부 확장 프로그램의 소스 코드에 대한 URL입니다.                                                                                                                                                                                                     |
| URL(_IFrame_)           | iframe에서 렌더링할 URL을 지정합니다. 항목의 위젯은 클라이언트 확장의 URL을 가리키는 `<iframe>` 요소에 애플리케이션을 렌더링합니다.                                                                                                                                                     |
| HTML 요소 이름(**사용자 정의 요소**) | `.js` 파일에 선언된 맞춤 요소의 이름입니다. 맞춤 요소를 생성하는 `.js` 파일은 이를 이름과 연결해야 합니다. 이 이름은 HTML 요소 이름 값과 일치해야 합니다. 요구하는.                                                                                                                                   |
| ES 모듈 사용(**맞춤 요소**)       | 브라우저가 애플리케이션의 JavaScript 삽입을 [ES 모듈](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules) 로 인식하는지 확인합니다. 활성화되면 Liferay는 클라이언트 확장을 빌드할 때 `<script src="js url" type="module">`을 사용하므로 확장은 ES6 브라우저 모듈로 처리됩니다. |
| JavaScript URL(**맞춤 요소**) | 각 확장 프로그램의 `.js` 파일에 대한 개별 URL을 입력하세요. 더 많은 URL 필드를 추가하려면 **추가**(![추가 버튼](../../../images/icon-plus.png))를 클릭하세요. 요구하는.                                                                                                 |
| CSS URL(**맞춤 요소**)        | 각 확장 프로그램의 `.css` 파일에 대한 개별 URL을 입력하세요. 더 많은 CSS URL 필드를 추가하려면 **추가**(![추가 버튼](../../../images/icon-plus.png))를 클릭하세요.                                                                                                  |
| 인스턴스 가능                                    | 클라이언트 확장의 위젯이 인스턴스화 가능한지 확인합니다. 활성화되면 위젯의 여러 인스턴스를 동일한 페이지에 추가할 수 있습니다.                                                                                                                                                                  |
| 포틀릿 또는 위젯 카테고리 이름                          | 위젯 메뉴에서 위젯 카테고리를 입력하세요. 기본값은 **클라이언트 확장** 입니다.                                                                                                                                                                                              |
| 사용자 친숙 URL 매핑                              | 위젯의 친숙한 URL 매핑을 정의하면 사용자가 더 읽기 쉬운 URL을 사용하여 참조할 수 있습니다.                                                                                                                                                                                  |
| 재산                                         | 클라이언트 확장의 모든 인스턴스에 포함된 기본 속성을 정의합니다. 이러한 속성은 프로그래밍 방식으로 액세스할 수 있도록 추가 URL 속성으로 애플리케이션에 전달됩니다. 원하는 경우 개별 위젯 인스턴스를 구성하여 이러한 항목 속성을 재정의할 수 있습니다.                                                                                            |

## 클라이언트 확장 스타일링

[CSS](../frontend-client-extensions.md#css-client-extensions) , [JavaScript](../frontend-client-extensions.md#javascript-client-extensions) , [테마 CSS](../frontend-client-extensions.md#theme-css-client-extensions) 및 [테마 favicon](../frontend-client-extensions.md#theme-favicon-client-extensions) 클라이언트 확장은 Liferay의 디자인 구현 경험을 원활하고 확장 가능하며 효율적으로 만듭니다.

이러한 클라이언트 확장을 사용하면 테마 편집 및 재배포 없이도 사이트의 기본 모양과 느낌, 동작을 확장할 수 있습니다. 대신 페이지 작성을 위해 기본 테마를 수정할 필요 없이 외부 디자인 소스를 사용하여 확장 가능한 방식으로 페이지에 직접 스타일 지정 및 JavaScript 클라이언트 확장을 추가할 수 있습니다.

스타일 확장을 생성하거나 편집할 때 선택한 클라이언트 확장 유형에 따라 다음 필드를 사용할 수 있습니다.

| 분야                                        | 묘사                                                                   |
| :---------------------------------------- | :------------------------------------------------------------------- |
| 이름                                        | 클라이언트 확장 항목에 사용되는 표시 이름입니다. 요구하는.                                    |
| 묘사                                        | 클라이언트 확장 항목에 대한 설명입니다.                                               |
| 소스 코드 URL                                 | 편의를 위해 외부 확장 프로그램의 소스 코드에 대한 URL입니다.                                 |
| CSS URL(_CSS_)         | CSS 애플리케이션이 호스팅되는 URL입니다. 이 CSS는 theme.css에 추가됩니다. 요구하는.             |
| 자바스크립트 URL(_JS_)       | JavaScript 애플리케이션이 호스팅되는 URL입니다. 이 JavaScript는 main.js에 추가됩니다. 요구하는. |
| 기본 CSS URL(**테마 CSS**)   | 기본 CSS 파일이 호스팅되는 URL입니다. 이 CSS는 main.css를 대체합니다.                     |
| Clay CSS URL(**테마 CSS**) | 클레이 CSS 파일이 호스팅되는 URL입니다. 이 CSS는 clay.css를 대체합니다.                    |
| URL(**테마 파비콘**)          | 파비콘이 호스팅되는 URL입니다. 이 파비콘은 테마의 파비콘을 대체합니다. 요구하는.                      |

```{tip}
문서 및 미디어는 클라이언트 확장에 사용할 디자인 리소스를 호스팅하는 데 권장되지 않습니다. 권한은 혼란스러울 수 있으며 결국 사용자는 이러한 리소스를 조작하거나 삭제할 수 있습니다. 또한 문서 및 미디어는 CSS 리소스에 대한 올바른 MIME 유형을 제공할 수 없습니다.
```

클라이언트 확장이 생성되면 페이지가 포함된 스타일을 읽을 수 있도록 적용할 수 있습니다. 페이지에서 클라이언트 확장을 사용하는 방법에 대한 자세한 내용을 보려면 튜토리얼 [로 이동](./tutorials.md) 원하는 클라이언트 확장 유형을 선택한 후 페이지에서 이를 적용하거나 재정의하는 단계를 따르세요.

## 관련 주제

* [프런트엔드 클라이언트 확장](../frontend-client-extensions.md)
* [사용자 정의 요소 및 IFrame 클라이언트 확장 이해](./understanding-custom-element-and-iframe-client-extensions.md) 
* [프런트엔드 클라이언트 확장 튜토리얼](./tutorials.md)
