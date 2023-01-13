# 인증되지 않은 요청 만들기

기본적으로 Liferay DXP는 보안을 위해 API 액세스를 제한하며 유효한 응답을 받으려면 인증이 필요합니다. 그러나 경우에 따라 게스트 액세스를 위해 API를 여는 것이 합리적일 수 있습니다.

자격 증명을 전달하지 않고 API 요청을 하면 일반적으로 오류 응답이 발생합니다.

```
curl localhost:8080/o/headless-admin-user/v1.0/sites/20122
```

```
{
  "message" : "Access denied to com.liferay.headless.admin.user.internal.resource.v1_0.SiteResourceImpl#getSite"
}
```

자격 증명 없이 API에 액세스해야 하는 경우 서비스 액세스 정책을 통해 무제한 액세스 권한을 부여하십시오.

## 서비스 액세스 정책을 통한 API 제한 완화

[서비스 액세스 정책](../../installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies.md) 을 사용하여 세분화된 수준에서 API 액세스를 정의할 수 있습니다.

1. `http://localhost:8080`에서 브라우저로 사이트를 방문하십시오.

1. 기본 자격 증명을 사용하여 로그인합니다.

   **사용자 이름:** `test@liferay.com`  
   **비밀번호:** `test`

1. 글로벌 메뉴 &rarr; 제어판 &rarr; 보안 &rarr; 서비스 접근 정책으로 이동합니다.

1. *추가* (![add](../../images/icon-add.png))을 클릭합니다.

1. 정책에 설명이 포함된 이름을 지정합니다. "SITE_API_GUEST_ACCESS"와 같은 이름을 지정하는 것이 좋습니다.

1. 정책을 활성화하려면 *Enabled* 토글을 전환하십시오.

1. 인증되지 않은 요청과 인증된 요청 모두에 정책을 적용하려면 *기본값* 로 레이블이 지정된 토글을 전환합니다.

1. 정책에 _Grant Guest access to the Site API_과 같이 현지화된 제목을 지정합니다.

1. 하단의 *고급 모드로 전환* 을 클릭합니다.

1. 위의 오류 메시지에서 메서드 서명을 복사하여 붙여넣습니다. `com.liferay.headless.admin.user.internal.resource.v1_0.SiteResourceImpl#getSite`.

1. *저장*을 클릭합니다.

![서비스 액세스 정책은 API에 대한 액세스 규칙을 정의합니다.](./making-unauthenticated-requests/images/01.png)

이제 서비스 액세스 정책이 활성화되어 게스트에게 Sites API에 대한 액세스 권한을 부여합니다.

## 액세스 확인

서비스 액세스 정책 변경이 적용되었으므로 이제 이전에 실패한 API 호출이 성공합니다.

```
curl localhost:8080/o/headless-admin-user/v1.0/sites/20122
```

```
{
  "availableLanguages" : [ "en-US" ],
  "description" : "",
  "friendlyUrlPath" : "/guest",
  "id" : 20122,
  "key" : "Guest",
  "membershipType" : "open",
  "name" : "Guest",
  "parentSiteId" : 0,
  "sites" : [ ]
}
```

이 패턴을 적용하여 헤드리스 REST API에 대한 액세스를 열 수 있습니다. 서비스 액세스 정책의 유연성을 활용하여 필요한 만큼 세분화하십시오.

```{important}
서비스 액세스 정책은 모든 API가 단일 엔드포인트에 통합되기 때문에 헤드리스 REST API만큼 쉽게 GraphQL API를 구별할 수 없습니다. 따라서 이와 같이 GraphQL 액세스 권한을 여는 경우 경우에 따라 작동할 수 있지만 실수로 너무 많은 데이터에 대한 액세스 권한을 부여할 수 있으므로 일반적으로 권장되지 않습니다.
   ```
