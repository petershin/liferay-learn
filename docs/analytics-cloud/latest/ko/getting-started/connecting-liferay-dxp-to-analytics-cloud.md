# Liferay DXP를 Analytics Cloud에 연결

{bdg-secondary}`liferay DXP 7.4 U67+`

Liferay DXP와 Analytics Cloud는 안전하고 암호화된 토큰을 통해 연결됩니다. 이 토큰은 Analytics Cloud에 의해 생성되며 Liferay DXP 구성에 추가되어야 합니다. 연결되면 동기화할 데이터를 결정할 수 있습니다.

```{note}
이 프로세스는 Liferay DXP 버전마다 다르지만 전제 조건은 동일합니다. 대체 지침 [Liferay DXP 7.4 U66 및 이전 버전](#liferay-dxp-74-u66-and-earlier-versions) 을 참조하세요.
```

## 전제 조건

Liferay DXP를 Analytics Cloud에 연결하려면 다음과 같은 전제 조건이 필요합니다.

1. [liferay.com](https://www.liferay.com) 계정이 필요합니다. 계정이 없다면 [계정을 생성](https://login.liferay.com/signin/register) 할 수 있습니다.

1. [Analytics.liferay.com](https://analytics.liferay.com/) 처음 방문하는 경우 계정에 대한 다단계 인증을 설정해야 합니다. 자세한 내용은 [다단계 인증](../reference/multi-factor-authentication.md) 참조하세요.

1. Liferay DXP 설치는 다음 최소 버전 중 하나를 충족해야 합니다.

   * 7.4(모든 버전)
   * 7.3 수정팩 1
   * 7.2 수정팩 11
   * 7.1 수정팩 22
   * 7.0 수정팩 98

1. 하나 이상의 Analytics Cloud 작업 영역에 대한 액세스 권한이 있어야 합니다. 유료 Analytics Cloud 사용자로서 로그인 시 작업 공간이 표시됩니다. 그렇지 않은 경우 [help.liferay.com](https://help.liferay.com/) 통해 지원팀에 문의하세요.

1. (선택 사항) Liferay DXP의 배치 엔진은 사용자 동기화에 사용됩니다. 매우 많은 수의 사용자를 동기화하는 경우 배치 크기를 늘리십시오. Liferay DXP에서 **글로벌 메뉴** &rarr; **인스턴스 설정** &rarr; **배치 엔진** 으로 이동합니다. **내보내기 배치 크기** 및 **가져오기 배치 크기** 를 '1000'으로 설정하세요.

## 온보딩 가이드 사용

1. Analytics Cloud에 로그인하고 작업 공간을 선택하십시오.

   처음 로그인하는 경우 온보딩 가이드가 나타납니다. **다음** 을 클릭하고 Analytics Cloud 토큰을 복사하세요.

   ![You see an onboarding guide when you login first.](./connecting-liferay-dxp-to-analytics-cloud/images/01.png)

   또는 **Settings** &rarr; **Data Sources** 에서 토큰을 찾을 수 있습니다. **데이터 소스 추가** 를 클릭하고 **Liferay DXP** 를 선택한 후 Analytics Cloud 토큰을 복사하세요.

1. Liferay DXP 인스턴스에 로그인합니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 후 **인스턴스 설정** 을 클릭하세요.

1. **Platform** 에서 **Analytics Cloud** 를 클릭하세요.

   이 작업을 처음 수행하면 4단계 온보딩 가이드가 표시됩니다.

1. Analytics Cloud 토큰을 입력하고 **Connect** 를 클릭하세요.

   ![Enter the token and click Connect.](./connecting-liferay-dxp-to-analytics-cloud/images/02.png)

1. 기존 Analytics Cloud 속성을 선택하거나 **추가**(![추가 버튼](../images/icon-add.png))를 클릭하여 속성을 만듭니다. 선택한 후 **할당** 을 클릭하세요.

   ```{note}
   속성은 하나 이상의 Liferay 사이트와 연결된 레이블이며 Analytics Cloud가 데이터를 집계하는 방법을 결정합니다.
   ```

   ![Select an existing property or create a new one.](./connecting-liferay-dxp-to-analytics-cloud/images/03.png)

1. 속성에 할당할 사이트를 선택합니다. **Commerce** 토글을 활성화하면 Commerce [채널 소개](https://learn.liferay.com/w/commerce/store-management/channels/introduction-to-channels) 도 할당됩니다.

**필터** 를 클릭하고 보려는 세그먼트를 선택하세요. 세그먼트에 대해 자세히 알아보려면 [세그먼트 만들기](../../people/segments/creating-segments.md)를 참조하세요.

   ![Select sites and channels to sync with Analytics Cloud.](./connecting-liferay-dxp-to-analytics-cloud/images/04.gif)

1. **다음** 을 클릭하세요.

1. 동기화하려는 개인 및 계정 프로필을 선택합니다.

   토글을 사용하여 모든 연락처 및 계정 데이터를 동기화하거나 사용자 그룹, 조직 및 계정 그룹을 기반으로 하위 집합을 선택합니다.

   ![Select the contact data you want to sync with Analytics Cloud.](./connecting-liferay-dxp-to-analytics-cloud/images/05.png)

   ```{important}
   Analytics Cloud는 개별 연락처 데이터를 동기화하고 관리하는 도구를 제공합니다. 그러나 이러한 도구는 개인 정보 보호 규정(예: GDPR) 준수를 보장하지 않습니다. 사이트에서 개인 데이터를 저장하고 처리하는 개인정보 보호법을 준수하는 데 필요한 관행과 구성을 신중하게 결정해야 합니다.
   ```

1. **다음** 을 클릭하세요.

1. 각 엔터티에 대해 원하는 속성을 선택합니다. 상거래 채널을 동기화하는 경우 상거래 엔터티에 대한 속성을 선택할 수 있습니다.

    Analytics Cloud에서는 일부 필드를 동기화해야 합니다. 이 필드는 회색으로 표시됩니다.

    ![Select the attributes to sync for each of the entities.](./connecting-liferay-dxp-to-analytics-cloud/images/06.png)

1. **마침** 을 클릭하세요.

    다음 메시지가 나타나는지 확인하세요.

    `성공: DXP가 Analytics Cloud에 성공적으로 연결되었습니다. 사이트에서 활동이 발생하면 데이터가 표시되기 시작합니다.`

축하합니다. 이제 Liferay 인스턴스가 Analytics Cloud에 연결되었습니다!

## Liferay DXP 7.4 U66 및 이전 버전

### 연결 토큰

Liferay DXP와 Analytics Cloud는 안전하고 암호화된 토큰을 통해 연결됩니다. 이 토큰은 Analytics Cloud에 의해 생성되며 Liferay DXP 구성에 추가되어야 합니다. 연결되면 동기화할 데이터를 결정할 수 있습니다. 보유하고 있는 Liferay DXP 버전에 따라 프로세스가 다릅니다.

1. Analytics Cloud에 로그인하고 작업 공간을 선택하십시오.

   처음 로그인하는 경우 온보딩 가이드가 나타납니다. **다음** 을 클릭하고 Analytics Cloud 토큰을 복사하세요.

   ![You see an onboarding guide when you log in first.](./connecting-liferay-dxp-to-analytics-cloud/images/08.png)

   또는 **Settings** &rarr; **Data Sources** 에서 토큰을 찾을 수 있습니다. **데이터 소스 추가** 를 클릭하고 **Liferay DXP** 를 선택한 후 Analytics Cloud 토큰을 복사하세요.

1. Liferay DXP 인스턴스에 로그인합니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 후 **인스턴스 설정** 을 클릭하세요.

1. 플랫폼에서 **Analytics Cloud** 를 클릭하세요.

1. Analytics Cloud 토큰을 붙여넣고 **Connect** 를 클릭하세요.

   ![Paste the token and click Connect.](./connecting-liferay-dxp-to-analytics-cloud/images/09.png)

   ```{note}
   Liferay DXP 7.0에서 Analytics Cloud 관리는 *구성* &rarr; *Analytics Cloud* 아래에 있습니다.
   ```

1. 다음 메시지가 나타나는지 확인하세요.

   `Success: Your request completed successfully`

축하합니다. 이제 Liferay 인스턴스가 Analytics Cloud에 연결되었습니다! 다음 단계는 Liferay 사이트와 연락처를 동기화하는 것입니다.

### 사이트 동기화 중

사이트를 동기화하려면 속성을 생성하고 이를 하나 이상의 사이트와 연결해야 합니다. Analytics Cloud는 속성을 정의하는 방법에 따라 데이터를 집계합니다. 이 예는 단일 사이트가 속성과 연결된 간단한 설정을 보여줍니다. 여러 사이트가 포함된 속성 정의에 대한 자세한 내용은 [속성을 사용하여 사이트 및 개인 범위 지정](../workspace-settings/scoping-sites-and-individuals-using-properties.md) 참조하세요.

1. Analytics Cloud에서 **Settings** &rarr; **Properties** 로 이동합니다.

1. **새 속성** 을 클릭하고 라벨(예: 최소 사이트)을 입력하세요.

1. DXP 인스턴스에서 **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **인스턴스 설정** 을 클릭하세요.

1. 플랫폼에서 **Analytics Cloud** 를 클릭하세요.

1. **사이트 선택** 을 클릭하세요.

1. 사용 가능한 속성에서 새 속성을 선택합니다.

1. 동기화하려는 사이트를 선택하고 **완료** 를 클릭하세요.

   ![Select the site you want to sync.](./connecting-liferay-dxp-to-analytics-cloud/images/10.png)

   다음 메시지가 나타나는지 확인하세요.

   `Success: Your request completed successfully`

### 연락처 동기화 중

1. DXP 인스턴스에서 **글로벌 메뉴**(![글로벌 메뉴](../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 다음 **인스턴스 설정** 을 클릭하세요.

1. 플랫폼에서 **Analytics Cloud** 를 클릭하세요.

1. **연락처 선택** 을 클릭하세요.

1. 연락처 동기화 옵션에서 **연락처 동기화** 를 클릭하세요. 모든 연락처를 동기화하려면 **Sync All** 을 전환하세요. 또는 연락처의 하위 집합을 동기화하려면 **사용자 그룹별 동기화** 또는 **조직별 동기화** 를 클릭하세요.

   ```{important}
   Analytics Cloud는 개별 연락처 데이터를 동기화하고 관리하는 도구를 제공합니다. 그러나 이러한 도구는 개인 정보 보호 규정(예: GDPR) 준수를 보장하지 않습니다. 사이트에서 개인 데이터를 저장하고 처리하는 개인정보 보호법을 준수하는 데 필요한 관행과 구성을 신중하게 결정해야 합니다.
   ```

1. **저장하고 다음** 을 클릭하세요.

1. **Contact** 탭과 **User** 탭 사이를 전환하여 동기화할 필드를 선택하세요. Liferay DXP는 연락처 데이터를 두 개의 별도 테이블(연락처 및 사용자)에 저장합니다. Analytics Cloud에서는 일부 필드를 동기화해야 합니다. 이 필드는 회색으로 표시됩니다.

   ![Select the fields you want to sync from the list.](./connecting-liferay-dxp-to-analytics-cloud/images/11.png)

1. **저장** 을 클릭하세요.

   다음 메시지가 나타나는지 확인하세요.

   `Success: Your request completed successfully`

좋습니다. 이제 모든 설정이 완료되었습니다! 사용자가 사이트를 방문하고 상호 작용하면 Analytics Cloud가 무슨 일이 일어나고 있는지 추적하기 시작합니다. 그런 일이 발생하면 [분석 대시보드 보기](./viewing-the-analytics-dashboard.md) 자세히 살펴보고 추적되는 다양한 상호 작용을 확인할 수 있습니다.
