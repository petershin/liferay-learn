---
taxonomy-category-names:
- Cloud
- Analytics Cloud Administration
- Liferay Self-Hosted
- Liferay SaaS
- Liferay PaaS
uuid: 0ae4dfb4-7b8b-4658-a573-cd97a9a039a3
---
# Exporting Data

Various analytics data can be accessed through the [Sites dashboard](../touchpoints/sites-dashboard.md) and the [Individuals dashboard](../people/individuals.md). Analytics data can also be fetched and exported using Analytics Cloud's APIs. Specifically, you can fetch event data, identity data, individual data, membership data, page data, or segment data.

## Requesting a Data Export

1. Take note of your workspace's access token. See [Authentication](authentication.md) to generate or get an access token.

1. The data request takes the following format:

   ```
   curl -i -L -H "Authorization: Bearer [token]" https://analytics.liferay.com/api/reports/export/[type]?fromDate=[ISO 8601 date and time]&toDate=[ISO 8601 date and time]
   ```

   Replace `[token]` with your specific access token. Replace `[type]` with `event`, `identity`, `individual`, `membership`, `page`, or `segment`. Give a start date and time by replacing `[ISO 8601 date and time]` after `fromDate=`. Give an end date and time by replacing `[ISO 8601 date and time]` after `toDate=`. Make sure to use the [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time format. Note that the start date and time and end date and time are required in the request.

   For example, a request for page data might look like this:

   ```
   curl -i -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" https://analytics.liferay.com/api/reports/export/page\?fromDate=2023-01-01'T'00:00:01.000'Z'\&toDate\=2023-03-01'T'23:59:59.000'Z'
   ```

   For Windows users:

   ```
   curl -i -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" "https://analytics.liferay.com/api/reports/export/page?fromDate=2023-01-01T00:00:01.000Z&toDate=2023-03-01T23:59:59.000Z"
   ```

1. After requesting the data, a message like this appears:

   ```json
   {"fromDate":"2022-01-01T00:00:01.000Z","createdDate":"2022-06-29T17:50:46.824Z","toDate":"2022-01-05T23:59:59.000Z","message":"A new data export file for this date range and type will be created. Please come back later.","type":"PAGE","status":"PENDING"}%   
   ```

   It may take some time (i.e. a few minutes to a few hours) for the request to finish processing depending on the size of the data being fetched.

1. When the download is ready, download the export file. If the request is still processing, a message with `"Please come back later.","status":"PENDING"` appears.

   Use the `--output` parameter to download the ZIP file. For example:

   ```
   curl -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" https://analytics.liferay.com/api/reports/export/page\?fromDate=2023-01-01'T'00:00:01.000'Z'\&toDate\=2023-03-01'T'23:59:59.000'Z' --output foo.zip
   ```

   For Windows users:

   ```
   curl -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" "https://analytics.liferay.com/api/reports/export/page?fromDate=2023-01-01T00:00:01.000Z&toDate=2023-03-01T23:59:59.000Z" --output foo.zip
   ```

   Note, do not use the `-i` include parameter when downloading the ZIP file.

   Requests are handled one at a time. If a second request is made while the first request is still running, the message `"status":"PENDING"` appears until the first request has finished processing.

   The requested data is made available to download for 24 hours. After that time, if the same request is made, it is processed as a new request.

!!! note
    The data in the downloaded JSON file uses the [JSON Lines](https://jsonlines.org) format, where each line is a valid JSON object. This provides a flexible format that is easy to parse and read, and is supported by various libraries, such as [Jackson](https://github.com/FasterXML/jackson).