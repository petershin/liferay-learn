# LDAP에 연결 중

시스템 수준이나 인스턴스 수준에서 LDAP 서버를 구성할 수 있습니다. LXC-SM을 사용하거나 자체 호스팅하는 경우 [구성 범위](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/understanding-configuration-scope) 를 기반으로 선택할 수 있습니다. 귀하의 필요에 따라. 시스템 범위에서 구성할 때 각 인스턴스 ID를 지정해야 합니다. LXC를 사용하는 경우 인스턴스 범위에서 LDAP를 구성해야 합니다. [LDAP 디렉터리에 연결](https://learn.liferay.com/w/dxp/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory) 을 참조하세요.

Clarity Vision Solutions는 방금 인수한 회사에서 사용자 데이터를 가져와야 합니다.

## LDAP 디렉터리 시작 및 채우기

1. 새 OpenLDAP 컨테이너를 시작합니다.

   ```bash
   docker run
       --env LDAP_ORGANISATION="Fabulous Frames"
       --env LDAP_DOMAIN="fabulousframes.com"
       --env LDAP_BASE_DN="dc=fabulousframes,dc=com"
       --name fabulousframesldap
       -p 389:389
       -p 636:636
       osixia/openldap:1.5.0
   ```

1. `fabulousframesldap` 컨테이너의 IP 주소를 찾으세요. 이는 아래 구성 단계에서 사용됩니다.

   ```bash
   docker network inspect bridge
   ```

1. 사용자 및 사용자 그룹으로 LDAP를 시드하려면 LDIF 파일을 생성합니다.

   ```bash
   cat <<EOT >> sarah.ldif
   dn: cn=sarah,dc=fabulousframes,dc=com
   objectClass: inetOrgPerson
   objectClass: organizationalPerson
   objectClass: person
   objectClass: top
   cn: Sarah
   sn: Stanley
   givenName: Sarah
   mail: sarah@fabulousframes.com
   title: IT Staff
   userPassword: learn

   cn: fabulousframes
   dn: cn=fabulousframes,dc=fabulousframes,dc=com
   objectClass: groupOfUniqueNames
   objectClass: top
   uniqueMember: cn=sarah,dc=fabulousframes,dc=com
   EOT
   ```

1. 셸에서 LDIF 파일과 동일한 폴더로 이동합니다. 파일을 컨테이너에 복사합니다.

   ```bash
   docker cp sarah.ldif fabulousframesldap:/container/service/slapd/assets/test
   ```

1. OpenLDAP 서버에 항목을 추가합니다.

   ```bash
   docker exec fabulousframesldap ldapadd -x -D "cn=admin,dc=fabulousframes,dc=com" -w admin -f /container/service/slapd/assets/test/sarah.ldif -H ldap://localhost
   ```

## Liferay를 LDAP 디렉토리에 연결

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **인스턴스 설정** 으로 이동합니다.

1. 보안에서 **LDAP** 를 클릭하세요.

1. 왼쪽 탐색에서 **서버** 를 클릭합니다.

1. **추가** 를 클릭하세요.

1. 새 페이지에서 LDAP 연결 정보를 입력하세요.

   - 서버 이름: `Fabulous Frames`
   - 기본 공급자 URL: `ldap://[IP 주소]:389`
   - 기본 DN: `dc=fabulousframes,dc=com`
   - 주체: `cn=admin,dc=fabulousframes,dc=com`
   - 자격 증명: `admin`

   ![Enter the connection information.](./connecting-to-ldap/images/01.png)

**LDAP 연결 테스트** 를 클릭하세요. 팝업 창에 Liferay가 LDAP 서버에 성공적으로 연결되었음을 표시합니다. **X** 를 클릭하고 창을 닫습니다.

1. LDAP 사용자 정보 섹션에서 LDAP 필드를 적절한 Liferay 필드에 매핑하십시오. Liferay의 UUID 필드를 LDAP의 'uid' 필드에 매핑하려면 **UUID** 필드에 'uid'를 입력하세요. 이는 데이터를 LDAP으로 내보내는 데 필요합니다. 사용자 필드 매핑을 미리 보려면 **LDAP 사용자 테스트** 를 클릭하세요.

   ![Enter the user fields information.](./connecting-to-ldap/images/02.png)

1. LDAP 그룹 섹션에서 **Description** 필드에 'Fabulous Frames'를 입력합니다. **Test LDAP Groups** 를 클릭하여 'fabulousframes' 사용자 그룹이 표시되는지 확인하세요.

1. **저장** 을 클릭하세요.

Clarity Vision Solutions의 Liferay 인스턴스는 이제 Fabulous Frames의 LDAP 디렉터리에 연결됩니다.

다음: [사용자 가져오기 및 내보내기](./importing-and-exporting-users.md).

## 관련 개념

* [LDAP 디렉터리에 연결](https://learn.liferay.com/w/dxp/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory)
