# Clayカード

カードは視覚的にデータを表します。 画像、ドキュメントライブラリ、ユーザープロフィールなどに使用します。 カードには主に4つのタイプがあります。

* 画像カード
* ファイルカード
* ユーザーカード
* 横向きカード

これらの各種類について、以下で説明します。

## 画像カード

画像カードは、画像/ドキュメントギャラリーに使用されます。

画像カード：

```jsp
<clay:image-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    href="#1"
    imageAlt="thumbnail"
    imageSrc="https://images.unsplash.com/photo-1506976773555-b3da30a63b57"
    subtitle="Author Action"
    title="Madrid"
/>
```

![画像カードには、画像やドキュメントが表示されます。](./clay-cards/images/01.png)

アイコン付きの画像カード：

```jsp
<clay:image-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    icon="camera"
    subtitle="Author Action"
    title="<%= SVG_FILE_TITLE %>"
/>
```

![画像カードでは、画像の代わりにアイコンを表示することもできます。](./clay-cards/images/02.png)

空の画像カード：

```jsp
<clay:image-card 
  actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    subtitle="Author Action"
    title="<%= SVG_FILE_TITLE %>"
/>
```

![カードには何も表示しないこともできます。](./clay-cards/images/03.png)

カードにはファイル形式を含めることもできます。 `filetype`属性を使用してファイル形式を指定します。

```jsp
<clay:image-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    fileType="JPG"
    fileTypeStyle="danger"
    href="#1"
    imageAlt="thumbnail"
    imageSrc="https://images.unsplash.com/photo-1499310226026-b9d598980b90"
    subtitle="Author Action"
    title="California"
/>
```

![カードにはファイル形式を含めることもできます。](./clay-cards/images/04.png)

カードにラベルを追加するには、`labels`属性を含めます。

```jsp
<clay:image-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    fileType="JPG"
    fileTypeStyle="danger"
    href="#1"
    imageAlt="thumbnail"
    imageSrc="https://images.unsplash.com/photo-1503703294279-c83bdf7b4bf4"
    labels="<%= cardsDisplayContext.getLabels() %>"
    subtitle="Author Action"
    title="Beetle"
/>
```

![カードにラベルを含めることができます。](./clay-cards/images/05.png)

カードを選択可能にする（チェックボックスを含める）には、`selectable`属性を含めます。

```jsp
<clay:image-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    fileType="JPG"
    fileTypeStyle="danger"
    href="#1"
    imageAlt="thumbnail"
    imageSrc="https://images.unsplash.com/photo-1506020647804-b04ee956dc04"
    labels="<%= cardsDisplayContext.getLabels() %>"
    selectable="<%= true %>"
    selected="<%= true %>"
    subtitle="Author Action"
    title="Beetle"
/>
```

![カードを選択可能にできます。](./clay-cards/images/06.png)

## ファイルカード

ファイルカードには、ファイルの種類を示すアイコンが表示されます。 これらは、画像ファイル以外のファイル形式を表します（例： PDF、MP3、DOCなど）。

```jsp
<clay:file-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    fileType="MP3"
    fileTypeStyle="warning"
    labels="<%= cardsDisplayContext.getLabels() %>"
    labelStylesMap="<%= cardsDisplayContext.getLabelStylesMap() %>"
    selectable="<%= true %>"
    selected="<%= true %>"
    subtitle="Jimi Hendrix"
    title="<%= MP3_FILE_TITLE %>"
/>
```

![ファイルカードには、ファイル形式のアイコンが表示されます。](./clay-cards/images/07.png)

上記のように、オプションで`labelStylesMap`属性を使用して、複数のラベルの`HashMap`を渡すことができます。

次の例では、デフォルトのファイルアイコンの代わりにリスト`icon`を指定しています。

```jsp
<clay:file-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    fileType="DOC"
    fileTypeStyle="info"
    icon="list"
    labels="<%= cardsDisplayContext.getLabels() %>"
    selectable="<%= true %>"
    selected="<%= true %>"
    subtitle="Paco de Lucia"
    title="<%= DOC_FILE_TITLE %>"
/>
```

```{note}
利用可能なLiferayアイコンの完全なリストは、[Clay CSS Webサイト](https://claycss.com/docs/components/icons-lexicon.html#clay-lexicon-icons)にあります。
```

## ユーザーカード

ユーザーカードには、ユーザープロフィール画像またはユーザーの名前または名+姓のイニシャルが表示されます。

イニシャル付きのユーザーカード：

```jsp
<clay:user-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    initials="HS"
    name="User Name"
    subtitle="Latest Action"
    userColor="danger"
/>
```

![ユーザーカードは、ユーザーのイニシャルを表示できます。](./clay-cards/images/08.png)

プロフィール画像付きのユーザーカード：

```jsp
<clay:user-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    disabled="<%= true %>"
    imageAlt="thumbnail"
    imageSrc="https://images.unsplash.com/photo-1502290822284-9538ef1f1291"
    name="User name"
    selectable="<%= true %>"
    selected="<%= true %>"
    subtitle="Latest Action"
/>
```

![ユーザーカードでプロフィール画像を表示することもできます。](./clay-cards/images/09.png)

## 横向きカード

横向きカードはフォルダを表し、他のカードと同じ量の情報を持つことができます。 主な違いは、横向きカードでは、フォルダアイコンのみがあればよいので、カードの画像部分を削除できることです。

```jsp
<clay:horizontal-card
    actionItems="<%= cardsDisplayContext.getDefaultActionItems() %>"
    selectable="<%= true %>"
    selected="<%= true %>"
    title="ReallySuperInsanelyJustIncrediblyLongAndTotallyNotPossibleWordButWeAreReallyTryingToCoverAllOurBasesHereJustInCaseSomeoneIsNutsAsPerUsual"
/>
```

![横向きカードはフォルダの表示に適しています。](./clay-cards/images/10.png)

これで、UIにカードを使用してアプリに情報を表示する方法がわかりました。

## 関連トピック

* [Clay Badges](./clay-badges.md)
* [Clay Labels and Links](./clay-links-and-labels.md)
* [Clay Stickers](./clay-stickers.md)