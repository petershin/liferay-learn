# 속성을 사용하여 사이트 및 개인 범위 지정

속성을 사용하면 레이블을 정의하고 단일 사이트 또는 여러 사이트에 연결할 수 있습니다. 이를 통해 단일 대시보드의 속성과 관련된 모든 사이트에 대한 분석 데이터를 집계할 수 있습니다. 이는 DXP 인스턴스에 여러 사이트가 있고 이를 단일 사이트로 분석하려는 경우 특히 유용합니다.

예를 들어, 각 부서에 대해 여러 하위 사이트가 있는 기업 인트라넷을 상상해 보십시오. 각 하위 사이트는 _인트라넷_이라는 사용자 정의 속성과 연결될 수 있습니다. 그러면 모든 분석 데이터가 Analytics Cloud에 단일 사이트로 집계됩니다.

속성을 사용하여 반대의 결과를 얻을 수도 있습니다. 사용자는 Liferay DXP 인스턴스의 각 사이트에 대해 고유한 속성을 생성하여 Analytics Cloud 사용자가 사이트별로 범위가 지정된 분석 데이터를 세분화할 수 있습니다. 관리자는 다양한 속성으로 범위가 지정된 Analytics Cloud 사용자에게 권한을 할당할 수도 있습니다.

## 속성 만들기

각 Analytics Cloud 작업 공간에서 여러 속성을 생성하고 추적할 수 있습니다. 시작할 때 새 DXP 데이터 소스를 연결할 때 항상 기본 속성이 생성됩니다. 데이터 소스의 이름은 DXP 인스턴스 이름과 동일합니다.

새 속성을 만들려면 Analytics Cloud Workspace로 이동하세요. 그런 다음 _설정_ &rarr; _속성_으로 이동하여 오른쪽 상단에 있는 _새 속성_을 클릭하세요.

![Adding a new property.](scoping-sites-and-individuals-using-properties/images/01.png)

속성에 이름을 지정하고 _저장_을 클릭하세요. 다음으로 방금 생성한 속성에 대한 설정 페이지가 표시됩니다. 처음에는 부동산과 연결된 사이트가 없습니다. 다음으로 이 속성에 사이트를 추가하는 방법을 알아보세요.

![A new property has been created.](scoping-sites-and-individuals-using-properties/images/02.png)

## 사이트를 속성에 동기화하기

Analytics Cloud에서 해당 데이터를 보려면 사이트를 속성에 동기화해야 합니다. 그렇게 하려면 Liferay DXP 인스턴스의 제어판으로 이동해야 합니다.

1. Liferay DXP 인스턴스에서 _인스턴스 설정_ &rarr; _Analytics Cloud_를 확인하여 Liferay DXP 인스턴스가 Analytics Cloud와 동기화되고 있는지 확인하세요. 'DXP 인스턴스가 Analytics Cloud에 연결되었습니다'라는 메시지는 Liferay DXP 인스턴스가 Analytics Cloud에 올바르게 연결되었음을 확인합니다.

   !!! 중요
   'DXP 인스턴스가 Analytics Cloud에 연결되었습니다.'라는 메시지가 표시되지 않으면 [Liferay DXP 사이트를 Analytics Cloud에 연결](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) 을 검토하십시오.

1. Liferay 인스턴스가 Analytics Cloud에 연결되어 있지만 속성이 할당되지 않은 경우 _다음_을 클릭하세요.

   ![Select the property to sync your sites with.](scoping-sites-and-individuals-using-properties/images/03.png)

   사이트를 동기화하려는 속성 옆에 있는 _할당_을 클릭하세요.

1. 사이트 목록이 나타납니다. 속성에 할당할 사이트를 선택하세요.

   ![Select the sites to assign to the property.](scoping-sites-and-individuals-using-properties/images/04.png)

   _할당_을 클릭하세요. 그런 다음 _다음_을 클릭하여 연결 프로세스를 완료하세요..

   !!! 중요
   DXP 사이트를 여러 속성과 동기화할 수 없습니다. 사이트 중 하나가 이미 다른 속성과 동기화된 경우 해당 사이트는 비활성화되어 선택할 수 없습니다.

## 연락처를 속성에 동기화하기

연락처를 속성에 동기화하려면 다음 단계를 따르세요.

1. Analytics Cloud Workspace 설정에서 _연락처 선택_을 클릭하세요.

   ![You can choose to sync all or select groups of users as contacts in Analytics Cloud.](scoping-sites-and-individuals-using-properties/images/05.png)

   DXP의 모든 사용자를 동기화하거나 사용자 그룹 또는 조직별로만 동기화할 수 있습니다.

