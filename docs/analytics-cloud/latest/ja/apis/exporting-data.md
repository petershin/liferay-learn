# データのエクスポート

[サイトダッシュボード](../touchpoints/sites-dashboard.md)と[個人ダッシュボード](../people/individuals/individuals-dashboard.md)から様々なアナリティクスデータにアクセスできます。 アナリティクス・データは、Analytics CloudのAPIを使用してフェッチおよびエクスポートすることもできます。 具体的には、イベント・データ、IDデータ、個人データ、会員データ、ページ・データ、セグメント・データをフェッチすることができる。

## データのエクスポートをリクエストする

1. ワークスペースのアクセストークンをメモします。 アクセストークンを生成または取得するには、 [認証](authentication.md) を参照してください。

1. データリクエストは次のような形式をとります。

   ```
   curl -i -L -H "Authorization: Bearer [token]" https://analytics.liferay.com/api/reports/export/[type]?fromDate=[ISO 8601 date and time]&toDate=[ISO 8601 date and time]
   ```

   `[token]`を特定のアクセストークンに置き換えてください。 `[type]` を `event`, `identity`, `individual`, `membership`, `page`, または `segment`に置き換える。 `fromDate=`の後に`[ISO 8601 date and time]`を置き換えることで、開始日時を指定します。 `toDate=`の後に`[ISO 8601 date and time]`を置き換えることで、終了日時を指定することができます。 必ず、 [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) の日時フォーマットを使用してください。 なお、リクエストには開始日時、終了日時が必要です。

   例えば、ページデータのリクエストは次のようなものです。

   ```
   curl -i -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" https://analytics.liferay.com/api/reports/export/page\?fromDate=2023-01-01'T'00:00:01.000'Z'\&toDate\=2023-03-01'T'23:59:59.000'Z'
   ```

   Windowsユーザー向け：

   ```
   curl -i -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" "https://analytics.liferay.com/api/reports/export/page?fromDate=2023-01-01T00:00:01.000Z&toDate=2023-03-01T23:59:59.000Z"
   ```

1. データを要求すると、次のようなメッセージが表示されます。

   ```json
   {"fromDate":"2022-01-01T00:00:01.000Z","createdDate":"2022-06-29T17:50:46.824Z","toDate":"2022-01-05T23:59:59.000Z","message":"A new data export file for this date range and type will be created. Please come back later.","type":"PAGE","status":"PENDING"}%   
   ```

   取得するデータのサイズによっては、リクエストの処理が完了するまでに数分から数時間かかる場合があります。

1. ダウンロードの準備ができたら、エクスポートファイルをダウンロードします。 リクエストがまだ処理中の場合、 `"Please come back later.", "status": "PENDING"` のメッセージが表示される。

   ZIP ファイルをダウンロードするには、 `--output` パラメータを使用する。 以下に例を示します。

   ```
   curl -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" https://analytics.liferay.com/api/reports/export/page\?fromDate=2023-01-01'T'00:00:01.000'Z'\&toDate\=2023-03-01'T'23:59:59.000'Z' --output foo.zip
   ```

   Windowsユーザー向け：

   ```
   curl -L -H "Authorization: Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" "https://analytics.liferay.com/api/reports/export/page?fromDate=2023-01-01T00:00:01.000Z&toDate=2023-03-01T23:59:59.000Z" --output foo.zip
   ```

   なお、ZIPファイルをダウンロードする際には、 `-i` includeパラメータは使わないこと。

   リクエストは1つずつ処理されます。 最初のリクエストの実行中に2番目のリクエストが行われた場合、最初のリクエストの処理が終了するまで、 `"status": "PENDING"` というメッセージが表示されます。

   リクエストされたデータは、24時間ダウンロード可能です。 それ以降に同じリクエストがあった場合は、新たなリクエストとして処理されます。

```{note}
ダウンロードされたJSONファイルのデータは [JSON Lines](https://jsonlines.org) 形式を使用し、各行は有効なJSONオブジェクトです。 これは、解析や読み取りが容易な柔軟なフォーマットを提供し、 [Jackson](https://github.com/FasterXML/jackson) などのさまざまなライブラリでサポートされている。
```
