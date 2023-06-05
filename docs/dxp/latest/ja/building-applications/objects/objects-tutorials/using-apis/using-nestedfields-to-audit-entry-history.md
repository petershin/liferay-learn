# `nestedFields` を使用して入力履歴を監査する

{bdg-secondary}`利用可能 Liferay 7.4 U72+/GA72+`

[オブジェクト定義に対してエントリ履歴](../../creating-and-managing-objects/auditing-object-definition-events.md#enabling-entry-history) を有効にすると、REST API で `nestedFields` パラメータを使用して、エントリイベントを監査できます。 GET リクエストのパスに `nestedFields=auditEvents` を追加します（例： `http://localhost:8080/o/c/tickets/?nestedFields=auditEvents`）。

始めるには、新しいLiferay 7.4のインスタンスを [セットアップ](#setting-up-a-liferay-instance) して、提供されたチュートリアルコードを [準備](#preparing-the-sample-code) してください。そして、スクリプトを実行し](#using-the-sample-code) 、エントリーを作成、更新し、`nestedFields`パラメータを使用して変更内容を問い合わせます。

```{important}
REST APIを使用してエントリーの履歴を表示するには、そのエントリーの `View` と `Object Entry History` の両方のパーミッションが必要です。 [パーミッションフレームワーク統合](../../understanding-object-integrations/permissions-framework-integration.md) を参照してください。
```

## Liferayインスタンスのセットアップ

```{include} /_snippets/run-liferay-portal.md
```

次に、Liferayのpersistent audit message processorを有効にします。そして、オブジェクト定義を作成し、公開します。

### 永続的な監査メッセージプロセッサを有効にする

1. グローバルメニュー (**![グローバルメニュー](../../../../images/icon-applications-menu.png)) &rarr;** コントロールパネル **タブ、 &rarr; **システム設定** を開きます。

1. セキュリティ]の下にある[監査]をクリックし、[持続的メッセージ監査メッセージプロセッサ]タブに移動します。

1. **Enabled** をチェックします。

1. **Save** をクリックします。

   ![永続的メッセージ監査メッセージプロセッサ]タブを開き、[有効]にチェックを入れます。

### オブジェクト定義の作成

1. [!グローバルメニュー](./../../../../images/icon-applications-menu.png) を開き、[コントロールパネル] タブを開き、[オブジェクト] をクリックします。

1. オブジェクトドラフトを [作成](../../creating-and-managing-objects/creating-objects.md#creating-object-drafts) する。

   | フィールド | バリュー |
   | :--- | :--- |
   | ラベル|`Able`|
   | ラベル 複数形 | `Able` |
   | 名前 | `Able` |

1. このフィールドをドラフトに追加します。

   | ラベル | フィールド名 | タイプ | 必須 |
   | :--- | :--- | :--- | :--- |
   | 名前 | `name` | テキスト | &#10004; |

1. オブジェクトを [Publish](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) します。

公開されると、ヘッドレスAPIでオブジェクトにアクセスできるようになります。

## サンプルコードの準備

サンプルコードをダウンロードし、解凍してください：

```bash
curl https://learn.liferay.com/dxp/latest/en/building-applications/objects/objects-tutorials/using-apis/liferay-g4m3.zip -O
```

```bash
unzip liferay-g4m3.zip
```

サンプルコードには、オブジェクトエントリーの作成、更新、問い合わせのためのシェルスクリプトが含まれています。

```{tip}
サイトオブジェクトとカンパニーオブジェクトに対して生成されるAPIの完全なリストは、[オブジェクトヘッドレスフレームワーク統合](../../understanding-object-integrations/headless-framework-integration.md) を参照してください。 カスタムオブジェクトの API は Liferay API Explorer を介して `[server]:[port]/o/api` (例: `localhost:8080/o/api`) で閲覧、テストすることができます。 *RESTアプリケーション*をクリックし、APIを選択します。
```

## サンプルコードを使用する

1. `liferay-g4m3` プロジェクト内の `curl` フォルダに移動します。 

   ```bash
   cd liferay-g4m3/curl
   ```

1. `Able_POST_ToCompany` を実行し、 `Able` の3つのエントリーを作成します。 

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

これにより、エントリーの名前フィールドが2回更新されます。 

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

これは、 `able-one` エントリーと、 `auditEvents` 配列、つまりエントリーのイベントの履歴を、最新のイベントから始まり、エントリーが作成された時点で終了するように返します。 

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

`auditEvents` 配列には、これらの要素が含まれる：

   * `auditFieldChanges`: 更新されたフィールドで、その新旧の値。
   * `dateCreated`: イベントの開催日時です。
   * `eventType`: イベントタイプ（例： `ADD`, `UPDATE`, `DELETE`）です。

1. `Ables_GET_FromCompany`を実行します。 

   ```bash
   ./Ables_GET_FromCompany.sh able-one
   ```

これは、すべてのAbleエントリーを、最新のイベントから順に、そのイベントの監査とともに返します。 

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

## GETリクエストの検証

これらのGETリクエストには、 `nestedFields=auditEvents` パラメータがURL内に含まれています。

### `Able_GET_ByExternalReferenceCode`

```{literalinclude} ./using-nestedfields-to-audit-entry-history/resources/liferay-g4m3.zip/curl/Able_GET_ByExternalReferenceCode.sh
   :language: bash
```

### `Ables_GET_FromCompany`

```{literalinclude} ./using-nestedfields-to-audit-entry-history/resources/liferay-g4m3.zip/curl/Ables_GET_FromCompany.sh
   :language: bash
```

## 関連トピック

* [オブジェクト定義イベントの監査](../../creating-and-managing-objects/auditing-object-definition-events.md)
* [`nestedFields` を使って、関連するエントリーをクエリする。](./using-nestedfields-to-query-related-entries.md)
