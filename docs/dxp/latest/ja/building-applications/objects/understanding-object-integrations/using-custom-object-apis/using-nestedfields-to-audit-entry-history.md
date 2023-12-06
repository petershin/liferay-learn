# `nestedFields` を使った入力履歴の監査

{bdg-secondary}`Liferay 7.4 U72+/GA72+`

[オブジェクト定義でエントリ履歴](../../creating-and-managing-objects/auditing-object-events.md#enabling-entry-history) を有効にすると、 `nestedFields` パラメータを REST API で使用して、エントリイベントを監査できます。 GET リクエストのパスに `nestedFields=auditEvents` を追加する（例： `http://localhost:8080/o/c/tickets/?nestedFields=auditEvents`）。

始めるには、 [セットアップ](#setting-up-a-liferay-instance) 新しい Liferay 7.4 インスタンスをセットアップし、 [](#preparing-the-sample-code) 提供されたチュートリアルコードを準備します。 次に、 [スクリプト](#using-the-sample-code) を実行してエントリを作成し、更新し、 `nestedFields` パラメータを使用して変更内容を照会する。

```{important}
REST APIを使用してエントリーの履歴を表示するには、そのエントリーの `View` と `Object Entry History` の両方のパーミッションが必要です。 [パーミッションフレームワークの統合](../../understanding-object-integrations/permissions-framework-integration.md) を参照してください。
```

## Liferayインスタンスのセットアップ

```{include} /_snippets/run-liferay-portal.md
```

次に、Liferayの永続的な監査メッセージプロセッサを有効にします。次にオブジェクト定義を作成し、公開します。

### 永続監査メッセージプロセッサを有効にする

1. グローバルメニュー ( [**グローバルメニュー](../../../../../images/icon-applications-menu.png) ) &rarr;** コントロールパネル **タブ、&rarr;** システム設定* を開きます。

1. セキュリティ]で[監査]をクリックし、[永続メッセージ監査メッセージプロセッサ]タブに進みます。

1. 有効]をチェックします。

1. 保存]をクリックします。

   [永続メッセージ監査メッセージ・プロセッサ]タブに移動し、[有効]にチェックマークを付けます。

### オブジェクト定義の作成

1. ![グローバル・メニュー](../../../../images/icon-applications-menu.png))を開き、 [コントロール・パネル](**Control Panel**) タブに移動し、 [オブジェクト](**Objects**) をクリックします。

