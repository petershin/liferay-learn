---
uuid: c79386c9-9344-49e3-bfd4-626b4f8750ed
---

# JavaScript YAML 구성 참조

`client-extension.yaml` 파일로 JavaScript 클라이언트 확장을 정의할 수 있습니다.

## 사용내역

이 `client-extension.yaml` 파일은 JavaScript 클라이언트 확장을 정의합니다.

```yaml
able-global-js:
    name: Able Global JS
    type: globalJS
    url: global.js
```

필수 `url` 속성은 JavaScript 리소스 파일의 위치를 정의합니다. 페이지에서 활성화되면 이 경로의 JavaScript가 각 페이지 로드에서 실행됩니다.

[예제 작업 공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-global-js) 에는 완전한 JavaScript 클라이언트 확장이 포함되어 있습니다.

## YAML 속성

이러한 속성은 JavaScript 클라이언트 확장에 따라 다릅니다.

| 이름    | 데이터 유형 | 묘사                                                                                           |
|:----- |:------ |:-------------------------------------------------------------------------------------------- |
| `url` | URL    | (필수) 클라이언트 확장이 활성화될 때 페이지의 HEAD에 추가되는 JavaScript 파일의 경로입니다. 전체 URI에는 `baseURL` 값이 접두사로 붙습니다. |

모든 프런트 엔드 클라이언트 확장에 공통적인 속성은 [프런트 엔드 클라이언트 확장 속성](../front-end-client-extensions.md#front-end-client-extension-properties) 참조하십시오.

## 추가 정보

* [프런트 엔드 클라이언트 확장](../front-end-client-extensions.md)
* [클라이언트 확장 작업](../working-with-client-extensions.md)
* [테마 JS YAML 구성 참조](./theme-js-yaml-configuration-reference.md)
