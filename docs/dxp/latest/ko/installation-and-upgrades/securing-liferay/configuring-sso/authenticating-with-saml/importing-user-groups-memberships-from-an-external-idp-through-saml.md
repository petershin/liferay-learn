# SAML을 통해 외부 IdP에서 사용자 그룹의 구성원 자격 가져오기

```{warning}
이 기능은 현재 [dev 기능 플래그](../../../../system-administration/configuring-liferay/feature-flags.md#dev-feature-flags) 뒤에 있습니다. 프로덕션 환경에서 이것을 사용해서는 안 됩니다. 테스트 목적으로만 사용하십시오.
```

외부 ID 공급자(IdP)에서 사용자의 사용자 그룹 멤버십을 가져올 수 있습니다. 이렇게 하려면 IdP를 등록할 때 필요한 필드만 구성하면 됩니다. XML 구조는 IdP에 따라 다르므로 첫 번째 단계는 IdP에서 사용자 그룹에 대한 다중 값 특성을 찾는 것입니다.

예를 들어 사용자 그룹에 대해 Okta의 구조를 사용하면 다음과 같습니다.

```xml
<saml2:Attribute Name="userGroup" NameFormat="urn:oasis:names:tc:SAML:2.0:attrname-format:unspecified">
      <saml2:AttributeValue xmlns:xs="http://www.w3.org/2001/XMLSchema"
                           xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                           xsi:type="xs:string"
                           >Okta-UserGroup2
      </saml2:AttributeValue>
      <saml2:AttributeValue xmlns:xs="http://www.w3.org/2001/XMLSchema"
                           xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                           xsi:type="xs:string"
                           >Okta-UserGroup1
      </saml2:AttributeValue>
</saml2:Attribute>
```

다음은 외부 IdP에서 사용자 그룹을 가져오기 위해 이 구조를 사용하는 구성입니다.

## Okta에서 SAML 2.0 앱 생성

1. Okta 관리 대시보드에 로그인합니다.

1. **애플리케이션** &rarr; **애플리케이션** 로 이동하고 **앱 통합 생성** 클릭합니다.

1. **SAML 2.0** 선택하고 **다음** 클릭합니다.

1. 이름을 **liferaysaml** 로 입력하고 **다음** 클릭합니다.

1. **SAML 설정** 섹션의 **일반** 아래에 다음 값을 입력합니다.

   **싱글 사인온 URL:** `http://[IP_ADDRESS]:[PORT_NUMBER]/c/portal/saml/acs` (로컬 Liferay 인스턴스를 실행 중인 경우 `http://localhost:8080/c/ 포털/saml/acs`)

   **대상 URI(SP 엔터티 ID):** `okta-saml`

   **이름 ID 형식:** `이메일 주소`

   **애플리케이션 사용자 이름:** `이메일`

   ![SAML 앱에 대한 설정을 구성합니다.](./importing-user-group-memberships-from-an-external-idp-through-saml/images/01.png)

   이 필드는 사용자가 Okta에 로그인하는 데 사용하는 사용자 이름의 소스를 나타내며 SAML을 사용할 때 Liferay에 로그인합니다.

1. **Attribute Statements** 아래에 다음 값을 추가합니다.

   **firstName(미지정):** `user.firstName`

   **lastName(지정되지 않음):** `user.lastName`

   **emailAddress(미지정):** `user.email`

   **screenName(미지정):** `user.firstName`

   왼쪽의 값은 SAML 속성의 이름입니다. Okta에서 다른 사용자 필드를 지정하는 오른쪽의 해당 값에 매핑됩니다.

1. **Group Attribute Statements** 아래에 다음 값을 추가합니다.

   **userGroup(지정되지 않음):**** `Okta` 로 시작(Okta의 사용자 그룹이 접두사 `Okta`로 시작한다고 가정합니다. 예: `Okta-UserGroup-1`)

   ![사용자 및 그룹 특성에 대한 매핑을 만듭니다.](./importing-user-group-memberships-from-an-external-idp-through-saml/images/02.png)

   ```{note}
   위 지침에서는 Okta에 다른 그룹(접두사 'Okta'로 시작)에 속하는 사용자 집합이 이미 있다고 가정합니다. Okta는 [키워드 또는 정규식](https://support.okta.com/help/s/article/How-to-pass-a-user-s-group-membership-in-a-SAML-Assertion- from-Okta?language=en_US) 그룹 구성원을 정의합니다. 이러한 그룹은 이름이 Liferay의 사용자 그룹과 일치합니다. 

   그룹 속성 명령문에 대한 필터 조건 또는 정규식을 지정하는 것은 필수입니다. 필터 조건이나 정규 표현식이 없는 경우 SAML 속성은 빈 상태로 전송됩니다. 
   ```

1. **다음** 클릭합니다.

1. 양식의 나머지 부분은 Okta 전용이며 구성에 영향을 주지 않습니다. 가장 적합한 것을 선택하고 **마침** 클릭하십시오.

## 메타데이터 저장

Liferay 인스턴스로 이동하기 전 마지막 단계는 SAML 메타데이터를 저장하는 것입니다.

