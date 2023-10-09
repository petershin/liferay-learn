# 사이트 추가

사이트는 개인화된 디지털 경험을 구축하기 위한 맞춤형 공간입니다. Liferay 인스턴스에 기본 사이트를 생성하려면 다음 단계를 따르십시오.

1. *전역 메뉴* ( ![Applications Menu](../../images/icon-applications-menu.png) ) 을 열고 *제어판* 탭 &rarr; *사이트*로 이동합니다.

    ![사이트 응용프로그램을 엽니다.](./adding-a-site/images/01.png)

1. ** 추가( ![Add Button](../../images/icon-add.png) )를 클릭합니다.

1. *사이트 템플릿*선택합니다. 템플릿 *Liferay에서 제공* 또는 [*사용자 정의 사이트 템플릿*](./site-templates.md) 중에서 선택하여 사이트를 만듭니다.

    페이지나 콘텐츠가 없는 새 사이트를 만들려면 *Blank Site* 템플릿을 선택하세요.

    ![Liferay에서 제공하는 템플릿이나 사용자 정의 사이트 템플릿을 선택하여 새 사이트를 페이지, 콘텐츠 및 구성으로 채울 수 있습니다.](./adding-a-site/images/02.png)

1. 사이트에 *이름* 입력합니다.

   ```{note}
   시스템에서 [비공개 페이지](../creating-pages/understanding-pages/understanding-pages.md#enabling-private-pages)가 활성화된 경우 사이트 템플릿에서 상속된 모든 페이지가 비공개인지 여부를 결정할 수 있습니다.
   ```

1. 사이트 생성을 시작하려면 *추가* 클릭하세요.

완료되면 새 [사이트 설정](../site-settings/site-settings-ui-reference.md)로 리디렉션됩니다. 사이트 구성을 시작하거나 사이트 구축에 사용할 수 있는 전체 응용 프로그램 목록을 보려면 [기본 사이트 응용 프로그램](./default-site-applications.md) 참조하세요.

## 조직 사이트 생성

Liferay [조직](../../users-and-permissions/organizations/understanding-organizations.md) 은 분산 사용자 관리를 지원하여 조직 계층 구조를 반영하도록 인스턴스 사용자와 역할을 구성하고 관리하는 편리한 방법을 제공합니다. 조직이 생성되면 조직의 전용 사이트를 활성화하여 분산 포털 관리를 용이하게 할 수도 있습니다. 이 기능은 상위 및 하위 조직 모두에서 사용할 수 있으므로 각 그룹의 요구 사항에 맞게 특별히 생성, 관리 및 맞춤화된 콘텐츠로 사이트 계층 구조를 빠르게 만들 수 있습니다. 자세한 내용은 [조직 사이트](../../users-and-permissions/organizations/organization-sites.md) 을 참조하세요.

```{note}
기관 사이트를 생성할 때는 빈 템플릿이나 사용자 정의 템플릿만 사용할 수 있습니다. 다른 기본 템플릿은 사용할 수 없습니다.
```

## 그룹 사이트 만들기

Liferay [사용자 그룹](../../사용자 및 권한/사용자 그룹/사용자 그룹 생성 및 관리.md)은 여러 조직과 사이트에 걸쳐 있을 수 있는 사용자 목록입니다. 원하는 경우 사용자 그룹 전용 사이트를 만들어 각 그룹 구성원의 [개인 사이트](./personal-sites.md)에 페이지를 추가할 수 있습니다. 자세한 내용은 [사용자 그룹 사이트](../../사용자 및 권한/사용자 그룹/사용자 그룹 사이트.md)를 참조하세요.

## 관련 주제

* [사이트 구축 시작하기](../getting-started-with-site-building.md)
* [사이트 템플렛](./site-templates.md)
* [사이트에 구성원 추가](./site-membership/adding-members-to-sites.md)
