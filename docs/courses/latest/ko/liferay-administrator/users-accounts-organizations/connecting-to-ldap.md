# LDAP에 연결 중

시스템 수준이나 인스턴스 수준에서 LDAP 서버를 구성할 수 있습니다. LXC-SM을 사용하거나 자체 호스팅하는 경우 필요에 따라 [구성 범위](https://learn.liferay.com/w/dxp/system-administration/configuring-liferay/understanding-configuration-scope) 선택할 수 있습니다. 시스템 범위에서 구성할 때 각 인스턴스 ID를 지정해야 합니다. LXC를 사용하는 경우 인스턴스 범위에서 LDAP를 구성해야 합니다. [LDAP 디렉토리에 연결](https://learn.liferay.com/w/dxp/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory)참조하십시오.

맛있는 분재는 방금 인수한 회사로부터 사용자 데이터를 가져와야 합니다.

## LDAP 디렉터리 시작 및 채우기

1. 새 OpenLDAP 컨테이너를 시작합니다.

   ```bash
   docker run \
       --env LDAP_ORGANISATION="Almighty Syrup" \
       --env LDAP_DOMAIN="almightysyrup.com" \
       --env LDAP_BASE_DN="dc=almightysyrup,dc=com" \
       --name almightysyrupldap \
       -p 389:389 \
       -p 636:636 \
       osixia/openldap:1.5.0
   ```

1. `almightysyrupldap` 컨테이너의 IP 주소를 찾습니다. 이는 아래 구성 단계에서 사용됩니다.

   ```bash
   docker network inspect bridge
   ```

1. 사용자 및 사용자 그룹으로 LDAP를 시드하려면 LDIF 파일을 생성합니다.

   ```bash
   cat <<EOT >> sarah.ldif
   dn: cn=sarah,dc=almightysyrup,dc=com
   objectClass: inetOrgPerson
   objectClass: organizationalPerson
   objectClass: person
   objectClass: top
   cn: Sarah
   sn: Stanley
   givenName: Sarah
   mail: sarah@almightysyrup.com
   title: IT Staff
   userPassword: learn

   cn: almightysyrup
   dn: cn=almightysyrup,dc=almightysyrup,dc=com
   objectClass: groupOfUniqueNames
   objectClass: top
   uniqueMember: cn=sarah,dc=almightysyrup,dc=com
   EOT
   ```

1. 셸에서 LDIF 파일과 동일한 폴더로 이동합니다. 파일을 컨테이너에 복사합니다.

   ```bash
   docker cp sarah.ldif almightysyrupldap:/container/service/slapd/assets/test
   ```

1. OpenLDAP 서버에 항목을 추가합니다.

   ```bash
   docker exec almightysyrupldap ldapadd -x -D "cn=admin,dc=almightysyrup,dc=com" -w admin -f /container/service/slapd/assets/test/sarah.ldif -H ldap://localhost
   ```

## Liferay를 LDAP 디렉토리에 연결

1. _글로벌 메뉴로 이동_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _인스턴스 설정_.

1. 보안 아래에서 _LDAP_클릭하세요.

1. 왼쪽 탐색에서 _서버_클릭하십시오.

1. _추가_클릭합니다.

1. 새 페이지에서 LDAP 연결 정보를 입력하세요.

   * 서버명 : `올마이티시럽`
   * 기본 공급자 URL: `ldap://[IP 주소]:389`
   * 기본 DN: `dc=almightysyrup,dc=com`
   * 주체: `cn=admin,dc=almightysyrup,dc=com`
   * 자격 증명: `관리자`

   ![연결정보를 입력하세요.](./connecting-to-ldap/images/01.png)

   _LDAP 연결 테스트_클릭합니다. 팝업 창에 Liferay가 LDAP 서버에 성공적으로 연결되었음을 표시합니다. _X_ 을 클릭하고 창을 닫습니다.

1. LDAP 사용자 정보 섹션에서 LDAP 필드를 적절한 Liferay 필드에 매핑하십시오. _UUID_ 필드에 `uid` 입력하여 Liferay의 UUID 필드를 LDAP의 `uid` 필드에 매핑합니다. 이는 데이터를 LDAP으로 내보내는 데 필요합니다. 사용자 필드 매핑을 미리 보려면 _LDAP 사용자 테스트_ 클릭하세요.

   ![사용자 필드 정보를 입력합니다.](./connecting-to-ldap/images/02.png)

1. LDAP 그룹 섹션에서 _설명_ 필드에 `Almighty Syrup` 입력합니다. _테스트 LDAP 그룹_ 클릭하여 `almightysyrup` 사용자 그룹이 표시되는지 확인합니다.

1. _저장_클릭하세요.

Delectable Bonsai의 Liferay 인스턴스가 이제 Almighty Syrup의 LDAP 디렉토리에 연결되었습니다.

다음: [사용자 가져오기 및 내보내기](./importing-and-exporting-users.md).

## 관련 개념

- [LDAP 디렉터리에 연결](https://learn.liferay.com/w/dxp/users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory)
