# Liferayフロントエンドカード

比較したいデータがあり、画像の使用量が多い場合は、カードがコンポーネントとして役立ちます。 カードは、最小限のコンパクトな形式でデータを視覚的に表します。 画像、ドキュメントライブラリ、ユーザープロフィールなどに使用します。 カードには主に4つのタイプがあります。

* 横向きカード
* アイコンカード
* 縦向きカード
* ユーザーカード

各カードの例を以下に示します。

## 横向きカード

横向きカードは、主にファイルやフォルダなどのドキュメントを表示するために使用されます。 以下に構成例を示します。

```jsp
<liferay-frontend:horizontal-card
    text="Documents"
  url="https://portal.liferay.dev/docs/7-1/tutorials/-/knowledge_base/t/clay-icons"
>
    <liferay-frontend:horizontal-card-col>
                <liferay-frontend:horizontal-card-icon
                    icon="folder"
                />
    </liferay-frontend:horizontal-card-col>
</liferay-frontend:horizontal-card>
```

![横向きカードは、ファイルやドキュメントを表示するのに最適です。](./liferay-frontend-cards-intro/images/01.png)

`<liferay-frontend:horizontal-card-icon>`タグは、`icon`属性に[Clayアイコン](../clay-tag-library/clay-icons.md)を使用します。

## アイコン縦向きカード

アイコン縦向きカードは、その名前が示すように、アイコンを強調する縦型の形式で情報を表示するカードです。 これらのカードには、画像が関連付けられていないコンテンツが表示されます。 代わりに、コンテンツのタイプを表すアイコンが表示されます。 以下のスニペットの例は、Webコンテンツ記事の情報を示しています。

```jsp
<liferay-frontend:icon-vertical-card
  cssClass="article-preview-content"
  icon="web-content"
  title="<%= title %>"
>
  <liferay-frontend:vertical-card-sticker-bottom>
    <liferay-ui:user-portrait
      cssClass="sticker sticker-bottom"
      userId="<%= assetRenderer.getUserId() %>"
    />
  </liferay-frontend:vertical-card-sticker-bottom>

  <liferay-frontend:vertical-card-footer>
    <aui:workflow-status 
      markupView="lexicon" 
      showIcon="<%= false %>" 
      showLabel="<%= false %>" 
      status="<%= article.getStatus() %>" 
    />
  </liferay-frontend:vertical-card-footer>
</liferay-frontend:icon-vertical-card>
```

![縦向きアイコンカードは、Webコンテンツ記事などのエンティティ選択を表示するのに最適です。](./liferay-frontend-cards-intro/images/02.png)

## 縦向きカード

縦向きカードは、横向きではなく縦向きのカード形式で情報を表示します。 コンテンツに画像が関連付けられている場合（ブログのヘッダ画像など）、縦向きのカードを使用して画像を表示できます。 関連する画像がない場合は、代わりにアイコン縦向きカードを使用してコンテンツのタイプを表すことができます（PDFファイルなど）。 次の例は、画像プレビューが利用可能な場合のWebコンテンツ記事の縦向きカードを表示しています。

```jsp
<liferay-frontend:vertical-card
  cssClass="article-preview-content"
  imageUrl="<%= articleImageURL %>"
  title="<%= title %>"
>
  <liferay-frontend:vertical-card-sticker-bottom>
    <liferay-ui:user-portrait
      cssClass="sticker sticker-bottom"
      userId="<%= assetRenderer.getUserId() %>"
    />
  </liferay-frontend:vertical-card-sticker-bottom>

  <liferay-frontend:vertical-card-footer>
    <aui:workflow-status 
      markupView="lexicon" 
      showIcon="<%= false %>" 
      showLabel="<%= false %>" 
      status="<%= article.getStatus() %>" 
    />
  </liferay-frontend:vertical-card-footer>
</liferay-frontend:vertical-card>
```

![縦向きカードは、ファイルやドキュメントを表示するのに最適です。](./liferay-frontend-cards-intro/images/03.png)

## HTML縦向きカード

HTML縦向きカードを使用すると、縦向きカードのヘッダにカスタムHTMLを表示できます。 以下の例では、動画を埋め込みます。

```
<liferay-util:buffer var = "customThumbnailHtml">
    <div class="embed-responsive embed-responsive-16by9">
      <iframe class="embed-responsive-item" 
    src="https://www.youtube.com/embed/8Bg9jPJpGOM?rel=0" 
    allowfullscreen></iframe>
    </div>
</liferay-util:buffer>

<div class="container">
  <div class="row">
    <div class="col-md-4">
      <liferay-frontend:html-vertical-card
        html="<%= customThumbnailHtml %>"
        title="My Video"
      >
      </liferay-frontend:html-vertical-card>
    </div>
  </div>
</div>
```

![HTML縦向きカードを使用すると、カードのヘッダにカスタムHTMLを表示できます。](./liferay-frontend-cards-intro/images/04.png)

## ユーザー縦向きカード

ユーザー縦向きカードは、管理バーのアイコンビューにユーザープロフィールの選択を表示します。 以下は、ユーザー管理ポートレットのスニペットの例です。

```jsp
<liferay-frontend:user-vertical-card
  actionJsp="/membership_request_action.jsp"
  actionJspServletContext="<%= application %>"
  resultRow="<%= row %>"
  subtitle="<%= membershipRequestUser.getEmailAddress() %>"
  title="<%= HtmlUtil.escape(membershipRequestUser.getFullName()) %>"
  userId="<%= membershipRequest.getUserId() %>"
>
  <liferay-frontend:vertical-card-header>
    <liferay-ui:message 
      arguments="<%= LanguageUtil.getTimeDescription(
      request, 
      System.currentTimeMillis() - membershipRequest.getCreateDate().getTime(), 
      true) %>" 
      key="x-ago" 
      translateArguments="<%= false %>" 
    />
  </liferay-frontend:vertical-card-header>
</liferay-frontend:user-vertical-card>
```

![ユーザー縦向きカードは、ファイルやドキュメントを表示するのに最適です。](./liferay-frontend-cards-intro/images/05.png)

## 関連トピック

* [Liferay Front-end Add Menu](./liferay-frontend-add-menu.md)
* [Liferay Front-end Info Bar](./liferay-frontend-info-bar.md)
* [Liferay Front-end Management Bar](./liferay-frontend-management-bar.md)