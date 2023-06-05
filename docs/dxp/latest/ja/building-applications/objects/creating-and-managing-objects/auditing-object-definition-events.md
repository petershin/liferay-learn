# オブジェクト定義イベントの監査

{bdg-secondary}`利用可能 Liferay 7.4 U72+/GA72+`

Liferayの監査フレームワークを使用して、カスタムオブジェクト定義とそのエントリーのイベントを追跡することができます。 エントリーイベントを追跡するには、 [、オブジェクト定義に対してエントリーヒストリー](#enabling-entry-history) を有効にする必要があります。 有効になっている間は、 [Audit アプリケーション](#using-the-audit-application) または [REST API](#using-rest-apis) から、エントリーの履歴を見ることができます。

## 監査アプリケーションの使用

{bdg-primary}`サブスクリプション`

Auditアプリケーションにアクセスするには、 **グローバルメニュー**(![Global Menu](../../../images/icon-applications-menu.png)) &rarr; **コントロールパネル** &rarr; クリック **Audit** を開きます。

![［コントロールパネル］の［監査］をクリックすると、オブジェクト定義に関連するイベントが表示されます。](./auditing-object-definition-events/images/01.png)

イベントが表で表示される：

| 列         | Description                                     |
|:--------- |:----------------------------------------------- |
| ユーザーID    | 代理ユーザーのID。                                      |
| ユーザー名     | 代理ユーザーのID。                                      |
| リソースID    | 影響を受けるリソースのID。                                  |
| リソース名     | 影響を受けるリソースの名前とそのID（例：`ObjectDefinition#44168`)。 |
| リソースアクション | 実行済みのアクション（`ADD`、`UPDATE`、または`DELETE`）。         |
| クライアントIP  | アクションの役割を担うIPアドレス。                              |
| 作成日時      | イベントレコードが作成された日時。                               |

イベントフィールドをクリックすると、特定のアクションの詳細を含む、より詳細な記録が表示されます。 キーワードなどで検索し、結果を絞り込むことができます。

オブジェクトエントリーイベントは、 `ObjectDefinition#[ObjectID]` の命名パターンを使用します。

![イベントフィールドをクリックすると、詳細が表示されます。](./auditing-object-definition-events/images/02.png)

## REST APIの利用

`nestedFields` パラメーターと `auditEvents` 値を使用すると、GET API 呼び出しでエントリーの履歴を返すことができます（例: `http://localhost:8080/o/c/tickets/?nestedFields=auditEvents`）。 [`nestedFields` を使用して入力履歴を監査する。](../objects-tutorials/using-apis/using-nestedfields-to-audit-entry-history.md) を参照ください（基本チュートリアル）。

```{important}
REST APIを使用してエントリーの履歴を表示するには、そのエントリーの `View` と `Object Entry History` の両方のパーミッションが必要です。 詳しくは、 [権限設定フレームワークの統合](../understanding-object-integrations/permissions-framework-integration.md) を参照してください。
```

## エントリー履歴を有効にする

デフォルトでは、カスタムオブジェクトのエントリー履歴は無効になっています。 7.4 U72+/GA72+の場合は、いつでも設定可能です。 以前のバージョンでは、この設定は、 [オブジェクト定義を公開する前にのみ設定できます](./creating-objects.md#publishing-object-drafts) 。

エントリーヒストリーを有効にするには

1. **グローバルメニュー**（![Global Menu](../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. 目的のオブジェクト定義の編集を開始します。

1. 詳細」タブで、 「**入力履歴の有効化**」 を切り替えます。

   ![エントリー履歴を有効にします。](./auditing-object-definition-events/images/03.png)

1. ［**Save**］ をクリックします。

有効になっている間、Liferayは入力イベントの履歴を保持し、AuditアプリケーションまたはREST APIコールで見ることができます。

## 関連トピック

* [オブジェクト](../../objects.md)
* [オブジェクトの作成と管理](../creating-and-managing-objects.md)
