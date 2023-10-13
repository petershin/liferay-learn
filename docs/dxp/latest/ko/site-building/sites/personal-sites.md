# 개인 사이트

기본적으로 Liferay는 모든 사용자에 대해 개인 사이트를 생성합니다. 각 사이트에는 두 개의 [페이지 세트](../creating-pages/understanding-pages/understanding-pages.md#page-sets) : 내 프로필(공개) 및 내 대시보드(비공개)가 포함되어 있습니다. 각 사용자는 개인 사이트의 유일한 회원이며 개인 사이트를 사용하여 자신의 콘텐츠를 표시하고 관리할 수 있습니다.

원하는 경우 포털 속성을 사용하여 [개인 사이트를 비활성화하거나](#customizing-personal-sites-with-portal-properties) 사용자 지정할 수 있습니다.

```{important}
Liferay 7.4 U22+ 및 GA22+의 경우, 새로운 Liferay 설치에는 대시보드 페이지를 포함한 비공개 페이지 생성을 비활성화하는 릴리스 기능 플래그가 포함되어 있습니다. 개인 사이트에 대한 사용자 지정 대시보드 페이지를 수동으로 만들려면 Liferay 시스템에서 비공개 페이지를 사용하도록 설정해야 합니다. 자세한 내용은 [비공개 페이지 활성화하기](../creating-pages/understanding-pages/understanding-pages.md#enable-private-pages) 를 참조하세요.
```

```{tip}
사용자 그룹 사이트를 사용하면 모든 그룹 구성원의 개인 사이트에 페이지를 동적으로 추가할 수 있습니다. 자세한 내용은 [사용자 그룹 사이트](../../사용자 및 권한/사용자 그룹/사용자 그룹 사이트.md)를 참조하세요.
```

## 프로필 페이지 및 대시보드 페이지

프로필 페이지에서 사용자는 콘텐츠(예: 블로그, 활동)를 공개적으로 공유할 수 있습니다. 기본적으로 각 프로필 페이지에는 사용자의 기본 정보가 표시되고 사용자의 vCard(가상 명함) 다운로드 링크가 제공됩니다.

![프로필 페이지에는 다른 사용자가 볼 수 있도록 공개 정보가 표시됩니다.](./personal-sites/images/01.png)

대시보드 페이지에서 사용자는 비공개 파일에 액세스하고, 개인화된 RSS 피드를 만들고, 사이트 멤버십을 관리하는 등의 작업을 수행할 수 있습니다. 기본적으로 각 대시보드 페이지에는 내 사이트 위젯이 포함되어 있습니다.

![대시보드 페이지에는 회원님만 볼 수 있는 비공개 정보가 표시됩니다.](./personal-sites/images/02.png)

## 개인 사이트 페이지 관리

개인 사이트 페이지에 액세스하려면 다음 단계를 따르세요:

1. **사용자 프로필 메뉴** 아이콘을 열고 **내 프로필** 또는 **내 대시보드** 를 선택합니다.

    ![사용자 프로필 메뉴에서 개인 사이트 페이지에 액세스합니다.](./personal-sites/images/03.png)

1. **제품 메뉴**(![Product Menu](../../images/icon-product-menu.png))를 열고 **사이트 빌더** 를 확장한 다음 **페이지** 를 클릭합니다.

1. 다른 [사이트 페이지](../creating-pages/understanding-pages/understanding-pages.md)에서와 마찬가지로 관리합니다.

사용자 그룹을 통해 사용자의 개인 사이트에 대한 페이지를 추가하고 정의할 수도 있습니다. 자세한 내용은 [사용자 그룹 사이트](../../users-and-permissions/user-groups/user-group-sites.md) 를 참조하세요.

## 개인 사이트 권한 및 역할

개인 사이트에 대한 권한 및 역할은 아래와 같은 동작을 따릅니다:

- 관리자는 역할에서 권한을 제거하여(사용자 역할에서 관련 권한을 제거하여 모든 사용자가 무언가를 수정하지 못하도록 함) Liferay 포털의 권한 시스템을 통해 개인 사이트의 수정 가능한 부분을 사용자 지정할 수 있습니다.
- 사용자는 [파워 유저 역할(](../../users-and-permissions/roles-and-permissions/default-roles-reference.md#regular-roles) )의 회원인 경우 개인 사이트를 관리하고 페이지와 애플리케이션을 수정할 수 있습니다.

## 포털 속성을 사용하여 개인 사이트 사용자 지정

[`portal-ext.properties`](../../installation-and-upgrades/reference/portal-properties.md) 에 추가하여 개인 사이트의 기본 페이지를 사용자 지정할 수 있는 몇 가지 포털 속성이 있습니다. 페이지의 이름, 페이지에 표시되는 애플리케이션, 페이지의 테마 및 레이아웃 템플릿 등을 사용자 지정할 수 있습니다. 자세한 내용은 [기본 사용자 공개 레이아웃](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Default%20User%20Public%20Layouts) 및 [기본 사용자 비공개 레이아웃](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Default%20User%20Private%20Layouts) 섹션( `portal.properties` 파일)을 참조하세요. 이러한 속성 중 일부는 아래 표에 나열되어 있습니다:

| 기능                            | 재산                                              |
|:----------------------------- |:----------------------------------------------- |
| 개인 사이트 비활성화                   | `layout.user.public.layouts.enabled=false`      |
| 개인 사이트에서 비공개 페이지 비활성화         | `layout.user.private.layouts.enabled=false`     |
| 개인 사이트 자동 생성 비활성화             | `layout.user.public.layouts.auto.create=false`  |
| 개인 사이트에서 비공개 페이지 자동 생성 비활성화하기 | `layout.user.private.layouts.auto.create=false` |

개인 사이트의 공개 및 비공개 페이지 세트는 별도로 처리됩니다. 한 페이지 세트를 활성화한 상태로 두면서 다른 페이지 세트를 비활성화할 수 있습니다. 처음에 사용자 개인 사이트를 인스턴스에 사용하도록 설정했다가 사용하지 않도록 설정한 경우, 기존 개인 사이트는 사용자가 다음에 로그인할 때까지 인스턴스에 남아 있으며, 그 시점에 제거됩니다.

## 관련 주제

- [사이트 추가](./adding-a-site.md)
- [사이트 템플릿](./site-templates.md)
- [사용자 그룹 사이트](../../users-and-permissions/user-groups/user-group-sites.md)