1. **Applications** &rarr; **Applications** 로 이동하여 **liferaysaml** 선택합니다.

1. 기본적으로 **과제** 탭을 볼 수 있습니다. **할당** 클릭하고 **사람에게 할당** 을 선택합니다. 이 SAML 앱을 사용하여 Liferay에 로그인할 수 있는 사용자를 검색하고 **할당** 클릭합니다. 여기에서 그룹별로 선택할 수도 있습니다.

   ![SAML 앱에 사용자 또는 그룹을 할당합니다.](./importing-user-group-memberships-from-an-external-idp-through-saml/images/03.png)

1. **완료** 클릭합니다.

1. **사인온** 탭을 선택합니다.

1. 오른쪽에서 **SAML 설정 지침 보기** 클릭합니다.

1. 새 화면에서 옵션 섹션까지 아래로 스크롤합니다. XML 코드의 전체 블록을 복사하여 `oktasamlmetadata.xml`이라는 새 파일에 붙여넣습니다.

![XML 블록을 복사하여 새 파일에 붙여넣습니다.](./importing-user-group-memberships-from-an-external-idp-through-saml/images/04.png)

## 라이프레이 구성

이제 Liferay의 SAML 관리자에서 Okta를 서비스 공급자로 설정해야 합니다.

1. **전역 메뉴**(![Global Menu](../../../../images/icon-applications-menu.png))을 열고 **제어판** &rarr; **SAML Admin** 로 이동합니다.

1. 일반 탭에서 엔터티 ID로 **okta-saml** 입력합니다.

1. **인증서 생성** 클릭합니다.

1. 새 창에서 **okta-saml***Common Name** 으로 입력하고 **learn***Key Password** 로 입력합니다.

1. **저장** 클릭합니다.

1. ID 공급자 연결에서 **ID 공급자 추가** 클릭합니다.

1. 이름으로 **Okta** 입력합니다.

1. `oktasamlmetadata.xml` 파일에서 엔터티 ID를 복사하여 여기에 붙여넣습니다.

1. **활성화됨** 확인란을 선택합니다.

1. 메타데이터에서 **메타데이터 XML 업로드** 클릭하고 이전에 생성한 파일을 선택합니다.

1. 이름 식별자 형식으로 **이메일 주소** 을 설정합니다.

1. 속성 매핑 아래에서 세 개의 새로운 기본 사용자 필드를 생성하여 총 4개를 얻습니다. 다음과 같이 정보를 입력합니다.

   | 사용자 필드 | SAML 속성 |
   |:------ |:------- |
   | 이메일 주소 | 이메일 주소  |
   | 이름     | 이름      |
   | 성      | 성       |
   | 화면 이름  | 화면 이름   |

   ![Okta에서 생성된 SAML 속성에 해당하는 새 기본 사용자 필드를 생성합니다.](./importing-user-group-memberships-from-an-external-idp-through-saml/images/05.png)

1. User Memberships 섹션 아래 드롭다운에서 `userGroups` 선택하고 해당 값을 `userGroup`으로 설정합니다.

   ![Okta의 해당 SAML 속성을 사용하여 userGroup 필드에 대한 매핑을 추가합니다.](./importing-user-group-memberships-from-an-external-idp-through-saml/images/06.png)

   위의 두 매핑은 모두 Okta에 구성된 SAML 속성을 사용하여 Liferay의 사용자 속성을 연결합니다. 예를 들어 Okta의 사용자 그룹 SAML 속성 이름은 `userGroup`입니다. 이것은 Liferay의 `userGroups` 속성에 매핑됩니다.

1. **저장** 클릭합니다.

이제 Liferay 인스턴스로 이동하여 **로그인** 클릭할 수 있습니다. 이렇게 하면 ID 공급자의 로그인 페이지로 리디렉션됩니다. 로그인하면 Liferay의 홈 페이지로 다시 리디렉션됩니다. 또한 **전역 메뉴**(![Global Menu](../../../../images/icon-applications-menu.png))를 열고 **제어판** &rarr; **사용자 그룹** 으로 이동하여 사용자의 사용자 그룹 구성원 자격을 확인할 수 있습니다.

   ![로그인에 성공한 후 사용자가 Liferay 사용자 그룹에 추가됩니다.](./importing-user-group-memberships-from-an-external-idp-through-saml/images/07.png)

```{important}
사용자는 이미 존재하는 경우에만 사용자 그룹에 자동으로 할당됩니다. Okta의 그룹에 해당하는 사용자 그룹이 Liferay에 있는지 확인하십시오. Okta가 그룹 정보를 보내고 해당 사용자 그룹이 Liferay에 없으면 속성이 무시됩니다. 생성 및 관리 방법은 [사용자 그룹 생성 및 관리](../../../../users-and-permissions/user-groups/creating-and-managing-user-groups.md)를 참조하십시오. 사용자 그룹. 

로그인 후 Liferay의 다른 사용자 그룹에 사용자를 할당하면 다음에 IdP를 통해 로그인할 때 이러한 멤버십을 덮어씁니다. 
```
