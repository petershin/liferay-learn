# JavaScript YAML 구성 참조

`client-extension.yaml` 파일을 사용하여 JavaScript 클라이언트 확장을 정의할 수 있습니다.

## 이용내역

이 `client-extension.yaml` 파일은 JavaScript 클라이언트 확장을 정의합니다.

```yaml
able-global-js:
    name: Able Global JS
    type: globalJS
    url: global.js
```

필수 `url` 속성은 JavaScript 리소스 파일의 사이트
를 정의합니다. 페이지에서 활성화되면 이 경로의 JavaScript가 각 페이지 로드 시 실행됩니다.

[예제 작업공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-global-js) 에는 완전한 JavaScript 클라이언트 확장이 포함되어 있습니다.

## YAML 속성

다음 속성은 JavaScript 클라이언트 확장에만 적용됩니다.

| 이름    | 데이터 유형 | 묘사                                                                                                           |
| :---- | :----- | :----------------------------------------------------------------------------------------------------------- |
| `url` | URL    | (필수) 클라이언트 확장이 활성화되면 페이지의 HEAD에 추가되는 JavaScript 파일의 경로입니다. 전체 URI에는 `baseURL` 값이 앞에 붙습니다. |

모든 프런트 엔드 클라이언트 확장에 공통되는 속성은 [프런트 엔드 클라이언트 확장 속성](../frontend-client-extensions.md#frontend-client-extension-properties) 참조하세요.

## 관련 주제

* [프런트엔드 클라이언트 확장](../frontend-client-extensions.md) 
* [클라이언트 확장 작업](../working-with-client-extensions.md) 
