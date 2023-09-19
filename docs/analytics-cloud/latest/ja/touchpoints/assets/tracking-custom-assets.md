# カスタムアセットのトラッキング

```{note}
カスタムアセットを追跡するには、[event tracking](../events/tracking-events.md)の使用が推奨されます。
```

Liferay Analytics Cloudは、ブログ、ドキュメント、メディア、フォーム、ウェブコンテンツなどのLiferay DXPアセットを検出し、分析することができます。 サイトにカスタム アセットがあり、Analytics Cloud に追跡させたい場合は、HTML 属性を使用します。 Analytics Cloud の JavaScript プラグインは、これらの HTML 属性を検出し、ユーザー インタラクションを追跡し、それぞれのアセット タイプのダッシュボードにデータを表示します。

## アセットイベント

Analytics Cloud JavaScriptプラグインには、追跡できる以下のイベントが含まれています。

`AssetClicked`：ユーザーがアセット領域をクリック。 また、クリックされたタグの情報も掲載しています。

`AssetDepthReached`: アセットエリアのスクロールイベント。 また、ユーザーが到達したコンテンツの深さに関する情報（例えば、ユーザーがどれくらいブログ記事をスクロールしたか）も掲載されています。

`AssetViewed`: ユーザーがアセットを閲覧。

`AssetDownloaded`: ユーザーがアセットをダウンロードするリンクをクリック。

`AssetSubmitted`: アセットエリアでのフォーム送信。 これは、HTMLフォーム要素の下にサブミットの入力タイプを配置する必要があります。

## 必要なメタデータ

カスタムアセットのトラッキングを有効にするには、以下のHTML属性を指定する必要があります。

| name                          | type           | 説明                                                                                            |
|:----------------------------- |:-------------- |:--------------------------------------------------------------------------------------------- |
| `data-analytics-asset-action` | プレビューまたはダウンロード | Preview - プレビューイベントを送信します。 Download - ダウンロード・イベントを送信する。 これは、ドキュメントとメディア、またはカスタムアセットにのみ適用されます。 |
| `data-analytics-asset-id`     | 文字列            | 各カスタム資産に固有の識別子。 文字列にはスペースを含んではならない。                                                           |
| `data-analytics-asset-title`  | 文字列            | カスタム資産のタイトル。                                                                                  |
| `data-analytics-asset-type`   | 文字列            | アナリティクス クラウドにカスタム アセットを追跡させたいアセットのタイプ（例： `ブログ：`、 `ドキュメント：`、 `フォーム：`、 `ウェブコンテンツ：`、 `カスタム：`）。   |

```{note}
これらの属性は、Analytics Cloudにトラッキングさせたい個々のアセットに追加する必要があります。 しかし、スクリプトを使用して属性の値を入力し、各アセットに対してこのプロセスを自動化することもできます。
```

## ブログ・タイプの例

カスタムアセットをブログタイプのアセットとしてトラッキングさせたい場合は、 `data-analytics-asset-type="blog"` を他の必要なHTMLタグと一緒に使用してください：

```html
<div
  data-analytics-asset-id="myBlogId"
  data-analytics-asset-title="Blog Title"
  data-analytics-asset-type="blog"
>
  <h3>Bringing Ideas To Life: A Look Into Creative Writing</h3>

  <p>
    This blog explores the ways in which we can use creativity to bring our
    ideas to life. We will be looking at techniques for how to inspire, generate
    and develop characters and plot lines for compelling stories. We will also
    look at real-life examples and discuss practical use cases to apply
    knowledge to real writing.
  </p>
</div>
```

## ドキュメントとメディア・タイプの例

カスタムアセットをドキュメントおよびメディアタイプのアセットとしてトラッキングしたい場合は、 `data-analytics-asset-type="document"` を他の必要なHTMLタグと一緒に使用してください：

