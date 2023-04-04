---
uuid: 03821b5e-c0a1-4dc8-a900-eb1e36c1ead5
---

# 테마 스프라이트 맵 YAML 구성 참조

`client-extension.yaml` 파일을 사용하여 테마 스프라이트 맵 클라이언트 확장을 정의할 수 있습니다.

## 사용내역

이 `client-extension.yaml` 테마 스프라이트 맵 클라이언트 확장을 정의합니다.

```yaml
able-theme-spritemap:
    name: Able Theme Spritemap
    type: themeSpritemap
    url: spritemap.svg
```

필수 `url` 속성은 `.svg` 스프라이트 맵 파일의 위치를 정의합니다.

[예제 작업 공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-theme-spritemap) 에는 완전한 테마 스프라이트 맵 클라이언트 확장이 포함되어 있습니다.

## YAML 속성

이러한 속성은 테마 스프라이트 맵 클라이언트 확장에 따라 다릅니다.

| 이름    | 데이터 유형 | 묘사                                                                               |
|:----- |:------ |:-------------------------------------------------------------------------------- |
| `url` | URL    | (필수) 기존 Liferay 테마를 대체하는 `.svg` 스프라이트 맵의 경로입니다. 전체 URI에는 `baseURL` 값이 접두사로 붙습니다. |

모든 프런트 엔드 클라이언트 확장에 공통적인 속성은 [프런트 엔드 클라이언트 확장 속성](../front-end-client-extensions.md#front-end-client-extension-properties) 참조하십시오.

## 추가 정보

* [프런트 엔드 클라이언트 확장](../front-end-client-extensions.md)
* [클라이언트 확장 작업](../working-with-client-extensions.md)
