# SalesforceへのLiferayコネクタ

{bdg-primary}`サブスクリプション`

{bdg-secondary}`Liferay DXP 7.4 U35+`.

Liferay Connector to Salesforceは、 [Talend](https://help.talend.com/home) ジョブデザインとLiferayの [ジョブスケジューラーを使う](https://learn.liferay.com/w/dxp/building-applications/core-frameworks/job-scheduler-framework/using-job-scheduler) を使用して、SalesforceからLiferay DXPにデータをインポートします。 [](https://marketplace.liferay.com/p/liferay-connector-to-salesforce) コネクタをダウンロードして `.lpkg` ファイルとして Liferay インスタンスにデプロイすることができます。 このファイルには、SalesforceのデータフィールドをLiferayのデータフィールドにマッピングするTalendジョブが含まれています。

デプロイされると、Liferayは自動的にTalendの各ジョブに対してディスパッチタスクを作成します。 その後、各タスクを手動で設定・実行したり、ディスパッチを使って特定の間隔で実行するようにスケジュールすることができます。

## サポート対象エンティティ

以下の表は、サポートされるSalesforceのエンティティと対応するLiferayのエンティティを示しています。 現在、LiferayにインポートできるのはSalesforceのデータのみです。

| Salesforce | Liferay     |
| :--------- | :---------- |
| アカウント      | アカウント       |
| アカウントアドレス  | アカウント       |
| アカウント連絡先   | ユーザー        |
| 価格表        | コマース価格表     |
| 価格表エントリー   | コマース価格エントリー |
| プロダクト      | プロダクト       |
| 注文         | 注文          |
| OrderItem  | コマースの注文商品   |

```{note}
Liferayの製品カタログに相当するエンティティはSalesforceには存在しません。 LiferayにSalesforce製品をインポートするには、externalReferenceCodeが`SALESFORCE`に設定されたカタログが必要です。 存在しない場合、Liferayは自動的にカタログを作成し、インポートされた製品を保存するためにそれを使用します。
```

## Liferay DXPへのコネクターのデプロイ

1. [Liferay Marketplace](https://marketplace.liferay.com/p/liferay-connector-to-salesforce) からコネクタをダウンロードしてください。

1. `.lpkg` ファイルを DXP インスタンスの [Liferay Home](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/liferay-home.html) フォルダにコピーします。

1. これらのメッセージがアプリケーションサーバーのコンソールに表示されることを確認します。

   ```log
   Processing Liferay Connector to Salesforce 1.0.0.lpkg
   file:/Users/able/bundles/osgi/marketplace/Liferay%20Connector%20to%20Salesforce%20-%20Impl.lpkg のインストールを完了するには、ポータルインスタンスを再起動する必要があります。
   ```

1. Liferay DXPインスタンスを再起動します。

1. 再起動後、 **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **Control Panel** &rarr; **Job Scheduler** に移動して、展開が正常に行われたことを確認します。

   成功すると、4つの新しいディスパッチタスクが表示されます。

   ![Verify the addition of four new job scheduler tasks.](./liferay-connector-to-salesforce/images/01.png)

   これらのタスクを実行する前に、それらのコンテキストパラメーターを設定する必要があります。

## ディスパッチタスクの設定

作成時に、各Talendディスパッチタスクの設定エディターには、デフォルトのコンテキストパラメーターが自動的に入力されます。 これらのパラメータを使用して、必要な認証情報を提供し、実行時に各タスクの動作を変更することができます。

```{warning}
設定エディターからパラメーターを削除する場合は、注意が必要です。 キーの値が空白の場合、設定を保存すると消えます。 Key-Valueペアを紛失すると復元できないので、タスクを作り直す必要があります。
```

### 認証情報リファレンス

各タスクには、LiferayとSalesforceの認証情報を入力するための次のフィールドがあります。

| コンテキストパラメーター         | 説明                       |
| :------------------- | :----------------------- |
| `LiferayServerURL`   | LiferayサーバーのURL          |
| `LiferayUser`        | Liferayアカウントのユーザー名       |
| `LiferayPassword`    | Liferayアカウントのパスワード       |
| `SalesForceURL`      | Salesforce SOAP API Url  |
| `SalesForceUser`     | Salesforceアカウントのユーザー名    |
| `SalesForcePassword` | Salesforceアカウントのパスワード    |
| `SalesForceToken`    | Salesforce OAuth APIトークン |

```{note}
Salesforceからのデータをフィルタリングして、新しく変更または作成されたレコードのみをインポートすることができます。 そのためには、ジョブ設定に `deltamins` パラメーターを設定する必要があります。 このパラメータは、新規または変更されたレコードのチェックの間隔を分単位で指定します。

例えば、`deltamins = 20` かつ `lastRunDate = 01/12/2022 12:00:00` の場合、`01/12/2022 11:40:00` より後に作成または変更されたレコードのみをSalesforceから取得することができます。 もしレコードが既に存在していれば、Liferayのインポート戦略は必要に応じてそれらを更新し、新しいレコードを挿入するだけです。
```

### 製品リファレンス

| コンテキストパラメーター                   | 説明                                         | デフォルト値       |
| :----------------------------- | :----------------------------------------- | :----------- |
| `catalogName`                  | Salesforceのデータを保存するためのカタログ名                | `Salesforce` |
| `catalogExternalReferenceCode` | `SALESFORCE`でなければならない。                     | `SALESFORCE` |
| `catalogDefaultCurrency`       | カタログのデフォルト通貨                               | `USD`        |
| `catalogDefaultLanguage`       | カタログのデフォルト言語                               | `en_US`      |
| `catalogId`                    | Salesforceのデータを格納するためのカタログID               | 実行時に決定       |
| `allowBackOrder`               | 在庫がなくなったときに、製品がバックオーダーをサポートするかどうかを定義するブール値 | `true`       |
| `displayAvailability`          | 製品詳細ページで製品の在庫状況を表示するかどうかを定義するブール値          | `false`      |
| `productType`                  | すべての製品を作成する際に使用する製品種類                      | `simple`     |
| `freeShipping`                 | 製品が送料無料であるかどうかを示すブール値。                     | `false`      |
| `shippable`                    | 製品を出荷できるかどうかを定義するブール値                      | `true`       |
| `shippingSeparately`           | 商品が別送をサポートしているかどうかを示すブール値                  | `true`       |

### 価格表リファレンス

| コンテキストパラメーター    | 説明                              | デフォルト値  |
| :-------------- | :------------------------------ | :------ |
| `catalogId`     | 価格表と関連付けるカタログのID                | `0`     |
| `currencyCode`  | 価格表のデフォルトの通貨コード                 | `USD`   |
| `neverExpire`   | 価格表の有効期限を定義するブール値               | `true`  |
| `priority`      | 適用可能な価格表が複数ある場合の価格表の優先順位を決定します。 | `0`     |
| `hasTierPrice`  | 価格表に階層化された価格が含まれるかどうかを定義するブール値  | `false` |
| `standardPrice` | 価格表に標準価格が含まれているかどうかを定義するブール値    | `false` |

### アカウントリファレンス

| コンテキストパラメーター          | 説明                                                                                                                                                                                           | デフォルト値 |
| :-------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----- |
| `accountType`         | すべてのアカウントを作成するときに使用されるアカウントタイプ：1 (個人) または 2 (ビジネス)                                                                                                     | `2`    |
| `countryMapping_null` | アカウントアドレスの国別マッピング。 `countryMapping_NAME=COUNTRY_ISO_CODE`（例：`countryMapping_Croatia=HR`）という構文を使う必要があります。 |        |
| `regionMapping_null`  | アカウントアドレスの地域マッピング。 このシンタックス `regionMapping_NAME=REGION_ISO_CODE` を使わなければならない（例：`regionMapping_Milan=MI`）。                                                                                    |        |

### 注文リファレンス

| コンテキストパラメーター                | 説明                                                                                                                                                                                              | デフォルト値                                                                                                                                                                                  |
| :-------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `channelId`                 | 注文をインポートするIDチャンネル                                                                                                                                                                               | UIからチャンネルIDをコピーします。 グローバル・メニュー( ![グローバル・メニュー](../../images/icon-applications-menu.png) )を開き、 **Commerce** &rarr; **Channels** に進みます。 チャンネルを選択し、名前の横に表示されているIDをコピーしてください。 |
| `defaultCurrency`           | 注文のデフォルト通貨                                                                                                                                                                                      | `USD`                                                                                                                                                                                   |
| `statusMapping_null`        | 注文ステータスのステータスマッピング。 この構文を使用する必要があります：`statusMapping_SalesforceStatusName=LiferayStatusCode（例：statusMapping_Activated=5）`」という構文を使用する必要があります。           | `5`                                                                                                                                                                                     |
| `paymentStatusMapping_null` | 注文支払い状況のステータスマッピング。 この構文を使用する必要があります：`paymentStatusMapping_SalesforceStatusName=LiferayStatusCode（例：paymentStatusMapping_Payed=2）`」という構文を使用する必要があります。 | `2`                                                                                                                                                                                     |

```{warning}
一部のデフォルト値はプレースホルダーのみです。 これらの値でジョブを実行すると、失敗する可能性があります。 インポートを成功させるために、すべての値を確認してください。
```

## ディスパッチタスクの実行

一度設定したら、 **今すぐ実行** をクリックして各タスクを手動で実行するか、自動的に実行するようにスケジュールすることができます。 詳細は [ジョブスケジューラーを使う](https://learn.liferay.com/w/dxp/building-applications/core-frameworks/job-scheduler-framework/using-job-scheduler) を参照。

```{important}
これらのタスクを実行すると、リソースを大量に消費し、プラットフォームのパフォーマンスを低下させる可能性があります。 パフォーマンスへの影響を軽減するため、使用頻度の高い時間帯での実行は避けてください。
```

## 関連トピック

* [Liferay マーケットプレイス](https://marketplace.liferay.com/p/liferay-connector-to-salesforce)
* [ジョブスケジューラーを使う](https://learn.liferay.com/w/dxp/building-applications/core-frameworks/job-scheduler-framework/using-job-scheduler)
