# 인증

개발자가 제공된 API 끝점을 호출하려면 먼저 Liferay Analytics Cloud 작업 공간에 액세스하여 개인 액세스 토큰을 생성해야 합니다.

![](authentication/images/01.png)

생성된 토큰은 기본 30일 동안 사용할 수 있습니다. 토큰이 만료되면 추가 API 호출을 수행하기 위해 새 토큰을 생성해야 합니다.

![](authentication/images/02.png)

토큰은 복사되어 모든 API 호출에서 요청 인증 헤더로 설정되어야 합니다. curl 명령줄을 사용하는 경우 다음 요청 헤더를 설정하여 수행할 수 있습니다.

```
curl -H "Authorization: Bearer {token}"
```
