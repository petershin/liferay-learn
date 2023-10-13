# 사용자 가져오기 및 내보내기

LDAP가 연결되면 로그인할 때 사용자를 가져옵니다. 그러나 Delectable Bonsai는 올마이티 시럽의 모든 사용자를 한 번에 가져오고 싶어합니다.

## LDAP 사용자 가져오기

1. **글로벌 메뉴로 이동**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **인스턴스 설정** .

1. 보안 아래에서 **LDAP** 클릭하십시오.

1. 왼쪽 탐색에서 **가져오기** 클릭합니다.

1. **가져오기 활성화** 확인란을 선택합니다. **저장** 클릭하세요. 기본 가져오기 간격은 10분으로 설정되어 있습니다. Liferay는 이 간격으로 대량 가져오기를 수행합니다.

1. **글로벌 메뉴로 이동**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **사용자 및 조직** . LDAP 서버에서 사용자를 가져왔습니다.

   ![LDAP 사용자를 가져왔습니다.](./importing-and-exporting-users/images/01.png)

```{note}
_가져오기 사용_ 상자를 선택하지 않은 상태로 두면 로그인할 때 사용자를 개별적으로 가져옵니다. LDAP에서 대량 가져오기를 수행하려면 가져오기를 사용하세요. 
```

## LDAP 사용자 내보내기

1. **글로벌 메뉴로 이동**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **인스턴스 설정** .

1. 보안 아래에서 **LDAP** 클릭하십시오.

1. 왼쪽 탐색에서 **내보내기** 클릭합니다.

1. **내보내기** 활성화 및 **그룹 내보내기** 활성화 확인란을 선택합니다. **저장** 클릭하세요.

1. 이제 기존 사용자를 수정합니다. **글로벌 메뉴로 이동**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **사용자 및 조직** .

1. 사용자 Kyle Klein을 선택합니다. 이 사용자를 생성해야 하는 경우 [사용자 생성](https://learn.liferay.com/w/courses/liferay-administrator/users-accounts-organizations/managing-users#creating-users) 참조하세요.

1. 개인정보를 변경하세요. 예를 들어, 출생 연도를 1970에서 1971로 변경합니다. **저장** 클릭하세요.

1. LDAP 서버 설정으로 돌아갑니다. **글로벌 메뉴로 이동**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **인스턴스 설정** .

1. 왼쪽 탐색에서 **서버** 클릭하십시오.

1. 만능시럽 LDAP 서버의 **편집**(![Edit icon](../../images/icon-edit.png))을 클릭하세요.

1. 아래로 스크롤하여 **Test LDAP Users** 클릭합니다. Kyle Klein이 LDAP에 추가되었는지 확인하세요.

   ![Kyle Klein이 LDAP에 추가되었습니다.](./importing-and-exporting-users/images/02.png)

1. 개인정보를 변경하세요. 예를 들어, 출생 연도를 1970에서 1971로 변경합니다. **저장** 클릭하세요.

1. LDAP 서버 설정으로 돌아갑니다. **글로벌 메뉴로 이동**(![Global Menu](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **인스턴스 설정** .

1. 왼쪽 탐색에서 **서버** 클릭하십시오.

1. `almightysyrup` LDAP 디렉토리에 대해 **Edit**(![Edit icon](../../images/icon-edit.png))을 클릭하십시오.

1. 아래로 스크롤하여 **Test LDAP Users** 클릭합니다. Kyle Klein이 LDAP에 추가되었는지 확인하세요.

   ![Kyle Klein이 LDAP에 추가되었습니다.](./importing-and-exporting-users/images/02.png)

다음 단계는 각 사용자에게 서로 다른 역할과 권한 [역할 및 권한](./setting-roles-and-permissions.md) 할당하는 것입니다.

## 관련 개념

- [사용자 가져오기 및 내보내기 구성](https://learn.liferay.com/en/w/dxp/users-and-permissions/connecting-to-a-user-directory/configuring-user-import-and-export)

- [LDAP 참조 구성](https://learn.liferay.com/en/w/dxp/users-and-permissions/connecting-to-a-user-directory/ldap-configuration-reference)
