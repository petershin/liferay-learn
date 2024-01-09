# 측정항목 설명

Analytics Cloud에서 사용하는 다양한 지표에 대한 설명과 계산 방법을 확인하세요.

색인:

- [A/B 테스팅 - 승자 발표 예상 시간](./metrics-description.md#ab-testing---estimated-time-to-declare-winner)
- [A/B 테스트 - 개선](./metrics-description.md#ab-testing---improvement)
- [A/B 테스트 - 승리 확률](./metrics-description.md#ab-testing---probability-to-win)
- [획득 - 세션 비율](./metrics-description.md#acquisitions---percentage-of-sessions)
- [활성 개인](./metrics-description.md#active-individuals)
- [익명 개인](./metrics-description.md#anonymous-individuals)
- [청중 - 다운로드된 세그먼트](./metrics-description.md#audience---downloaded-segments)
- [청중 - 다운로드](./metrics-description.md#audience---downloads)
- [청중 - 세분화된 다운로드](./metrics-description.md#audience---segmented-downloads)
- [청중 - 분할된 제출](./metrics-description.md#audience---submissions)
- [시청자 - 세분화된 시청자](./metrics-description.md#audience---segmented-viewers)
- [청중 - 분할된 보기](./metrics-description.md#audience---segmented-views)
- [청중 - 제출물](./metrics-description.md#audience---submissions)
- [대상 - 제출자 세그먼트](./metrics-description.md#audience---submitter-segments)
- [시청자 - 시청자 세그먼트](./metrics-description.md#audience---viewer-segments)
- 관객 [명 - 조회수](./metrics-description.md#audience---views)
- [관객 - 방문자](./metrics-description.md#audience---visitors)
- [반송률](./metrics-description.md#bounce-rate)
- [클릭수](./metrics-description.md#clicks)
- [댓글](./metrics-description.md#comments)
- [다운로드](./metrics-description.md#downloads)
- [입구](./metrics-description.md#entrances)
- [종료율](./metrics-description.md#exit-rate)
- [양식 - 포기](./metrics-description.md#forms---abandonment)
- [관심분야 - 활성 회원 비율]()
- [관심분야 - 세션 비율](./metrics-description.md#interests---percentage-of-sessions)
- [관심분야 - 전체 개인의 비율](./metrics-description.md#interests---percentage-of-total-individuals)
- [알려진 개인](./metrics-description.md#known-individuals)
- [미리보기](./metrics-description.md#preview)
- [읽기 시간](./metrics-description.md#reading-time)
- [검색 - 세션 비율](./metrics-description.md#search---percentage-of-sessions)
- [세션 시간](./metrics-description.md#session-duration)
- [위치별 세션](./metrics-description.md#sessions-by-location)
- 기술별 [회](./metrics-description.md#sessions-by-technology)
- 방문자당 세션 [개](./metrics-description.md#sessions-per-visitor)
- [제출](./metrics-description.md#submissions)
- [페이지에 머문 시간](./metrics-description.md#time-on-page)
- [총 개인 또는 고유 방문자 수](./metrics-description.md#total-individuals-or-unique-visitors)
- 조회수 [회](./metrics-description.md#views)
- 요일별, 시간별 방문객 [명](./metrics-description.md#visitors-by-day-and-time)

## A/B 테스트 - 승자 발표 예상 시간

이는 승자를 결정하기 위해 A/B 테스트를 실행해야 하는 기간입니다.  참고로 이탈률 유형 A/B 테스트에만 사용할 수 있습니다.

## A/B 테스트 - 개선

이는 대조군의 상대적인 개선을 보여줍니다. 예를 들어 대조군의 유지율은 15%이지만 변형의 유지율은 16%일 수 있습니다. 개선은 다음과 같이 계산됩니다.

```
((16 - 15)/ 15)* 100 = ~6.67% improvement.
```

이 측정항목을 리프트라고도 합니다.

## A/B 테스트 - 승리 확률

이는 변형이 대조군을 능가할 확률을 백분율로 나타낸 예측입니다.

## 획득 - 세션 비율

이는 방문자가 귀하의 사이트에 어떻게 도착하는지에 대한 상위 트래픽 소스의 비율을 보여줍니다. 이전 세션 이후 30분 동안 활동이 없거나 새로운 하루가 시작되는 경우(예: 자정이 지난 경우)해당 세션은 새 세션으로 간주됩니다. 특정 기간 동안 요율은 다음과 같이 계산됩니다.

```
(The acquisition traffic source)÷ (The total number of sessions)* 100
```

## 활동적인 개인

선택한 기간 내에 사이트와 상호작용한 총 방문자 수입니다.

## 익명의 개인

이는 고유한 'userId'(예: 사용자 ID)로 식별되지만 이메일 주소와 연결되지 않은 방문자의 총 수입니다. 귀하의 사이트를 방문하는 모든 방문자에게는 이메일 주소로 로그인하는 개인을 제외하고 새로운 'userId'가 할당됩니다. 이전에 로그인한 방문자는 이전에 할당된 'userId'와 연결됩니다.

## 잠재고객 - 다운로드된 세그먼트

문서나 미디어를 다운로드한 상위 세그먼트입니다. 차트의 각 막대는 문서나 미디어를 다운로드한 해당 세그먼트의 총 개인 수를 표시합니다. 또한 막대는 문서나 미디어를 다운로드한 것으로 알려진 개인 중 해당 세그먼트에 속하는 사람의 비율에 대한 값도 제공합니다. 특정 기간 동안 백분율은 다음과 같이 계산됩니다.

```
(The number of individuals that are part of that segment who downloaded the document or media)÷ (The total number of known individuals who downloaded that document or media)* 100
```

## 청중 - 다운로드

특정 기간 동안 문서나 미디어를 다운로드한 총 방문자 수입니다. 익명의 개인과 알려진 개인의 백분율 분석이 표시됩니다.

## 대상 - 세분화된 다운로드

이는 특정 기간 동안 문서나 미디어를 다운로드한 알려진 개인의 총 수입니다. 분할된 개인과 분할되지 않은 개인의 백분율 분석이 표시됩니다.

## 대상 - 분할된 제출

이는 지정된 기간 동안 양식을 제출한 알려진 개인의 총 수입니다. 분할된 개인과 분할되지 않은 개인의 백분율 분석이 표시됩니다.

## 시청자 - 세분화된 시청자

이는 특정 기간 동안 페이지를 본 알려진 개인의 총 수입니다. 분할된 개인과 분할되지 않은 개인의 백분율 분석이 표시됩니다.

## 대상 - 분할된 보기

이는 특정 기간 동안 자산을 본 알려진 개인의 총 수입니다. 분할된 개인과 분할되지 않은 개인의 백분율 분석이 표시됩니다.

## 청중 - 제출물

이는 특정 기간 동안 양식을 제출한 총 방문자 수입니다. 익명의 개인과 알려진 개인의 백분율 분석이 표시됩니다.

## 대상 - 제출자 세그먼트

양식을 제출한 상위 세그먼트입니다. 차트의 각 막대에는 해당 세그먼트에 속한 양식을 제출한 개인의 총 수가 표시됩니다. 막대는 또한 양식을 제출한 것으로 알려진 개인 중 해당 세그먼트에 속하는 사람의 비율에 대한 값도 제공합니다. 특정 기간 동안 백분율은 다음과 같이 계산됩니다.

```
(The number of individuals that are part of that segment who submitted the form)÷ (The total number of known individuals who submitted the form)* 100
```

## 시청자 - 시청자 세그먼트

페이지 또는 자산을 조회한 상위 세그먼트입니다. 차트의 각 막대는 해당 세그먼트에 포함된 페이지 또는 자산을 본 개인의 총 수를 표시합니다. 또한 막대는 해당 페이지나 자산을 본 것으로 알려진 개인 중 해당 세그먼트에 속하는 사람의 비율에 대한 값도 제공합니다.

특정 기간 동안 백분율은 다음과 같이 계산됩니다.

```
(The number of individuals that are part of that segment who viewed the page or asset)÷ (The total number of known individuals who viewed the page or asset)* 100
```

## 잠재고객 - 조회수

지정된 기간 동안 자산을 본 총 방문자 수입니다. 익명의 개인과 알려진 개인의 백분율 분석이 표시됩니다.

## 관객 - 방문자

특정 기간 동안 페이지를 방문한 총 방문자 수입니다. 익명의 개인과 알려진 개인의 백분율 분석이 표시됩니다.

## 바운스 비율

이탈률은 개인이 사이트의 페이지를 방문했지만 세션이 끝나기 전에 더 이상 상호 작용이 없는 세션의 비율을 보여줍니다. 이전 세션 이후 30분 동안 활동이 없거나 새로운 하루가 시작되는 경우(예: 자정이 지난 경우)해당 세션은 새 세션으로 간주됩니다. 특정 기간 동안 요율은 다음과 같이 계산됩니다.

```
(Total number of bounced sessions)÷ (The total number of sessions)* 100
```

## 클릭수

이는 특정 기간 동안 A/B 테스트, 웹 콘텐츠 또는 사용자 정의 자산에 대한 총 클릭 수입니다.

## 댓글

이는 특정 기간 동안 블로그, 문서 및 미디어에 게시된 총 댓글 수입니다.

## 다운로드

이는 특정 기간 동안 문서, 미디어 또는 사용자 정의 자산의 총 다운로드 횟수입니다.

## 입구

입구에는 방문자가 사이트에 들어갈 때 가장 먼저 보는 가장 일반적인 페이지와 각 페이지에 대한 입구 수가 표시됩니다.

## 종료율

이는 페이지와 상호작용(예: 스크롤 또는 클릭)한 후 사이트를 떠난 방문자의 비율입니다. 이탈률은 포함되지 않습니다. 특정 기간 동안 요율은 다음과 같이 계산됩니다.

```
(Total number of sessions of the page in which visitors left the site)÷ (The total number of sessions of the page)* 100
```

## 양식 - 포기

포기는 양식을 제출하지 않고 떠난 개인의 비율입니다. 특정 기간 동안 요율은 다음과 같이 계산됩니다.

```
(Total number of individuals who viewed a form without submitting)÷ (The total number of individuals who viewed the form)* 100
```

## 관심 분야 - 활동 회원 비율

관심 분야의 활동 회원 비율은 세그먼트 내 활동 회원 중 해당 관심 주제에 관심이 있는 활동 회원의 비율을 나타냅니다. 세그먼트의 구성원이 지난 30일 이내에 사이트와 상호 작용한 경우 활성 상태로 간주됩니다. 요율은 다음과 같이 계산됩니다.

```
(The total number of active segment members who were interested in that topic)÷ (The total number of active segment members)* 100
```

## 관심분야 - 세션 비율

관심 분야 세션 비율은 특정 기간 동안 해당 관심 주제가 포함된 세션 비율을 보여줍니다. 이전 세션 이후 30분 동안 활동이 없거나 새로운 하루가 시작되는 경우(예: 자정이 지난 경우)해당 세션은 새 세션으로 간주됩니다. 특정 기간 동안 요율은 다음과 같이 계산됩니다.

```
(Total number of sessions that contained that interest topic)÷ (The total number of sessions)* 100
```

## 관심분야 - 전체 개인의 비율

관심분야에 대한 전체 개인의 비율은 특정 주제에 관심이 있는 개인의 비율을 나타냅니다. 특정 기간 동안 요율은 다음과 같이 계산됩니다.

```
(Total number of individuals interested in that interest topic)÷ (The total number of individuals)* 100
```

## 알려진 개인

이는 고유한 `userId`(예: 사용자 ID)로 식별되고 이메일 주소와 연결된 방문자의 총 수입니다. 이전에 로그인한 방문자는 이전에 할당된 'userId'와 연결됩니다.

## 시사

이는 특정 시간 범위에서 문서 또는 미디어를 미리 본 횟수입니다.

## 읽기 전용

독서 시간은 블로그 항목에 소요된 평균 시간입니다. 특정 기간 동안 요율은 다음과 같이 계산됩니다.

```
(Total time spent on the blog entry across all views)÷ (The total number of views)* 100
```

## 검색 - 세션 비율

검색 세션 비율은 특정 기간 동안 해당 검색어가 포함된 검색 비율을 보여줍니다. 이전 세션 이후 30분 동안 활동이 없거나 새로운 하루가 시작되는 경우(예: 자정이 지난 경우)해당 세션은 새 세션으로 간주됩니다. 특정 기간 동안 요율은 다음과 같이 계산됩니다.

```
(Total number of sessions that contained that search query term)÷ (The total number of sessions)* 100
```

## 세션 시간

평균 세션이 지속되는 시간입니다. 이전 세션 이후 30분 동안 활동이 없거나 새로운 하루가 시작되는 경우(예: 자정이 지난 경우)해당 세션은 새 세션으로 간주됩니다.

## 사이트
별 세션

사이트
별 세션은 방문자가 귀하의 사이트에 액세스하는 상위 국가를 보여줍니다. 상위 5개 국가가 전체 세션에서 나타내는 백분율 값과 함께 표시됩니다. 상위 5개 국가에 포함되지 않은 나머지 국가는 단일 백분율 값으로 결합됩니다. 이전 세션 이후 30분 동안 활동이 없거나 새로운 하루가 시작되는 경우(예: 자정이 지난 경우)해당 세션은 새 세션으로 간주됩니다.

## 기술별 세션

기술별 세션에는 사이트를 방문하는 데 사용된 장치, 운영 체제 및 브라우저가 표시됩니다. 다양한 기기 유형, 다양한 운영 체제 유형, 다양한 브라우저 유형에 대한 세션 비율별 분석이 나타납니다. 이전 세션 이후 30분 동안 활동이 없거나 새로운 하루가 시작되는 경우(예: 자정이 지난 경우)해당 세션은 새 세션으로 간주됩니다.

## 방문자당 세션수

이는 순 방문자당 세션 수의 평균입니다. 단일 방문자가 여러 세션을 열 수 있습니다. 이전 세션 이후 30분 동안 활동이 없거나 새로운 하루가 시작되는 경우(예: 자정이 지난 경우)해당 세션은 새 세션으로 간주됩니다. 특정 기간 동안 요율은 다음과 같이 계산됩니다.

```
(Total number of sessions across all visitors)÷ (The total number of visitors)* 100
```

## 제출

제출은 특정 기간에 제출된 총 양식 수입니다.

## 페이지에 머문 시간

페이지에 머문 시간은 해당 페이지에서 보낸 평균 시간입니다. 특정 기간 동안 요율은 다음과 같이 계산됩니다.

```
(Total time spent on the page across all views)÷ (The total number of views)* 100
```

## 총 개인 또는 고유 방문자

이는 고유한 'userId'(예: 사용자 ID)로 식별되는 개인의 총 수입니다.

귀하의 사이트 방문자에게는 고유한 'userId'가 할당됩니다. 방문자가 이메일 주소로 로그인하면 분석 데이터가 이 'userId'와 계속 연결됩니다. 방문자가 이전에 로그인했고 이미 'userId'가 할당된 경우 분석 데이터는 대신 이전에 할당된 이 'userId'와 연결됩니다.

방문자가 다른 브라우저를 사용하거나, 다른 이메일 주소로 로그인하거나, 브라우저 쿠키를 삭제하는 경우 새로운 'userId'가 할당됩니다.

## 전망

조회수는 특정 기간 동안 페이지 또는 자산의 총 조회수입니다.

## 요일별, 시간별 방문객

이는 특정 시간 범위에서 매일 24시간 동안의 총 순 방문자 수입니다. 각 셀의 도구 설명에는 해당 날짜와 시간의 방문자 수가 표시됩니다.
