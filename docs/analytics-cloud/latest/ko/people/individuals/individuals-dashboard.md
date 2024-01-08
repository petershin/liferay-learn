# 개인 대시보드

개인 대시보드는 방문자 및 방문자가 사이트와 상호 작용하는 방식에 대한 광범위한 분석 데이터를 제공합니다.

대시보드를 보려면,

1. 메뉴의 사람 섹션에서 **개인** 을 클릭하세요.

1. **개요** 탭을 클릭하세요. 이 탭은 개인을 클릭하면 기본적으로 선택됩니다.

개인 대시보드에는 다음 패널이 포함되어 있습니다.

* [현재 합계](#current-totals)
* [강화된 프로필](#enriched-profiles)
* [활성 개인](#active-individuals)
* [관심분야](#interests)
* [고장](#breakdown)

이 대시보드 보기를 PDF 파일로 다운로드하려면 **보고서 다운로드** 를 클릭하세요. 자세한 내용은 [보고서 다운로드](../../reference/downloading-reports.md) 참조하세요.

## 현재 합계

현재 합계 패널에는 Analytics Cloud에서 추적한 알려진 개인과 익명의 총 개인 수가 표시됩니다.

![The Current Totals panel presents total numbers for visitors to your Site.](./individuals-dashboard/images/01.png)

```{note}
로그인 시 이메일 주소가 Analytics Cloud와 동기화된 사용자 데이터와 일치하면 개인이 알려진 것으로 간주됩니다. 신규 사용자가 사이트에 등록하면 해당 데이터가 Analytics Cloud와 동기화되고 알려진 개인으로 표시되는 데 최대 2시간이 걸릴 수 있습니다.
```

패널에는 지난 30일과 비교한 총 숫자의 변화율도 표시됩니다.

## 강화된 프로필

강화된 프로필 패널에는 지난 30일 동안 강화된 개인의 총 수가 표시됩니다.

![The Enriched Profiles panel presents the total number of individuals who have been enriched.](./individuals-dashboard/images/02.png)

개인은 속성이 해당 개인과 연관될 때마다 강화된 것으로 간주됩니다. 예를 들어 DXP에서 연락처 데이터를 [하는 경우](../../getting-started/connecting-liferay-dxp-to-analytics-cloud.md) .

## 활동적인 개인

활성 개인 패널은 선택한 기간에 귀하의 사이트와 상호 작용한 알려진 개인과 익명의 개인 모두에 대한 정보를 제공합니다.

![The Active Individuals panel presents a chart of individuals over time who have interacted with the Site.](./individuals-dashboard/images/03.png)

일, 주 또는 월을 기준으로 데이터를 시각화하도록 선택합니다. 데이터는 지난 24시간, 지난 7일, 지난 30일, 지난 90일 등 시간 범위별로 필터링할 수 있습니다. 추가 시간 범위를 표시하려면 **추가 사전 설정 기간** 을 클릭하세요. **사용자 정의 범위** 를 클릭하여 원하는 시작 날짜와 종료 날짜를 기준으로 필터링하세요.

## 이해

관심분야 패널에는 가장 인기 있는 상위 5개 주제가 표시됩니다.

![The Interests panel presents a chart of popular topics.](./individuals-dashboard/images/04.png)

관심분야에 대한 전체 개인의 비율은 특정 주제에 관심이 있는 개인의 비율을 나타냅니다. 이러한 주제는 페이지 HTML의 제목, 설명 및 키워드 태그에서 파생됩니다.

관심 주제의 전체 목록을 보려면 패널에서 **모든 관심 분야 보기** 를 클릭하세요. 또는 페이지 상단의 관심분야 탭을 클릭하세요.

관심사에 대해 자세히 알아보려면 [관심사 이해](./understanding-interests.md) 참조하세요.

## 고장

분석 패널은 개인의 선택된 속성을 기반으로 분포 정보를 표시합니다. 다음 속성을 사용할 수 있습니다.

* `additionalName`: 중간 이름
* `birthDate`: 생년월일
* `Email`: 이메일 주소
* `familyName`: 성
* `givenName`: 이름
* `jobTitle`: 직위
* `언어Id`: 기본 언어
* `modifiedDate`: 마지막 수정 날짜
* 클릭하세요.

![The Breakdown panel presents distribution information based on selected attributes.](./individuals-dashboard/images/05.png)

새로운 분류를 추가하려면,

1. 패널 오른쪽 상단에 있는 더하기 기호를 클릭합니다.

1. 드롭다운 메뉴를 사용하여 속성을 선택합니다.

1. 분석 이름을 입력하고 **저장** 을 클릭하세요.

추가 속성의 분석을 보려면 **분석 탐색** 을 클릭하세요. 또는 페이지 상단의 **배포** 탭을 클릭하세요.