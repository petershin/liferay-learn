# 인증되지 않은 요청 만들기

기본적으로 Liferay DXP는 보안을 위해 API 액세스를 제한하므로 유효한 응답을 얻으려면 인증이 필요합니다. 그러나 어떤 경우에는 게스트 액세스를 위해 API를 여는 것이 합리적일 수 있습니다.

자격 증명을 전달하지 않고 API를 요청하면 일반적으로 오류 응답이 발생합니다.

```
curl localhost:8080/o/headless-admin-user/v1.0/sites/20122
```

```
{
  "message" : "Access denied to com.liferay.headless.admin.user.internal.resource.v1_0.SiteResourceImpl#getSite"
}
```

자격 증명 없이 API에 액세스해야 하는 경우 서비스 액세스 정책을 통해 무제한 액세스 권한을 부여하세요.

## 서비스 액세스 정책을 통해 API 제한 완화

[서비스 액세스 정책](../../installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies.md) 사용하여 세부적인 수준에서 API 액세스를 정의할 수 있습니다.

1. 브라우저를 사용하여 `http://localhost:8080`사이트를 방문하세요.

1. 기본 자격 증명을 사용하여 로그인합니다.

   **사용자 이름:** `test@liferay.com` **비밀번호:** `test`

1. 글로벌 메뉴 &rarr; 제어판 &rarr; 보안 &rarr; 서비스 접근 정책으로 이동합니다.

1. ** 추가(![add](../../images/icon-add.png))를 클릭합니다.

1. 정책에 설명이 포함된 이름을 지정합니다. "SITE **API** GUEST_ACCESS"와 같이 부르는 것이 합리적입니다.

1. **활성화** 토글을 전환하여 정책을 활성화합니다.

1. **기본값** 로 표시된 토글을 전환하여 인증된 요청뿐만 아니라 인증되지 않은 요청에도 정책을 적용합니다.

1. 정책에 **Grant Guest access to the Site API** 과 같은 현지화된 제목을 지정합니다.

1. 하단의 **고급 모드로 전환** 클릭하세요.

1. 위의 오류 메시지에서 메소드 서명을 복사하여 붙여넣습니다: `com.liferay.headless.admin.user.internal.resource.v1_0.SiteResourceImpl#getSite`.

1. **저장** 클릭하세요.

```{note}
정책에서 Liferay의 내부 서비스 계층 클래스 대신 Liferay의 외부 헤드리스 API 클래스를 사용해야 합니다.
```

![서비스 액세스 정책은 API 액세스 규칙을 정의합니다.](./making-unauthenticated-requests/images/01.png)

이제 서비스 액세스 정책이 활성화되어 게스트에게 사이트 API에 대한 액세스 권한이 부여됩니다.

## 액세스 확인 중

이제 서비스 액세스 정책 변경 사항이 적용되었으므로 이전에 실패했던 API 호출이 이제 성공합니다.

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

이 패턴을 적용하여 헤드리스 REST API에 대한 액세스를 열 수 있습니다. 서비스 액세스 정책의 유연성을 활용하여 이를 필요에 따라 세부적으로 만드세요.

```{important}
서비스 액세스 정책은 모든 API가 단일 엔드포인트 아래에 통합되므로 헤드리스 REST API만큼 쉽게 GraphQL API를 구별할 수 없습니다. 따라서 이와 같이 GraphQL 액세스를 열면 어떤 경우에는 작동할 수 있지만 실수로 너무 많은 데이터에 대한 액세스 권한을 부여할 수 있으므로 일반적으로 권장되지 않습니다.
```