```html
<div>
  <h3>List of the documents related to Analytics Cloud</h3>

  <ul>
    <li
      data-analytics-asset-action="preview"
      data-analytics-asset-id="myDocumentA"
      data-analytics-asset-title="Document A"
      data-analytics-asset-type="document"
    >
      <a data-analytics-asset-action="download" href="/document-a.pdf">Document A</a>
    </li>
    <li
      data-analytics-asset-action="preview"
      data-analytics-asset-id="myDocumentB"
      data-analytics-asset-title="Document B"
      data-analytics-asset-type="document"
    >
      <a data-analytics-asset-action="download" href="document-b.pdf">Document B</a>
    </li>
    <li
      data-analytics-asset-action="preview"
      data-analytics-asset-id="myDocumentC"
      data-analytics-asset-title="Document C"
      data-analytics-asset-type="document"
    >
      <a data-analytics-asset-action="download" href="document-c.pdf">Document C</a>
    </li>
  </ul>
</div>
```

## フォームタイプの例

カスタムアセットをフォームタイプのアセットとして追跡させたい場合は、 `data-analytics-asset-type="form"` を他の必要なhtmlタグと一緒に使用してください：

```html
<form
  data-analytics-asset-id="myFormId"
  data-analytics-asset-title="Form Title"
  data-analytics-asset-type="form"
>
  <h3>Create new user</h3>

  <div class="content">
    <label for="name">Name</label>
    <input id="name" type="text" />
  </div>

  <div class="content">
    <label for="city">City</label>
    <input id="city" type="text" />
  </div>

  <div class="content">
    <label for="age">Age</label>
    <input id="age" type="text" />
  </div>

  <button type="submit">save</button>
</form>
```

## ウェブ・コンテンツ・タイプの例

カスタムアセットをウェブコンテンツタイプのアセットとしてトラッキングしたい場合は、 `data-analytics-asset-type="web-content"` を他の必要なHTMLタグと一緒に使用してください：

```html
<div
  data-analytics-asset-id="myWebContentId"
  data-analytics-asset-title="Web Content Title"
  data-analytics-asset-type="web-content"
>
  <h3>Bringing Ideas To Life: A Look Into Creative Writing</h3>

  <p>
    This blog explores the ways in which we can use creativity to bring our
    ideas to life. We will be looking at techniques for how to inspire, generate
    and develop characters and plotlines for compelling stories. We will also
    look at real-life examples and discuss practical use cases to apply
    knowledge to real writing.
  </p>
</div>
```

## カスタムタイプの例

上記の例では、 [アセットの分析レポートを提供しています。](assets.md) アセットのタイプに従って（例えば、ブログタイプのアセットは、ダッシュボードにブログ関連のメトリクスを表示します）。 より柔軟性が必要な場合は、カスタムタイプのアセットを使用してください。 他の必要なHTMLタグとともに、 `data-analytics-asset-type="custom"`。

例えば、カスタムPollsポートレットで投票をトラッキングしたい場合、次のようなHTMLを使用します：

```html
<div data-analytics-asset-type="custom"
  data-analytics-asset-id="favorite-food-poll"
  data-analytics-asset-title="What is your favorite food Poll">

<h1> What's your favorite food? </h1>
<form action="/submit.php">
<div>
  <input type="radio" id="sushi" name="food" value="Sushi"
     checked>
  <label for="sushi">Sushi</label>
</div>
<div>
  <input type="radio" id="pizza" name="food" value="Pizza">
  <label for="pizza">Pizza</label>
</div>
<input type="submit" value="Submit" />
</form>
</div>
```

ダウンロードを追跡するには、アクションのトリガーとなる要素に `data-analytics-asset-action="download"`のタグを付ける必要があります。

例えば、上記のアンケートは、アンケートの指示を含むPDFファイルのダウンロードリンクを備えています。

```html
<div data-analytics-asset-type="custom"
  data-analytics-asset-id="favorite-food-poll"
  data-analytics-asset-title="What is your favorite food Poll">

<a href="/poll-instructions.pdf" data-analytics-asset-action="download">Download the Poll Instructions </a>

<h1> What's your favorite food? </h1>
...
</div>
```
