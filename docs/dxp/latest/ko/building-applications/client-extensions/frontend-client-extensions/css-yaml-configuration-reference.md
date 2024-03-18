# CSS YAML 구성 참조

`client-extension.yaml` 파일로 CSS 클라이언트 확장을 정의할 수 있습니다.

## 사용내역

이 `client-extension.yaml` 파일은 CSS 클라이언트 확장 정의를 정의합니다.

```yaml
able-global-css:
    name: Able Global CSS
    type: globalCSS
    url: global.css
```

필수 `url` 속성은 CSS 리소스 파일의 사이트를 정의합니다. 여기에 포함된 CSS는 테마에서 이미 사용된 스타일에 추가됩니다. 충돌이 발생하면 클라이언트 확장의 CSS가 페이지에 이미 있는 스타일을 재정의합니다.

[예제 작업 공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-global-css) 에는 완전한 CSS 클라이언트 확장이 포함되어 있습니다.

## YAML 속성

이러한 속성은 CSS 클라이언트 확장에 따라 다릅니다.

| 이름    | 데이터 유형 | 묘사                                                                               |
|:----- |:------ |:-------------------------------------------------------------------------------- |
| `url` | URL    | (필수) 페이지에서 활성화된 경우 페이지의 CSS에 추가된 CSS 파일의 경로입니다. 전체 URI에는 `baseURL` 값이 접두사로 붙습니다. |

모든 프런트 엔드 클라이언트 확장에 공통적인 속성은 [프런트 엔드 클라이언트 확장 속성](../frontend-client-extensions.md#frontend-client-extension-properties) 참조하십시오.

## 관련 주제

* [프런트 엔드 클라이언트 확장](../frontend-client-extensions.md)
* [클라이언트 확장 작업](../working-with-client-extensions.md)
* [테마 CSS YAML 구성 참조](./theme-css-yaml-configuration-reference.md)
