# 테마 JS YAML 구성 참조

`client-extension.yaml` 파일로 테마 JS 클라이언트 확장을 정의할 수 있습니다.

## 사용내역

이 `client-extension.yaml` 파일은 테마 JS 클라이언트 확장을 정의합니다.

```yaml
able-theme-js:
    name: Able Theme JS
    type: themeJS
    url: main.js
```

필수 `url` 속성은 JavaScript 파일의 사이트를 정의합니다. 페이지에서 활성화되면 페이지가 로드될 때마다 URL의 모든 JavaScript 리소스가 실행됩니다.

<!--TODO: are any additional resources available for theme JS as opposed to normal JS? Is there any functional difference in how it runs? -->

## YAML 속성

이러한 속성은 테마 JS 클라이언트 확장에 따라 다릅니다.

| 이름    | 데이터 유형 | 묘사                                                                          |
|:----- |:------ |:--------------------------------------------------------------------------- |
| `url` | URL    | (필수) 페이지의 HEAD에 추가되는 JavaScript 파일의 경로입니다. 전체 URI에는 `baseURL` 값이 접두사로 붙습니다. |


모든 프런트 엔드 클라이언트 확장에 공통적인 속성은 [프런트 엔드 클라이언트 확장 속성](../front-end-client-extension-properties) 참조하십시오.

## 추가 정보

* [프런트 엔드 클라이언트 확장](../front-end-client-extensions.md)
* [클라이언트 확장 작업](../working-with-client-extensions.md)
* [JavaScript YAML 구성 참조](./javascript-yaml-configuration-reference.md)
