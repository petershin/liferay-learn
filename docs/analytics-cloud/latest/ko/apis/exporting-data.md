# 데이터 내보내기

다양한 분석 데이터는 [사이트 대시보드](../touchpoints/sites-dashboard.md) 및 [개인 대시보드](../people/individuals/individuals-dashboard.md)를 통해 액세스할 수 있습니다. 애널리틱스 클라우드의 API를 사용하여 애널리틱스 데이터를 가져오고 내보낼 수도 있습니다. 구체적으로 이벤트 데이터, 신원 데이터, 개인 데이터, 멤버십 데이터, 페이지 데이터 또는 세그먼트 데이터를 가져올 수 있습니다.

## 데이터 내보내기 요청

1. 워크스페이스의 액세스 토큰을 기록해 두세요. 액세스 토큰을 생성하거나 받으려면 [인증](authentication.md) 을 참조하세요.

1. 데이터 요청은 다음과 같은 형식을 취합니다:

   ```
   curl -i -L -H "Authorization: Bearer [token]" https://analytics.liferay.com/api/reports/export/[type]?fromDate=[ISO 8601 date and time]&toDate=[ISO 8601 date and time]
   ```

   `[token]` 을 특정 액세스 토큰으로 바꿉니다. `[type]` 를 `이벤트`, `신원`, `개인`, `멤버십`, `페이지`또는 `세그먼트`로 대체합니다. `[ISO 8601 날짜 및 시간]` 을 `fromDate=`으로 대체하여 시작 날짜와 시간을 입력합니다. `[ISO 8601 날짜 및 시간]` 을 `toDate=`으로 대체하여 종료 날짜 및 시간을 입력합니다. [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) 날짜 및 시간 형식을 사용해야 합니다. 요청에 시작 날짜와 시간, 종료 날짜와 시간을 입력해야 한다는 점에 유의하세요.

   예를 들어 페이지 데이터 요청은 다음과 같이 보일 수 있습니다:

   ```
   curl -i -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" https://analytics.liferay.com/api/reports/export/page\?fromDate=2023-01-01'T'00:00:01.000'Z'\&toDate\=2023-03-01'T'23:59:59.000'Z'
   ```

1. 데이터를 요청하면 다음과 같은 메시지가 표시됩니다:

   ```json
   {"fromDate":"2022-01-01T00:00:01.000Z","createdDate":"2022-06-29T17:50:46.824Z","toDate":"2022-01-05T23:59:59.000Z","message":"A new data export file for this date range and type will be created. Please come back later.","type":"PAGE","status":"PENDING"}%   
   ```

   가져오는 데이터의 크기에 따라 요청 처리를 완료하는 데 몇 분에서 몇 시간까지 시간이 걸릴 수 있습니다.

1. 다운로드가 준비되면 내보내기 파일을 다운로드합니다. 요청이 아직 처리 중인 경우 `"나중에 다시 오세요.","status":"보류 중"` 메시지가 표시됩니다.

   `--output` 매개변수를 사용하여 ZIP 파일을 다운로드합니다. 예를 들어

   ```
   curl -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" https://analytics.liferay.com/api/reports/export/page\?fromDate=2023-01-01'T'00:00:01.000'Z'\&toDate\=2023-03-01'T'23:59:59.000'Z' --output foo.zip
   ```

   ZIP 파일을 다운로드할 때 `-i` include 매개변수를 사용하지 마세요.

   요청은 한 번에 하나씩 처리됩니다. 첫 번째 요청이 아직 실행 중일 때 두 번째 요청을 하면 첫 번째 요청 처리가 완료될 때까지 `"상태":"보류 중"` 메시지가 표시됩니다.

   요청된 데이터는 24시간 동안 다운로드할 수 있습니다. 그 이후에도 동일한 요청을 하면 새로운 요청으로 처리됩니다.
