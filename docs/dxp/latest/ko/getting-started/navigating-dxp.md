---
uuid: 5e95a054-5432-4645-aafe-b57d6d9c0220
---

# DXP 탐색

Liferay DXP의 즉시 사용 가능한 내비게이션은 **개인 메뉴** , **전역 메뉴** 및 **사이트 메뉴** 의 세 가지 주요 영역으로 구성됩니다.

## 사이트 메뉴

화면 왼쪽의 DXP **사이트 메뉴** 에는 현재 보고 있는 특정 사이트로 범위가 지정된 작업, 콘텐츠 및 구성이 포함되어 있습니다. 애플리케이션 표시줄에서 사이트 메뉴 아이콘(![Site Menu](../images/icon-menu.png))을 클릭하여 사이트 메뉴를 확장하거나 숨길 수 있습니다.

![모든 옵션이 보이도록 사이트 메뉴를 확장합니다.](./navigating-dxp/images/05.png)

**사이트 메뉴** 은 선택된 사이트를 나타냅니다. 위의 예에서 사이트는 `Liferay`입니다. 사이트 메뉴에서 나침반 아이콘( ![Compass Icon](../images/icon-compass.png) )을 클릭하여 작업 중인 사이트를 변경할 수 있습니다.

다음과 같은 일반적인 사이트 구축 및 관리 활동은 **사이트 메뉴** 에서 수행할 수 있습니다.

* [페이지 추가](../site-building/creating-pages/adding-pages/adding-a-page-to-a-site.md)
* [콘텐츠 만들기](../content-authoring-and-management.md)
* [사이트 회원 관리](../site-building/sites/site-membership/adding-members-to-sites.md)
* [사이트 동작 및 기능 구성 및 최적화](../site-building.html)
* 그리고 더...

## 애플리케이션 바

