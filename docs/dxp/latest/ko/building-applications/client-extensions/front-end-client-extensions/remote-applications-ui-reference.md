# 원격 애플리케이션 UI 참조
<!-- TASK: Rename article and add reference material for the other four client extensions; also, maybe reconsider the use of "remote" and "external"-->
[사용자 정의 요소](./understanding-custom-element-and-iframe-client-extensions.md#using-custom-elements) 및 [IFrame](./understanding-custom-element-and-iframe-client-extensions.md#using-iframes) 클라이언트 확장은 Liferay의 프런트 엔드 인프라를 사용하여 JavaScript 애플리케이션을 등록하고 이를 페이지 위젯으로 렌더링합니다. 이러한 확장 프로그램을 추가하고 관리하려면 **전역 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **애플리케이션** 탭을 클릭한 다음 **원격 앱** 으로 이동합니다.

확장을 생성하거나 편집할 때 선택한 클라이언트 확장 유형(예: 사용자 정의 요소 또는 IFrame)에 따라 다음 필드를 사용할 수 있습니다.

| 분야                  | 묘사                                                                                                                                                                                                                                |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 이름                  | 원격 애플리케이션 항목 및 해당 위젯에 사용되는 표시 이름입니다.                                                                                                                                                                                              |
| 묘사                  | 원격 애플리케이션 항목에 대한 설명입니다.                                                                                                                                                                                                           |
| 소스 코드 URL           | 편의상 외부 애플리케이션의 소스 코드에 대한 URL입니다.                                                                                                                                                                                                  |
| 유형                  | 현재 Liferay는 사용자 정의 요소와 IFrame의 두 가지 유형을 지원합니다. 이러한 유형은 Liferay 플랫폼과 외부 애플리케이션 간의 계약을 결정합니다.                                                                                                                                       |
| URL(**IFrame**)       | 외부 애플리케이션이 호스팅되는 URL입니다. 항목의 위젯은 원격 애플리케이션의 URL을 가리키는 `<iframe>` 요소에서 애플리케이션을 렌더링합니다.                                                                                                                                       |
| HTML 요소 이름(**맞춤 요소**) | `.js` 파일에 선언된 맞춤 요소의 이름입니다. 사용자 정의 요소를 생성하는 `.js` 파일은 이를 이름과 연결해야 합니다. 이 이름은 HTML 요소 이름 값과 일치해야 합니다.                                                                                                                              |
| ES 모듈 사용(**맞춤 요소**)   | 브라우저가 애플리케이션의 JS 주입을 [ES 모듈](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules) 로 인식하는지 확인합니다. 활성화되면 Liferay는 원격 애플리케이션을 구축할 때 `<script src="js url" type="module">` 를 사용하므로 애플리케이션이 ES6 브라우저 모듈로 처리됩니다. |
| URL(**맞춤 요소**)        | 애플리케이션의 각 `.js` 파일에 대한 개별 URL을 입력합니다. 더 많은 URL 필드를 추가하려면 **추가**(![Add Button](../../../images/icon-plus.png))을 클릭하십시오.                                                                                                             |
| CSS URL(**맞춤 요소**)    | 애플리케이션의 `.css` 파일 각각에 대한 개별 URL을 입력합니다. 더 많은 CSS URL 필드를 추가하려면 **추가**(![Add Button](../../../images/icon-plus.png))을 클릭하십시오.                                                                                                       |
| 인스턴스 가능             | 원격 애플리케이션의 위젯이 인스턴스화 가능한지 확인합니다. 활성화되면 위젯의 여러 인스턴스를 동일한 페이지에 추가할 수 있습니다.                                                                                                                                                          |
| 포틀릿 분류 이름           | 위젯 메뉴에서 위젯의 카테고리를 입력하세요. 기본값은 **원격 앱** 입니다.                                                                                                                                                                                          |
| 사용자 친숙 URL 매핑       | 사용자가 더 쉽게 읽을 수 있는 URL을 사용하여 위젯을 참조할 수 있도록 위젯의 친숙한 URL 매핑을 정의합니다.                                                                                                                                                                  |
| 재산                  | 애플리케이션 위젯의 모든 인스턴스에 포함되는 기본 속성을 정의합니다. 이러한 속성은 프로그래밍 방식으로 액세스하기 위한 추가 URL 속성으로 위젯에 의해 원격 애플리케이션에 전달됩니다. 원하는 경우 이러한 항목 속성을 재정의하도록 개별 위젯 인스턴스를 구성할 수 있습니다.                                                                          |

## 관련 주제

* [프런트 엔드 클라이언트 확장](../front-end-client-extensions.md)
* [사용자 정의 요소 및 IFrame 클라이언트 확장 이해](./understanding-custom-element-and-iframe-client-extensions.md)
* [기본 맞춤 요소 만들기](./tutorials/creating-a-basic-custom-element.md)
