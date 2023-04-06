# 속성을 사용하여 사이트 및 개인 범위 지정

속성을 사용하면 단일 또는 여러 사이트에 레이블을 정의하고 연결할 수 있습니다. 이렇게 하면 단일 대시보드에서 속성과 연결된 모든 사이트에 대한 분석 데이터를 집계할 수 있습니다. 이는 DXP 인스턴스에 여러 사이트가 있고 이를 단일 사이트로 분석하려는 경우에 특히 유용합니다.

예를 들어 각 부서에 대한 여러 하위 사이트가 있는 회사 인트라넷을 상상해 보십시오. 각 하위 사이트는 *인트라넷*이라는 사용자 정의 속성과 연결될 수 있습니다. 그러면 모든 분석 데이터가 Analytics Cloud에서 단일 사이트로 집계됩니다.

속성을 사용하여 반대의 결과를 얻을 수도 있습니다. 사용자는 Liferay DXP 인스턴스의 각 사이트에 대해 고유한 속성을 생성할 수 있으므로 Analytics Cloud 사용자는 사이트별로 범위가 지정된 분석 데이터를 세분화할 수 있습니다. 관리자는 다른 속성으로 범위가 지정된 Analytics Cloud 사용자에게 권한을 할당할 수도 있습니다.

## 속성 만들기

각 Analytics Cloud 작업 영역에서 여러 속성을 만들고 추적할 수 있습니다. 시작할 때 새 DXP 데이터 소스를 연결할 때 기본 속성이 항상 생성됩니다. 데이터 소스의 이름은 DXP 인스턴스 이름과 동일합니다.

새 속성을 만들려면 Analytics Cloud Workspace로 이동하십시오. 그런 다음 *Settings* &rarr; *Properties*로 이동하여 오른쪽 상단 모서리에 있는 *New Property* 클릭합니다.

![새 속성을 추가합니다.](scoping-sites-and-individuals-using-properties/images/01.png)

속성에 이름을 지정하고 *저장*클릭합니다. 다음으로 방금 생성한 속성에 대한 설정 페이지가 표시됩니다. 처음에는 속성과 연결된 사이트가 없습니다. 다음에 이 속성에 사이트를 추가하는 방법을 알아보세요.

![새 속성이 생성되었습니다.](scoping-sites-and-individuals-using-properties/images/02.png)

## 속성에 사이트 동기화

Analytics Cloud에서 데이터를 보려면 사이트를 속성에 동기화해야 합니다. 그렇게 하려면 Liferay DXP 인스턴스의 제어판으로 이동해야 합니다.

1. Liferay DXP 인스턴스에서 *인스턴스 설정* &rarr; *Analytics Cloud* 확인하여 Liferay DXP 인스턴스가 Analytics Cloud와 동기화되고 있는지 확인합니다. `DXP 인스턴스가 Analytics Cloud에 연결됨 메시지` Liferay DXP 인스턴스가 Analytics Cloud에 올바르게 연결되었음을 확인합니다.

    ```{important}
    'DXP 인스턴스가 Analytics Cloud에 연결되었습니다.'라는 메시지가 표시되지 않으면 [Liferay DXP 사이트를 Analytics Cloud에 연결](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) .
    ```

1. Analytics Cloud 작업 영역에서 *동기화된 사이트*을 클릭합니다. Analytics Cloud에서 만든 사용 가능한 속성 목록이 나타납니다. 추적하려는 사이트에 대해 여기에서 새 속성을 만듭니다.

    ![사이트를 추적하기 위해 새 속성을 만듭니다.](scoping-sites-and-individuals-using-properties/images/03.png)

1. 생성한 속성을 선택합니다. Liferay DXP 인스턴스의 사이트 목록이 나타납니다. 이 속성과 동기화하려는 사이트를 선택하고 *저장*클릭합니다. 이제 선택한 속성을 사용하여 사이트가 Analytics Cloud에 동기화되었습니다.

    ![속성과 동기화할 사이트 선택](scoping-sites-and-individuals-using-properties/images/04.png)

    ```{important}
    여러 속성이 있는 DXP 사이트를 동기화할 수 없습니다. 사이트 중 하나가 이미 다른 속성과 동기화된 경우. 여기에서 회색으로 표시되며 선택할 수 없습니다.
    ```

## 속성에 연락처 동기화

속성에 연락처를 동기화하려면:

