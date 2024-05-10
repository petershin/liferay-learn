# DXP 탐색

Liferay DXP의 기본 탐색은 [**사이트 메뉴**](#site-menu) , [**개인 메뉴**](#personal-menu) 및 [글로벌 메뉴_](#global-menu) 의 세 가지 주요 영역으로 구성됩니다.

## 사이트 메뉴

화면 왼쪽에 있는 DXP **사이트 메뉴** 에는 현재 보고 있는 특정 사이트에 해당하는 작업, 콘텐츠 및 구성이 포함되어 있습니다. 애플리케이션 바의 **사이트 메뉴**(![사이트 메뉴](../images/icon-menu.png))를 클릭하여 확장하거나 숨길 수 있습니다.

![Expand the site menu so that all options are visible.](./navigating-dxp/images/01.png)

사이트 메뉴는 선택한 사이트를 나타냅니다. 위의 예에서 사이트는 `Liferay DXP`입니다. 사이트 메뉴에서 **나침반**(![나침반](../images/icon-compass.png))을 클릭하여 작업 중인 사이트를 변경할 수 있습니다.

다음은 사이트 메뉴에서 수행할 수 있는 몇 가지 일반적인 사이트 구축 및 관리 활동입니다.

* [페이지 추가](../site-building/creating-pages/adding-pages/adding-a-page-to-a-site.md)
* [콘텐츠 제작](../content-authoring-and-management.md)
* [사이트 회원 관리](../site-building/sites/site-membership/adding-members-to-sites.md)
* [사이트 동작 및 기능 구성 및 최적화](../site-building.html)

## 애플리케이션 바

**Application Bar** 는 각 페이지 상단과 [사이트 메뉴](#site-menu) 애플리케이션에 나타납니다. 애플리케이션 표시줄에는 현재 열려 있는 애플리케이션에 따라 다양한 옵션이 포함된 작업 메뉴(![Actions](../images/icon-actions.png))가 표시됩니다.

![The actions available in the application bar depend on the application open at the moment.](./navigating-dxp/images/02.png)

보기 모드에서 페이지를 열면 페이지 유형에 따라 응용 프로그램 표시줄에서 사용 가능한 도구가 변경됩니다.

![Content pages and widget pages show a different set of tools in the application bar.](./navigating-dxp/images/03.png)

[콘텐츠 페이지](../site-building/creating-pages/using-content-pages.md) (A)에 대해 사용 가능한 도구는 다음과 같습니다.

| 공구                                                                    | 묘사                                                                                                                                                                       |
| :-------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 편집(![편집](../images/icon-edit.png))                 | 페이지 편집기에 액세스합니다.                                                                                                                                                         |
| 페이지 구성(![페이지 구성](../images/icon-settings.png))     | 페이지 구성에 액세스합니다.                                                                                                                                                          |
| 시뮬레이션(![시뮬레이션](../images/icon-simulation.png))     | 사용자가 페이지에서 볼 수 있는 다양한 화면 크기와 콘텐츠에 대한 미리 보기에 액세스하세요.                                                                                                                      |
| 콘텐츠 성능(![성능](../images/icon-analytics.png))        | 콘텐츠 성능을 정량적으로 분석하는 데 도움이 되는 [콘텐츠 성능 도구](./../content-authoring-and-management/page-performance-and-accessibility/about-the-content-performance-tool.md) 을 엽니다. |
| A/B 테스트(![A/B 테스트](../images/icon-ab-testing.png)) | 현재 디자인에 대해 변형 디자인을 테스트하여 콘텐츠 페이지의 효율성을 평가하는 [A/B 테스트 도구](./../site-building/optimizing-sites/ab-testing/ab-testing.md) 을 엽니다.                                  |
| 페이지 감사(![페이지 감사](../images/icon-information.png))  | 사용자가 성능 관련 문제를 식별하는 데 도움이 되는 [페이지 감사 도구](./../content-authoring-and-management/page-performance-and-accessibility/about-the-page-audit-tool.md) 을 엽니다.         |

[위젯 페이지](../site-building/creating-pages/using-widget-pages/adding-widgets-to-a-page.md) (B)에 대해 사용 가능한 옵션은 다음과 같습니다.

| 공구                                                                   | 묘사                                                                                                                                                                       |
| :------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 페이지 구성(![페이지 구성](../images/icon-settings.png))    | 페이지 구성에 액세스합니다.                                                                                                                                                          |
| 컨트롤 전환(![컨트롤 전환](../images/icon-preview.png))     | 위젯 위로 커서를 가져가면 나타나는 위젯 컨트롤을 활성화/비활성화합니다.                                                                                                                                 |
| 추가(![추가](../images/icon-plus.png))                | 페이지 편집기에 액세스합니다.                                                                                                                                                         |
| 시뮬레이션(![시뮬레이션](../images/icon-simulation.png))    | 사용자가 페이지에서 볼 수 있는 다양한 화면 크기와 콘텐츠에 대한 미리 보기에 액세스하세요.                                                                                                                      |
| 콘텐츠 성능(![성능](../images/icon-analytics.png))       | 콘텐츠 성능을 정량적으로 분석하는 데 도움이 되는 [콘텐츠 성능 도구](./../content-authoring-and-management/page-performance-and-accessibility/about-the-content-performance-tool.md) 을 엽니다. |
| 페이지 감사(![페이지 감사](../images/icon-information.png)) | 사용자가 성능 관련 문제를 식별하는 데 도움이 되는 [페이지 감사 도구](./../content-authoring-and-management/page-performance-and-accessibility/about-the-page-audit-tool.md) 을 엽니다.         |

!!! note
콘텐츠 및 위젯 페이지의 애플리케이션 표시줄 옵션은 Liferay DXP 버전에 따라 다릅니다. [콘텐츠 성능](../content-authoring-and-management/page-performance-and-accessibility/about-the-content-performance-tool.md) Liferay DXP 7.3으로 시작하는 콘텐츠 페이지와 Liferay DXP 7.4로 시작하는 위젯 페이지에서 사용할 수 있습니다. 페이지 감사는 Liferay DXP 7.4부터 사용할 수 있으며 토글 컨트롤 옵션은 Liferay DXP 7.3부터 사용할 수 있습니다.

## 개인 메뉴

**개인 메뉴** 는 로그인한 사용자에 대한 정보 및 활동의 허브입니다.

![The Liferay DXP Personal Menu is available by clicking the avatar icon in the top right.](./navigating-dxp/images/04.png)

다음은 사용자가 개인 메뉴에서 수행할 수 있는 몇 가지 일반적인 작업입니다.

* [계정 정보 변경](./introduction-to-the-admin-account.md#changing-account-information)
* [그들이 어떤 사이트의 회원인지 확인하세요](../site-building/sites/site-membership/adding-members-to-sites.md)
* [사이트 알림 검토](../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md)
* [로그아웃](./introduction-to-the-admin-account.md#signing-out)

## 글로벌 메뉴

DXP **글로벌 메뉴** 에는 [애플리케이션](#applications-menu) , [상거래](#commerce-menu) , [제어판](#control-panel) 메뉴가 포함되어 있습니다. 화면 오른쪽 상단의 **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png))를 클릭해 접근하세요.

!!! note
기본적으로 **Guest** 또는 **User** 역할을 가진 사용자는 글로벌 메뉴에 접근할 수 없습니다.

인터페이스 오른쪽에 있는 글로벌 메뉴의 애플리케이션, 상거래 또는 제어판 탭에서 사용 가능한 다른 사이트로 이동할 수도 있습니다.

### 응용프로그램 메뉴

**응용 프로그램 메뉴** 에는 Liferay DXP 서버 내에서 다양한 응용 프로그램을 관리할 수 있는 다양한 링크가 포함되어 있습니다.

![The applications menu contains many global settings and important functions applicable to all sites.](./navigating-dxp/images/05.png)

애플리케이션 메뉴에서 관리할 수 있는 애플리케이션은 다음과 같습니다.

* [콘텐츠 대시보드](../content-authoring-and-management/content-dashboard.md)
* [워크플로](../process-automation/workflow/introduction-to-workflow.md)
* [원격 앱](../building-applications/client-extensions/frontend-client-extensions.md#custom-element-client-extensions)

### 커머스 메뉴

Liferay 7.3 CE GA6 및 Liferay DXP 7.3 GA1부터 Liferay Commerce 3.0은 이제 Liferay Portal 7.3 CE GA6 및 Liferay DXP 7.3 GA1과 함께 번들로 제공됩니다.

![The Commerce Menu contains all store functions.](./navigating-dxp/images/06.png)

Liferay Commerce에서 관리할 수 있는 몇 가지 기능은 다음과 같습니다.

* [새 카탈로그 만들기](https://learn.liferay.com/w/commerce/product-management/catalogs/creating-a-new-catalog)
* [채널 관리](https://learn.liferay.com/ko/w/commerce/store-management/channels/managing-channels)
* [재고 관리](https://learn.liferay.com/w/commerce/inventory-management)
* [주문 처리](https://learn.liferay.com/w/commerce/order-management/orders/processing-an-order)

Liferay Commerce에 대해 자세히 알아보려면 [라이프레이 커머스 소개](https://learn.liferay.com/w/commerce/starting-a-store/introduction-to-liferay-commerce) 참조하세요.

### 제어판


**제어판** 에는 Liferay DXP 설치 또는 특정 인스턴스에 대해 전체적으로 범위를 지정할 수 있는 일반 관리 작업 및 구성이 포함되어 있습니다.

![The control panel is now part of the global menu.](./navigating-dxp/images/07.png)

제어판에서 수행할 수 있는 몇 가지 일반적인 관리 활동은 다음과 같습니다.

* [사용자, 권한 및 역할 관리](../users-and-permissions/users/adding-and-managing-users.md)
* [사용자 로그인 방법 변경](../installation-and-upgrades/securing-liferay/authentication-basics.md)
* [새 사이트 만들기](../site-building/sites/adding-a-site.md)
* [사이트의 애플리케이션에 새로운 사용자 정의 필드 추가](./../system-administration/configuring-liferay/adding-custom-fields.md)

## DXP 7.1 및 7.2

7.3 이전 Liferay DXP 버전에서는 글로벌 메뉴의 내용이 화면 왼쪽의 사이트 메뉴 위에 있는 제어판 내에 있습니다.

![The control panel in DXP 7.1 and 7.2 is located above the site menu.](./navigating-dxp/images/08.png)

## 다음

시작하기 연습을 계속하여 [첫 번째 사이트 만들기](./creating-your-first-site.md) 에 대해 알아보세요.

## 관련 주제

* [첫 번째 사이트 만들기](./creating-your-first-site.md)
* [사이트 모양 변경하기](./changing-your-sites-appearance.md)
