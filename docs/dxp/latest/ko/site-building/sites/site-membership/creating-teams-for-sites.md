# 사이트용 팀 만들기

사이트에서 동일한 일련의 작업(사이트의 Wiki 콘텐츠 조정, 게시판 스레드 관리, 블로그 작성, 사이트의 특정 페이지 편집 등)을 수행하는 *임시* 사용자 그룹이 있는 경우 다음을 수행할 수 있습니다. 사이트 팀으로 구성한 다음 다양한 사이트별 기능에 대한 팀 권한을 할당합니다. 사이트 팀은 단일 사이트 내에서 권한을 관리하는 데 선호되는 방법입니다. 사이트 팀에 할당된 권한은 해당 사이트에만 적용됩니다.

```{note}
Liferay Portal 인스턴스의 여러 사이트 또는 조직에서 사용할 사용자 그룹에 대한 권한을 생성하고 적용하려면 사용자를 [사용자 그룹](../../../users-and-permissions/user-groups/creating-and-managing-user-groups.md) 및 [Roles]을 통해 사용자 그룹 권한 할당(../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md).
```

아래 단계에서는 다음 주제를 다룹니다.

* [사이트에 팀 추가](#adding-a-team-to-a-site)
* [팀에 구성원 추가](#adding-members-to-a-team)
* [팀 권한 관리](#managing-team-permissions)
* [팀 앱 권한 관리](#managing-team-app-permissions)

## 사이트에 팀 추가

1. 제품 메뉴를 열고 사이트 메뉴를 엽니다.
1. *명* &rarr; *팀*를 선택합니다.

    ![제품 메뉴로 향하는 사람을 통해 팀을 만듭니다.](./creating-teams-for-sites/images/01.png)

    ```{note}
    *회원* 탭에도 있는 *사이트 회원* 앱에서 *사용자*, *조직* 및 *사용자 그룹*과 같은 다른 사이트 회원 그룹을 구성할 수 있습니다. 사이트 멤버십 작동 방식에 대한 자세한 내용은 [사이트 멤버십 유형 변경](../../site-settings/site-users/ changing-site-membership-type.md)을 참조하십시오.
    ```

1. *팀* 추가 아이콘(![Add Team](../../../images/icon-add.png))을 클릭합니다.

1. 이름과 설명을 입력하고 *저장*을 클릭합니다. 새 팀이 목록에 표시됩니다.

![사이트 내에서 팀을 생성하면 팀 권한을 통해 팀 구성원이 동일한 리소스에 액세스하고 동일한 유형의 작업을 수행할 수 있으므로 팀워크와 공동 작업을 촉진할 수 있습니다.](./creating-teams-for-sites/images/02.png)

## 팀에 구성원 추가

1. 팀 이름 링크를 클릭합니다.

1. 추가 버튼(![Add Button](../../../images/icon-add.png))을 클릭합니다.

1. 팀에 추가할 사용자를 선택하고 *추가*을 클릭합니다.

## 팀 권한 관리

1. *작업* 아이콘(![액션](../../../images/icon-actions.png)) 팀 옆에 있는 *권한*을 선택합니다.

    ```{note}
    팀에 대한 권한을 설정하면 해당 권한이 모든 팀 구성원에게 할당됩니다. 팀을 편집/관리할 수 있는 관리자만 팀 권한을 관리할 수 있습니다.
    ```

1. 권한을 확인/선택 취소하고 *저장*을 클릭합니다.

## 팀 앱 권한 관리

앱에서 팀 권한을 관리할 수도 있습니다.

1. 제품 메뉴를 열고 사이트 메뉴에서 앱을 선택합니다(예: 게시판).

1. 화면 우측 상단의 *옵션* (![Options](../../../images/icon-options.png)) 메뉴를 열고 *권한*관련 옵션을 선택합니다.

1. 역할 열에서 팀을 찾고 적절한 권한을 선택합니다.

![Lunar Resort 메시지 보드 중재자 사이트 팀은 메시지 보드 응용 프로그램에 대한 무제한 권한을 가집니다.](./creating-teams-for-sites/images/03.png)
