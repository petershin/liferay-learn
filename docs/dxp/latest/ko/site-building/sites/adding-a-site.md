# 사이트 추가

사이트는 개인화된 디지털 경험을 구축하기 위한 사용자 지정 가능한 공간입니다. Liferay 인스턴스에서 기본 사이트를 생성하려면 다음 단계를 따르십시오.

1. *글로벌 메뉴* (![Global Menu](../../images/icon-applications-menu.png))을 열고 *제어판* 탭으로 이동하여 *사이트*을 클릭합니다.

    ![사이트 애플리케이션을 엽니다.](./adding-a-site/images/01.png)

1. *추가* 버튼(![Add Button](../../images/icon-add.png))을 클릭합니다.

1. *사이트 템플릿*을 선택합니다.

    *공백* 을 선택하여 페이지나 콘텐츠 없이 새 사이트를 만들 수 있습니다. 또는 사용자 지정 또는 기본 [사이트 템플릿](./site-templates.md) 을 선택하여 새 사이트를 페이지, 콘텐츠 및 구성으로 채울 수 있습니다.

1. 사이트에 대해 *이름* 을 입력합니다.

   ```{note}
   [비공개 페이지](../creating-pages/understanding-pages/understanding-pages.md#enabling-private-pages)가 시스템에 활성화된 경우 사이트 템플릿에서 상속된 모든 페이지가 비공개인지 확인할 수 있습니다. .
   ```

1. 사이트 생성을 시작하려면 *저장* 을 클릭하십시오.

완료되면 새로운 [사이트 설정](../site-settings/site-settings-ui-reference.md)로 리디렉션됩니다. 사이트 구성을 시작하거나 [기본 사이트 응용 프로그램](./default-site-applications.md) 에서 사이트 구축에 사용할 수 있는 응용 프로그램의 전체 목록을 볼 수 있습니다.

## 조직 사이트 만들기

Liferay [Organizations](../../users-and-permissions/organizations/understanding-organizations.md) 은 분산 사용자 관리를 가능하게 하여 조직 계층을 반영하도록 인스턴스 사용자 및 역할을 구성하고 관리하는 편리한 방법을 제공합니다. 조직이 생성되면 분산 포털 관리를 용이하게 하기 위해 조직 전용 사이트를 활성화할 수도 있습니다. 이 기능은 상위 및 하위 조직 모두에서 사용할 수 있으므로 각 그룹의 요구 사항에 맞게 특별히 생성, 관리 및 맞춤화된 콘텐츠로 사이트의 계층 구조를 빠르게 만들 수 있습니다. 자세한 내용은 [조직 사이트](../../users-and-permissions/organizations/organization-sites.md) 을 참조하십시오.

```{note}
조직 사이트를 생성할 때 빈 템플릿 또는 사용자 지정 템플릿만 사용할 수 있습니다. 다른 기본 템플릿은 사용할 수 없습니다.
```

## 그룹 사이트 만들기

Liferay [사용자 그룹](../../users-and-permissions/user-groups/creating-and-managing-user-groups.md) 은 여러 조직 및 사이트에 걸쳐 있을 수 있는 사용자 목록입니다. 원하는 경우 사용자 그룹 전용 사이트를 생성하여 각 그룹 구성원의 [개인 사이트](./personal-sites.md) 에 페이지를 추가할 수 있습니다. 자세한 내용은 [사용자 그룹 사이트](../../users-and-permissions/user-groups/user-group-sites.md) 을 참조하십시오.

## 추가 정보

* [사이트 구축 소개](../introduction-to-site-building.md)
* [위치 템플렛](./site-templates.md)
* [사이트에 구성원 추가](./site-membership/adding-members-to-sites.md)
