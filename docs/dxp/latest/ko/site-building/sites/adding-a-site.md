# 사이트 추가

사이트는 개인화된 디지털 경험을 구축할 수 있는 사용자 지정 가능한 공간입니다. Liferay 인스턴스에서 기본 사이트를 만들려면 다음 단계를 따르세요:

1. *애플리케이션 메뉴* (![Applications Menu](../../images/icon-applications-menu.png))를 열고 *제어판* 탭으로 이동한 다음 *사이트*을 클릭합니다.

    ![사이트 애플리케이션을 엽니다.](./adding-a-site/images/01.png)

1. *클릭* 추가 (![Add Button](../../images/icon-add.png)).

1. *사이트 템플릿*을 선택합니다.

    *빈* 을 선택하여 페이지나 콘텐츠가 없는 새 사이트를 만들 수 있습니다. 또는 사용자 정의 또는 기본 [사이트 템플릿(](./site-templates.md) )을 선택하여 페이지, 콘텐츠 및 구성으로 새 사이트를 채울 수 있습니다.

1. *사이트 이름* 을 입력합니다.

   ```{note}
   비공개 페이지](../creating-pages/understanding-pages/understanding-pages.md#enable-private-pages)가 시스템에 대해 활성화된 경우 사이트 템플릿에서 상속된 모든 페이지가 비공개인지 여부를 결정할 수 있습니다.
   ```

1. *추가* 를 클릭하여 사이트 생성을 시작합니다.

완료되면 새 [사이트의 설정](../site-settings/site-settings-ui-reference.md)으로 리디렉션됩니다. 사이트 구성을 시작하거나 [기본 사이트 애플리케이션](./default-site-applications.md) 에서 사이트 구축에 사용할 수 있는 애플리케이션의 전체 목록을 확인할 수 있습니다.

## 조직 사이트 만들기

Liferay [조직](../../users-and-permissions/organizations/understanding-organizations.md) 을 사용하면 분산 사용자 관리가 가능하므로 조직 계층 구조를 반영하여 인스턴스 사용자 및 역할을 편리하게 구성하고 관리할 수 있습니다. 조직을 만든 후에는 조직 전용 사이트를 사용 설정하여 분산된 포털 관리를 용이하게 할 수도 있습니다. 이 기능은 상위 조직과 하위 조직 모두에서 사용할 수 있으므로 각 그룹의 필요에 따라 특별히 맞춤화된 콘텐츠를 만들고 관리하여 사이트 계층 구조를 빠르게 만들 수 있습니다. 자세한 내용은 [조직 사이트](../../users-and-permissions/organizations/organization-sites.md) 를 참조하세요.

```{note}
조직 사이트를 만들 때는 빈 템플릿 또는 사용자 지정 템플릿만 사용할 수 있습니다. 다른 기본 템플릿은 사용할 수 없습니다.
```

## 그룹 사이트 만들기

Liferay [사용자 그룹](../../users-and-permissions/user-groups/creating-and-managing-user-groups.md) 여러 조직과 사이트에 걸쳐 있는 사용자 목록입니다. 원하는 경우 사용자 그룹을 위한 전용 사이트를 만들어 각 그룹 구성원의 [개인 사이트](./personal-sites.md) 에 페이지를 추가할 수 있습니다. 자세한 내용은 [사용자 그룹 사이트](../../users-and-permissions/user-groups/user-group-sites.md) 를 참조하세요.

## 관련 주제

* [사이트 구축 시작하기](../getting-started-with-site-building.md)
* [위치 템플렛](./site-templates.md)
* [사이트에 회원 추가](./site-membership/adding-members-to-sites.md)
