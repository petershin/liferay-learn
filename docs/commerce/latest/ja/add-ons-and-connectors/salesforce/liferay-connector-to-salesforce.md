# LiferayのSalesforceへのコネクタ

{bdg-primary}`サブスクリプション`

{bdg-secondary}`利用可能な Liferay DXP 7.4 U35+`

Liferay Connector to Salesforceは、 [Talend](https://help.talend.com/home) ジョブデザインとLiferayの [ジョブスケジューラーを使う](https://learn.liferay.com/dxp/latest/ja/building-applications/core-frameworks/job-scheduler-framework/using-job-scheduler.html) を使用して、SalesforceからLiferay DXPにデータをインポートします。 [ダウンロード](https://marketplace.liferay.com/p/liferay-connector-to-salesforce) コネクタをダウンロードし、 `.lpkg` ファイルとして Liferay インスタンスにデプロイすることができます。 このファイルには、SalesforceのデータフィールドをLiferayのデータフィールドにマッピングするTalendジョブが含まれています。

デプロイされると、Liferayは自動的にTalendの各ジョブに対してジョブスケジューラタスクを作成します。 その後、各タスクを手動で設定・実行したり、ジョブスケジューラーを使って特定の間隔で実行するようにスケジュールすることができます。

## サポート対象事業者

次の図は、サポートされる Salesforce のエンティティを Liferay の対応するエンティティと共に示しています。 現在、LiferayにインポートできるのはSalesforceのデータのみです。

| Salesforce   | Liferay   |
|:------------ |:--------- |
| アカウント        | アカウント     |
| アカウントアドレス    | アカウント     |
| アカウント連絡先     | ユーザー      |
| プライスブック      | 価格表       |
| プライスブックエントリー | プライスエントリー |
| プロダクト        | プロダクト     |
| 注文           | 注文        |
| 注文項目         | 注文項目      |

```{note}
Liferayの製品カタログに相当するエンティティはSalesforceには存在しません。 Liferay に Salesforce 製品をインポートするには、externalReferenceCode が `SALESFORCE` に設定されたカタログが必要です。 存在しない場合、Liferayは自動的にカタログを作成し、インポートされた製品を保存するためにそれを使用します。
```

## Liferay DXP へのコネクタの展開

1. [Liferay Marketplace](https://marketplace.liferay.com/p/liferay-connector-to-salesforce) からコネクタをダウンロードします。

1. `.lpkg` ファイルを DXP インスタンスの [Liferay Home](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/liferay-home.html) フォルダにコピーします。

1. これらのメッセージがアプリケーションサーバーのコンソールに表示されることを確認します。

   ```log
   Processing Liferay Connector to Salesforce 1.0.0.lpkg
   The portal instance needs to be restarted to complete the installation of file:/Users/able/bundles/osgi/marketplace/Liferay%20Connector%20to%20Salesforce%20-%20Impl.lpkg
   ```

1. Liferay DXP インスタンスを再起動します。

1. 再起動後、 **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **Control Panel** &rarr; **Job Scheduler** に移動して、導入が正常に行われたことを確認します。

   成功すると、4つの新しいジョブ・スケジューラー・タスクが表示されます。

   ![4つの新しいジョブスケジューラタスクの追加を確認します。](./liferay-connector-to-salesforce/images/01.png)

   これらのタスクを実行する前に、それらのコンテキスト・パラメータを設定する必要があります。

## ジョブスケジューラタスクの設定

作成時に、各Talendジョブスケジューラタスクの設定エディタには、デフォルトのコンテキストパラメータが自動的に入力されます。 これらのパラメータを使用して、必要な認証情報を提供し、実行時に各タスクの動作を変更することができます。

```{warning}
セッティングエディターでパラメータを削除する場合は、注意が必要です。 キーの値が空白の場合、設定を保存すると消えます。 Key-Valueペアを紛失すると復元できないので、タスクを作り直す必要があります。
```

### クレデンシャルリファレンス

各タスクには、LiferayとSalesforceの認証情報を入力するためのこれらのフィールドがあります。

| コンテキスト・パラメータ         | 説明                       |
|:-------------------- |:------------------------ |
| `LiferayServerURL`   | LiferayサーバーのURL          |
| `LiferayUser`        | Liferayアカウントのユーザー名       |
| `LiferayPassword`    | Liferayアカウントのパスワード       |
| `SalesForceURL`      | Salesforce SOAP API Url  |
| `SalesForceUser`     | Salesforceアカウントのユーザー名    |
| `SalesForcePassword` | Salesforceアカウントのパスワード    |
| `SalesForceToken`    | Salesforce OAuth APIトークン |

```{note}
Salesforceからのデータをフィルタリングして、新しく変更または作成されたレコードのみをインポートすることができます。 そのためには、ジョブ設定に `deltamins` パラメータを設定する必要があります。 このパラメータは、新規または変更されたレコードのチェックの間隔を分単位で指定します。

例えば、`deltamins = 20` かつ `lastRunDate = 01/12/2022 12:00:00` の場合、`01/12/2022 11:40:00` より後に作成または変更されたレコードのみをSalesforceから取得することができます。 もしレコードが既に存在していれば、Liferayのインポート戦略は必要に応じてそれらを更新し、新しいレコードを挿入するだけです。 
```

### 製品情報参照

| コンテキスト・パラメータ                   | 説明                                                | デフォルト値       |
|:------------------------------ |:------------------------------------------------- |:------------ |
| `catalogName`                  | Salesforceのデータを保存するためのカタログ名                       | `Salesforce` |
| `catalogExternalReferenceCode` | カタログを作成または取得するための外部参照コード。 `SALESFORCE`である必要があります。 | `SALESFORCE` |
| `catalogDefaultCurrency`       | カタログのデフォルトの通貨                                     | `USD`        |
| `catalogDefaultLanguage`       | カタログのデフォルト言語                                      | `en_US`      |
| `catalogId`                    | Salesforceのデータを格納するためのカタログのID                     | 実行時に決定       |
| `allowBackOrder`               | 在庫がなくなったときに、製品がバックオーダーをサポートするかどうかを定義するブール値        | `true`       |
| `displayAvailability`          | 商品の詳細ページで商品の在庫状況を表示するかどうかを定義するブール値                | `false`      |
| `productType`                  | 全商品を作成する際に使用する商品種別                                | `simple`     |
| `freeShipping`                 | 商品が送料無料であるかどうかを示すブール値。                            | `false`      |
| `shippable`                    | 製品を出荷できるかどうかを定義するブール値                             | `true`       |
| `shippingSeparately`           | 商品が別送をサポートしているかどうかを示すブール値                         | `true`       |

### 価格表参照

| コンテキスト・パラメータ    | 説明                               | デフォルト値  |
|:--------------- |:-------------------------------- |:------- |
| `catalogId`     | 価格表と関連付けるカタログのID                 | `0`     |
| `currencyCode`  | 価格表のデフォルトの通貨コード                  | `USD`   |
| `neverExpire`   | 価格表の有効期限を定義するブール値                | `true`  |
| `priority`      | 適用可能な価格表が複数ある場合の優先順位を決定します。      | `0`     |
| `hasTierPrice`  | 価格リストに階層化された価格が含まれるかどうかを定義するブール値 | `false` |
| `standardPrice` | 価格リストに標準価格が含まれているかどうかを定義するブール値   | `false` |

### 決算参考資料

| コンテキスト・パラメータ          | 説明                                                                                                           | デフォルト値 |
|:--------------------- |:------------------------------------------------------------------------------------------------------------ |:------ |
| `accountType`         | すべてのアカウントを作成するときに使用されるアカウントタイプです。1 (個人) または 2 (ビジネス)                                                         | `2`    |
| `countryMapping_null` | アカウントアドレスの国別マッピング。 次の構文を使用する必要があります。 `countryMapping_NAME=COUNTRY_ISO_CODE` (例: `countryMapping_Croatia=HR`) |        |
| `regionMapping_null`  | アカウントアドレスの地域マッピング。 このシンタックスを使用する必要があります。 `regionMapping_NAME=REGION_ISO_CODE` (例: `regionMapping_Milan=MI`)  |        |

### 注文書参照

| コンテキスト・パラメータ                | 説明                                                                                                                                    | デフォルト値                                                                                                                                                                  |
|:--------------------------- |:------------------------------------------------------------------------------------------------------------------------------------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `channelId`                 | 注文をインポートする ID チャンネル                                                                                                                   | UIからチャンネルIDをコピーする。 **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **Commerce** &rarr; **Channels** を表示します。 チャンネルを選択し、名前の横に表示されているIDをコピーしてください。 |
| `defaultCurrency`           | 注文のデフォルト通貨                                                                                                                            | `USD`                                                                                                                                                                   |
| `statusMapping_null`        | 注文ステータスのマッピング。 この構文を使用する必要があります。 `statusMapping_SalesforceStatusName=LiferayStatusCode (例: statusMapping_Activated=5)`。               | `5`                                                                                                                                                                     |
| `paymentStatusMapping_null` | 注文の支払いステータスのマッピング。 この構文を使用する必要があります: `paymentStatusMapping_SalesforceStatusName=LiferayStatusCode (例: paymentStatusMapping_Payed=2)`。 | `2`                                                                                                                                                                     |

```{warning}
一部のデフォルト値はプレースホルダーに過ぎない。 これらの値でジョブを実行すると、失敗する可能性があります。 インポートを成功させるために、すべての値を確認してください。
```

## ジョブスケジューラタスクの実行

一度設定すれば、 **Run Now** をクリックして各タスクを手動で実行したり、自動的に実行されるようにスケジュールを組むことができます。 詳しくは、「 [ジョブスケジューラーを使う](https://learn.liferay.com/dxp/latest/ja/building-applications/core-frameworks/job-scheduler-framework/using-job-scheduler.html) を参照してください。

```{important}
これらのタスクを実行すると、リソースを大量に消費し、プラットフォームのパフォーマンスを低下させる可能性があります。 パフォーマンスへの影響を軽減するため、使用頻度の高い時間帯での実行は避けてください。
```

## 関連トピック

* [Liferayマーケットプレイス](https://marketplace.liferay.com/p/liferay-connector-to-salesforce)
* [ジョブスケジューラーを使う](https://learn.liferay.com/dxp/latest/ja/building-applications/core-frameworks/job-scheduler-framework/using-job-scheduler.html)
