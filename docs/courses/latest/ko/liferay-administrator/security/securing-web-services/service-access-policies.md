# 서비스 액세스 정책 이해

서비스 액세스 정책 도구를 사용하여 공개 액세스 권한이 있는 웹 서비스를 설정하십시오. 기본 정책 목록을 볼 수 있습니다. 새 정책을 추가하려면 아래 단계를 따르세요. 자세한 내용은 [서비스 액세스 정책 설정](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies) 참조하세요.

기본적으로 Liferay의 서비스 액세스 정책은 API에 대한 공개 액세스를 부여하지 않습니다.

```{warning}
아래 예는 데모용으로만 제공됩니다. 이러한 서비스에 대한 액세스 권한을 부여하면 서비스가 공개되며 일반적으로 인증과 결합되어야 합니다.
```

1. 자격 증명을 전달하지 않고 API 요청을 수행합니다.

   ```bash
   curl "localhost:8080/o/headless-admin-user/v1.0/my-user-account"
   ```

   금지된 오류 응답이 반환된다는 점에 유의하세요.

1. _글로벌 메뉴로 이동_ (![Global Menu](../../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _서비스 접근 정책_.

1. __ 추가(![Add icon](../../../images/icon-add.png))를 클릭합니다.

1. 다음과 같이 새 정책을 구성합니다.

   * 이름으로 `MY_USER_ACCOUNT_GUEST_ACCESS` 입력합니다.
   * 활성화된 스사이트를 켜십시오.
   * 기본 스사이트를 켜기로 전환합니다.
   * 제목으로 `My User Account Guest Access` 을 입력합니다.
   * 서비스 클래스로 `com.liferay.headless.admin.user.internal.resource.v1_0.UserAccountResourceImpl` 입력합니다.
   * 메소드 이름으로 `getMyUserAccount` 을 입력하십시오.
   * _저장_클릭하세요.

1. 동일한 API 요청을 하세요.

   ```bash
   curl "localhost:8080/o/headless-admin-user/v1.0/my-user-account"
   ```

   Liferay는 이제 게스트 사용자의 사용자 계정 정보를 반환합니다. 이러한 방식으로 다른 서비스에 대한 액세스를 허용하거나 거부합니다.

다음: [교차 출처 리소스 공유](./cross-origin-resource-sharing.md)

## 관련 개념

[서비스 액세스 정책 설정](https://learn.liferay.com/w/dxp/installation-and-upgrades/securing-liferay/securing-web-services/setting-service-access-policies)
