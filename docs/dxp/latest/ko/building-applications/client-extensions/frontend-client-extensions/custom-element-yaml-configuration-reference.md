# 사용자 정의 요소 YAML 구성 참조

`client-extension.yaml` 파일을 사용하여 사용자 정의 요소 클라이언트 확장을 정의할 수 있습니다.

## 이용내역

이 `client-extension.yaml` 파일은 사용자 정의 요소 클라이언트 확장을 정의합니다.

```yaml
able-custom-element:
    cssURLs:
        - style.css
    friendlyURLMapping: vanilla-counter
    htmlElementName: vanilla-counter
    instanceable: false
    name: Able Custom Element
    portletCategoryName: category.client-extensions
    type: customElement
    urls:
        - index.js
    useESM: false
```

필수 `urls` 속성은 JavaScript 리소스에 대한 하나 이상의 경로를 지정합니다. 이러한 JavaScript 리소스 중 하나에는 맞춤 요소 초기화 코드가 포함되어 있어야 합니다.

[예제 작업공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-custom-element-1) 에는 완전한 사용자 정의 요소 클라이언트 확장이 포함되어 있습니다.

## YAML 속성

이러한 속성은 사용자 정의 요소 클라이언트 확장에만 적용됩니다.

| 이름                    | 데이터 유형                                                                               | 기정값                          | 묘사                                                                                                                                                                       |
| :-------------------- | :----------------------------------------------------------------------------------- | :--------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `cssURLs`             | 문자열 [](부분 URL) | `[]`                         | 페이지에서 맞춤 요소를 사용할 때 HTML 헤드에 추가되는 CSS 경로 목록입니다.                                                                                                                           |
| `friendlyURLMapping`  | 끈                                                                                    |                              | 특정 사용자 정의 요소 위젯에 친숙한 URL 접두사를 매핑합니다.                                                                                                                                     |
| `htmlElementName`     | 끈                                                                                    |                              | 페이지 마크업에 렌더링되는 사용자 정의 요소를 참조하는 HTML 요소 이름입니다.                                                                                                                            |
| `instanceable`        | 허위 사실                                                                                | `false`                      | 사용자 정의 요소 위젯이 페이지에 여러 번 표시될 수 있는지 여부입니다.                                                                                                                                 |
| `portletCategoryName` | 끈                                                                                    | `category.client-extensions` | 맞춤 요소 위젯의 메뉴 카테고리입니다.                                                                                                                                                    |
| `properties`          | 끈[]                              | `[]`                         | 사용자 정의 HTML 요소에 속성으로 추가할 속성입니다. 개행 문자를 구분 기호로 사용하고 Java 속성으로 처리됩니다.                                                                                                      |
| `urls`                | 문자열 [](부분 URL) |                              | (필수) 페이지에서 위젯을 사용할 때 HTML 헤드에 추가되는 JavaScript 리소스에 대한 경로 목록입니다. 이러한 리소스 중 하나에는 맞춤 요소 초기화 코드가 포함되어 있어야 합니다. 이는 'baseURL'과 결합하여 완전한 URL을 형성합니다.         |
| `useESM`              | 허위 사실                                                                                | `false`                      | JavaScript 코드가 [ESM](https://nodejs.org/api/esm.html#modules-ecmascript-modules) 형식을 사용하는지 여부입니다. `true`인 경우 JavaScript는 `type="module"` 속성을 사용하여 페이지에 추가됩니다. |

모든 프런트 엔드 클라이언트 확장에 공통되는 속성은 [프런트 엔드 클라이언트 확장 속성](../frontend-client-extensions.md#frontend-client-extension-properties) 참조하세요.

## 관련 주제

* [프런트엔드 클라이언트 확장](../frontend-client-extensions.md)
* [클라이언트 확장 작업](../working-with-client-extensions.md)
* [IFrame YAML 구성 참조](./iframe-yaml-configuration-reference.md)
