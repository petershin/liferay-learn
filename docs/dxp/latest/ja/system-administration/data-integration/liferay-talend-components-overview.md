# Liferay Talendコンポーネントの概要

{bdg-warning}`非対応`

データ統合ジョブにTalend Open Studioを使用している場合、LiferayのTalend Componentsは、Liferay/DXP Portalと他の外部システム（例：MySQL、SAP、Salesforce）との間でデータのインポート/エクスポートを簡単に行うことができるようにします。 7.4.xでは、これらのコンポーネントは [Liferay DXP/Portalコードベース](https://github.com/liferay/liferay-portal/tree/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend) の一部であり、Talend Open Studioにビルドして追加する必要があります。 追加すると、これらのコンポーネントを使用して、Liferayに接続し、他のTalendコンポーネントとともにETL処理を実行するTalend [Jobs](https://help.talend.com/r/lqV2ftgSbYSEBU9Bwsd61w/eAVXNKXfys1ji9dujoRfrg) を設計することができます。

LiferayのTalendコンポーネントは、すぐに使えるHeadless APIと、REST Builderを使って開発したカスタムAPIの両方に接続することができます。 すべてのコンポーネントは、定義されたヘッドレスAPIエンドポイントを必要とします。 各エンドポイントのパスは、 `/headless-` で始まり（例：`/headless-delivery-api`）、適切なバージョンのサブパス（例：`/headless-commerce-admin-catalog/v1.0`, `/headless-commerce-delivery-catalog/v1.0`）を含む必要があります。

## Liferay Talend コンポーネント

**Liferay Connection Component**( [`tLiferayConnection`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferayconnection/TLiferayConnectionDefinition.java) ):他のコンポーネントが使用する Liferay DXP/Portal インスタンスとの接続を確立します。 そのLiferay Host URLの値はルートドメインに設定されるべきです（例： `http://localhost:8080`, `https://yourserver.com`）。

**Liferay Input Component**( [`tLiferayInput`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferayinput/TLiferayInputDefinition.java) ):設定された Headless API エンドポイントに GET リクエストを送信します。 そして、データを取得し、OpenAPI仕様で記述されたスキーマに変換し、定義されたTalendのデータフローで前方に渡します。

**Liferay Output Component**( [`tLiferayOutput`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferayoutput/TLiferayOutputDefinition.java) ):定義されたTalend入力からデータを受け取り、OpenAPI仕様で記述されたスキーマに変換し、設定されたHeadless APIエンドポイントにPOST/PUTリクエストを送信します。

**Liferay Batch File**( [`tLiferayBatchFile`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferaybatchfile/TLiferayBatchFileDefinition.java) ):データを受信し、OpenAPI 仕様で記述されたスキーマに従ってフォーマットします。 そして、このデータをJSONファイルに集計する。

**Liferay Batch Output File**( [`tLiferayBatchOutput`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferaybatchoutput/TLiferayBatchOutputDefinition.java) ):定義された headless-batch-engine のエンドポイントに JSON ファイルを提出します。 `tLiferayBatchFile` コンポーネントからこのファイルを受け取ることができますが、異なるコンポーネントからバッチファイルを受け取り、送信することもできます。

これらのコンポーネントを使用すると、Talend Open Studioで複雑なデータフロー管理プロセスを作成し、実行することができます。 詳しいインストール方法は、 [Liferay Talend Componentsのインストール](./installing-liferay-talend-components.md) を参照してください。

## 関連トピック

* [Liferay Talendコンポーネントのインストール](./installing-liferay-talend-components.md)
* [Liferay Talendコンポーネントを使用したTalendジョブの設計](./designing-talend-jobs-using-liferay-talend-components.md)
