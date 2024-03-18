# 테마 Favicon YAML 구성 참조

`client-extension.yaml` 파일을 사용하여 테마 favicon 클라이언트 확장을 정의할 수 있습니다.

## 사용내역

이 `client-extension.yaml` 파일은 테마 favicon 클라이언트 확장을 정의합니다.

```yaml
able-theme-favicon:
    name: Able Theme Favicon
    type: themeFavicon
    url: favicon.ico
```

필수 `url` 속성은 favicon 아이콘 이미지의 사이트를 정의합니다. 이 이미지는 클라이언트 확장이 배포될 때 모든 페이지에 대한 새로운 favicon 옵션이 됩니다.

[예제 작업 공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-theme-favicon) 에는 완전한 테마 favicon 클라이언트 확장이 포함되어 있습니다.

## YAML 속성

이러한 속성은 테마 favicon 클라이언트 확장에 따라 다릅니다.

| 이름    | 데이터 유형 | 묘사                                                       |
|:----- |:------ |:-------------------------------------------------------- |
| `url` | URL    | (필수) 아이콘 이미지 파일의 경로입니다. 전체 URI에는 `baseURL` 값이 접두사로 붙습니다. |

모든 프런트 엔드 클라이언트 확장에 공통적인 속성은 [프런트 엔드 클라이언트 확장 속성](../frontend-client-extensions.md#frontend-client-extension-properties) 참조하십시오.

## 관련 주제

* [프런트 엔드 클라이언트 확장](../frontend-client-extensions.md)
* [클라이언트 확장 작업](../working-with-client-extensions.md)
