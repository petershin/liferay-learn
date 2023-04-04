---
uuid: d5930388-d026-4c77-bcc1-dd9d4b985869
---

# IFrame YAML 구성 참조

`client-extension.yaml` 파일로 IFrame 클라이언트 확장을 정의할 수 있습니다.

## 데이터 사용량

이 `client-extension.yaml` 파일은 IFrame 클라이언트 확장을 정의합니다.

```yaml
able-iframe:
    name: Able IFrame
    type: iframe
    url: https://arnab-datta.github.io/counter-app
```

필수 `url` 속성은 IFrame 위젯 내에 삽입할 HTML 페이지를 가리킵니다.

[예제 작업 공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-iframe-1) 에는 완전한 IFrame 클라이언트 확장이 포함되어 있습니다.

## YAML 속성

이러한 속성은 IFrame 클라이언트 확장에 따라 다릅니다.

| 이름                    | 데이터 유형 | 기정값     | 묘사                                       |
|:--------------------- |:------ |:------- |:---------------------------------------- |
| `friendlyURLMapping`  | 끈      |         | 친숙한 URL 접두사를 특정 IFrame 위젯에 매핑합니다.        |
| `portletCategoryName` | 끈      |         | IFrame 위젯의 메뉴 카테고리입니다.                   |
| `url`                 | URL    |         | (필수) IFrame 위젯에 삽입할 HTML 페이지의 전체 URL입니다. |
| `instanceable`        | 허위 사실  | `false` | IFrame 위젯이 한 페이지에 여러 번 표시될 수 있는지 여부입니다.  |

모든 프런트 엔드 클라이언트 확장에 공통적인 속성은 [프런트 엔드 클라이언트 확장 속성](../front-end-client-extensions.md#front-end-client-extension-properties) 참조하십시오.

## 추가 정보

* [프런트 엔드 클라이언트 확장](../front-end-client-extensions.md)
* [클라이언트 확장 작업](../working-with-client-extensions.md)
* [맞춤 요소 YAML 구성 참조](./custom-element-yaml-configuration-reference.md)
