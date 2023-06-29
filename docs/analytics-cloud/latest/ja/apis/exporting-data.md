# データのエクスポート

[サイトダッシュボード](../touchpoints/sites-dashboard.md)と[個人ダッシュボード](../people/individuals/individuals-dashboard.md)から様々なアナリティクスデータにアクセスできます。 また、Analytics CloudのAPIを利用して、アナリティクスデータの取得やエクスポートを行うことができます。 具体的には、イベントデータ、個別データ、セグメントデータ、ページデータのいずれかを取得することができます。

## データのエクスポートをリクエストする

1. ワークスペースのアクセストークンをメモします。 アクセストークンを生成または取得するには、 [認証](authentication.md) を参照してください。

1. データリクエストは次のような形式をとります。

   ```
   curl -i -L -H "Authorization: Bearer [token]" -L https://analytics.liferay.com/api/reports/export/[type]?fromDate=[ISO 8601 date and time]&toDate=[ISO 8601 date and time]
   ```

   `[token]`を特定のアクセストークンに置き換えてください。 `[type]` を `event`, `individual`, `page`, or `segment`に置き換える。 `fromDate=`の後に`[ISO 8601 date and time]`を置き換えることで、開始日時を指定します。 `toDate=`の後に`[ISO 8601 date and time]`を置き換えることで、終了日時を指定することができます。 必ず、 [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) の日時フォーマットを使用してください。 なお、リクエストには開始日時、終了日時が必要です。

   例えば、ページデータのリクエストは次のようなものです。

   ```
   curl -i -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" -L http://analytics.liferay.com/api/reports/export/page?fromDate=2022-01-01'T'00:00:01.000'Z'&toDate=2022-01-05'T'23:59:59.000'Z'
   ```

1. データを要求すると、次のようなメッセージが表示されます。

   ```json
   {"fromDate":"2022-01-01T00:00:01.000Z","createdDate":"2022-06-29T17:50:46.824Z","toDate":"2022-01-05T23:59:59.000Z","message":"A new data export file for this date range and type will be created. Please come back later.","type":"PAGE","status":"PENDING"}%   
   ```

   取得するデータのサイズによっては、リクエストの処理が完了するまでに数分から数時間かかる場合があります。

1. もう一度同じコマンドを実行すると、ターミナルウィンドウにデータが返されます。 なお、リクエストがまだ処理中の場合は、 `"status": "RUNNING"` というメッセージが表示されます。 後でもう一度確認してください。

   データをJSONファイルとしてダウンロードする場合は、リクエストの最後に `>> [filename.json]` を追加してください。 以下に例を示します。

   ```
   curl -i -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" -L http://analytics.liferay.com/api/reports/export/page?fromDate=2022-01-01'T'00:00:01.000'Z'&toDate=2022-01-05'T'23:59:59.000'Z' >> page-data.json
   ```

   リクエストは1つずつ処理されます。 最初のリクエストの実行中に2番目のリクエストが行われた場合、最初のリクエストの処理が終了するまで、 `"status": "PENDING"` というメッセージが表示されます。

   リクエストされたデータは、24時間ダウンロード可能です。 それ以降に同じリクエストがあった場合は、新たなリクエストとして処理されます。
