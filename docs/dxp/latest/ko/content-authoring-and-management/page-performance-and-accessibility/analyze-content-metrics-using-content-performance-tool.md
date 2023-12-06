# 콘텐츠 성능 도구를 사용하여 콘텐츠 지표 분석

{bdg-secondary}`가능 7.3+`

> 일부 콘텐츠 성능 옵션은 Liferay DXP/Portal 7.4부터만 사용할 수 있습니다.

콘텐츠 성과 도구를 사용하여 조회수, 트래픽 획득 채널 또는 사람들을 페이지로 유도하는 키워드와 같은 콘텐츠 지표를 분석할 수 있습니다. 콘텐츠 성능 도구에서 디스플레이 페이지 템플릿 [과 연결된 콘텐츠 페이지, 위젯 페이지 또는 웹 콘텐츠의 URL에 대한 메트릭을 볼 수](../../site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages.md).

```{important}
콘텐츠 성능 지표는 [기본 경험](../../site-building/personalizing-site-experience/experience-personalization/creating-and-managing-experiences.md)에서만 사용할 수 있습니다.
```

콘텐츠에 대한 **메트릭 보기**(![View Metrics](../../images/icon-analytics.png)) 옵션을 사용하여 콘텐츠 성능 도구에 액세스합니다. 이 옵션은 [응용 프로그램 도구 모음](../../getting-started/navigating-dxp.md#applications-bar) 및 [콘텐츠 대시보드](../content-dashboard/about-the-content-dashboard.md)에서 찾을 수 있습니다. 자세한 내용은 [콘텐츠 성능 도구 정보](./about-the-content-performance-tool.md)을 참조하십시오.

콘텐츠 성능 도구에는 세 가지 영역이 있습니다.

* [콘텐츠 정보](#reviewing-content-information)
* [약속](#analyzing-content-engagement)
* [트래픽 채널](#analyzing-traffic-channels)

## 콘텐츠 정보 검토

콘텐츠 성능 도구의 상단 영역은 콘텐츠에 대한 일반 정보를 제공합니다.

| 라벨        | 묘사                                                                              |
|:--------- |:------------------------------------------------------------------------------- |
| 컨텐츠 이름    | 디스플레이 페이지 템플릿을 기반으로 하는 콘텐츠 또는 위젯 페이지의 이름 또는 자산 이름입니다.                           |
| URL       | 디스플레이 페이지 템플릿과 연결된 콘텐츠 페이지, 위젯 페이지 또는 웹 콘텐츠의 URL을 나타냅니다.                        |
| 작성자       | 저자 이름. 이 정보는 디스플레이 페이지 템플릿을 사용하는 웹 콘텐츠에만 사용할 수 있습니다.                            |
| 시간 범위 선택기 | 기간(지난 7일/지난 30일)을 선택하면 선택한 기간 동안의 데이터가 차트에 표시됩니다.                               |
| 발행일       | 발행일을 표시합니다. 자산 게시 날짜보다 최신인 표시 페이지 템플릿에 자산을 연결하면 게시 날짜가 표시 페이지 템플릿 생성 날짜와 일치합니다. |

콘텐츠 성능 도구의 [참여](#analyzing-content-engagement) 및 [트래픽 채널](#analyzing-traffic-channels) 영역에는 언어 아이콘 선택기에서 선택한 언어에 대한 통계가 표시됩니다. 콘텐츠가 다른 언어로 현지화되면 각 언어에 대한 지표를 볼 수 있습니다.

```{note}
콘텐츠가 특정 언어로 번역되지 않은 경우에도 사용자가 해당 언어의 URL을 사용하여 콘텐츠에 액세스하면 해당 언어에 대한 통계를 찾을 수 있습니다.
```

![콘텐츠 성능 도구의 상단 영역은 콘텐츠에 대한 일반 정보를 제공합니다.](./analyze-content-metrics-using-content-performance-tool/images/01.png)

### 시간 범위 선택기 사용

시간 범위 드롭다운(지난 7일/지난 30일)을 사용하여 메트릭 분석 범위를 지정할 수 있습니다.

![시간 범위 선택기 사용 ](./analyze-content-metrics-using-content-performance-tool/images/02.png)

시간 범위 선택기는 **추천** 및 **소셜 트래픽** 패널의 세부 사항 보기에도 포함됩니다.

![패널 상세 보기의 시간 범위 ](./analyze-content-metrics-using-content-performance-tool/images/03.png)


## 콘텐츠 참여도 분석

이 영역은 콘텐츠 또는 페이지 URL에 대한 조회수와 이 수치가 시간에 따라 어떻게 변하는지 보여줍니다. 조회수는 콘텐츠 성능을 이해하고 콘텐츠 인사이트를 발견하는 데 핵심입니다. 디스플레이 페이지 템플릿을 기반으로 하는 웹 콘텐츠 또는 문서 및 미디어의 경우 참여 영역에도 읽기 횟수가 표시됩니다. 웹 콘텐츠에 액세스하는 방문자는 콘텐츠를 읽을 수도 있고 읽지 않을 수도 있습니다. 콘텐츠를 방문하는 청중(조회 수)과 콘텐츠에 참여하는 청중(읽기 수)을 구별하기 위해 Liferay는 무엇보다도 기사 길이, 언어 및 스크롤 동작과 같은 매개변수를 고려하는 특수 알고리즘을 사용합니다.

기본적으로 참여 영역에는 지난 7일 동안의 조회수와 함께 콘텐츠의 총 조회수가 표시됩니다. 드롭다운 시간 선택기에서 이 기간을 변경하고 뒤로 및 앞으로 버튼(![Arrow left](../../images/icon-angle-left.png) ![Arrow right](../../images/icon-angle-right.png))을 사용하여 시간 경과에 따른 추세를 분석할 수 있습니다. 꺾은선형 차트의 아무 부분 위로 마우스를 가져가면 특정 시간에 대한 보기가 표시됩니다.

```{note}
Engagement 차트가 특정 기간 동안 0 값을 표시하면 해당 기간 동안 정보를 수집하거나 분석할 수 없음을 의미합니다.
```

![콘텐츠 성능 도구의 참여 영역은 보기 정보를 제공합니다.](./analyze-content-metrics-using-content-performance-tool/images/04.png)

## 트래픽 채널 분석

콘텐츠 성능 사이드바의 이 부분은 콘텐츠로 웹 트래픽을 유도하는 소스에 대한 정보를 제공합니다. 출처는 다음과 같습니다.

| 트래픽 채널 | 소스 설명                       |
|:------ |:--------------------------- |
| 사회     | 소셜 네트워크                     |
| 오가닉    | 검색 엔진                       |
| 유급의    | Google Ads의 유료 키워드          |
| 추천     | 검색 엔진 및 동일한 페이지의 도메인 이외의 소스 |
| 직접     | 기타 또는 알 수 없는 출처             |

![콘텐츠 성능 도구의 검색 엔진 트래픽 영역은 트래픽 채널에 대한 정보를 제공합니다.](./analyze-content-metrics-using-content-performance-tool/images/05.png)

트래픽 채널(A) 중 하나를 클릭하면 채널(B)에 대한 확장된 정보를 볼 수 있습니다.

![추가 채널 세부 정보에 액세스하려면 트래픽 채널을 클릭하십시오.](./analyze-content-metrics-using-content-performance-tool/images/06.png)

다음 표에는 트래픽 채널 영역에서 찾을 수 있는 메트릭이 설명되어 있습니다.

| 라벨           | 묘사                                     |
|:------------ |:-------------------------------------- |
| 트래픽 양        | 페이지의 예상 방문자 수입니다.                      |
| 트래픽 공유       | 콘텐츠가 트래픽 소스에서 받는 트래픽의 비율입니다.           |
| 상위 참조 소셜 미디어 | 귀하의 페이지로 트래픽을 유도하는 상위 10개 소셜 미디어 네트워크. |
| 상위 참조 페이지    | 귀하의 페이지로 트래픽을 유도하는 상위 10개 리퍼러 페이지입니다.  |
| 상위 참조 도메인    | 귀하의 페이지로 트래픽을 유도하는 상위 10개 리퍼러 도메인.     |

```{note}
키워드는 사람들이 콘텐츠를 찾는 데 사용하는 하나 이상의 단어입니다.
```

## 관련 정보

* [콘텐츠 성능 도구 정보](./about-the-content-performance-tool.md)
* [콘텐츠 대시보드 정보](../content-dashboard/about-the-content-dashboard.md)
* [콘텐츠의 범주 및 어휘 정의](../tags-and-categories/defining-categories-and-vocabularies-for-content.md)