1. 1.オブジェクトのドラフトを [作成](../../creating-and-managing-objects/creating-objects.md#creating-object-drafts) します。

   | フィールド | 值 |
   | :--- | :--- |
   | ラベル | `Able` |
   | 複数形のラベル | `Ables` |
   | 名前 | `Able` |

1. このフィールドをドラフトに追加する。

   | ラベル | フィールド名 | タイプ | 必須 |
   | :--- | :--- | :--- | :--- |
   | `名前` | `名前` | テキスト | &#10004; |

1. Detailsタブで、 **Enable Entry History** をトグルする。

1. オブジェクトを [Publish](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) します。

公開されると、Headless API を使ってオブジェクトにアクセスできるようになります。

## サンプルコードの準備

サンプルコードをダウンロードして解凍します：

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/using-apis/liferay-g4m3.zip -O
```

```bash
unzip liferay-g4m3.zip
```

サンプル・コードには、オブジェクト・エントリーを作成、更新、照会するためのシェル・スクリプトが含まれています。

```{tip}
サイトオブジェクトと会社オブジェクトに対して生成されるAPIの完全なリストについては、[オブジェクトのヘッドレスフレームワークの統合](../../understanding-object-integrations/using-custom-object-apis.md)を参照してください。 カスタムオブジェクトAPIは、LiferayAPIエクスプローラーを通して`[server]:[port]/o/api` （例：`localhost:8080/o/api`）で表示およびテストできます。 *RESTアプリケーション*をクリックし、APIを選択します。
```

## サンプルコードを使用する

1. `liferay-g4m3` プロジェクトの `curl` フォルダーに移動します。

   ```bash
   cd liferay-g4m3/curl
   ```

1. `Able_POST_ToCompany` を実行して、3つの `Able` エントリーを作成する。

   ```bash
   ./Able_POST_ToCompany.sh
   ```

   ```json
   {
     ...
     "externalReferenceCode" : "able-one",
     "id" : 47512,
     ...
     "name" : "Able 1 - Foo"
   }

   {
     ...
     "externalReferenceCode" : "able-two",
     "id" : 47514,
     ...
     "name" : "Able 2 - Foo"
   }

   {
     ...
     "externalReferenceCode" : "able-three",
     "id" : 47516,
     ...
     "name" : "Able 3 - Foo"
   }
   ```

1. `Able_PATCH_ByExternalReferenceCode` を `able-one` ERC で実行する。

   ```bash
   ./Able_PATCH_ByExternalReferenceCode.sh able-one
   ```

   これにより、エントリーの名前フィールドが2回更新される。

   ```json
   {
     ...
     "externalReferenceCode" : "able-one",
     "id" : 47512,
     ...
     "name" : "Able 1 - Bar"
   }

   {
     ...
     "externalReferenceCode" : "able-one",
     "id" : 47512,
     ...
     "name" : "Able 1 - Goo"
   }
   ```

1. `Able_GET_ByExternalReferenceCode` を `able-one` ERC で実行する。

   ```bash
   ./Able_GET_ByExternalReferenceCode.sh able-one
   ```

   これは、 `able-one` エントリーと、 `auditEvents` 配列、つまりエントリーのイベントの履歴を返す。

   ```json
   {
     ...
     "auditEvents" : [ {
       "auditFieldChanges" : [ {
         "name" : "name",
         "newValue" : "Able 1 - Goo",
         "oldValue" : "Able 1 - Bar"
       } ],
       "dateCreated" : "2023-05-04T05:44:41Z",
       "eventType" : "UPDATE"
     }, {
       "auditFieldChanges" : [ {
         "name" : "name",
         "newValue" : "Able 1 - Bar",
         "oldValue" : "Able 1 - Foo"
       } ],
       "dateCreated" : "2023-05-04T05:44:40Z",
       "eventType" : "UPDATE"
     }, {
       "auditFieldChanges" : [ {
         "name" : "name",
         "newValue" : "Able 1 - Foo"
       } ],
       "dateCreated" : "2023-05-04T05:44:37Z",
       "eventType" : "ADD"
     } ],
     ...
     "externalReferenceCode" : "able-one",
     "id" : 47512,
     ...
     "name" : "Able 1 - Goo"
   }
   ```

   `auditEvents` 配列はこれらの要素を含む：

   * `auditFieldChanges`: 更新されたフィールドとその新旧値。
   * `dateCreated`: イベントの日時。
   * `eventType`: イベントタイプ(例: `ADD`, `UPDATE`, `DELETE`)。

1. `Ables_GET_FromCompany`を実行します。

   ```bash
   ./Ables_GET_FromCompany.sh able-one
   ```

   これは、すべてのエイブル・エントリーを、そのイベントの監査とともに、最新のイベントから順に返す。

   ```json
   {
     ...
     "items" : [ {
       ...
       "auditEvents" : [ {
         "auditFieldChanges" : [ {
           "name" : "name",
           "newValue" : "Able 2 - Foo"
         } ],
         "dateCreated" : "2023-05-04T06:15:50Z",
         "eventType" : "ADD"
       } ],
       ...
       "externalReferenceCode" : "able-two",
       "id" : 47514,
       ...
       "name" : "Able 2 - Foo"
     }, {
       ...
       "auditEvents" : [ {
         "auditFieldChanges" : [ {
           "name" : "name",
           "newValue" : "Able 3 - Foo"
         } ],
         "dateCreated" : "2023-05-04T06:15:51Z",
         "eventType" : "ADD"
       } ],
       ...
       "externalReferenceCode" : "able-three",
       "id" : 47516,
       ...
       "name" : "Able 3 - Foo"
     }, {
       ...
       "auditEvents" : [ {
         "auditFieldChanges" : [ {
           "name" : "name",
           "newValue" : "Able 1 - Goo",
           "oldValue" : "Able 1 - Bar"
         } ],
         "dateCreated" : "2023-05-04T06:16:25Z",
         "eventType" : "UPDATE"
       }, {
         "auditFieldChanges" : [ {
           "name" : "name",
           "newValue" : "Able 1 - Bar",
           "oldValue" : "Able 1 - Foo"
         } ],
         "dateCreated" : "2023-05-04T06:16:24Z",
         "eventType" : "UPDATE"
       }, {
         "auditFieldChanges" : [ {
           "name" : "name",
           "newValue" : "Able 1 - Foo"
         } ],
         "dateCreated" : "2023-05-04T06:15:49Z",
         "eventType" : "ADD"
       } ],
       ...
       "externalReferenceCode" : "able-one",
       "id" : 47512,
       ...
       "name" : "Able 1 - Goo"
     } ],
     "lastPage" : 1,
     "page" : 1,
     "pageSize" : 20,
     "totalCount" : 3
   }
   ```

## GETリクエストを調べる

これらのGETリクエストは、 `nestedFields=auditEvents` パラメータをURLに含む。

### `Able_GET_ByExternalReferenceCode`

```{literalinclude} ./using-nestedfields-to-audit-entry-history/resources/liferay-g4m3.zip/curl/Able_GET_ByExternalReferenceCode.sh
   :language: bash
```

### `Ables_GET_FromCompany`

```{literalinclude} ./using-nestedfields-to-audit-entry-history/resources/liferay-g4m3.zip/curl/Ables_GET_FromCompany.sh
   :language: bash
```

## 関連トピック

* [オブジェクト定義イベントの監査](../../creating-and-managing-objects/auditing-object-events.md)
* [`nestedFields` を使って関連するエントリーをクエリーする。](./using-nestedfields-to-query-related-entries.md)
