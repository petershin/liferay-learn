# ウィジェットテンプレートの作成

ウィジェットテンプレートは、 [FreeMarker](https://freemarker.apache.org/) を使用して、ウィジェットがサイトページでどのようにレンダリングされるかを決定します。 各テンプレートは、特定のウィジェットタイプ用に設計されており、ページ内のウィジェットを設定する際に選択できます。

```{note}
Liferay DXP/Portal 7.4+では、ウィジェットテンプレートはFreeMarkerにのみ対応しています。 Velocityへのサポートは終了しました。
```

以下の手順でウィジェットテンプレートを作成します。

1. ウィジェットテンプレートを作成する目的のサイトに移動します。

1. サイトメニュー( ![サイトメニュー](../../../../../../images/icon-product-menu.png))を開き、 **Design** &rarr; **Templates** &rarr; **Widget Templates** に移動します。

   ```{note}
   グローバルサイトでは、ウィジェットテンプレートのサンプルを見ることができます。 これらのサンプルテンプレートは、すでにアプリに設定されているデフォルトのテンプレートとは異なります。
   ```

1. **Add**( ![Add Button](../../../../../images/icon-add.png) ) をクリックし、作成するテンプレートのタイプを選択します。

   ![Click on Design and Widget templates.](./creating-a-widget-template/images/01.png)

1. テンプレートの名前を入力します。

1. エディターでテンプレートをデザインします。

**Elements** サイドパネル( ![Elements](../../../../../images/icon-list-ul.png) )では、利用可能なウィジェット・フィールド、変数、ユーティリティから選択することができます。 すべてのウィジェットに共通する要素もあれば、選択したウィジェットタイプに特化した要素もあります。

   ![Design the template using field elements.](./creating-a-widget-template/images/02.png)

1. (オプション) 詳細サイドパネル(![詳細](../../../../../../images/icon-cog3.png))で、テンプレートの **description** を入力し、 **image** を選択します。

1. 保存」をクリックする。

## テンプレートエディター

テンプレートエディターの右側には、テンプレートの作成によく使われる変数がパレットで表示されています。 テンプレートを作成する際の参考にしてください。 テンプレートエディターに変数を配置するには、配置したい場所にテキストカーソルを置き、変数名をクリックします。

また、各変数には、詳細な説明を表示するツールチップがあります。 ウィジェットテンプレートには複数の種類があるため、ウィジェットテンプレートごとに異なる変数も存在します。 したがって、各テンプレートには、その特定のテンプレートにのみ適用可能な異なる変数のセットがあります。

![Liferay offers a versatile script editor to customize your widget template.](./creating-a-widget-template/images/03.png)

また、オートコンプリート機能を使って、テンプレートに変数を追加することもできます。 これを呼び出すには、`${` とタイプすると、利用可能な変数のドロップダウンメニューが開きます。 変数の一つをクリックすると、エディターにその変数が挿入されます。

また、同じ種類のテンプレートを他のテンプレートに埋め込むことも可能です。 例えば、既存のWikiウィジェットテンプレートがあり、別のWikiウィジェットテンプレートをもう1つ作成したいとします。 ゼロから始めるのではなく、既存のWikiウィジェットテンプレートを新しいものにインポートして、それを元に構築することができます。 つまり、システム内のVelocityやFreeMarkerのテンプレートで取り込んだコードを再利用するための汎用テンプレートとしてウィジェットテンプレートを使用できます。

## テンプレートエディターでヘッドレスAPIを呼び出す

Liferay の [Headless](../../../../../headless-delivery/using-liferay-as-a-headless-platform.md) API サービスをテンプレートエディタで直接呼び出すことができます。 APIエンドポイントの相対URLで`restClient`オブジェクトを使用して、テンプレートにヘッドレスリソースを注入する。

!!! note
`restClient` オブジェクトを使って GET エンドポイントだけを呼び出すことができます。

例えば、`restClient` を使ってサイトのブログ記事を取得し、以下の FreeMarker スクリプトでその見出しを出力することができます：

```ftl
<#assign 
	blogPostings = restClient.get("/headless-delivery/v1.0/sites/{siteId}/blog-postings").items
/>

<#list blogPostings as blogPosting>
	<h1>${blogPosting.headline}</h1>
</#list>
```

標準的なcURLリクエストと同じように、APIレスポンスをフィルタリング、ソート、検索、ページ分割することができます。 以下に例を示します。

```ftl
<#assign 
	blogPostings = restClient.get("/headless-delivery/v1.0/sites/{siteId}/blog-postingssort=dateCreated:asc&filter=creatorId+eq+20126").items
/>

<#list blogPostings as blogPosting>
	<h1>${blogPosting.headline}</h1>
</#list>
```

APIのフィルタリングの詳細については、 [APIクエリパラメータ](../../../../../headless-delivery/consuming-apis/api-query-parameters.md) を参照のこと。

[API Explorer](../../../../../headless-delivery/consuming-apis/consuming-rest-services.md) を使用して、ヘッドレスリソースの API エンドポイントとスキーマを検索します。

## ウィジェットテンプレートの設定

ウィジェットテンプレートを保存した後、アクションボタン(![アクションボタン](../../../../../images/icon-actions.png))から管理できます。 これにはいくつかのオプションがあります。

- **Edit** : ウィジェット・テンプレートのセットアップ・プロパティを修正する。
- **パーミッション** : ウィジェットテンプレートのパーミッション **Update** , **Permissions** , **Delete** , **View** を管理します。
- **Copy** : ウィジェット・テンプレートのコピーを作成します。
- **Delete** : ウィジェットテンプレートを削除します。

さらに、ウィジェットテンプレートは、静的URLとWebDAV URLを生成します。 これらの値は、テンプレートのXMLソースにアクセスします。 これらのURLは、メニューからウィジェット・テンプレートをクリックし、 **Details** セクションを展開することで見つけることができます。 WebDAV URLにより、サイト管理者はリモートサーバー上のウィジェットテンプレートを追加、参照、編集、削除することができます。 WebDAV URL でできることの詳細については、 [WebDAV アクセス](../../../../../content-authoring-and-management/documents-and-media/publishing-and-sharing/accessing-documents-with-webdav.md) を参照してください。

```{note}
ウィジェットテンプレートにウィジェットを埋め込むことは可能ですが、他のウィジェットとの競合や予期せぬ動作（例：パンくずリストへのデータ集計ウィジェットの埋め込み）を引き起こす可能性があるため、推奨されません。 ウィジェットテンプレートにウィジェットを埋め込むしかない場合、他のウィジェットと干渉しないことを確認してください。
```

次に、新しいウィジェットテンプレートを使用するようにウィジェットを設定します。

1. 修正したいウィジェットの **コンフィギュレーション** ページを開き、 **表示設定** を開いてください。

1. **Display Template** の下で、ドロップダウンメニューからウィジェット・テンプレートを選択します。

また、アプリのサイト固有の表示テンプレートを管理することもできます。この場合は、 **Display Template** ドロップダウンメニューの隣にある **Manage Display Templates for [SPECIFIC** SITE]_リンクをクリックします。 設定されたテンプレートのリストが表示され、新しいテンプレートを追加したり、既存のテンプレートを編集したりすることができます。

![Click the Configuration menu of an app to edit and manage available widget templates.](./creating-a-widget-template/images/04.png)

## 関連トピック

- [ウィジェットテンプレート例](./using-a-widget-template-example.md)
