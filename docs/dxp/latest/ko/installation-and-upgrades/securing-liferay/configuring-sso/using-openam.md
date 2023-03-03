# OpenAM 사용

```{important}
Liferay는 OpenAM 버전 13만 지원합니다. OpenAM/OpenSSO의 다른 모든 버전은 Liferay DXP 7.2부터 더 이상 사용되지 않습니다. 
```

OpenAM은 Sun의 System Access Manager 제품 코드베이스의 오픈 소스 싱글 사인온 솔루션입니다. OpenAM을 사용하여 Liferay DXP를 다양한 ID 리포지토리에 대한 여러 인증 체계가 포함된 인프라에 통합할 수 있습니다.

## 설치 참고 사항

설명서의 지침에 따라 OpenAM을 설치하십시오. OpenAM은 응용 프로그램 간의 쿠키 공유에 의존합니다. 따라서 **이 작동하려면 SSO가 필요한 모든 애플리케이션이 동일한 웹 도메인에 있어야**. 일부 웹 컨테이너(예: Apache Tomcat™)가 특수 문자를 포함하는 쿠키를 구문 분석하는 방식으로 인해 HTTPOnly 쿠키를 활성화한 경우 다음 속성도 추가해야 합니다.

```properties
com.iplanet.am.cookie.encode=true
```

Liferay DXP와 동일하거나 다른 서버에 OpenAM을 설치할 수 있습니다. OpenAM 서버의 컨텍스트 경로와 서버 호스트 이름을 검토하십시오.

Liferay DXP와 동일한 서버에 OpenAM을 설치하려면 [여기](https://backstage.forgerock.com/downloads/browse/am/archive/productId:openam) 에서 다운로드할 수 있는 OpenAM `.war`을 배포해야 합니다. 그렇지 않으면 [OpenAM 13 사이트](https://backstage.forgerock.com/docs/openam/13/install-guide/) 의 지침에 따라 OpenAM을 설치합니다.

```{note}
OpenAM 12 이하 버전은 Liferay DXP와 함께 작동하지만 수명이 다했습니다. 이 때문에 프로덕션용으로 OpenAM 13만 권장합니다.
```

## OpenAM 구성

설치가 완료되면 다음 두 가지 작업을 수행해야 합니다.

1. OpenAM에서 Liferay DXP 관리 사용자 생성
1. 인증을 위해 OpenAM 활성화

사용자는 화면 이름으로 앞뒤로 매핑되므로 OpenAM의 사용자 ID가 Liferay 관리 사용자의 화면 이름과 일치하는지 확인하십시오. 예를 들어, Liferay DXP 관리 사용자의 화면 이름이 *admin*인 경우 ID가 *admin* 이고 [`admin.email.from.address`](http://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html#Admin%20Portlet) [포털에 지정된 이메일 주소로 OpenAM에 사용자를 등록합니다. 속성](../../reference/portal-properties.md). 사용자를 설정했으면 이 사용자를 사용하여 OpenAM에 로그인합니다.

1. 동일한 브라우저 창에서 관리자로 Liferay DXP에 로그인합니다(이전 관리자 이메일 주소 사용).

1. 제어판으로 이동하여 *구성* &rarr; *인스턴스 설정* &rarr; *보안* &rarr; *SSO*을 클릭합니다. 그런 다음 왼쪽 목록에서 *OpenSSO* 을 선택합니다.

    ![통합이 작동하려면 Liferay의 OpenSSO 구성을 활성화해야 합니다.](./using-openam/images/01.png)

1. OpenAM 서버를 가리키도록 3개의 URL 필드(로그인 URL, 로그아웃 URL 및 서비스 URL)를 수정하고(즉, URL의 호스트 이름 부분만 수정) *활성화됨* 상자를 선택한 다음 *저장을 클릭합니다.*.

그런 다음 Liferay DXP는 사용자가 `/c/portal/login` URL을 요청할 때(예: *로그인* 링크를 클릭할 때) 사용자를 OpenAM으로 리디렉션합니다.

## 다른 Liferay 범위에서 OpenAM 구성

Liferay DXP의 OpenAM 구성은 시스템 범위 또는 인스턴스 범위에서 적용할 수 있습니다.

시스템 범위에서 OpenAM SSO 모듈을 구성하려면:

1. 제어판으로 이동

1. *구성* &rarr; *시스템 설정* &rarr; *보안* &rarr; *SSO* &rarr; *OpenSSO*을 클릭합니다. 아래에 설정이 표시됩니다. 여기에 구성된 값은 모든 포털 인스턴스에 대한 기본값을 제공합니다. 리터럴 값으로 Java 기본 유형을 초기화할 때와 동일한 형식으로 입력하십시오.

| 속성 레이블          | 속성 키               | 묘사                                                                                                    | 유형        |
|:--------------- |:------------------ |:----------------------------------------------------------------------------------------------------- |:--------- |
| **버전**          | `version`          | 사용할 OpenAM 버전(12 이하 또는 13)                                                                            | `String`  |
| **가능하게 하는**     | `enabled`          | OpenAM 인증을 활성화하려면 이 상자를 선택하십시오. OpenAM은 LDAP 인증도 활성화되어 있고 Liferay DXP의 인증 유형이 화면 이름으로 설정된 경우에만 작동합니다. | `boolean` |
| **LDAP에서 가져오기** | `importFromLDAP`   | 이 항목을 선택하면 Liferay DXP에 존재하지 않는 OpenAM에서 인증된 사용자를 LDAP에서 가져옵니다. LDAP를 활성화해야 합니다.                      | `boolean` |
| **로그인URL**      | `loginURL`         | OpenAM 서버의 로그인 페이지 URL                                                                                | `String`  |
| **로그아웃URL**     | `logoutURL`        | OpenAM 서버의 로그아웃 페이지 URL                                                                               | `String`  |
| **서비스URL**      | `serviceURL`       | 인증된 웹 서비스를 사용하기 위해 OpenAM에 액세스할 수 있는 URL입니다. OpenAM Express 8 이상을 사용하는 경우 서버에서 Java 6을 실행해야 합니다.      | `String`  |
| **화면 이름 속성**    | `screenNameAttr`   | 사용자의 화면 이름을 나타내는 OpenAM의 속성 이름                                                                        | `String`  |
| **이메일 주소 속성**   | `emailAddressAttr` | 사용자의 이메일 주소를 나타내는 OpenAM의 속성 이름                                                                       | `String`  |
| **이름 속성**       | `firstNameAttr`    | 사용자의 이름을 나타내는 OpenAM의 속성 이름                                                                           | `String`  |
| **성 속성**        | `lastNameAttr`     | 사용자의 성을 나타내는 OpenAM의 속성 이름                                                                            | `String`  |

특정 포털 인스턴스에 대한 이러한 기본 설정을 재정의하려면 제어판으로 이동하여 *구성* &rarr; *인스턴스 설정* &rarr; *보안* &rarr; *SSO*을 클릭하십시오. 그런 다음 왼쪽 목록에서 *OpenSSO* 을 선택합니다.
