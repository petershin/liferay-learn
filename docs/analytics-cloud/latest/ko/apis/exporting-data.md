# 데이터 내보내기

[사이트 대시보드](../touchpoints/sites-dashboard.md) 및 [개인 대시보드](../people/individuals/individuals-dashboard.md)을 통해 다양한 분석 데이터에 액세스할 수 있습니다. Analytics Cloud의 API를 사용하여 Analytics 데이터를 가져오고 내보낼 수도 있습니다. 특히 이벤트 데이터, 개별 데이터, 세그먼트 데이터 또는 페이지 데이터를 가져올 수 있습니다.

## 데이터 내보내기 요청

1. 작업 공간의 액세스 토큰을 기록해 두십시오. 액세스 토큰을 생성하거나 얻으려면 [인증](authentication.md) 참조하십시오.

1. 데이터 요청은 다음 형식을 사용합니다.

   ```
   curl -i -L -H "Authorization: Bearer [token]" -L https://analytics.liferay.com/api/reports/export/[type]?fromDate=[ISO 8601 date and time]&toDate=[ISO 8601 date and time]
   ```

   `[token]` 특정 액세스 토큰으로 바꿉니다. `[type]` `이벤트`, `개별`, `페이지`또는 `세그먼트`으로 교체하십시오. `fromDate=`다음에 `[ISO 8601 날짜 및 시간]` 교체하여 시작 날짜와 시간을 지정합니다. `toDate=`다음에 `[ISO 8601 날짜 및 시간]` 교체하여 종료 날짜 및 시간을 지정합니다. [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) 날짜 및 시간 형식을 사용해야 합니다. 요청에는 시작 날짜 및 시간과 종료 날짜 및 시간이 필요합니다.

   예를 들어 페이지 데이터 요청은 다음과 같습니다.

   ```
   curl -i -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" -L http://analytics.liferay.com/api/reports/export/page?fromDate=2022-01-01'T'00:00:01.000'Z'&toDate=2022-01-05'T'23:59:59.000'Z'
   ```

1. 데이터를 요청하면 다음과 같은 메시지가 나타납니다.

   ```json
   {"fromDate":"2022-01-01T00:00:01.000Z","createdDate":"2022-06-29T17:50:46.824Z","toDate":"2022-01-05T23:59:59.000Z","message":"A new data export file for this date range and type will be created. Please come back later.","type":"PAGE","status":"PENDING"}%   
   ```

   가져오는 데이터의 크기에 따라 요청 처리를 완료하는 데 약간의 시간(즉, 몇 분에서 몇 시간)이 걸릴 수 있습니다.

1. 동일한 명령을 다시 실행하면 터미널 창에 데이터가 반환됩니다. 요청이 아직 처리 중인 경우 `"status":"RUNNING"` 메시지가 나타납니다. 나중에 다시 확인하십시오.

   데이터를 JSON 파일로 다운로드하려면 요청 끝에 `>> [filename.json]` 추가하십시오. 예를 들어:

   ```
   curl -i -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" -L http://analytics.liferay.com/api/reports/export/page?fromDate=2022-01-01'T'00:00:01.000'Z'&toDate=2022-01-05'T'23:59:59.000'Z' >> page-data.json
   ```

   요청은 한 번에 하나씩 처리됩니다. 첫 번째 요청이 아직 실행 중인 동안 두 번째 요청이 이루어지면 첫 번째 요청 처리가 완료될 때까지 `"status":"PENDING"` 메시지가 표시됩니다.

   요청한 데이터는 24시간 동안 다운로드할 수 있습니다. 이후 동일한 요청이 있을 경우 새로운 요청으로 처리됩니다.
