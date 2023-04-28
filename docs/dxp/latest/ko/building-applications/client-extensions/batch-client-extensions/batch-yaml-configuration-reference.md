# 배치 YAML 구성 참조

`client-extension.yaml` 파일을 사용하여 배치 클라이언트 확장을 정의하십시오.

## 사용내역

이 `client-extension.yaml` 파일은 유형 `배치`의 클라이언트 확장을 정의합니다.

```yaml
yoke-batch:
    oAuthApplicationHeadlessServer: yoke-oauth-application-headless-server
    type: batch

yoke-oauth-application-headless-server:
    type: oAuthApplicationHeadlessServer
```

## YAML 속성

이러한 속성은 배치 클라이언트 확장에만 적용됩니다.

| 이름                               | 데이터 유형 | 묘사                                                              |
|:-------------------------------- |:------ |:--------------------------------------------------------------- |
| `name`                           | 끈      | 배치 이름입니다.                                                       |
| `oAuthApplicationHeadlessServer` | 끈      | (필수) OAuth2 애플리케이션 헤드리스 서버 프로필의 ID(`externalReferenceCode`)입니다. |

## 추가 정보

* [클라이언트 확장 작업](../working-with-client-extensions.md)
