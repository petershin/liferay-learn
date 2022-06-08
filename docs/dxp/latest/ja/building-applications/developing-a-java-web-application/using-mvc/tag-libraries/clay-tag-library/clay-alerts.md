# Clayアラート

Clayアラートには、埋め込みとストライプの2つのタイプがあります。 両方のタイプと、それぞれのいくつかの例を以下に示します。

## 埋め込みアラート

埋め込みアラートは通常、フォーム内で使用されます。 埋め込みアラートを含む要素によって、埋め込みアラートの幅が決定します。 埋め込みアラートには、クローズアクションは必要ありません。 次の埋め込みアラートは、Clay taglibを使用して作成できます。

危険アラート（埋め込み）：

```jsp
<clay:alert
    message="This is an error message."
    style="danger"
    title="Error"
/>
```

![危険アラートは、エラーまたは問題をユーザーに通知します。](./clay-alerts/images/01.png)

成功アラート（埋め込み）：

```jsp
<clay:alert
    message="This is a success message."
    style="success"
    title="Success"
/>
```

![成功アラートは、アクションが成功したときにユーザーに通知します。](./clay-alerts/images/02.png)

情報アラート（埋め込み）：

```jsp
<clay:alert
    message="This is an info message."
    title="Info"
/>
```

![情報アラートは、ユーザーに一般的な情報を表示します。](./clay-alerts/images/03.png)

注意アラート（埋め込み）：

```jsp
<clay:alert
    message="This is a warning message."
    style="warning"
    title="Warning"
/>
```

![注意アラートは、ユーザーに警告メッセージを表示します。](./clay-alerts/images/04.png)

## ストライプアラート

ストライプアラートは、最後のナビゲーション要素（ヘッダまたはナビゲーションバーのいずれか）の下に配置され、通常は*［保存］*アクションで表示され、サーバーから受信したアクションのステータスを通知します。 埋め込みアラートとは異なり、ストライプアラートにはクローズアクションが必要です。 ストライプアラートは常にコンテナの全幅であり、すべてのコンテンツをその下にプッシュします。 次のストライプアラートは、Clay taglibを使用して作成できます。

危険アラート（ストライプ）：

```jsp
<clay:stripe
    message="This is an error message."
    style="danger"
    title="Error"
/>
```

![危険ストライプアラートは、アクションが失敗したことをユーザーに通知します。](./clay-alerts/images/05.png)

成功アラート（ストライプ）：

```jsp
<clay:stripe
    message="This is a success message."
    style="success"
    title="Success"
/>
```

![成功ストライプアラートは、アクションが正常に完了したことをユーザーに通知します。](./clay-alerts/images/06.png)

情報アラート（ストライプ）：

```jsp
<clay:stripe
    message="This is an info message."
    title="Info"
/>
```

![情報ストライプアラートは、アクションに関する一般的な情報をユーザーに表示します。](./clay-alerts/images/07.png)

注意アラート（ストライプ）：

```jsp
<clay:stripe
    message="This is a warning message."
    style="warning"
    title="Warning"
/>
```

![注意ストライプアラートは、アクションに関する警告をユーザーに通知します。](./clay-alerts/images/08.png)

これで、ユーザーに警告する方法がわかりました。

## 関連トピック

* [Clay Buttons](./clay-buttons.md)
* [Clay Form Elements](./clay-form-elements.md)
* [Clay Labels and Links](./clay-links-and-labels.md)