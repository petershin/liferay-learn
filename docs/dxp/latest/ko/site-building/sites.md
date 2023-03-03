---
toc:
- ./sites/adding-a-site.md
- ./sites/site-templates.md
- ./sites/site-hierarchies.md
- ./sites/site-membership.md
- ./sites/personal-sites.md
- ./sites/exporting-importing-site-pages-and-content.md
- ./sites/default-site-applications.md
---
# 사이트

```{toctree}
:maxdepth: 4

sites/adding-a-site.md
sites/site-templates.md
sites/site-hierarchies.md
sites/site-membership.md
sites/personal-sites.md
sites/exporting-importing-site-pages-and-content.md
sites/default-site-applications.md
```

사이트는 개인화된 디지털 경험을 구축하기 위한 사용자 지정 가능한 공간입니다. 각 사이트에는 포털, 인트라넷, 전자 상거래 매장 등과 같은 맞춤형 솔루션을 구축하기 위한 [즉시 사용 가능한 응용 프로그램](./sites/default-site-applications.md) 이 포함되어 있습니다. 사이트를 만들 때 빈 사이트를 만들거나 사용자 지정 및 기본 사이트 템플릿을 사용하여 미리 정의된 구조와 콘텐츠로 사이트를 채울 수 있습니다. [조직](../users-and-permissions/organizations/understanding-organizations.md)을 사용하는 경우 전용 [조직 사이트](../users-and-permissions/organizations/organization-sites.md) 를 활성화하여 각 조직의 요구 사항을 충족하는 사이트를 개발하고 관리할 수도 있습니다.

기본적으로 Liferay는 인증된 사용자를 위한 개인 사이트도 생성합니다. 각 사용자는 개인 사이트의 유일한 구성원이며 이를 사용하여 콘텐츠를 표시하고 관리할 수 있습니다. [사용자 그룹](../users-and-permissions/user-groups/creating-and-managing-user-groups.md)을 사용하는 경우 [사용자 그룹 사이트](../users-and-permissions/user-groups/user-group-sites.md) 를 생성하여 모든 그룹 구성원의 개인 사이트에 미리 정의된 페이지를 추가할 수 있습니다.

```{note}
사이트 수준에서 생성된 페이지, 콘텐츠 및 기타 애플리케이션 데이터는 해당 사이트로 범위가 지정되며 일반적으로 사이트 간에 공유할 수 없습니다. 그러나 일부 데이터는 [계층 구조의 사이트](./sites/site-hierarchies.md) 간에 공유될 수 있습니다. 

또한 사이트 수준의 구성은 시스템 및 인스턴스 수준의 구성을 재정의합니다. 자세한 내용은 [구성 범위 이해](../system-administration/configuring-liferay/understanding-configuration-scope.md)를 참조하십시오.
```

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 사이트 추가
:link: ./sites/adding-a-site.md
:::

:::{grid-item-card} 사이트 템플릿
:link: ./sites/site-templates.md
:::

:::{grid-item-card} 사이트 계층 구조
:link: ./sites/site-hierarchies.md
:::

:::{grid-item-card} 사이트 회원
:link: ./sites/site-membership.md
:::

:::{grid-item-card} 개인 사이트
:link: ./sites/personal-sites.md
:::

:::{grid-item-card} 사이트 페이지 및 콘텐츠 내보내기/가져오기
:link: ./sites/exporting-importing-site-pages-and-content.md
:::

:::{grid-item-card} 기본 사이트 애플리케이션
:link: ./sites/default-site-applications.md
:::
::::

## 상거래에 사이트 사용

Liferay 사이트는 [채널](https://learn.liferay.com/commerce/latest/ko/store-management/channels.html) 과 함께 전자 상거래 상점을 만드는 데 사용됩니다. 각 채널의 사이트 유형(즉, B2B, B2C 또는 B2X)은 사이트가 계정과 작동하는 방식을 결정합니다. 자세한 내용은 [사이트 및 사이트 유형](https://learn.liferay.com/commerce/latest/ko/starting-a-store/sites-and-site-types.html) 을 참조하십시오.
