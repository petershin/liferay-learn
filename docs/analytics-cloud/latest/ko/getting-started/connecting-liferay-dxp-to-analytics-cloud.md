---
uuid: c44fbb5a-5155-4b25-b97e-b574fb16f3d6
---

# Liferay DXP를 Analytics Cloud에 연결

{bdg-secondary}`사용 가능한 Liferay DXP 7.4 U67+`

Liferay DXP와 Analytics Cloud는 안전하고 암호화된 토큰을 통해 연결됩니다. 이 토큰은 Analytics Cloud에서 생성되며 Liferay DXP 구성에 추가해야 합니다. 연결되면 동기화할 데이터를 결정할 수 있습니다.

```{note}
이 프로세스는 Liferay DXP 버전마다 다르지만 전제 조건은 동일합니다. 대체 지침은 [Liferay DXP 7.4 U66 및 이전 버전](#liferay-dxp-74-u66-and-earlier-versions) 을 참조하십시오.
```

## 전제 조건

Liferay DXP를 Analytics Cloud에 연결하려면 다음 전제 조건이 필요합니다.

1. [liferay.com](https://www.liferay.com) 계정이 필요합니다. 계정이 없으면 [계정을 만들 수 있습니다](https://login.liferay.com/signin/register) .

1. [analytics.liferay.com](https://analytics.liferay.com/) 처음 방문하는 경우 계정에 대한 다단계 인증을 설정해야 합니다. 자세한 내용은 [다단계 인증](../workspace-settings/multi-factor-authentication.md) 참조하십시오.

1. Liferay DXP 설치는 다음 최소 버전 중 하나를 충족해야 합니다.

   * 7.4(모든 버전)
   * 7.3 수정팩 1
   * 7.2 수정팩 11
   * 7.1 수정팩 22
   * 7.0 수정팩 98

1. 하나 이상의 Analytics Cloud 작업 영역에 대한 액세스 권한이 있어야 합니다. 유료 Analytics Cloud 사용자는 로그인 시 작업 공간을 볼 수 있습니다. 그렇지 않은 경우 [help.liferay.com](https://help.liferay.com/) 통해 지원팀에 문의하십시오.

## 온보딩 가이드 사용

1. Analytics Cloud에 로그인하고 작업 공간을 선택합니다.

   처음 로그인하는 경우 온보딩 가이드가 나타납니다. **다음** 클릭하고 Analytics Cloud 토큰을 복사합니다.

   ![처음 로그인하면 온보딩 가이드가 표시됩니다.](./connecting-liferay-dxp-to-analytics-cloud/images/01.png)

   또는 **Settings** &rarr; **Data Sources** 아래에서 토큰을 찾을 수 있습니다. **데이터 소스 추가** 클릭하고 **Liferay DXP** 선택한 다음 Analytics Cloud 토큰을 복사합니다.

1. Liferay DXP 인스턴스에 로그인합니다.

1. **글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **제어판** 탭으로 이동하여 **인스턴스 설정** 클릭합니다.

1. **Platform** 아래에서 **Analytics Cloud** 클릭합니다.

   이 작업을 처음 수행하면 4단계 온보딩 가이드가 표시됩니다.

1. Analytics Cloud 토큰을 입력하고 **연결** 클릭합니다.

   ![토큰을 입력하고 연결을 클릭합니다.](./connecting-liferay-dxp-to-analytics-cloud/images/02.png)

1. 기존 Analytics Cloud 속성을 선택하거나 **추가**(![추가 버튼](../images/icon-add.png)) 하나를 만듭니다. 선택했으면 **할당** 클릭합니다.

   ```{note}
   속성은 하나 이상의 Liferay 사이트와 연결된 레이블이며 Analytics Cloud가 데이터를 집계하는 방법을 결정합니다.
   ```

   ![기존 속성을 선택하거나 새 속성을 만듭니다.](./connecting-liferay-dxp-to-analytics-cloud/images/03.png)

1. 속성에 할당할 사이트를 선택합니다. **Commerce** 토글을 활성화하여 Commerce [채널 소개](https://learn.liferay.com/commerce/latest/ko/store-management/channels/introduction-to-channels.html) 도 할당합니다.

   동일한 사이트 또는 채널을 한 번에 하나의 속성에만 할당할 수 있습니다. 자세한 내용은 [속성](../workspace-settings/scoping-sites-and-individuals-using-properties.md) 을 사용하는 사이트 및 개인 범위 지정을 참조하십시오.

   ![Analytics Cloud와 동기화할 사이트 및 채널을 선택하십시오.](./connecting-liferay-dxp-to-analytics-cloud/images/04.gif)

1. **다음** 클릭합니다.

1. 동기화하려는 개인 및 계정 프로필을 선택합니다.

   토글을 사용하여 모든 연락처 및 계정 데이터를 동기화하거나 사용자 그룹, 조직 및 계정 그룹을 기반으로 하위 집합을 선택합니다.

   ![Analytics Cloud와 동기화할 연락처 데이터를 선택합니다.](./connecting-liferay-dxp-to-analytics-cloud/images/05.png)

   ```{important}
   Analytics Cloud는 개별 연락처 데이터를 동기화하고 관리하는 도구를 제공합니다. 그러나 이러한 도구는 개인 정보 보호 규정(예: GDPR) 준수를 보장하지 않습니다. 사이트에서 개인 데이터를 저장하고 처리하는 개인 정보 보호법을 준수하는 데 필요한 관행과 구성을 신중하게 결정해야 합니다.
   ```

1. **다음** 클릭합니다.

1. 각 엔터티에 대해 원하는 속성을 선택합니다. 상거래 채널을 동기화하는 경우 상거래 엔터티에 대한 속성을 선택할 수 있습니다.

   Analytics Cloud는 일부 필드를 동기화해야 합니다. 이 필드는 회색으로 표시됩니다.

   ![각 엔터티에 대해 동기화할 특성을 선택합니다.](./connecting-liferay-dxp-to-analytics-cloud/images/06.png)

1. **마침** 클릭합니다.

   다음 메시지가 나타나는지 확인합니다.

   `Success: DXP has successfully connected to Analytics Cloud. You will begin to see data as activities occur on your sites.`

축하합니다. 이제 Liferay 인스턴스가 Analytics Cloud에 연결되었습니다!

## Liferay DXP 7.4 U66 및 이전 버전

### 연결 토큰

Liferay DXP와 Analytics Cloud는 안전하고 암호화된 토큰을 통해 연결됩니다. 이 토큰은 Analytics Cloud에서 생성되며 Liferay DXP 구성에 추가해야 합니다. 연결되면 동기화할 데이터를 결정할 수 있습니다. 사용 중인 Liferay DXP 버전에 따라 프로세스가 다릅니다.

1. Analytics Cloud에 로그인하고 작업 공간을 선택합니다.

   처음 로그인하는 경우 온보딩 가이드가 나타납니다. **다음** 클릭하고 Analytics Cloud 토큰을 복사합니다.

   ![처음 로그인하면 온보딩 가이드가 표시됩니다.](./connecting-liferay-dxp-to-analytics-cloud/images/08.png)

   또는 **Settings** &rarr; **Data Sources** 아래에서 토큰을 찾을 수 있습니다. **데이터 소스 추가** 클릭하고 **Liferay DXP** 선택한 다음 Analytics Cloud 토큰을 복사합니다.

1. Liferay DXP 인스턴스에 로그인합니다.

1. **글로벌 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **제어판** 탭으로 이동하여 **인스턴스 설정** 클릭합니다.

1. 플랫폼에서 **Analytics Cloud** 클릭합니다.

1. Analytics Cloud 토큰을 붙여넣고 **연결** 클릭합니다.

   ![토큰을 붙여넣고 연결을 클릭합니다.](./connecting-liferay-dxp-to-analytics-cloud/images/09.png)

   ```{note}
   Liferay DXP 7.0에서 Analytics Cloud Admin은 *구성* &rarr; *Analytics Cloud* 아래에 있습니다.
   ```

1. 다음 메시지가 나타나는지 확인합니다.

   `Success: Your request completed successfully`

축하합니다. 이제 Liferay 인스턴스가 Analytics Cloud에 연결되었습니다! 다음 단계는 Liferay 사이트와 연락처를 동기화하는 것입니다.

### 사이트 동기화

사이트를 동기화하려면 속성을 만들고 하나 이상의 사이트와 연결해야 합니다. Analytics Cloud는 속성 정의 방법에 따라 데이터를 집계합니다. 이 예는 단일 사이트가 속성과 연결된 간단한 설정을 보여줍니다. 여러 사이트로 속성을 정의하는 방법에 대해 자세히 알아보려면 속성 [속성을 사용하여 사이트 및 개인 범위 지정](../workspace-settings/scoping-sites-and-individuals-using-properties.md)사용하는 사이트 및 개인 범위 지정을 참조하십시오.

1. Analytics Cloud에서 **Settings** &rarr; **Properties** 로 이동합니다.

1. **New Property** 클릭하고 레이블(예: Miniium Site)을 입력합니다.

1. DXP 인스턴스에서 **전역 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **제어판** 탭으로 이동한 다음 **인스턴스 설정** 클릭합니다.

1. 플랫폼에서 **Analytics Cloud** 클릭합니다.

1. **사이트 선택** 클릭합니다.

1. 사용 가능한 속성에서 새 속성을 선택합니다.

1. 동기화할 사이트를 선택하고 **완료** 클릭합니다.

   ![동기화할 사이트를 선택합니다.](./connecting-liferay-dxp-to-analytics-cloud/images/10.png)

   다음 메시지가 나타나는지 확인합니다.

   `Success: Your request completed successfully`

### 연락처 동기화 중

1. DXP 인스턴스에서 **전역 메뉴**(![Global Menu](../images/icon-applications-menu.png))을 열고 **제어판** 탭으로 이동한 다음 **인스턴스 설정** 클릭합니다.

1. 플랫폼에서 **Analytics Cloud** 클릭합니다.

1. **연락처 선택** 클릭합니다.

1. 연락처 동기화 옵션에서 **연락처 동기화** 클릭합니다. **모두 동기화** 을 전환하여 모든 연락처를 동기화합니다. 또는 연락처의 하위 집합을 동기화하려면 **사용자 그룹별 동기화** 또는 **조직별 동기화** 클릭합니다.

   ```{important}
   Analytics Cloud는 개별 연락처 데이터를 동기화하고 관리하는 도구를 제공합니다. 그러나 이러한 도구는 개인 정보 보호 규정(예: GDPR) 준수를 보장하지 않습니다. 사이트에서 개인 데이터를 저장하고 처리하는 개인 정보 보호법을 준수하는 데 필요한 관행과 구성을 신중하게 결정해야 합니다.
   ```

1. **저장 후 다음** 클릭합니다.

1. **연락처** 탭과 **사용자** 탭 사이를 전환하여 동기화할 필드를 선택합니다. Liferay DXP는 두 개의 개별 테이블(연락처 및 사용자)에 연락처 데이터를 저장합니다. Analytics Cloud는 일부 필드를 동기화해야 합니다. 이 필드는 회색으로 표시됩니다.

   ![목록에서 동기화할 필드를 선택합니다.](./connecting-liferay-dxp-to-analytics-cloud/images/11.png)

1. **저장** 클릭합니다.

   다음 메시지가 나타나는지 확인합니다.

   `Success: Your request completed successfully`

좋습니다. 이제 모든 설정이 완료되었습니다. 사용자가 사이트를 방문하고 사이트와 상호 작용하면 Analytics Cloud가 무슨 일이 일어나고 있는지 추적하기 시작합니다. 그런 일이 발생하면 추적되는 다양한 상호 작용을 확인하기 위해 [분석 대시보드 보기](./viewing-the-analytics-dashboard.md) 로 다이빙할 수 있습니다.
