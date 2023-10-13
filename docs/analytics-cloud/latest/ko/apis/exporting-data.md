# 데이터 내보내기

다양한 분석 데이터는 [사이트 대시보드](../touchpoints/sites-dashboard.md) 과 [개인 대시보드](../people/individuals/individuals-dashboard.md)을 통해 접근할 수 있습니다. Analytics Cloud의 API를 사용하여 Analytics 데이터를 가져오고 내보낼 수도 있습니다. 구체적으로 이벤트 데이터, ID 데이터, 개인 데이터, 멤버십 데이터, 페이지 데이터 또는 세그먼트 데이터를 가져올 수 있습니다.

## 데이터 내보내기 요청

1. 작업공간의 액세스 토큰을 기록해 두세요. 액세스 토큰을 생성하거나 얻으려면 [인증](authentication.md) 참조하세요.

1. 데이터 요청은 다음 형식을 사용합니다.

   ```
   curl -i -L -H "Authorization: Bearer [token]" https://analytics.liferay.com/api/reports/export/[type]?fromDate=[ISO 8601 date and time]&toDate=[ISO 8601 date and time]
   ```

   `[token]`을 특정 액세스 토큰으로 바꾸세요. `[type]`을 `event`, `identity`, `individual`, `membership`, `page` 또는 `segment`로 바꾸세요. `fromDate=` 뒤의 `[ISO 8601 date and time]`을 바꿔서 시작 날짜와 시간을 제공합니다. `toDate=` 뒤의 `[ISO 8601 date and time]`을 교체하여 종료 날짜와 시간을 제공합니다. [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) 날짜 및 시간 형식을 사용해야 합니다. 요청에는 시작 날짜 및 시간과 종료 날짜 및 시간이 필요합니다.

   예를 들어 페이지 데이터에 대한 요청은 다음과 같습니다.

   ```
   curl -i -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" https://analytics.liferay.com/api/reports/export/page\?fromDate=2023-01-01'T'00:00:01.000'Z'\&toDate\=2023-03-01'T'23:59:59.000'Z'
   ```

   Windows 사용자의 경우:

   ```
   curl -i -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" "https://analytics.liferay.com/api/reports/export/page?fromDate=2023-01-01T00:00:01.000Z&toDate=2023-03-01T23:59:59.000Z"
   ```

1. 데이터를 요청하면 다음과 같은 메시지가 나타납니다.

   ```json
   {"fromDate":"2022-01-01T00:00:01.000Z","createdDate":"2022-06-29T17:50:46.824Z","toDate":"2022-01-05T23:59:59.000Z","message":"A new data export file for this date range and type will be created. Please come back later.","type":"PAGE","status":"PENDING"}%   
   ```

   가져오는 데이터의 크기에 따라 요청 처리가 완료되는 데 약간의 시간(예: 몇 분에서 몇 시간)이 걸릴 수 있습니다.

1. 다운로드가 준비되면 내보내기 파일을 다운로드합니다. 요청이 아직 처리 중인 경우 `"나중에 다시 오십시오.","status":"PENDING"` 메시지가 나타납니다.

   `--output` 매개변수를 사용하여 ZIP 파일을 다운로드합니다. 예를 들어:

   ```
   curl -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" https://analytics.liferay.com/api/reports/export/page\?fromDate=2023-01-01'T'00:00:01.000'Z'\&toDate\=2023-03-01'T'23:59:59.000'Z' --output foo.zip
   ```

   Windows 사용자의 경우:

   ```
   curl -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" "https://analytics.liferay.com/api/reports/export/page?fromDate=2023-01-01T00:00:01.000Z&toDate=2023-03-01T23:59:59.000Z" --output foo.zip
   ```

   ZIP 파일을 다운로드할 때 `-i` 포함 매개변수를 사용하지 마십시오.

   요청은 한 번에 하나씩 처리됩니다. 첫 번째 요청이 실행 중인 동안 두 번째 요청이 이루어지면 첫 번째 요청 처리가 완료될 때까지 `"status":"PENDING"` 메시지가 표시됩니다.

   요청한 데이터는 24시간 동안 다운로드할 수 있습니다. 그 이후에도 동일한 요청이 들어오면 새로운 요청으로 처리됩니다.

```{note}
다운로드한 JSON 파일의 데이터는 [JSON Lines](https://jsonlines.org) 형식을 사용합니다. 여기서 각 줄은 유효한 JSON 개체입니다. 이는 구문 분석 및 읽기가 쉽고 [Jackson](https://github.com/FasterXML/jackson) 과 같은 다양한 라이브러리에서 지원되는 유연한 형식을 제공합니다.
```
