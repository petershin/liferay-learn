# `nestedFields`を使って入力履歴を監査する

{bdg-secondary}`Liferay 7.4 U72+/GA72+`.

オブジェクト定義に[enable entry history](../../creating-and-managing-objects/auditing-object-events.md#enabling-entry-history)を設定すると、REST APIで `nestedFields` パラメータを使用してエントリーイベントを監査できるようになる。nestedFields=auditEvents`をGETリクエストのパスに追加する（例：`http://localhost:8080/o/c/tickets/?nestedFields=auditEvents`）。

始めるには、 [設定](#setting-up-a-liferay-instance) 新しい Liferay 7.4 インスタンスをセットアップし、 [用意する](#preparing-the-sample-code) 提供されたチュートリアルコードを準備します。 次に、 [スクリプトを実行する。](#using-the-sample-code) でエントリーを作成し、更新し、`nestedFields` パラメーターを使って変更点を問い合わせる。

```{important}
REST APIを使用してエントリーの履歴を表示するには、そのエントリーの `View` と `Object Entry History` の両方のパーミッションが必要です。 [Permissions Framework Integration](../permissions-framework-integration.md) を参照。
```

## Liferayインスタンスのセットアップ

```{include} /_snippets/run-liferay-portal.md
```

次に、Liferayの永続的な監査メッセージプロセッサを有効にします。 次に、オブジェクト定義を作成し、公開する。

### 永続的監査メッセージ・プロセッサの有効化

1. グローバルメニュー([グローバルメニュー](../../../../images/icon-applications-menu.png))を開きます。 &rarr; _コントロールパネル_タブ、 &rarr; _システム設定_.

1. [Security]で[*Audit*]をクリックし、[*Persistent Message Audit Message Processor*]タブに進みます。

1. *有効*をチェックする。

1. ［_Save_］をクリックします。

   ![Go to the Persistent Message Audit Message Processor tab and check Enabled.](./using-nestedfields-to-audit-entry-history/images/01.png)

### オブジェクト定義の作成

1. _グローバルメニュー_ (![グローバルメニュー](../../../../images/icon-applications-menu.png))を開き、*［コントロールパネル］_タブで_［オブジェクト］*をクリックします。

1. [Create](../../creating-and-managing-objects/creating-objects.md#creating-object-drafts) オブジェクトドラフト。

   | 項目      | 値       |
   | :------ | :------ |
   | ラベル     | `Able`  |
   | 複数形のラベル | `Ables` |
   | 名前      | `Able`  |

1. このフィールドをドラフトに追加する。

   | ラベル    | 項目名    | 種類       | 必須       |
   | :----- | :----- | :------- | :------- |
   | `Name` | `name` | テキストボックス | &#10004; |

1. Detailsタブで、_Enable Entry History_を切り替える。

1. [Publish](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) オブジェクト。

公開されると、Headless API 経由でオブジェクトにアクセスできるようになります。

## サンプルコードを準備する

サンプルコードをダウンロードして解凍してください：

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-g4m3.zip -O
```

```bash
unzip liferay-g4m3.zip
```

サンプル・コードには、オブジェクト・エントリーを作成、更新、照会するためのシェル・スクリプトが含まれています。

```{tip}
サイトオブジェクトとカンパニーオブジェクト用に生成されたAPIの完全なリストについては、 [Objects Headless Framework Integration](../../understanding-object-integrations/using-custom-object-apis.md) を参照してください。 カスタムオブジェクトAPIは、LiferayAPIエクスプローラーを通して`[server]:[port]/o/api` （例：`localhost:8080/o/api`）で表示およびテストできます。 *RESTアプリケーション*をクリックし、APIを選択します。
```

## サンプルコードを使用する

1. `liferay-g4m3`プロジェクトの`curl` フォルダに移動します。

   ```bash
   cd liferay-g4m3/curl
   ```

1. `Able_POST_ToCompany`を実行して、3つの`Able` エントリを作成する。

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

1. ERC `able-one` で `Able_PATCH_ByExternalReferenceCode` を実行する。

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

1. ERC `able-one` で `Able_GET_ByExternalReferenceCode` を実行する。

   ```bash
   ./Able_GET_ByExternalReferenceCode.sh able-one
   ```

   これは `able-one` エントリと `auditEvents` 配列を返す。 `auditEvents` 配列は、エントリのイベントの履歴であり、最新のイベントから始まり、エントリの作成時に終了する。

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

   auditEvents`配列はこれらの要素を含む：

   * `auditFieldChanges`：更新されたフィールドの新旧の値。
   * `dateCreated`：イベントの日時。
   * `eventType`：イベントタイプ (`ADD`、`UPDATE`、`DELETE` など)。

1. 1Ables_GET_FromCompany` を実行する。

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

これらのGETリクエストはURLに `nestedFields=auditEvents` パラメータを含む。

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
* [`nestedFields` を使って関連するエントリーをクエリーする](./using-nestedfields-to-query-related-entries.md)
