# データのエクスポート

様々な分析データは、 [サイトダッシュボード](../touchpoints/sites-dashboard.md) と [個人ダッシュボード](../people/individuals/individuals-dashboard.md)からアクセスすることができます。 Analytics CloudのAPIを利用することで、アナリティクスデータの取得やエクスポートを行うことも可能です。 具体的には、アカウントデータ、個人データ、セグメントデータ、ページデータのいずれかを取得することができます。

## データのエクスポートをリクエストする

1. ワークスペースのアクセストークンをメモしておく。 アクセストークンを生成または取得するには、 [認証](authentication.md) を参照してください。

1. データリクエストは、以下のような形式をとります。

   ```
   curl -H "Authorization:Bearer {token}" -L https://analytics.liferay.com/api/reports/export/{type}?fromDate={ISO 8601 date and time}&toDate={ISO 8601 date and time}
   ```

   `{token}` を特定のアクセストークンに置き換えてください。 `{type}` を **アカウント** , **個人** , **ページ** , または **セグメント** のいずれかに置き換えてください。 `fromDate=`の後に `{ISO 8601 date and time}` を置き換えることで、開始日時を指定します。 `の後の <code>{ISO 8601 date and time}` を toDate=</code>に置き換えて、終了日時を指定します。 [必ず、ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) の日付と時刻のフォーマットを使用してください。 なお、リクエストには開始日時、終了日時が必要です。

   例えば、ページデータのリクエストは次のようなものです。

   ```
   curl -H "Authorization:Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" -L http://analytics.liferay.com/api/reports/export/page?fromDate=2022-01-01'T'00:00:01.000'Z'&toDate=2022-01-05'T'23:59:59.000'Z'
   ```

1. データを要求すると、次のようなメッセージが表示されます。

   ```json
   {"fromDate": "2022-01-01T00:00:01.000Z", "createdDate": "2022-06-29T17:50:46.824Z", "toDate": "2022-01-05T23:59:59.000Z", "message": "A new data export file for this date range and type will be created.", "指定された日付範囲とタイプのデータエクスポートファイルが作成されます。 また後ほどお越しください。", "type": "PAGE", "status": "PENDING"}%。   
   ```

   取得するデータのサイズによっては、リクエストの処理が完了するまでに数分～数時間かかる場合があります。

1. もう一度同じコマンドを実行すると、ターミナルウィンドウにデータが返されます。 なお、リクエストがまだ処理中の場合は、 `"status": "RUNNING"` というメッセージが表示され、後でもう一度確認するように指示されます。

   データをJSONファイルとしてダウンロードする場合は、リクエストの最後に `>> {filename.json}` を追加してください。 たとえば、

   ```
   curl -H "Authorization:Bearer 100dnsjvw78q2p3a5zsxxa61a0x7o8wtfx8z39z8gm2fvdq5lp7dfen" -L http://analytics.liferay.com/api/reports/export/page?fromDate=2022-01-01'T'00:00:01.000'Z'&toDate=2022-01-05'T'23:59:59.000'Z' >> page-data.json
   ```

   リクエストは1つずつ処理されます。 最初のリクエストの実行中に2番目のリクエストが行われた場合、最初のリクエストの処理が終了するまで、 `"status": "PENDING"` というメッセージが表示されます。

   リクエストされたデータは、24時間ダウンロード可能です。 それ以降、同じリクエストがあった場合は、新しいリクエストとして処理されます。