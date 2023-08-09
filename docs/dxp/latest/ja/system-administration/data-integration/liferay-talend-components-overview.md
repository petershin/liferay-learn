# Liferay Talendコンポーネントの概要

{bdg-warning}`未対応`

データ統合ジョブにTalend Open Studioを使用している場合、LiferayのTalendコンポーネントを使用すると、Liferay/DXP Portalと他の外部システム（MySQL、SAP、Salesforceなど）との間でデータを簡単にインポート/エクスポートできます。 $LIFERAY_LEARN_PORTAL_GIT_TAG$]現在、これらのコンポーネントは [Liferay DXP/Portalコードベース](https://github.com/liferay/liferay-portal/tree/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend) の一部であり、ビルドしてTalend Open Studioに追加する必要があります。 追加されると、これらのコンポーネントを使用して、Liferayに接続し、他のTalendコンポーネントと一緒にETL操作を実行するTalend [Jobs](https://help.talend.com/r/lqV2ftgSbYSEBU9Bwsd61w/eAVXNKXfys1ji9dujoRfrg) を設計できます。

LiferayのTalend Componentsは、すぐに使えるHeadless APIにも、REST Builderを使って開発したカスタムAPIにも接続できます。 全てのコンポーネントは定義されたヘッドレス API エンドポイントを必要とします。 各エンドポイントのパスは、 `/headless-` で始まり（例：`/headless-delivery-api`）、適切なバージョンのサブパスを含んでいなければなりません（例：`/headless-commerce-admin-catalog/v1.0`、 `/headless-commerce-delivery-catalog/v1.0`）。

## Liferay Talendコンポーネント

**Liferay Connection Component** ([`tLiferayConnection`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferayconnection/TLiferayConnectionDefinition.java))：他のコンポーネントが使用する Liferay DXP/Portal インスタンスとの接続を確立します。 そのLiferay Host URL値はルートドメインに設定する必要があります（例： `http://localhost:8080`, `https://yourserver.com`）。

**Liferay Input Component** ([`tLiferayInput`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferayinput/TLiferayInputDefinition.java))：設定された Headless API エンドポイントに GET リクエストを送信します。 その後、データを取得し、OpenAPI仕様で記述されたスキーマに変換し、定義されたTalendデータフローに渡します。

**Liferay Output Component** ([`tLiferayOutput`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferayoutput/TLiferayOutputDefinition.java))：定義されたTalend入力からデータを受け取り、OpenAPI仕様で記述されたスキーマに変換し、設定されたHeadless APIエンドポイントにPOST/PUTリクエストを送信します。

**Liferay Batch File** ([`tLiferayBatchFile`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferaybatchfile/TLiferayBatchFileDefinition.java))：データを受け取り、OpenAPI 仕様で記述されたスキーマに従ってフォーマットします。 そして、このデータをJSONファイルに集約する。

**Liferay バッチ出力ファイル** ([`tLiferayBatchOutput`](https://github.com/liferay/liferay-portal/blob/master/modules/etl/talend/talend-definition/src/main/java/com/liferay/talend/tliferaybatchoutput/TLiferayBatchOutputDefinition.java))：定義された headless-batch-engine エンドポイントに JSON ファイルを送信します。 `tLiferayBatchFile` コンポーネントからこのファイルを受け取ることができますが、別のコンポーネントからバッチファイルを受け取って送信することもできます。

これらのコンポーネントを使用すると、Talend Open Studioで複雑なデータフロー管理プロセスを作成して実行できます。 詳細なインストール手順は [Installing Liferay Talend Components](./installing-liferay-talend-components.md) を参照してください。

## 関連トピック

* [Liferay Talendコンポーネントのインストール](./installing-liferay-talend-components.md)
* [Liferay Talendコンポーネントを使用したTalendジョブの設計](./designing-talend-jobs-using-liferay-talend-components.md)