1. Analytics Cloud Workspace 설정에서 *연락처 선택*클릭합니다.

    ![Analytics Cloud에서 모든 사용자를 동기화하거나 사용자 그룹을 연락처로 선택하도록 선택할 수 있습니다.](scoping-sites-and-individuals-using-properties/images/05.png)

    DXP의 모든 사용자를 동기화하거나 사용자 그룹 또는 조직별로만 동기화할 수 있습니다.

1. 동기화하려는 사용자 또는 그룹을 선택하고 *저장*클릭합니다.

[Liferay DXP에서 연락처 데이터 동기화](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md)에 대해 자세히 알아보세요.

## 이메일 보고서

정기적으로 보고서를 이메일로 받을 수 있습니다. 보고서에는 고유 방문자 수, 방문자당 세션 수, 평균 세션 시간 및 평균 이탈률이 포함됩니다. 사용하려면,

1. *설정* &rarr; *속성*로 이동합니다. 보고서를 이메일로 보내려는 속성을 선택합니다.

1. *Cog* 아이콘(![Cog icon](../images/icon-cog-2.png))을 클릭하면 새 창이 열립니다.

1. 이메일 보고서를 활성화하려면 스위치를 토글합니다. 이메일 빈도(예: 매일, 매주 또는 매월)를 선택합니다. *저장*클릭합니다.
   
   ![스위치를 토글하여 이메일 보고서를 활성화하고 빈도를 선택합니다.](./scoping-sites-and-individuals-using-properties/images/06.png)

1. 정기 이메일 보고서는 선택한 빈도에 따라 전송됩니다. 일일 보고서는 매일 오전 12:00(UTC)에 발송됩니다. 주간 보고서는 매주 월요일 오전 12시(UTC)에 발송됩니다. 월간 보고서는 매월 1일 오전 12:00(UTC)에 발송됩니다. 아래에 샘플 보고서가 나타납니다.
   
   ![이메일 보고서에는 귀하의 사이트를 방문하는 개인에 대한 분석이 포함됩니다.](./scoping-sites-and-individuals-using-properties/images/07.png)

## 속성에 대한 권한 관리

관리자는 작업 영역의 모든 속성을 볼 수 있는 권한이 있습니다. 특정 속성에 대한 데이터를 볼 수 있는 권한을 작업 공간의 구성원에게 할당할 수 있습니다.

속성 권한을 할당하려면 다음을 수행합니다.

1. Analytics Cloud 작업 영역에서 *Settings* &rarr; *Properties*로 이동하고 권한을 관리하려는 속성을 선택합니다. 

   ```{note}
   기본적으로 속성은 Analytics Cloud에서 작업 영역의 모든 사용자가 액세스할 수 있습니다. *사용자 선택* 라디오 버튼을 클릭하여 변경할 수 있습니다.
   ```

1. *사용자 추가*클릭하여 속성에 사용자를 추가합니다.

추가된 사용자는 이제 속성에 액세스할 수 있습니다.

![속성에 사용자를 추가합니다.](scoping-sites-and-individuals-using-properties/images/08.png)

## 다른 속성 간 탐색

Analytics Cloud 작업 영역에서 서로 다른 속성을 번갈아 보려면 탐색 모음의 왼쪽 상단 모서리에 있는 속성 이름을 클릭하십시오. 보기 권한이 있는 속성 목록이 메뉴에 표시됩니다. 비웃는 속성을 클릭하여 전환하십시오.

![한 속성에서 다른 속성으로 보기를 변경합니다.](scoping-sites-and-individuals-using-properties/images/09.png)

속성을 볼 때. **모두** 분석 데이터의 범위가 이 속성으로 지정됩니다. 예를 들어:

* 방문자, 세션 및 페이지 보기 메트릭은 각 속성에 대한 사이트의 세션만을 기반으로 계산됩니다.
* 개인은 각 속성의 사이트를 방문한 방문자를 표시합니다. 즉, DXP 인스턴스에 5000명의 개인이 있지만 그 중 100명만 사이트에 대한 세션이 있는 경우를 의미합니다. 그중 100개만 개별 목록에 표시됩니다. 5000명의 모든 개인에 대한 데이터가 동기화되지만 속성 추적 사이트를 방문하는 개인만 표시됩니다.
* 생성된 세그먼트는 각 속성으로 범위가 지정됩니다.
* AB 테스트는 각 속성에만 범위가 지정됩니다.