1. 동기화하려는 사용자 또는 그룹을 선택하고 _저장_을 클릭하세요.

```{note}
Liferay DXP의 배치 엔진은 사용자 동기화에 사용됩니다. 매우 많은 수의 사용자를 동기화하는 경우 배치 크기를 늘리십시오. Liferay DXP에서 _글로벌 메뉴_ &rarr; _인스턴스 설정_ &rarr; _배치 엔진_으로 이동합니다. _내보내기 배치 크기_ 및 _가져오기 배치 크기_를 '1000'으로 설정하세요.
```

Liferay DXP [의 연락처 데이터 동기화에 대해](../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) 알아보세요.

## 이메일 보고서

정기적으로 이메일로 보고서를 받아보실 수 있습니다. 보고서에는 고유 방문자 수, 방문자당 세션 수, 평균 세션 기간 및 평균 이탈률이 포함됩니다. 사용하려면,

1. _설정_ &rarr; _속성_으로 이동합니다. 이메일로 보고서를 받고 싶은 속성을 선택하세요.

1. _톱니바퀴_ 아이콘(![톱니바퀴 아이콘](../images/icon-cog-2.png))을 클릭하면 새 창이 열립니다.

1. 이메일 보고서를 활성화하려면 스사이트
를 전환하세요. 이메일 빈도를 선택합니다(예: 매일, 매주 또는 매월). _저장_을 클릭하세요.

   ![Toggle the switch to enable email reports and select a frequency.](./scoping-sites-and-individuals-using-properties/images/06.png)

1. 선택한 빈도에 따라 정기적인 이메일 보고서가 전송됩니다. 참고로 일일 보고서는 매일 오전 12시(UTC)에 전송됩니다. 주간 보고서는 매주 월요일 오전 12시(UTC)에 전송됩니다. 월별 보고서는 매월 1일 오전 12시(UTC)에 전송됩니다. 샘플 보고서가 아래에 표시됩니다.

   ![Email reports include analytics about individuals visiting your site.](./scoping-sites-and-individuals-using-properties/images/07.png)

## 속성에 대한 권한 관리

관리자에게는 작업 영역의 모든 속성을 볼 수 있는 권한이 있습니다. 작업 영역의 구성원에게 특정 속성에 대한 데이터를 볼 수 있는 권한을 할당할 수 있습니다.

속성 권한을 할당하려면 다음을 수행합니다.

1. Analytics Cloud 작업 영역에서 _설정_ &rarr; _속성_으로 이동하여 권한을 관리하려는 속성을 선택합니다.

   ```{note}
   기본적으로 속성은 Analytics Cloud 작업 영역의 모든 사용자가 액세스할 수 있습니다. *사용자 선택* 라디오 버튼을 클릭하여 이를 변경할 수 있습니다.
   ```
1. _사용자 추가_를 클릭하여 속성에 사용자를 추가합니다.

이제 추가된 사용자는 속성에 액세스할 수 있습니다.

![Adding users to a property.](scoping-sites-and-individuals-using-properties/images/08.png)

## 다양한 속성 간 탐색

Analytics Cloud 작업 공간에서 여러 속성을 번갈아 보려면 탐색 모음의 왼쪽 상단에 있는 속성 이름을 클릭하세요. 보기 권한이 있는 속성 목록이 메뉴에 표시됩니다. 전환하려면 조롱된 속성을 클릭하세요.

![Changing views from one property to another.](scoping-sites-and-individuals-using-properties/images/09.png)

부동산을 볼 때. **모든** 분석 데이터의 범위는 이 속성으로 지정됩니다. 예를 들어:

* 방문자, 세션 및 페이지 조회 측정항목은 각 속성에 대한 사이트의 세션만을 기준으로 계산됩니다.
* 개인은 각 부동산의 사이트를 방문한 방문자를 표시합니다. 이는 DXP 인스턴스에 5000명의 개인이 있지만 그 중 100명만이 사이트에 세션을 갖고 있는 경우를 의미합니다. 그 중 100개만 개별 목록에 표시됩니다. 5000명 전체의 데이터가 동기화되지만, 부동산 추적 사이트를 방문한 개인만 표시됩니다.
* 생성된 세그먼트의 범위는 각 속성으로 지정됩니다.
* AB 테스트는 각 속성에만 적용됩니다.