**애플리케이션 표시줄** 각 페이지 상단에 표시되며 [사이트 메뉴](#site-menu) 에 나열된 애플리케이션이 표시됩니다. 응용 프로그램 표시줄에는 현재 열려 있는 응용 프로그램에 따라 다른 옵션이 있는 작업(![Actions](../images/icon-actions.png)) 메뉴가 표시됩니다.

![응용 프로그램 표시줄에서 사용할 수 있는 작업은 현재 열려 있는 응용 프로그램에 따라 다릅니다.](./navigating-dxp/images/07.png)

보기 모드에서 페이지를 열면 애플리케이션 표시줄에서 사용 가능한 도구가 페이지 유형에 따라 변경됩니다.

![콘텐츠 페이지와 위젯 페이지는 응용 프로그램 표시줄에 다른 도구 세트를 표시합니다.](./navigating-dxp/images/08.png)

[콘텐츠 페이지](../site-building/creating-pages/using-content-pages.md) (A)의 경우 사용 가능한 도구는 다음과 같습니다.

* 편집 (![Edit](../images/icon-edit.png))
* 페이지 구성(![Configure Page](../images/icon-settings.png))
* 시뮬레이션 (![Simulation](../images/icon-simulation.png))
* 콘텐츠 성능 (![Performance](../images/icon-analytics.png))
* A/B 테스트(![A/B Test](../images/icon-ab-testing.png))
* 페이지 감사(![Page Audit](../images/icon-information.png))

[위젯 페이지](../site-building/creating-pages/using-widget-pages/adding-widgets-to-a-page.md) (B)의 경우 사용 가능한 옵션은 다음과 같습니다.

* 페이지 구성(![Configure Page](../images/icon-settings.png))
* 토글 컨트롤 (![Toggle Controls](../images/icon-preview.png))
* 추가 (![Add](../images/icon-plus.png))
* 시뮬레이션 (![Simulation](../images/icon-simulation.png))
* 콘텐츠 성능 (![Performance](../images/icon-analytics.png))
* 페이지 감사(![Page Audit](../images/icon-information.png))

```{note}
콘텐츠 페이지 및 위젯 페이지에 대한 응용 프로그램 표시줄 옵션은 Liferay DXP 버전에 따라 다릅니다. [콘텐츠 성능](../content-authoring-and-management/page-performance-and-accessibility/about-the-content-performance-tool.md)은 Liferay DXP 7.3으로 시작하는 콘텐츠 페이지 및 위젯 페이지에서 사용할 수 있습니다. Liferay DXP 7.4부터 시작합니다. 페이지 감사는 Liferay DXP 7.4부터 사용할 수 있습니다. Toggle Controls 옵션은 Liferay DXP 7.3부터 사용할 수 있습니다.
```

## 개인 메뉴

개인 메뉴는 로그인한 사용자의 정보 및 활동을 위한 허브입니다.

![Liferay DXP 개인 메뉴는 오른쪽 상단의 아바타 아이콘을 클릭하여 사용할 수 있습니다.](./navigating-dxp/images/01.png)

사용자는 개인 메뉴를 사용하여 다음을 수행할 수 있습니다.

* [계정 정보 변경](./introduction-to-the-admin-account.md#changing-account-information) (이름, 비밀번호 등)
* [회원이 속한 사이트 확인](../site-building/sites/site-membership/adding-members-to-sites.md)
* [사이트 알림 검토](../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md)
* [로그아웃](./introduction-to-the-admin-account.md#signing-out)
* 그리고 더...

## 글로벌 메뉴

DXP **전역 메뉴** 에는 **응용 프로그램 메뉴** 과 **제어판** 가 포함되어 있습니다. 화면 상단의 **애플리케이션 메뉴** 아이콘(![Applications Menu icon](../images/icon-applications-menu.png))을 클릭하여 접속합니다.

```{note}
기본적으로 *Guest* 또는 *User* 역할을 가진 사용자는 전역 메뉴에 액세스할 수 없습니다.
```

인터페이스 오른쪽에 있는 **전역 메뉴** 의 **애플리케이션** 또는 **제어판** 탭에서 사용 가능한 다른 사이트로 이동할 수도 있습니다.

### 응용프로그램 메뉴

**애플리케이션 메뉴** 에는 Liferay DXP 서버 내에서 다양한 애플리케이션을 관리할 수 있는 다양한 링크가 포함되어 있습니다.

![응용 프로그램 메뉴에는 모든 사이트에 적용할 수 있는 많은 전역 설정과 중요한 기능이 포함되어 있습니다.](./navigating-dxp/images/02.png)

다음은 **애플리케이션 메뉴** 에서 관리할 수 있는 일부 애플리케이션입니다.

* [컨텐츠 대시보드](../content-authoring-and-management/content-dashboard.md)
* [워크플로우](../process-automation/workflow/introduction-to-workflow.md)
* [원격 앱](../building-applications/client-extensions/browser-based-client-extensions.md#custom-element-client-extensions)

### 커머스 메뉴

Liferay 7.3 CE GA6 및 Liferay DXP 7.3 GA1부터 Liferay Commerce 3.0은 이제 Liferay Portal 7.3 CE GA6 및 Liferay DXP 7.3 GA1과 함께 번들로 제공됩니다.

![상거래 메뉴에는 모든 상점 기능이 포함되어 있습니다.](./navigating-dxp/images/03.png)

다음은 **상거래** 메뉴에서 관리할 수 있는 몇 가지 기능입니다.

* [새 카탈로그 만들기](https://learn.liferay.com/commerce/latest/ko/product-management/catalogs/creating-a-new-catalog.html)
* [새 채널 만들기](https://learn.liferay.com/commerce/latest/en/starting-a-store/channels/managing-channels.html)
* [재고 관리](https://learn.liferay.com/commerce/latest/ko/inventory-management.html)
* [주문 처리](https://learn.liferay.com/commerce/latest/ko/order-management/orders/processing-an-order.html)
* 그리고 더..

Liferay Commerce에 대한 자세한 내용은 [라이프레이 커머스 소개](https://learn.liferay.com/commerce/latest/ko/starting-a-store/introduction-to-liferay-commerce.html) 참조하십시오.

### 제어반

**제어판** 에는 Liferay DXP 설치 또는 특정 인스턴스에 대해 **전체적으로** 범위를 지정할 수 있는 일반 관리 작업 및 구성이 포함되어 있습니다.

![제어판은 이제 전역 메뉴의 일부입니다.](./navigating-dxp/images/04.png)

제어판에서 수행할 수 있는 일반적인 관리 활동은 다음과 같습니다.

* [사용자, 권한 및 역할 관리](../users-and-permissions/users/adding-and-managing-users.md)
* [사용자 로그인 방법 변경](../installation-and-upgrades/securing-liferay/authentication-basics.md)
* [새 사이트 만들기](../site-building/sites/adding-a-site.md)
* 사이트의 애플리케이션에 새 사용자 정의 필드 추가
* 그리고 더...

## DXP 7.1 및 7.2

Liferay DXP 7.3 이전 버전에서는 전역 메뉴의 내용이 화면 왼쪽의 사이트 메뉴 위에 있는 제어판에 있습니다.

![DXP 7.1 및 7.2의 제어판은 사이트 메뉴 위에 있습니다.](./navigating-dxp/images/06.png)

## 무엇 향후 계획

시작하기 연습을 계속하고 [첫 번째 사이트 만들기](./creating-your-first-site.md)에 대해 알아보십시오.

## 관련 정보

* [첫 번째 사이트 만들기](./creating-your-first-site.md)
* [사이트 모양 변경](./changing-your-sites-appearance.md)
