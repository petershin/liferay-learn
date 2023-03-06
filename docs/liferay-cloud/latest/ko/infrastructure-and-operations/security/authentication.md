# 인증

이 문서는 Liferay Cloud에서 사용하는 두 가지 유형의 인증 요청을 설명합니다.

첫 번째 방법은 서버가 클라이언트에게 인증을 요청할 때 인코딩된 Authorization Header의 HTTP 프로토콜인 [기본 인증](https://swagger.io/docs/specification/authentication/basic-authentication/) 입니다.

두 번째는 사용자 액세스 토큰에 의한 것입니다. SSO가 활성화된 경우 토큰 인증이 필요합니다. 쿠키 `access_token` 의 토큰이 검색된 다음 `dxpcloud-authorization` 헤더와 함께 사용됩니다.

다음은 업로드 API와 함께 토큰 인증을 사용하는 예입니다.

```bash
curl -X POST /
  http://<HOST-NAME>/backup/upload /
  -H 'Content-Type: multipart/form-data' /
  -H 'dxpcloud-authorization: Bearer <USER_TOKEN>' /
  -F 'database=@/my-folder/database.tgz' /
  -F 'volume=@/my-folder/volume.tgz'
```

> **참고** : 헤더 `dxpcloud-authorization` 에 사용자 토큰을 전달하면 버전 `3.2.0` 이상의 백업 서비스에서만 작동합니다. 이전 버전은 `3.2.0`이상으로 업그레이드해야 합니다. 이전 버전에 대한 요청은 헤더 `Authorization: Bearer <PROJECT_MASTER_TOKEN>`를 사용해야 합니다. 프로젝트 마스터 토큰을 찾으려면 Liferay Cloud Console의 셸에서 `env grep LCP_PROJECT_MASTER_TOKEN` 명령을 실행합니다.
